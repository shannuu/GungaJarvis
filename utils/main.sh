#! /data/data/com.termux/files/usr/bin/bash
clear

echo -e '\e[31;1m                    __  __  ____  _  _  __  __ '
echo -e '\e[31;1m                   (  \/  )( ___)( \( )(  )(  )'
echo -e '\e[31;1m                    )    (  )__)  )  (  )(__)( '
echo -e '\e[31;1m                   (_/\/\_)(____)(_)\_)(______)'
echo -e '\n'
echo -e '\n'
echo -e '\e[31m        |\e[0m-----------------------------------------------\e[31m|'
echo -e '\e[31m        |                                               |'
echo -e '\e[31m        |               [\e[32m1\e[31m] Open\e[0m websites\e[31m               |'
echo -e '\e[31m        |               [\e[32m2\e[31m] weather                     |'
echo -e '\e[31m        |               [\e[32m3\e[31m] send\e[0m gmail\e[31m                  |'
echo -e '\e[31m        |               [\e[32m4\e[31m] encrypt \e[0m& \e[31mdecrypt           | '
echo -e '\e[31m        |               [\e[32m5\e[31m] ddos \e[0mattack                 \e[31m|'
echo -e '\e[31m        |               [\e[32m6\e[31m] phishing\e[0m attack             \e[31m|'
echo -e '\e[31m        |                                               |'
echo -e '\e[31m        |               [\e[32m99\e[31m] exit                       |'
echo -e '\e[31m        |                                               |'
echo -e '\e[31m        |\e[0m-----------------------------------------------\e[31m|'
read -p $'      \n\n\e[31m[\e[0m\e[32m*\e[0m\e[31m] Choose an option\e[0m: ' option
case $option in
1)
clear
cd $HOME/GungaJarvis/utils/open
bash open.sh
;;
2)
clear
cd $HOME/GungaJarvis/utils/weather
bash weather.sh
;;
3)
cd $HOME/GungaJarvis/utils/smtp
python3 send_mail.py
echo -e '\n\e[31;1mMail sent'
sleep 3.0
cd $HOME/GungaJarvis/utils/
bash main.sh
;;
4)
clear
bash $HOME/GungaJarvis/utils/script/script.sh
;;
5)
clear
python2 $HOME/GungaJarvis/utils/ddos/ddos.py
;;
6)
clear
bash $HOME/GungaJarvis/utils/phishing/phishing.sh
;;
99)
cd $HOME
clear
echo THANKS FOR USING GUNGAJARVIS.......... | lolcat
sleep 3.0
echo see you again | lolcat
sleep 3.0
clear
cd $HOME
exit 0
;;
*)
echo -e '\e[31;1mEnter proper number\e[0m'
sleep 2.0
cd $HOME/GungaJarvis/utils
bash main.sh
esac
