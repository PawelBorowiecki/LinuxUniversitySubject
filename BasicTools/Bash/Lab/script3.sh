#!/usr/bin/bash

<<KOMENTARZ
To jest komentarz wielowierszowy

Deskryptory:
0 - standradowe wejscie
1 - standardowe wyjscie
2 - standardowe wyjscie bledu

KOMENTARZ

# Przyklad 1 (utworzenie pliku z zawartoscia)
ls > pliki.txt

# Przyklad 2 (utworzenie pliku z zawartoscia wykorzystaujac deskryptory)
#exec 1> "plik1.txt"	#Wszystko z deskryptora 1 bedzie zapisywane do pliku plik1.txt
#ls >&1

# Przyklad 3 (Polaczenie 2 plikow w calosc)
echo "Witaj w Kubuntu" > plik11.txt
echo "Powtorka z bash" > plik12.txt
cat plik11.txt plik12.txt > plik3.txt

# Przyklad 4 (Dopisywanie danych do pliku)
echo "Cwiczenia" >> plik3.txt

# Przyklad 5 (Przekierowanie strumieni)
exec 2>&1	#To co da deskryptor 2 zostanie przekiwerowane na deskryptor 1
echo "Testujemy" > /dev/null >&2

# Przyklad 6 (Potoki)
ls -a | grep ".txt"

# Przyklad 7 (Potoki nazwane)
mkfifo myPipe
ls -al > myPipe
grep ".txt" < myPipe
