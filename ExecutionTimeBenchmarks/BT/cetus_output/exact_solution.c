#ifdef CETUS_TIMING
typedef struct cetusprofile cetusprofile;
extern cetusprofile cetus_prof;
void cetus_tic(cetusprofile *, int);
void cetus_toc(cetusprofile *, int);
#endif /* CETUS_TIMING */


#include "header.h"
#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>
#include "time_diff.h"
void exact_solution(double xi, double eta, double zeta, double dtemp[5])
{
	int m;
	#pragma event exact_solution#0 start
	
	struct timeval start_exact_solution_0, end_exact_solution_0;
	gettimeofday(&start_exact_solution_0, NULL);
	
	#pragma loop name exact_solution#0 
	for (m=0; m<5; m ++ )
	{
		dtemp[m]=(((ce[m][0]+(xi*(ce[m][1]+(xi*(ce[m][4]+(xi*(ce[m][7]+(xi*ce[m][10]))))))))+(eta*(ce[m][2]+(eta*(ce[m][5]+(eta*(ce[m][8]+(eta*ce[m][11]))))))))+(zeta*(ce[m][3]+(zeta*(ce[m][6]+(zeta*(ce[m][9]+(zeta*ce[m][12]))))))));
	}
	#pragma event exact_solution#0 stop
	
	gettimeofday(&end_exact_solution_0, NULL);
	printf("Time exact_solution_0 seconds %0.8f \n", time_diff(&start_exact_solution_0, &end_exact_solution_0));
	
}
