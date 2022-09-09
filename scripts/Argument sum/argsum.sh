#!/bin/bash

# Font style output
green=$(tput setaf 2)
yellow=$(tput setaf 226)
bold=$(tput bold)
error=$(tput setaf 160)
warn=$(tput setaf 214)
reset=$(tput sgr0)

# No argument check
if [[ -n $1 ]]; then

# Storing the argument values and shifting over the array
arg=$@
shifted=(`shift && echo $@` $1 ) 
a=1
  # Digits only check
  if [[ $(echo $arg | tr -d " ") =~ ^[0-9]+$ ]]; then

# Iterating up the array for output
while [[ a -le $# ]]; do
 for i in $@; do 
 echo "  Argument \$$a: ${yellow}"$i""${reset}
 ((a++))
 done
done

# Writing & Reading arrays
echo "${arg[@]}" >> "$0".arr1.tmp
echo "${shifted[@]}" >> "$0".arr2.tmp

arr1=( `cat "$0".arr1.tmp` )
arr2=( `cat "$0".arr2.tmp` )

# Progress Emulation
sleep 5 &
pid=$!
frames="/ | \\ -"

while kill -0 $pid >/dev/null 2>&1; do
 for frame in $frames; do
 printf "${bold}${green}\r$frame${reset} Calculating the sum ..."
 sleep 0.5
 done
done
printf "\n"

# Calculating the sum of original and shifted arrays
for (( i=0; i < ${#arr1[@]}; i++ )); do
arr3[i]=$(( arr1[i] + arr2[i] ))
done

# Renoving tmp files
rm "$0".arr1.tmp "$0".arr2.tmp

# The result
echo "  ${green}${arr3[@]}${reset}"

  else
  echo "${bold}${warn}WARNING:${reset} ${bold}Digits only! Exiting.${reset}"
  fi

else
echo "${bold}${error}ERROR:${reset} ${bold}No arguments! Exiting.${reset}"
exit
fi
