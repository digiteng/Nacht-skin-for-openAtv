#!/bin/sh
# Nacht Skin installer...
# wget -qO- https://raw.githubusercontent.com/digiteng/Nacht-skin-for-openAtv/main/Nacht_installer.sh | bash

GREEN='\033[0;32m'
BLUE='\033[1;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'
clear
read -p "Are you sure? (y/n) : "

if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "ok"
fi


