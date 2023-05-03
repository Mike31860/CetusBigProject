#ifdef CETUS_TIMING
typedef struct cetusprofile cetusprofile;
extern cetusprofile cetus_prof;
void cetus_tic(cetusprofile *, int);
void cetus_toc(cetusprofile *, int);
#endif /* CETUS_TIMING */


#include "header.h"

#include <time.h>

/* #include "headerVariable.h" */

#include <stdlib.h>

void adi()
{
	/* clock_t begin9 = clock();
	clock_t end9 = clock();
	clock_t begin10 = clock();
	clock_t end10 = clock();
	clock_t begin11 = clock();
	clock_t end11 = clock();
	clock_t begin12 = clock();
	clock_t end12 = clock();
	clock_t begin13 = clock();
	clock_t end13 = clock();
	clock_t begin14 = clock();
	clock_t end14 = clock(); */
	compute_rhs();
	/* time_spent9+=(((double)(end9-begin9))/((clock_t)1000)); */
	txinvr();
/* 	time_spent10+=(((double)(end10-begin10))/((clock_t)1000)); */
	x_solve();
/* 	time_spent11+=(((double)(end11-begin11))/((clock_t)1000)); */
	y_solve();
	/* time_spent12+=(((double)(end12-begin12))/((clock_t)1000)); */
	z_solve();
/* 	time_spent13+=(((double)(end13-begin13))/((clock_t)1000)); */
	add();
	/* time_spent14+=(((double)(end14-begin14))/((clock_t)1000)); */
}
