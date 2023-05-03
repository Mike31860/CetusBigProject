/*
Copyright (C) 1991-2020 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it andor
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https:www.gnu.org/licenses/>. 
*/
/*
This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it. 
*/
/*
glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default. 
*/
/*
wchar_t uses Unicode 10.0.0.  Version 10.0 of the Unicode Standard is
   synchronized with ISOIEC 10646:2017, fifth edition, plus
   the following additions from Amendment 1 to the fifth edition:
   - 56 emoji characters
   - 285 hentaigana
   - 3 additional Zanabazar Square characters
*/
/* ------------------------------------------------------------------------- */
/*                                                                          */
/*  This benchmark is a serial C version of the NPB EP code. This C         */
/*  version is developed by the Center for Manycore Programming at Seoul    */
/*  National University and derived from the serial Fortran versions in     */
/*  "NPB3.3-SER" developed by NAS.                                          */
/*                                                                          */
/*  Permission to use, copy, distribute and modify this software for any    */
/*  purpose with or without fee is hereby granted. This software is         */
/*  provided "as is" without express or implied warranty.                   */
/*                                                                          */
/*  Information on NPB 3.3, including the technical report, the original    */
/*  specifications, source code, results and information on how to submit   */
/*  new results, is available at:                                           */
/*                                                                          */
/*           http:www.nas.nasa.govSoftware/NPB/                          */
/*                                                                          */
/*  Send comments or suggestions for this C version to cmp@aces.snu.ac.kr   */
/*                                                                          */
/*          Center for Manycore Programming                                 */
/*          School of Computer Science and Engineering                      */
/*          Seoul National University                                       */
/*          Seoul 151-744, Korea                                            */
/*                                                                          */
/*          E-mail:  cmp@aces.snu.ac.kr                                     */
/*                                                                          */
/* ------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------- */
/* Authors: Sangmin Seo, Jungwon Kim, Jun Lee, Jeongho Nah, Gangwon Jo,     */
/*          and Jaejin Lee                                                  */
/* ------------------------------------------------------------------------- */
/* -------------------------------------------------------------------- */
/*      program EMBAR */
/* -------------------------------------------------------------------- */
/*  This is the serial version of the APP Benchmark 1, */
/*  the "embarassingly parallel" benchmark. */
/*  */
/*  */
/*  M is the Log_2 of the number of complex pairs of uniform (0, 1) random */
/*  numbers.  MK is the Log_2 of the size of each batch of uniform random */
/*  numbers.  MK can be set for convenience on a given system, since it does */
/*  not affect the results. */
/* -------------------------------------------------------------------- */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "type.h"
#include "npbparams.h"
#include "randdp.h"
#include "timers.h"
#include <stdio.h>
#include <time.h>
#include "print_results.h"
static double x[(2*(1<<16))];
static double q[10];
double time_spent = 0.0;
double time_spent2 = 0.0;
double time_spent3 = 0.0;
double time_spent4 = 0.0;
int main()
{
	double Mops, t1, t2, t3, t4, x1, x2;
	double sx, sy, tm, an, tt, gc;
	double sx_verify_value, sy_verify_value, sx_err, sy_err;
	int np;
	int i, ik, kk, l, k, nit;
	int k_offset, j;
	logical verified, timers_enabled;
	double dum[3];
	char size[16];
	FILE * fp;
	clock_t begin = clock();
	clock_t end = clock();
	clock_t begin2 = clock();
	clock_t end2 = clock();
	clock_t begin3 = clock();
	clock_t end3 = clock();
	clock_t begin4 = clock();
	clock_t end4 = clock();
	int _ret_val_0;
	if ((fp=fopen("timer.flag", "r"))==((void * )0))
	{
		timers_enabled=false;
	}
	else
	{
		timers_enabled=true;
		fclose(fp);
	}
	/* -------------------------------------------------------------------- */
	/*  Because the size of the problem is too large to store in a 32-bit */
	/*  integer for some classes, we put it into a string (for printing). */
	/*  Have to strip off the decimal point put in there by the floating */
	/*  point print statement (internal file) */
	/* -------------------------------------------------------------------- */
	sprintf(size, "%15.0lf", pow(2.0, 32+1));
	j=14;
	if (size[j]=='.')
	{
		j -- ;
	}
	size[j+1]='\0';
	printf("\n\n NAS Parallel Benchmarks (NPB3.3-SER-C) - EP Benchmark\n");
	printf("\n Number of random numbers generated: %15s\n", size);
	verified=false;
	/* -------------------------------------------------------------------- */
	/*  Compute the number of "batches" of random number pairs generated  */
	/*  per processor. Adjust if the number of processors does not evenly  */
	/*  divide the total number */
	/* -------------------------------------------------------------------- */
	np=(1<<(32-16));
	/* -------------------------------------------------------------------- */
	/*  Call the random number generator functions and initialize */
	/*  the x-array to reduce the effects of paging on the timings. */
	/*  Also, call all mathematical functions that are used. Make */
	/*  sure these initializations cannot be eliminated as dead code. */
	/* -------------------------------------------------------------------- */
	vranlc(0,  & dum[0], dum[1],  & dum[2]);
	dum[0]=randlc( & dum[1], dum[2]);
	#pragma cetus private(i) 
	#pragma loop name main#0 
	#pragma cetus parallel 
	#pragma omp parallel for private(i)
	for (i=0; i<(2*(1<<16)); i ++ )
	{
		x[i]=( - 1.0E99);
	}
	Mops=log(sqrt(fabs(((1.0>1.0) ? 1.0 : 1.0))));
	timer_clear(0);
	timer_clear(1);
	timer_clear(2);
	timer_start(0);
	t1=1.220703125E9;
	vranlc(0,  & t1, 1.220703125E9, x);
	/* -------------------------------------------------------------------- */
	/*  Compute AN = A ^ (2 NK) (mod 2^46). */
	/* -------------------------------------------------------------------- */
	t1=1.220703125E9;
	#pragma cetus private(i, t2) 
	#pragma loop name main#1 
	for (i=0; i<(16+1); i ++ )
	{
		t2=randlc( & t1, t1);
	}
	time_spent+=(((double)(end-begin))/((__clock_t)1000000));
	an=t1;
	tt=2.71828183E8;
	gc=0.0;
	sx=0.0;
	sy=0.0;
	#pragma cetus private(i) 
	#pragma loop name main#2 
	#pragma cetus parallel 
	/*
	Disabled due to low profitability: #pragma omp parallel for private(i)
	*/
	for (i=0; i<10; i ++ )
	{
		q[i]=0.0;
	}
	time_spent2+=(((double)(end2-begin2))/((__clock_t)1000000));
	/* -------------------------------------------------------------------- */
	/*  Each instance of this loop may be performed independently. We compute */
	/*  the k offsets separately to take into account the fact that some nodes */
	/*  have more numbers to generate than others */
	/* -------------------------------------------------------------------- */
	k_offset=( - 1);
	#pragma cetus private(i, ik, k, kk, l, t3, t4, x1, x2) 
	#pragma loop name main#3 
	/* #pragma cetus reduction(+: sx, sy)  */
	for (k=1; k<=np; k ++ )
	{
		kk=(k_offset+k);
		t1=2.71828183E8;
		t2=an;
		/* Find starting seed t1 for this kk. */
		#pragma loop name main#3#0 
		for (i=1; i<=100; i ++ )
		{
			ik=(kk/2);
			if ((2*ik)!=kk)
			{
				t3=randlc( & t1, t2);
			}
			if (ik==0)
			{
				break;
			}
			t3=randlc( & t2, t2);
			kk=ik;
		}
		/* -------------------------------------------------------------------- */
		/*  Compute uniform pseudorandom numbers. */
		/* -------------------------------------------------------------------- */
		if (timers_enabled)
		{
			timer_start(2);
		}
		vranlc(2*(1<<16),  & t1, 1.220703125E9, x);
		if (timers_enabled)
		{
			timer_stop(2);
		}
		/* -------------------------------------------------------------------- */
		/*  Compute Gaussian deviates by acceptance-rejection method and  */
		/*  tally counts in concentrisquare annuli.  This loop is not  */
		/*  vectorizable.  */
		/* -------------------------------------------------------------------- */
		if (timers_enabled)
		{
			timer_start(1);
		}
		#pragma cetus private(i, l, t1, t2, t3, t4, x1, x2) 
		#pragma loop name main#3#1 
		/* #pragma cetus reduction(+: sx, sy)  */
		for (i=0; i<(1<<16); i ++ )
		{
			x1=((2.0*x[2*i])-1.0);
			x2=((2.0*x[(2*i)+1])-1.0);
			t1=((x1*x1)+(x2*x2));
			if (t1<=1.0)
			{
				t2=sqrt((( - 2.0)*log(t1))/t1);
				t3=(x1*t2);
				t4=(x2*t2);
				l=((fabs(t3)>fabs(t4)) ? fabs(t3) : fabs(t4));
				q[l]=(q[l]+1.0);
				sx=(sx+t3);
				sy=(sy+t4);
			}
		}
		if (timers_enabled)
		{
			timer_stop(1);
		}
	}
	time_spent3+=(((double)(end3-begin3))/((__clock_t)1000000));
	#pragma cetus private(i) 
	#pragma loop name main#4 
	#pragma cetus reduction(+: gc) 
	#pragma cetus parallel 
	/*
	Disabled due to low profitability: #pragma omp parallel for private(i) reduction(+: gc)
	*/
	for (i=0; i<10; i ++ )
	{
		gc=(gc+q[i]);
	}
	time_spent4+=(((double)(end4-begin4))/((__clock_t)1000000));
	timer_stop(0);
	tm=timer_read(0);
	nit=0;
	verified=true;
	sx_verify_value=47643.67927995374;
	sy_verify_value=( - 80840.72988043731);
	if (verified)
	{
		sx_err=fabs((sx-sx_verify_value)/sx_verify_value);
		sy_err=fabs((sy-sy_verify_value)/sy_verify_value);
		verified=((sx_err<=1.0E-8)&&(sy_err<=1.0E-8));
	}
	Mops=((pow(2.0, 32+1)/tm)/1000000.0);
	printf("\nEP Benchmark Results:\n\n");
	printf("CPU Time =%10.4lf\n", tm);
	printf("N = 2^%5d\n", 32);
	printf("No. Gaussian Pairs = %15.0lf\n", gc);
	printf("Sums = %25.15lE %25.15lE\n", sx, sy);
	printf("Counts: \n");
	#pragma cetus private(i) 
	#pragma loop name main#5 
	for (i=0; i<10; i ++ )
	{
		printf("%3d%15.0lf\n", i, q[i]);
	}
	print_results("EP", 'C', 32+1, 0, 0, nit, tm, Mops, "Random numbers generated", verified, "3.3.1", "02 Aug 2021", "gcc", "$(CC)", "-lm", "-I../common", "-g -Wall -O3 -fopenmp -mcmodel=large", "-O3 -fopenmp -mcmodel=large", "randdp");
	if (timers_enabled)
	{
		if (tm<=0.0)
		{
			tm=1.0;
		}
		tt=timer_read(0);
		printf("\nTotal time:     %9.3lf (%6.2lf)\n", tt, (tt*100.0)/tm);
		tt=timer_read(1);
		printf("Gaussian pairs: %9.3lf (%6.2lf)\n", tt, (tt*100.0)/tm);
		tt=timer_read(2);
		printf("Random numbers: %9.3lf (%6.2lf)\n", tt, (tt*100.0)/tm);
	}
	printf("The elapsed time 1 is %f seconds \n", time_spent);
	printf("The elapsed time 2 is %f seconds \n", time_spent2);
	printf("The elapsed time 3 is %f seconds \n", time_spent3);
	printf("The elapsed time 4 is %f seconds \n", time_spent4);
	_ret_val_0=0;
	return _ret_val_0;
}
