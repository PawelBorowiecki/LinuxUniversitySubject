#!/bin/bash

echo -e "Wybierz odpowiednia opcje:\n1: utworzenie pliku\n2: usuniecie plik\n3: skopiowanie pliku\n4: przeniesienie pliku"
read option
if [ $option -eq 1 ]; then
	read -p "Podaj nazwe pliku: " fileName
	touch $fileName
elif [ $option -eq 2 ]; then
	read -p "Podaj nazwe pliku: " fileName
	rm $fileName
elif [ $option -eq 3 ]; then
	read -p "Podaj nazwe pliku do skopiowania oraz sciezke docelowa: " fileName destination
	cp $fileName $destination
elif [ $option -eq 4 ]; then
	read -p "Podaj nazwe pliku do przeniesienia oraz sciezke docelowa: " fileName destination
	mv $fileName $destination
else
	echo "Wybrales zla opcje"
fi
