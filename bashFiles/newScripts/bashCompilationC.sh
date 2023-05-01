#!/bin/bash
CETUS=$PWD/cetus-1.4.4/bin/cetus
cd ..
GIT_DIR=$PWD
echo $GIT_DIR
BENCH_DIR=$GIT_DIR/SNU_NPB-1.0.3/NPB3.3-SER-C
BENCH_NAME=CG
FILE_NAME=cg
BENCH_CLASS=C
N_PAR=1
N_ITER=10
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
		(echo -n "alias=0,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -alias=0 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_alias=0_${i}.o 
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "alias=1, ${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -alias=1 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_alias=1_${i}.o 
		#(time ./output/cetus_${FILE_NAME}_${i}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "alias=3,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -alias=3 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_alias=3_${i}.o 
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "ddt=1,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -ddt=1 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_ddt=1_${i}.o 
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "ddt=2,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -ddt=2 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_ddt=2_${i}.o 
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "parallelize-loops=0,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -parallelize-loops=0 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_parallelize-loops=0_${i}.o 
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "parallelize-loops=1,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -parallelize-loops=1 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_parallelize-loops=1_${i}.o 
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "privatize=0,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -privatize=0 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_privatize=0_${i}.o 
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "privatize=1,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -privatize=1 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_privatize=1_${i}.o 
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "privatize=2,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -privatize=2 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_privatize=2_${i}.o 
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "range=0,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -range=0 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_range=0_${i}.o 
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "range=1,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -range=1 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_range=0_${i}.o 
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "range=2,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -range=2 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_range=2_${i}.o 
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "reduction=0,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -reduction=0 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_reduction=0_${i}.o
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "reduction=1,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -reduction=1 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_reduction=1_${i}.o
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "reduction=2,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -reduction=2 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_reduction=2_${i}.o
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "induction=0,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -induction=0 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_induction=0_${i}.o
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "induction=1,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -induction=1 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_induction=1_${i}.o
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "induction=2,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -induction=2 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_induction=2_${i}.o
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "induction=3,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -induction=3 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_induction=3_${i}.o
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "normalize-loops=0,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -normalize-loops=0 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_normalize-loops=0_${i}.o
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "normalize-loops=1,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -normalize-loops=1 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_normalize-loops=1_${i}.o
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "tinline=1,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -tinline=mode=0:depth=0:debug=0:foronly=0:complement=0 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_tinline=1_${i}.o
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "tinline=2,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -tinline=mode=0:depth=0:debug=0:foronly=0:complement=1 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_tinline=2_${i}.o
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "tinline=3,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -tinline=mode=1:depth=0:debug=0:foronly=0:complement=0 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_tinline=3_${i}.o
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "tinline=4,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -tinline=mode=1:depth=0:debug=0:foronly=0:complement=1 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_tinline=4_${i}.o
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "profitable-omp=0,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -profitable-omp=0 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_profitable-omp=0_${i}.o
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

	echo CGDCEP
	for ((i=1; i<=${N_ITER}; i++))
	do
		(echo -n "profitable-omp=1,${i},")>>$F_LOG
		sed -i 's+#include <math.h>+/* #include <math.h> */+' ./${FILE_NAME}.c
		${CETUS} -profitable-omp=1 ${FILE_NAME}.c
		cp cetus_output/${FILE_NAME}.c cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./cetus_${FILE_NAME}.c
		sed -i 's+/\* #include <math.h> \*/+#include <math.h>+' ./${FILE_NAME}.c
		sed -i '1i#define _OPENMP 1' ../common/print_results.c
		(time make cetusopt) 2>>$F_LOG
		truncate -s -1 $F_LOG;	(echo -n ",")>>$F_LOG
		cp cetus_${FILE_NAME}.o output
		mv output/cetus_${FILE_NAME}.o output/cetus_${FILE_NAME}_profitable-omp=1_${i}.o
		#(time ./cetus_${FILE_NAME}.o) 2>>$F_LOG
		#sed -i '/#define _OPENMP 1/d ' ../common/print_results.c
		echo "<----------------------------->"
	done

