#!/usr/bin/bash

<<KOMENTARZ
Operatory testow arytmetycznych

-lt less than
-le less or equal
-eq equal
-ge greater or equal
-gt greater than
-ne not equal

KOMENTARZ

# Instrukcje warunkowe
if [ `id -u` -eq 0 ]; then
	echo "root"
else
	echo "Nie root"
fi

echo

opcja=$1

if [ $opcja -gt 0 ]; then
	echo "Zielony"
elif [ $opcja -lt 0 ]; then
	echo "Czerwony"
else
	echo "Zolty"
fi

# Petle  for
nr=0
for plik in `ls`; do
	echo "$nr:" $plik
	nr=$(( $nr + 1 ))
done

echo

for i in 1 2 3 4 5 ; do
	echo "Nr: $i"
done

echo

# Instrukcja warunkowa case
case $opcja in
1)
	echo "Zielony";;
2)
	echo "Czerwony";;
*)
	echo "Zolty"
esac

echo

# Petla select
echo "Wybierz oiczbe od 1 do 3"
select number in 1 2 3
do
	case $number in
		1) echo "Niebieski";;
		2) echo "Czerwony";;
		3) echo "Zolty";;
		*) echo "Bialy"
	esac
break					#Gdyby nie bylo breaka to by sie zapetlalo
done

echo

# Petla warunkowa while
i=0
while [ $i -lt 10 ]; do
	echo "Numer: $i"
	i=$[ $i + 1 ]
done

echo

# Petla warunkowa until
i=0
until [ $i -gt 10 ]; do
	echo "Numer: $i"
	i=$[ $i + 1]
done

echo

<<KOMENTARZ
Porownywanie stringow

str1 = str2	-> identycznosc
str1 != str2	-> roznica
str1 < str2	-> str1 mniejsze od str2
str1 > str2	-> str1 wieksze od str2
-n str1		-> str1 nie pusty (dlugosc > 0)
-z str1		-> str1 pusty (dlugosc = 0)

KOMENTARZ

str1="6"
str2="12"

`test $str1 = $str2`;echo $?	#$? - wynik polecenie jak jest prawda to jest 0, a jak falsz jest 1
`test $str1 != $str2`;echo $?
`test $str1 \< $str2`;echo $?
`test $str1 \> $str2`;echo $?
`test -n $str1`;echo $?
`test -z $str1`;echo $? 
