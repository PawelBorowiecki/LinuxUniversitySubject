#!/bin/bash

if [ $1 = "-hd" ]; then
	df -h
elif [ $1 = "-ram" ]; then
	free -h
elif [ $1 = "-cpu" ]; then
	lscpu
elif [ $1 = "-all" ]; then
	df -h
	free -h
	lscpu
else
	echo "Podales zla opcje"
fi
