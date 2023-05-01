#!/bin/bash
CETUS=$PWD/cetus-1.4.4/bin/cetus
cd ..
GIT_DIR=$PWD
echo $GIT_DIR
BENCH_DIR=$GIT_DIR/SNU_NPB-1.0.3/NPB3.3-SER-C
BENCH_NAME=CG
FILE_NAME=cg
BENCH_CLASS=A
N_PAR=1
N_ITER=3
F_LOG=$GIT_DIR/logFiles/log${BENCH_NAME}_${BENCH_CLASS}p${N_PAR}i${N_ITER}.txt
printf "" > $F_LOG
TIMEFORMAT='%E';
cd ${BENCH_DIR}/${BENCH_NAME}
make CLASS=${BENCH_CLASS}
(echo "Benchmark = ${BENCH_NAME}, Class = ${BENCH_CLASS}") >>$F_LOG
#compile and run input file
(echo -n 'InputFile Compilation Time = ') >>$F_LOG
(time make cetusIn) 2>>$F_LOG
#(echo -n 'InputFile Execution Time = ') >>$F_LOG
#(time ./cetusIn_${FILE_NAME}.o) 2>>$F_LOG
#loop noTest for each command

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "alias=0,${i},")>>$
		./outputA//cetus_${FILE_NAME}_alias=0_${i}.o > $F_LOG
		#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

fi