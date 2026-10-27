#!/bin/sh
# echo "bbbbbbbbbbb"
read -p "Are you sure? (y/n) : " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "ok"
fi

