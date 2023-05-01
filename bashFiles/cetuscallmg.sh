#!/bin/bash
CETUS=$PWD/bashFiles/cetus-1.4.4/bin/cetus
cd SNU_NPB-1.0.3/NPB3.3-SER-C
BENCH_NAME=$1
FILE_NAME3=$2
TECHNIQUES=$3
cd ${BENCH_NAME}
F_LOG=$PWD/logFiles/log_${FILE_NAME3}_.txt 
echo "-----------" >> $F_LOG
echo $TECHNIQUES >> $F_LOG
${CETUS} ${TECHNIQUES} ${FILE_NAME3}.c  ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
cp cetus_output/mg.c cetus_mg.c
gcc -O3 -fopenmp -mcmodel=large -o output cetus_mg.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
./output | grep 'Time in seconds ='>> $F_LOG
echo "-----------" >> $F_LOG