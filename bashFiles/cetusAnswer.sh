#!/bin/bash
cd SNU_NPB-1.0.3/NPB3.3-SER-C
BENCH_NAME=$1
FILE_NAME3=$2
ANSWER=$3
cd ${BENCH_NAME}
F_LOG=$PWD/logFiles/log_${FILE_NAME3}_.txt 
echo "----ANSWER-----" >> $F_LOG
echo $ANSWER >> $F_LOG
echo "----ANSWER-----" >> $F_LOG