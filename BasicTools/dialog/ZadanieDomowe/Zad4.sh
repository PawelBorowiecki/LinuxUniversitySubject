#!/bin/bash

option=$(dialog --backtitle "Wybor kalkulacji" --radiolist "Wybierz co chcesz obliczyc:" 15 30 3\
	1 "Liczba PI" on \
	2 "Zlota liczba" off \
	3 "Miejsca zerowe wielomianu" off \
	2>&1 >/dev/tty)

calc_scale=$(echo "scale" | bc -l)
calc_scale=$(dialog --inputbox "Podaj dokladnosc obliczen, wiedzac ze maksymalna dokladnosc wynosi: $calc_scale" 20 30 2>&1 >/dev/tty)

if [ $option -eq 1 ]; then
	sum=0
	for (( i = 0; i < 700; i++)); do
		numerator=$(echo "scale = $calc_scale; (-1) ^ $i" | bc -l)
		denominator=$(echo "scale = $calc_scale; 2 * $i + 1" | bc -l)
		element=$(echo "scale = $calc_scale; $numerator / $denominator" | bc -l)
		sum=$(echo "scale = $calc_scale; $sum + $element" | bc -l)
	done
	result=$(echo "scale = $calc_scale; $sum * 4" | bc -l)
	dialog --title "Wynik" --msgbox "Liczba PI wynosi: $result" 8 50
elif [ $option -eq 2 ]; then
	result=$(echo "scale = $calc_scale; (1 + sqrt(5)) / 2" | bc -l)
	dialog --title "Wynik" --msgbox "Zlota liczba wynosi: $result" 8 50
elif [ $option -eq 3 ]; then
	parameters=$(dialog --title "Formularz parametrow" --form "Podaj parametry" 10 50 3\
		"a:" 1 1 "" 1 15 30 0 \
		"b:" 2 1 "" 2 15 30 0 \
		"c:" 3 1 "" 3 15 30 0 \
		2>&1 >/dev/tty
	)
	read a b c <<< $(echo $parameters)
	if [ $a -eq 0 ]; then
		result=$(echo "scale = $calc_scale; -$c / $b" | bc -l)
		dialog --title "Miejsce zerowe" --msgbox "$result" 8 20
	else
		delta=$(echo "scale = $calc_scale; ($b^2) - (4*$a*$c)" | bc -l)
		if [ $(echo "$delta < 0" | bc -l) -eq 1 ]; then
			dialog --title "Miejsce zerowe" --msgbox "Brak miejsc zerowych" 8 20
		elif [ $(echo "$delta == 0" | bc -l) -eq 1 ]; then
			result=$(echo "scale = $calc_scale; -$b / (2*$a)" | bc -l)
			dialog --title "Miejsce zerowe" --msgbox "$result" 8 20
		else
			x1=$(echo "scale = $calc_scale; (-$b - sqrt($delta)) / (2*$a)" | bc -l)
			x2=$(echo "scale = $calc_scale; (-$b + sqrt($delta)) / (2*$a)" | bc -l)
			dialog --title "Miejsca zerowe" --msgbox "$x1 $x2" 8 20
		fi
	fi
else
	dialog --title "Blad" --msgbox "Wybrales zla opcje" 10 40
fi
