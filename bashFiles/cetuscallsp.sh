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
${CETUS} ${TECHNIQUES} ${FILE_NAME3}.c add.c adi.c error.c exact_rhs.c exact_solution.c initialize.c ninvr.c pinvr.c rhs.c set_constants.c sp.c txinvr.c tzetar.c verify.c x_solve.c y_solve.c z_solve.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
cp cetus_output/sp.c cetus_sp.c
cp cetus_output/add.c cetus_add.c
cp cetus_output/adi.c cetus_adi.c
cp cetus_output/error.c cetus_error.c
cp cetus_output/exact_rhs.c cetus_exact_rhs.c
cp cetus_output/exact_solution.c cetus_exact_solution.c
cp cetus_output/initialize.c cetus_initialize.c
cp cetus_output/ninvr.c cetus_ninvr.c
cp cetus_output/pinvr.c cetus_pinvr.c
cp cetus_output/rhs.c cetus_rhs.c
cp cetus_output/set_constants.c cetus_set_constants.c
cp cetus_output/txinvr.c cetus_txinvr.c
cp cetus_output/tzetar.c cetus_tzetar.c
cp cetus_output/verify.c  cetus_verify.c
cp cetus_output/x_solve.c  cetus_x_solve.c
cp cetus_output/y_solve.c  cetus_y_solve.c 
cp cetus_output/z_solve.c cetus_z_solve.c
gcc -O3 -fopenmp -mcmodel=large -o final cetus_${FILE_NAME3}.c cetus_add.c cetus_adi.c cetus_error.c cetus_exact_rhs.c cetus_exact_solution.c cetus_initialize.c cetus_ninvr.c  cetus_pinvr.c cetus_rhs.c cetus_set_constants.c cetus_txinvr.c cetus_tzetar.c cetus_verify.c cetus_x_solve.c cetus_y_solve.c cetus_z_solve.c  ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
./final | grep 'Time in seconds ='>> $F_LOG
echo "-----------" >> $F_LOG