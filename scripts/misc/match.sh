#!/bin/bash
v='~`!@#$%^&*()_-+=:;{[}]|/<>,."'
echo type any character and press enter
IFS= read -r a
[[ $v =~ "$a" ]] && echo match || echo not
