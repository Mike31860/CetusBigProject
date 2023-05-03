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
void txinvr()
{
	int i, j, k;
	double t1, t2, t3, ac, ru1, uu, vv, ww, r1, r2, r3, r4, r5, ac2inv;
	if (timeron)
	{
		timer_start(11);
	}
	#pragma event txinvr#0 start
	
	struct timeval start_txinvr_0, end_txinvr_0;
	gettimeofday(&start_txinvr_0, NULL);
	
	#pragma loop name txinvr#0 
	for (k=1; k<=nz2; k ++ )
	{
		#pragma loop name txinvr#0#0 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name txinvr#0#0#0 
			for (i=1; i<=nx2; i ++ )
			{
				ru1=rho_i[k][j][i];
				uu=us[k][j][i];
				vv=vs[k][j][i];
				ww=ws[k][j][i];
				ac=speed[k][j][i];
				ac2inv=(ac*ac);
				r1=rhs[k][j][i][0];
				r2=rhs[k][j][i][1];
				r3=rhs[k][j][i][2];
				r4=rhs[k][j][i][3];
				r5=rhs[k][j][i][4];
				t1=((c2/ac2inv)*(((((qs[k][j][i]*r1)-(uu*r2))-(vv*r3))-(ww*r4))+r5));
				t2=((bt*ru1)*((uu*r1)-r2));
				t3=(((bt*ru1)*ac)*t1);
				rhs[k][j][i][0]=(r1-t1);
				rhs[k][j][i][1]=(( - ru1)*((ww*r1)-r4));
				rhs[k][j][i][2]=(ru1*((vv*r1)-r3));
				rhs[k][j][i][3]=(( - t2)+t3);
				rhs[k][j][i][4]=(t2+t3);
			}
		}
	}
	#pragma event txinvr#0 stop
	
	gettimeofday(&end_txinvr_0, NULL);
	printf("Time txinvr_0 seconds %0.8f \n", time_diff(&start_txinvr_0, &end_txinvr_0));
	
	if (timeron)
	{
		timer_stop(11);
	}
}
