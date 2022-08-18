#!/bin/bash

# case statement usage
# export PATH="~/:$PATH" ## current session path to where the file is located
# ASCII text executable won't accept $! - PID of the background process
# the child proccess incremented by 25 due to $ShellScript & the progress bar

ShellScript=$(basename -- "$0")

case $1 in
start)
echo "Starting $ShellScript"

## Fake Progress Bar ##
for i in {1..23}
do sleep 0.1
echo -n \#
done
echo
echo "Press ENTER to continue"

sleep 9999
;;

stop)
echo "Stopping $ShellScript by [PID]:"
ps aux | grep $0 | grep -v grep | awk '{print $2}'

# a more complicated way for killall sleep
for a in $(ps aux | grep $0 | grep -v grep | awk '{print $2}')
do
let "a=a+25"
kill $a 2>/dev/null # omits stderr in case of restart without start
done

## Fake Progress Bar ##
for i in {1..23}
do sleep 0.1
echo -n \.
done
echo

;;

restart)
$ShellScript stop
$ShellScript start
;;

*)
echo "$ShellScript usage: start | stop | restart"
;;

esac
