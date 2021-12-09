#!/bin/bash

numbers=""
bingotemp=""
declare -i bingocount=0
declare -i i=0
declare -i start=0
declare -i tempint=0
bingocards=()
while read line
do
    if [ -z "$numbers" ]
    then
        numbers=${line::-1}
    elif [ "$start" -eq 0 ]
    then
        start=1
    elif [ "$bingocount" -lt 5 ]
    then
        set - $line
        last=$5
        bingotemp+="$1:0:$2:0:$3:0:$4:0:${last::-1}:0"
        if [ "$bingocount" -lt 4 ]
        then
            bingotemp+=":"
        else
            bingotemp+=",0"
        fi
        bingocount=$((bingocount + 1))
    else
        bingocards[i]="$bingotemp"
        bingotemp=""
        bingocount=0
        ((i+=1))
    fi
done < 'input.txt'
IFS=,
read -a numberarray <<< $numbers
len=${#numberarray[@]}
win=0
sum=0
declare -i bingopos=0
declare -i bingoposcount=0
declare -i bingocardlast=0
declare -i bingolen=0
bingotemp=""
for (( i=0; i<len; i++ ))
do
    number=${numberarray[i]}
    bingolen=${#bingocards[@]}
    if [ "$bingoposcount" -eq "$bingolen" ]
    then
        IFS=:
        read -a bingoarr <<< ${bingocards[bingocardlast]}
        IFS=,
        read -a bingolast <<< ${bingoarr[49]}
        bingoarr[49]=${bingolast[0]}
        bingopos=${bingolast[1]}
        for (( l=0; l<49; l+=2 ))
        do
            setcheck=$((l+1))
            if [ "${bingoarr[setcheck]}" -eq 0 ]
            then
                sum=$((sum+${bingoarr[l]}))
            fi
        done
        break
    fi

    for (( j=0; j<bingolen; j++ ))
    do  
        IFS=:
        read -a bingoarr <<< ${bingocards[j]}
        IFS=,
        read -a bingolast <<< ${bingoarr[49]}
        bingoarr[49]=${bingolast[0]}
        bingopos=${bingolast[1]}
        if [ "$bingopos" -gt 0 ]
        then
            continue
        fi
        for (( k=0; k<49; k+=2 ))
        do
            tempint="${bingoarr[k]}"
            if [ "$tempint" -eq "$number" ]
            then
                check=$((k+1))
                bingoarr[${check}]=1
                for (( l=0; l<49; l+=2 ))
                do
                    rebuildcheck=$((l+1))
                    bingotemp+="${bingoarr[l]}:${bingoarr[rebuildcheck]}:"
                done
                bingotemp=${bingotemp::-1}
                bingotemp+=",${bingopos}"
                bingocards[${j}]=${bingotemp}
                bingotemp=""
                if [ "$i" -gt 3 ]
                then
                    IFS=:
                    read -a bingoarr <<< ${bingocards[j]}
                    IFS=,
                    read -a bingolast <<< ${bingoarr[49]}
                    bingoarr[49]=${bingolast[0]}
                    for (( l=0; l<5; l++ ))
                    do
                        hori=$((10*l))
                        hori1=$((hori+1))
                        hori2=$((hori+3))
                        hori3=$((hori+5))
                        hori4=$((hori+7))
                        hori5=$((hori+9))
                        vert=$((2*l))
                        vert1=$((vert+1))
                        vert2=$((vert+11))
                        vert3=$((vert+21))
                        vert4=$((vert+31))
                        vert5=$((vert+41))
                        if [ "${bingoarr[hori1]}" -eq 1 ] && [ "${bingoarr[hori2]}" -eq 1 ] && [ "${bingoarr[hori3]}" -eq 1 ] && [ "${bingoarr[hori4]}" -eq 1 ] && [ "${bingoarr[hori5]}" -eq 1 ]
                        then
                            win=1
                        elif [ "${bingoarr[vert1]}" -eq 1 ] && [ "${bingoarr[vert2]}" -eq 1 ] && [ "${bingoarr[vert3]}" -eq 1 ] && [ "${bingoarr[vert4]}" -eq 1 ] && [ "${bingoarr[vert5]}" -eq 1 ]
                        then
                            win=1
                        fi
                    done
                    if [ "$win" -eq 1 ]
                    then
                        for (( l=0; l<49; l+=2 ))
                        do
                            rebuildcheck=$((l+1))
                            bingotemp+="${bingoarr[l]}:${bingoarr[rebuildcheck]}:"
                        done
                        ((bingoposcount+=1))
                        bingopos=${bingoposcount}
                        bingotemp=${bingotemp::-1}
                        bingotemp+=",${bingopos}"
                        bingocards[$j]=${bingotemp}
                        win=0
                        bingocardlast=${j}
                    fi
                fi
                bingotemp=""
                break
            fi
        done
    done
    lastnum="$number"
done
echo "$sum $lastnum"
echo "$((sum*lastnum))"