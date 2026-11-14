#!/bin/bash

name=""
surname=""
email=""
login=""
password=""
hobby=""

dialog --title "Formularz" --form "Wprowadz dane (wszystkie pola sa wymagane)" 18 60 7 \
	"Imie:" 1 1 "$name" 1 15 30 0 \
	"Nazwisko:" 2 1 "$surname" 2 15 30 0 \
	"Adres E-mail:" 3 1 "$email" 3 15 30 0 \
	"Login:" 4 1 "$login" 4 15 30 0 \
	"Haslo:" 5 1 "$password" 5 15 30 0 \
	"Hobby:" 6 1 "$hobby" 6 15 30 0 \
	2>tempInputFile.txt

{
        read -r name
        read -r surname
        read -r email
        read -r login
        read -r password
	read -r hobby
} < tempInputFile.txt

if [[ $name = "" || $surname = "" || $email = "" || $login = "" || $password = "" || $hobby = "" ]]; then
	dialog --title "Brak danych" --msgbox "Nie podales wszystkich danych.\nMilego wprowadzania danych od nowa ;)" 7 45
else
	{
		read -r name
		read -r surname
		read -r email
		read -r login
		read -r password
		read -r hobby
	} < tempInputFile.txt
	dialog --inputbox "Podaj sciezke bezwzgledna do pliku, w ktorym chcesz zapisac dane" 7 60 2>pathToSave.txt
	pathToSave=$(cat pathToSave.txt | tr -d "\r\n")
	if [ "$pathToSave" = "" ]; then
		dialog --title "Zla sciezka" --msgbox "Podales zla sciezke do zapisu danych.\nMilego wprowadzania danych od nowa ;)" 7 45
	else
		echo "Imie: $name" > "$pathToSave"
		echo "Nazwisko: $surname" >> "$pathToSave"
		echo "Adres E-mail: $email" >> "$pathToSave"
		echo "Login: $login" >> "$pathToSave"
		echo "Haslo: $password" >> "$pathToSave"
		echo "Hobby: $hobby" >> "$pathToSave"
		rm tempInputFile.txt pathToSave.txt
	fi
fi
