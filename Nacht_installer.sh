#!/bin/sh
# Nacht Skin Otomatik Kurulum Scripti
# wget -qO- https://raw.githubusercontent.com/digiteng/Nacht-skin-for-openAtv/main/Nacht_installer.sh | bash

# Renk tanımlamaları
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # Renksiz

clear
# Başlangıç Logosu (ASCII Art)
echo -e "${CYAN}"
echo " _   _    _    ____ _   _ _____" 
echo "| \ | |  / \  / ___| | | |_   _|"
echo "|  \| | / _ \| |   | |_| | | |  "
echo "| |\  |/ ___ \ |___|  _  | | |  "
echo "|_| \_/_/   \_\____|_| |_| |_|  "
echo -e "${NC}by digiteng"
echo -e "${CYAN}===============================================${NC}"
echo -e "${CYAN}    Nacht Skin Kurulumu Başlatılıyor...       ${NC}"
echo -e "${CYAN}===============================================${NC}"
echo ""

# 1. GitHub API üzerinden en son sürümün browser_download_url bilgisini çekme
echo -e "${YELLOW}[*] En son sürüm bilgileri kontrol ediliyor...${NC}"
API_URL="https://api.github.com/repos/digiteng/Nacht-skin-for-openAtv/releases/latest"
DOWNLOAD_URL=$(wget -qO- $API_URL | grep "browser_download_url" | head -n 1 | cut -d '"' -f 4)

if [ -z "$DOWNLOAD_URL" ]; then
    echo -e "${RED}[ERR] GitHub API'sinden indirme bağlantısı alınamadı!${NC}"
    exit 1
fi

# 2. Eski skin dosyalarını temizleme
echo -e "${YELLOW}[*] Eski skin kalıntıları temizleniyor...${NC}"
rm -rf /usr/lib/enigma2/python/Components/Converter/Nacht*
rm -rf /usr/lib/enigma2/python/Components/Renderer/Nacht*
rm -rf /usr/lib/enigma2/python/Tools/Nacht*
rm -rf /usr/share/enigma2/Nacht

# 3. Güncel arşivi /tmp dizinine indirme
echo -e "${YELLOW}[*] Güncel skin paketi indiriliyor...${NC}"
wget -q --show-progress -O /tmp/Nacht_skin.tar.gz "$DOWNLOAD_URL"

if [ $? -ne 0 ]; then
    echo -e "${RED}[ERR] Dosya indirilirken bir hata oluştu!${NC}"
    exit 1
fi

# 4. Arşivi kök dizine ( / ) açma
echo -e "${YELLOW}[*] Dosyalar sisteme yükleniyor...${NC}"
tar -xzf /tmp/Nacht_skin.tar.gz -C /

if [ $? -eq 0 ]; then
    echo -e "${GREEN}[OK] Nacht Skin başarıyla yüklendi!${NC}"
else
    echo -e "${RED}[ERR] Arşiv açılırken bir hata oluştu!${NC}"
    rm -f /tmp/Nacht_skin.tar.gz
    exit 1
fi

# 5. Geçici yükleme dosyasını temizleme
rm -f /tmp/Nacht_skin.tar.gz

# 6. Enigma2 GUI Yeniden Başlatma
echo -e "${CYAN}-----------------------------------------------${NC}"
echo -e "${YELLOW}[?] Değişikliklerin uygulanması için Enigma2 yeniden başlatılsın mı? (y/n)${NC}"
read -r response
if [ "$response" = "y" ] || [ "$response" = "Y" ]; then
    echo -e "${GREEN}[*] Enigma2 (GUI) yeniden başlatılıyor...${NC}"
    init 4 && sleep 2 && init 3
else
    echo -e "${YELLOW}[*] Yükleme tamamlandı. Lütfen cihazınızı manuel olarak yeniden başlatın.${NC}"
fi

echo -e "${CYAN}===============================================${NC}"
