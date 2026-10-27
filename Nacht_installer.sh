#!/bin/sh
read -p "Proceed? [y/n]: " yn
case $yn in
    [Yy]* ) echo "Confirmed";;
    [Nn]* ) echo "Cancelled";;
    * ) echo "Please answer y or n.";;
esac   