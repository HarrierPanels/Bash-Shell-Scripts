#!/bin/bash

case $1 in
start)
echo "Started"
sleep 9999
;;
stop)
echo "Stopped by [PID]: $!"
kill $!
;;
restart)
echo "Stopped by [PID]: $!"
kill $!
case0.sh start
;;
*)
echo "usage: start | stop | restart"
;;
esac
