#include <stdio.h>

#include <stdlib.h>

#include <time.h>

#include "header.h"

/* #include "headerVariable.h" */

#include "../../common/print_results.h"
#include <sys/time.h>
#include "time_diff.h"
int grid_points[3], nx2, ny2, nz2;
logical timeron;
/* double time_spent = 0.0;
double time_spent2 = 0.0;
double time_spent3 = 0.0;
double time_spent4 = 0.0;
double time_spent5 = 0.0;
double time_spent6 = 0.0;
double time_spent7 = 0.0;
double time_spent8 = 0.0;
double time_spent9 = 0.0;
double time_spent10 = 0.0;
double time_spent11 = 0.0;
double time_spent12 = 0.0;
double time_spent13 = 0.0;
double time_spent14 = 0.0;
double time_spent15 = 0.0;
double time_spent16 = 0.0;
double time_spent17 = 0.0;
double time_spent18 = 0.0;
double time_spent19 = 0.0; */
double tx1, tx2, tx3, ty1, ty2, ty3, tz1, tz2, tz3, dx1, dx2, dx3, dx4, dx5, dy1, dy2, dy3, dy4, dy5, dz1, dz2, dz3, dz4, dz5, dssp, dt, ce[5][13], dxmax, dymax, dzmax, xxcon1, xxcon2, xxcon3, xxcon4, xxcon5, dx1tx1, dx2tx1, dx3tx1, dx4tx1, dx5tx1, yycon1, yycon2, yycon3, yycon4, yycon5, dy1ty1, dy2ty1, dy3ty1, dy4ty1, dy5ty1, zzcon1, zzcon2, zzcon3, zzcon4, zzcon5, dz1tz1, dz2tz1, dz3tz1, dz4tz1, dz5tz1, dnxm1, dnym1, dnzm1, c1c2, c1c5, c3c4, c1345, conz1, c1, c2, c3, c4, c5, c4dssp, c5dssp, dtdssp, dttx1, bt, dttx2, dtty1, dtty2, dttz1, dttz2, c2dttx1, c2dtty1, c2dttz1, comz1, comz4, comz5, comz6, c3c4tx3, c3c4ty3, c3c4tz3, c2iv, con43, con16;
double u[64][(((64/2)*2)+1)][(((64/2)*2)+1)][5];
double us[64][(((64/2)*2)+1)][(((64/2)*2)+1)];
double vs[64][(((64/2)*2)+1)][(((64/2)*2)+1)];
double ws[64][(((64/2)*2)+1)][(((64/2)*2)+1)];
double qs[64][(((64/2)*2)+1)][(((64/2)*2)+1)];
double rho_i[64][(((64/2)*2)+1)][(((64/2)*2)+1)];
double speed[64][(((64/2)*2)+1)][(((64/2)*2)+1)];
double square[64][(((64/2)*2)+1)][(((64/2)*2)+1)];
double rhs[64][(((64/2)*2)+1)][(((64/2)*2)+1)][5];
double forcing[64][(((64/2)*2)+1)][(((64/2)*2)+1)][5];
double cv[64];
double rhon[64];
double rhos[64];
double rhoq[64];
double cuf[64];
double q[64];
double ue[64][5];
double buf[64][5];
double lhs[(((64/2)*2)+1)][(((64/2)*2)+1)][5];
double lhsp[(((64/2)*2)+1)][(((64/2)*2)+1)][5];
double lhsm[(((64/2)*2)+1)][(((64/2)*2)+1)][5];
int main(int argc, char * argv[])
{
	int i, niter, step, n3;
	double mflops, t, tmax, trecs[(15+1)];
	logical verified;
	char Class;
	char * t_names[(15+1)];
	FILE * fp;
	clock_t begin = clock();
	clock_t end = clock();
	clock_t begin2 = clock();
	clock_t end2 = clock();
	clock_t begin3 = clock();
	clock_t end3 = clock();
	clock_t begin4 = clock();
	clock_t end4 = clock();
	clock_t begin5 = clock();
	clock_t end5 = clock();
	clock_t begin7 = clock();
	clock_t end7 = clock();
	clock_t begin8 = clock();
	clock_t end8 = clock();
	if ((fp=fopen("timer.flag", "r"))!=((void * )0))
	{
		timeron=true;
		t_names[1]="total";
		t_names[2]="rhsx";
		t_names[3]="rhsy";
		t_names[4]="rhsz";
		t_names[5]="rhs";
		t_names[6]="xsolve";
		t_names[7]="ysolve";
		t_names[8]="zsolve";
		t_names[9]="redist1";
		t_names[10]="redist2";
		t_names[14]="tzetar";
		t_names[13]="ninvr";
		t_names[12]="pinvr";
		t_names[11]="txinvr";
		t_names[15]="add";
		fclose(fp);
	}
	else
	{
		timeron=false;
	}
	printf("\n\n NAS Parallel Benchmarks (NPB3.3-SER-C) - SP Benchmark\n\n");
	if ((fp=fopen("inputsp.data", "r"))!=((void * )0))
	{
		int result;
		printf(" Reading from input file inputsp.data\n");
		result=fscanf(fp, "%d",  & niter);
		while (fgetc(fp)!='\n')
		{
			;
		}
		result=fscanf(fp, "%lf",  & dt);
		while (fgetc(fp)!='\n')
		{
			;
		}
		result=fscanf(fp, "%d%d%d",  & grid_points[0],  & grid_points[1],  & grid_points[2]);
		fclose(fp);
	}
	else
	{
		printf(" No input file inputsp.data. Using compiled defaults\n");
		niter=400;
		dt=0.0015;
		grid_points[0]=64;
		grid_points[1]=64;
		grid_points[2]=64;
	}
	printf(" Size: %4dx%4dx%4d\n", grid_points[0], grid_points[1], grid_points[2]);
	printf(" Iterations: %4d    dt: %10.6f\n", niter, dt);
	printf("\n");
	if (((grid_points[0]>64)||(grid_points[1]>64))||(grid_points[2]>64))
	{
		printf(" %d, %d, %d\n", grid_points[0], grid_points[1], grid_points[2]);
		printf(" Problem size too big for compiled array sizes\n");
		return 0;
	}
	nx2=(grid_points[0]-2);
	ny2=(grid_points[1]-2);
	nz2=(grid_points[2]-2);
	set_constants();
/* 	time_spent+=(((double)(end-begin))/((clock_t)1000)); */
	#pragma event main#0 start
	
	struct timeval start_main_0, end_main_0;
	gettimeofday(&start_main_0, NULL);
	
	#pragma loop name main#0 
	for (i=1; i<=15; i ++ )
	{
		timer_clear(i);
	}
	#pragma event main#0 stop
	
	gettimeofday(&end_main_0, NULL);
	printf("Time main_0 seconds %0.8f \n", time_diff(&start_main_0, &end_main_0));
	
	exact_rhs();
/* 	time_spent2+=(((double)(end2-begin2))/((clock_t)1000)); */
	initialize();
	/* time_spent3+=(((double)(end3-begin3))/((clock_t)1000)); */
	adi();
	/* time_spent4+=(((double)(end4-begin4))/((clock_t)1000)); */
	initialize();
/* 	time_spent5+=(((double)(end5-begin5))/((clock_t)1000)); */
	#pragma event main#1 start
	
	struct timeval start_main_1, end_main_1;
	gettimeofday(&start_main_1, NULL);
	
	#pragma loop name main#1 
	for (i=1; i<=15; i ++ )
	{
		timer_clear(i);
	}
	#pragma event main#1 stop
	
	gettimeofday(&end_main_1, NULL);
	printf("Time main_1 seconds %0.8f \n", time_diff(&start_main_1, &end_main_1));
	
	timer_start(1);
	#pragma event main#2 start
	
	struct timeval start_main_2, end_main_2;
	gettimeofday(&start_main_2, NULL);
	
	#pragma loop name main#2 
	for (step=1; step<=niter; step ++ )
	{
		clock_t begin6 = clock();
		clock_t end6 = clock();
		if (((step%20)==0)||(step==1))
		{
			printf(" Time step %4d\n", step);
		}
		adi();
	/* 	time_spent4+=(((double)(end6-begin6))/((clock_t)1000)); */
	}
	#pragma event main#2 stop
	
	gettimeofday(&end_main_2, NULL);
	printf("Time main_2 seconds %0.8f \n", time_diff(&start_main_2, &end_main_2));
	
	timer_stop(1);
	tmax=timer_read(1);
	verify(niter,  & Class,  & verified);
	/* time_spent7+=(((double)(end7-begin7))/((clock_t)1000)); */
	if (tmax!=0.0)
	{
		n3=((grid_points[0]*grid_points[1])*grid_points[2]);
		t=(((grid_points[0]+grid_points[1])+grid_points[2])/3.0);
		mflops=((((((881.174*((double)n3))-(4683.91*(t*t)))+(11484.5*t))-19272.4)*((double)niter))/(tmax*1000000.0));
	}
	else
	{
		mflops=0.0;
	}
	print_results("SP", Class, grid_points[0], grid_points[1], grid_points[2], niter, tmax, mflops, "          floating point", verified, "3.3.1", "14 Apr 2022", "gcc", "$(CC)", "-lm", "-I../common", "-g -Wall -O3 -fopenmp -mcmodel=large", "-O3 -fopenmp -mcmodel=large", "(none)");
	if (timeron)
	{
		#pragma event main#3 start
		
		struct timeval start_main_3, end_main_3;
		gettimeofday(&start_main_3, NULL);
		
		#pragma loop name main#3 
		for (i=1; i<=15; i ++ )
		{
			trecs[i]=timer_read(i);
		}
		#pragma event main#3 stop
		
		gettimeofday(&end_main_3, NULL);
		printf("Time main_3 seconds %0.8f \n", time_diff(&start_main_3, &end_main_3));
		
		if (tmax==0.0)
		{
			tmax=1.0;
		}
		printf("  SECTION   Time (secs)\n");
		#pragma event main#4 start
		
		struct timeval start_main_4, end_main_4;
		gettimeofday(&start_main_4, NULL);
		
		#pragma loop name main#4 
		for (i=1; i<=15; i ++ )
		{
			printf("  %-8s:%9.3f  (%6.2f%%)\n", t_names[i], trecs[i], (trecs[i]*100.0)/tmax);
			if (i==5)
			{
				t=((trecs[2]+trecs[3])+trecs[4]);
				printf("    --> %8s:%9.3f  (%6.2f%%)\n", "sub-rhs", t, (t*100.0)/tmax);
				t=(trecs[5]-t);
				printf("    --> %8s:%9.3f  (%6.2f%%)\n", "rest-rhs", t, (t*100.0)/tmax);
			}
			else
			{
				if (i==8)
				{
					t=((trecs[8]-trecs[9])-trecs[10]);
					printf("    --> %8s:%9.3f  (%6.2f%%)\n", "sub-zsol", t, (t*100.0)/tmax);
				}
				else
				{
					if (i==10)
					{
						t=(trecs[9]+trecs[10]);
						printf("    --> %8s:%9.3f  (%6.2f%%)\n", "redist", t, (t*100.0)/tmax);
					}
				}
			}
		}
		#pragma event main#4 stop
		
		gettimeofday(&end_main_4, NULL);
		printf("Time main_4 seconds %0.8f \n", time_diff(&start_main_4, &end_main_4));
		
	}
	/*time_spent8+=(((double)(end8-begin8))/((clock_t)1000));
	 printf("The elapsed time 1 is %f seconds \n", time_spent);
	printf("The elapsed time 2 is %f seconds \n", time_spent2);
	printf("The elapsed time 3 is %f seconds \n", time_spent3);
	printf("The elapsed time 4 is %f seconds \n", time_spent4);
	printf("The elapsed time 5 is %f seconds \n", time_spent5);
	printf("The elapsed time 7 is %f seconds \n", time_spent7);
	printf("The elapsed time 8 is %f seconds \n", time_spent8);
	printf("The elapsed time 9 is %f seconds \n", time_spent9);
	printf("The elapsed time 10 is %f seconds \n", time_spent10);
	printf("The elapsed time 11 is %f seconds \n", time_spent11);
	printf("The elapsed time 12 is %f seconds \n", time_spent12);
	printf("The elapsed time 13 is %f seconds \n", time_spent13);
	printf("The elapsed time 14 is %f seconds \n", time_spent14);
	printf("The elapsed time 13 is %f seconds \n", time_spent15);
	printf("The elapsed time 14 is %f seconds \n", time_spent16);
	printf("The elapsed time 13 is %f seconds \n", time_spent17);
	printf("The elapsed time 14 is %f seconds \n", time_spent18);
	printf("The elapsed time 14 is %f seconds \n", time_spent19); */
	return 0;
}
