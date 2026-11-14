#!/bin/bash

if [ $1 = "utworz" ]; then
        mkdir -p $2
elif [ $1 = "usun" ]; then
        rm -r $2
elif [ $1 = "skopiuj" ]; then
        cp -r $2 $3
elif [ $1 = "przenies" ]; then
        mv $2 $3
else
        echo "Podales zle dane"
fi
