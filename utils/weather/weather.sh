#! /data/data/com.termux/files/usr/bin/bash

wget -q --spider https://google.com
if [ $? = 0 ]
then
echo -e '\e[31m(\e[0mIf one word eg- Hyderabad, Chennai\e[31m)'
echo -e '(\e[0mIf two words eg- Navi_mumbai, New_york\e[31m)'
read -p $'[\e[32m*\e[31m] Enter the name of the city\e[0m: ' city
curl http://wttr.in/$city
read -p $'\e[31mPress \e[0m99\e[31m to go back\e[0m: ' option
	if [ $option -eq 99 ]
	then
	cd $HOME/GungaJarvis
	bash GungaJarvis
	else
	echo ''
	fi
else
echo -e '\e[31;1mYou are not connect to internet, if you want to see the weather you have to turn on the internet'
fi
