#!/usr/bin/awk -f

#DOSUNIX sluzy do zmiany kodowania na linuxie - przyda sie na kolokwium

BEGIN { print FS = "," }	#FS ustawia separator

#Wyswietlenie wszystkich linii
#{ print $0 }

#Wyswietlanie pierwszej kolumny
#{ print $1 }

#Wyswietlenie pierwszej i trzeciej kolumny
#{ print $1 "\t" $3 }

#Wyswietlenie kolumn w roznej kolejnosci
#{ print $3 "\t" $1 }

#Wyswietlenie linii, ktore spelniaja wzorzec
#/female/ { print $0 }
#/some hi*/ { print $0 }		# Wszystko co po hi zostanie dopasowane

#Liczenie wierszy, ktore spelniaja dany wzorzec
#/female/ { ++ile }		#Nie musimy wczesniej deklarowac zmiennej ile
#END { print "Ilosc = ", ile }

#Wyswietlanie linii, ktore maja okreslona liczbe znakow
length($0) < 68
