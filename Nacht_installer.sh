#!/bin/sh
# Nacht Skin installer...
# wget -qO- https://raw.githubusercontent.com/digiteng/Nacht-skin-for-openAtv/main/Nacht_installer.sh | bash

read -p "Are you sure? (y/n) : " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "ok"
fi

