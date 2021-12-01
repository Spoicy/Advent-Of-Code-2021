#!/bin/bash

declare -i curinput=0
declare -i previnput=-1
declare -i incre=0
while read line
do
    curinput=$line
    if [ "$previnput" -eq -1 ]
    then
        previnput=curinput
        continue
    fi
    if [ "$curinput" -gt "$previnput" ]
    then
        ((incre+=1))
    fi
    previnput=curinput
done < 'input.txt'
echo $incre
