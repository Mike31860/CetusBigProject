#!/bin/bash
FILE_NAME3=$2
F_LOG=$PWD/logFiles/log_${FILE_NAME3}_.txt 
first=$(./output | grep 'Time in seconds =')
second=$(./output | grep 'Time in seconds =')
third=$(./output | grep 'Time in seconds =')
fourt=$(./output | grep 'Time in seconds =')
five=$(./output | grep 'Time in seconds =')
six=$(./output | grep 'Time in seconds =')
IFS=' '
read -ra arr1 <<< "$first"
read -ra arr2 <<< "$second"
read -ra arr3 <<< "$third"
read -ra arr4 <<< "$fourt"
read -ra arr5 <<< "$five"
read -ra arr6 <<< "$six"
sum=$(bc<<<"scale=2;${arr1[4]}+${arr2[4]}+${arr3[4]}+${arr4[4]}+${arr5[4]}+${arr6[4]}")
average=$(bc<<< "scale=2;$sum/6")
echo "Time one = ${arr1[4]} Time two =${arr2[4]} Time Three = ${arr3[4]} Time Fourt = ${arr4[4]} Time Five = ${arr5[4]} Time Six = ${arr6[4]}">> $F_LOG
echo "Time in seconds = $average" >> $F_LOG

