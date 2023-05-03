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
void ninvr()
{
	int i, j, k;
	double r1, r2, r3, r4, r5, t1, t2;
	if (timeron)
	{
		timer_start(13);
	}
	#pragma event ninvr#0 start
	
	struct timeval start_ninvr_0, end_ninvr_0;
	gettimeofday(&start_ninvr_0, NULL);
	
	#pragma loop name ninvr#0 
	for (k=1; k<=nz2; k ++ )
	{
		#pragma loop name ninvr#0#0 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name ninvr#0#0#0 
			for (i=1; i<=nx2; i ++ )
			{
				r1=rhs[k][j][i][0];
				r2=rhs[k][j][i][1];
				r3=rhs[k][j][i][2];
				r4=rhs[k][j][i][3];
				r5=rhs[k][j][i][4];
				t1=(bt*r3);
				t2=(0.5*(r4+r5));
				rhs[k][j][i][0]=( - r2);
				rhs[k][j][i][1]=r1;
				rhs[k][j][i][2]=(bt*(r4-r5));
				rhs[k][j][i][3]=(( - t1)+t2);
				rhs[k][j][i][4]=(t1+t2);
			}
		}
	}
	#pragma event ninvr#0 stop
	
	gettimeofday(&end_ninvr_0, NULL);
	printf("Time ninvr_0 seconds %0.8f \n", time_diff(&start_ninvr_0, &end_ninvr_0));
	
	if (timeron)
	{
		timer_stop(13);
	}
}
