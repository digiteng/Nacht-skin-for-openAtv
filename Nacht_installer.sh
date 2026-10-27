#!/bin/sh
# echo "bbbbbbbbbbb"
read -p "Are you sure? (y/n) : " -n 1 -r
echo -e "eeeeeeee"
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "ok"
fi

