#!/usr/bin/bash

#Proste okno z wiadomoscia
#dialog --title 'Wiadomosc' --msgbox 'Wiatj w oknie daiogowym' 5 30	#Na koncu dajemy rozmiar

#Okno z przyciskiem YES NO
#dialog --title 'Wiadomosc2' --yesno 'Lubisz okna dialogowe?' 6 30

#Okno informacyjne
#dialog --infobox 'Prosze czekac...' 10 30 ; sleep 4

#Okno do wprowadzania danych
#dialog --inputbox "Podaj swoje imie" 8 40 2>er$$	#Input bierzemy z deskryptora 2

#Okno do wyswietlania tekstu
#dialog --textbox /etc/profile 22 70

#Okno z menu
#dialog --menu "Wybierz kolor: " 10 30 3 1 czerwony 2 zielony 3 niebieski	#Wskazujemy 3 opcje a potem wartosci kazdej z nich

#Okno z lista opcji do wielokrotnego wyboru
#dialog --checklist "Wybierz podzespoly" 10 60 3 \
#   1 'cpu' off \
#   2 'gpu' off \
#   3 'ram' on

#Okno z lista pojedynczeo wyboru
#dialog --backtitle "Wybor notebook" \
#   --radiolist "Wybierz producenta: " 10 40 4 \
#      1 'Asus' off \
#      2 'Acer' on \
#      3 'Dell' off \
#      4 'Lenovo' off

#Okno dialogowe do wprowadzania hasla
#dialog --title "Wprowadzanie hasla" \
#   --passwordbox "Podaj haslo:" 8 40 2>haslo.txt

#Okno z wyborem pliku
#dialog --fselect /home/student/dialog_gr1 10 40 2>sciezka.txt

#Okno z paskiem postepu
#licznik=0
#while [ $licznik -lt 100 ]; do
#	licznik=$[ licznik+1 ]
#	echo $licznik | dialog --gauge "Postep" 8 40
#done

#Okno do ustawiania czasu
#dialog --clear --timebox "Ustaw zegar" 3 8 14 52 59 2> godzina.txt

#Okno kalendarza
dialog --calendar "Kalendarz" 0 0 17 03 2026 2> data.txt
