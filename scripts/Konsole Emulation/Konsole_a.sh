#!/bin/bash

# Konsole Emulation v.1.a
# Supports commands: ls, pwd, hi, exit

hn=`hostname`
usr=`whoami`
if [[ dir="$HOME" ]]; then
dir="~"
else
dir="${PWD##*/}"
fi
cmd="[$usr"@"$hn $dir]$ "

echo "$cmd"
   
while IFS= read -r -a input; do
echo "$cmd"

case ${input[@]} in

ls)
echo "$(${input[@]})" | tr ':' ':\n'
echo "$cmd"
;;
"ls "*) 
echo "$(${input[@]})" | tr ':' ':\n'
echo "$cmd"
;;
pwd) pwd
echo "$cmd"
;;
[Hh][i] ) echo "hi $usr!"
echo "$cmd"
;;
exit) exit;;
"")
;;
*)
echo "bash: "${input[@]}": command not found"
#echo "bash: "$input": command not found";;
echo "$cmd"
;;
esac 
done
