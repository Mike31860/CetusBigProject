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
F_LOG=$GIT_DIR/logFiles/log_WithoutFirstLast_${BENCH_NAME}_i${N_ITER}.txt   
printf "" > $F_LOG
TIMEFORMAT='%E';
cd ${BENCH_DIR}/${BENCH_NAME}
(echo "Benchmark = ${BENCH_NAME}") >>$F_LOG
(echo -n 'InputFile Execution Time = ') >>$F_LOG


if [ ${BENCH_NAME} = "2mm" ]
        then
                   for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "serialCode=,${i},")>>$F_LOG
                                        ./serialCode| grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                   for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize=off,${i},")>>$F_LOG
                                        ./2mm-parallelize-off | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                   for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatization=off,${i},")>>$F_LOG
                                        ./2mm-privatization-off | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                   for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=off,${i},")>>$F_LOG
                                        ./2mm-range-off | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                   for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=off,${i},")>>$F_LOG
                                        ./2mm-reduction-off | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                   for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "loop-interchange=off,${i},")>>$F_LOG
                                        ./2mm-loop-interchange-off | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done                                                      

elif [ ${BENCH_NAME} = "3mm" ]
        then
                    for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "serialCode=,${i},")>>$F_LOG
                                        ./serialCode| grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                   for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "parallelize=off,${i},")>>$F_LOG
                                        ./3mm-parallelize-off | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                   for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "privatization=off,${i},")>>$F_LOG
                                        ./3mm-privatization-off | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                   for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "range=off,${i},")>>$F_LOG
                                        ./3mm-range-off | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                   for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "reduction=off,${i},")>>$F_LOG
                                        ./3mm-reduction-off | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                   for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "loop-interchange=off,${i},")>>$F_LOG
                                        ./3mm-loop-interchange-off | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done  


