#!/usr/bin/bash

#Przyklad1 - kropka
echo -e "kot\nplot\npot\npit\npat" | awk '/p.t/'

echo

#Przyklad 2 - poczatek linii
echo -e "Test\nTenis\nTeraz\nTenor" | awk '/^Ten/'

echo

#Przyklad 3 - koniec linii
echo -e "kot\nplot\npot\npit\npat" | awk '/ot$/'

echo

#Przyklad 4 - dopasowanie
echo -e "kot\nlot\npot\npit\npat" | awk '/[pl]ot/'

echo

#Przyklad 5 - poza dopasowaniem
echo -e "kot\nlot\npot\npit\npat" | awk '/[^pl]ot/'

echo

#Przyklad6 - alternatywa
echo -e "kot\nlot\npot\npit\npat" | awk '/pot|pat/'

echo

#Przyklad7 - 0 lub 1 wystapienie
echo -e "sto\nstos" | awk '/stos?/'

echo

#Przyklad8 - 0 lub wiecej wystapien
echo -e "sto\nstop\nstopp" | awk '/stop*/'

echo

#Przyklad9 - jedno lub wiecej wystapien
echo -e "112\n242\n123\n331\n456\n222" | awk '/2+/'

echo

#Przyklad10 - grupowanie
echo -e "Nowy traktor\nNowy rower\nNowy samochód\nNowy kombajn" | awk '/Nowy (traktor|kombajn)/'
