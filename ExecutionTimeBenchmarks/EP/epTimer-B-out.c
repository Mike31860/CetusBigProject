#include <stdio.h>
#include <sys/time.h>
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

float time_diff(struct timeval *start, struct timeval *end)
{
    return (end->tv_sec - start->tv_sec) + 1e-6*(end->tv_usec - start->tv_usec);
}

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
	clock_t end = clock();
	if ((fp=fopen("timer.flag", "r"))==((void * )0))
	{
		timers_enabled=false;
	}
	else
	{
		timers_enabled=true;
		fclose(fp);
	}
	sprintf(size, "%15.0lf", pow(2.0, 30+1));
	j=14;
	if (size[j]=='.')
	{
		j -- ;
	}
	size[j+1]='\0';
	printf("\n\n NAS Parallel Benchmarks (NPB3.3-SER-C) - EP Benchmark\n");
	printf("\n Number of random numbers generated: %15s\n", size);
	verified=false;
	np=(1<<(30-16));
	vranlc(0,  & dum[0], dum[1],  & dum[2]);
	dum[0]=randlc( & dum[1], dum[2]);
	#pragma event main#0 start
	
	struct timeval start_main_0, end_main_0;
	gettimeofday(&start_main_0, NULL);
	
	#pragma loop name main#0 
	for (i=0; i<(2*(1<<16)); i ++ )
	{
		x[i]=( - 1.0E99);
	}
	#pragma event main#0 stop
	
	gettimeofday(&end_main_0, NULL);
	printf("Time main_0 seconds %0.8f \n", time_diff(&start_main_0, &end_main_0));
	
	Mops=log(sqrt(fabs(((1.0>1.0) ? 1.0 : 1.0))));
	timer_clear(0);
	timer_clear(1);
	timer_clear(2);
	timer_start(0);
	t1=1.220703125E9;
	vranlc(0,  & t1, 1.220703125E9, x);
	t1=1.220703125E9;
	#pragma event main#1 start
	
	struct timeval start_main_1, end_main_1;
	gettimeofday(&start_main_1, NULL);
	
	#pragma loop name main#1 
	for (i=0; i<(16+1); i ++ )
	{
		t2=randlc( & t1, t1);
	}
	#pragma event main#1 stop
	
	gettimeofday(&end_main_1, NULL);
	printf("Time main_1 seconds %0.8f \n", time_diff(&start_main_1, &end_main_1));
	
	an=t1;
	tt=2.71828183E8;
	gc=0.0;
	sx=0.0;
	sy=0.0;
	#pragma event main#2 start
	
	struct timeval start_main_2, end_main_2;
	gettimeofday(&start_main_2, NULL);
	
	#pragma loop name main#2 
	for (i=0; i<10; i ++ )
	{
		q[i]=0.0;
	}
	#pragma event main#2 stop
	
	gettimeofday(&end_main_2, NULL);
	printf("Time main_2 seconds %0.8f \n", time_diff(&start_main_2, &end_main_2));
	
	k_offset=( - 1);
	#pragma event main#3 start
	
	struct timeval start_main_3, end_main_3;
	gettimeofday(&start_main_3, NULL);
	
	#pragma loop name main#3 
	for (k=1; k<=np; k ++ )
	{
		kk=(k_offset+k);
		t1=2.71828183E8;
		t2=an;
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
		if (timers_enabled)
		{
			timer_start(2);
		}
		vranlc(2*(1<<16),  & t1, 1.220703125E9, x);
		if (timers_enabled)
		{
			timer_stop(2);
		}
		if (timers_enabled)
		{
			timer_start(1);
		}
		#pragma loop name main#3#1 
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
	#pragma event main#3 stop
	
	gettimeofday(&end_main_3, NULL);
	printf("Time main_3 seconds %0.8f \n", time_diff(&start_main_3, &end_main_3));
	
	#pragma event main#4 start
	
	struct timeval start_main_4, end_main_4;
	gettimeofday(&start_main_4, NULL);
	
	#pragma loop name main#4 
	for (i=0; i<10; i ++ )
	{
		gc=(gc+q[i]);
	}
	#pragma event main#4 stop
	
	gettimeofday(&end_main_4, NULL);
	printf("Time main_4 seconds %0.8f \n", time_diff(&start_main_4, &end_main_4));
	
	timer_stop(0);
	tm=timer_read(0);
	nit=0;
	verified=true;
	if (30==24)
	{
		sx_verify_value=( - 3247.83465203474);
		sy_verify_value=( - 6958.407078382297);
	}
	else
	{
		if (30==25)
		{
			sx_verify_value=( - 2863.319731645753);
			sy_verify_value=( - 6320.053679109499);
		}
		else
		{
			if (30==28)
			{
				sx_verify_value=( - 4295.875165629892);
				sy_verify_value=( - 15807.32573678431);
			}
			else
			{
				if (30==30)
				{
					sx_verify_value=40338.15542441498;
					sy_verify_value=( - 26606.69192809235);
				}
				else
				{
					if (30==32)
					{
						sx_verify_value=47643.67927995374;
						sy_verify_value=( - 80840.72988043731);
					}
					else
					{
						if (30==36)
						{
							sx_verify_value=198248.1200946593;
							sy_verify_value=( - 102059.6636361769);
						}
						else
						{
							if (30==40)
							{
								sx_verify_value=( - 531971.744153);
								sy_verify_value=( - 368883.4557731);
							}
							else
							{
								verified=false;
							}
						}
					}
				}
			}
		}
	}
	if (verified)
	{
		sx_err=fabs((sx-sx_verify_value)/sx_verify_value);
		sy_err=fabs((sy-sy_verify_value)/sy_verify_value);
		verified=((sx_err<=1.0E-8)&&(sy_err<=1.0E-8));
	}
	Mops=((pow(2.0, 30+1)/tm)/1000000.0);
	printf("\nEP Benchmark Results:\n\n");
	printf("CPU Time =%10.4lf\n", tm);
	printf("N = 2^%5d\n", 30);
	printf("No. Gaussian Pairs = %15.0lf\n", gc);
	printf("Sums = %25.15lE %25.15lE\n", sx, sy);
	printf("Counts: \n");
	#pragma event main#5 start
	
	struct timeval start_main_5, end_main_5;
	gettimeofday(&start_main_5, NULL);
	
	#pragma loop name main#5 
	for (i=0; i<10; i ++ )
	{
		printf("%3d%15.0lf\n", i, q[i]);
	}
	#pragma event main#5 stop
	
	gettimeofday(&end_main_5, NULL);
	printf("Time main_5 seconds %0.8f \n", time_diff(&start_main_5, &end_main_5));
	
	print_results("EP", 'B', 30+1, 0, 0, nit, tm, Mops, "Random numbers generated", verified, "3.3.1", "01 May 2023", "gcc", "$(CC)", "-lm", "-I../common", "-g -Wall -O3 -fopenmp -mcmodel=large", "-O3 -fopenmp -mcmodel=large", "randdp");
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
	return 0;
}
