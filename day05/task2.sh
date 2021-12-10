#!bin/bash

mainarray=()
boardsize=1000
count=0
declare -i start1=0
declare -i start2=0
declare -i end1=0
declare -i end2=0
declare -i tempint=0
declare -i diaglim=0
for (( i=0; i<boardsize; i++ ))
do
    for (( j=0; j<boardsize; j++ ))
    do
        mainarray[$i]+="0"
    done
done
while read line
do
    IFS=-
    set - $line
    start=$1
    start=${start::-1}
    end=$2
    end=${end:2:-1}
    IFS=,
    set - $start
    start1=$1
    start2=$2
    set - $end
    end1=$1
    end2=$2
    if [ "$start1" -eq "$end1" ]
    then
        if [ "$end2" -gt "$start2" ]
        then
            for (( i=$start2; i<=$end2; i++ ))
            do
                tempint=${mainarray[i]:start1:1}
                if [ "$tempint" -lt 9 ]
                then
                    ((tempint+=1))
                    charafter=$(($start1+1))
                    charend=$(($boardsize-$charafter))
                    mainarray[$i]=${mainarray[i]:0:start1}$tempint${mainarray[i]:charafter:charend}
                fi
            done
        else
            for (( i=$start2; i>=$end2; i-- ))
            do
                tempint=${mainarray[i]:start1:1}
                if [ "$tempint" -lt 9 ]
                then
                    ((tempint+=1))
                    charafter=$(($start1+1))
                    charend=$(($boardsize-$charafter))
                    mainarray[$i]=${mainarray[i]:0:start1}$tempint${mainarray[i]:charafter:charend}
                fi
            done
        fi
    elif [ "$start2" -eq "$end2" ]
    then
        if [ "$end1" -gt "$start1" ]
        then
            for (( i=$start1; i<=$end1; i++ ))
            do
                tempint=${mainarray[start2]:i:1}
                if [ "$tempint" -lt 9 ]
                then
                    ((tempint+=1))
                    charafter=$(($i+1))
                    charend=$(($boardsize-$charafter))
                    mainarray[$start2]=${mainarray[start2]:0:i}$tempint${mainarray[start2]:charafter:charend}
                fi
            done
        else
            for (( i=$start1; i>=$end1; i-- ))
            do
                tempint=${mainarray[start2]:i:1}
                if [ "$tempint" -lt 9 ]
                then
                    ((tempint+=1))
                    charafter=$(($i+1))
                    charend=$(($boardsize-$charafter))
                    mainarray[$start2]=${mainarray[start2]:0:i}$tempint${mainarray[start2]:charafter:charend}
                fi
            done
        fi
    else
        if [ "$end1" -gt "$start1" ]
        then
            diaglim=$(($end1-$start1))
            if [ "$end2" -gt "$start2" ]
            then
                for (( i=0; i<=$diaglim; i++ ))
                do
                    curx=$(($start1+$i))
                    cury=$(($start2+$i))
                    tempint=${mainarray[cury]:curx:1}
                    if [ "$tempint" -lt 9 ]
                    then
                        ((tempint+=1))
                        charafter=$(($curx+1))
                        charend=$(($boardsize-$charafter))
                        mainarray[$cury]=${mainarray[cury]:0:curx}$tempint${mainarray[cury]:charafter:charend}
                    fi
                done
            else
                for (( i=0; i<=$diaglim; i++ ))
                do
                    curx=$(($start1+$i))
                    cury=$(($start2-$i))
                    tempint=${mainarray[cury]:curx:1}
                    if [ "$tempint" -lt 9 ]
                    then
                        ((tempint+=1))
                        charafter=$(($curx+1))
                        charend=$(($boardsize-$charafter))
                        mainarray[$cury]=${mainarray[cury]:0:curx}$tempint${mainarray[cury]:charafter:charend}
                    fi
                done
            fi
        else
            diaglim=$(($start1-$end1))
            if [ "$end2" -gt "$start2" ]
            then
                for (( i=0; i<=$diaglim; i++ ))
                do
                    curx=$(($start1-$i))
                    cury=$(($start2+$i))
                    tempint=${mainarray[cury]:curx:1}
                    if [ "$tempint" -lt 9 ]
                    then
                        ((tempint+=1))
                        charafter=$(($curx+1))
                        charend=$(($boardsize-$charafter))
                        mainarray[$cury]=${mainarray[cury]:0:curx}$tempint${mainarray[cury]:charafter:charend}
                    fi
                done
            else
                for (( i=0; i<=$diaglim; i++ ))
                do
                    curx=$(($start1-$i))
                    cury=$(($start2-$i))
                    tempint=${mainarray[cury]:curx:1}
                    if [ "$tempint" -lt 9 ]
                    then
                        ((tempint+=1))
                        charafter=$(($curx+1))
                        charend=$(($boardsize-$charafter))
                        mainarray[$cury]=${mainarray[cury]:0:curx}$tempint${mainarray[cury]:charafter:charend}
                    fi
                done
            fi
        fi
    fi
done < 'input.txt'
for (( i=0; i<boardsize; i++ ))
do
    for (( j=0; j<boardsize; j++ ))
    do
        tempint=${mainarray[i]:j:1}
        if [ "$tempint" -gt 1 ]
        then
            ((count+=1))
        fi
    done
done
echo "$count"