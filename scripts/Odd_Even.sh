#!/bin/bash

a=$1

if [[ $# -eq 0 ]]; then
echo "Error: No Arguments supplied!"
elif [[ $# -gt 1 ]]; then
echo "Error: More than 1 argument entered!"
else
     if [ $1 -eq $1 2>/dev/null ]; then
        if (( $1 % 2 == 0 )); then
        echo "The entered argument: $1 is Even Number"
        else
        echo "The entered argument: $1 is Odd Number"
        fi
     else
          if [[ $a =~ [a-zA-Z] && $a != "[0-9]" ]]; then
             if (( ${#a} % 2 == 0 )); then
             echo "Letters in the argument: ${#a} (Even)"
             else
             echo "Letters in the argument: ${#a} (Odd)"
             fi
          else
          echo  "Error: Letters only or Digits!"
          fi
     fi
fi
