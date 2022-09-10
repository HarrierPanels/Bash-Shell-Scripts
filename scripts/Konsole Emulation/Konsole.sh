#!/bin/bash

# Konsole Emulation v.1
# Supports commands: ls, pwd, hi, exit

hn=`hostname`
usr=`whoami`
if [[ dir=="$HOME" ]]; then
dir="~"
else
dir="${PWD##*/}"
fi

cmd="[$usr"@"$hn $dir]$ "
   
while :; do 

IFS= read -r -p "$cmd" input

case $input in

ls) $input;;
"ls "*) $input;;
pwd) pwd;;
[Hh][i]) echo "hi $usr!";;
exit) exit;;
"");;
*) echo "bash: "$input": command not found";;
esac 

done
