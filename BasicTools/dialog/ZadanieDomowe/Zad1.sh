#!/bin/bash

lscpu > informacjeOSystemie.txt
uname -a >> informacjeOSystemie.txt
echo $USER >> informacjeOSystemie.txt
echo $HOME >> informacjeOSystemie.txt

dialog --title "Informacje o Twoim systemie" --msgbox "Informacje o Twoim systemie zostaly zapisane\nw pliku ../informacjeOSystemie.txt" 8 50

#Wybralem msgbox, poniewaz w zadaniu 2. z Basha nie jest nic napisane, ze uzytkownik ma podac sciezke do pliku do zapisu,
#co wskazuje na to, ze nie trzeba uzywac inputbox, lecz wystarczy zastosowac msgbox do poinformowania uzytkownika, gdzie zostaly zapisane jego
#informacje o systemie.
