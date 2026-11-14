#!/bin/bash

echo -e "Wybierz odpowiednia opcje:\n1: utworzenie folderu/ow\n2: usuniecie folderu\n3: skopiowanie folderu\n4: przeniesienie folderu"
read option
if [ $option -eq 1 ]; then
        read -p "Podaj nazwe folderu: " folderName
        mkdir -p $folderName
elif [ $option -eq 2 ]; then
        read -p "Podaj nazwe folderu: " folderName
        rm -r $folderName
elif [ $option -eq 3 ]; then
        read -p "Podaj nazwe folderu do skopiowania oraz sciezke docelowa: " folderName destination
        cp -r $folderName $destination
elif [ $option -eq 4 ]; then
        read -p "Podaj nazwe folderu do przeniesienia oraz sciezke docelowa: " folderName destination
        mv $folderName $destination
else
        echo "Wybrales zla opcje"
fi
