#!/bin/bash

input=$(cat input.txt)
IFS=,
read -a states <<< $input
for (( i=1; i<=80; i++ ))
do
    statelen=${#states[@]}
    echo "$i"
    for (( j=0; j<statelen; j++ ))
    do
        if [ "${states[j]}" -eq 0 ]
        then
            states[$j]=6
            states+=(8)
        else
            states[$j]=$((${states[j]}-1))
        fi
    done
done
echo "${#states[@]}"