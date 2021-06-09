#! /data/data/com.termux/files/usr/bin/bash

clear
banner() {
echo -e '\e[31m        |\e[0m-----------------------------------------------\e[31m|'
echo -e '\e[31m        |                                               |'
echo -e '\e[31m        |               [\e[32m1\e[31m] facebook                    \e[31m|'
echo -e '\e[31m        |                                               |'
echo -e '\e[31m        |               [\e[32m99\e[31m] back                       \e[31m|'
echo -e '\e[31m        |                                               |'
echo -e '\e[31m        |\e[0m-----------------------------------------------\e[31m|'
echo -e ''
read -p $'\e[31m[\e[32m*\e[31m] Choose an option\e[0m: ' option
}
banner

case $option in
1)
bash $HOME/GungaJarvis/utils/phishing/websites/facebook/facebook.sh
;;
99)
bash $HOME/GungaJarvis/utils/main.sh
;;
*)
clear
echo 'Invalid...'
sleep 5
clear
banner
;;
esac
