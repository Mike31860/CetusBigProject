#ifdef CETUS_TIMING
typedef struct cetusprofile cetusprofile;
extern cetusprofile cetus_prof;
void cetus_tic(cetusprofile *, int);
void cetus_toc(cetusprofile *, int);
#endif /* CETUS_TIMING */


#include "header.h"

#include <math.h>

#include <stdlib.h>
#include <sys/time.h>
#include "time_diff.h"
void error_norm(double rms[5])
{
	int i, j, k, m, d;
	double xi, eta, zeta, u_exact[5], add;
	#pragma event error_norm#0 start
	
	struct timeval start_error_norm_0, end_error_norm_0;
	gettimeofday(&start_error_norm_0, NULL);
	
	#pragma loop name error_norm#0 
	for (m=0; m<5; m ++ )
	{
		rms[m]=0.0;
	}
	#pragma event error_norm#0 stop
	
	gettimeofday(&end_error_norm_0, NULL);
	printf("Time error_norm_0 seconds %0.8f \n", time_diff(&start_error_norm_0, &end_error_norm_0));
	
	#pragma event error_norm#1 start
	
	struct timeval start_error_norm_1, end_error_norm_1;
	gettimeofday(&start_error_norm_1, NULL);
	
	#pragma loop name error_norm#1 
	for (k=0; k<=(grid_points[2]-1); k ++ )
	{
		zeta=(((double)k)*dnzm1);
		#pragma loop name error_norm#1#0 
		for (j=0; j<=(grid_points[1]-1); j ++ )
		{
			eta=(((double)j)*dnym1);
			#pragma loop name error_norm#1#0#0 
			for (i=0; i<=(grid_points[0]-1); i ++ )
			{
				xi=(((double)i)*dnxm1);
				exact_solution(xi, eta, zeta, u_exact);
				#pragma loop name error_norm#1#0#0#0 
				for (m=0; m<5; m ++ )
				{
					add=(u[k][j][i][m]-u_exact[m]);
					rms[m]=(rms[m]+(add*add));
				}
			}
		}
	}
	#pragma event error_norm#1 stop
	
	gettimeofday(&end_error_norm_1, NULL);
	printf("Time error_norm_1 seconds %0.8f \n", time_diff(&start_error_norm_1, &end_error_norm_1));
	
	#pragma event error_norm#2 start
	
	struct timeval start_error_norm_2, end_error_norm_2;
	gettimeofday(&start_error_norm_2, NULL);
	
	#pragma loop name error_norm#2 
	for (m=0; m<5; m ++ )
	{
		#pragma loop name error_norm#2#0 
		for (d=0; d<3; d ++ )
		{
			rms[m]=(rms[m]/((double)(grid_points[d]-2)));
		}
		rms[m]=sqrt(rms[m]);
	}
	#pragma event error_norm#2 stop
	
	gettimeofday(&end_error_norm_2, NULL);
	printf("Time error_norm_2 seconds %0.8f \n", time_diff(&start_error_norm_2, &end_error_norm_2));
	
}

void rhs_norm(double rms[5])
{
	int i, j, k, d, m;
	double add;
	#pragma event rhs_norm#0 start
	
	struct timeval start_rhs_norm_0, end_rhs_norm_0;
	gettimeofday(&start_rhs_norm_0, NULL);
	
	#pragma loop name rhs_norm#0 
	for (m=0; m<5; m ++ )
	{
		rms[m]=0.0;
	}
	#pragma event rhs_norm#0 stop
	
	gettimeofday(&end_rhs_norm_0, NULL);
	printf("Time rhs_norm_0 seconds %0.8f \n", time_diff(&start_rhs_norm_0, &end_rhs_norm_0));
	
	#pragma event rhs_norm#1 start
	
	struct timeval start_rhs_norm_1, end_rhs_norm_1;
	gettimeofday(&start_rhs_norm_1, NULL);
	
	#pragma loop name rhs_norm#1 
	for (k=1; k<=nz2; k ++ )
	{
		#pragma loop name rhs_norm#1#0 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name rhs_norm#1#0#0 
			for (i=1; i<=nx2; i ++ )
			{
				#pragma loop name rhs_norm#1#0#0#0 
				for (m=0; m<5; m ++ )
				{
					add=rhs[k][j][i][m];
					rms[m]=(rms[m]+(add*add));
				}
			}
		}
	}
	#pragma event rhs_norm#1 stop
	
	gettimeofday(&end_rhs_norm_1, NULL);
	printf("Time rhs_norm_1 seconds %0.8f \n", time_diff(&start_rhs_norm_1, &end_rhs_norm_1));
	
	#pragma event rhs_norm#2 start
	
	struct timeval start_rhs_norm_2, end_rhs_norm_2;
	gettimeofday(&start_rhs_norm_2, NULL);
	
	#pragma loop name rhs_norm#2 
	for (m=0; m<5; m ++ )
	{
		#pragma loop name rhs_norm#2#0 
		for (d=0; d<3; d ++ )
		{
			rms[m]=(rms[m]/((double)(grid_points[d]-2)));
		}
		rms[m]=sqrt(rms[m]);
	}
	#pragma event rhs_norm#2 stop
	
	gettimeofday(&end_rhs_norm_2, NULL);
	printf("Time rhs_norm_2 seconds %0.8f \n", time_diff(&start_rhs_norm_2, &end_rhs_norm_2));
	
}
