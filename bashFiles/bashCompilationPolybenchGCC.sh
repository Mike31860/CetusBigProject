#!/bin/bash
CETUS=$PWD/cetus-1.4.4/bin/cetus
cd ..
GIT_DIR=$PWD
echo $GIT_DIR
BENCH_DIR=$GIT_DIR/PolyBenchC-4.2.1
BENCH_NAME=$1
FILE_NAME=$(echo $BENCH_NAME | tr '[:upper:]' '[:lower:]')
N_PAR=1
N_ITER=5
TIMEFORMAT='%E';
cd ${BENCH_DIR}/${BENCH_NAME}
#make CLASS=${BENCH_CLASS}
		
															
if [ ${BENCH_NAME} = "jacobi-2d" ] 
	then	
					
						
						
							
			
			
			
		
			
			
			
				
				
				   
						
			
				
				
			done	
elif [ ${BENCH_NAME} = "gemm" ] 
	then
						
						
						
						
					
					
				
					
					
					
			
			
				
				
				
				
				
				
#!/bin/sh
GIT_DIR=$PWD
F_LOG=$GIT_DIR/coverange.txt
printf "try" > $F_LOG
./serial-covariance | grep 'Time in seconds'>> $F_LOG
echo "<----------------------------->"
				
		
#include <stdio.h>
#include <sys/time.h>
float time_diff(struct timeval *start, struct timeval *end)
{
    return (end->tv_sec - start->tv_sec) + 1e-6*(end->tv_usec - start->tv_usec);
}
struct timeval start, end;
  gettimeofday(&start, NULL);
  kernel_jacobi_2d(tsteps, n, POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(B));
  gettimeofday(&end, NULL);
  printf("Time in seconds %0.8f \n", time_diff(&start, &end));


elif [ ${BENCH_NAME} = "correlation" ] 
	then
gcc -O3 -I utilities -I ../covariance ../../utilities/polybench.c -fopenmp -o parallel_covariance  cetus_output/covariance.c -lm


				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-alias2_Parallel cetus_correlation-alias2-1.c -lm		
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-ddt0_Parallel cetus_correlation-ddt0-1.c -lm
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-ddt1_Parallel cetus_correlation-ddt1-1.c -lm
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-ddt2_Parallel cetus_correlation-ddt2-1.c -lm
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-parallelize-loops0_Parallel cetus_correlation-parallelize-loops0-1.c -lm
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-parallelize-loops1_Parallel cetus_correlation-parallelize-loops1-1.c -lm
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-privatize0_Parallel cetus_correlation-privatize0-1.c -lm
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-privatize1_Parallel cetus_correlation-privatize1-1.c -lm
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-privatize2_Parallel cetus_correlation-privatize2-1.c -lm
				echo "<----------------------------->"	
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-range0_Parallel cetus_correlation-range0-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-range1_Parallel cetus_correlation-range1-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-range2_Parallel cetus_correlation-range2-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-reduction0_Parallel cetus_correlation-reduction0-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-reduction1_Parallel cetus_correlation-reduction1-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-reduction2_Parallel cetus_correlation-reduction2-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-induction0_Parallel cetus_correlation-induction0-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-induction1_Parallel cetus_correlation-induction1-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-induction2_Parallel cetus_correlation-induction2-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-induction3_Parallel cetus_correlation-induction3-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-profitable-omp0_Parallel cetus_correlation-profitable-omp0-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-profitable-omp1_Parallel cetus_correlation-profitable-omp1-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../correlation ../utilities/polybench.c -fopenmp -o correlation-profitable-omp2_Parallel cetus_correlation-profitable-omp2-1.c -lm	
				echo "<----------------------------->"
			done	
elif [ ${BENCH_NAME} = "heat-3d" ] 
	then
			
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-alias2_Parallel cetus_heat-3d-alias2-1.c -lm				
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-ddt0_Parallel cetus_heat-3d-ddt0-1.c -lm			
				echo "<----------------------------->"			
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-ddt1_Parallel cetus_heat-3d-ddt1-1.c -lm			
				echo "<----------------------------->"					
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-ddt2_Parallel cetus_heat-3d-ddt2-1.c -lm
				echo "<----------------------------->"	
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-parallelize-loops0_Parallel cetus_heat-3d-parallelize-loops0-1.c -lm
				echo "<----------------------------->"		
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-parallelize-loops1_Parallel cetus_heat-3d-parallelize-loops1-1.c -lm
				echo "<----------------------------->"			
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-privatize0_Parallel cetus_heat-3d-privatize0-1.c -lm
				echo "<----------------------------->"		
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-privatize1_Parallel cetus_heat-3d-privatize1-1.c -lm
				echo "<----------------------------->"		
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-privatize2_Parallel cetus_heat-3d-privatize2-1.c -lm			
				echo "<----------------------------->"			
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-range0_Parallel cetus_heat-3d-range0-1.c -lm				
				echo "<----------------------------->"				
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-range1_Parallel cetus_heat-3d-range1-1.c -lm					
				echo "<----------------------------->"	
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-range2_Parallel cetus_heat-3d-range2-1.c -lm					
				echo "<----------------------------->"			
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-reduction0_Parallel cetus_heat-3d-reduction0-1.c -lm				
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-reduction1_Parallel cetus_heat-3d-reduction1-1.c -lm	
				echo "<----------------------------->"		
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-reduction2_Parallel cetus_heat-3d-reduction2-1.c -lm	
				echo "<----------------------------->"		
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-induction0_Parallel cetus_heat-3d-induction0-1.c -lm	
				echo "<----------------------------->"	
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-induction1_Parallel cetus_heat-3d-induction1-1.c -lm		
				echo "<----------------------------->"			
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-induction2_Parallel cetus_heat-3d-induction2-1.c -lm		
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-induction3_Parallel cetus_heat-3d-induction3-1.c -lm	
				echo "<----------------------------->"			
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-profitable-omp0_Parallel cetus_heat-3d-profitable-omp0-1.c -lm	
				echo "<----------------------------->"			
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-profitable-omp1_Parallel cetus_heat-3d-profitable-omp1-1.c -lm				
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../heat-3d ../utilities/polybench.c -fopenmp -o heat-3d-profitable-omp2_Parallel cetus_heat-3d-profitable-omp2-1.c -lm	
				echo "<----------------------------->"
		
elif [ ${BENCH_NAME} = "symm" ] 
	then
			
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-alias2_Parallel cetus_symm-alias2-1.c -lm			
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-ddt0_Parallel cetus_symm-ddt0-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-ddt1_Parallel cetus_symm-ddt1-1.c -lm	
				echo "<----------------------------->"			
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-ddt2_Parallel cetus_symm-ddt2-1.c -l
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-parallelize-loops0_Parallel cetus_symm-parallelize-loops0-1.c -lm
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-parallelize-loops1_Parallel cetus_symm-parallelize-loops1-1.c -lm
				echo "<----------------------------->"	
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-privatize0_Parallel cetus_symm-privatize0-1.c -lm
				echo "<----------------------------->"			
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-privatize1_Parallel cetus_symm-privatize1-1.c -lm
				echo "<----------------------------->"			
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-privatize2_Parallel cetus_symm-privatize2-1.c -lm			
				echo "<----------------------------->"	
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-range0_Parallel cetus_symm-range0-1.c -lm				
				echo "<----------------------------->"				
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-range1_Parallel cetus_symm-range1-1.c -lm				
				echo "<----------------------------->"	
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-range2_Parallel cetus_symm-range2-1.c -lm			
				echo "<----------------------------->"		
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-reduction0_Parallel cetus_symm-reduction0-1.c -lm			
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-reduction1_Parallel cetus_symm-reduction1-1.c -lm	
				echo "<----------------------------->"	
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-reduction2_Parallel cetus_symm-reduction2-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-induction0_Parallel cetus_symm-induction0-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-induction1_Parallel cetus_symm-induction1-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-induction2_Parallel cetus_symm-induction2-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-induction3_Parallel cetus_symm-induction3-1.c -lm	
				echo "<----------------------------->"	
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-profitable-omp0_Parallel cetus_symm-profitable-omp0-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-profitable-omp1_Parallel cetus_symm-profitable-omp1-1.c -lm	
				echo "<----------------------------->"
				gcc -O3 -I utilities -I ../symm ../utilities/polybench.c -fopenmp -o symm-profitable-omp2_Parallel cetus_symm-profitable-omp2-1.c -lm	
				echo "<----------------------------->"
				

						
fi																																																				
