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

                                ${CETUS} -alias=2 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-alias2.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-alias2_Parallel cetus_2mm-alias2.c -lm
                                echo "<----------------------------->"


                                ${CETUS} -alias=2 -ddt=0 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-ddt0.c
                        gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-ddt0_Parallel cetus_2mm-ddt0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -ddt=1 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-ddt1.c
                            gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-ddt1_Parallel cetus_2mm-ddt1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -ddt=2 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-ddt2.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-ddt2_Parallel cetus_2mm-ddt2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -parallelize-loops=0 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-parallelize-loops0.c
                        gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-parallelize-loops0_Parallel cetus_2mm-parallelize-loops0.c -lm   
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -parallelize-loops=1 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-parallelize-loops1.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-parallelize-loops1_Parallel cetus_2mm-parallelize-loops1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -privatize=0 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-privatize0.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-privatize0_Parallel cetus_2mm-privatize0.c -lm
                                echo "<----------------------------->"
                                ${CETUS} -alias=2 -privatize=1 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-privatize1.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-privatize1_Parallel cetus_2mm-privatize1.c -lm
                echo "<----------------------------->"

                                ${CETUS} -alias=2 -privatize=2 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-privatize2.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-privatize2_Parallel cetus_2mm-privatize2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -range=0 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-range0.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-range0_Parallel cetus_2mm-range0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -range=1 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-range1.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-range1_Parallel cetus_2mm-range1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -range=2 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-range2.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-range2_Parallel cetus_2mm-range2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -reduction=0 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-reduction0.c

                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-reduction0_Parallel cetus_2mm-reduction0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -reduction=1 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-reduction1.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-reduction1_Parallel cetus_2mm-reduction1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -reduction=2 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-reduction2.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-reduction2_Parallel cetus_2mm-reduction2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -induction=0 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-induction0.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-induction0_Parallel cetus_2mm-induction0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -induction=1 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-induction1.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-induction1_Parallel cetus_2mm-induction1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -induction=2 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-induction2.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-induction2_Parallel cetus_2mm-induction2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -induction=3 2mm.c
                                cp cetus_output/2mm.c cetus_2mm-induction3.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-induction3_Parallel cetus_2mm-induction3.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -profitable-omp=0  2mm.c
                                cp cetus_output/2mm.c cetus_2mm-profitable-omp0.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-profitable-omp0_Parallel cetus_2mm-profitable-omp0.c -lm 

                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -profitable-omp=1  2mm.c
                                cp cetus_output/2mm.c cetus_2mm-profitable-omp1.c
                                gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-profitable-omp1_Parallel cetus_2mm-profitable-omp1.c -lm 

                                echo "<----------------------------->"


                                ${CETUS} -alias=2 -profitable-omp=2  2mm.c
                                cp cetus_output/2mm.c cetus_2mm-profitable-omp2.c
                        gcc -O3 -I utilities -I ../2mm ../utilities/polybench.c -fopenmp -o 2mm-profitable-omp2_Parallel cetus_2mm-profitable-omp2.c -lm
                                echo "<----------------------------->"


elif [ ${BENCH_NAME} = "3mm" ]
        then


                                ${CETUS} -alias=2 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-alias2.c
                                gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-alias2_Parallel cetus_3mm-alias2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -ddt=0 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-ddt0.c
                        gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-ddt0_Parallel cetus_3mm-ddt0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -ddt=1 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-ddt1.c
                                gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-ddt1_Parallel cetus_3mm-ddt1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -ddt=2 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-ddt2.c
                                gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-ddt2_Parallel cetus_3mm-ddt2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -parallelize-loops=0 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-parallelize-loops0.c
                                gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-parallelize-loops0_Parallel cetus_3mm-parallelize-loops0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -parallelize-loops=1 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-parallelize-loops1.c
                                gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-parallelize-loops1_Parallel cetus_3mm-parallelize-loops1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -privatize=0 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-privatize0.c
                                gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-privatize0_Parallel cetus_3mm-privatize0.c -lm
                                echo "<----------------------------->"


                                ${CETUS} -alias=2 -privatize=1 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-privatize1.c
                                gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-privatize1_Parallel cetus_3mm-privatize1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -privatize=2 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-privatize2.c
                                gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-privatize2_Parallel cetus_3mm-privatize2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -range=0 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-range0.c
                                gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-range0_Parallel cetus_3mm-range0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -range=1 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-range1.c
                                gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-range1_Parallel cetus_3mm-range1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -range=2 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-range2.c
                                gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-range2_Parallel cetus_3mm-range2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -reduction=0 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-reduction0.c
                                gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-reduction0_Parallel cetus_3mm-reduction0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -reduction=1 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-reduction1.c
                                gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-reduction1_Parallel cetus_3mm-reduction1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -reduction=2 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-reduction2.c
                                gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-reduction2_Parallel cetus_3mm-reduction2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -induction=0 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-induction0.c
                        gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-induction0_Parallel cetus_3mm-induction0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -induction=1 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-induction1.c
                                gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-induction1_Parallel cetus_3mm-induction1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -induction=2 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-induction2.c
                            gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-induction2_Parallel cetus_3mm-induction2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -induction=3 3mm.c
                                cp cetus_output/3mm.c cetus_3mm-induction3.c
                            gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-induction3_Parallel cetus_3mm-induction3.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -profitable-omp=0  3mm.c
                                cp cetus_output/3mm.c cetus_3mm-profitable-omp0.c
                                gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-profitable-omp0_Parallel cetus_3mm-profitable-omp0.c -lm 

                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -profitable-omp=1  3mm.c
                                cp cetus_output/3mm.c cetus_3mm-profitable-omp1.c
                            gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-profitable-omp1_Parallel cetus_3mm-profitable-omp1.c -lm     

                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -profitable-omp=2  3mm.c
                                cp cetus_output/3mm.c cetus_3mm-profitable-omp2.c
                        gcc -O3 -I utilities -I ../3mm ../utilities/polybench.c -fopenmp -o 3mm-profitable-omp2_Parallel cetus_3mm-profitable-omp2.c -lm
                                echo "<----------------------------->"

elif [ ${BENCH_NAME} = "gramschmidt" ]
        then


                                ${CETUS} -alias=2 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-alias2.c
                                gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-alias2_Parallel cetus_gramschmidt-alias2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -ddt=0 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-ddt0.c
                        gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-ddt0_Parallel cetus_gramschmidt-ddt0.c -lm       

                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -ddt=1 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-ddt1.c
                                gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-ddt1_Parallel cetus_gramschmidt-ddt1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -ddt=2 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-ddt2.c
                                gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-ddt2_Parallel cetus_gramschmidt-ddt2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -parallelize-loops=0 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-parallelize-loops0.c
                                gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-parallelize-loops0_Parallel cetus_gramschmidt-parallelize-loops0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -parallelize-loops=1 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-parallelize-loops1.c
                                gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-parallelize-loops1_Parallel cetus_gramschmidt-parallelize-loops1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -privatize=0 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-privatize0.c
                                gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-privatize0_Parallel cetus_gramschmidt-privatize0.c -lm
                                echo "<----------------------------->"


                                ${CETUS} -alias=2 -privatize=1 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-privatize1.c
                                gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-privatize1_Parallel cetus_gramschmidt-privatize1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -privatize=2 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-privatize2.c
                                gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-privatize2_Parallel cetus_gramschmidt-privatize2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -range=0 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-range0.c
                                gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-range0_Parallel cetus_gramschmidt-range0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -range=1 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-range1.c
                                gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-range1_Parallel cetus_gramschmidt-range1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -range=2 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-range2.c
                                gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-range2_Parallel cetus_gramschmidt-range2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -reduction=0 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-reduction0.c
                                gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-reduction0_Parallel cetus_gramschmidt-reduction0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -reduction=1 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-reduction1.c
                                gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-reduction1_Parallel cetus_gramschmidt-reduction1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -reduction=2 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-reduction2.c
                                gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-reduction2_Parallel cetus_gramschmidt-reduction2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -induction=0 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-induction0.c
                        gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-induction0_Parallel cetus_gramschmidt-induction0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -induction=1 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-induction1.c
                                gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-induction1_Parallel cetus_gramschmidt-induction1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -induction=2 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-induction2.c
                            gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-induction2_Parallel cetus_gramschmidt-induction2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -induction=3 gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-induction3.c
                            gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-induction3_Parallel cetus_gramschmidt-induction3.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -profitable-omp=0  gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-profitable-omp0.c
                                gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-profitable-omp0_Parallel cetus_gramschmidt-profitable-omp0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -profitable-omp=1  gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-profitable-omp1.c
                            gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-profitable-omp1_Parallel cetus_gramschmidt-profitable-omp1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -profitable-omp=2  gramschmidt.c
                                cp cetus_output/gramschmidt.c cetus_gramschmidt-profitable-omp2.c
                        gcc -O3 -I utilities -I ../gramschmidt ../utilities/polybench.c -fopenmp -o gramschmidt-profitable-omp2_Parallel cetus_gramschmidt-profitable-omp2.c -lm
                                echo "<----------------------------->"

elif [ ${BENCH_NAME} = "doitgen" ]
        then


                                ${CETUS} -alias=2 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-alias2.c
                                gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-alias2_Parallel cetus_doitgen-alias2.c -lm       

                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -ddt=0 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-ddt0.c
                        gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-ddt0_Parallel cetus_doitgen-ddt0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -ddt=1 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-ddt1.c
                                gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-ddt1_Parallel cetus_doitgen-ddt1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -ddt=2 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-ddt2.c
                                gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-ddt2_Parallel cetus_doitgen-ddt2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -parallelize-loops=0 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-parallelize-loops0.c
                                gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-parallelize-loops0_Parallel cetus_doitgen-parallelize-loops0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -parallelize-loops=1 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-parallelize-loops1.c
                                gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-parallelize-loops1_Parallel cetus_doitgen-parallelize-loops1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -privatize=0 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-privatize0.c
                                gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-privatize0_Parallel cetus_doitgen-privatize0.c -lm
                                echo "<----------------------------->"


                                ${CETUS} -alias=2 -privatize=1 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-privatize1.c
                                gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-privatize1_Parallel cetus_doitgen-privatize1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -privatize=2 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-privatize2.c
                                gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-privatize2_Parallel cetus_doitgen-privatize2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -range=0 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-range0.c
                                gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-range0_Parallel cetus_doitgen-range0.c -lm       

                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -range=1 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-range1.c
                                gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-range1_Parallel cetus_doitgen-range1.c -lm       

                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -range=2 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-range2.c
                                gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-range2_Parallel cetus_doitgen-range2.c -lm       

                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -reduction=0 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-reduction0.c
                                gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-reduction0_Parallel cetus_doitgen-reduction0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -reduction=1 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-reduction1.c
                                gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-reduction1_Parallel cetus_doitgen-reduction1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -reduction=2 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-reduction2.c
                                gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-reduction2_Parallel cetus_doitgen-reduction2.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -induction=0 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-induction0.c
                        gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-induction0_Parallel cetus_doitgen-induction0.c -lm       
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -induction=1 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-induction1.c
                                gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-induction1_Parallel cetus_doitgen-induction1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -induction=2 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-induction2.c
                            gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-induction2_Parallel cetus_doitgen-induction2.c -lm   
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -induction=3 doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-induction3.c
                            gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-induction3_Parallel cetus_doitgen-induction3.c -lm   
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -profitable-omp=0  doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-profitable-omp0.c
                                gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-profitable-omp0_Parallel cetus_doitgen-profitable-omp0.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -profitable-omp=1  doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-profitable-omp1.c
                            gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-profitable-omp1_Parallel cetus_doitgen-profitable-omp1.c -lm
                                echo "<----------------------------->"

                                ${CETUS} -alias=2 -profitable-omp=2  doitgen.c
                                cp cetus_output/doitgen.c cetus_doitgen-profitable-omp2.c
                        gcc -O3 -I utilities -I ../doitgen ../utilities/polybench.c -fopenmp -o doitgen-profitable-omp2_Parallel cetus_doitgen-profitable-omp2.c 
-lm
                                echo "<----------------------------->"
fi