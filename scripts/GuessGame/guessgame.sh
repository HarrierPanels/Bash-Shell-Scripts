#!/bin/bash

green=`tput setaf 36`
reset=`tput sgr0`
bold=`tput setaf bold`

pro () {
sleep 5 &
p=$!
f="/ | \\ -"

while kill -0 $p >/dev/null 2>&1; do
 for i in $f; do
 printf "${bold}${green}\r$i${reset} Checking. Wait ..."
 sleep 0.5
 done
done
printf "\n"
}

function play {
rnd=$(( $RANDOM % $2 ))
echo "Guess number between 0 and $(($2 - 1))"
read -r number
pro
[[ $1 -gt $(($2 - 1)) ]] || [[ $1 -lt 0 ]] && echo "No! Maximum $(($2 - 1))!" && exit
[[ $number -ne $rnd ]] && echo "It's $rnd! Game over!" && exit
}

echo "Level 1"
play number 2
echo "Correct!"

echo "Level 2"
play number 3
echo "Well done!" 

echo "Level 3"
play number 4
echo "You won the Game!" 

