#!/bin/bash
CETUS=$PWD/cetus-1.4.4/bin/cetus
cd ..
GIT_DIR=$PWD
echo $GIT_DIR
BENCH_DIR=$GIT_DIR/SNU_NPB-1.0.3/NPB3.3-SER-C
BENCH_NAME=$1
FILE_NAME=$(echo $BENCH_NAME | tr '[:upper:]' '[:lower:]')
BENCH_CLASS=$2
N_PAR=1
N_ITER=3
F_LOG=$GIT_DIR/logFiles/log${BENCH_NAME}_${BENCH_CLASS}p${N_PAR}i${N_ITER}.txt
printf "" > $F_LOG
TIMEFORMAT='%E';
cd ${BENCH_DIR}/${BENCH_NAME}
#make CLASS=${BENCH_CLASS}
(echo "Benchmark = ${BENCH_NAME}, Class = ${BENCH_CLASS}") >>$F_LOG
#compile and run input file
#(echo -n 'InputFile Compilation Time = ') >>$F_LOG
#(time make cetusIn) 2>>$F_LOG
(echo -n 'InputFile Execution Time = ') >>$F_LOG
#(time ./cetusIn_${FILE_NAME}.o) 2>>$F_LOG
(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_no) 2>> $F_LOG
#loop noTest for each command


	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "alias=0,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=0_${i}) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done

	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "alias=1,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=1_${i}) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done

	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "ddt=1,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=1_${i}) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "ddt=2,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=2_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "parallelize-loops=0,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_parallelize-loops=0_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "parallelize-loops=1,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_parallelize-loops=1_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "privatize=0,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=0_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "privatize=1,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=1_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done	
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "privatize=2,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=2_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done	
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "range=0,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_range=0_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "range=1,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_range=1_${i}) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "range=2,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_range=2_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "reduction=0,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=0_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "reduction=1,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=1_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "reduction=2,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=2_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "induction=0,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=0,_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "induction=1,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=1,_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "induction=2,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=2,_${i}) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "induction=3,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=3,_${i}) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done	
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "normalize-loops=0,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_normalize-loops=0,_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "normalize-loops=1,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_normalize-loops=1,_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "profitable-omp=0,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=0,_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done
	for ((i=1; i<=${N_ITER}; i++))
		do
			(echo -n "profitable-omp=1,${i},")>>$F_LOG
			(time ./output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=1,_${i} ) 2>> $F_LOG
			#(time ./output/cetus_${FILE_NAME}_alias=0_${i}.o) 2>>$F_LOG
			sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
			echo "<----------------------------->"
		done													
											
													
								


	