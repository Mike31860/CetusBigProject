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
void pinvr()
{
	int i, j, k;
	double r1, r2, r3, r4, r5, t1, t2;
	if (timeron)
	{
		timer_start(12);
	}
	#pragma event pinvr#0 start
	
	struct timeval start_pinvr_0, end_pinvr_0;
	gettimeofday(&start_pinvr_0, NULL);
	
	#pragma loop name pinvr#0 
	for (k=1; k<=nz2; k ++ )
	{
		#pragma loop name pinvr#0#0 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name pinvr#0#0#0 
			for (i=1; i<=nx2; i ++ )
			{
				r1=rhs[k][j][i][0];
				r2=rhs[k][j][i][1];
				r3=rhs[k][j][i][2];
				r4=rhs[k][j][i][3];
				r5=rhs[k][j][i][4];
				t1=(bt*r1);
				t2=(0.5*(r4+r5));
				rhs[k][j][i][0]=(bt*(r4-r5));
				rhs[k][j][i][1]=( - r3);
				rhs[k][j][i][2]=r2;
				rhs[k][j][i][3]=(( - t1)+t2);
				rhs[k][j][i][4]=(t1+t2);
			}
		}
	}
	#pragma event pinvr#0 stop
	
	gettimeofday(&end_pinvr_0, NULL);
	printf("Time pinvr_0 seconds %0.8f \n", time_diff(&start_pinvr_0, &end_pinvr_0));
	
	if (timeron)
	{
		timer_stop(12);
	}
}
