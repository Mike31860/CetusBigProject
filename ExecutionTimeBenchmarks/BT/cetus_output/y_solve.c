#ifdef CETUS_TIMING
typedef struct cetusprofile cetusprofile;
extern cetusprofile cetus_prof;
void cetus_tic(cetusprofile *, int);
void cetus_toc(cetusprofile *, int);
#endif /* CETUS_TIMING */


#include "header.h"
#include "time_diff.h"
#include "work_lhs.h"
#include <stdio.h>
#include <stdlib.h>
#include "timers.h"
#include <sys/time.h>

void y_solve()
{
	int i, j, k, m, n, jsize;
	if (timeron)
	{
		timer_start(7);
	}
	jsize=(grid_points[1]-1);
	#pragma event y_solve#0 start
	
	struct timeval start_y_solve_0, end_y_solve_0;
	gettimeofday(&start_y_solve_0, NULL);
	
	#pragma loop name y_solve#0 
	for (k=1; k<=(grid_points[2]-2); k ++ )
	{
		#pragma loop name y_solve#0#0 
		for (i=1; i<=(grid_points[0]-2); i ++ )
		{
			#pragma loop name y_solve#0#0#0 
			for (j=0; j<=jsize; j ++ )
			{
				tmp1=rho_i[k][j][i];
				tmp2=(tmp1*tmp1);
				tmp3=(tmp1*tmp2);
				fjac[j][0][0]=0.0;
				fjac[j][1][0]=0.0;
				fjac[j][2][0]=1.0;
				fjac[j][3][0]=0.0;
				fjac[j][4][0]=0.0;
				fjac[j][0][1]=(( - (u[k][j][i][1]*u[k][j][i][2]))*tmp2);
				fjac[j][1][1]=(u[k][j][i][2]*tmp1);
				fjac[j][2][1]=(u[k][j][i][1]*tmp1);
				fjac[j][3][1]=0.0;
				fjac[j][4][1]=0.0;
				fjac[j][0][2]=(( - ((u[k][j][i][2]*u[k][j][i][2])*tmp2))+(c2*qs[k][j][i]));
				fjac[j][1][2]=((( - c2)*u[k][j][i][1])*tmp1);
				fjac[j][2][2]=(((2.0-c2)*u[k][j][i][2])*tmp1);
				fjac[j][3][2]=((( - c2)*u[k][j][i][3])*tmp1);
				fjac[j][4][2]=c2;
				fjac[j][0][3]=(( - (u[k][j][i][2]*u[k][j][i][3]))*tmp2);
				fjac[j][1][3]=0.0;
				fjac[j][2][3]=(u[k][j][i][3]*tmp1);
				fjac[j][3][3]=(u[k][j][i][2]*tmp1);
				fjac[j][4][3]=0.0;
				fjac[j][0][4]=(((((c2*2.0)*square[k][j][i])-(c1*u[k][j][i][4]))*u[k][j][i][2])*tmp2);
				fjac[j][1][4]=(((( - c2)*u[k][j][i][1])*u[k][j][i][2])*tmp2);
				fjac[j][2][4]=(((c1*u[k][j][i][4])*tmp1)-(c2*(qs[k][j][i]+((u[k][j][i][2]*u[k][j][i][2])*tmp2))));
				fjac[j][3][4]=((( - c2)*(u[k][j][i][2]*u[k][j][i][3]))*tmp2);
				fjac[j][4][4]=((c1*u[k][j][i][2])*tmp1);
				njac[j][0][0]=0.0;
				njac[j][1][0]=0.0;
				njac[j][2][0]=0.0;
				njac[j][3][0]=0.0;
				njac[j][4][0]=0.0;
				njac[j][0][1]=((( - c3c4)*tmp2)*u[k][j][i][1]);
				njac[j][1][1]=(c3c4*tmp1);
				njac[j][2][1]=0.0;
				njac[j][3][1]=0.0;
				njac[j][4][1]=0.0;
				njac[j][0][2]=(((( - con43)*c3c4)*tmp2)*u[k][j][i][2]);
				njac[j][1][2]=0.0;
				njac[j][2][2]=((con43*c3c4)*tmp1);
				njac[j][3][2]=0.0;
				njac[j][4][2]=0.0;
				njac[j][0][3]=((( - c3c4)*tmp2)*u[k][j][i][3]);
				njac[j][1][3]=0.0;
				njac[j][2][3]=0.0;
				njac[j][3][3]=(c3c4*tmp1);
				njac[j][4][3]=0.0;
				njac[j][0][4]=(((((( - (c3c4-c1345))*tmp3)*(u[k][j][i][1]*u[k][j][i][1]))-((((con43*c3c4)-c1345)*tmp3)*(u[k][j][i][2]*u[k][j][i][2])))-(((c3c4-c1345)*tmp3)*(u[k][j][i][3]*u[k][j][i][3])))-((c1345*tmp2)*u[k][j][i][4]));
				njac[j][1][4]=(((c3c4-c1345)*tmp2)*u[k][j][i][1]);
				njac[j][2][4]=((((con43*c3c4)-c1345)*tmp2)*u[k][j][i][2]);
				njac[j][3][4]=(((c3c4-c1345)*tmp2)*u[k][j][i][3]);
				njac[j][4][4]=(c1345*tmp1);
			}
			lhsinit(lhs, jsize);
			#pragma loop name y_solve#0#0#1 
			for (j=1; j<=(jsize-1); j ++ )
			{
				tmp1=(dt*ty1);
				tmp2=(dt*ty2);
				lhs[j][0][0][0]=(((( - tmp2)*fjac[j-1][0][0])-(tmp1*njac[j-1][0][0]))-(tmp1*dy1));
				lhs[j][0][1][0]=((( - tmp2)*fjac[j-1][1][0])-(tmp1*njac[j-1][1][0]));
				lhs[j][0][2][0]=((( - tmp2)*fjac[j-1][2][0])-(tmp1*njac[j-1][2][0]));
				lhs[j][0][3][0]=((( - tmp2)*fjac[j-1][3][0])-(tmp1*njac[j-1][3][0]));
				lhs[j][0][4][0]=((( - tmp2)*fjac[j-1][4][0])-(tmp1*njac[j-1][4][0]));
				lhs[j][0][0][1]=((( - tmp2)*fjac[j-1][0][1])-(tmp1*njac[j-1][0][1]));
				lhs[j][0][1][1]=(((( - tmp2)*fjac[j-1][1][1])-(tmp1*njac[j-1][1][1]))-(tmp1*dy2));
				lhs[j][0][2][1]=((( - tmp2)*fjac[j-1][2][1])-(tmp1*njac[j-1][2][1]));
				lhs[j][0][3][1]=((( - tmp2)*fjac[j-1][3][1])-(tmp1*njac[j-1][3][1]));
				lhs[j][0][4][1]=((( - tmp2)*fjac[j-1][4][1])-(tmp1*njac[j-1][4][1]));
				lhs[j][0][0][2]=((( - tmp2)*fjac[j-1][0][2])-(tmp1*njac[j-1][0][2]));
				lhs[j][0][1][2]=((( - tmp2)*fjac[j-1][1][2])-(tmp1*njac[j-1][1][2]));
				lhs[j][0][2][2]=(((( - tmp2)*fjac[j-1][2][2])-(tmp1*njac[j-1][2][2]))-(tmp1*dy3));
				lhs[j][0][3][2]=((( - tmp2)*fjac[j-1][3][2])-(tmp1*njac[j-1][3][2]));
				lhs[j][0][4][2]=((( - tmp2)*fjac[j-1][4][2])-(tmp1*njac[j-1][4][2]));
				lhs[j][0][0][3]=((( - tmp2)*fjac[j-1][0][3])-(tmp1*njac[j-1][0][3]));
				lhs[j][0][1][3]=((( - tmp2)*fjac[j-1][1][3])-(tmp1*njac[j-1][1][3]));
				lhs[j][0][2][3]=((( - tmp2)*fjac[j-1][2][3])-(tmp1*njac[j-1][2][3]));
				lhs[j][0][3][3]=(((( - tmp2)*fjac[j-1][3][3])-(tmp1*njac[j-1][3][3]))-(tmp1*dy4));
				lhs[j][0][4][3]=((( - tmp2)*fjac[j-1][4][3])-(tmp1*njac[j-1][4][3]));
				lhs[j][0][0][4]=((( - tmp2)*fjac[j-1][0][4])-(tmp1*njac[j-1][0][4]));
				lhs[j][0][1][4]=((( - tmp2)*fjac[j-1][1][4])-(tmp1*njac[j-1][1][4]));
				lhs[j][0][2][4]=((( - tmp2)*fjac[j-1][2][4])-(tmp1*njac[j-1][2][4]));
				lhs[j][0][3][4]=((( - tmp2)*fjac[j-1][3][4])-(tmp1*njac[j-1][3][4]));
				lhs[j][0][4][4]=(((( - tmp2)*fjac[j-1][4][4])-(tmp1*njac[j-1][4][4]))-(tmp1*dy5));
				lhs[j][1][0][0]=((1.0+((tmp1*2.0)*njac[j][0][0]))+((tmp1*2.0)*dy1));
				lhs[j][1][1][0]=((tmp1*2.0)*njac[j][1][0]);
				lhs[j][1][2][0]=((tmp1*2.0)*njac[j][2][0]);
				lhs[j][1][3][0]=((tmp1*2.0)*njac[j][3][0]);
				lhs[j][1][4][0]=((tmp1*2.0)*njac[j][4][0]);
				lhs[j][1][0][1]=((tmp1*2.0)*njac[j][0][1]);
				lhs[j][1][1][1]=((1.0+((tmp1*2.0)*njac[j][1][1]))+((tmp1*2.0)*dy2));
				lhs[j][1][2][1]=((tmp1*2.0)*njac[j][2][1]);
				lhs[j][1][3][1]=((tmp1*2.0)*njac[j][3][1]);
				lhs[j][1][4][1]=((tmp1*2.0)*njac[j][4][1]);
				lhs[j][1][0][2]=((tmp1*2.0)*njac[j][0][2]);
				lhs[j][1][1][2]=((tmp1*2.0)*njac[j][1][2]);
				lhs[j][1][2][2]=((1.0+((tmp1*2.0)*njac[j][2][2]))+((tmp1*2.0)*dy3));
				lhs[j][1][3][2]=((tmp1*2.0)*njac[j][3][2]);
				lhs[j][1][4][2]=((tmp1*2.0)*njac[j][4][2]);
				lhs[j][1][0][3]=((tmp1*2.0)*njac[j][0][3]);
				lhs[j][1][1][3]=((tmp1*2.0)*njac[j][1][3]);
				lhs[j][1][2][3]=((tmp1*2.0)*njac[j][2][3]);
				lhs[j][1][3][3]=((1.0+((tmp1*2.0)*njac[j][3][3]))+((tmp1*2.0)*dy4));
				lhs[j][1][4][3]=((tmp1*2.0)*njac[j][4][3]);
				lhs[j][1][0][4]=((tmp1*2.0)*njac[j][0][4]);
				lhs[j][1][1][4]=((tmp1*2.0)*njac[j][1][4]);
				lhs[j][1][2][4]=((tmp1*2.0)*njac[j][2][4]);
				lhs[j][1][3][4]=((tmp1*2.0)*njac[j][3][4]);
				lhs[j][1][4][4]=((1.0+((tmp1*2.0)*njac[j][4][4]))+((tmp1*2.0)*dy5));
				lhs[j][2][0][0]=(((tmp2*fjac[j+1][0][0])-(tmp1*njac[j+1][0][0]))-(tmp1*dy1));
				lhs[j][2][1][0]=((tmp2*fjac[j+1][1][0])-(tmp1*njac[j+1][1][0]));
				lhs[j][2][2][0]=((tmp2*fjac[j+1][2][0])-(tmp1*njac[j+1][2][0]));
				lhs[j][2][3][0]=((tmp2*fjac[j+1][3][0])-(tmp1*njac[j+1][3][0]));
				lhs[j][2][4][0]=((tmp2*fjac[j+1][4][0])-(tmp1*njac[j+1][4][0]));
				lhs[j][2][0][1]=((tmp2*fjac[j+1][0][1])-(tmp1*njac[j+1][0][1]));
				lhs[j][2][1][1]=(((tmp2*fjac[j+1][1][1])-(tmp1*njac[j+1][1][1]))-(tmp1*dy2));
				lhs[j][2][2][1]=((tmp2*fjac[j+1][2][1])-(tmp1*njac[j+1][2][1]));
				lhs[j][2][3][1]=((tmp2*fjac[j+1][3][1])-(tmp1*njac[j+1][3][1]));
				lhs[j][2][4][1]=((tmp2*fjac[j+1][4][1])-(tmp1*njac[j+1][4][1]));
				lhs[j][2][0][2]=((tmp2*fjac[j+1][0][2])-(tmp1*njac[j+1][0][2]));
				lhs[j][2][1][2]=((tmp2*fjac[j+1][1][2])-(tmp1*njac[j+1][1][2]));
				lhs[j][2][2][2]=(((tmp2*fjac[j+1][2][2])-(tmp1*njac[j+1][2][2]))-(tmp1*dy3));
				lhs[j][2][3][2]=((tmp2*fjac[j+1][3][2])-(tmp1*njac[j+1][3][2]));
				lhs[j][2][4][2]=((tmp2*fjac[j+1][4][2])-(tmp1*njac[j+1][4][2]));
				lhs[j][2][0][3]=((tmp2*fjac[j+1][0][3])-(tmp1*njac[j+1][0][3]));
				lhs[j][2][1][3]=((tmp2*fjac[j+1][1][3])-(tmp1*njac[j+1][1][3]));
				lhs[j][2][2][3]=((tmp2*fjac[j+1][2][3])-(tmp1*njac[j+1][2][3]));
				lhs[j][2][3][3]=(((tmp2*fjac[j+1][3][3])-(tmp1*njac[j+1][3][3]))-(tmp1*dy4));
				lhs[j][2][4][3]=((tmp2*fjac[j+1][4][3])-(tmp1*njac[j+1][4][3]));
				lhs[j][2][0][4]=((tmp2*fjac[j+1][0][4])-(tmp1*njac[j+1][0][4]));
				lhs[j][2][1][4]=((tmp2*fjac[j+1][1][4])-(tmp1*njac[j+1][1][4]));
				lhs[j][2][2][4]=((tmp2*fjac[j+1][2][4])-(tmp1*njac[j+1][2][4]));
				lhs[j][2][3][4]=((tmp2*fjac[j+1][3][4])-(tmp1*njac[j+1][3][4]));
				lhs[j][2][4][4]=(((tmp2*fjac[j+1][4][4])-(tmp1*njac[j+1][4][4]))-(tmp1*dy5));
			}
			binvcrhs(lhs[0][1], lhs[0][2], rhs[k][0][i]);
			#pragma loop name y_solve#0#0#2 
			for (j=1; j<=(jsize-1); j ++ )
			{
				matvec_sub(lhs[j][0], rhs[k][j-1][i], rhs[k][j][i]);
				matmul_sub(lhs[j][0], lhs[j-1][2], lhs[j][1]);
				binvcrhs(lhs[j][1], lhs[j][2], rhs[k][j][i]);
			}
			matvec_sub(lhs[jsize][0], rhs[k][jsize-1][i], rhs[k][jsize][i]);
			matmul_sub(lhs[jsize][0], lhs[jsize-1][2], lhs[jsize][1]);
			binvrhs(lhs[jsize][1], rhs[k][jsize][i]);
			#pragma loop name y_solve#0#0#3 
			for (j=(jsize-1); j>=0; j -- )
			{
				#pragma loop name y_solve#0#0#3#0 
				for (m=0; m<5; m ++ )
				{
					#pragma loop name y_solve#0#0#3#0#0 
					for (n=0; n<5; n ++ )
					{
						rhs[k][j][i][m]=(rhs[k][j][i][m]-(lhs[j][2][n][m]*rhs[k][j+1][i][n]));
					}
				}
			}
		}
	}
	#pragma event y_solve#0 stop
	
	gettimeofday(&end_y_solve_0, NULL);
	printf("Time y_solve_0 seconds %0.8f \n", time_diff(&start_y_solve_0, &end_y_solve_0));
	
	if (timeron)
	{
		timer_stop(7);
	}
}
