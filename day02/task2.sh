#!/bin/bash

depth=0
hori=0
aim=0
while read line
do
    set - $line
    if [ $1 = 'forward' ]
    then
        hori=$(($hori+$2))
        depth=$(($depth+($aim*$2)))
    elif [ $1 = 'down' ]
    then
        aim=$(($aim+$2))
    else
        aim=$(($aim-$2))
    fi
done < 'input.txt'
echo $((depth*hori))