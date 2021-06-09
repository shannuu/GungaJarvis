#! /data/data/com.termux/files/usr/bin/bash

read -p $'\e[31m[\e[32m*\e[31m] Enter the name of the file to be decrypted\e[0m: ' filename
cd $HOME
if [ -f $filename ]
then
read -p $'\e[31m[\e[32m*\e[31m] Enter the new name of this decrypted file\e[0m: ' newfilename
scrypt dec -v $filename $newfilename 2>&1 > /dev/null
rm $HOME/$filename
clear
bash $HOME/GungaJarvis/utils/script/script.sh
else
echo -e '\e[31;1mFile not found, Enter properly'
fi
