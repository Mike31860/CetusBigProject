#!/bin/bash
BENCH_NAME=$1
FILE_NAME=$2
F_LOG=$PWD/logFiles/log_${FILE_NAME}_.txt 
echo "hey" >> $F_LOG
cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
gcc -O3 -fopenmp -mcmodel=large -o luisa cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
./luisa | grep 'Time in seconds ='>> $F_LOG
echo "fin" >> $F_LOG