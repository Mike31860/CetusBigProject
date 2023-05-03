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

void x_solve()
{
	int i, j, k, m, n, isize;
	if (timeron)
	{
		timer_start(6);
	}
	isize=(grid_points[0]-1);
	#pragma event x_solve#0 start
	
	struct timeval start_x_solve_0, end_x_solve_0;
	gettimeofday(&start_x_solve_0, NULL);
	
	#pragma loop name x_solve#0 
	for (k=1; k<=(grid_points[2]-2); k ++ )
	{
		#pragma loop name x_solve#0#0 
		for (j=1; j<=(grid_points[1]-2); j ++ )
		{
			#pragma loop name x_solve#0#0#0 
			for (i=0; i<=isize; i ++ )
			{
				tmp1=rho_i[k][j][i];
				tmp2=(tmp1*tmp1);
				tmp3=(tmp1*tmp2);
				fjac[i][0][0]=0.0;
				fjac[i][1][0]=1.0;
				fjac[i][2][0]=0.0;
				fjac[i][3][0]=0.0;
				fjac[i][4][0]=0.0;
				fjac[i][0][1]=(( - ((u[k][j][i][1]*tmp2)*u[k][j][i][1]))+(c2*qs[k][j][i]));
				fjac[i][1][1]=((2.0-c2)*(u[k][j][i][1]/u[k][j][i][0]));
				fjac[i][2][1]=(( - c2)*(u[k][j][i][2]*tmp1));
				fjac[i][3][1]=(( - c2)*(u[k][j][i][3]*tmp1));
				fjac[i][4][1]=c2;
				fjac[i][0][2]=(( - (u[k][j][i][1]*u[k][j][i][2]))*tmp2);
				fjac[i][1][2]=(u[k][j][i][2]*tmp1);
				fjac[i][2][2]=(u[k][j][i][1]*tmp1);
				fjac[i][3][2]=0.0;
				fjac[i][4][2]=0.0;
				fjac[i][0][3]=(( - (u[k][j][i][1]*u[k][j][i][3]))*tmp2);
				fjac[i][1][3]=(u[k][j][i][3]*tmp1);
				fjac[i][2][3]=0.0;
				fjac[i][3][3]=(u[k][j][i][1]*tmp1);
				fjac[i][4][3]=0.0;
				fjac[i][0][4]=((((c2*2.0)*square[k][j][i])-(c1*u[k][j][i][4]))*(u[k][j][i][1]*tmp2));
				fjac[i][1][4]=(((c1*u[k][j][i][4])*tmp1)-(c2*(((u[k][j][i][1]*u[k][j][i][1])*tmp2)+qs[k][j][i])));
				fjac[i][2][4]=((( - c2)*(u[k][j][i][2]*u[k][j][i][1]))*tmp2);
				fjac[i][3][4]=((( - c2)*(u[k][j][i][3]*u[k][j][i][1]))*tmp2);
				fjac[i][4][4]=(c1*(u[k][j][i][1]*tmp1));
				njac[i][0][0]=0.0;
				njac[i][1][0]=0.0;
				njac[i][2][0]=0.0;
				njac[i][3][0]=0.0;
				njac[i][4][0]=0.0;
				njac[i][0][1]=(((( - con43)*c3c4)*tmp2)*u[k][j][i][1]);
				njac[i][1][1]=((con43*c3c4)*tmp1);
				njac[i][2][1]=0.0;
				njac[i][3][1]=0.0;
				njac[i][4][1]=0.0;
				njac[i][0][2]=((( - c3c4)*tmp2)*u[k][j][i][2]);
				njac[i][1][2]=0.0;
				njac[i][2][2]=(c3c4*tmp1);
				njac[i][3][2]=0.0;
				njac[i][4][2]=0.0;
				njac[i][0][3]=((( - c3c4)*tmp2)*u[k][j][i][3]);
				njac[i][1][3]=0.0;
				njac[i][2][3]=0.0;
				njac[i][3][3]=(c3c4*tmp1);
				njac[i][4][3]=0.0;
				njac[i][0][4]=(((((( - ((con43*c3c4)-c1345))*tmp3)*(u[k][j][i][1]*u[k][j][i][1]))-(((c3c4-c1345)*tmp3)*(u[k][j][i][2]*u[k][j][i][2])))-(((c3c4-c1345)*tmp3)*(u[k][j][i][3]*u[k][j][i][3])))-((c1345*tmp2)*u[k][j][i][4]));
				njac[i][1][4]=((((con43*c3c4)-c1345)*tmp2)*u[k][j][i][1]);
				njac[i][2][4]=(((c3c4-c1345)*tmp2)*u[k][j][i][2]);
				njac[i][3][4]=(((c3c4-c1345)*tmp2)*u[k][j][i][3]);
				njac[i][4][4]=(c1345*tmp1);
			}
			lhsinit(lhs, isize);
			#pragma loop name x_solve#0#0#1 
			for (i=1; i<=(isize-1); i ++ )
			{
				tmp1=(dt*tx1);
				tmp2=(dt*tx2);
				lhs[i][0][0][0]=(((( - tmp2)*fjac[i-1][0][0])-(tmp1*njac[i-1][0][0]))-(tmp1*dx1));
				lhs[i][0][1][0]=((( - tmp2)*fjac[i-1][1][0])-(tmp1*njac[i-1][1][0]));
				lhs[i][0][2][0]=((( - tmp2)*fjac[i-1][2][0])-(tmp1*njac[i-1][2][0]));
				lhs[i][0][3][0]=((( - tmp2)*fjac[i-1][3][0])-(tmp1*njac[i-1][3][0]));
				lhs[i][0][4][0]=((( - tmp2)*fjac[i-1][4][0])-(tmp1*njac[i-1][4][0]));
				lhs[i][0][0][1]=((( - tmp2)*fjac[i-1][0][1])-(tmp1*njac[i-1][0][1]));
				lhs[i][0][1][1]=(((( - tmp2)*fjac[i-1][1][1])-(tmp1*njac[i-1][1][1]))-(tmp1*dx2));
				lhs[i][0][2][1]=((( - tmp2)*fjac[i-1][2][1])-(tmp1*njac[i-1][2][1]));
				lhs[i][0][3][1]=((( - tmp2)*fjac[i-1][3][1])-(tmp1*njac[i-1][3][1]));
				lhs[i][0][4][1]=((( - tmp2)*fjac[i-1][4][1])-(tmp1*njac[i-1][4][1]));
				lhs[i][0][0][2]=((( - tmp2)*fjac[i-1][0][2])-(tmp1*njac[i-1][0][2]));
				lhs[i][0][1][2]=((( - tmp2)*fjac[i-1][1][2])-(tmp1*njac[i-1][1][2]));
				lhs[i][0][2][2]=(((( - tmp2)*fjac[i-1][2][2])-(tmp1*njac[i-1][2][2]))-(tmp1*dx3));
				lhs[i][0][3][2]=((( - tmp2)*fjac[i-1][3][2])-(tmp1*njac[i-1][3][2]));
				lhs[i][0][4][2]=((( - tmp2)*fjac[i-1][4][2])-(tmp1*njac[i-1][4][2]));
				lhs[i][0][0][3]=((( - tmp2)*fjac[i-1][0][3])-(tmp1*njac[i-1][0][3]));
				lhs[i][0][1][3]=((( - tmp2)*fjac[i-1][1][3])-(tmp1*njac[i-1][1][3]));
				lhs[i][0][2][3]=((( - tmp2)*fjac[i-1][2][3])-(tmp1*njac[i-1][2][3]));
				lhs[i][0][3][3]=(((( - tmp2)*fjac[i-1][3][3])-(tmp1*njac[i-1][3][3]))-(tmp1*dx4));
				lhs[i][0][4][3]=((( - tmp2)*fjac[i-1][4][3])-(tmp1*njac[i-1][4][3]));
				lhs[i][0][0][4]=((( - tmp2)*fjac[i-1][0][4])-(tmp1*njac[i-1][0][4]));
				lhs[i][0][1][4]=((( - tmp2)*fjac[i-1][1][4])-(tmp1*njac[i-1][1][4]));
				lhs[i][0][2][4]=((( - tmp2)*fjac[i-1][2][4])-(tmp1*njac[i-1][2][4]));
				lhs[i][0][3][4]=((( - tmp2)*fjac[i-1][3][4])-(tmp1*njac[i-1][3][4]));
				lhs[i][0][4][4]=(((( - tmp2)*fjac[i-1][4][4])-(tmp1*njac[i-1][4][4]))-(tmp1*dx5));
				lhs[i][1][0][0]=((1.0+((tmp1*2.0)*njac[i][0][0]))+((tmp1*2.0)*dx1));
				lhs[i][1][1][0]=((tmp1*2.0)*njac[i][1][0]);
				lhs[i][1][2][0]=((tmp1*2.0)*njac[i][2][0]);
				lhs[i][1][3][0]=((tmp1*2.0)*njac[i][3][0]);
				lhs[i][1][4][0]=((tmp1*2.0)*njac[i][4][0]);
				lhs[i][1][0][1]=((tmp1*2.0)*njac[i][0][1]);
				lhs[i][1][1][1]=((1.0+((tmp1*2.0)*njac[i][1][1]))+((tmp1*2.0)*dx2));
				lhs[i][1][2][1]=((tmp1*2.0)*njac[i][2][1]);
				lhs[i][1][3][1]=((tmp1*2.0)*njac[i][3][1]);
				lhs[i][1][4][1]=((tmp1*2.0)*njac[i][4][1]);
				lhs[i][1][0][2]=((tmp1*2.0)*njac[i][0][2]);
				lhs[i][1][1][2]=((tmp1*2.0)*njac[i][1][2]);
				lhs[i][1][2][2]=((1.0+((tmp1*2.0)*njac[i][2][2]))+((tmp1*2.0)*dx3));
				lhs[i][1][3][2]=((tmp1*2.0)*njac[i][3][2]);
				lhs[i][1][4][2]=((tmp1*2.0)*njac[i][4][2]);
				lhs[i][1][0][3]=((tmp1*2.0)*njac[i][0][3]);
				lhs[i][1][1][3]=((tmp1*2.0)*njac[i][1][3]);
				lhs[i][1][2][3]=((tmp1*2.0)*njac[i][2][3]);
				lhs[i][1][3][3]=((1.0+((tmp1*2.0)*njac[i][3][3]))+((tmp1*2.0)*dx4));
				lhs[i][1][4][3]=((tmp1*2.0)*njac[i][4][3]);
				lhs[i][1][0][4]=((tmp1*2.0)*njac[i][0][4]);
				lhs[i][1][1][4]=((tmp1*2.0)*njac[i][1][4]);
				lhs[i][1][2][4]=((tmp1*2.0)*njac[i][2][4]);
				lhs[i][1][3][4]=((tmp1*2.0)*njac[i][3][4]);
				lhs[i][1][4][4]=((1.0+((tmp1*2.0)*njac[i][4][4]))+((tmp1*2.0)*dx5));
				lhs[i][2][0][0]=(((tmp2*fjac[i+1][0][0])-(tmp1*njac[i+1][0][0]))-(tmp1*dx1));
				lhs[i][2][1][0]=((tmp2*fjac[i+1][1][0])-(tmp1*njac[i+1][1][0]));
				lhs[i][2][2][0]=((tmp2*fjac[i+1][2][0])-(tmp1*njac[i+1][2][0]));
				lhs[i][2][3][0]=((tmp2*fjac[i+1][3][0])-(tmp1*njac[i+1][3][0]));
				lhs[i][2][4][0]=((tmp2*fjac[i+1][4][0])-(tmp1*njac[i+1][4][0]));
				lhs[i][2][0][1]=((tmp2*fjac[i+1][0][1])-(tmp1*njac[i+1][0][1]));
				lhs[i][2][1][1]=(((tmp2*fjac[i+1][1][1])-(tmp1*njac[i+1][1][1]))-(tmp1*dx2));
				lhs[i][2][2][1]=((tmp2*fjac[i+1][2][1])-(tmp1*njac[i+1][2][1]));
				lhs[i][2][3][1]=((tmp2*fjac[i+1][3][1])-(tmp1*njac[i+1][3][1]));
				lhs[i][2][4][1]=((tmp2*fjac[i+1][4][1])-(tmp1*njac[i+1][4][1]));
				lhs[i][2][0][2]=((tmp2*fjac[i+1][0][2])-(tmp1*njac[i+1][0][2]));
				lhs[i][2][1][2]=((tmp2*fjac[i+1][1][2])-(tmp1*njac[i+1][1][2]));
				lhs[i][2][2][2]=(((tmp2*fjac[i+1][2][2])-(tmp1*njac[i+1][2][2]))-(tmp1*dx3));
				lhs[i][2][3][2]=((tmp2*fjac[i+1][3][2])-(tmp1*njac[i+1][3][2]));
				lhs[i][2][4][2]=((tmp2*fjac[i+1][4][2])-(tmp1*njac[i+1][4][2]));
				lhs[i][2][0][3]=((tmp2*fjac[i+1][0][3])-(tmp1*njac[i+1][0][3]));
				lhs[i][2][1][3]=((tmp2*fjac[i+1][1][3])-(tmp1*njac[i+1][1][3]));
				lhs[i][2][2][3]=((tmp2*fjac[i+1][2][3])-(tmp1*njac[i+1][2][3]));
				lhs[i][2][3][3]=(((tmp2*fjac[i+1][3][3])-(tmp1*njac[i+1][3][3]))-(tmp1*dx4));
				lhs[i][2][4][3]=((tmp2*fjac[i+1][4][3])-(tmp1*njac[i+1][4][3]));
				lhs[i][2][0][4]=((tmp2*fjac[i+1][0][4])-(tmp1*njac[i+1][0][4]));
				lhs[i][2][1][4]=((tmp2*fjac[i+1][1][4])-(tmp1*njac[i+1][1][4]));
				lhs[i][2][2][4]=((tmp2*fjac[i+1][2][4])-(tmp1*njac[i+1][2][4]));
				lhs[i][2][3][4]=((tmp2*fjac[i+1][3][4])-(tmp1*njac[i+1][3][4]));
				lhs[i][2][4][4]=(((tmp2*fjac[i+1][4][4])-(tmp1*njac[i+1][4][4]))-(tmp1*dx5));
			}
			binvcrhs(lhs[0][1], lhs[0][2], rhs[k][j][0]);
			#pragma loop name x_solve#0#0#2 
			for (i=1; i<=(isize-1); i ++ )
			{
				matvec_sub(lhs[i][0], rhs[k][j][i-1], rhs[k][j][i]);
				matmul_sub(lhs[i][0], lhs[i-1][2], lhs[i][1]);
				binvcrhs(lhs[i][1], lhs[i][2], rhs[k][j][i]);
			}
			matvec_sub(lhs[isize][0], rhs[k][j][isize-1], rhs[k][j][isize]);
			matmul_sub(lhs[isize][0], lhs[isize-1][2], lhs[isize][1]);
			binvrhs(lhs[isize][1], rhs[k][j][isize]);
			#pragma loop name x_solve#0#0#3 
			for (i=(isize-1); i>=0; i -- )
			{
				#pragma loop name x_solve#0#0#3#0 
				for (m=0; m<5; m ++ )
				{
					#pragma loop name x_solve#0#0#3#0#0 
					for (n=0; n<5; n ++ )
					{
						rhs[k][j][i][m]=(rhs[k][j][i][m]-(lhs[i][2][n][m]*rhs[k][j][i+1][n]));
					}
				}
			}
		}
	}
	#pragma event x_solve#0 stop
	
	gettimeofday(&end_x_solve_0, NULL);
	printf("Time x_solve_0 seconds %0.8f \n", time_diff(&start_x_solve_0, &end_x_solve_0));
	
	if (timeron)
	{
		timer_stop(6);
	}
}
