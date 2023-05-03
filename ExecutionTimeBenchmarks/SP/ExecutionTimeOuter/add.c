#ifdef CETUS_TIMING
typedef struct cetusprofile cetusprofile;
extern cetusprofile cetus_prof;
void cetus_tic(cetusprofile *, int);
void cetus_toc(cetusprofile *, int);
#endif /* CETUS_TIMING */


#include "header.h"

#include "../../common/timers.h"

#include <stdlib.h>
#include <sys/time.h>
#include "time_diff.h"
void add()
{
	int i, j, k, m;
	if (timeron)
	{
		timer_start(15);
	}
	#pragma event add#0 start
	
	struct timeval start_add_0, end_add_0;
	gettimeofday(&start_add_0, NULL);
	
	#pragma loop name add#0 
	for (k=1; k<=nz2; k ++ )
	{
		#pragma loop name add#0#0 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name add#0#0#0 
			for (i=1; i<=nx2; i ++ )
			{
				#pragma loop name add#0#0#0#0 
				for (m=0; m<5; m ++ )
				{
					u[k][j][i][m]=(u[k][j][i][m]+rhs[k][j][i][m]);
				}
			}
		}
	}
	#pragma event add#0 stop
	
	gettimeofday(&end_add_0, NULL);
	printf("Time add_0 seconds %0.8f \n", time_diff(&start_add_0, &end_add_0));
	
	if (timeron)
	{
		timer_stop(15);
	}
}
