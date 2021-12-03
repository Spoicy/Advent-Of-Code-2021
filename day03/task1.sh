#!/bin/bash

zeroarray=()
onearray=()
declare -i bit=0
gamma=0
epsilon=0
while read line
do
    len=$((${#line}-1))
    if [ ${#zeroarray[@]} -eq 0 ]; then
        for (( i=0; i<len; i++ ))
        do
            zeroarray[i]=0
            onearray[i]=0
        done
    fi
    for (( i=0; i<len; i++ ))
    do
        bit=${line:i:1}
        if [ "$bit" -eq 0 ]
        then
            zeroarray[i]=$((${zeroarray[$i]}+1))
        else
            onearray[i]=$((${onearray[$i]}+1))
        fi
    done
done < 'input.txt'
for (( i=0; i<len; i++ ))
do
    power=$((2**(len-i-1)))
    if [ "${zeroarray[i]}" -gt "${onearray[i]}" ]
    then
        epsilon=$((epsilon+power))
    else
        gamma=$((gamma+power))
    fi
done
echo "$((gamma*epsilon))"