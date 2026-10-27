#!/bin/bash

# prompting for choice
read -p "Do you want to install bc calculator. (y)Yes/(n)No/(c)Cancel:- " choice

# giving choices there tasks using
case $choice in
[yY]* ) echo "Making dummy install" ;;
[nN]* ) echo "Thanks for using the script" ;;
[cC]* ) echo "Installation cancelled" ;;
*) exit ;;
esac