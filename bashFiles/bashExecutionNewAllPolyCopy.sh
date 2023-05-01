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
F_LOG=$GIT_DIR/logFiles/log${BENCH_NAME}_i${N_ITER}.txt   
printf "" > $F_LOG
TIMEFORMAT='%E';
cd ${BENCH_DIR}/${BENCH_NAME}
(echo "Benchmark = ${BENCH_NAME}") >>$F_LOG
(echo -n 'InputFile Execution Time = ') >>$F_LOG

if [ ${BENCH_NAME} = "jacobi-2d" ]
  then
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "alias=2,${i},")>>$F_LOG
                                        ./jacobi-2d-alias2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=0,${i},")>>$F_LOG
                                        ./jacobi-2d-ddt0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=1,${i},")>>$F_LOG
                                        ./jacobi-2d-ddt1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=2,${i},")>>$F_LOG
                                        ./jacobi-2d-ddt2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=0,${i},")>>$F_LOG
                                        ./jacobi-2d-parallelize-loops0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=1,${i},")>>$F_LOG
                                        ./jacobi-2d-parallelize-loops1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=0,${i},")>>$F_LOG
                                        ./jacobi-2d-privatize0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=1,${i},")>>$F_LOG
                                        ./jacobi-2d-privatize1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=2,${i},")>>$F_LOG
                                        ./jacobi-2d-privatize2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=0,${i},")>>$F_LOG
                                        ./jacobi-2d-range0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=1,${i},")>>$F_LOG
                                        ./jacobi-2d-range1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=2,${i},")>>$F_LOG
                                        ./jacobi-2d-range2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=0,${i},")>>$F_LOG
                                        ./jacobi-2d-reduction0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=1,${i},")>>$F_LOG
                                        ./jacobi-2d-reduction1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=2,${i},")>>$F_LOG
                                        ./jacobi-2d-reduction2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=0,${i},")>>$F_LOG
                                          ./jacobi-2d-induction0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=1,${i},")>>$F_LOG
                                         ./jacobi-2d-induction1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=2,${i},")>>$F_LOG
                                          ./jacobi-2d-induction2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=3,${i},")>>$F_LOG
                                        ./jacobi-2d-induction3-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
           
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=0,${i},")>>$F_LOG
                                        ./jacobi-2d-profitable-omp0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=1,${i},")>>$F_LOG
                                        ./jacobi-2d-profitable-omp1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=2,${i},")>>$F_LOG
                                        ./jacobi-2d-profitable-omp2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

elif [ ${BENCH_NAME} = "gemm" ]
        then
                  for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "alias=2,${i},")>>$F_LOG
                                        ./gemm-alias2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=0,${i},")>>$F_LOG
                                        ./gemm-ddt0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=1,${i},")>>$F_LOG
                                        ./gemm-ddt1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=2,${i},")>>$F_LOG
                                        ./gemm-ddt2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=0,${i},")>>$F_LOG
                                        ./gemm-parallelize-loops0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=1,${i},")>>$F_LOG
                                        ./gemm-parallelize-loops1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=0,${i},")>>$F_LOG
                                        ./gemm-privatize0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=1,${i},")>>$F_LOG
                                        ./gemm-privatize1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=2,${i},")>>$F_LOG
                                        ./gemm-privatize2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=0,${i},")>>$F_LOG
                                        ./gemm-range0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=1,${i},")>>$F_LOG
                                        ./gemm-range1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=2,${i},")>>$F_LOG
                                        ./gemm-range2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=0,${i},")>>$F_LOG
                                        ./gemm-reduction0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=1,${i},")>>$F_LOG
                                        ./gemm-reduction1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=2,${i},")>>$F_LOG
                                        ./gemm-reduction2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=0,${i},")>>$F_LOG
                                        ./gemm-induction0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=1,${i},")>>$F_LOG
                                        ./gemm-induction1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=2,${i},")>>$F_LOG
                                        ./gemm-induction2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=3,${i},")>>$F_LOG
                                        ./gemm-induction3-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
             
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=0,${i},")>>$F_LOG
                                        ./gemm-profitable-omp0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=1,${i},")>>$F_LOG
                                        ./gemm-profitable-omp1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=2,${i},")>>$F_LOG
                                        ./gemm-profitable-omp2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

elif [ ${BENCH_NAME} = "correlation" ]
        then
                  for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "alias=2,${i},")>>$F_LOG
                                        ./correlation-alias2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=0,${i},")>>$F_LOG
                                        ./correlation-ddt0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=1,${i},")>>$F_LOG
                                        ./correlation-ddt1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=2,${i},")>>$F_LOG
                                        ./correlation-ddt2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=0,${i},")>>$F_LOG
                                        ./correlation-parallelize-loops0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=1,${i},")>>$F_LOG
                                        ./correlation-parallelize-loops1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=0,${i},")>>$F_LOG
                                        ./correlation-privatize0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=1,${i},")>>$F_LOG
                                        ./correlation-privatize1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                               
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=2,${i},")>>$F_LOG
                                        ./correlation-privatize2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=0,${i},")>>$F_LOG
                                        ./correlation-range0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=1,${i},")>>$F_LOG
                                        ./correlation-range1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=2,${i},")>>$F_LOG
                                        ./correlation-range2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=0,${i},")>>$F_LOG
                                        ./correlation-reduction0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=1,${i},")>>$F_LOG
                                        ./correlation-reduction1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=2,${i},")>>$F_LOG
                                        ./correlation-reduction2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=0,${i},")>>$F_LOG
                                ./correlation-induction0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=1,${i},")>>$F_LOG
                                ./correlation-induction1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=2,${i},")>>$F_LOG
                                ./correlation-induction2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=3,${i},")>>$F_LOG
                                        ./correlation-induction3-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
        
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=0,${i},")>>$F_LOG
                                        ./correlation-profitable-omp0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=1,${i},")>>$F_LOG
                                        ./correlation-profitable-omp1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=2,${i},")>>$F_LOG
                                        ./correlation-profitable-omp2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

elif [ ${BENCH_NAME} = "heat-3d" ]
        then
               
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=2,${i},")>>$F_LOG
                                        ./heat-3d-reduction2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=0,${i},")>>$F_LOG
                                ./heat-3d-induction0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=1,${i},")>>$F_LOG
                                ./heat-3d-induction1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=2,${i},")>>$F_LOG
                                ./heat-3d-induction2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=3,${i},")>>$F_LOG
                                        ./heat-3d-induction3-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
        
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=0,${i},")>>$F_LOG
                                        ./heat-3d-profitable-omp0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=1,${i},")>>$F_LOG
                                        ./heat-3d-profitable-omp1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=2,${i},")>>$F_LOG
                                        ./heat-3d-profitable-omp2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

elif [ ${BENCH_NAME} = "symm" ]
        then
                  for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "alias=2,${i},")>>$F_LOG
                                        ./symm-alias2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=0,${i},")>>$F_LOG
                                        ./symm-ddt0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=1,${i},")>>$F_LOG
                                        ./symm-ddt1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=2,${i},")>>$F_LOG
                                        ./symm-ddt2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=0,${i},")>>$F_LOG
                                        ./symm-parallelize-loops0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=1,${i},")>>$F_LOG
                                        ./symm-parallelize-loops1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=0,${i},")>>$F_LOG
                                        ./symm-privatize0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=1,${i},")>>$F_LOG
                                        ./symm-privatize1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                               
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=2,${i},")>>$F_LOG
                                        ./symm-privatize2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=0,${i},")>>$F_LOG
                                        ./symm-range0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=1,${i},")>>$F_LOG
                                        ./symm-range1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=2,${i},")>>$F_LOG
                                        ./symm-range2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=0,${i},")>>$F_LOG
                                        ./symm-reduction0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=1,${i},")>>$F_LOG
                                        ./symm-reduction1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=2,${i},")>>$F_LOG
                                        ./symm-reduction2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=0,${i},")>>$F_LOG
                                ./symm-induction0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=1,${i},")>>$F_LOG
                                ./symm-induction1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=2,${i},")>>$F_LOG
                                ./symm-induction2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=3,${i},")>>$F_LOG
                                        ./symm-induction3-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
        
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=0,${i},")>>$F_LOG
                                        ./symm-profitable-omp0-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=1,${i},")>>$F_LOG
                                        ./symm-profitable-omp1-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=2,${i},")>>$F_LOG
                                        ./symm-profitable-omp2-${i}_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done                                                                  

fi