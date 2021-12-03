#!/bin/bash

zero=0
one=0
declare -i oxygen=0
declare -i co=0
declare -i bit=0
inputarray=()
while read line
do
    inputarray+=("$line")
done < 'input.txt'
len=$((${#inputarray[0]}-1))
mostarray=("${inputarray[@]}")
leastarray=("${inputarray[@]}")
tempzero=()
tempone=()
for (( i=0; i<len; i++ ))
do
    for (( j=0; j<${#mostarray[@]}; j++ ))
    do
        bitset=${mostarray[j]}
        bit=${bitset:i:1}
        if [ "$bit" -eq 0 ]
        then
            tempzero+=("${mostarray[j]}")
        else
            tempone+=("${mostarray[j]}")
        fi
    done
    if [ "${#tempzero[@]}" -gt "${#tempone[@]}" ]
    then
        mostarray=("${tempzero[@]}")
    else
        mostarray=("${tempone[@]}")
    fi
    tempzero=()
    tempone=()
    for (( j=0; j<${#leastarray[@]}; j++ ))
    do
        bitset=${leastarray[j]}
        bit=${bitset:i:1}
        if [ "$bit" -eq 0 ]
        then
            tempzero+=("${leastarray[j]}")
        else
            tempone+=("${leastarray[j]}")
        fi
    done
    if [ "${#tempzero[@]}" -lt "${#tempone[@]}" ]
    then
        if [ "${#tempzero[@]}" -eq 0 ]
        then
            leastarray=("${tempone[@]}")
        else
            leastarray=("${tempzero[@]}")
        fi
    else
        if [ "${#tempone[@]}" -eq 0 ] || [ "${#tempzero[@]}" -eq "${#tempone[@]}" ]
        then
            leastarray=("${tempzero[@]}")
        else
            leastarray=("${tempone[@]}")
        fi
    fi
    tempzero=()
    tempone=()
done
for (( i=0; i<len; i++ ))
do
    power=$((2**(len-i-1)))
    bitset=${mostarray[0]}
    bit=${bitset:i:1}
    oxygen=$((oxygen+(power*bit)))
    bitset=${leastarray[0]}
    bit=${bitset:i:1}
    co=$((co+(power*bit)))
done
echo "$((oxygen*co))"