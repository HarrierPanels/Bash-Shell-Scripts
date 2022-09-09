#!/bin/bash

# Font style output
green=$(tput setaf 2)
yellow=$(tput setaf 226)
bold=$(tput bold)
error=$(tput setaf 160)
warn=$(tput setaf 214)
reset=$(tput sgr0)

# Progress Emulation
emu() { 
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
}

# No argument check
if [[ -n $1 ]]; then

# Storing the argument values and shifting over the array
arg=$@
  # Digits only check
  if [[ $(echo $arg | tr -d " ") =~ ^[0-9]+$ ]]; then

# Echoing the arguments & calculating the sum 
for ((i=1; i<=$#; i++)); do
echo "  Argument \$${i}: ${yellow}${!i}${reset}"
if [[ $i<$# ]]; then
j=$(($i+1))
arr[i]=$((${!i}+${!j}))
fi
done
arr=(${arr[@]} $(($1 + ${@: -1})))

# The result
emu
echo "  ${green}${arr[@]}${reset}"

  else
  echo "${bold}${warn}WARNING:${reset} ${bold}Digits only! Exiting.${reset}"
  fi

else
echo "${bold}${error}ERROR:${reset} ${bold}No arguments! Exiting.${reset}"
exit
fi
