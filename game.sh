#!/bin/bash

array[0]="##################"
array[1]="#                #"
array[2]="#                #"
array[3]="#                #"
array[4]="#                #"
array[5]="#                #"
array[6]="#                #"
array[7]="#                #"
array[8]="#                #"
array[9]="##################"

red="\e[0;31m"
white="\e[0m"
ball="$(tput setaf 2)"

x=${1:-1}
y=${2:-1}

xs=1
ys=1

while true
do
	x=$((x+xs))
	y=$((y+ys))

	if [[ $x -ge $((${#array[0]}-2)) ]] || [[ $x -le 1 ]]
	then
		xs=$((xs*-1))
	fi

	if [[ $y -ge $((${#array[*]}-2)) ]] || [[ $y -le 1 ]]
	then
		ys=$((ys*-1))
	fi
	clear
	for i in $(seq 0 $((${#array[*]}-1)))
	do
		if [[ $y -eq $i ]]
		then
			line="${array[$i]}"
			echo -e "${red}${line:0:$x}${ball}@${red}${line:$((x+1))}"
		else
			echo -e "${red}${array[$i]}"
		fi
	done
	echo -e "${white}$y"
	echo -e "${white}$x"
	sleep 0.1
done
