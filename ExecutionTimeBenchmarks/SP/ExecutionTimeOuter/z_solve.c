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
void z_solve()
{
	int i, j, k, k1, k2, m;
	double ru1, fac1, fac2;
	if (timeron)
	{
		timer_start(8);
	}
	#pragma event z_solve#0 start
	
	struct timeval start_z_solve_0, end_z_solve_0;
	gettimeofday(&start_z_solve_0, NULL);
	
	#pragma loop name z_solve#0 
	for (j=1; j<=ny2; j ++ )
	{
		lhsinitj(nz2+1, nx2);
		#pragma loop name z_solve#0#0 
		for (i=1; i<=nx2; i ++ )
		{
			#pragma loop name z_solve#0#0#0 
			for (k=0; k<=(nz2+1); k ++ )
			{
				ru1=(c3c4*rho_i[k][j][i]);
				cv[k]=ws[k][j][i];
				rhos[k]=(((((dz4+(con43*ru1))>(dz5+(c1c5*ru1))) ? (dz4+(con43*ru1)) : (dz5+(c1c5*ru1)))>(((dzmax+ru1)>dz1) ? (dzmax+ru1) : dz1)) ? (((dz4+(con43*ru1))>(dz5+(c1c5*ru1))) ? (dz4+(con43*ru1)) : (dz5+(c1c5*ru1))) : (((dzmax+ru1)>dz1) ? (dzmax+ru1) : dz1));
			}
			#pragma loop name z_solve#0#0#1 
			for (k=1; k<=nz2; k ++ )
			{
				lhs[k][i][0]=0.0;
				lhs[k][i][1]=((( - dttz2)*cv[k-1])-(dttz1*rhos[k-1]));
				lhs[k][i][2]=(1.0+(c2dttz1*rhos[k]));
				lhs[k][i][3]=((dttz2*cv[k+1])-(dttz1*rhos[k+1]));
				lhs[k][i][4]=0.0;
			}
		}
		#pragma loop name z_solve#0#1 
		for (i=1; i<=nx2; i ++ )
		{
			k=1;
			lhs[k][i][2]=(lhs[k][i][2]+comz5);
			lhs[k][i][3]=(lhs[k][i][3]-comz4);
			lhs[k][i][4]=(lhs[k][i][4]+comz1);
			k=2;
			lhs[k][i][1]=(lhs[k][i][1]-comz4);
			lhs[k][i][2]=(lhs[k][i][2]+comz6);
			lhs[k][i][3]=(lhs[k][i][3]-comz4);
			lhs[k][i][4]=(lhs[k][i][4]+comz1);
		}
		#pragma loop name z_solve#0#2 
		for (k=3; k<=(nz2-2); k ++ )
		{
			#pragma loop name z_solve#0#2#0 
			for (i=1; i<=nx2; i ++ )
			{
				lhs[k][i][0]=(lhs[k][i][0]+comz1);
				lhs[k][i][1]=(lhs[k][i][1]-comz4);
				lhs[k][i][2]=(lhs[k][i][2]+comz6);
				lhs[k][i][3]=(lhs[k][i][3]-comz4);
				lhs[k][i][4]=(lhs[k][i][4]+comz1);
			}
		}
		#pragma loop name z_solve#0#3 
		for (i=1; i<=nx2; i ++ )
		{
			k=(nz2-1);
			lhs[k][i][0]=(lhs[k][i][0]+comz1);
			lhs[k][i][1]=(lhs[k][i][1]-comz4);
			lhs[k][i][2]=(lhs[k][i][2]+comz6);
			lhs[k][i][3]=(lhs[k][i][3]-comz4);
			k=nz2;
			lhs[k][i][0]=(lhs[k][i][0]+comz1);
			lhs[k][i][1]=(lhs[k][i][1]-comz4);
			lhs[k][i][2]=(lhs[k][i][2]+comz5);
		}
		#pragma loop name z_solve#0#4 
		for (k=1; k<=nz2; k ++ )
		{
			#pragma loop name z_solve#0#4#0 
			for (i=1; i<=nx2; i ++ )
			{
				lhsp[k][i][0]=lhs[k][i][0];
				lhsp[k][i][1]=(lhs[k][i][1]-(dttz2*speed[k-1][j][i]));
				lhsp[k][i][2]=lhs[k][i][2];
				lhsp[k][i][3]=(lhs[k][i][3]+(dttz2*speed[k+1][j][i]));
				lhsp[k][i][4]=lhs[k][i][4];
				lhsm[k][i][0]=lhs[k][i][0];
				lhsm[k][i][1]=(lhs[k][i][1]+(dttz2*speed[k-1][j][i]));
				lhsm[k][i][2]=lhs[k][i][2];
				lhsm[k][i][3]=(lhs[k][i][3]-(dttz2*speed[k+1][j][i]));
				lhsm[k][i][4]=lhs[k][i][4];
			}
		}
		#pragma loop name z_solve#0#5 
		for (k=0; k<=(grid_points[2]-3); k ++ )
		{
			k1=(k+1);
			k2=(k+2);
			#pragma loop name z_solve#0#5#0 
			for (i=1; i<=nx2; i ++ )
			{
				fac1=(1.0/lhs[k][i][2]);
				lhs[k][i][3]=(fac1*lhs[k][i][3]);
				lhs[k][i][4]=(fac1*lhs[k][i][4]);
				#pragma loop name z_solve#0#5#0#0 
				for (m=0; m<3; m ++ )
				{
					rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
				}
				lhs[k1][i][2]=(lhs[k1][i][2]-(lhs[k1][i][1]*lhs[k][i][3]));
				lhs[k1][i][3]=(lhs[k1][i][3]-(lhs[k1][i][1]*lhs[k][i][4]));
				#pragma loop name z_solve#0#5#0#1 
				for (m=0; m<3; m ++ )
				{
					rhs[k1][j][i][m]=(rhs[k1][j][i][m]-(lhs[k1][i][1]*rhs[k][j][i][m]));
				}
				lhs[k2][i][1]=(lhs[k2][i][1]-(lhs[k2][i][0]*lhs[k][i][3]));
				lhs[k2][i][2]=(lhs[k2][i][2]-(lhs[k2][i][0]*lhs[k][i][4]));
				#pragma loop name z_solve#0#5#0#2 
				for (m=0; m<3; m ++ )
				{
					rhs[k2][j][i][m]=(rhs[k2][j][i][m]-(lhs[k2][i][0]*rhs[k][j][i][m]));
				}
			}
		}
		k=(grid_points[2]-2);
		k1=(grid_points[2]-1);
		#pragma loop name z_solve#0#6 
		for (i=1; i<=nx2; i ++ )
		{
			fac1=(1.0/lhs[k][i][2]);
			lhs[k][i][3]=(fac1*lhs[k][i][3]);
			lhs[k][i][4]=(fac1*lhs[k][i][4]);
			#pragma loop name z_solve#0#6#0 
			for (m=0; m<3; m ++ )
			{
				rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
			}
			lhs[k1][i][2]=(lhs[k1][i][2]-(lhs[k1][i][1]*lhs[k][i][3]));
			lhs[k1][i][3]=(lhs[k1][i][3]-(lhs[k1][i][1]*lhs[k][i][4]));
			#pragma loop name z_solve#0#6#1 
			for (m=0; m<3; m ++ )
			{
				rhs[k1][j][i][m]=(rhs[k1][j][i][m]-(lhs[k1][i][1]*rhs[k][j][i][m]));
			}
			fac2=(1.0/lhs[k1][i][2]);
			#pragma loop name z_solve#0#6#2 
			for (m=0; m<3; m ++ )
			{
				rhs[k1][j][i][m]=(fac2*rhs[k1][j][i][m]);
			}
		}
		#pragma loop name z_solve#0#7 
		for (k=0; k<=(grid_points[2]-3); k ++ )
		{
			k1=(k+1);
			k2=(k+2);
			#pragma loop name z_solve#0#7#0 
			for (i=1; i<=nx2; i ++ )
			{
				m=3;
				fac1=(1.0/lhsp[k][i][2]);
				lhsp[k][i][3]=(fac1*lhsp[k][i][3]);
				lhsp[k][i][4]=(fac1*lhsp[k][i][4]);
				rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
				lhsp[k1][i][2]=(lhsp[k1][i][2]-(lhsp[k1][i][1]*lhsp[k][i][3]));
				lhsp[k1][i][3]=(lhsp[k1][i][3]-(lhsp[k1][i][1]*lhsp[k][i][4]));
				rhs[k1][j][i][m]=(rhs[k1][j][i][m]-(lhsp[k1][i][1]*rhs[k][j][i][m]));
				lhsp[k2][i][1]=(lhsp[k2][i][1]-(lhsp[k2][i][0]*lhsp[k][i][3]));
				lhsp[k2][i][2]=(lhsp[k2][i][2]-(lhsp[k2][i][0]*lhsp[k][i][4]));
				rhs[k2][j][i][m]=(rhs[k2][j][i][m]-(lhsp[k2][i][0]*rhs[k][j][i][m]));
				m=4;
				fac1=(1.0/lhsm[k][i][2]);
				lhsm[k][i][3]=(fac1*lhsm[k][i][3]);
				lhsm[k][i][4]=(fac1*lhsm[k][i][4]);
				rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
				lhsm[k1][i][2]=(lhsm[k1][i][2]-(lhsm[k1][i][1]*lhsm[k][i][3]));
				lhsm[k1][i][3]=(lhsm[k1][i][3]-(lhsm[k1][i][1]*lhsm[k][i][4]));
				rhs[k1][j][i][m]=(rhs[k1][j][i][m]-(lhsm[k1][i][1]*rhs[k][j][i][m]));
				lhsm[k2][i][1]=(lhsm[k2][i][1]-(lhsm[k2][i][0]*lhsm[k][i][3]));
				lhsm[k2][i][2]=(lhsm[k2][i][2]-(lhsm[k2][i][0]*lhsm[k][i][4]));
				rhs[k2][j][i][m]=(rhs[k2][j][i][m]-(lhsm[k2][i][0]*rhs[k][j][i][m]));
			}
		}
		k=(grid_points[2]-2);
		k1=(grid_points[2]-1);
		#pragma loop name z_solve#0#8 
		for (i=1; i<=nx2; i ++ )
		{
			m=3;
			fac1=(1.0/lhsp[k][i][2]);
			lhsp[k][i][3]=(fac1*lhsp[k][i][3]);
			lhsp[k][i][4]=(fac1*lhsp[k][i][4]);
			rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
			lhsp[k1][i][2]=(lhsp[k1][i][2]-(lhsp[k1][i][1]*lhsp[k][i][3]));
			lhsp[k1][i][3]=(lhsp[k1][i][3]-(lhsp[k1][i][1]*lhsp[k][i][4]));
			rhs[k1][j][i][m]=(rhs[k1][j][i][m]-(lhsp[k1][i][1]*rhs[k][j][i][m]));
			m=4;
			fac1=(1.0/lhsm[k][i][2]);
			lhsm[k][i][3]=(fac1*lhsm[k][i][3]);
			lhsm[k][i][4]=(fac1*lhsm[k][i][4]);
			rhs[k][j][i][m]=(fac1*rhs[k][j][i][m]);
			lhsm[k1][i][2]=(lhsm[k1][i][2]-(lhsm[k1][i][1]*lhsm[k][i][3]));
			lhsm[k1][i][3]=(lhsm[k1][i][3]-(lhsm[k1][i][1]*lhsm[k][i][4]));
			rhs[k1][j][i][m]=(rhs[k1][j][i][m]-(lhsm[k1][i][1]*rhs[k][j][i][m]));
			rhs[k1][j][i][3]=(rhs[k1][j][i][3]/lhsp[k1][i][2]);
			rhs[k1][j][i][4]=(rhs[k1][j][i][4]/lhsm[k1][i][2]);
		}
		k=(grid_points[2]-2);
		k1=(grid_points[2]-1);
		#pragma loop name z_solve#0#9 
		for (i=1; i<=nx2; i ++ )
		{
			#pragma loop name z_solve#0#9#0 
			for (m=0; m<3; m ++ )
			{
				rhs[k][j][i][m]=(rhs[k][j][i][m]-(lhs[k][i][3]*rhs[k1][j][i][m]));
			}
			rhs[k][j][i][3]=(rhs[k][j][i][3]-(lhsp[k][i][3]*rhs[k1][j][i][3]));
			rhs[k][j][i][4]=(rhs[k][j][i][4]-(lhsm[k][i][3]*rhs[k1][j][i][4]));
		}
		#pragma loop name z_solve#0#10 
		for (k=(grid_points[2]-3); k>=0; k -- )
		{
			k1=(k+1);
			k2=(k+2);
			#pragma loop name z_solve#0#10#0 
			for (i=1; i<=nx2; i ++ )
			{
				#pragma loop name z_solve#0#10#0#0 
				for (m=0; m<3; m ++ )
				{
					rhs[k][j][i][m]=((rhs[k][j][i][m]-(lhs[k][i][3]*rhs[k1][j][i][m]))-(lhs[k][i][4]*rhs[k2][j][i][m]));
				}
				rhs[k][j][i][3]=((rhs[k][j][i][3]-(lhsp[k][i][3]*rhs[k1][j][i][3]))-(lhsp[k][i][4]*rhs[k2][j][i][3]));
				rhs[k][j][i][4]=((rhs[k][j][i][4]-(lhsm[k][i][3]*rhs[k1][j][i][4]))-(lhsm[k][i][4]*rhs[k2][j][i][4]));
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
	tzetar();
}
