# No shebang #!//bin/bash

# Case Statement usage sample
# export PATH="~/:$PATH" ## current session path to where the file is located
# ASCII text (no shebang) accepts $! - PID of the background process yet ps, grep, & awk won't work correctly

case $1 in
start)
echo "$0 Started"
sleep 9999
;;
stop)
echo "$0 Stopped by [PID]: $!"
kill $!
killall sleep
;;
restart)
$0 stop
$0 start
;;
*)
echo "$0 usage: start | stop | restart"
;;
esac
