#!/bin/bash
# This code is written by Reddit user "shrewm".

F=();IFS=+,;
for n in $(<inputexample.txt)
do
    ((F[n]++))
done
for i in {7..24}
do
    ((F[i%9]+=F[(i+2)%9]))
done
echo $((${F[*]}))