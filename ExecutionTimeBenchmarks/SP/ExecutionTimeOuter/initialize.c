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
void initialize()
{
	int i, j, k, m, ix, iy, iz;
	double xi, eta, zeta, Pface[2][3][5], Pxi, Peta, Pzeta, temp[5];
	#pragma event initialize#0 start
	
	struct timeval start_initialize_0, end_initialize_0;
	gettimeofday(&start_initialize_0, NULL);
	
	#pragma loop name initialize#0 
	for (k=0; k<=(grid_points[2]-1); k ++ )
	{
		#pragma loop name initialize#0#0 
		for (j=0; j<=(grid_points[1]-1); j ++ )
		{
			#pragma loop name initialize#0#0#0 
			for (i=0; i<=(grid_points[0]-1); i ++ )
			{
				u[k][j][i][0]=1.0;
				u[k][j][i][1]=0.0;
				u[k][j][i][2]=0.0;
				u[k][j][i][3]=0.0;
				u[k][j][i][4]=1.0;
			}
		}
	}
	#pragma event initialize#0 stop
	
	gettimeofday(&end_initialize_0, NULL);
	printf("Time initialize_0 seconds %0.8f \n", time_diff(&start_initialize_0, &end_initialize_0));
	
	#pragma event initialize#1 start
	
	struct timeval start_initialize_1, end_initialize_1;
	gettimeofday(&start_initialize_1, NULL);
	
	#pragma loop name initialize#1 
	for (k=0; k<=(grid_points[2]-1); k ++ )
	{
		zeta=(((double)k)*dnzm1);
		#pragma loop name initialize#1#0 
		for (j=0; j<=(grid_points[1]-1); j ++ )
		{
			eta=(((double)j)*dnym1);
			#pragma loop name initialize#1#0#0 
			for (i=0; i<=(grid_points[0]-1); i ++ )
			{
				xi=(((double)i)*dnxm1);
				#pragma loop name initialize#1#0#0#0 
				for (ix=0; ix<2; ix ++ )
				{
					Pxi=((double)ix);
					exact_solution(Pxi, eta, zeta,  & Pface[ix][0][0]);
				}
				#pragma loop name initialize#1#0#0#1 
				for (iy=0; iy<2; iy ++ )
				{
					Peta=((double)iy);
					exact_solution(xi, Peta, zeta,  & Pface[iy][1][0]);
				}
				#pragma loop name initialize#1#0#0#2 
				for (iz=0; iz<2; iz ++ )
				{
					Pzeta=((double)iz);
					exact_solution(xi, eta, Pzeta,  & Pface[iz][2][0]);
				}
				#pragma loop name initialize#1#0#0#3 
				for (m=0; m<5; m ++ )
				{
					Pxi=((xi*Pface[1][0][m])+((1.0-xi)*Pface[0][0][m]));
					Peta=((eta*Pface[1][1][m])+((1.0-eta)*Pface[0][1][m]));
					Pzeta=((zeta*Pface[1][2][m])+((1.0-zeta)*Pface[0][2][m]));
					u[k][j][i][m]=((((((Pxi+Peta)+Pzeta)-(Pxi*Peta))-(Pxi*Pzeta))-(Peta*Pzeta))+((Pxi*Peta)*Pzeta));
				}
			}
		}
	}
	#pragma event initialize#1 stop
	
	gettimeofday(&end_initialize_1, NULL);
	printf("Time initialize_1 seconds %0.8f \n", time_diff(&start_initialize_1, &end_initialize_1));
	
	xi=0.0;
	i=0;
	#pragma event initialize#2 start
	
	struct timeval start_initialize_2, end_initialize_2;
	gettimeofday(&start_initialize_2, NULL);
	
	#pragma loop name initialize#2 
	for (k=0; k<=(grid_points[2]-1); k ++ )
	{
		zeta=(((double)k)*dnzm1);
		#pragma loop name initialize#2#0 
		for (j=0; j<=(grid_points[1]-1); j ++ )
		{
			eta=(((double)j)*dnym1);
			exact_solution(xi, eta, zeta, temp);
			#pragma loop name initialize#2#0#0 
			for (m=0; m<5; m ++ )
			{
				u[k][j][i][m]=temp[m];
			}
		}
	}
	#pragma event initialize#2 stop
	
	gettimeofday(&end_initialize_2, NULL);
	printf("Time initialize_2 seconds %0.8f \n", time_diff(&start_initialize_2, &end_initialize_2));
	
	xi=1.0;
	i=(grid_points[0]-1);
	#pragma event initialize#3 start
	
	struct timeval start_initialize_3, end_initialize_3;
	gettimeofday(&start_initialize_3, NULL);
	
	#pragma loop name initialize#3 
	for (k=0; k<=(grid_points[2]-1); k ++ )
	{
		zeta=(((double)k)*dnzm1);
		#pragma loop name initialize#3#0 
		for (j=0; j<=(grid_points[1]-1); j ++ )
		{
			eta=(((double)j)*dnym1);
			exact_solution(xi, eta, zeta, temp);
			#pragma loop name initialize#3#0#0 
			for (m=0; m<5; m ++ )
			{
				u[k][j][i][m]=temp[m];
			}
		}
	}
	#pragma event initialize#3 stop
	
	gettimeofday(&end_initialize_3, NULL);
	printf("Time initialize_3 seconds %0.8f \n", time_diff(&start_initialize_3, &end_initialize_3));
	
	eta=0.0;
	j=0;
	#pragma event initialize#4 start
	
	struct timeval start_initialize_4, end_initialize_4;
	gettimeofday(&start_initialize_4, NULL);
	
	#pragma loop name initialize#4 
	for (k=0; k<=(grid_points[2]-1); k ++ )
	{
		zeta=(((double)k)*dnzm1);
		#pragma loop name initialize#4#0 
		for (i=0; i<=(grid_points[0]-1); i ++ )
		{
			xi=(((double)i)*dnxm1);
			exact_solution(xi, eta, zeta, temp);
			#pragma loop name initialize#4#0#0 
			for (m=0; m<5; m ++ )
			{
				u[k][j][i][m]=temp[m];
			}
		}
	}
	#pragma event initialize#4 stop
	
	gettimeofday(&end_initialize_4, NULL);
	printf("Time initialize_4 seconds %0.8f \n", time_diff(&start_initialize_4, &end_initialize_4));
	
	eta=1.0;
	j=(grid_points[1]-1);
	#pragma event initialize#5 start
	
	struct timeval start_initialize_5, end_initialize_5;
	gettimeofday(&start_initialize_5, NULL);
	
	#pragma loop name initialize#5 
	for (k=0; k<=(grid_points[2]-1); k ++ )
	{
		zeta=(((double)k)*dnzm1);
		#pragma loop name initialize#5#0 
		for (i=0; i<=(grid_points[0]-1); i ++ )
		{
			xi=(((double)i)*dnxm1);
			exact_solution(xi, eta, zeta, temp);
			#pragma loop name initialize#5#0#0 
			for (m=0; m<5; m ++ )
			{
				u[k][j][i][m]=temp[m];
			}
		}
	}
	#pragma event initialize#5 stop
	
	gettimeofday(&end_initialize_5, NULL);
	printf("Time initialize_5 seconds %0.8f \n", time_diff(&start_initialize_5, &end_initialize_5));
	
	zeta=0.0;
	k=0;
	#pragma event initialize#6 start
	
	struct timeval start_initialize_6, end_initialize_6;
	gettimeofday(&start_initialize_6, NULL);
	
	#pragma loop name initialize#6 
	for (j=0; j<=(grid_points[1]-1); j ++ )
	{
		eta=(((double)j)*dnym1);
		#pragma loop name initialize#6#0 
		for (i=0; i<=(grid_points[0]-1); i ++ )
		{
			xi=(((double)i)*dnxm1);
			exact_solution(xi, eta, zeta, temp);
			#pragma loop name initialize#6#0#0 
			for (m=0; m<5; m ++ )
			{
				u[k][j][i][m]=temp[m];
			}
		}
	}
	#pragma event initialize#6 stop
	
	gettimeofday(&end_initialize_6, NULL);
	printf("Time initialize_6 seconds %0.8f \n", time_diff(&start_initialize_6, &end_initialize_6));
	
	zeta=1.0;
	k=(grid_points[2]-1);
	#pragma event initialize#7 start
	
	struct timeval start_initialize_7, end_initialize_7;
	gettimeofday(&start_initialize_7, NULL);
	
	#pragma loop name initialize#7 
	for (j=0; j<=(grid_points[1]-1); j ++ )
	{
		eta=(((double)j)*dnym1);
		#pragma loop name initialize#7#0 
		for (i=0; i<=(grid_points[0]-1); i ++ )
		{
			xi=(((double)i)*dnxm1);
			exact_solution(xi, eta, zeta, temp);
			#pragma loop name initialize#7#0#0 
			for (m=0; m<5; m ++ )
			{
				u[k][j][i][m]=temp[m];
			}
		}
	}
	#pragma event initialize#7 stop
	
	gettimeofday(&end_initialize_7, NULL);
	printf("Time initialize_7 seconds %0.8f \n", time_diff(&start_initialize_7, &end_initialize_7));
	
}

void lhsinit(int ni, int nj)
{
	int j, m;
	#pragma event lhsinit#0 start
	
	struct timeval start_lhsinit_0, end_lhsinit_0;
	gettimeofday(&start_lhsinit_0, NULL);
	
	#pragma loop name lhsinit#0 
	for (j=1; j<=nj; j ++ )
	{
		#pragma loop name lhsinit#0#0 
		for (m=0; m<5; m ++ )
		{
			lhs[j][0][m]=0.0;
			lhsp[j][0][m]=0.0;
			lhsm[j][0][m]=0.0;
			lhs[j][ni][m]=0.0;
			lhsp[j][ni][m]=0.0;
			lhsm[j][ni][m]=0.0;
		}
		lhs[j][0][2]=1.0;
		lhsp[j][0][2]=1.0;
		lhsm[j][0][2]=1.0;
		lhs[j][ni][2]=1.0;
		lhsp[j][ni][2]=1.0;
		lhsm[j][ni][2]=1.0;
	}
	#pragma event lhsinit#0 stop
	
	gettimeofday(&end_lhsinit_0, NULL);
	printf("Time lhsinit_0 seconds %0.8f \n", time_diff(&start_lhsinit_0, &end_lhsinit_0));
	
}

void lhsinitj(int nj, int ni)
{
	int i, m;
	#pragma event lhsinitj#0 start
	
	struct timeval start_lhsinitj_0, end_lhsinitj_0;
	gettimeofday(&start_lhsinitj_0, NULL);
	
	#pragma loop name lhsinitj#0 
	for (i=1; i<=ni; i ++ )
	{
		#pragma loop name lhsinitj#0#0 
		for (m=0; m<5; m ++ )
		{
			lhs[0][i][m]=0.0;
			lhsp[0][i][m]=0.0;
			lhsm[0][i][m]=0.0;
			lhs[nj][i][m]=0.0;
			lhsp[nj][i][m]=0.0;
			lhsm[nj][i][m]=0.0;
		}
		lhs[0][i][2]=1.0;
		lhsp[0][i][2]=1.0;
		lhsm[0][i][2]=1.0;
		lhs[nj][i][2]=1.0;
		lhsp[nj][i][2]=1.0;
		lhsm[nj][i][2]=1.0;
	}
	#pragma event lhsinitj#0 stop
	
	gettimeofday(&end_lhsinitj_0, NULL);
	printf("Time lhsinitj_0 seconds %0.8f \n", time_diff(&start_lhsinitj_0, &end_lhsinitj_0));
	
}
