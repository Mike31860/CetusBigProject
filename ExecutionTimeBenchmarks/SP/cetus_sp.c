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
/*  This benchmark is a serial C version of the NPB SP code. This C         */
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
/* --------------------------------------------------------------------- */
/* program SP */
/* --------------------------------------------------------------------- */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "header.h"
#include "headerVariable.h"
#include "../common/print_results.h"
/* commonglobal */
int grid_points[3], nx2, ny2, nz2;
logical timeron;
double time_spent = 0.0;
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
double time_spent19 = 0.0;
/* commonconstants */
double tx1, tx2, tx3, ty1, ty2, ty3, tz1, tz2, tz3, dx1, dx2, dx3, dx4, dx5, dy1, dy2, dy3, dy4, dy5, dz1, dz2, dz3, dz4, dz5, dssp, dt, ce[5][13], dxmax, dymax, dzmax, xxcon1, xxcon2, xxcon3, xxcon4, xxcon5, dx1tx1, dx2tx1, dx3tx1, dx4tx1, dx5tx1, yycon1, yycon2, yycon3, yycon4, yycon5, dy1ty1, dy2ty1, dy3ty1, dy4ty1, dy5ty1, zzcon1, zzcon2, zzcon3, zzcon4, zzcon5, dz1tz1, dz2tz1, dz3tz1, dz4tz1, dz5tz1, dnxm1, dnym1, dnzm1, c1c2, c1c5, c3c4, c1345, conz1, c1, c2, c3, c4, c5, c4dssp, c5dssp, dtdssp, dttx1, bt, dttx2, dtty1, dtty2, dttz1, dttz2, c2dttx1, c2dtty1, c2dttz1, comz1, comz4, comz5, comz6, c3c4tx3, c3c4ty3, c3c4tz3, c2iv, con43, con16;
/* commonfields */
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
/* commonwork_1d */
double cv[64];
double rhon[64];
double rhos[64];
double rhoq[64];
double cuf[64];
double q[64];
double ue[64][5];
double buf[64][5];
/* commonwork_lhs */
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
		/* --------------------------------------------------------------------- */
		/* Read input file (if it exists), else take */
		/* defaults from parameters */
		/* --------------------------------------------------------------------- */
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
		int _ret_val_0;
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
				_ret_val_0=0;
				return _ret_val_0;
		}
		nx2=(grid_points[0]-2);
		ny2=(grid_points[1]-2);
		nz2=(grid_points[2]-2);
		set_constants();
		time_spent+=(((double)(end-begin))/((__clock_t)1000000));
		#pragma loop name main#0 
		for (i=1; i<=15; i ++ )
		{
				timer_clear(i);
		}
		exact_rhs();
		time_spent2+=(((double)(end2-begin2))/((__clock_t)1000000));
		initialize();
		time_spent3+=(((double)(end3-begin3))/((__clock_t)1000000));
		/* --------------------------------------------------------------------- */
		/* do one time step to touch all code, and reinitialize */
		/* --------------------------------------------------------------------- */
		adi();
		time_spent4+=(((double)(end4-begin4))/((__clock_t)1000000));
		initialize();
		time_spent5+=(((double)(end5-begin5))/((__clock_t)1000000));
		#pragma loop name main#1 
		for (i=1; i<=15; i ++ )
		{
				timer_clear(i);
		}
		timer_start(1);
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
				time_spent4+=(((double)(end6-begin6))/((__clock_t)1000000));
		}
		timer_stop(1);
		tmax=timer_read(1);
		verify(niter,  & Class,  & verified);
		time_spent7+=(((double)(end7-begin7))/((__clock_t)1000000));
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
		/* --------------------------------------------------------------------- */
		/* More timers */
		/* --------------------------------------------------------------------- */
		if (timeron)
		{
				#pragma loop name main#3 
				for (i=1; i<=15; i ++ )
				{
						trecs[i]=timer_read(i);
				}
				if (tmax==0.0)
				{
						tmax=1.0;
				}
				printf("  SECTION   Time (secs)\n");
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
		}
		time_spent8+=(((double)(end8-begin8))/((__clock_t)1000000));
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
		printf("The elapsed time 14 is %f seconds \n", time_spent19);
		_ret_val_0=0;
		return _ret_val_0;
}
