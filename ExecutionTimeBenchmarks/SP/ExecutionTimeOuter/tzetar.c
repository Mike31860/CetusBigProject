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
void tzetar()
{
	int i, j, k;
	double t1, t2, t3, ac, xvel, yvel, zvel, r1, r2, r3, r4, r5;
	double btuz, ac2u, uzik1;
	if (timeron)
	{
		timer_start(14);
	}
	#pragma event tzetar#0 start
	
	struct timeval start_tzetar_0, end_tzetar_0;
	gettimeofday(&start_tzetar_0, NULL);
	
	#pragma loop name tzetar#0 
	for (k=1; k<=nz2; k ++ )
	{
		#pragma loop name tzetar#0#0 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name tzetar#0#0#0 
			for (i=1; i<=nx2; i ++ )
			{
				xvel=us[k][j][i];
				yvel=vs[k][j][i];
				zvel=ws[k][j][i];
				ac=speed[k][j][i];
				ac2u=(ac*ac);
				r1=rhs[k][j][i][0];
				r2=rhs[k][j][i][1];
				r3=rhs[k][j][i][2];
				r4=rhs[k][j][i][3];
				r5=rhs[k][j][i][4];
				uzik1=u[k][j][i][0];
				btuz=(bt*uzik1);
				t1=((btuz/ac)*(r4+r5));
				t2=(r3+t1);
				t3=(btuz*(r4-r5));
				rhs[k][j][i][0]=t2;
				rhs[k][j][i][1]=((( - uzik1)*r2)+(xvel*t2));
				rhs[k][j][i][2]=((uzik1*r1)+(yvel*t2));
				rhs[k][j][i][3]=((zvel*t2)+t3);
				rhs[k][j][i][4]=((((uzik1*((( - xvel)*r2)+(yvel*r1)))+(qs[k][j][i]*t2))+((c2iv*ac2u)*t1))+(zvel*t3));
			}
		}
	}
	#pragma event tzetar#0 stop
	
	gettimeofday(&end_tzetar_0, NULL);
	printf("Time tzetar_0 seconds %0.8f \n", time_diff(&start_tzetar_0, &end_tzetar_0));
	
	if (timeron)
	{
		timer_stop(14);
	}
}
