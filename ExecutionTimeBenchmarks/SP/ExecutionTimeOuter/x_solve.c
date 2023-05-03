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
void x_solve()
{
	int i, j, k, i1, i2, m;
	double ru1, fac1, fac2;
	if (timeron)
	{
		timer_start(6);
	}
	#pragma event x_solve#0 start
	
	struct timeval start_x_solve_0, end_x_solve_0;
	gettimeofday(&start_x_solve_0, NULL);
	
	#pragma loop name x_solve#0 
	for (k=1; k<=nz2; k ++ )
	{
		lhsinit(nx2+1, ny2);
		#pragma loop name x_solve#0#0 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name x_solve#0#0#0 
			for (i=0; i<=(grid_points[0]-1); i ++ )
			{
				ru1=(c3c4*rho_i[k][j][i]);
				cv[i]=us[k][j][i];
				rhon[i]=(((((dx2+(con43*ru1))>(dx5+(c1c5*ru1))) ? (dx2+(con43*ru1)) : (dx5+(c1c5*ru1)))>(((dxmax+ru1)>dx1) ? (dxmax+ru1) : dx1)) ? (((dx2+(con43*ru1))>(dx5+(c1c5*ru1))) ? (dx2+(con43*ru1)) : (dx5+(c1c5*ru1))) : (((dxmax+ru1)>dx1) ? (dxmax+ru1) : dx1));
			}
			#pragma loop name x_solve#0#0#1 
			for (i=1; i<=nx2; i ++ )
			{
				lhs[j][i][0]=0.0;
				lhs[j][i][1]=((( - dttx2)*cv[i-1])-(dttx1*rhon[i-1]));
				lhs[j][i][2]=(1.0+(c2dttx1*rhon[i]));
				lhs[j][i][3]=((dttx2*cv[i+1])-(dttx1*rhon[i+1]));
				lhs[j][i][4]=0.0;
			}
		}
		#pragma loop name x_solve#0#1 
		for (j=1; j<=ny2; j ++ )
		{
			i=1;
			lhs[j][i][2]=(lhs[j][i][2]+comz5);
			lhs[j][i][3]=(lhs[j][i][3]-comz4);
			lhs[j][i][4]=(lhs[j][i][4]+comz1);
			lhs[j][i+1][1]=(lhs[j][i+1][1]-comz4);
			lhs[j][i+1][2]=(lhs[j][i+1][2]+comz6);
			lhs[j][i+1][3]=(lhs[j][i+1][3]-comz4);
			lhs[j][i+1][4]=(lhs[j][i+1][4]+comz1);
		}
		#pragma loop name x_solve#0#2 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name x_solve#0#2#0 
			for (i=3; i<=(grid_points[0]-4); i ++ )
			{
				lhs[j][i][0]=(lhs[j][i][0]+comz1);
				lhs[j][i][1]=(lhs[j][i][1]-comz4);
				lhs[j][i][2]=(lhs[j][i][2]+comz6);
				lhs[j][i][3]=(lhs[j][i][3]-comz4);
				lhs[j][i][4]=(lhs[j][i][4]+comz1);
			}
		}
		#pragma loop name x_solve#0#3 
		for (j=1; j<=ny2; j ++ )
		{
			i=(grid_points[0]-3);
			lhs[j][i][0]=(lhs[j][i][0]+comz1);
			lhs[j][i][1]=(lhs[j][i][1]-comz4);
			lhs[j][i][2]=(lhs[j][i][2]+comz6);
			lhs[j][i][3]=(lhs[j][i][3]-comz4);
			lhs[j][i+1][0]=(lhs[j][i+1][0]+comz1);
			lhs[j][i+1][1]=(lhs[j][i+1][1]-comz4);
			lhs[j][i+1][2]=(lhs[j][i+1][2]+comz5);
		}
		#pragma loop name x_solve#0#4 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name x_solve#0#4#0 
			for (i=1; i<=nx2; i ++ )
			{
				lhsp[j][i][0]=lhs[j][i][0];
				lhsp[j][i][1]=(lhs[j][i][1]-(dttx2*speed[k][j][i-1]));
				lhsp[j][i][2]=lhs[j][i][2];
				lhsp[j][i][3]=(lhs[j][i][3]+(dttx2*speed[k][j][i+1]));
				lhsp[j][i][4]=lhs[j][i][4];
				lhsm[j][i][0]=lhs[j][i][0];
				lhsm[j][i][1]=(lhs[j][i][1]+(dttx2*speed[k][j][i-1]));
				lhsm[j][i][2]=lhs[j][i][2];
				lhsm[j][i][3]=(lhs[j][i][3]-(dttx2*speed[k][j][i+1]));
				lhsm[j][i][4]=lhs[j][i][4];
			}
		}
		#pragma loop name x_solve#0#5 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name x_solve#0#5#0 
			for (i=0; i<=(grid_points[0]-3); i ++ )
			{
				i1=(i+1);
				i2=(i+2);
				fac1=(1.0/lhs[j][i][2]);
				lhs[j][i][3]=(fac1*lhs[j][i][3]);
				lhs[j][i][4]=(fac1*lhs[j][i][4]);
				#pragma loop name x_solve#0#5#0#0 
				for (m=0; m<3; m ++ )
				{
					rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
				}
				lhs[j][i1][2]=(lhs[j][i1][2]-(lhs[j][i1][1]*lhs[j][i][3]));
				lhs[j][i1][3]=(lhs[j][i1][3]-(lhs[j][i1][1]*lhs[j][i][4]));
				#pragma loop name x_solve#0#5#0#1 
				for (m=0; m<3; m ++ )
				{
					rhs[k][j][i1][m]=(rhs[k][j][i1][m]-(lhs[j][i1][1]*rhs[k][j][i][m]));
				}
				lhs[j][i2][1]=(lhs[j][i2][1]-(lhs[j][i2][0]*lhs[j][i][3]));
				lhs[j][i2][2]=(lhs[j][i2][2]-(lhs[j][i2][0]*lhs[j][i][4]));
				#pragma loop name x_solve#0#5#0#2 
				for (m=0; m<3; m ++ )
				{
					rhs[k][j][i2][m]=(rhs[k][j][i2][m]-(lhs[j][i2][0]*rhs[k][j][i][m]));
				}
			}
		}
		#pragma loop name x_solve#0#6 
		for (j=1; j<=ny2; j ++ )
		{
			i=(grid_points[0]-2);
			i1=(grid_points[0]-1);
			fac1=(1.0/lhs[j][i][2]);
			lhs[j][i][3]=(fac1*lhs[j][i][3]);
			lhs[j][i][4]=(fac1*lhs[j][i][4]);
			#pragma loop name x_solve#0#6#0 
			for (m=0; m<3; m ++ )
			{
				rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
			}
			lhs[j][i1][2]=(lhs[j][i1][2]-(lhs[j][i1][1]*lhs[j][i][3]));
			lhs[j][i1][3]=(lhs[j][i1][3]-(lhs[j][i1][1]*lhs[j][i][4]));
			#pragma loop name x_solve#0#6#1 
			for (m=0; m<3; m ++ )
			{
				rhs[k][j][i1][m]=(rhs[k][j][i1][m]-(lhs[j][i1][1]*rhs[k][j][i][m]));
			}
			fac2=(1.0/lhs[j][i1][2]);
			#pragma loop name x_solve#0#6#2 
			for (m=0; m<3; m ++ )
			{
				rhs[k][j][i1][m]=(fac2*rhs[k][j][i1][m]);
			}
		}
		#pragma loop name x_solve#0#7 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name x_solve#0#7#0 
			for (i=0; i<=(grid_points[0]-3); i ++ )
			{
				i1=(i+1);
				i2=(i+2);
				m=3;
				fac1=(1.0/lhsp[j][i][2]);
				lhsp[j][i][3]=(fac1*lhsp[j][i][3]);
				lhsp[j][i][4]=(fac1*lhsp[j][i][4]);
				rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
				lhsp[j][i1][2]=(lhsp[j][i1][2]-(lhsp[j][i1][1]*lhsp[j][i][3]));
				lhsp[j][i1][3]=(lhsp[j][i1][3]-(lhsp[j][i1][1]*lhsp[j][i][4]));
				rhs[k][j][i1][m]=(rhs[k][j][i1][m]-(lhsp[j][i1][1]*rhs[k][j][i][m]));
				lhsp[j][i2][1]=(lhsp[j][i2][1]-(lhsp[j][i2][0]*lhsp[j][i][3]));
				lhsp[j][i2][2]=(lhsp[j][i2][2]-(lhsp[j][i2][0]*lhsp[j][i][4]));
				rhs[k][j][i2][m]=(rhs[k][j][i2][m]-(lhsp[j][i2][0]*rhs[k][j][i][m]));
				m=4;
				fac1=(1.0/lhsm[j][i][2]);
				lhsm[j][i][3]=(fac1*lhsm[j][i][3]);
				lhsm[j][i][4]=(fac1*lhsm[j][i][4]);
				rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
				lhsm[j][i1][2]=(lhsm[j][i1][2]-(lhsm[j][i1][1]*lhsm[j][i][3]));
				lhsm[j][i1][3]=(lhsm[j][i1][3]-(lhsm[j][i1][1]*lhsm[j][i][4]));
				rhs[k][j][i1][m]=(rhs[k][j][i1][m]-(lhsm[j][i1][1]*rhs[k][j][i][m]));
				lhsm[j][i2][1]=(lhsm[j][i2][1]-(lhsm[j][i2][0]*lhsm[j][i][3]));
				lhsm[j][i2][2]=(lhsm[j][i2][2]-(lhsm[j][i2][0]*lhsm[j][i][4]));
				rhs[k][j][i2][m]=(rhs[k][j][i2][m]-(lhsm[j][i2][0]*rhs[k][j][i][m]));
			}
		}
		#pragma loop name x_solve#0#8 
		for (j=1; j<=ny2; j ++ )
		{
			i=(grid_points[0]-2);
			i1=(grid_points[0]-1);
			m=3;
			fac1=(1.0/lhsp[j][i][2]);
			lhsp[j][i][3]=(fac1*lhsp[j][i][3]);
			lhsp[j][i][4]=(fac1*lhsp[j][i][4]);
			rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
			lhsp[j][i1][2]=(lhsp[j][i1][2]-(lhsp[j][i1][1]*lhsp[j][i][3]));
			lhsp[j][i1][3]=(lhsp[j][i1][3]-(lhsp[j][i1][1]*lhsp[j][i][4]));
			rhs[k][j][i1][m]=(rhs[k][j][i1][m]-(lhsp[j][i1][1]*rhs[k][j][i][m]));
			m=4;
			fac1=(1.0/lhsm[j][i][2]);
			lhsm[j][i][3]=(fac1*lhsm[j][i][3]);
			lhsm[j][i][4]=(fac1*lhsm[j][i][4]);
			rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
			lhsm[j][i1][2]=(lhsm[j][i1][2]-(lhsm[j][i1][1]*lhsm[j][i][3]));
			lhsm[j][i1][3]=(lhsm[j][i1][3]-(lhsm[j][i1][1]*lhsm[j][i][4]));
			rhs[k][j][i1][m]=(rhs[k][j][i1][m]-(lhsm[j][i1][1]*rhs[k][j][i][m]));
			rhs[k][j][i1][3]=(rhs[k][j][i1][3]/lhsp[j][i1][2]);
			rhs[k][j][i1][4]=(rhs[k][j][i1][4]/lhsm[j][i1][2]);
		}
		#pragma loop name x_solve#0#9 
		for (j=1; j<=ny2; j ++ )
		{
			i=(grid_points[0]-2);
			i1=(grid_points[0]-1);
			#pragma loop name x_solve#0#9#0 
			for (m=0; m<3; m ++ )
			{
				rhs[k][j][i][m]=(rhs[k][j][i][m]-(lhs[j][i][3]*rhs[k][j][i1][m]));
			}
			rhs[k][j][i][3]=(rhs[k][j][i][3]-(lhsp[j][i][3]*rhs[k][j][i1][3]));
			rhs[k][j][i][4]=(rhs[k][j][i][4]-(lhsm[j][i][3]*rhs[k][j][i1][4]));
		}
		#pragma loop name x_solve#0#10 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name x_solve#0#10#0 
			for (i=(grid_points[0]-3); i>=0; i -- )
			{
				i1=(i+1);
				i2=(i+2);
				#pragma loop name x_solve#0#10#0#0 
				for (m=0; m<3; m ++ )
				{
					rhs[k][j][i][m]=((rhs[k][j][i][m]-(lhs[j][i][3]*rhs[k][j][i1][m]))-(lhs[j][i][4]*rhs[k][j][i2][m]));
				}
				rhs[k][j][i][3]=((rhs[k][j][i][3]-(lhsp[j][i][3]*rhs[k][j][i1][3]))-(lhsp[j][i][4]*rhs[k][j][i2][3]));
				rhs[k][j][i][4]=((rhs[k][j][i][4]-(lhsm[j][i][3]*rhs[k][j][i1][4]))-(lhsm[j][i][4]*rhs[k][j][i2][4]));
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
	ninvr();
}
