#ifdef CETUS_TIMING
typedef struct cetusprofile cetusprofile;
extern cetusprofile cetus_prof;
void cetus_tic(cetusprofile *, int);
void cetus_toc(cetusprofile *, int);
#endif /* CETUS_TIMING */


#include "header.h"

#include <stdlib.h>
#include <sys/time.h>
#include "time_diff.h"
void y_solve()
{
	int i, j, k, j1, j2, m;
	double ru1, fac1, fac2;
	if (timeron)
	{
		timer_start(7);
	}
	#pragma event y_solve#0 start
	
	struct timeval start_y_solve_0, end_y_solve_0;
	gettimeofday(&start_y_solve_0, NULL);
	
	#pragma loop name y_solve#0 
	for (k=1; k<=(grid_points[2]-2); k ++ )
	{
		lhsinitj(ny2+1, nx2);
		#pragma loop name y_solve#0#0 
		for (i=1; i<=(grid_points[0]-2); i ++ )
		{
			#pragma loop name y_solve#0#0#0 
			for (j=0; j<=(grid_points[1]-1); j ++ )
			{
				ru1=(c3c4*rho_i[k][j][i]);
				cv[j]=vs[k][j][i];
				rhoq[j]=(((((dy3+(con43*ru1))>(dy5+(c1c5*ru1))) ? (dy3+(con43*ru1)) : (dy5+(c1c5*ru1)))>(((dymax+ru1)>dy1) ? (dymax+ru1) : dy1)) ? (((dy3+(con43*ru1))>(dy5+(c1c5*ru1))) ? (dy3+(con43*ru1)) : (dy5+(c1c5*ru1))) : (((dymax+ru1)>dy1) ? (dymax+ru1) : dy1));
			}
			#pragma loop name y_solve#0#0#1 
			for (j=1; j<=(grid_points[1]-2); j ++ )
			{
				lhs[j][i][0]=0.0;
				lhs[j][i][1]=((( - dtty2)*cv[j-1])-(dtty1*rhoq[j-1]));
				lhs[j][i][2]=(1.0+(c2dtty1*rhoq[j]));
				lhs[j][i][3]=((dtty2*cv[j+1])-(dtty1*rhoq[j+1]));
				lhs[j][i][4]=0.0;
			}
		}
		#pragma loop name y_solve#0#1 
		for (i=1; i<=(grid_points[0]-2); i ++ )
		{
			j=1;
			lhs[j][i][2]=(lhs[j][i][2]+comz5);
			lhs[j][i][3]=(lhs[j][i][3]-comz4);
			lhs[j][i][4]=(lhs[j][i][4]+comz1);
			lhs[j+1][i][1]=(lhs[j+1][i][1]-comz4);
			lhs[j+1][i][2]=(lhs[j+1][i][2]+comz6);
			lhs[j+1][i][3]=(lhs[j+1][i][3]-comz4);
			lhs[j+1][i][4]=(lhs[j+1][i][4]+comz1);
		}
		#pragma loop name y_solve#0#2 
		for (j=3; j<=(grid_points[1]-4); j ++ )
		{
			#pragma loop name y_solve#0#2#0 
			for (i=1; i<=(grid_points[0]-2); i ++ )
			{
				lhs[j][i][0]=(lhs[j][i][0]+comz1);
				lhs[j][i][1]=(lhs[j][i][1]-comz4);
				lhs[j][i][2]=(lhs[j][i][2]+comz6);
				lhs[j][i][3]=(lhs[j][i][3]-comz4);
				lhs[j][i][4]=(lhs[j][i][4]+comz1);
			}
		}
		#pragma loop name y_solve#0#3 
		for (i=1; i<=(grid_points[0]-2); i ++ )
		{
			j=(grid_points[1]-3);
			lhs[j][i][0]=(lhs[j][i][0]+comz1);
			lhs[j][i][1]=(lhs[j][i][1]-comz4);
			lhs[j][i][2]=(lhs[j][i][2]+comz6);
			lhs[j][i][3]=(lhs[j][i][3]-comz4);
			lhs[j+1][i][0]=(lhs[j+1][i][0]+comz1);
			lhs[j+1][i][1]=(lhs[j+1][i][1]-comz4);
			lhs[j+1][i][2]=(lhs[j+1][i][2]+comz5);
		}
		#pragma loop name y_solve#0#4 
		for (j=1; j<=(grid_points[1]-2); j ++ )
		{
			#pragma loop name y_solve#0#4#0 
			for (i=1; i<=(grid_points[0]-2); i ++ )
			{
				lhsp[j][i][0]=lhs[j][i][0];
				lhsp[j][i][1]=(lhs[j][i][1]-(dtty2*speed[k][j-1][i]));
				lhsp[j][i][2]=lhs[j][i][2];
				lhsp[j][i][3]=(lhs[j][i][3]+(dtty2*speed[k][j+1][i]));
				lhsp[j][i][4]=lhs[j][i][4];
				lhsm[j][i][0]=lhs[j][i][0];
				lhsm[j][i][1]=(lhs[j][i][1]+(dtty2*speed[k][j-1][i]));
				lhsm[j][i][2]=lhs[j][i][2];
				lhsm[j][i][3]=(lhs[j][i][3]-(dtty2*speed[k][j+1][i]));
				lhsm[j][i][4]=lhs[j][i][4];
			}
		}
		#pragma loop name y_solve#0#5 
		for (j=0; j<=(grid_points[1]-3); j ++ )
		{
			j1=(j+1);
			j2=(j+2);
			#pragma loop name y_solve#0#5#0 
			for (i=1; i<=(grid_points[0]-2); i ++ )
			{
				fac1=(1.0/lhs[j][i][2]);
				lhs[j][i][3]=(fac1*lhs[j][i][3]);
				lhs[j][i][4]=(fac1*lhs[j][i][4]);
				#pragma loop name y_solve#0#5#0#0 
				for (m=0; m<3; m ++ )
				{
					rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
				}
				lhs[j1][i][2]=(lhs[j1][i][2]-(lhs[j1][i][1]*lhs[j][i][3]));
				lhs[j1][i][3]=(lhs[j1][i][3]-(lhs[j1][i][1]*lhs[j][i][4]));
				#pragma loop name y_solve#0#5#0#1 
				for (m=0; m<3; m ++ )
				{
					rhs[k][j1][i][m]=(rhs[k][j1][i][m]-(lhs[j1][i][1]*rhs[k][j][i][m]));
				}
				lhs[j2][i][1]=(lhs[j2][i][1]-(lhs[j2][i][0]*lhs[j][i][3]));
				lhs[j2][i][2]=(lhs[j2][i][2]-(lhs[j2][i][0]*lhs[j][i][4]));
				#pragma loop name y_solve#0#5#0#2 
				for (m=0; m<3; m ++ )
				{
					rhs[k][j2][i][m]=(rhs[k][j2][i][m]-(lhs[j2][i][0]*rhs[k][j][i][m]));
				}
			}
		}
		j=(grid_points[1]-2);
		j1=(grid_points[1]-1);
		#pragma loop name y_solve#0#6 
		for (i=1; i<=(grid_points[0]-2); i ++ )
		{
			fac1=(1.0/lhs[j][i][2]);
			lhs[j][i][3]=(fac1*lhs[j][i][3]);
			lhs[j][i][4]=(fac1*lhs[j][i][4]);
			#pragma loop name y_solve#0#6#0 
			for (m=0; m<3; m ++ )
			{
				rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
			}
			lhs[j1][i][2]=(lhs[j1][i][2]-(lhs[j1][i][1]*lhs[j][i][3]));
			lhs[j1][i][3]=(lhs[j1][i][3]-(lhs[j1][i][1]*lhs[j][i][4]));
			#pragma loop name y_solve#0#6#1 
			for (m=0; m<3; m ++ )
			{
				rhs[k][j1][i][m]=(rhs[k][j1][i][m]-(lhs[j1][i][1]*rhs[k][j][i][m]));
			}
			fac2=(1.0/lhs[j1][i][2]);
			#pragma loop name y_solve#0#6#2 
			for (m=0; m<3; m ++ )
			{
				rhs[k][j1][i][m]=(fac2*rhs[k][j1][i][m]);
			}
		}
		#pragma loop name y_solve#0#7 
		for (j=0; j<=(grid_points[1]-3); j ++ )
		{
			j1=(j+1);
			j2=(j+2);
			#pragma loop name y_solve#0#7#0 
			for (i=1; i<=(grid_points[0]-2); i ++ )
			{
				m=3;
				fac1=(1.0/lhsp[j][i][2]);
				lhsp[j][i][3]=(fac1*lhsp[j][i][3]);
				lhsp[j][i][4]=(fac1*lhsp[j][i][4]);
				rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
				lhsp[j1][i][2]=(lhsp[j1][i][2]-(lhsp[j1][i][1]*lhsp[j][i][3]));
				lhsp[j1][i][3]=(lhsp[j1][i][3]-(lhsp[j1][i][1]*lhsp[j][i][4]));
				rhs[k][j1][i][m]=(rhs[k][j1][i][m]-(lhsp[j1][i][1]*rhs[k][j][i][m]));
				lhsp[j2][i][1]=(lhsp[j2][i][1]-(lhsp[j2][i][0]*lhsp[j][i][3]));
				lhsp[j2][i][2]=(lhsp[j2][i][2]-(lhsp[j2][i][0]*lhsp[j][i][4]));
				rhs[k][j2][i][m]=(rhs[k][j2][i][m]-(lhsp[j2][i][0]*rhs[k][j][i][m]));
				m=4;
				fac1=(1.0/lhsm[j][i][2]);
				lhsm[j][i][3]=(fac1*lhsm[j][i][3]);
				lhsm[j][i][4]=(fac1*lhsm[j][i][4]);
				rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
				lhsm[j1][i][2]=(lhsm[j1][i][2]-(lhsm[j1][i][1]*lhsm[j][i][3]));
				lhsm[j1][i][3]=(lhsm[j1][i][3]-(lhsm[j1][i][1]*lhsm[j][i][4]));
				rhs[k][j1][i][m]=(rhs[k][j1][i][m]-(lhsm[j1][i][1]*rhs[k][j][i][m]));
				lhsm[j2][i][1]=(lhsm[j2][i][1]-(lhsm[j2][i][0]*lhsm[j][i][3]));
				lhsm[j2][i][2]=(lhsm[j2][i][2]-(lhsm[j2][i][0]*lhsm[j][i][4]));
				rhs[k][j2][i][m]=(rhs[k][j2][i][m]-(lhsm[j2][i][0]*rhs[k][j][i][m]));
			}
		}
		j=(grid_points[1]-2);
		j1=(grid_points[1]-1);
		#pragma loop name y_solve#0#8 
		for (i=1; i<=(grid_points[0]-2); i ++ )
		{
			m=3;
			fac1=(1.0/lhsp[j][i][2]);
			lhsp[j][i][3]=(fac1*lhsp[j][i][3]);
			lhsp[j][i][4]=(fac1*lhsp[j][i][4]);
			rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
			lhsp[j1][i][2]=(lhsp[j1][i][2]-(lhsp[j1][i][1]*lhsp[j][i][3]));
			lhsp[j1][i][3]=(lhsp[j1][i][3]-(lhsp[j1][i][1]*lhsp[j][i][4]));
			rhs[k][j1][i][m]=(rhs[k][j1][i][m]-(lhsp[j1][i][1]*rhs[k][j][i][m]));
			m=4;
			fac1=(1.0/lhsm[j][i][2]);
			lhsm[j][i][3]=(fac1*lhsm[j][i][3]);
			lhsm[j][i][4]=(fac1*lhsm[j][i][4]);
			rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
			lhsm[j1][i][2]=(lhsm[j1][i][2]-(lhsm[j1][i][1]*lhsm[j][i][3]));
			lhsm[j1][i][3]=(lhsm[j1][i][3]-(lhsm[j1][i][1]*lhsm[j][i][4]));
			rhs[k][j1][i][m]=(rhs[k][j1][i][m]-(lhsm[j1][i][1]*rhs[k][j][i][m]));
			rhs[k][j1][i][3]=(rhs[k][j1][i][3]/lhsp[j1][i][2]);
			rhs[k][j1][i][4]=(rhs[k][j1][i][4]/lhsm[j1][i][2]);
		}
		j=(grid_points[1]-2);
		j1=(grid_points[1]-1);
		#pragma loop name y_solve#0#9 
		for (i=1; i<=(grid_points[0]-2); i ++ )
		{
			#pragma loop name y_solve#0#9#0 
			for (m=0; m<3; m ++ )
			{
				rhs[k][j][i][m]=(rhs[k][j][i][m]-(lhs[j][i][3]*rhs[k][j1][i][m]));
			}
			rhs[k][j][i][3]=(rhs[k][j][i][3]-(lhsp[j][i][3]*rhs[k][j1][i][3]));
			rhs[k][j][i][4]=(rhs[k][j][i][4]-(lhsm[j][i][3]*rhs[k][j1][i][4]));
		}
		#pragma loop name y_solve#0#10 
		for (j=(grid_points[1]-3); j>=0; j -- )
		{
			j1=(j+1);
			j2=(j+2);
			#pragma loop name y_solve#0#10#0 
			for (i=1; i<=(grid_points[0]-2); i ++ )
			{
				#pragma loop name y_solve#0#10#0#0 
				for (m=0; m<3; m ++ )
				{
					rhs[k][j][i][m]=((rhs[k][j][i][m]-(lhs[j][i][3]*rhs[k][j1][i][m]))-(lhs[j][i][4]*rhs[k][j2][i][m]));
				}
				rhs[k][j][i][3]=((rhs[k][j][i][3]-(lhsp[j][i][3]*rhs[k][j1][i][3]))-(lhsp[j][i][4]*rhs[k][j2][i][3]));
				rhs[k][j][i][4]=((rhs[k][j][i][4]-(lhsm[j][i][3]*rhs[k][j1][i][4]))-(lhsm[j][i][4]*rhs[k][j2][i][4]));
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
	pinvr();
}
