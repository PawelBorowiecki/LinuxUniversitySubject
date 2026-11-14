#!/usr/bin/bash

#Sprawdzanie ustawien
echo 'limits' | bc	#zwykly kalkulator, dla naukowego bc -l

echo

#Podstawa liczb dla wejscia (ibase) i wyjscia (obase)
echo 'ibase' | bc
echo 'obase' | bc

echo

#Sprawdzanie dokladnosci
echo 'scale' | bc
echo 'scale' | bc -l

echo

#Proste operacje matematyczne
echo '2+4*5' | bc

echo

#Pierwiastek
echo 'sqrt(16)' | bc

echo

#Potega
echo '5^2' | bc

echo

#Liczba Eulera
echo 'e(1)' | bc -l

echo

#Liczba Eulera do 2 miejsc po przecinku. bc NIE zaokragla
echo 'scale=2;e(1)' | bc -l

echo

#Sinus
echo 's(45)' | bc -l

echo

#Konwersja na system dwojkowy
echo 'obase=2;24' | bc

echo

#Problem 1
echo '7^7^7' | bc
