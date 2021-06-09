#! /data/data/com.termux/files/usr/bin/bash

echo -e ' '
echo -e '\e[31m        |\e[0m-----------------------------------------------\e[31m|'
echo -e '\e[31m        |                                               |'
echo -e '\e[31m        |                 [\e[32m1\e[31m] Youtube\e[31m                   |'
echo -e '\e[31m        |                 [\e[32m2\e[31m] Google\e[31m                    |'
echo -e '\e[31m        |                 [\e[32m3\e[31m] Facebook\e[31m                  |'
echo -e '\e[31m        |                 [\e[32m4\e[31m] Instagram\e[31m                 |'
echo -e '\e[31m        |                 [\e[32m5\e[31m] Twitter\e[31m                   |'
echo -e '\e[31m        |                 [\e[32m10\e[31m] Custom URL\e[31m               |'
echo -e '\e[31m        |                 [\e[32m99\e[31m] back\e[31m                     |'
echo -e '\e[31m        |                                               |'
echo -e '\e[31m        |\e[0m-----------------------------------------------\e[31m|'
read -p $'\n\e[31m[\e[32m*\e[31m] Choose an option\e[0m: ' option
case $option in
1)
mpv $HOME/GungaJarvis/utils/open/open-youtube.mp3 2>&1 > /dev/null
sleep 1.0
am start -a android.intent.action.VIEW -d https://youtube.com 1>/dev/null
clear
t;;
2)
mpv $HOME/GungaJarvis/utils/open/open-google.mp3 2>&1 > /dev/null
sleep 1.0
am start -a android.intent.action.VIEW -d https://google.com 1>/dev/null
clear
;;
3)
mpv $HOME/GungaJarvis/utils/open/open-facebook.mp3 2>&1 > /dev/null
sleep 1.0
am start -a android.intent.action.VIEW -d https://facebook.com 1>/dev/null
clear
;;
4)
mpv $HOME/GungaJarvis/utils/open/open-instagram.mp3 2>&1 > /dev/null
sleep 1.0
am start -a android.intent.action.VIEW -d https://instagram.com 1>/dev/null
clear
;;
5)
mpv $HOME/GungaJarvis/utils/open/open-twitter.mp3 2>&1 > /dev/null
sleep 1.0
am start -a android.intent.action.VIEW -d https://twitter.com 1>/dev/null
clear
;;
10)
read -p $'\e[31mEnter the url (\e[0mwithout https://\e[31m)\e[0m: ' url
am start -a android.intent.action.VIEW -d https://$url 1>/dev/null
clear
;;
99)
bash  $HOME/GungaJarvis/utils/main.sh
;;
*)
echo -e '\e[31;1mEnter a proper number\e[0m'
sleep 2.0
esac
clear
bash $HOME/GungaJarvis/utils/open/open.sh
