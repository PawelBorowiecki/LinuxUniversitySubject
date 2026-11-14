#!/usr/bin/bash

#To jek komentarz jednowierszowy

# Deklaracja zmiennych
a="Pierwsza zmienna"
echo $a

echo

# Apostrofy
echo 'Tekst: $a'
echo "Tekst: $a"
echo "Tekst: \$a"

echo

echo `ls -a`
# alternatywna wersja
echo $(ls -a)

echo

# Rodzjae zmiennych
# zmienna lokalna - dzila tylko w jednej powloce
b="Zmienna lokalna"
katalog=`pwd`
echo "Jestes w katalogu $katalog"

katalog=$(pwd)
echo "Jestes w katalogu $katalog"

echo

# Zmienne specjalne
echo "$0"	#sciezka
echo "$@"	#ilosc argumentow
echo "Parametry skryptu: $@"

echo

echo "$?" #Kod powrotu ostatnio wykonanego polecenia. Wynik wykonania ostatniego polecenia np: 0
echo "$$" #Nr PID procesu beizacej powloki
echo

#Zmienne srodowiskowe

#lokalne
# t="Tekst"
# echo "$t"
# bash 		#wejscie do podpowloki
# echo "$t"	#Ta zmienna nie istnieje w podpowloce

#globalne
# export t="Tekst"

#usuniecie atrybutu eksportu dla danej zmiennej
# export -n t

# wyswietlanie zmiennych globalnych
# echo $( export -p )

#wyswietlanie zmiennych srodowiskowych
# echo `env`

echo

#Zmienne tablicowe
tablica=(10 2 3 4 5 6)
echo ${tablica[0]}
echo ${tablica[*]}
echo ${tablica[@]}

echo

#Liczba znakow danego elementu tablicy
echo ${#tablica[0]}

echo

#Dodawanie elemntow do tablicy
tablica[10]=7
echo ${tablica[*]}
echo ${tablica[6]}

echo

tab[0]="Tak"
tab[1]="Nie"
echo ${tab[@]}

echo

#Usuwanie elementow tablicy
unset tablica[3]
echo ${tablica[*]}

echo usuwanie
unset tablica[*]
echo ${tablica[@]}
