#!/bin/bash

# case usage
# export PATH="~/:$PATH" ## current session path to where the file is located

case $1 in
start)
echo "Started"
sleep 9999
;;
stop)
echo "Stopped by [PID]:"
ps aux | grep case.sh | grep -v grep | awk '{print $2}'
killall sleep 2>/dev/null
exit 143
#kill $(ps aux | grep case.sh | grep -v grep | awk '{print $2}')
;;
restart)
echo "Stopped by [PID]:"
ps aux | grep case.sh | grep -v grep | awk '{print $2}'
killall sleep 2>/dev/null
#kill $(ps aux | grep sleep | grep -v grep | awk '{print $2}')
case.sh start
;;
*)
echo "usage: start | stop | restart"
;;
esac
