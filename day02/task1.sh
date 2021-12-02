#!/bin/bash

depth=0
hori=0
while read line
do
    set - $line
    if [ $1 = 'forward' ]
    then
        hori=$(($hori+$2))
    elif [ $1 = 'down' ]
    then
        depth=$(($depth+$2))
    else
        depth=$(($depth-$2))
    fi
done < 'input.txt'
echo $((depth*hori))