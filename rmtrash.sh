#!/bin/bash

if [[ ! -e "$PWD/.rmtrash.log" ]]
then
echo 1 > "$PWD/.rmtrash.log"
fi

if [[ $# -gt 1 ]]
then
echo "Wrong amount of arguments. Had to be 1."
exit 1
fi


if [[ ! -f $1 ]]
then
echo "$1: File don't exist"
exit 1
fi


dir="$HOME/.trash"
dir_log="$HOME/.trash.log"
if [[ ! -d $dir ]]
then
mkdir "$dir"
fi


numberOfLinks=$(cat "$PWD/.rmtrash.log")
ln "$PWD/$1" "$dir/$numberOfLinks"
tmp="$PWD/$1"
tmp_ln="$dir/$numberOfLinks"
touch "$tmp_ln"
(( numberOfLinks=numberOfLinks+1 ))
echo "$numberOfLinks" > "$PWD/.rmtrash.log"
rm "$tmp"
