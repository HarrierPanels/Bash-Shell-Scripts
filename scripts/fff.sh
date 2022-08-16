#!/bin/bash

# case usage
# export PATH="~/:$PATH"

case $1 in
start)
echo "Started"
sleep 9999
;;
stop)
echo "Stopped by [PID]:"
echo "$(ps aux | grep fff.sh | grep -v grep | awk '{print $2}')"
killall sleep 2>/dev/null
exit 143
#kill $(ps aux | grep fff.sh | grep -v grep | awk '{print $2}')
;;
restart)
echo "Stopped by [PID]:"
echo "$(ps aux | grep fff.sh | grep -v grep | awk '{print $2}')"
killall sleep 2>/dev/null
#kill $(ps aux | grep sleep | grep -v grep | awk '{print $2}')
fff.sh start
;;
*)
echo "usage: start | stop | restart"
;;
esac 
