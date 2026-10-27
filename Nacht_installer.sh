#!/bin/sh
# read -p "Continue? [Y/n]: " yn
# if [[ $yn =~ ^[Yy]$ ]] || [[ -z $yn ]]; then
	# echo "Proceeding..."
# else
	# echo "Exiting..."
# fi   



echo -n "Continue? [Y/N]: "
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then
	echo -n "continuing.."
else
	echo -n "exiting.."
fi
