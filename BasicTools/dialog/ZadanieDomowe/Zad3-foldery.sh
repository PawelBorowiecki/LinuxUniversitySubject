#!/bin/bash

option=$(dialog --backtitle "Zarzadzanie folderami" --radiolist "Wybierz co chcesz zrobic z folderami" 15 40 4 \
	1 "Utworzyc folder/y" on \
	2 "Usunac folder" off \
	3 "Skopiowac folder" off \
	4 "Przeniesc folder" off \
	2>&1 >/dev/tty)

if [ $option -eq 1 ]; then
        folderName=$(dialog --inputbox "Podaj nazwe folderu/ow" 8 40 2>&1 >/dev/tty | tr -d "\r\n")
        mkdir -p $folderName
elif [ $option -eq 2 ]; then
        folderName=$(dialog --inputbox "Podaj nazwe folderu" 8 40 2>&1 >/dev/tty | tr -d "\r\n")
        rm -r $folderName
elif [ $option -eq 3 ]; then
        folderName=$(dialog --inputbox "Podaj nazwe folderu do skopiowania" 8 40 2>&1 >/dev/tty | tr -d "\r\n")
        destination=$(dialog --inputbox "Podaj bezwgledna sciezke docelowa" 8 40 2>&1 >/dev/tty | tr -d "\r\n")
        cp -r $folderName $destination
elif [ $option -eq 4 ]; then
        folderName=$(dialog --inputbox "Podaj nazwe folderu do skopiowania" 8 40 2>&1 >/dev/tty | tr -d "\r\n")
        destination=$(dialog --inputbox "Podaj bezwzgleda sciezke docelowa" 8 40 2>&1 >/dev/tty | tr -d "\r\n")
        mv $folderName $destination
else
        dialog --title "Zla opcja" --msgbox "Wybrales zla opcje." 5 30
fi

