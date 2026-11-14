#!/bin/bash

if [ $1 = "utworz" ]; then
	touch $2
elif [ $1 = "usun" ]; then
	rm $2
elif [ $1 = "skopiuj" ]; then
	cp $2 $3
elif [ $1 = "przenies" ]; then
	mv $2 $3
else
	echo "Podales zle dane"
fi
