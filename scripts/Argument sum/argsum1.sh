#!/bin/bash

string=""

for ((i=1;i<$#;i++))
do
a=$(eval echo "\$$i")
j=$(( $i+1 ))
b=$(eval echo "\$$j")
string=$string$(( $a+$b ))" "
echo "Arg$i: $a"
done

echo "Arg$i: $b"
string=$string$(( $b+$1 ))
echo $string
