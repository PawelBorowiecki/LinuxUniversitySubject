#!/usr/bin/bash

#Wczytanie danych kalawiatury
echo "Jaki jest twoj ulubiony kolor?"
read kolor
echo "Twoj ulubiony kolor to: $kolor"

echo

echo "Jaki jest Twoj nickname?"
odp="tata"
read
echo "$odp"

echo

echo "Podaj 3 liczby:"
read a b c
echo "Liczba w zmiennej a to: $a"
echo "Liczba w zmiennej b to: $b"
echo "Liczba w zmiennej c to: $c"

echo

# Dopisywanie danych
echo "Podaj liczbe od 4 do 10:"
read liczba
echo "Jestes ${liczba}-ty w kolejce"	#Dolar czyta do znakow specjalnych

echo

# Wybrane parametry read

#1. -p	(znak zachety bez znaku konczacego nowej linii)
read -p "Witaj " imie
echo "$imie"

echo

#2. -a (przypisywanie kolejnych wartoscvi do kolejnych indeksow zmiennej tablicowej)
echo "Podaj elementy tablicy:"
read -a tablica
echo "${tablica[*]}"

echo

#3. -e (brak nazwy zmiennej -> $REPLY)
echo "Witaj BASH"
read -e
echo "$REPLY"

echo

#4. -s (nie wyswietla znakow wspisywanych przez uzytkownika)
# bez echa max przez 30 sekund
read -p "Haslo: " -s -t 30 haslo
echo "$haslo"
