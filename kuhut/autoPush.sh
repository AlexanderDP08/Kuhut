#!/bin/bash

while [ 5 -gt 4 ]
do
echo "Menu : "
echo -e "1) add to git"
echo -n "Inputan : "
read userinput
if [ $userinput -eq 1 ]
then
flutter clean
flutter pub get
git add *
echo -n "Masukkan nama commit : "
read name
git commit -m $name
git push origin main
clear
fi
done