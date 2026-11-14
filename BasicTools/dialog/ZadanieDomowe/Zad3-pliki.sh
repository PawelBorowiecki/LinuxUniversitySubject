#!/bin/bash

option=$(dialog --backtitle "Zarzadzanie plikami" --radiolist "Wybierz co chcesz zrobic z plikami" 15 40 4 \
	1 "Utworzyc plik" on \
	2 "Usunac plik" off \
	3 "Skopiowac plik" off \
	4 "Przeniesc plik" off \
	2>&1 >/dev/tty)

if [ $option -eq 1 ]; then
        fileName=$(dialog --inputbox "Podaj nazwe pliku" 8 40 2>&1 >/dev/tty | tr -d "\r\n")
        touch $fileName
elif [ $option -eq 2 ]; then
        fileName=$(dialog --inputbox "Podaj nazwe pliku" 8 40 2>&1 >/dev/tty | tr -d "\r\n")
        rm $fileName
elif [ $option -eq 3 ]; then
        fileName=$(dialog --inputbox "Podaj nazwe pliku do skopiowania" 8 40 2>&1 >/dev/tty | tr -d "\r\n")
	destination=$(dialog --inputbox "Podaj sciezke docelowa" 8 40 2>&1 >/dev/tty | tr -d "\r\n")
        cp $fileName $destination
elif [ $option -eq 4 ]; then
        fileName=$(dialog --inputbox "Podaj nazwe pliku do skopiowania" 8 40 2>&1 >/dev/tty | tr -d "\r\n")
        destination=$(dialog --inputbox "Podaj sciezke docelowa" 8 40 2>&1 >/dev/tty | tr -d "\r\n")
        mv $fileName $destination
else
        dialog --title "Zla opcja" --msgbox "Wybrales zla opcje." 5 30
fi

