# No shebang #!//bin/bash

# Case Statement usage sample
# export PATH="~/:$PATH" ## current session path to where the file is located
# ASCII text (no shebang) accepts $! - PID of the background process yet ps, grep, & awk won't work correctly

ShellScript=$(basename -- "$0")

case $1 in
start)
echo "$ShellScript Started"
sleep 9999
;;
stop)
echo "$ShellScript Stopped by [PID]: $!"
kill $!
killall sleep
;;
restart)
$ShellScript stop
$ShellScript start &
;;
*)
echo "$ShellScript usage: start | stop | restart"
;;
esac
