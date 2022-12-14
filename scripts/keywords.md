How to remove a record with grep

    grep -F -v test example.txt > example.txt.tmp && mv example.txt.tmp example.txt && rm example.txt.tmp
    also sed
    sed -i '/test/d' example.txt

get execution time

    start=`date +%s`
    stuff
    end=`date +%s`

    runtime=$(($end-$start))

environment variables

    env 
    printenv
    export

ssh-key

    ssh-keygen
    ssh-keygen -t ed25519 -C "your_email@example.com"
    ssh-agent -s
    ssh-add ~/.ssh/id_ed25519
    ssh

Shebang

    #!/bin/bash 
    #!/bin/env python3 

echo {x{y,z}

    xy
    xz

cut

    cut -d: -f1 text.txt
    cut -c 1-10 text.txt
    You can revert the string and then print 1st character. Itself cut can't work from backwards.
    echo "Your string ABC" | rev | cut -c 1

echo -e

    allows using "\n"

head
    
    first 10 lines of a file

tail

    last 10 lines

uniq

    prints duplicate lines
    uniq -D uniq_test.txt

export

    exports vars to env
    works with printenv

fi

    used to finalize if

continue

    skips an indice in loop

let

    let d=a+b
    same as
    d=$((a+b))

**

    exponentiation

(( $a<3?50:$a>600 ))

    if $a < 3 it gives 50

alias

    ll is alias for ls -l

bind

    bind is a builtin command of the Bash shell. You can use it to change how bash responds to keys

eval

    eval $(echo "ls") gives ls command

expr

    expr $a + $b

cat

    read & write to file(s)
    heredoc

a valid variable in bash

    no spaces in names

$#

    num of arguments

$@

    array of arguments

$!

    PID of a process in background

$*

    array 
    set -- "arg  1" "arg  2" "arg  3"

    for word in $*; do echo "$word"; done
    arg
    1
    arg
    2
    arg
    3

    for word in $@; do echo "$word"; done
    arg
    1
    arg
    2
    arg
    3

    for word in "$*"; do echo "$word"; done
    arg  1 arg  2 arg  3

    for word in "$@"; do echo "$word"; done
    arg  1
    arg  2
    arg  3

    $* 	$1 $2 $3 … ${N}
    $@ 	$1 $2 $3 … ${N}
    "$*" 	"$1c$2c$3c…c${N}"
    "$@" 	"$1" "$2" "$3" … "${N}"

$0

    outputs script name

$$

    $$ is the process ID (PID) of the script

Bash functions and its params

    function fubction1 {
    echo "function"
    }
    function1
    gives function

read

    reads input

“” ‘’ ``

    "$a" `$a` - result
    '$a' - string $a

arrays in bash

    array=($a $b $c)

    ${array[@]}
    arr=() 	Create an empty array
    arr=(1 2 3) 	Initialize array
    ${arr[2]} 	Retrieve third element
    ${arr[@]} 	Retrieve all elements
    ${!arr[@]} 	Retrieve array indices
    ${#arr[@]} 	Calculate array size
    arr[0]=3 	Overwrite 1st element
    arr+=(4) 	Append value(s)
    str=$(ls) 	Save ls output as a string
    arr=( $(ls) ) 	Save ls output as an array of files
    ${arr[@]:s:n} 	Retrieve n elements starting at index s

readonly var

    readonly PI=3.14
    unset PI
    -bash: unset: PI: cannot unset: readonly variable
    cat << EOF| sudo gdb
    attach $$
    call unbind_variable("PI")
    detach
    EOF
    echo $PI

++ -- %

    ++ incr -- decr % (modulo)

$( ... )

    var

a = $b + 10

    string $b+10

UID, $UID

    user id

#!ls

    ls
    ...

${list[-1]}

    last array elemen
    set unset
    var

ping exit codes

    Success: code 0
    No reply: code 1
    Other errors: code 2

echo -n

    string

1>&2 STDOUT STDERR STDIN
    
    STDOUT > STDERR
