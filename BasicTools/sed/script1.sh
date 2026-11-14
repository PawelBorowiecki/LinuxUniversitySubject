#!/usr/bin/bash

<<KOMENTARZ

Parametry sed:
 -n  - na wyjsciu beda wypisywane jedynie linie na ktorych wykonano
       komende p lub s z parametrem p
 -e  - stosujemy, gdy przetwarzamy wiele polecen lub skryptow
 -f  - dzieki temu argumentowi wczytuemy komendy z pliku
 -v  - wyswietla informacje o programie
 -t  - wylaczenie wyjscia z istotnych komend powloki, ktore sa wykonywane
 -q  - likwiduje ostrzezenia o rezultatach podstawienia
 -i  - edycja w miejscu, zapisuje zmiany do oryginalnego pliku
 -b  - zapisanie kopii zapasowej oryginalneo pliku

Skladnia:
sed 's/stary/nowy/' plik

KOMENTARZ

#Przyklad1 - usuwanie linii
sed -e '1d' -e '2d' -e '7d' ksiazki2.txt # usuniecie 1,2, i 7 linii w  pliku ksiazki2.txt

echo

#Przyklad2 - zastapienie wyraz1 przez wyraz2 (pierwsze wystapienie)
sed 's/Proces/Wyrok/' ksiazki2.txt

echo

#Przyklad3 - zastapienie wyarz1 przez wyraz2 (globalnie)
sed 's/Proces/Wyrok/g' ksiazki2.txt

echo

#Przyklad4 - zastapienie wielu wyrazow - metoda1
sed 's/Proces/Wyrok/' ksiazki2.txt > ksiazki2m.txt | sed 's/Mały/Duży/' ksiazki2m.txt

echo

#Przyklad5 - zastapienie wielu wyrazow - metoda2
sed 's/Proces/Wyrok/;s/Mały/Duży/' ksiazki2.txt
