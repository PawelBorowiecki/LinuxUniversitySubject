#! /usr/bin/bash

l1=$1
l2=$2

#Funkcje	Wszystkie parametry wewnatrz funkcji sa liczone od 1
function dodaj(){
	w=$(( $1+ $2 ))
	echo $w
}

dodaj $l1 $l2
