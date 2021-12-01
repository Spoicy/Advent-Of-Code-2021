#!/bin/bash

inputarray=()
declare -i curinput=0
declare -i previnput=-1
incre=0
while read line
do
    inputarray+=("$line")
done < 'input.txt'
inputlen=${#inputarray[@]}
for (( n=0; n<$inputlen-2; n++ ))
do
    ((curinput=inputarray[n]+inputarray[n+1]+inputarray[n+2]))
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
done
echo $incre
