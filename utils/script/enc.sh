#! /data/data/com.termux/files/usr/bin/bash


read -p $'\e[31m[\e[32m*\e[31m] Enter the file name to be encrypted\e[0m: ' filename
cd $HOME
if [ -f $filename ]
then
read -p $'\e[31m[\e[32m*\e[31m] Enter the new name of this encrypted file\e[0m: ' newfilename
scrypt enc -v $filename $newfilename 1>/dev/null
rm $HOME/$filename
clear
bash $HOME/GungaJarvis/utils/script/script.sh
else
echo -e '\e[31;1mNo such file, Please enter the name carefully'
fi
