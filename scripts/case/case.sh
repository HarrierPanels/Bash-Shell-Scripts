#!/bin/bash

# Case statement usage sample
# export PATH="~/:$PATH" ## current session path to where the file is located
# ASCII text executable won't accept $! - PID of the background process
# The child process is killed via pgrep as advised by Serhi Prykhodchenko from EPAM 

ShellScript=$(basename -- "$0")

function help() {
echo
echo "$ShellScript usage: start [OPTIONS] & | stop [OPTIONS] | restart [OPTIONS] | reload"
echo -e  "NOTE: $ShellScript should be run in background! Use & in the end of the start command.\nIf the process was aborted\nor started incorrectly and you are unable to use it try the reload command."
echo "Example (OUTPUT messages): $ShellScript start &"
echo
echo "    Options:"
echo "   -s, --silent           Run in silent mode. Displays minimum OUTPUT messages"
echo "   -h, --help             Displays this help"
echo
}

if [[ $# -ne 0 && $# -le 2 ]]; then

case $* in

"start")

# Status check
if [[ $(grep -oP "started" /tmp/"$ShellScript".tmp) =~ "started" ]] 2>/dev/null; then

echo "Process already running! Press ENTER to exit."
else
echo "Starting $ShellScript"

## Pseudo Progress Bar ##
for i in {1..23}
do sleep 0.1
echo -n \#
done
echo
echo "Press ENTER to continue"

# Creating a temporary log file
echo "$ShellScript started: $(date)" > /tmp/"$ShellScript".tmp

sleep 9999 

# Removing the log file 
rm /tmp/"$ShellScript".tmp 2>/dev/null
fi
;;

"stop")

# Status check
if [[ $(grep -oP "started" /tmp/"$ShellScript".tmp) =~ "started" ]] 2>/dev/null; then

   # Prompt Y / N
   while true; do
    read -p "Are you sure you want to stop $ShellScript now? [Y / N] " prompt
     case $prompt in
     [Yy]* )

     # Stop
     # using pgrep, ps, grep, & awk to kill a child process 
     for a in $(ps aux | grep "$0" | grep -v grep | awk '{print $2}')
     do
     kill $(pgrep -P "$a") 2>/dev/null
     done

     ## Pseudo Progress Bar ##
     for i in {1..23}
     do sleep 0.1
     echo -n \.
     done
     echo
    
     break;;
     [Nn]* ) exit;;
     * ) echo "Please answer [y]es or [n]o.";;
     esac
   done

else
echo "Nothing to stop! Exiting."
fi
;;

"restart")

# Status check
if [[ $(grep -oP "started" /tmp/"$ShellScript".tmp) =~ "started" ]] 2>/dev/null; then

# Stop
# using pgrep, ps, grep, & awk to kill a child process 
for a in $(ps aux | grep "$0" | grep -v grep | awk '{print $2}')
do
kill $(pgrep -P "$a") 2>/dev/null
done

## Pseudo Progress Bar ##
for i in {1..23}
do sleep 0.1
echo -n \.
done
echo

# Start
$ShellScript start &
else
   # Restart Prompt
   while true; do
    read -p "Nothing to restart! Want to start $ShellScript instead? [Y / N] " prompt

     case $prompt in
     [Yy]* )
     $ShellScript start &
     break;;
     [Nn]* ) exit;;
     * ) echo "Please answer [y]es or [n]o.";;
     esac
   done
fi
;;

"reload")

# Status check
if [[ $(grep -oP "started" /tmp/"$ShellScript".tmp) =~ "started" ]] 2>/dev/null; then

# Stop
# using pgrep, ps, grep, & awk to kill a child process 
for a in $(ps aux | grep "$0" | grep -v grep | awk '{print $2}')
do
kill $(pgrep -P "$a") 2>/dev/null
done

# Removing the log file 
rm /tmp/"$ShellScript".tmp 2>/dev/null

$ShellScript start &
else

$ShellScript start &
fi
;;

"start -s")

# Status check
if [[ $(grep -oP "started" /tmp/"$ShellScript".tmp) =~ "started" ]] 2>/dev/null; then

exit
else

# Creating a temporary log file
echo "$ShellScript started: $(date)" > /tmp/"$ShellScript".tmp

sleep 9999

# Removing the log file 
rm /tmp/"$ShellScript".tmp 2>/dev/null
fi
;;
"stop -s")
# Status check
if [[ $(grep -oP "started" /tmp/"$ShellScript".tmp) =~ "started" ]] 2>/dev/null; then

# Stop
# using pgrep, ps, grep, & awk to kill a child process 
for a in $(ps aux | grep "$0" | grep -v grep | awk '{print $2}')
do
kill $(pgrep -P "$a") 2>/dev/null
done

else
exit
fi
;;
"restart -s")
# Status check
if [[ $(grep -oP "started" /tmp/"$ShellScript".tmp) =~ "started" ]] 2>/dev/null; then

$ShellScript stop -s
$ShellScript start -s &

else
exit
fi
;;
"start --silent")
$ShellScript start -s
;;

"stop --silent")
$ShellScript stop -s
;;
"restart --silent")
$ShellScript restart -s
;;

*)
help
;;
esac

else
help
fi
