#!/bin/bash
cd SNU_NPB-1.0.3/NPB3.3-SER-C
BENCH_NAME=$1
FILE_NAME3=$2
INFO=$3
cd ${BENCH_NAME}
F_LOG=$PWD/logFiles/log_infoG_${FILE_NAME3}_.txt 
echo "-----------" >> $F_LOG
echo $INFO >> $F_LOG
echo "-----------" >> $F_LOG
log_infoG_