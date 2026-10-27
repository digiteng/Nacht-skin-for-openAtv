#!/bin/sh
read -p "Continue? [Y/n]: " yn
if [[ $yn =~ ^[Yy]$ ]] || [[ -z $yn ]]; then
    echo "Proceeding..."
else
    echo "Exiting..."
fi   