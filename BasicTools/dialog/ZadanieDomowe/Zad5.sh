#!/bin/bash

files=$(dialog --title "Wybierz pliki do skopiowania" --fselect "$HOME"  8 40 2>&1 >/dev/tty)
destination=$(dialog --inputbox "Podaj bezwzgledna sciezke docelowa" 8 40 2>&1 >/dev/tty)

(
	echo 25
	sleep 1
	cp -r $files $destination
	echo 75
	sleep 1
	echo 100
) | dialog --title "Postep" --gauge "Kopiowanie..." 8 20

dialog --title "Sukces" --msgbox "Skopiowano pomyslnie" 8 20
