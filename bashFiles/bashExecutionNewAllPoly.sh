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


if [ ${BENCH_NAME} = "correlation" ]
        then
                  for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "alias=2,${i},")>>$F_LOG
                                        ./correlation-alias2_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=0,${i},")>>$F_LOG
                                        ./correlation-ddt0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=1,${i},")>>$F_LOG
                                        ./correlation-ddt1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=2,${i},")>>$F_LOG
                                        ./correlation-ddt2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=0,${i},")>>$F_LOG
                                        ./correlation-parallelize-loops0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=1,${i},")>>$F_LOG
                                        ./correlation-parallelize-loops1_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=0,${i},")>>$F_LOG
                                        ./correlation-privatize0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=1,${i},")>>$F_LOG
                                        ./correlation-privatize1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                               
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=2,${i},")>>$F_LOG
                                        ./correlation-privatize2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=0,${i},")>>$F_LOG
                                        ./correlation-range0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=1,${i},")>>$F_LOG
                                        ./correlation-range1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=2,${i},")>>$F_LOG
                                        ./correlation-range2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=0,${i},")>>$F_LOG
                                        ./correlation-reduction0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=1,${i},")>>$F_LOG
                                        ./correlation-reduction1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=2,${i},")>>$F_LOG
                                        ./correlation-reduction2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=0,${i},")>>$F_LOG
                                ./correlation-induction0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=1,${i},")>>$F_LOG
                                ./correlation-induction1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=2,${i},")>>$F_LOG
                                ./correlation-induction2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=3,${i},")>>$F_LOG
                                        ./correlation-induction3_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
        
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=0,${i},")>>$F_LOG
                                        ./correlation-profitable-omp0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=1,${i},")>>$F_LOG
                                        ./correlation-profitable-omp1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=2,${i},")>>$F_LOG
                                        ./correlation-profitable-omp2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

elif [ ${BENCH_NAME} = "2mm" ]
        then
                  for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "alias=2,${i},")>>$F_LOG
                                        ./2mm-alias2_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=0,${i},")>>$F_LOG
                                        ./2mm-ddt0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=1,${i},")>>$F_LOG
                                        ./2mm-ddt1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=2,${i},")>>$F_LOG
                                        ./2mm-ddt2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=0,${i},")>>$F_LOG
                                        ./2mm-parallelize-loops0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=1,${i},")>>$F_LOG
                                        ./2mm-parallelize-loops1_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=0,${i},")>>$F_LOG
                                        ./2mm-privatize0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=1,${i},")>>$F_LOG
                                        ./2mm-privatize1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                               
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=2,${i},")>>$F_LOG
                                        ./2mm-privatize2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=0,${i},")>>$F_LOG
                                        ./2mm-range0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=1,${i},")>>$F_LOG
                                        ./2mm-range1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=2,${i},")>>$F_LOG
                                        ./2mm-range2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=0,${i},")>>$F_LOG
                                        ./2mm-reduction0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=1,${i},")>>$F_LOG
                                        ./2mm-reduction1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=2,${i},")>>$F_LOG
                                        ./2mm-reduction2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=0,${i},")>>$F_LOG
                                ./2mm-induction0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=1,${i},")>>$F_LOG
                                ./2mm-induction1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=2,${i},")>>$F_LOG
                                ./2mm-induction2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=3,${i},")>>$F_LOG
                                        ./2mm-induction3_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
        
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=0,${i},")>>$F_LOG
                                        ./2mm-profitable-omp0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=1,${i},")>>$F_LOG
                                        ./2mm-profitable-omp1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=2,${i},")>>$F_LOG
                                        ./2mm-profitable-omp2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

elif [ ${BENCH_NAME} = "3mm" ]
        then
                  for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "alias=2,${i},")>>$F_LOG
                                        ./3mm-alias2_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=0,${i},")>>$F_LOG
                                        ./3mm-ddt0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=1,${i},")>>$F_LOG
                                        ./3mm-ddt1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=2,${i},")>>$F_LOG
                                        ./3mm-ddt2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=0,${i},")>>$F_LOG
                                        ./3mm-parallelize-loops0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=1,${i},")>>$F_LOG
                                        ./3mm-parallelize-loops1_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=0,${i},")>>$F_LOG
                                        ./3mm-privatize0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=1,${i},")>>$F_LOG
                                        ./3mm-privatize1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                               
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=2,${i},")>>$F_LOG
                                        ./3mm-privatize2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=0,${i},")>>$F_LOG
                                        ./3mm-range0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=1,${i},")>>$F_LOG
                                        ./3mm-range1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=2,${i},")>>$F_LOG
                                        ./3mm-range2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=0,${i},")>>$F_LOG
                                        ./3mm-reduction0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=1,${i},")>>$F_LOG
                                        ./3mm-reduction1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=2,${i},")>>$F_LOG
                                        ./3mm-reduction2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=0,${i},")>>$F_LOG
                                ./3mm-induction0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=1,${i},")>>$F_LOG
                                ./3mm-induction1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=2,${i},")>>$F_LOG
                                ./3mm-induction2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=3,${i},")>>$F_LOG
                                        ./3mm-induction3_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
        
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=0,${i},")>>$F_LOG
                                        ./3mm-profitable-omp0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=1,${i},")>>$F_LOG
                                        ./3mm-profitable-omp1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=2,${i},")>>$F_LOG
                                        ./3mm-profitable-omp2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
elif [ ${BENCH_NAME} = "doitgen" ]
        then
                  for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "alias=2,${i},")>>$F_LOG
                                        ./doitgen-alias2_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=0,${i},")>>$F_LOG
                                        ./doitgen-ddt0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=1,${i},")>>$F_LOG
                                        ./doitgen-ddt1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=2,${i},")>>$F_LOG
                                        ./doitgen-ddt2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=0,${i},")>>$F_LOG
                                        ./doitgen-parallelize-loops0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=1,${i},")>>$F_LOG
                                        ./doitgen-parallelize-loops1_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=0,${i},")>>$F_LOG
                                        ./doitgen-privatize0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=1,${i},")>>$F_LOG
                                        ./doitgen-privatize1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                               
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=2,${i},")>>$F_LOG
                                        ./doitgen-privatize2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=0,${i},")>>$F_LOG
                                        ./doitgen-range0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=1,${i},")>>$F_LOG
                                        ./doitgen-range1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=2,${i},")>>$F_LOG
                                        ./doitgen-range2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=0,${i},")>>$F_LOG
                                        ./doitgen-reduction0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=1,${i},")>>$F_LOG
                                        ./doitgen-reduction1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=2,${i},")>>$F_LOG
                                        ./doitgen-reduction2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=0,${i},")>>$F_LOG
                                ./doitgen-induction0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=1,${i},")>>$F_LOG
                                ./doitgen-induction1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=2,${i},")>>$F_LOG
                                ./doitgen-induction2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=3,${i},")>>$F_LOG
                                        ./doitgen-induction3_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
        
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=0,${i},")>>$F_LOG
                                        ./doitgen-profitable-omp0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=1,${i},")>>$F_LOG
                                        ./doitgen-profitable-omp1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=2,${i},")>>$F_LOG
                                        ./doitgen-profitable-omp2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done                                                                                                 
elif [ ${BENCH_NAME} = "gramschmidt" ]
        then
                  for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "alias=2,${i},")>>$F_LOG
                                        ./gramschmidt-alias2_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=0,${i},")>>$F_LOG
                                        ./gramschmidt-ddt0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=1,${i},")>>$F_LOG
                                        ./gramschmidt-ddt1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddt=2,${i},")>>$F_LOG
                                        ./gramschmidt-ddt2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=0,${i},")>>$F_LOG
                                        ./gramschmidt-parallelize-loops0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize-loops=1,${i},")>>$F_LOG
                                        ./gramschmidt-parallelize-loops1_Parallel | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=0,${i},")>>$F_LOG
                                        ./gramschmidt-privatize0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=1,${i},")>>$F_LOG
                                        ./gramschmidt-privatize1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                               
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatize=2,${i},")>>$F_LOG
                                        ./gramschmidt-privatize2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=0,${i},")>>$F_LOG
                                        ./gramschmidt-range0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=1,${i},")>>$F_LOG
                                        ./gramschmidt-range1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=2,${i},")>>$F_LOG
                                        ./gramschmidt-range2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=0,${i},")>>$F_LOG
                                        ./gramschmidt-reduction0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=1,${i},")>>$F_LOG
                                        ./gramschmidt-reduction1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=2,${i},")>>$F_LOG
                                        ./gramschmidt-reduction2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=0,${i},")>>$F_LOG
                                ./gramschmidt-induction0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=1,${i},")>>$F_LOG
                                ./gramschmidt-induction1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=2,${i},")>>$F_LOG
                                ./gramschmidt-induction2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "induction=3,${i},")>>$F_LOG
                                        ./gramschmidt-induction3_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
        
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=0,${i},")>>$F_LOG
                                        ./gramschmidt-profitable-omp0_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=1,${i},")>>$F_LOG
                                        ./gramschmidt-profitable-omp1_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "profitable-omp=2,${i},")>>$F_LOG
                                        ./gramschmidt-profitable-omp2_Parallel | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done  
fi