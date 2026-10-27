#!/bin/sh
echo "-------------------------------------------------------------------"
read -p "Skin yüklensin mi? [y/n]: " yn
case $yn in 
	[Yy]* )
		echo "İndiriliyor..."
		;;
	* )
		echo "İşlem iptal edildi."
		;;
esac
