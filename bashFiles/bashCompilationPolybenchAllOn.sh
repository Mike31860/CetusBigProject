#!/bin/bash
CETUS=$PWD/cetus-1.4.4/bin/cetus
cd ..
GIT_DIR=$PWD
echo $GIT_DIR
BENCH_DIR=$GIT_DIR/PolyBenchC-4.2.1
BENCH_NAME=$1
FILE_NAME=$(echo $BENCH_NAME | tr '[:upper:]' '[:lower:]')
N_PAR=1
N_ITER=1
TIMEFORMAT='%E';
cd ${BENCH_DIR}/${BENCH_NAME}
#make CLASS=${BENCH_CLASS}



if [ ${BENCH_NAME} = "2mm" ] 
	then
			 
			    gcc -O3 -o serialCode 2mm.c ../utilities/polybench.c
				echo "<----------------------------->"	
			
				${CETUS} -alias=2 -ddt=2 -parallelize-loops=0 -privatize=2 -range=1 -reduction=2 -loop_interchange 2mm.c 
				cp cetus_output/2mm.c cetus_2mm-parallelize-off.c	
		    	gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-parallelize-off cetus_2mm-parallelize-Off.c -lm
				echo "<----------------------------->"	
		
				${CETUS} -alias=2 -ddt=2 -parallelize-loops=1 -privatize=0 -range=1 -reduction=2 -loop_interchange 2mm.c 
				cp cetus_output/2mm.c cetus_2mm-privatization-off.c	
			    gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-privatization-off cetus_2mm-privatization-off.c -lm
				echo "<----------------------------->"	
			
				${CETUS} -alias=2  -ddt=2 -parallelize-loops=1 -privatize=2 -range=0 -reduction=2 -loop_interchange 2mm.c 
				cp cetus_output/2mm.c cetus_2mm-range-off.c	
				gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-range-off cetus_2mm-range-off.c -lm
				echo "<----------------------------->"	
		
				${CETUS} -alias=2 -ddt=2 -parallelize-loops=1 -privatize=2 -range=1 -reduction=0 -loop_interchange 2mm.c 
				cp cetus_output/2mm.c cetus_2mm-reduction-off.c	
		    	gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-reduction-off cetus_2mm-reduction-off.c -lm
				echo "<----------------------------->"
		
				${CETUS} -alias=2 -ddt=2 -parallelize-loops=1 -privatize=2 -range=1 -reduction=2 2mm.c 
				cp cetus_output/2mm.c cetus_2mm-loop-interchange-off.c	
				gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-loop-interchange-off cetus_2mm-loop-interchange-off.c -lm
				echo "<----------------------------->"	

elif [ ${BENCH_NAME} = "3mm" ] 
	then
				 
				gcc -O3 -o serialCode 3mm.c ../utilities/polybench.c
				echo "<----------------------------->"	
			
				${CETUS} -alias=2 -ddt=2 -parallelize-loops=0 -privatize=2 -range=1 -reduction=2 -loop_interchange 3mm.c 
				cp cetus_output/3mm.c cetus_3mm-parallelize-off.c	
		    	gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-parallelize-off cetus_3mm-parallelize-Off.c -lm
				echo "<----------------------------->"	
		
				${CETUS} -alias=2 -ddt=2 -parallelize-loops=1 -privatize=0 -range=1 -reduction=2 -loop_interchange 3mm.c 
				cp cetus_output/3mm.c cetus_3mm-privatization-off.c	
			    gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-privatization-off cetus_3mm-privatization-off.c -lm
				echo "<----------------------------->"	
			
				${CETUS} -alias=2  -ddt=2 -parallelize-loops=1 -privatize=2 -range=0 -reduction=2 -loop_interchange 3mm.c 
				cp cetus_output/3mm.c cetus_3mm-range-off.c	
				gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-range-off cetus_3mm-range-off.c -lm
				echo "<----------------------------->"	
		
				${CETUS} -alias=2 -ddt=2 -parallelize-loops=1 -privatize=2 -range=1 -reduction=0 -loop_interchange 3mm.c 
				cp cetus_output/3mm.c cetus_3mm-reduction-off.c	
		    	gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-reduction-off cetus_3mm-reduction-off.c -lm
				echo "<----------------------------->"
		
				${CETUS} -alias=2 -ddt=2 -parallelize-loops=1 -privatize=2 -range=1 -reduction=2 3mm.c 
				cp cetus_output/3mm.c cetus_3mm-loop-interchange-off.c	
				gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-loop-interchange-off cetus_3mm-loop-interchange-off.c -lm
				echo "<----------------------------->"	

fi								
			