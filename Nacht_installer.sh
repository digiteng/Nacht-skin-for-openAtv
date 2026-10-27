#!/bin/sh

SKIN_URL="https://github.com/KULLANICI/REPO/releases/download/v1.0/skin_1.0_all.ipk"

read -p "Skin yüklensin mi? [y/n]: " yn
case $yn in
    [Yy]* )
        echo "İndiriliyor..."
        # wget -O /tmp/skin.ipk "$SKIN_URL"
        if [ $? -eq 0 ]; then
            echo "Yükleniyor..."
            # opkg install --force-overwrite /tmp/skin.ipk
            echo "Tamamlandı. Arayüzü restart edin."
        else
            echo "İndirme hatası!"
            exit 1
        fi
        # rm -f /tmp/skin.ipk
        ;;
    [Nn]* )
        echo "İptal edildi."
        ;;
    * )
        echo "Geçersiz cevap. İptal."
        exit 1
        ;;
esac   