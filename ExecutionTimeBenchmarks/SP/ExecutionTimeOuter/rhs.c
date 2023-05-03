#ifdef CETUS_TIMING
typedef struct cetusprofile cetusprofile;
extern cetusprofile cetus_prof;
void cetus_tic(cetusprofile *, int);
void cetus_toc(cetusprofile *, int);
#endif /* CETUS_TIMING */


#include <math.h>

#include "header.h"

#include <time.h>

/* #include "headerVariable.h" */

#include <stdlib.h>
#include <sys/time.h>
#include "time_diff.h"
void compute_rhs()
{
	int i, j, k, m;
	double aux, rho_inv, uijk, up1, um1, vijk, vp1, vm1, wijk, wp1, wm1;
	/* clock_t begin15 = clock();
	clock_t end15 = clock();
	clock_t begin16 = clock();
	clock_t end16 = clock();
	clock_t begin17 = clock();
	clock_t end17 = clock();
	clock_t begin18 = clock();
	clock_t end18 = clock();
	clock_t begin19 = clock();
	clock_t end19 = clock(); */
	if (timeron)
	{
		timer_start(5);
	}
	#pragma event compute_rhs#0 start
	
	struct timeval start_compute_rhs_0, end_compute_rhs_0;
	gettimeofday(&start_compute_rhs_0, NULL);
	
	#pragma loop name compute_rhs#0 
	for (k=0; k<=(grid_points[2]-1); k ++ )
	{
		#pragma loop name compute_rhs#0#0 
		for (j=0; j<=(grid_points[1]-1); j ++ )
		{
			#pragma loop name compute_rhs#0#0#0 
			for (i=0; i<=(grid_points[0]-1); i ++ )
			{
				rho_inv=(1.0/u[k][j][i][0]);
				rho_i[k][j][i]=rho_inv;
				us[k][j][i]=(u[k][j][i][1]*rho_inv);
				vs[k][j][i]=(u[k][j][i][2]*rho_inv);
				ws[k][j][i]=(u[k][j][i][3]*rho_inv);
				square[k][j][i]=((0.5*(((u[k][j][i][1]*u[k][j][i][1])+(u[k][j][i][2]*u[k][j][i][2]))+(u[k][j][i][3]*u[k][j][i][3])))*rho_inv);
				qs[k][j][i]=(square[k][j][i]*rho_inv);
				aux=((c1c2*rho_inv)*(u[k][j][i][4]-square[k][j][i]));
				speed[k][j][i]=sqrt(aux);
			}
		}
	}
	#pragma event compute_rhs#0 stop
	
	gettimeofday(&end_compute_rhs_0, NULL);
	printf("Time compute_rhs_0 seconds %0.8f \n", time_diff(&start_compute_rhs_0, &end_compute_rhs_0));
	
/* 	time_spent15+=(((double)(end15-begin15))/((clock_t)1000)); */
	#pragma event compute_rhs#1 start
	
	struct timeval start_compute_rhs_1, end_compute_rhs_1;
	gettimeofday(&start_compute_rhs_1, NULL);
	
	#pragma loop name compute_rhs#1 
	for (k=0; k<=(grid_points[2]-1); k ++ )
	{
		#pragma loop name compute_rhs#1#0 
		for (j=0; j<=(grid_points[1]-1); j ++ )
		{
			#pragma loop name compute_rhs#1#0#0 
			for (i=0; i<=(grid_points[0]-1); i ++ )
			{
				#pragma loop name compute_rhs#1#0#0#0 
				for (m=0; m<5; m ++ )
				{
					rhs[k][j][i][m]=forcing[k][j][i][m];
				}
			}
		}
	}
	#pragma event compute_rhs#1 stop
	
	gettimeofday(&end_compute_rhs_1, NULL);
	printf("Time compute_rhs_1 seconds %0.8f \n", time_diff(&start_compute_rhs_1, &end_compute_rhs_1));
	
	/* time_spent16+=(((double)(end16-begin16))/((clock_t)1000)); */
	if (timeron)
	{
		timer_start(2);
	}
	#pragma event compute_rhs#2 start
	
	struct timeval start_compute_rhs_2, end_compute_rhs_2;
	gettimeofday(&start_compute_rhs_2, NULL);
	
	#pragma loop name compute_rhs#2 
	for (k=1; k<=nz2; k ++ )
	{
		#pragma loop name compute_rhs#2#0 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name compute_rhs#2#0#0 
			for (i=1; i<=nx2; i ++ )
			{
				uijk=us[k][j][i];
				up1=us[k][j][i+1];
				um1=us[k][j][i-1];
				rhs[k][j][i][0]=((rhs[k][j][i][0]+(dx1tx1*((u[k][j][i+1][0]-(2.0*u[k][j][i][0]))+u[k][j][i-1][0])))-(tx2*(u[k][j][i+1][1]-u[k][j][i-1][1])));
				rhs[k][j][i][1]=(((rhs[k][j][i][1]+(dx2tx1*((u[k][j][i+1][1]-(2.0*u[k][j][i][1]))+u[k][j][i-1][1])))+((xxcon2*con43)*((up1-(2.0*uijk))+um1)))-(tx2*(((u[k][j][i+1][1]*up1)-(u[k][j][i-1][1]*um1))+((((u[k][j][i+1][4]-square[k][j][i+1])-u[k][j][i-1][4])+square[k][j][i-1])*c2))));
				rhs[k][j][i][2]=(((rhs[k][j][i][2]+(dx3tx1*((u[k][j][i+1][2]-(2.0*u[k][j][i][2]))+u[k][j][i-1][2])))+(xxcon2*((vs[k][j][i+1]-(2.0*vs[k][j][i]))+vs[k][j][i-1])))-(tx2*((u[k][j][i+1][2]*up1)-(u[k][j][i-1][2]*um1))));
				rhs[k][j][i][3]=(((rhs[k][j][i][3]+(dx4tx1*((u[k][j][i+1][3]-(2.0*u[k][j][i][3]))+u[k][j][i-1][3])))+(xxcon2*((ws[k][j][i+1]-(2.0*ws[k][j][i]))+ws[k][j][i-1])))-(tx2*((u[k][j][i+1][3]*up1)-(u[k][j][i-1][3]*um1))));
				rhs[k][j][i][4]=(((((rhs[k][j][i][4]+(dx5tx1*((u[k][j][i+1][4]-(2.0*u[k][j][i][4]))+u[k][j][i-1][4])))+(xxcon3*((qs[k][j][i+1]-(2.0*qs[k][j][i]))+qs[k][j][i-1])))+(xxcon4*(((up1*up1)-((2.0*uijk)*uijk))+(um1*um1))))+(xxcon5*(((u[k][j][i+1][4]*rho_i[k][j][i+1])-((2.0*u[k][j][i][4])*rho_i[k][j][i]))+(u[k][j][i-1][4]*rho_i[k][j][i-1]))))-(tx2*((((c1*u[k][j][i+1][4])-(c2*square[k][j][i+1]))*up1)-(((c1*u[k][j][i-1][4])-(c2*square[k][j][i-1]))*um1))));
			}
		}
		#pragma loop name compute_rhs#2#1 
		for (j=1; j<=ny2; j ++ )
		{
			i=1;
			#pragma loop name compute_rhs#2#1#0 
			for (m=0; m<5; m ++ )
			{
				rhs[k][j][i][m]=(rhs[k][j][i][m]-(dssp*(((5.0*u[k][j][i][m])-(4.0*u[k][j][i+1][m]))+u[k][j][i+2][m])));
			}
			i=2;
			#pragma loop name compute_rhs#2#1#1 
			for (m=0; m<5; m ++ )
			{
				rhs[k][j][i][m]=(rhs[k][j][i][m]-(dssp*((((( - 4.0)*u[k][j][i-1][m])+(6.0*u[k][j][i][m]))-(4.0*u[k][j][i+1][m]))+u[k][j][i+2][m])));
			}
		}
		#pragma loop name compute_rhs#2#2 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name compute_rhs#2#2#0 
			for (i=3; i<=(nx2-2); i ++ )
			{
				#pragma loop name compute_rhs#2#2#0#0 
				for (m=0; m<5; m ++ )
				{
					rhs[k][j][i][m]=(rhs[k][j][i][m]-(dssp*((((u[k][j][i-2][m]-(4.0*u[k][j][i-1][m]))+(6.0*u[k][j][i][m]))-(4.0*u[k][j][i+1][m]))+u[k][j][i+2][m])));
				}
			}
		}
		#pragma loop name compute_rhs#2#3 
		for (j=1; j<=ny2; j ++ )
		{
			i=(nx2-1);
			#pragma loop name compute_rhs#2#3#0 
			for (m=0; m<5; m ++ )
			{
				rhs[k][j][i][m]=(rhs[k][j][i][m]-(dssp*(((u[k][j][i-2][m]-(4.0*u[k][j][i-1][m]))+(6.0*u[k][j][i][m]))-(4.0*u[k][j][i+1][m]))));
			}
			i=nx2;
			#pragma loop name compute_rhs#2#3#1 
			for (m=0; m<5; m ++ )
			{
				rhs[k][j][i][m]=(rhs[k][j][i][m]-(dssp*((u[k][j][i-2][m]-(4.0*u[k][j][i-1][m]))+(5.0*u[k][j][i][m]))));
			}
		}
	}
	#pragma event compute_rhs#2 stop
	
	gettimeofday(&end_compute_rhs_2, NULL);
	printf("Time compute_rhs_2 seconds %0.8f \n", time_diff(&start_compute_rhs_2, &end_compute_rhs_2));
	
	/* time_spent17+=(((double)(end17-begin17))/((clock_t)1000)); */
	if (timeron)
	{
		timer_stop(2);
	}
	if (timeron)
	{
		timer_start(3);
	}
	#pragma event compute_rhs#3 start
	
	struct timeval start_compute_rhs_3, end_compute_rhs_3;
	gettimeofday(&start_compute_rhs_3, NULL);
	
	#pragma loop name compute_rhs#3 
	for (k=1; k<=nz2; k ++ )
	{
		#pragma loop name compute_rhs#3#0 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name compute_rhs#3#0#0 
			for (i=1; i<=nx2; i ++ )
			{
				vijk=vs[k][j][i];
				vp1=vs[k][j+1][i];
				vm1=vs[k][j-1][i];
				rhs[k][j][i][0]=((rhs[k][j][i][0]+(dy1ty1*((u[k][j+1][i][0]-(2.0*u[k][j][i][0]))+u[k][j-1][i][0])))-(ty2*(u[k][j+1][i][2]-u[k][j-1][i][2])));
				rhs[k][j][i][1]=(((rhs[k][j][i][1]+(dy2ty1*((u[k][j+1][i][1]-(2.0*u[k][j][i][1]))+u[k][j-1][i][1])))+(yycon2*((us[k][j+1][i]-(2.0*us[k][j][i]))+us[k][j-1][i])))-(ty2*((u[k][j+1][i][1]*vp1)-(u[k][j-1][i][1]*vm1))));
				rhs[k][j][i][2]=(((rhs[k][j][i][2]+(dy3ty1*((u[k][j+1][i][2]-(2.0*u[k][j][i][2]))+u[k][j-1][i][2])))+((yycon2*con43)*((vp1-(2.0*vijk))+vm1)))-(ty2*(((u[k][j+1][i][2]*vp1)-(u[k][j-1][i][2]*vm1))+((((u[k][j+1][i][4]-square[k][j+1][i])-u[k][j-1][i][4])+square[k][j-1][i])*c2))));
				rhs[k][j][i][3]=(((rhs[k][j][i][3]+(dy4ty1*((u[k][j+1][i][3]-(2.0*u[k][j][i][3]))+u[k][j-1][i][3])))+(yycon2*((ws[k][j+1][i]-(2.0*ws[k][j][i]))+ws[k][j-1][i])))-(ty2*((u[k][j+1][i][3]*vp1)-(u[k][j-1][i][3]*vm1))));
				rhs[k][j][i][4]=(((((rhs[k][j][i][4]+(dy5ty1*((u[k][j+1][i][4]-(2.0*u[k][j][i][4]))+u[k][j-1][i][4])))+(yycon3*((qs[k][j+1][i]-(2.0*qs[k][j][i]))+qs[k][j-1][i])))+(yycon4*(((vp1*vp1)-((2.0*vijk)*vijk))+(vm1*vm1))))+(yycon5*(((u[k][j+1][i][4]*rho_i[k][j+1][i])-((2.0*u[k][j][i][4])*rho_i[k][j][i]))+(u[k][j-1][i][4]*rho_i[k][j-1][i]))))-(ty2*((((c1*u[k][j+1][i][4])-(c2*square[k][j+1][i]))*vp1)-(((c1*u[k][j-1][i][4])-(c2*square[k][j-1][i]))*vm1))));
			}
		}
		j=1;
		#pragma loop name compute_rhs#3#1 
		for (i=1; i<=nx2; i ++ )
		{
			#pragma loop name compute_rhs#3#1#0 
			for (m=0; m<5; m ++ )
			{
				rhs[k][j][i][m]=(rhs[k][j][i][m]-(dssp*(((5.0*u[k][j][i][m])-(4.0*u[k][j+1][i][m]))+u[k][j+2][i][m])));
			}
		}
		j=2;
		#pragma loop name compute_rhs#3#2 
		for (i=1; i<=nx2; i ++ )
		{
			#pragma loop name compute_rhs#3#2#0 
			for (m=0; m<5; m ++ )
			{
				rhs[k][j][i][m]=(rhs[k][j][i][m]-(dssp*((((( - 4.0)*u[k][j-1][i][m])+(6.0*u[k][j][i][m]))-(4.0*u[k][j+1][i][m]))+u[k][j+2][i][m])));
			}
		}
		#pragma loop name compute_rhs#3#3 
		for (j=3; j<=(ny2-2); j ++ )
		{
			#pragma loop name compute_rhs#3#3#0 
			for (i=1; i<=nx2; i ++ )
			{
				#pragma loop name compute_rhs#3#3#0#0 
				for (m=0; m<5; m ++ )
				{
					rhs[k][j][i][m]=(rhs[k][j][i][m]-(dssp*((((u[k][j-2][i][m]-(4.0*u[k][j-1][i][m]))+(6.0*u[k][j][i][m]))-(4.0*u[k][j+1][i][m]))+u[k][j+2][i][m])));
				}
			}
		}
		j=(ny2-1);
		#pragma loop name compute_rhs#3#4 
		for (i=1; i<=nx2; i ++ )
		{
			#pragma loop name compute_rhs#3#4#0 
			for (m=0; m<5; m ++ )
			{
				rhs[k][j][i][m]=(rhs[k][j][i][m]-(dssp*(((u[k][j-2][i][m]-(4.0*u[k][j-1][i][m]))+(6.0*u[k][j][i][m]))-(4.0*u[k][j+1][i][m]))));
			}
		}
		j=ny2;
		#pragma loop name compute_rhs#3#5 
		for (i=1; i<=nx2; i ++ )
		{
			#pragma loop name compute_rhs#3#5#0 
			for (m=0; m<5; m ++ )
			{
				rhs[k][j][i][m]=(rhs[k][j][i][m]-(dssp*((u[k][j-2][i][m]-(4.0*u[k][j-1][i][m]))+(5.0*u[k][j][i][m]))));
			}
		}
	}
	#pragma event compute_rhs#3 stop
	
	gettimeofday(&end_compute_rhs_3, NULL);
	printf("Time compute_rhs_3 seconds %0.8f \n", time_diff(&start_compute_rhs_3, &end_compute_rhs_3));
	
/* 	time_spent18+=(((double)(end18-begin18))/((clock_t)1000)); */
	if (timeron)
	{
		timer_stop(3);
	}
	if (timeron)
	{
		timer_start(4);
	}
	#pragma event compute_rhs#4 start
	
	struct timeval start_compute_rhs_4, end_compute_rhs_4;
	gettimeofday(&start_compute_rhs_4, NULL);
	
	#pragma loop name compute_rhs#4 
	for (k=1; k<=nz2; k ++ )
	{
		#pragma loop name compute_rhs#4#0 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name compute_rhs#4#0#0 
			for (i=1; i<=nx2; i ++ )
			{
				wijk=ws[k][j][i];
				wp1=ws[k+1][j][i];
				wm1=ws[k-1][j][i];
				rhs[k][j][i][0]=((rhs[k][j][i][0]+(dz1tz1*((u[k+1][j][i][0]-(2.0*u[k][j][i][0]))+u[k-1][j][i][0])))-(tz2*(u[k+1][j][i][3]-u[k-1][j][i][3])));
				rhs[k][j][i][1]=(((rhs[k][j][i][1]+(dz2tz1*((u[k+1][j][i][1]-(2.0*u[k][j][i][1]))+u[k-1][j][i][1])))+(zzcon2*((us[k+1][j][i]-(2.0*us[k][j][i]))+us[k-1][j][i])))-(tz2*((u[k+1][j][i][1]*wp1)-(u[k-1][j][i][1]*wm1))));
				rhs[k][j][i][2]=(((rhs[k][j][i][2]+(dz3tz1*((u[k+1][j][i][2]-(2.0*u[k][j][i][2]))+u[k-1][j][i][2])))+(zzcon2*((vs[k+1][j][i]-(2.0*vs[k][j][i]))+vs[k-1][j][i])))-(tz2*((u[k+1][j][i][2]*wp1)-(u[k-1][j][i][2]*wm1))));
				rhs[k][j][i][3]=(((rhs[k][j][i][3]+(dz4tz1*((u[k+1][j][i][3]-(2.0*u[k][j][i][3]))+u[k-1][j][i][3])))+((zzcon2*con43)*((wp1-(2.0*wijk))+wm1)))-(tz2*(((u[k+1][j][i][3]*wp1)-(u[k-1][j][i][3]*wm1))+((((u[k+1][j][i][4]-square[k+1][j][i])-u[k-1][j][i][4])+square[k-1][j][i])*c2))));
				rhs[k][j][i][4]=(((((rhs[k][j][i][4]+(dz5tz1*((u[k+1][j][i][4]-(2.0*u[k][j][i][4]))+u[k-1][j][i][4])))+(zzcon3*((qs[k+1][j][i]-(2.0*qs[k][j][i]))+qs[k-1][j][i])))+(zzcon4*(((wp1*wp1)-((2.0*wijk)*wijk))+(wm1*wm1))))+(zzcon5*(((u[k+1][j][i][4]*rho_i[k+1][j][i])-((2.0*u[k][j][i][4])*rho_i[k][j][i]))+(u[k-1][j][i][4]*rho_i[k-1][j][i]))))-(tz2*((((c1*u[k+1][j][i][4])-(c2*square[k+1][j][i]))*wp1)-(((c1*u[k-1][j][i][4])-(c2*square[k-1][j][i]))*wm1))));
			}
		}
	}
	#pragma event compute_rhs#4 stop
	
	gettimeofday(&end_compute_rhs_4, NULL);
	printf("Time compute_rhs_4 seconds %0.8f \n", time_diff(&start_compute_rhs_4, &end_compute_rhs_4));
	
/* 	time_spent19+=(((double)(end19-begin19))/((clock_t)1000)); */
	k=1;
	#pragma event compute_rhs#5 start
	
	struct timeval start_compute_rhs_5, end_compute_rhs_5;
	gettimeofday(&start_compute_rhs_5, NULL);
	
	#pragma loop name compute_rhs#5 
	for (j=1; j<=ny2; j ++ )
	{
		#pragma loop name compute_rhs#5#0 
		for (i=1; i<=nx2; i ++ )
		{
			#pragma loop name compute_rhs#5#0#0 
			for (m=0; m<5; m ++ )
			{
				rhs[k][j][i][m]=(rhs[k][j][i][m]-(dssp*(((5.0*u[k][j][i][m])-(4.0*u[k+1][j][i][m]))+u[k+2][j][i][m])));
			}
		}
	}
	#pragma event compute_rhs#5 stop
	
	gettimeofday(&end_compute_rhs_5, NULL);
	printf("Time compute_rhs_5 seconds %0.8f \n", time_diff(&start_compute_rhs_5, &end_compute_rhs_5));
	
	k=2;
	#pragma event compute_rhs#6 start
	
	struct timeval start_compute_rhs_6, end_compute_rhs_6;
	gettimeofday(&start_compute_rhs_6, NULL);
	
	#pragma loop name compute_rhs#6 
	for (j=1; j<=ny2; j ++ )
	{
		#pragma loop name compute_rhs#6#0 
		for (i=1; i<=nx2; i ++ )
		{
			#pragma loop name compute_rhs#6#0#0 
			for (m=0; m<5; m ++ )
			{
				rhs[k][j][i][m]=(rhs[k][j][i][m]-(dssp*((((( - 4.0)*u[k-1][j][i][m])+(6.0*u[k][j][i][m]))-(4.0*u[k+1][j][i][m]))+u[k+2][j][i][m])));
			}
		}
	}
	#pragma event compute_rhs#6 stop
	
	gettimeofday(&end_compute_rhs_6, NULL);
	printf("Time compute_rhs_6 seconds %0.8f \n", time_diff(&start_compute_rhs_6, &end_compute_rhs_6));
	
	#pragma event compute_rhs#7 start
	
	struct timeval start_compute_rhs_7, end_compute_rhs_7;
	gettimeofday(&start_compute_rhs_7, NULL);
	
	#pragma loop name compute_rhs#7 
	for (k=3; k<=(nz2-2); k ++ )
	{
		#pragma loop name compute_rhs#7#0 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name compute_rhs#7#0#0 
			for (i=1; i<=nx2; i ++ )
			{
				#pragma loop name compute_rhs#7#0#0#0 
				for (m=0; m<5; m ++ )
				{
					rhs[k][j][i][m]=(rhs[k][j][i][m]-(dssp*((((u[k-2][j][i][m]-(4.0*u[k-1][j][i][m]))+(6.0*u[k][j][i][m]))-(4.0*u[k+1][j][i][m]))+u[k+2][j][i][m])));
				}
			}
		}
	}
	#pragma event compute_rhs#7 stop
	
	gettimeofday(&end_compute_rhs_7, NULL);
	printf("Time compute_rhs_7 seconds %0.8f \n", time_diff(&start_compute_rhs_7, &end_compute_rhs_7));
	
	k=(nz2-1);
	#pragma event compute_rhs#8 start
	
	struct timeval start_compute_rhs_8, end_compute_rhs_8;
	gettimeofday(&start_compute_rhs_8, NULL);
	
	#pragma loop name compute_rhs#8 
	for (j=1; j<=ny2; j ++ )
	{
		#pragma loop name compute_rhs#8#0 
		for (i=1; i<=nx2; i ++ )
		{
			#pragma loop name compute_rhs#8#0#0 
			for (m=0; m<5; m ++ )
			{
				rhs[k][j][i][m]=(rhs[k][j][i][m]-(dssp*(((u[k-2][j][i][m]-(4.0*u[k-1][j][i][m]))+(6.0*u[k][j][i][m]))-(4.0*u[k+1][j][i][m]))));
			}
		}
	}
	#pragma event compute_rhs#8 stop
	
	gettimeofday(&end_compute_rhs_8, NULL);
	printf("Time compute_rhs_8 seconds %0.8f \n", time_diff(&start_compute_rhs_8, &end_compute_rhs_8));
	
	k=nz2;
	#pragma event compute_rhs#9 start
	
	struct timeval start_compute_rhs_9, end_compute_rhs_9;
	gettimeofday(&start_compute_rhs_9, NULL);
	
	#pragma loop name compute_rhs#9 
	for (j=1; j<=ny2; j ++ )
	{
		#pragma loop name compute_rhs#9#0 
		for (i=1; i<=nx2; i ++ )
		{
			#pragma loop name compute_rhs#9#0#0 
			for (m=0; m<5; m ++ )
			{
				rhs[k][j][i][m]=(rhs[k][j][i][m]-(dssp*((u[k-2][j][i][m]-(4.0*u[k-1][j][i][m]))+(5.0*u[k][j][i][m]))));
			}
		}
	}
	#pragma event compute_rhs#9 stop
	
	gettimeofday(&end_compute_rhs_9, NULL);
	printf("Time compute_rhs_9 seconds %0.8f \n", time_diff(&start_compute_rhs_9, &end_compute_rhs_9));
	
	if (timeron)
	{
		timer_stop(4);
	}
	#pragma event compute_rhs#10 start
	
	struct timeval start_compute_rhs_10, end_compute_rhs_10;
	gettimeofday(&start_compute_rhs_10, NULL);
	
	#pragma loop name compute_rhs#10 
	for (k=1; k<=nz2; k ++ )
	{
		#pragma loop name compute_rhs#10#0 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name compute_rhs#10#0#0 
			for (i=1; i<=nx2; i ++ )
			{
				#pragma loop name compute_rhs#10#0#0#0 
				for (m=0; m<5; m ++ )
				{
					rhs[k][j][i][m]=(rhs[k][j][i][m]*dt);
				}
			}
		}
	}
	#pragma event compute_rhs#10 stop
	
	gettimeofday(&end_compute_rhs_10, NULL);
	printf("Time compute_rhs_10 seconds %0.8f \n", time_diff(&start_compute_rhs_10, &end_compute_rhs_10));
	
	if (timeron)
	{
		timer_stop(5);
	}
}
