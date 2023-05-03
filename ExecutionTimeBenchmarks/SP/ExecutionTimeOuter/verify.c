#ifdef CETUS_TIMING
typedef struct cetusprofile cetusprofile;
extern cetusprofile cetus_prof;
void cetus_tic(cetusprofile *, int);
void cetus_toc(cetusprofile *, int);
#endif /* CETUS_TIMING */


#include <stdio.h>

#include <math.h>

#include "header.h"
#include <sys/time.h>
#include "time_diff.h"
void verify(int no_time_steps, char * Class, logical * verified)
{
	double xcrref[5], xceref[5], xcrdif[5], xcedif[5];
	double epsilon, xce[5], xcr[5], dtref = 0.0;
	int m;
	epsilon=1.0E-8;
	error_norm(xce);
	compute_rhs();
	rhs_norm(xcr);
	#pragma event verify#0 start
	
	struct timeval start_verify_0, end_verify_0;
	gettimeofday(&start_verify_0, NULL);
	
	#pragma loop name verify#0 
	for (m=0; m<5; m ++ )
	{
		xcr[m]=(xcr[m]/dt);
	}
	#pragma event verify#0 stop
	
	gettimeofday(&end_verify_0, NULL);
	printf("Time verify_0 seconds %0.8f \n", time_diff(&start_verify_0, &end_verify_0));
	
	( * Class)='U';
	( * verified)=true;
	#pragma event verify#1 start
	
	struct timeval start_verify_1, end_verify_1;
	gettimeofday(&start_verify_1, NULL);
	
	#pragma loop name verify#1 
	for (m=0; m<5; m ++ )
	{
		xcrref[m]=1.0;
		xceref[m]=1.0;
	}
	#pragma event verify#1 stop
	
	gettimeofday(&end_verify_1, NULL);
	printf("Time verify_1 seconds %0.8f \n", time_diff(&start_verify_1, &end_verify_1));
	
	if ((((grid_points[0]==12)&&(grid_points[1]==12))&&(grid_points[2]==12))&&(no_time_steps==60))
	{
		( * Class)='S';
		dtref=0.01;
		xcrref[0]=0.17034283709541312;
		xcrref[1]=0.012975252070034096;
		xcrref[2]=0.032527926989486054;
		xcrref[3]=0.0264364212751668;
		xcrref[4]=0.1921178413174443;
		xceref[0]=4.997691334581158E-4;
		xceref[1]=4.519566678296193E-5;
		xceref[2]=7.397376517292135E-5;
		xceref[3]=7.382123863243973E-5;
		xceref[4]=8.926963098749145E-4;
	}
	else
	{
		if ((((grid_points[0]==24)&&(grid_points[1]==24))&&(grid_points[2]==24))&&(no_time_steps==200))
		{
			( * Class)='W';
			dtref=8.0E-4;
			xcrref[0]=112.5590409344;
			xcrref[1]=11.80007595731;
			xcrref[2]=27.10329767846;
			xcrref[3]=24.69174937669;
			xcrref[4]=263.8427874317;
			xceref[0]=4.419655736008;
			xceref[1]=0.4638531260002;
			xceref[2]=1.011551749967;
			xceref[3]=0.9235878729944;
			xceref[4]=10.18045837718;
		}
		else
		{
			if ((((grid_points[0]==64)&&(grid_points[1]==64))&&(grid_points[2]==64))&&(no_time_steps==200))
			{
				( * Class)='A';
				dtref=8.0E-4;
				xcrref[0]=108.06346714637264;
				xcrref[1]=11.319730901220813;
				xcrref[2]=25.974354511582465;
				xcrref[3]=23.66562254467891;
				xcrref[4]=252.78963211748345;
				xceref[0]=4.2348416040525025;
				xceref[1]=0.443902824969957;
				xceref[2]=0.9669248013634565;
				xceref[3]=0.8830206303976548;
				xceref[4]=9.737990177082928;
			}
			else
			{
				if ((((grid_points[0]==102)&&(grid_points[1]==102))&&(grid_points[2]==102))&&(no_time_steps==200))
				{
					( * Class)='B';
					dtref=3.0E-4;
					xcrref[0]=1423.3597229287254;
					xcrref[1]=99.33052259015024;
					xcrref[2]=356.46025644535285;
					xcrref[3]=324.8544795908409;
					xcrref[4]=3270.7541254659363;
					xceref[0]=52.96984714093686;
					xceref[1]=4.463289611567067;
					xceref[2]=13.122573342210174;
					xceref[3]=12.006925323559145;
					xceref[4]=124.59576151035986;
				}
				else
				{
					if ((((grid_points[0]==162)&&(grid_points[1]==162))&&(grid_points[2]==162))&&(no_time_steps==200))
					{
						( * Class)='C';
						dtref=1.0E-4;
						xcrref[0]=6239.8116551764615;
						xcrref[1]=507.93239190423964;
						xcrref[2]=1542.3530093013596;
						xcrref[3]=1330.238792929119;
						xcrref[4]=11604.087428436455;
						xceref[0]=164.62008369091265;
						xceref[1]=11.497107903824313;
						xceref[2]=41.20744620746151;
						xceref[3]=37.08765105969417;
						xceref[4]=362.11053051841265;
					}
					else
					{
						if ((((grid_points[0]==408)&&(grid_points[1]==408))&&(grid_points[2]==408))&&(no_time_steps==250))
						{
							( * Class)='D';
							dtref=2.0E-5;
							xcrref[0]=25331.88551738;
							xcrref[1]=2346.39371698;
							xcrref[2]=6294.554366904;
							xcrref[3]=5352.56537603;
							xcrref[4]=39058.64038618;
							xceref[0]=310.0009377557;
							xceref[1]=24.24086324913;
							xceref[2]=77.82212022645;
							xceref[3]=68.35623860116;
							xceref[4]=606.5737200368;
						}
						else
						{
							if ((((grid_points[0]==1020)&&(grid_points[1]==1020))&&(grid_points[2]==1020))&&(no_time_steps==250))
							{
								( * Class)='E';
								dtref=4.0E-6;
								xcrref[0]=97953.72484517;
								xcrref[1]=9739.814511521;
								xcrref[2]=24676.06342965;
								xcrref[3]=20924.1957286;
								xcrref[4]=139213.8856939;
								xceref[0]=432.7562208414;
								xceref[1]=36.99051964887;
								xceref[2]=108.9845040954;
								xceref[3]=94.62517622043;
								xceref[4]=776.5512765309;
							}
							else
							{
								( * verified)=false;
							}
						}
					}
				}
			}
		}
	}
	#pragma event verify#2 start
	
	struct timeval start_verify_2, end_verify_2;
	gettimeofday(&start_verify_2, NULL);
	
	#pragma loop name verify#2 
	for (m=0; m<5; m ++ )
	{
		xcrdif[m]=fabs((xcr[m]-xcrref[m])/xcrref[m]);
		xcedif[m]=fabs((xce[m]-xceref[m])/xceref[m]);
	}
	#pragma event verify#2 stop
	
	gettimeofday(&end_verify_2, NULL);
	printf("Time verify_2 seconds %0.8f \n", time_diff(&start_verify_2, &end_verify_2));
	
	if (( * Class)!='U')
	{
		printf(" Verification being performed for class %c\n",  * Class);
		printf(" accuracy setting for epsilon = %20.13E\n", epsilon);
		( * verified)=(fabs(dt-dtref)<=epsilon);
		if ( ! ( * verified))
		{
			( * Class)='U';
			printf(" DT does not match the reference value of %15.8E\n", dtref);
		}
	}
	else
	{
		printf(" Unknown class\n");
	}
	if (( * Class)!='U')
	{
		printf(" Comparison of RMS-norms of residual\n");
	}
	else
	{
		printf(" RMS-norms of residual\n");
	}
	#pragma event verify#3 start
	
	struct timeval start_verify_3, end_verify_3;
	gettimeofday(&start_verify_3, NULL);
	
	#pragma loop name verify#3 
	for (m=0; m<5; m ++ )
	{
		if (( * Class)=='U')
		{
			printf("          %2d%20.13E\n", m+1, xcr[m]);
		}
		else
		{
			if (xcrdif[m]<=epsilon)
			{
				printf("          %2d%20.13E%20.13E%20.13E\n", m+1, xcr[m], xcrref[m], xcrdif[m]);
			}
			else
			{
				( * verified)=false;
				printf(" FAILURE: %2d%20.13E%20.13E%20.13E\n", m+1, xcr[m], xcrref[m], xcrdif[m]);
			}
		}
	}
	#pragma event verify#3 stop
	
	gettimeofday(&end_verify_3, NULL);
	printf("Time verify_3 seconds %0.8f \n", time_diff(&start_verify_3, &end_verify_3));
	
	if (( * Class)!='U')
	{
		printf(" Comparison of RMS-norms of solution error\n");
	}
	else
	{
		printf(" RMS-norms of solution error\n");
	}
	#pragma event verify#4 start
	
	struct timeval start_verify_4, end_verify_4;
	gettimeofday(&start_verify_4, NULL);
	
	#pragma loop name verify#4 
	for (m=0; m<5; m ++ )
	{
		if (( * Class)=='U')
		{
			printf("          %2d%20.13E\n", m+1, xce[m]);
		}
		else
		{
			if (xcedif[m]<=epsilon)
			{
				printf("          %2d%20.13E%20.13E%20.13E\n", m+1, xce[m], xceref[m], xcedif[m]);
			}
			else
			{
				( * verified)=false;
				printf(" FAILURE: %2d%20.13E%20.13E%20.13E\n", m+1, xce[m], xceref[m], xcedif[m]);
			}
		}
	}
	#pragma event verify#4 stop
	
	gettimeofday(&end_verify_4, NULL);
	printf("Time verify_4 seconds %0.8f \n", time_diff(&start_verify_4, &end_verify_4));
	
	if (( * Class)=='U')
	{
		printf(" No reference values provided\n");
		printf(" No verification performed\n");
	}
	else
	{
		if ( * verified)
		{
			printf(" Verification Successful\n");
		}
		else
		{
			printf(" Verification failed\n");
		}
	}
}
