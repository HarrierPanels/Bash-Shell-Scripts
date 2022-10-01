bar() {
for j in $*; do 
printf "$j" 
sleep 0.1
done
    
}

emu() {
sleep 5 &
pid=$!
for j in $2; do 
while kill -0 $pid >/dev/null 2>&1; do 
for i in $1; do
printf "\r$i " 
sleep 0.1
done 
done
printf "$j" 
sleep 0.1
done
}

emu2() {
for j in $2; do 
printf "$j" 
sleep 0.1
done

sleep 5 &
pid=$!
while kill -0 $pid >/dev/null 2>&1; do 
for i in $1; do
printf "\r$i " 

sleep 0.1
done
#printf "$j" 
#sleep 0.1
done
}

emu3() {

bar $2

sleep 5 &
pid=$!

while kill -0 $pid >/dev/null 2>&1; do 
for i in $1; do
printf "\r      $i" 
sleep 0.1
done
done

}
#emu "/ | \\ -" " L o a d i n g . . ."
emu3 "/ | \\ -" "\tL o a d i n g . . ."
