#!/bin/bash

# Progress Emulation
emu() {
printf "  "
sleep 0.1

for i in P a r s i n g . . .; do
printf $i
sleep 0.1
done

sleep 1 &
pid=$!
frames="/ | \\ -"

while kill -0 $pid >/dev/null 2>&1; do

for frame in $frames; do
printf "\r$frame "
sleep 0.1
done
done
printf "\n"
}

parse() {

# Preprocessing
wiki_url="http://en.wikipedia.org/wiki/"
wiki_html="wiki-"

# 10 Headliners
words=$(curl -Ls $1 | grep -oP '<(h[1-9])(?:\s[^>]*)?>\K.*?(?=</(h[1-9])>)' | grep -oE '[a-zA-Z]{10,}' | sort | uniq -i | head -n 10)

for word in $words; do
echo $word
curl -Ls "$wiki_url$word" > "$wiki_html$word.html"
emu
done

}

# Driver
parse $1
