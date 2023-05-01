#!/bin/bash
CETUS=$PWD/cetus-1.4.4/bin/cetus
cd ..
GIT_DIR=$PWD
echo $GIT_DIR
BENCH_DIR=$GIT_DIR/SNU_NPB-1.0.3/NPB3.3-SER-C
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


if [ ${BENCH_NAME} = "DC" ]
        then
                  for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "outputSerial,${i},")>>$F_LOG
                                        ./outputSerial | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "dc-Scalarprivatization-on,${i},")>>$F_LOG
                                        ./ddc-Scalarprivatization-on | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddc-privatization-off,${i},")>>$F_LOG
                                        ./ddc-privatization-off | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddc-Interrange-on ,${i},")>>$F_LOG
                                        ./ddc-Interrange-on | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddc-range-off ,${i},")>>$F_LOG
                                        ./ddc-range-off | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done

                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddc-Scalarreduction-on,${i},")>>$F_LOG
                                        ./ddc-Scalarreduction-on | grep 'Time in seconds'>> $F_LOG

                                        echo "<----------------------------->"
                                done
                for ((i=1; i<=${N_ITER}; i++))
                                do
                                        (echo -n "ddc-reduction-off,${i},")>>$F_LOG
                                        ./ddc-reduction-off | grep 'Time in seconds'>> $F_LOG
                                        echo "<----------------------------->"
                                done
               

fi