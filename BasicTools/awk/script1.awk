#!/usr/bin/awk -f

#Skladnia awk
# [wzorzec] <program>

# $0 - caly wzorzec
# $1 - 1. grupa
# $2 - 2. grupa
# itd

#Przykla1 (wypisanie wszystkich imion konczacych sie na asia)
/asia/ { print $0 }

#Przyklad2 (wszystkie osoby, ktore maja na imie Zosia)
/^Zosia/ { print "Witaj " $0 }
/^Zosia/ { print "Witaj " $1 }
