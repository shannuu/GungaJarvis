#! /data/data/com.termux/files/usr/etc/bin/bash

echo -e '\e[31m        |\e[0m-----------------------------------------------\e[31m|'
echo -e '\e[31m        |                                               |'
echo -e '\e[31m        |               [\e[32m1\e[31m] encrypt                     |'
echo -e '\e[31m        |               [\e[32m2\e[31m] decrypt                     |'
echo -e '\e[31m        |                                               |'
echo -e '\e[31m        |               [\e[32m99\e[31m] back                       |'
echo -e '\e[31m        |                                               |'
echo -e '\e[31m        |\e[0m-----------------------------------------------\e[31m|'

read -p $'\n[\e[32m*\e[31m] Enter an option\e[0m: ' option
case $option in
1)
bash $HOME/GungaJarvis/utils/script/enc.sh
;;
2)
bash $HOME/GungaJarvis/utils/script/dec.sh
;;
99)
clear
bash $HOME/GungaJarvis/utils/main.sh
;;
*)
echo -e '\e[31;1mEnter a proper number'
bash $HOME/GungaJarvis/utils/script/script.sh
;;
esac
