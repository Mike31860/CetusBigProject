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

void z_solve()
{
	int i, j, k, m, n, ksize;
	if (timeron)
	{
		timer_start(8);
	}
	ksize=(grid_points[2]-1);
	#pragma event z_solve#0 start
	
	struct timeval start_z_solve_0, end_z_solve_0;
	gettimeofday(&start_z_solve_0, NULL);
	
	#pragma loop name z_solve#0 
	for (j=1; j<=(grid_points[1]-2); j ++ )
	{
		#pragma loop name z_solve#0#0 
		for (i=1; i<=(grid_points[0]-2); i ++ )
		{
			#pragma loop name z_solve#0#0#0 
			for (k=0; k<=ksize; k ++ )
			{
				tmp1=(1.0/u[k][j][i][0]);
				tmp2=(tmp1*tmp1);
				tmp3=(tmp1*tmp2);
				fjac[k][0][0]=0.0;
				fjac[k][1][0]=0.0;
				fjac[k][2][0]=0.0;
				fjac[k][3][0]=1.0;
				fjac[k][4][0]=0.0;
				fjac[k][0][1]=(( - (u[k][j][i][1]*u[k][j][i][3]))*tmp2);
				fjac[k][1][1]=(u[k][j][i][3]*tmp1);
				fjac[k][2][1]=0.0;
				fjac[k][3][1]=(u[k][j][i][1]*tmp1);
				fjac[k][4][1]=0.0;
				fjac[k][0][2]=(( - (u[k][j][i][2]*u[k][j][i][3]))*tmp2);
				fjac[k][1][2]=0.0;
				fjac[k][2][2]=(u[k][j][i][3]*tmp1);
				fjac[k][3][2]=(u[k][j][i][2]*tmp1);
				fjac[k][4][2]=0.0;
				fjac[k][0][3]=(( - ((u[k][j][i][3]*u[k][j][i][3])*tmp2))+(c2*qs[k][j][i]));
				fjac[k][1][3]=((( - c2)*u[k][j][i][1])*tmp1);
				fjac[k][2][3]=((( - c2)*u[k][j][i][2])*tmp1);
				fjac[k][3][3]=(((2.0-c2)*u[k][j][i][3])*tmp1);
				fjac[k][4][3]=c2;
				fjac[k][0][4]=(((((c2*2.0)*square[k][j][i])-(c1*u[k][j][i][4]))*u[k][j][i][3])*tmp2);
				fjac[k][1][4]=((( - c2)*(u[k][j][i][1]*u[k][j][i][3]))*tmp2);
				fjac[k][2][4]=((( - c2)*(u[k][j][i][2]*u[k][j][i][3]))*tmp2);
				fjac[k][3][4]=((c1*(u[k][j][i][4]*tmp1))-(c2*(qs[k][j][i]+((u[k][j][i][3]*u[k][j][i][3])*tmp2))));
				fjac[k][4][4]=((c1*u[k][j][i][3])*tmp1);
				njac[k][0][0]=0.0;
				njac[k][1][0]=0.0;
				njac[k][2][0]=0.0;
				njac[k][3][0]=0.0;
				njac[k][4][0]=0.0;
				njac[k][0][1]=((( - c3c4)*tmp2)*u[k][j][i][1]);
				njac[k][1][1]=(c3c4*tmp1);
				njac[k][2][1]=0.0;
				njac[k][3][1]=0.0;
				njac[k][4][1]=0.0;
				njac[k][0][2]=((( - c3c4)*tmp2)*u[k][j][i][2]);
				njac[k][1][2]=0.0;
				njac[k][2][2]=(c3c4*tmp1);
				njac[k][3][2]=0.0;
				njac[k][4][2]=0.0;
				njac[k][0][3]=(((( - con43)*c3c4)*tmp2)*u[k][j][i][3]);
				njac[k][1][3]=0.0;
				njac[k][2][3]=0.0;
				njac[k][3][3]=(((con43*c3)*c4)*tmp1);
				njac[k][4][3]=0.0;
				njac[k][0][4]=(((((( - (c3c4-c1345))*tmp3)*(u[k][j][i][1]*u[k][j][i][1]))-(((c3c4-c1345)*tmp3)*(u[k][j][i][2]*u[k][j][i][2])))-((((con43*c3c4)-c1345)*tmp3)*(u[k][j][i][3]*u[k][j][i][3])))-((c1345*tmp2)*u[k][j][i][4]));
				njac[k][1][4]=(((c3c4-c1345)*tmp2)*u[k][j][i][1]);
				njac[k][2][4]=(((c3c4-c1345)*tmp2)*u[k][j][i][2]);
				njac[k][3][4]=((((con43*c3c4)-c1345)*tmp2)*u[k][j][i][3]);
				njac[k][4][4]=(c1345*tmp1);
			}
			lhsinit(lhs, ksize);
			#pragma loop name z_solve#0#0#1 
			for (k=1; k<=(ksize-1); k ++ )
			{
				tmp1=(dt*tz1);
				tmp2=(dt*tz2);
				lhs[k][0][0][0]=(((( - tmp2)*fjac[k-1][0][0])-(tmp1*njac[k-1][0][0]))-(tmp1*dz1));
				lhs[k][0][1][0]=((( - tmp2)*fjac[k-1][1][0])-(tmp1*njac[k-1][1][0]));
				lhs[k][0][2][0]=((( - tmp2)*fjac[k-1][2][0])-(tmp1*njac[k-1][2][0]));
				lhs[k][0][3][0]=((( - tmp2)*fjac[k-1][3][0])-(tmp1*njac[k-1][3][0]));
				lhs[k][0][4][0]=((( - tmp2)*fjac[k-1][4][0])-(tmp1*njac[k-1][4][0]));
				lhs[k][0][0][1]=((( - tmp2)*fjac[k-1][0][1])-(tmp1*njac[k-1][0][1]));
				lhs[k][0][1][1]=(((( - tmp2)*fjac[k-1][1][1])-(tmp1*njac[k-1][1][1]))-(tmp1*dz2));
				lhs[k][0][2][1]=((( - tmp2)*fjac[k-1][2][1])-(tmp1*njac[k-1][2][1]));
				lhs[k][0][3][1]=((( - tmp2)*fjac[k-1][3][1])-(tmp1*njac[k-1][3][1]));
				lhs[k][0][4][1]=((( - tmp2)*fjac[k-1][4][1])-(tmp1*njac[k-1][4][1]));
				lhs[k][0][0][2]=((( - tmp2)*fjac[k-1][0][2])-(tmp1*njac[k-1][0][2]));
				lhs[k][0][1][2]=((( - tmp2)*fjac[k-1][1][2])-(tmp1*njac[k-1][1][2]));
				lhs[k][0][2][2]=(((( - tmp2)*fjac[k-1][2][2])-(tmp1*njac[k-1][2][2]))-(tmp1*dz3));
				lhs[k][0][3][2]=((( - tmp2)*fjac[k-1][3][2])-(tmp1*njac[k-1][3][2]));
				lhs[k][0][4][2]=((( - tmp2)*fjac[k-1][4][2])-(tmp1*njac[k-1][4][2]));
				lhs[k][0][0][3]=((( - tmp2)*fjac[k-1][0][3])-(tmp1*njac[k-1][0][3]));
				lhs[k][0][1][3]=((( - tmp2)*fjac[k-1][1][3])-(tmp1*njac[k-1][1][3]));
				lhs[k][0][2][3]=((( - tmp2)*fjac[k-1][2][3])-(tmp1*njac[k-1][2][3]));
				lhs[k][0][3][3]=(((( - tmp2)*fjac[k-1][3][3])-(tmp1*njac[k-1][3][3]))-(tmp1*dz4));
				lhs[k][0][4][3]=((( - tmp2)*fjac[k-1][4][3])-(tmp1*njac[k-1][4][3]));
				lhs[k][0][0][4]=((( - tmp2)*fjac[k-1][0][4])-(tmp1*njac[k-1][0][4]));
				lhs[k][0][1][4]=((( - tmp2)*fjac[k-1][1][4])-(tmp1*njac[k-1][1][4]));
				lhs[k][0][2][4]=((( - tmp2)*fjac[k-1][2][4])-(tmp1*njac[k-1][2][4]));
				lhs[k][0][3][4]=((( - tmp2)*fjac[k-1][3][4])-(tmp1*njac[k-1][3][4]));
				lhs[k][0][4][4]=(((( - tmp2)*fjac[k-1][4][4])-(tmp1*njac[k-1][4][4]))-(tmp1*dz5));
				lhs[k][1][0][0]=((1.0+((tmp1*2.0)*njac[k][0][0]))+((tmp1*2.0)*dz1));
				lhs[k][1][1][0]=((tmp1*2.0)*njac[k][1][0]);
				lhs[k][1][2][0]=((tmp1*2.0)*njac[k][2][0]);
				lhs[k][1][3][0]=((tmp1*2.0)*njac[k][3][0]);
				lhs[k][1][4][0]=((tmp1*2.0)*njac[k][4][0]);
				lhs[k][1][0][1]=((tmp1*2.0)*njac[k][0][1]);
				lhs[k][1][1][1]=((1.0+((tmp1*2.0)*njac[k][1][1]))+((tmp1*2.0)*dz2));
				lhs[k][1][2][1]=((tmp1*2.0)*njac[k][2][1]);
				lhs[k][1][3][1]=((tmp1*2.0)*njac[k][3][1]);
				lhs[k][1][4][1]=((tmp1*2.0)*njac[k][4][1]);
				lhs[k][1][0][2]=((tmp1*2.0)*njac[k][0][2]);
				lhs[k][1][1][2]=((tmp1*2.0)*njac[k][1][2]);
				lhs[k][1][2][2]=((1.0+((tmp1*2.0)*njac[k][2][2]))+((tmp1*2.0)*dz3));
				lhs[k][1][3][2]=((tmp1*2.0)*njac[k][3][2]);
				lhs[k][1][4][2]=((tmp1*2.0)*njac[k][4][2]);
				lhs[k][1][0][3]=((tmp1*2.0)*njac[k][0][3]);
				lhs[k][1][1][3]=((tmp1*2.0)*njac[k][1][3]);
				lhs[k][1][2][3]=((tmp1*2.0)*njac[k][2][3]);
				lhs[k][1][3][3]=((1.0+((tmp1*2.0)*njac[k][3][3]))+((tmp1*2.0)*dz4));
				lhs[k][1][4][3]=((tmp1*2.0)*njac[k][4][3]);
				lhs[k][1][0][4]=((tmp1*2.0)*njac[k][0][4]);
				lhs[k][1][1][4]=((tmp1*2.0)*njac[k][1][4]);
				lhs[k][1][2][4]=((tmp1*2.0)*njac[k][2][4]);
				lhs[k][1][3][4]=((tmp1*2.0)*njac[k][3][4]);
				lhs[k][1][4][4]=((1.0+((tmp1*2.0)*njac[k][4][4]))+((tmp1*2.0)*dz5));
				lhs[k][2][0][0]=(((tmp2*fjac[k+1][0][0])-(tmp1*njac[k+1][0][0]))-(tmp1*dz1));
				lhs[k][2][1][0]=((tmp2*fjac[k+1][1][0])-(tmp1*njac[k+1][1][0]));
				lhs[k][2][2][0]=((tmp2*fjac[k+1][2][0])-(tmp1*njac[k+1][2][0]));
				lhs[k][2][3][0]=((tmp2*fjac[k+1][3][0])-(tmp1*njac[k+1][3][0]));
				lhs[k][2][4][0]=((tmp2*fjac[k+1][4][0])-(tmp1*njac[k+1][4][0]));
				lhs[k][2][0][1]=((tmp2*fjac[k+1][0][1])-(tmp1*njac[k+1][0][1]));
				lhs[k][2][1][1]=(((tmp2*fjac[k+1][1][1])-(tmp1*njac[k+1][1][1]))-(tmp1*dz2));
				lhs[k][2][2][1]=((tmp2*fjac[k+1][2][1])-(tmp1*njac[k+1][2][1]));
				lhs[k][2][3][1]=((tmp2*fjac[k+1][3][1])-(tmp1*njac[k+1][3][1]));
				lhs[k][2][4][1]=((tmp2*fjac[k+1][4][1])-(tmp1*njac[k+1][4][1]));
				lhs[k][2][0][2]=((tmp2*fjac[k+1][0][2])-(tmp1*njac[k+1][0][2]));
				lhs[k][2][1][2]=((tmp2*fjac[k+1][1][2])-(tmp1*njac[k+1][1][2]));
				lhs[k][2][2][2]=(((tmp2*fjac[k+1][2][2])-(tmp1*njac[k+1][2][2]))-(tmp1*dz3));
				lhs[k][2][3][2]=((tmp2*fjac[k+1][3][2])-(tmp1*njac[k+1][3][2]));
				lhs[k][2][4][2]=((tmp2*fjac[k+1][4][2])-(tmp1*njac[k+1][4][2]));
				lhs[k][2][0][3]=((tmp2*fjac[k+1][0][3])-(tmp1*njac[k+1][0][3]));
				lhs[k][2][1][3]=((tmp2*fjac[k+1][1][3])-(tmp1*njac[k+1][1][3]));
				lhs[k][2][2][3]=((tmp2*fjac[k+1][2][3])-(tmp1*njac[k+1][2][3]));
				lhs[k][2][3][3]=(((tmp2*fjac[k+1][3][3])-(tmp1*njac[k+1][3][3]))-(tmp1*dz4));
				lhs[k][2][4][3]=((tmp2*fjac[k+1][4][3])-(tmp1*njac[k+1][4][3]));
				lhs[k][2][0][4]=((tmp2*fjac[k+1][0][4])-(tmp1*njac[k+1][0][4]));
				lhs[k][2][1][4]=((tmp2*fjac[k+1][1][4])-(tmp1*njac[k+1][1][4]));
				lhs[k][2][2][4]=((tmp2*fjac[k+1][2][4])-(tmp1*njac[k+1][2][4]));
				lhs[k][2][3][4]=((tmp2*fjac[k+1][3][4])-(tmp1*njac[k+1][3][4]));
				lhs[k][2][4][4]=(((tmp2*fjac[k+1][4][4])-(tmp1*njac[k+1][4][4]))-(tmp1*dz5));
			}
			binvcrhs(lhs[0][1], lhs[0][2], rhs[0][j][i]);
			#pragma loop name z_solve#0#0#2 
			for (k=1; k<=(ksize-1); k ++ )
			{
				matvec_sub(lhs[k][0], rhs[k-1][j][i], rhs[k][j][i]);
				matmul_sub(lhs[k][0], lhs[k-1][2], lhs[k][1]);
				binvcrhs(lhs[k][1], lhs[k][2], rhs[k][j][i]);
			}
			matvec_sub(lhs[ksize][0], rhs[ksize-1][j][i], rhs[ksize][j][i]);
			matmul_sub(lhs[ksize][0], lhs[ksize-1][2], lhs[ksize][1]);
			binvrhs(lhs[ksize][1], rhs[ksize][j][i]);
			#pragma loop name z_solve#0#0#3 
			for (k=(ksize-1); k>=0; k -- )
			{
				#pragma loop name z_solve#0#0#3#0 
				for (m=0; m<5; m ++ )
				{
					#pragma loop name z_solve#0#0#3#0#0 
					for (n=0; n<5; n ++ )
					{
						rhs[k][j][i][m]=(rhs[k][j][i][m]-(lhs[k][2][n][m]*rhs[k+1][j][i][n]));
					}
				}
			}
		}
	}
	#pragma event z_solve#0 stop
	
	gettimeofday(&end_z_solve_0, NULL);
	printf("Time z_solve_0 seconds %0.8f \n", time_diff(&start_z_solve_0, &end_z_solve_0));
	
	if (timeron)
	{
		timer_stop(8);
	}
}
