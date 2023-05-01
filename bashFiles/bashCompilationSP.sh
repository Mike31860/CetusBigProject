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
N_ITER=5
TIMEFORMAT='%E';
cd ${BENCH_DIR}/${BENCH_NAME}
make CLASS=${BENCH_CLASS}

if [ ${BENCH_NAME} = "EP" ] 
	then
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -alias=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_ep.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=0_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -alias=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_ep.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=1_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -alias=2 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=2_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -alias=3 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=3_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -ddt=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=0_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -ddt=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=1_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -ddt=2 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=2_${i}
				echo "<----------------------------->"
			done					
				
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -parallelize-loops=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_parallelize-loops=0_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -parallelize-loops=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_parallelize-loops=1_${i}
				echo "<----------------------------->"
			done	
 
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -privatize=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=0_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -privatize=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=1_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -privatize=2 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=2_${i}
				echo "<----------------------------->"
			done	
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -range=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_range=0_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -range=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_range=1_${i}
				echo "<----------------------------->"
			done
		
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -range=2 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_range=2_${i}
				echo "<----------------------------->"
			done					


		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -reduction=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=0_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -reduction=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=1_${i}
				echo "<----------------------------->"
			done

		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -reduction=2 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=2_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -induction=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=0_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -induction=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=1_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -induction=2 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=2_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -induction=3 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=3_${i}
				echo "<----------------------------->"
			done
		
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -normalize-loops=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_normalize-loops=0_${i}
				echo "<----------------------------->"
			done 
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -normalize-loops=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_normalize-loops=1_${i}
				echo "<----------------------------->"
			done 
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -profitable-omp=0  ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=0_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -profitable-omp=1  ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=1_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -profitable-omp=2  ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=2_${i}
				echo "<----------------------------->"
			done 	







elif [ ${BENCH_NAME} = "IS" ] 
	then
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -alias=1 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=1_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -alias=2 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=2_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -alias=3 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=3_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -ddt=0 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=0_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -ddt=1 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=1_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -ddt=2 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=2_${i}
				echo "<----------------------------->"
			done					
				
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -parallelize-loops=0 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_parallelize-loops=0_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -parallelize-loops=1 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_parallelize-loops=1_${i}
				echo "<----------------------------->"
			done	
 
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -privatize=0 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=0_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -privatize=1 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=1_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -privatize=2 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=2_${i}
				echo "<----------------------------->"
			done	
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -range=0 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_range=0_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -range=1 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_range=1_${i}
				echo "<----------------------------->"
			done
		
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -range=2 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_range=2_${i}
				echo "<----------------------------->"
			done					


		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -reduction=0 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=0_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -reduction=1 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=1_${i}
				echo "<----------------------------->"
			done

		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -reduction=2 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=2_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -induction=0 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=0_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -induction=1 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=1_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -induction=2 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=2_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -induction=3 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=3_${i}
				echo "<----------------------------->"
			done
		
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -normalize-loops=0 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_normalize-loops=0_${i}
				echo "<----------------------------->"
			done 
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -normalize-loops=1 ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_normalize-loops=1_${i}
				echo "<----------------------------->"
			done 
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -profitable-omp=0  ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=0_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -profitable-omp=1  ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=1_${i}
				echo "<----------------------------->"
			done
		for ((i=1; i<=${N_ITER}; i++))
			do
				${CETUS} -profitable-omp=2  ${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c
				cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c	
				gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/c_print_results.c ../common/c_timers.c ../common/wtime.c -lm
				mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=2_${i}
				echo "<----------------------------->"
			done 							

				

elif [ ${BENCH_NAME} = "BT" ] 
	then
			${CETUS} ${FILE_NAME}.c  initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
			cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c		
			cp cetus_output/add.c cetus_add.c
			cp cetus_output/adi.c cetus_adi.c
			cp cetus_output/error.c cetus_error.c
			cp cetus_output/exact_rhs.c cetus_exact_rhs.c
			cp cetus_output/exact_solution.c cetus_exact_solution.c
			cp cetus_output/initialize.c cetus_initialize.c
			cp cetus_output/rhs.c cetus_rhs.c
			cp cetus_output/set_constants.c cetus_set_constants.c
			cp cetus_output/solve_subs.c cetus_solve_subs.c
			cp cetus_output/verify.c  cetus_verify.c
			cp cetus_output/x_solve.c  cetus_x_solve.c
			cp cetus_output/y_solve.c  cetus_y_solve.c 
			cp cetus_output/z_solve.c cetus_z_solve.c
			#sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
			gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
			mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_no
			echo "<----------------------------->"

			for ((i=1; i<=${N_ITER}; i++))
				do
				
					${CETUS} -alias=2 ${FILE_NAME}.c initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -alias=1  ${FILE_NAME}.c   initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=1_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -alias=3 ${FILE_NAME}.c  initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=3_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -ddt=0  ${FILE_NAME}.c  initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -ddt=1  ${FILE_NAME}.c initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=1_${i}
					echo "<----------------------------->"
				done		
			for ((i=1; i<=${N_ITER}; i++))
				do  
					${CETUS} -ddt=2  ${FILE_NAME}.c  initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=2_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -parallelize-loops=0 ${FILE_NAME}.c  bt.c  initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_parallelize-loops=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -parallelize-loops=1 ${FILE_NAME}.c bt.c  initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_parallelize-loops=1_${i}
					echo "<----------------------------->"
				done						
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -privatize=0   ${FILE_NAME}.c initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -privatize=1 ${FILE_NAME}.c bt.c  initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=1_${i}
					echo "<----------------------------->"
				done			
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -privatize=2  ${FILE_NAME}.c bt.c  initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=2_${i}
					echo "<----------------------------->"
				done

			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -range=0  ${FILE_NAME}.c bt.c  initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_range=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -range=1 ${FILE_NAME}.c initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_range=1_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -range=2  ${FILE_NAME}.c bt.c  initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_range=2_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -reduction=0  ${FILE_NAME}.c bt.c  initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -reduction=1  ${FILE_NAME}.c initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=1_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
				${CETUS} -reduction=2  ${FILE_NAME}.c initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=2_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -induction=0  ${FILE_NAME}.c initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -induction=1   ${FILE_NAME}.c initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=1_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -induction=2  ${FILE_NAME}.c  initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.cgcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lmgcc -O3 -fopenmp -mcmodel=large -o output bt.c initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=2_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -induction=3  ${FILE_NAME}.c  initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=3_${i}
					echo "<----------------------------->"
				done	
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -normalize-loops=0  ${FILE_NAME}.c  initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_normalize-loops=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -normalize-loops=1  ${FILE_NAME}.c  initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_normalize-loops=1_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -profitable-omp=0  ${FILE_NAME}.c initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -profitable-omp=1  ${FILE_NAME}.c initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=1_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -profitable-omp=2  ${FILE_NAME}.c  initialize.c exact_solution.c exact_rhs.c set_constants.c adi.c  rhs.c x_solve.c y_solve.c solve_subs.c z_solve.c add.c error.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/add.c cetus_add.c
					cp cetus_output/adi.c cetus_adi.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/exact_rhs.c cetus_exact_rhs.c
					cp cetus_output/exact_solution.c cetus_exact_solution.c
					cp cetus_output/initialize.c cetus_initialize.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/set_constants.c cetus_set_constants.c
					cp cetus_output/solve_subs.c cetus_solve_subs.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_bt.c  cetus_initialize.c cetus_exact_solution.c cetus_exact_rhs.c cetus_set_constants.c cetus_adi.c  cetus_rhs.c cetus_x_solve.c cetus_y_solve.c cetus_solve_subs.c cetus_z_solve.c cetus_add.c cetus_error.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=2_${i}
					echo "<----------------------------->"
				done

elif [ ${BENCH_NAME} = "LU" ] 
	then
			
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -profitable-omp=1 lu.c read_input.c domain.c setcoeff.c setbv.c exact.c setiv.c erhs.c ssor.c rhs.c l2norm.c jacld.c blts.c jacu.c buts.c error.c pintgr.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/read_input.c cetus_read_input.c
					cp cetus_output/domain.c cetus_domain.c
					cp cetus_output/setcoeff.c cetus_setcoeff.c
					cp cetus_output/setbv.c cetus_setbv.c
					cp cetus_output/exact.c cetus_exact.c
 	                cp cetus_output/setiv.c cetus_setiv.c
					cp cetus_output/erhs.c cetus_erhs.c
					cp cetus_output/ssor.c cetus_ssor.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/l2norm.c  cetus_l2norm.c
					cp cetus_output/jacld.c  cetus_jacld.c
					cp cetus_output/blts.c  cetus_blts.c 
					cp cetus_output/jacu.c cetus_jacu.c
					cp cetus_output/buts.c cetus_buts.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/pintgr.c cetus_pintgr.c
					cp cetus_output/verify.c cetus_verify.c
					gcc -O3 -fopenmp -mcmodel=large -o output ccetus_lu.c cetus_read_input.c cetus_domain.c cetus_setcoeff.c cetus_setbv.c cetus_exact.c cetus_setiv.c cetus_erhs.c cetus_ssor.c cetus_rhs.c cetus_l2norm.c cetus_jacld.c cetus_blts.c cetus_jacu.c cetus_buts.c cetus_error.c cetus_pintgr.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=1_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -profitable-omp=2 lu.c read_input.c domain.c setcoeff.c setbv.c exact.c setiv.c erhs.c ssor.c rhs.c l2norm.c jacld.c blts.c jacu.c buts.c error.c pintgr.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/read_input.c cetus_read_input.c
					cp cetus_output/domain.c cetus_domain.c
					cp cetus_output/setcoeff.c cetus_setcoeff.c
					cp cetus_output/setbv.c cetus_setbv.c
					cp cetus_output/exact.c cetus_exact.c
 	                cp cetus_output/setiv.c cetus_setiv.c
					cp cetus_output/erhs.c cetus_erhs.c
					cp cetus_output/ssor.c cetus_ssor.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/l2norm.c  cetus_l2norm.c
					cp cetus_output/jacld.c  cetus_jacld.c
					cp cetus_output/blts.c  cetus_blts.c 
					cp cetus_output/jacu.c cetus_jacu.c
					cp cetus_output/buts.c cetus_buts.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/pintgr.c cetus_pintgr.c
					cp cetus_output/verify.c cetus_verify.c
					gcc -O3 -fopenmp -mcmodel=large -o output ccetus_lu.c cetus_read_input.c cetus_domain.c cetus_setcoeff.c cetus_setbv.c cetus_exact.c cetus_setiv.c cetus_erhs.c cetus_ssor.c cetus_rhs.c cetus_l2norm.c cetus_jacld.c cetus_blts.c cetus_jacu.c cetus_buts.c cetus_error.c cetus_pintgr.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=1_${i}
					echo "<----------------------------->"
				done	
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -profitable-omp=2 lu.c read_input.c domain.c setcoeff.c setbv.c exact.c setiv.c erhs.c ssor.c rhs.c l2norm.c jacld.c blts.c jacu.c buts.c error.c pintgr.c verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/read_input.c cetus_read_input.c
					cp cetus_output/domain.c cetus_domain.c
					cp cetus_output/setcoeff.c cetus_setcoeff.c
					cp cetus_output/setbv.c cetus_setbv.c
					cp cetus_output/exact.c cetus_exact.c
 	                cp cetus_output/setiv.c cetus_setiv.c
					cp cetus_output/erhs.c cetus_erhs.c
					cp cetus_output/ssor.c cetus_ssor.c
					cp cetus_output/rhs.c cetus_rhs.c
					cp cetus_output/l2norm.c  cetus_l2norm.c
					cp cetus_output/jacld.c  cetus_jacld.c
					cp cetus_output/blts.c  cetus_blts.c 
					cp cetus_output/jacu.c cetus_jacu.c
					cp cetus_output/buts.c cetus_buts.c
					cp cetus_output/error.c cetus_error.c
					cp cetus_output/pintgr.c cetus_pintgr.c
					cp cetus_output/verify.c cetus_verify.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_lu.c cetus_read_input.c cetus_domain.c cetus_setcoeff.c cetus_setbv.c cetus_exact.c cetus_setiv.c cetus_erhs.c cetus_ssor.c cetus_rhs.c cetus_l2norm.c cetus_jacld.c cetus_blts.c cetus_jacu.c cetus_buts.c cetus_error.c cetus_pintgr.c cetus_verify.c ../common/print_results.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=2_${i}
					echo "<----------------------------->"
				done





elif [ ${BENCH_NAME} = "SP" ] 
	then	
			
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -profitable-omp=2 add.c adi.c error.c exact_rhs.c exact_solution.c initialize.c ninvr.c pinvr.c rhs.c set_constants.c sp.c txinvr.c tzetar.c verify.c x_solve.c y_solve.c z_solve.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
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
					cp cetus_output/txinvr.c cetus_set_txinvr.c
					cp cetus_output/tzetar.c cetus_set_tzetar.c
					cp cetus_output/verify.c  cetus_verify.c
					cp cetus_output/x_solve.c  cetus_x_solve.c
					cp cetus_output/y_solve.c  cetus_y_solve.c 
					cp cetus_output/z_solve.c cetus_z_solve.c
					#sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_add.c cetus_adi.c cetus_error.c cetus_exact_rhs.c cetus_exact_solution.c cetus_initialize.c cetus_ninvr.c  cetus_pinvr.c cetus_rhs.c cetus_set_constants.c cetus_sp.c cetus_txinvr.c cetus_tzetar.c cetus_verify.c cetus_x_solve.c cetus_y_solve.c cetus_z_solve.c  ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=2_${i}
					echo "<----------------------------->"
				done																											

elif [ ${BENCH_NAME} = "MG"  ] 
	then

			${CETUS}  ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
			cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
			gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
			mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_no
		
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS}  -alias=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=0_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS}  -alias=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=1_${i}
					echo "<----------------------------->"
				done			
 
 		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS}  -ddt=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=0_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -ddt=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=1_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS}  -ddt=2 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=2_${i}
					echo "<----------------------------->"
				done				
	
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS}  -parallelize-loops=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_parallelize-loops=0_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS}  -parallelize-loops=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_parallelize-loops=1_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS}  -privatize=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=0_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS}  -privatize=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=1_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS}  -privatize=2 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=2_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS}  -range=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_range=0_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -range=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_range=1_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS}  -range=2 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_range=2_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS}  -reduction=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=0_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS}  -reduction=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=1_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS}  -reduction=2 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=2_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS}  -induction=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=0_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS}  -induction=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=1_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -induction=2 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=2_${i}
					echo "<----------------------------->"
				done		
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -induction=3 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=3_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -normalize-loops=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_normalize-loops=0_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -normalize-loops=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_normalize-loops=1_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -profitable-omp=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc -O3 -fopenmp -mcmodel=large -o -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=0_${i}
					echo "<----------------------------->"
				done
		for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -profitable-omp=1 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=1_${i}
					echo "<----------------------------->"
				done																							
elif [ ${BENCH_NAME} = "DC"  ]
	then
			${CETUS} ${FILE_NAME}.c adc.c extbuild.c jobcntl.c rbt.c
			cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
			cp cetus_output/adc.c cetus_adc.c
			cp cetus_output/extbuild.c cetus_extbuild.c
			cp cetus_output/jobcntl.c cetus_jobcntl.c
			cp cetus_output/rbt.c cetus_rbt.c
			gcc -fopenmp -o output cetus_adc.c cetus_dc.c cetus_extbuild.c cetus_jobcntl.c cetus_rbt.c -lm
			mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_no
		
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -alias=0 ${FILE_NAME}.c adc.c extbuild.c jobcntl.c rbt.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					cp cetus_output/adc.c cetus_adc.c
					cp cetus_output/extbuild.c cetus_extbuild.c
					cp cetus_output/jobcntl.c cetus_jobcntl.c
					cp cetus_output/rbt.c cetus_rbt.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -alias=1 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=1_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -alias=3 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_alias=3_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -ddt=0 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -ddt=1 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=1_${i}
					echo "<----------------------------->"
				done		
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -ddt=2 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_ddt=2_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -parallelize-loops=0 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_parallelize-loops=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -parallelize-loops=0 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_parallelize-loops=0_${i}
					echo "<----------------------------->"
				done			
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -parallelize-loops=1 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_parallelize-loops=1_${i}
					echo "<----------------------------->"
				done			
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -privatize=0 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -privatize=1 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=1_${i}
					echo "<----------------------------->"
				done			
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -privatize=2 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_privatize=2_${i}
					echo "<----------------------------->"
				done

			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -range=0 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_range=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -range=1 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_range=1_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -range=2 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_range=2_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -reduction=0 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -reduction=1 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=1_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -reduction=2 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_reduction=2_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -induction=0 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -induction=1 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=1_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -induction=2 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=2_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -induction=3 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_induction=3_${i}
					echo "<----------------------------->"
				done	
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -normalize-loops=0 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_normalize-loops=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -normalize-loops=1 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_normalize-loops=1_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -profitable-omp=0 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=0_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -profitable-omp=1 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=1_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -profitable-omp=2 ${FILE_NAME}.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
					sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
					gcc -fopenmp -o output ./cetus_${FILE_NAME}.c -lm
					mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=2_${i}
					echo "<----------------------------->"
				done
    

elif [ ${BENCH_NAME} = "CG" ]
		then
			
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -profitable-omp=0 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}_profitable-omp=0_${i}.c
					#gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}_parallelize-loops=0_${i}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					#mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_profitable-omp=1_${i}
					echo "<----------------------------->"
				done
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -profitable-omp=1  ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}_profitable-omp=1_${i}.c
					#gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}_parallelize-loops=0_${i}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
					#mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_parallelize-loops=1_${i}
					echo "<----------------------------->"
					echo "<----------------------------->"
				done			
			for ((i=1; i<=${N_ITER}; i++))
				do
					${CETUS} -profitable-omp=2 ${FILE_NAME}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c
					cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}_profitable-omp=2_${i}.c
					#gcc  -O3 -fopenmp -mcmodel=large -o output cetus_${FILE_NAME}_parallelize-loops=0_${i}.c ../common/print_results.c ../common/randdp.c ../common/c_timers.c ../common/wtime.c -lm
				    #mv output output${BENCH_CLASS}/cetus_${FILE_NAME}_parallelize-loops=2_${i}
					echo "<----------------------------->"

				done			
		
						
fi																																																				
