repnamer(){
cd
list=$(ls)
count=$(echo $list | wc -w)
rcount=$(( $count + 1 ))
var=1
until [[ $var == $rcount ]]; do
rep=$(echo $list | cut -d " " -f $var)
frep=$(echo $rep | tr '[:lower:]' '[:upper:]')
if [[ $frep == "GUNGAJARVIS" ]]; then
break
exit
fi
((var++))
done
rm -rf $rep > /dev/null 2>&1
pkg install git -y > /dev/null 2>&1
cd
git clone https://github.com/Shannuu/GungaJarvis > /dev/null 2>&1
echo "Done"
}



versionchecker(){
cversion="0.0.0.1"
cd ..
git clone https://github.com/shannuu/gungajarvis/version
version=$(cat version)
if [[ $version == $cversion ]];then
echo
read -p $"Your repo is already the latest version, Do you still want to update [y/n]:- " option
if [[ $option == "y" ]] || [[ $option == "Y" ]]; then
repnamer
fi
else
repnamer
fi
rm version
}

versionchecker
