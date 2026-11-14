#!/usr/bin/awk -f

#ARGC - ilosc parametrow
#BEGIN { print "Parametry = ", ARGC }

#ARGV - parametry
BEGIN {
  for ( i=0; i < ARGC; ++i ){
    printf "ARGV[%d] = %s\n", i, ARGV[i]
  }
}

#CONVFMT - format liczby
BEGIN { print "Format liczby = ", CONVFMT }

#ENVIRON - tablica zmiennych srodowiskowych
BEGIN { print ENVIRON["USER"] }

#FILENAME - nazwa pliku (parametr) - tylko w bloku END
END { print FILENAME }

#NF - ilosc kolumn
BEGIN {}
NF > 6

#NR - ilosc kolumn w aktualnym rekordzie (wierszu)
BEGIN {}
NR > 6

#FNR - podobny do NR. Uzyteczny przy wielu plikach
#Resetuje wartosc gdy nowy plik

#OFMT - format wyjsciowy liczby
BEGIN { print "OFMT = ", OFMT }

#OFS - separator wyjsiowy dla pol (kolumn). Domyslnie spacja
BEGIN { print "OFS = ", OFS }

#ORS - separator wyjsciowy dla rekordow (wierszy). Domsylnie nowa linia
BEGIN { print "ORS = ", ORS }

#RLENGTH - dlugosc stringa dopasowna przez funkcje match
BEGIN { if  ( match("czerwony niebieski zielony", "ony")) { print RLENGTH }}

#RS - separator wejsciowy dla rekordu. Wartosc domyslna to nowa linia
BEGIN { print "RS = ", RS }

#RSTART - pierwsza pozycja stringa dopasowanego przez funkcje match
BEGIN { if ( match("czerwony niebieski zielony", "zie")) { print "RSTART = ", RSTART}}

#SUBSEP - znak separatora dla indeksow tablic. Domyslnie \034
BEGIN { print "SUBSEP = ", SUBSEP }
