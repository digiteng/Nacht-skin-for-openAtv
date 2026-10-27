#!/bin/sh
# Nacht Skin installer...
# wget -qO- https://raw.githubusercontent.com/digiteng/Nacht-skin-for-openAtv/main/Nacht_installer.sh | bash

GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

clear

echo -e "${CYAN}"
echo " _   _    _    ____ _   _ _____" 
echo "| \ | |  / \  / ___| | | |_   _|"
echo "|  \| | / _ \| |   | |_| | | |  "
echo "| |\  |/ ___ \ |___|  _  | | |  "
echo "|_| \_/_/   \_\____|_| |_| |_|  "
echo -e "${NC} by digiteng"
echo -e "${CYAN}===============================================${NC}"
echo -e "${CYAN}    Starting Nacht Skin Installation...      ${NC}"
echo -e "${CYAN}===============================================${NC}"
echo ""

echo -e "${YELLOW}[*] Checking the latest version information...${NC}"
API_URL="https://api.github.com/repos/digiteng/Nacht-skin-for-openAtv/releases/latest"
DOWNLOAD_URL=$(wget -qO- $API_URL | grep "browser_download_url" | head -n 1 | cut -d '"' -f 4)

if [ -z "$DOWNLOAD_URL" ]; then
    echo -e "${RED}[ERR] Could not get download link from GitHub API!${NC}"
    exit 1
fi

echo -e "${YELLOW}[*] Old skin remnants are cleared...${NC}"
rm -rf /usr/lib/enigma2/python/Components/Converter/Nacht*
rm -rf /usr/lib/enigma2/python/Components/Renderer/Nacht*
rm -rf /usr/lib/enigma2/python/Tools/Nacht*
rm -rf /usr/share/enigma2/Nacht

echo -e "${YELLOW}[*] Downloading the current skin pack...${NC}"
wget -q --show-progress -O /tmp/Nacht_skin.tar.gz "$DOWNLOAD_URL"

if [ $? -ne 0 ]; then
    echo -e "${RED}[ERR] An error occurred while downloading the file!${NC}"
    exit 1
fi

echo -e "${YELLOW}[*] Files are installed to the system...${NC}"
tar -xzf /tmp/Nacht_skin.tar.gz -C /

if [ $? -eq 0 ]; then
    echo -e "${GREEN}[OK] Nacht Skin successfully installed!${NC}"
else
    echo -e "${RED}[ERR] An error occurred while opening the archive!${NC}"
    rm -f /tmp/Nacht_skin.tar.gz
    exit 1
fi

rm -f /tmp/Nacht_skin.tar.gz

echo -e "${CYAN}-----------------------------------------------${NC}"
echo -e "${YELLOW}[?] Restart Enigma2 for changes to apply? (y/n)${NC}"
read -r response
if [ "$response" = "y" ] || [ "$response" = "Y" ]; then
    echo -e "${GREEN}[*] Enigma2 (GUI) restarting...${NC}"
    init 4 && sleep 2 && init 3
else
    echo -e "${YELLOW}[*] Installation completed. Please restart your device manually.${NC}"
fi

echo -e "${CYAN}===============================================${NC}"
