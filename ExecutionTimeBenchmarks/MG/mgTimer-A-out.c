#include <stdio.h>

#include <stdlib.h>
#include <sys/time.h>
#include <math.h>

#include "globals.h"

#include "../common/randdp.h"

#include "../common/timers.h"

#include "../common/print_results.h"

static void setup(int * n1, int * n2, int * n3);
static void mg3P(double u[], double v[], double r[], double a[4], double c[4], int n1, int n2, int n3);
static void psinv(void * or, void * ou, int n1, int n2, int n3, double c[4], int k);
static void resid(void * ou, void * ov, void * or, int n1, int n2, int n3, double a[4], int k);
static void rprj3(void * or, int m1k, int m2k, int m3k, void * os, int m1j, int m2j, int m3j, int k);
static void interp(void * oz, int mm1, int mm2, int mm3, void * ou, int n1, int n2, int n3, int k);
static void norm2u3(void * or, int n1, int n2, int n3, double * rnm2, double * rnmu, int nx, int ny, int nz);
static void rep_nrm(void * u, int n1, int n2, int n3, char * title, int kk);
static void comm3(void * ou, int n1, int n2, int n3, int kk);
static void zran3(void * oz, int n1, int n2, int n3, int nx, int ny, int k);
static void showall(void * oz, int n1, int n2, int n3);
static double power(double a, int n);
static void bubble(double ten[][2], int j1[][2], int j2[][2], int j3[][2], int m, int ind);
static void zero3(void * oz, int n1, int n2, int n3);
static double u[NR];
static double v[NR];
static double r[NR];
static int is1, is2, is3, ie1, ie2, ie3;

float time_diff(struct timeval *start, struct timeval *end)
{
    return (end->tv_sec - start->tv_sec) + 1e-6*(end->tv_usec - start->tv_usec);
}

int main()
{
	int k, it;
	double t, tinit, mflops;
	double a[4], c[4];
	double rnm2, rnmu, old2, oldu, epsilon;
	int n1, n2, n3, nit;
	double nn, verify_value, err;
	logical verified;
	int i;
	char * t_names[3];
	double tmax;
	FILE * fp;
	#pragma event main#0 start
	
	struct timeval start_main_0, end_main_0;
	gettimeofday(&start_main_0, NULL);
	
	#pragma loop name main#0 
	for (i=0; i<3; i ++ )
	{
		timer_clear(i);
	}
	#pragma event main#0 stop
	
	gettimeofday(&end_main_0, NULL);
	printf("Time main_0 seconds %0.8f \n", time_diff(&start_main_0, &end_main_0));
	
	timer_start(0);
	if ((fp=fopen("timer.flag", "r"))!=((void * )0))
	{
		timeron=true;
		t_names[0]="init";
		t_names[1]="benchmk";
		t_names[T_mg3P]="mg3P";
		t_names[T_psinv]="psinv";
		t_names[T_resid]="resid";
		t_names[T_rprj3]="rprj3";
		t_names[T_interp]="interp";
		t_names[T_norm2]="norm2";
		t_names[T_comm3]="comm3";
		fclose(fp);
	}
	else
	{
		timeron=false;
	}
	if ((fp=fopen("mg.input", "r"))!=((void * )0))
	{
		int result;
		result=fscanf(fp, "%d\n",  & lt);
		while (fgetc(fp)!='\n')
		{
			;
		}
		result=fscanf(fp, "%d%d%d",  & nx[lt],  & ny[lt],  & nz[lt]);
		while (fgetc(fp)!='\n')
		{
			;
		}
		result=fscanf(fp, "%d",  & nit);
		while (fgetc(fp)!='\n')
		{
			;
		}
		#pragma event main#1 start
		
		struct timeval start_main_1, end_main_1;
		gettimeofday(&start_main_1, NULL);
		
		#pragma loop name main#1 
		for (i=0; i<=7; i ++ )
		{
			result=fscanf(fp, "%d",  & debug_vec[i]);
		}
		#pragma event main#1 stop
		
		gettimeofday(&end_main_1, NULL);
		printf("Time main_1 seconds %0.8f \n", time_diff(&start_main_1, &end_main_1));
		
		fclose(fp);
	}
	else
	{
		lt=8;
		nit=4;
		nx[lt]=256;
		ny[lt]=256;
		nz[lt]=256;
		#pragma event main#2 start
		
		struct timeval start_main_2, end_main_2;
		gettimeofday(&start_main_2, NULL);
		
		#pragma loop name main#2 
		for (i=0; i<=7; i ++ )
		{
			debug_vec[i]=0;
		}
		#pragma event main#2 stop
		
		gettimeofday(&end_main_2, NULL);
		printf("Time main_2 seconds %0.8f \n", time_diff(&start_main_2, &end_main_2));
		
	}
	if ((nx[lt]!=ny[lt])||(nx[lt]!=nz[lt]))
	{
		Class='U';
	}
	else
	{
		if ((nx[lt]==32)&&(nit==4))
		{
			Class='S';
		}
		else
		{
			if ((nx[lt]==128)&&(nit==4))
			{
				Class='W';
			}
			else
			{
				if ((nx[lt]==256)&&(nit==4))
				{
					Class='A';
				}
				else
				{
					if ((nx[lt]==256)&&(nit==20))
					{
						Class='B';
					}
					else
					{
						if ((nx[lt]==512)&&(nit==20))
						{
							Class='C';
						}
						else
						{
							if ((nx[lt]==1024)&&(nit==50))
							{
								Class='D';
							}
							else
							{
								if ((nx[lt]==2048)&&(nit==50))
								{
									Class='E';
								}
								else
								{
									Class='U';
								}
							}
						}
					}
				}
			}
		}
	}
	a[0]=(( - 8.0)/3.0);
	a[1]=0.0;
	a[2]=(1.0/6.0);
	a[3]=(1.0/12.0);
	if (((Class=='A')||(Class=='S'))||(Class=='W'))
	{
		c[0]=(( - 3.0)/8.0);
		c[1]=(( + 1.0)/32.0);
		c[2]=(( - 1.0)/64.0);
		c[3]=0.0;
	}
	else
	{
		c[0]=(( - 3.0)/17.0);
		c[1]=(( + 1.0)/33.0);
		c[2]=(( - 1.0)/61.0);
		c[3]=0.0;
	}
	lb=1;
	k=lt;
	setup( & n1,  & n2,  & n3);
	zero3(u, n1, n2, n3);
	zran3(v, n1, n2, n3, nx[lt], ny[lt], k);
	norm2u3(v, n1, n2, n3,  & rnm2,  & rnmu, nx[lt], ny[lt], nz[lt]);
	resid(u, v, r, n1, n2, n3, a, k);
	norm2u3(r, n1, n2, n3,  & rnm2,  & rnmu, nx[lt], ny[lt], nz[lt]);
	old2=rnm2;
	oldu=rnmu;
	mg3P(u, v, r, a, c, n1, n2, n3);
	resid(u, v, r, n1, n2, n3, a, k);
	setup( & n1,  & n2,  & n3);
	zero3(u, n1, n2, n3);
	zran3(v, n1, n2, n3, nx[lt], ny[lt], k);
	timer_stop(0);
	tinit=timer_read(0);
	#pragma event main#3 start
	
	struct timeval start_main_3, end_main_3;
	gettimeofday(&start_main_3, NULL);
	
	#pragma loop name main#3 
	for (i=1; i<3; i ++ )
	{
		timer_clear(i);
	}
	#pragma event main#3 stop
	
	gettimeofday(&end_main_3, NULL);
	printf("Time main_3 seconds %0.8f \n", time_diff(&start_main_3, &end_main_3));
	
	timer_start(1);
	if (timeron)
	{
		timer_start(T_resid2);
	}
	resid(u, v, r, n1, n2, n3, a, k);
	if (timeron)
	{
		timer_stop(T_resid2);
	}
	norm2u3(r, n1, n2, n3,  & rnm2,  & rnmu, nx[lt], ny[lt], nz[lt]);
	old2=rnm2;
	oldu=rnmu;
	#pragma event main#4 start
	
	struct timeval start_main_4, end_main_4;
	gettimeofday(&start_main_4, NULL);
	
	#pragma loop name main#4 
	for (it=1; it<=nit; it ++ )
	{
		if (((it==1)||(it==nit))||((it%5)==0))
		{
			
		}
		if (timeron)
		{
			timer_start(T_mg3P);
		}
		mg3P(u, v, r, a, c, n1, n2, n3);
		if (timeron)
		{
			timer_stop(T_mg3P);
		}
		if (timeron)
		{
			timer_start(T_resid2);
		}
		resid(u, v, r, n1, n2, n3, a, k);
		if (timeron)
		{
			timer_stop(T_resid2);
		}
	}
	#pragma event main#4 stop
	
	gettimeofday(&end_main_4, NULL);
	printf("Time main_4 seconds %0.8f \n", time_diff(&start_main_4, &end_main_4));
	
	norm2u3(r, n1, n2, n3,  & rnm2,  & rnmu, nx[lt], ny[lt], nz[lt]);
	timer_stop(1);
	t=timer_read(1);
	verified=false;
	verify_value=0.0;
	epsilon=1.0E-8;
	if (Class!='U')
	{
		if (Class=='S')
		{
			verify_value=5.307707005734E-5;
		}
		else
		{
			if (Class=='W')
			{
				verify_value=6.467329375339E-6;
			}
			else
			{
				if (Class=='A')
				{
					verify_value=2.433365309069E-6;
				}
				else
				{
					if (Class=='B')
					{
						verify_value=1.800564401355E-6;
					}
					else
					{
						if (Class=='C')
						{
							verify_value=5.70673228574E-7;
						}
						else
						{
							if (Class=='D')
							{
								verify_value=1.58327506044E-10;
							}
							else
							{
								if (Class=='E')
								{
									verify_value=8.157592357404E-11;
								}
							}
						}
					}
				}
			}
		}
		err=(fabs(rnm2-verify_value)/verify_value);
		if (err<=epsilon)
		{
			verified=true;
		}
		else
		{
			verified=false;
		}
	}
	else
	{
		verified=false;
	}
	nn=(((1.0*nx[lt])*ny[lt])*nz[lt]);
	if (t!=0.0)
	{
		mflops=((((58.0*nit)*nn)*1.0E-6)/t);
	}
	else
	{
		mflops=0.0;
	}
	print_results("MG", Class, nx[lt], ny[lt], nz[lt], nit, t, mflops, "          floating point", verified, "3.3.1", "01 May 2023", "gcc", "$(CC)", "-lm", "-I../common", "-g -Wall -O3 -fopenmp -mcmodel=large", "-O3 -fopenmp -mcmodel=large", "randdp");
	if (timeron)
	{
		tmax=timer_read(1);
		if (tmax==0.0)
		{
			tmax=1.0;
		}
		#pragma event main#5 start
		
		struct timeval start_main_5, end_main_5;
		gettimeofday(&start_main_5, NULL);
		
		#pragma loop name main#5 
		for (i=1; i<3; i ++ )
		{
			t=timer_read(i);
			if (i==T_resid2)
			{
				t=(timer_read(T_resid)-t);
			}
			else
			{
				
			}
		}
		#pragma event main#5 stop
		
		gettimeofday(&end_main_5, NULL);
		printf("Time main_5 seconds %0.8f \n", time_diff(&start_main_5, &end_main_5));
		
	}
	return 0;
}

static void setup(int * n1, int * n2, int * n3)
{
	int k, j;
	int ax, mi[(MAXLEVEL+1)][3];
	int ng[(MAXLEVEL+1)][3];
	ng[lt][0]=nx[lt];
	ng[lt][1]=ny[lt];
	ng[lt][2]=nz[lt];
	#pragma event setup#0 start
	
	struct timeval start_setup_0, end_setup_0;
	gettimeofday(&start_setup_0, NULL);
	
	#pragma loop name setup#0 
	for (k=(lt-1); k>=1; k -- )
	{
		#pragma loop name setup#0#0 
		for (ax=0; ax<3; ax ++ )
		{
			ng[k][ax]=(ng[k+1][ax]/2);
		}
	}
	#pragma event setup#0 stop
	
	gettimeofday(&end_setup_0, NULL);
	printf("Time setup_0 seconds %0.8f \n", time_diff(&start_setup_0, &end_setup_0));
	
	#pragma event setup#1 start
	
	struct timeval start_setup_1, end_setup_1;
	gettimeofday(&start_setup_1, NULL);
	
	#pragma loop name setup#1 
	for (k=lt; k>=1; k -- )
	{
		nx[k]=ng[k][0];
		ny[k]=ng[k][1];
		nz[k]=ng[k][2];
	}
	#pragma event setup#1 stop
	
	gettimeofday(&end_setup_1, NULL);
	printf("Time setup_1 seconds %0.8f \n", time_diff(&start_setup_1, &end_setup_1));
	
	#pragma event setup#2 start
	
	struct timeval start_setup_2, end_setup_2;
	gettimeofday(&start_setup_2, NULL);
	
	#pragma loop name setup#2 
	for (k=lt; k>=1; k -- )
	{
		#pragma loop name setup#2#0 
		for (ax=0; ax<3; ax ++ )
		{
			mi[k][ax]=(2+ng[k][ax]);
		}
		m1[k]=mi[k][0];
		m2[k]=mi[k][1];
		m3[k]=mi[k][2];
	}
	#pragma event setup#2 stop
	
	gettimeofday(&end_setup_2, NULL);
	printf("Time setup_2 seconds %0.8f \n", time_diff(&start_setup_2, &end_setup_2));
	
	k=lt;
	is1=((2+ng[k][0])-ng[lt][0]);
	ie1=(1+ng[k][0]);
	( * n1)=((3+ie1)-is1);
	is2=((2+ng[k][1])-ng[lt][1]);
	ie2=(1+ng[k][1]);
	( * n2)=((3+ie2)-is2);
	is3=((2+ng[k][2])-ng[lt][2]);
	ie3=(1+ng[k][2]);
	( * n3)=((3+ie3)-is3);
	ir[lt]=0;
	#pragma event setup#3 start
	
	struct timeval start_setup_3, end_setup_3;
	gettimeofday(&start_setup_3, NULL);
	
	#pragma loop name setup#3 
	for (j=(lt-1); j>=1; j -- )
	{
		ir[j]=(ir[j+1]+(((1*m1[j+1])*m2[j+1])*m3[j+1]));
	}
	#pragma event setup#3 stop
	
	gettimeofday(&end_setup_3, NULL);
	printf("Time setup_3 seconds %0.8f \n", time_diff(&start_setup_3, &end_setup_3));
	
	if (debug_vec[1]>=1)
	{
		
	}
}

static void mg3P(double u[], double v[], double r[], double a[4], double c[4], int n1, int n2, int n3)
{
	int j, k;
	#pragma event mg3P#0 start
	
	struct timeval start_mg3P_0, end_mg3P_0;
	gettimeofday(&start_mg3P_0, NULL);
	
	#pragma loop name mg3P#0 
	for (k=lt; k>=(lb+1); k -- )
	{
		j=(k-1);
		rprj3( & r[ir[k]], m1[k], m2[k], m3[k],  & r[ir[j]], m1[j], m2[j], m3[j], k);
	}
	#pragma event mg3P#0 stop
	
	gettimeofday(&end_mg3P_0, NULL);
	printf("Time mg3P_0 seconds %0.8f \n", time_diff(&start_mg3P_0, &end_mg3P_0));
	
	k=lb;
	zero3( & u[ir[k]], m1[k], m2[k], m3[k]);
	psinv( & r[ir[k]],  & u[ir[k]], m1[k], m2[k], m3[k], c, k);
	#pragma event mg3P#1 start
	
	struct timeval start_mg3P_1, end_mg3P_1;
	gettimeofday(&start_mg3P_1, NULL);
	
	#pragma loop name mg3P#1 
	for (k=(lb+1); k<=(lt-1); k ++ )
	{
		j=(k-1);
		zero3( & u[ir[k]], m1[k], m2[k], m3[k]);
		interp( & u[ir[j]], m1[j], m2[j], m3[j],  & u[ir[k]], m1[k], m2[k], m3[k], k);
		resid( & u[ir[k]],  & r[ir[k]],  & r[ir[k]], m1[k], m2[k], m3[k], a, k);
		psinv( & r[ir[k]],  & u[ir[k]], m1[k], m2[k], m3[k], c, k);
	}
	#pragma event mg3P#1 stop
	
	gettimeofday(&end_mg3P_1, NULL);
	printf("Time mg3P_1 seconds %0.8f \n", time_diff(&start_mg3P_1, &end_mg3P_1));
	
	j=(lt-1);
	k=lt;
	interp( & u[ir[j]], m1[j], m2[j], m3[j], u, n1, n2, n3, k);
	resid(u, v, r, n1, n2, n3, a, k);
	psinv(r, u, n1, n2, n3, c, k);
}

static void psinv(void * or, void * ou, int n1, int n2, int n3, double c[4], int k)
{
	double (* r)[n2][n1] = (double (* )[n2][n1])or;
	double (* u)[n2][n1] = (double (* )[n2][n1])ou;
	int i3, i2, i1;
	double r1[M], r2[M];
	if (timeron)
	{
		timer_start(T_psinv);
	}
	#pragma event psinv#0 start
	
	struct timeval start_psinv_0, end_psinv_0;
	gettimeofday(&start_psinv_0, NULL);
	
	#pragma loop name psinv#0 
	for (i3=1; i3<(n3-1); i3 ++ )
	{
		#pragma loop name psinv#0#0 
		for (i2=1; i2<(n2-1); i2 ++ )
		{
			#pragma loop name psinv#0#0#0 
			for (i1=0; i1<n1; i1 ++ )
			{
				r1[i1]=(((r[i3][i2-1][i1]+r[i3][i2+1][i1])+r[i3-1][i2][i1])+r[i3+1][i2][i1]);
				r2[i1]=(((r[i3-1][i2-1][i1]+r[i3-1][i2+1][i1])+r[i3+1][i2-1][i1])+r[i3+1][i2+1][i1]);
			}
			#pragma loop name psinv#0#0#1 
			for (i1=1; i1<(n1-1); i1 ++ )
			{
				u[i3][i2][i1]=(((u[i3][i2][i1]+(c[0]*r[i3][i2][i1]))+(c[1]*((r[i3][i2][i1-1]+r[i3][i2][i1+1])+r1[i1])))+(c[2]*((r2[i1]+r1[i1-1])+r1[i1+1])));
			}
		}
	}
	#pragma event psinv#0 stop
	
	gettimeofday(&end_psinv_0, NULL);
	printf("Time psinv_0 seconds %0.8f \n", time_diff(&start_psinv_0, &end_psinv_0));
	
	if (timeron)
	{
		timer_stop(T_psinv);
	}
	comm3(u, n1, n2, n3, k);
	if (debug_vec[0]>=1)
	{
		rep_nrm(u, n1, n2, n3, "   psinv", k);
	}
	if (debug_vec[3]>=k)
	{
		showall(u, n1, n2, n3);
	}
}

static void resid(void * ou, void * ov, void * or, int n1, int n2, int n3, double a[4], int k)
{
	double (* u)[n2][n1] = (double (* )[n2][n1])ou;
	double (* v)[n2][n1] = (double (* )[n2][n1])ov;
	double (* r)[n2][n1] = (double (* )[n2][n1])or;
	int i3, i2, i1;
	double u1[M], u2[M];
	if (timeron)
	{
		timer_start(T_resid);
	}
	#pragma event resid#0 start
	
	struct timeval start_resid_0, end_resid_0;
	gettimeofday(&start_resid_0, NULL);
	
	#pragma loop name resid#0 
	for (i3=1; i3<(n3-1); i3 ++ )
	{
		#pragma loop name resid#0#0 
		for (i2=1; i2<(n2-1); i2 ++ )
		{
			#pragma loop name resid#0#0#0 
			for (i1=0; i1<n1; i1 ++ )
			{
				u1[i1]=(((u[i3][i2-1][i1]+u[i3][i2+1][i1])+u[i3-1][i2][i1])+u[i3+1][i2][i1]);
				u2[i1]=(((u[i3-1][i2-1][i1]+u[i3-1][i2+1][i1])+u[i3+1][i2-1][i1])+u[i3+1][i2+1][i1]);
			}
			#pragma loop name resid#0#0#1 
			for (i1=1; i1<(n1-1); i1 ++ )
			{
				r[i3][i2][i1]=(((v[i3][i2][i1]-(a[0]*u[i3][i2][i1]))-(a[2]*((u2[i1]+u1[i1-1])+u1[i1+1])))-(a[3]*(u2[i1-1]+u2[i1+1])));
			}
		}
	}
	#pragma event resid#0 stop
	
	gettimeofday(&end_resid_0, NULL);
	printf("Time resid_0 seconds %0.8f \n", time_diff(&start_resid_0, &end_resid_0));
	
	if (timeron)
	{
		timer_stop(T_resid);
	}
	comm3(r, n1, n2, n3, k);
	if (debug_vec[0]>=1)
	{
		rep_nrm(r, n1, n2, n3, "   resid", k);
	}
	if (debug_vec[2]>=k)
	{
		showall(r, n1, n2, n3);
	}
}

static void rprj3(void * or, int m1k, int m2k, int m3k, void * os, int m1j, int m2j, int m3j, int k)
{
	double (* r)[m2k][m1k] = (double (* )[m2k][m1k])or;
	double (* s)[m2j][m1j] = (double (* )[m2j][m1j])os;
	int j3, j2, j1, i3, i2, i1, d1, d2, d3, j;
	double x1[M], y1[M], x2, y2;
	if (timeron)
	{
		timer_start(T_rprj3);
	}
	if (m1k==3)
	{
		d1=2;
	}
	else
	{
		d1=1;
	}
	if (m2k==3)
	{
		d2=2;
	}
	else
	{
		d2=1;
	}
	if (m3k==3)
	{
		d3=2;
	}
	else
	{
		d3=1;
	}
	#pragma event rprj3#0 start
	
	struct timeval start_rprj3_0, end_rprj3_0;
	gettimeofday(&start_rprj3_0, NULL);
	
	#pragma loop name rprj3#0 
	for (j3=1; j3<(m3j-1); j3 ++ )
	{
		i3=((2*j3)-d3);
		#pragma loop name rprj3#0#0 
		for (j2=1; j2<(m2j-1); j2 ++ )
		{
			i2=((2*j2)-d2);
			#pragma loop name rprj3#0#0#0 
			for (j1=1; j1<m1j; j1 ++ )
			{
				i1=((2*j1)-d1);
				x1[i1]=(((r[i3+1][i2][i1]+r[i3+1][i2+2][i1])+r[i3][i2+1][i1])+r[i3+2][i2+1][i1]);
				y1[i1]=(((r[i3][i2][i1]+r[i3+2][i2][i1])+r[i3][i2+2][i1])+r[i3+2][i2+2][i1]);
			}
			#pragma loop name rprj3#0#0#1 
			for (j1=1; j1<(m1j-1); j1 ++ )
			{
				i1=((2*j1)-d1);
				y2=(((r[i3][i2][i1+1]+r[i3+2][i2][i1+1])+r[i3][i2+2][i1+1])+r[i3+2][i2+2][i1+1]);
				x2=(((r[i3+1][i2][i1+1]+r[i3+1][i2+2][i1+1])+r[i3][i2+1][i1+1])+r[i3+2][i2+1][i1+1]);
				s[j3][j2][j1]=((((0.5*r[i3+1][i2+1][i1+1])+(0.25*((r[i3+1][i2+1][i1]+r[i3+1][i2+1][i1+2])+x2)))+(0.125*((x1[i1]+x1[i1+2])+y2)))+(0.0625*(y1[i1]+y1[i1+2])));
			}
		}
	}
	#pragma event rprj3#0 stop
	
	gettimeofday(&end_rprj3_0, NULL);
	printf("Time rprj3_0 seconds %0.8f \n", time_diff(&start_rprj3_0, &end_rprj3_0));
	
	if (timeron)
	{
		timer_stop(T_rprj3);
	}
	j=(k-1);
	comm3(s, m1j, m2j, m3j, j);
	if (debug_vec[0]>=1)
	{
		rep_nrm(s, m1j, m2j, m3j, "   rprj3", k-1);
	}
	if (debug_vec[4]>=k)
	{
		showall(s, m1j, m2j, m3j);
	}
}

static void interp(void * oz, int mm1, int mm2, int mm3, void * ou, int n1, int n2, int n3, int k)
{
	double (* z)[mm2][mm1] = (double (* )[mm2][mm1])oz;
	double (* u)[n2][n1] = (double (* )[n2][n1])ou;
	int i3, i2, i1, d1, d2, d3, t1, t2, t3;
	double z1[M], z2[M], z3[M];
	if (timeron)
	{
		timer_start(T_interp);
	}
	if (((n1!=3)&&(n2!=3))&&(n3!=3))
	{
		#pragma event interp#0 start
		
		struct timeval start_interp_0, end_interp_0;
		gettimeofday(&start_interp_0, NULL);
		
		#pragma loop name interp#0 
		for (i3=0; i3<(mm3-1); i3 ++ )
		{
			#pragma loop name interp#0#0 
			for (i2=0; i2<(mm2-1); i2 ++ )
			{
				#pragma loop name interp#0#0#0 
				for (i1=0; i1<mm1; i1 ++ )
				{
					z1[i1]=(z[i3][i2+1][i1]+z[i3][i2][i1]);
					z2[i1]=(z[i3+1][i2][i1]+z[i3][i2][i1]);
					z3[i1]=((z[i3+1][i2+1][i1]+z[i3+1][i2][i1])+z1[i1]);
				}
				#pragma loop name interp#0#0#1 
				for (i1=0; i1<(mm1-1); i1 ++ )
				{
					u[2*i3][2*i2][2*i1]=(u[2*i3][2*i2][2*i1]+z[i3][i2][i1]);
					u[2*i3][2*i2][(2*i1)+1]=(u[2*i3][2*i2][(2*i1)+1]+(0.5*(z[i3][i2][i1+1]+z[i3][i2][i1])));
				}
				#pragma loop name interp#0#0#2 
				for (i1=0; i1<(mm1-1); i1 ++ )
				{
					u[2*i3][(2*i2)+1][2*i1]=(u[2*i3][(2*i2)+1][2*i1]+(0.5*z1[i1]));
					u[2*i3][(2*i2)+1][(2*i1)+1]=(u[2*i3][(2*i2)+1][(2*i1)+1]+(0.25*(z1[i1]+z1[i1+1])));
				}
				#pragma loop name interp#0#0#3 
				for (i1=0; i1<(mm1-1); i1 ++ )
				{
					u[(2*i3)+1][2*i2][2*i1]=(u[(2*i3)+1][2*i2][2*i1]+(0.5*z2[i1]));
					u[(2*i3)+1][2*i2][(2*i1)+1]=(u[(2*i3)+1][2*i2][(2*i1)+1]+(0.25*(z2[i1]+z2[i1+1])));
				}
				#pragma loop name interp#0#0#4 
				for (i1=0; i1<(mm1-1); i1 ++ )
				{
					u[(2*i3)+1][(2*i2)+1][2*i1]=(u[(2*i3)+1][(2*i2)+1][2*i1]+(0.25*z3[i1]));
					u[(2*i3)+1][(2*i2)+1][(2*i1)+1]=(u[(2*i3)+1][(2*i2)+1][(2*i1)+1]+(0.125*(z3[i1]+z3[i1+1])));
				}
			}
		}
		#pragma event interp#0 stop
		
		gettimeofday(&end_interp_0, NULL);
		printf("Time interp_0 seconds %0.8f \n", time_diff(&start_interp_0, &end_interp_0));
		
	}
	else
	{
		if (n1==3)
		{
			d1=2;
			t1=1;
		}
		else
		{
			d1=1;
			t1=0;
		}
		if (n2==3)
		{
			d2=2;
			t2=1;
		}
		else
		{
			d2=1;
			t2=0;
		}
		if (n3==3)
		{
			d3=2;
			t3=1;
		}
		else
		{
			d3=1;
			t3=0;
		}
		#pragma event interp#1 start
		
		struct timeval start_interp_1, end_interp_1;
		gettimeofday(&start_interp_1, NULL);
		
		#pragma loop name interp#1 
		for (i3=d3; i3<=(mm3-1); i3 ++ )
		{
			#pragma loop name interp#1#0 
			for (i2=d2; i2<=(mm2-1); i2 ++ )
			{
				#pragma loop name interp#1#0#0 
				for (i1=d1; i1<=(mm1-1); i1 ++ )
				{
					u[((2*i3)-d3)-1][((2*i2)-d2)-1][((2*i1)-d1)-1]=(u[((2*i3)-d3)-1][((2*i2)-d2)-1][((2*i1)-d1)-1]+z[i3-1][i2-1][i1-1]);
				}
				#pragma loop name interp#1#0#1 
				for (i1=1; i1<=(mm1-1); i1 ++ )
				{
					u[((2*i3)-d3)-1][((2*i2)-d2)-1][((2*i1)-t1)-1]=(u[((2*i3)-d3)-1][((2*i2)-d2)-1][((2*i1)-t1)-1]+(0.5*(z[i3-1][i2-1][i1]+z[i3-1][i2-1][i1-1])));
				}
			}
			#pragma loop name interp#1#1 
			for (i2=1; i2<=(mm2-1); i2 ++ )
			{
				#pragma loop name interp#1#1#0 
				for (i1=d1; i1<=(mm1-1); i1 ++ )
				{
					u[((2*i3)-d3)-1][((2*i2)-t2)-1][((2*i1)-d1)-1]=(u[((2*i3)-d3)-1][((2*i2)-t2)-1][((2*i1)-d1)-1]+(0.5*(z[i3-1][i2][i1-1]+z[i3-1][i2-1][i1-1])));
				}
				#pragma loop name interp#1#1#1 
				for (i1=1; i1<=(mm1-1); i1 ++ )
				{
					u[((2*i3)-d3)-1][((2*i2)-t2)-1][((2*i1)-t1)-1]=(u[((2*i3)-d3)-1][((2*i2)-t2)-1][((2*i1)-t1)-1]+(0.25*(((z[i3-1][i2][i1]+z[i3-1][i2-1][i1])+z[i3-1][i2][i1-1])+z[i3-1][i2-1][i1-1])));
				}
			}
		}
		#pragma event interp#1 stop
		
		gettimeofday(&end_interp_1, NULL);
		printf("Time interp_1 seconds %0.8f \n", time_diff(&start_interp_1, &end_interp_1));
		
		#pragma event interp#2 start
		
		struct timeval start_interp_2, end_interp_2;
		gettimeofday(&start_interp_2, NULL);
		
		#pragma loop name interp#2 
		for (i3=1; i3<=(mm3-1); i3 ++ )
		{
			#pragma loop name interp#2#0 
			for (i2=d2; i2<=(mm2-1); i2 ++ )
			{
				#pragma loop name interp#2#0#0 
				for (i1=d1; i1<=(mm1-1); i1 ++ )
				{
					u[((2*i3)-t3)-1][((2*i2)-d2)-1][((2*i1)-d1)-1]=(u[((2*i3)-t3)-1][((2*i2)-d2)-1][((2*i1)-d1)-1]+(0.5*(z[i3][i2-1][i1-1]+z[i3-1][i2-1][i1-1])));
				}
				#pragma loop name interp#2#0#1 
				for (i1=1; i1<=(mm1-1); i1 ++ )
				{
					u[((2*i3)-t3)-1][((2*i2)-d2)-1][((2*i1)-t1)-1]=(u[((2*i3)-t3)-1][((2*i2)-d2)-1][((2*i1)-t1)-1]+(0.25*(((z[i3][i2-1][i1]+z[i3][i2-1][i1-1])+z[i3-1][i2-1][i1])+z[i3-1][i2-1][i1-1])));
				}
			}
			#pragma loop name interp#2#1 
			for (i2=1; i2<=(mm2-1); i2 ++ )
			{
				#pragma loop name interp#2#1#0 
				for (i1=d1; i1<=(mm1-1); i1 ++ )
				{
					u[((2*i3)-t3)-1][((2*i2)-t2)-1][((2*i1)-d1)-1]=(u[((2*i3)-t3)-1][((2*i2)-t2)-1][((2*i1)-d1)-1]+(0.25*(((z[i3][i2][i1-1]+z[i3][i2-1][i1-1])+z[i3-1][i2][i1-1])+z[i3-1][i2-1][i1-1])));
				}
				#pragma loop name interp#2#1#1 
				for (i1=1; i1<=(mm1-1); i1 ++ )
				{
					u[((2*i3)-t3)-1][((2*i2)-t2)-1][((2*i1)-t1)-1]=(u[((2*i3)-t3)-1][((2*i2)-t2)-1][((2*i1)-t1)-1]+(0.125*(((((((z[i3][i2][i1]+z[i3][i2-1][i1])+z[i3][i2][i1-1])+z[i3][i2-1][i1-1])+z[i3-1][i2][i1])+z[i3-1][i2-1][i1])+z[i3-1][i2][i1-1])+z[i3-1][i2-1][i1-1])));
				}
			}
		}
		#pragma event interp#2 stop
		
		gettimeofday(&end_interp_2, NULL);
		printf("Time interp_2 seconds %0.8f \n", time_diff(&start_interp_2, &end_interp_2));
		
	}
	if (timeron)
	{
		timer_stop(T_interp);
	}
	if (debug_vec[0]>=1)
	{
		rep_nrm(z, mm1, mm2, mm3, "z: inter", k-1);
		rep_nrm(u, n1, n2, n3, "u: inter", k);
	}
	if (debug_vec[5]>=k)
	{
		showall(z, mm1, mm2, mm3);
		showall(u, n1, n2, n3);
	}
}

static void norm2u3(void * or, int n1, int n2, int n3, double * rnm2, double * rnmu, int nx, int ny, int nz)
{
	double (* r)[n2][n1] = (double (* )[n2][n1])or;
	double s, a;
	int i3, i2, i1;
	double dn;
	if (timeron)
	{
		timer_start(T_norm2);
	}
	dn=(((1.0*nx)*ny)*nz);
	s=0.0;
	( * rnmu)=0.0;
	#pragma event norm2u3#0 start
	
	struct timeval start_norm2u3_0, end_norm2u3_0;
	gettimeofday(&start_norm2u3_0, NULL);
	
	#pragma loop name norm2u3#0 
	for (i3=1; i3<(n3-1); i3 ++ )
	{
		#pragma loop name norm2u3#0#0 
		for (i2=1; i2<(n2-1); i2 ++ )
		{
			#pragma loop name norm2u3#0#0#0 
			for (i1=1; i1<(n1-1); i1 ++ )
			{
				s=(s+pow(r[i3][i2][i1], 2.0));
				a=fabs(r[i3][i2][i1]);
				if (a>( * rnmu))
				{
					( * rnmu)=a;
				}
			}
		}
	}
	#pragma event norm2u3#0 stop
	
	gettimeofday(&end_norm2u3_0, NULL);
	printf("Time norm2u3_0 seconds %0.8f \n", time_diff(&start_norm2u3_0, &end_norm2u3_0));
	
	( * rnm2)=sqrt(s/dn);
	if (timeron)
	{
		timer_stop(T_norm2);
	}
}

static void rep_nrm(void * u, int n1, int n2, int n3, char * title, int kk)
{
	double rnm2, rnmu;
	norm2u3(u, n1, n2, n3,  & rnm2,  & rnmu, nx[kk], ny[kk], nz[kk]);
}

static void comm3(void * ou, int n1, int n2, int n3, int kk)
{
	double (* u)[n2][n1] = (double (* )[n2][n1])ou;
	int i1, i2, i3;
	if (timeron)
	{
		timer_start(T_comm3);
	}
	#pragma event comm3#0 start
	
	struct timeval start_comm3_0, end_comm3_0;
	gettimeofday(&start_comm3_0, NULL);
	
	#pragma loop name comm3#0 
	for (i3=1; i3<(n3-1); i3 ++ )
	{
		#pragma loop name comm3#0#0 
		for (i2=1; i2<(n2-1); i2 ++ )
		{
			u[i3][i2][0]=u[i3][i2][n1-2];
			u[i3][i2][n1-1]=u[i3][i2][1];
		}
	}
	#pragma event comm3#0 stop
	
	gettimeofday(&end_comm3_0, NULL);
	printf("Time comm3_0 seconds %0.8f \n", time_diff(&start_comm3_0, &end_comm3_0));
	
	#pragma event comm3#1 start
	
	struct timeval start_comm3_1, end_comm3_1;
	gettimeofday(&start_comm3_1, NULL);
	
	#pragma loop name comm3#1 
	for (i3=1; i3<(n3-1); i3 ++ )
	{
		#pragma loop name comm3#1#0 
		for (i1=0; i1<n1; i1 ++ )
		{
			u[i3][0][i1]=u[i3][n2-2][i1];
			u[i3][n2-1][i1]=u[i3][1][i1];
		}
	}
	#pragma event comm3#1 stop
	
	gettimeofday(&end_comm3_1, NULL);
	printf("Time comm3_1 seconds %0.8f \n", time_diff(&start_comm3_1, &end_comm3_1));
	
	#pragma event comm3#2 start
	
	struct timeval start_comm3_2, end_comm3_2;
	gettimeofday(&start_comm3_2, NULL);
	
	#pragma loop name comm3#2 
	for (i2=0; i2<n2; i2 ++ )
	{
		#pragma loop name comm3#2#0 
		for (i1=0; i1<n1; i1 ++ )
		{
			u[0][i2][i1]=u[n3-2][i2][i1];
			u[n3-1][i2][i1]=u[1][i2][i1];
		}
	}
	#pragma event comm3#2 stop
	
	gettimeofday(&end_comm3_2, NULL);
	printf("Time comm3_2 seconds %0.8f \n", time_diff(&start_comm3_2, &end_comm3_2));
	
	if (timeron)
	{
		timer_stop(T_comm3);
	}
}

static void zran3(void * oz, int n1, int n2, int n3, int nx, int ny, int k)
{
	double (* z)[n2][n1] = (double (* )[n2][n1])oz;
	int i0, m0, m1;
	int i1, i2, i3, d1, e1, e2, e3;
	double xx, x0, x1, a1, a2, ai;
	const int mm = 10;
	const double a = pow(5.0, 13.0);
	const double x = 3.14159265E8;
	double ten[mm][2], best;
	int i, j1[mm][2], j2[mm][2], j3[mm][2];
	int jg[4][mm][2];
	double rdummy;
	a1=power(a, nx);
	a2=power(a, nx*ny);
	zero3(z, n1, n2, n3);
	i=((is1-2)+(nx*((is2-2)+(ny*(is3-2)))));
	ai=power(a, i);
	d1=((ie1-is1)+1);
	e1=((ie1-is1)+2);
	e2=((ie2-is2)+2);
	e3=((ie3-is3)+2);
	x0=x;
	rdummy=randlc( & x0, ai);
	#pragma event zran3#0 start
	
	struct timeval start_zran3_0, end_zran3_0;
	gettimeofday(&start_zran3_0, NULL);
	
	#pragma loop name zran3#0 
	for (i3=1; i3<e3; i3 ++ )
	{
		x1=x0;
		#pragma loop name zran3#0#0 
		for (i2=1; i2<e2; i2 ++ )
		{
			xx=x1;
			vranlc(d1,  & xx, a,  & z[i3][i2][1]);
			rdummy=randlc( & x1, a1);
		}
		rdummy=randlc( & x0, a2);
	}
	#pragma event zran3#0 stop
	
	gettimeofday(&end_zran3_0, NULL);
	printf("Time zran3_0 seconds %0.8f \n", time_diff(&start_zran3_0, &end_zran3_0));
	
	#pragma event zran3#1 start
	
	struct timeval start_zran3_1, end_zran3_1;
	gettimeofday(&start_zran3_1, NULL);
	
	#pragma loop name zran3#1 
	for (i=0; i<mm; i ++ )
	{
		ten[i][1]=0.0;
		j1[i][1]=0;
		j2[i][1]=0;
		j3[i][1]=0;
		ten[i][0]=1.0;
		j1[i][0]=0;
		j2[i][0]=0;
		j3[i][0]=0;
	}
	#pragma event zran3#1 stop
	
	gettimeofday(&end_zran3_1, NULL);
	printf("Time zran3_1 seconds %0.8f \n", time_diff(&start_zran3_1, &end_zran3_1));
	
	#pragma event zran3#2 start
	
	struct timeval start_zran3_2, end_zran3_2;
	gettimeofday(&start_zran3_2, NULL);
	
	#pragma loop name zran3#2 
	for (i3=1; i3<(n3-1); i3 ++ )
	{
		#pragma loop name zran3#2#0 
		for (i2=1; i2<(n2-1); i2 ++ )
		{
			#pragma loop name zran3#2#0#0 
			for (i1=1; i1<(n1-1); i1 ++ )
			{
				if (z[i3][i2][i1]>ten[0][1])
				{
					ten[0][1]=z[i3][i2][i1];
					j1[0][1]=i1;
					j2[0][1]=i2;
					j3[0][1]=i3;
					bubble(ten, j1, j2, j3, mm, 1);
				}
				if (z[i3][i2][i1]<ten[0][0])
				{
					ten[0][0]=z[i3][i2][i1];
					j1[0][0]=i1;
					j2[0][0]=i2;
					j3[0][0]=i3;
					bubble(ten, j1, j2, j3, mm, 0);
				}
			}
		}
	}
	#pragma event zran3#2 stop
	
	gettimeofday(&end_zran3_2, NULL);
	printf("Time zran3_2 seconds %0.8f \n", time_diff(&start_zran3_2, &end_zran3_2));
	
	i1=(mm-1);
	i0=(mm-1);
	#pragma event zran3#3 start
	
	struct timeval start_zran3_3, end_zran3_3;
	gettimeofday(&start_zran3_3, NULL);
	
	#pragma loop name zran3#3 
	for (i=(mm-1); i>=0; i -- )
	{
		best=0.0;
		if (best<ten[i1][1])
		{
			jg[0][i][1]=0;
			jg[1][i][1]=((is1-2)+j1[i1][1]);
			jg[2][i][1]=((is2-2)+j2[i1][1]);
			jg[3][i][1]=((is3-2)+j3[i1][1]);
			i1=(i1-1);
		}
		else
		{
			jg[0][i][1]=0;
			jg[1][i][1]=0;
			jg[2][i][1]=0;
			jg[3][i][1]=0;
		}
		best=1.0;
		if (best>ten[i0][0])
		{
			jg[0][i][0]=0;
			jg[1][i][0]=((is1-2)+j1[i0][0]);
			jg[2][i][0]=((is2-2)+j2[i0][0]);
			jg[3][i][0]=((is3-2)+j3[i0][0]);
			i0=(i0-1);
		}
		else
		{
			jg[0][i][0]=0;
			jg[1][i][0]=0;
			jg[2][i][0]=0;
			jg[3][i][0]=0;
		}
	}
	#pragma event zran3#3 stop
	
	gettimeofday(&end_zran3_3, NULL);
	printf("Time zran3_3 seconds %0.8f \n", time_diff(&start_zran3_3, &end_zran3_3));
	
	m1=0;
	m0=0;
	#pragma event zran3#4 start
	
	struct timeval start_zran3_4, end_zran3_4;
	gettimeofday(&start_zran3_4, NULL);
	
	#pragma loop name zran3#4 
	for (i3=0; i3<n3; i3 ++ )
	{
		#pragma loop name zran3#4#0 
		for (i2=0; i2<n2; i2 ++ )
		{
			#pragma loop name zran3#4#0#0 
			for (i1=0; i1<n1; i1 ++ )
			{
				z[i3][i2][i1]=0.0;
			}
		}
	}
	#pragma event zran3#4 stop
	
	gettimeofday(&end_zran3_4, NULL);
	printf("Time zran3_4 seconds %0.8f \n", time_diff(&start_zran3_4, &end_zran3_4));
	
	#pragma event zran3#5 start
	
	struct timeval start_zran3_5, end_zran3_5;
	gettimeofday(&start_zran3_5, NULL);
	
	#pragma loop name zran3#5 
	for (i=(mm-1); i>=m0; i -- )
	{
		z[jg[3][i][0]][jg[2][i][0]][jg[1][i][0]]=( - 1.0);
	}
	#pragma event zran3#5 stop
	
	gettimeofday(&end_zran3_5, NULL);
	printf("Time zran3_5 seconds %0.8f \n", time_diff(&start_zran3_5, &end_zran3_5));
	
	#pragma event zran3#6 start
	
	struct timeval start_zran3_6, end_zran3_6;
	gettimeofday(&start_zran3_6, NULL);
	
	#pragma loop name zran3#6 
	for (i=(mm-1); i>=m1; i -- )
	{
		z[jg[3][i][1]][jg[2][i][1]][jg[1][i][1]]=( + 1.0);
	}
	#pragma event zran3#6 stop
	
	gettimeofday(&end_zran3_6, NULL);
	printf("Time zran3_6 seconds %0.8f \n", time_diff(&start_zran3_6, &end_zran3_6));
	
	comm3(z, n1, n2, n3, k);
}

static void showall(void * oz, int n1, int n2, int n3)
{
	double (* z)[n2][n1] = (double (* )[n2][n1])oz;
	int i1, i2, i3;
	int m1, m2, m3;
	m1=((n1<18) ? n1 : 18);
	m2=((n2<14) ? n2 : 14);
	m3=((n3<18) ? n3 : 18);
	printf("   \n");
	#pragma event showall#0 start
	
	struct timeval start_showall_0, end_showall_0;
	gettimeofday(&start_showall_0, NULL);
	
	#pragma loop name showall#0 
	for (i3=0; i3<m3; i3 ++ )
	{
		#pragma loop name showall#0#0 
		for (i1=0; i1<m1; i1 ++ )
		{
			#pragma loop name showall#0#0#0 
			for (i2=0; i2<m2; i2 ++ )
			{
				printf("%6.3f", z[i3][i2][i1]);
			}
			printf("\n");
		}
		printf("  - - - - - - - \n");
	}
	#pragma event showall#0 stop
	
	gettimeofday(&end_showall_0, NULL);
	printf("Time showall_0 seconds %0.8f \n", time_diff(&start_showall_0, &end_showall_0));
	
	printf("   \n");
}

static double power(double a, int n)
{
	double aj;
	int nj;
	double rdummy;
	double power;
	power=1.0;
	nj=n;
	aj=a;
	while (nj!=0)
	{
		if ((nj%2)==1)
		{
			rdummy=randlc( & power, aj);
		}
		rdummy=randlc( & aj, aj);
		nj=(nj/2);
	}
	return power;
}

static void bubble(double ten[][2], int j1[][2], int j2[][2], int j3[][2], int m, int ind)
{
	double temp;
	int i, j_temp;
	if (ind==1)
	{
		#pragma loop name bubble#0 
		for (i=0; i<(m-1); i ++ )
		{
			if (ten[i][ind]>ten[i+1][ind])
			{
				temp=ten[i+1][ind];
				ten[i+1][ind]=ten[i][ind];
				ten[i][ind]=temp;
				j_temp=j1[i+1][ind];
				j1[i+1][ind]=j1[i][ind];
				j1[i][ind]=j_temp;
				j_temp=j2[i+1][ind];
				j2[i+1][ind]=j2[i][ind];
				j2[i][ind]=j_temp;
				j_temp=j3[i+1][ind];
				j3[i+1][ind]=j3[i][ind];
				j3[i][ind]=j_temp;
			}
			else
			{
				return ;
			}
		}
	}
	else
	{
		#pragma loop name bubble#1 
		for (i=0; i<(m-1); i ++ )
		{
			if (ten[i][ind]<ten[i+1][ind])
			{
				temp=ten[i+1][ind];
				ten[i+1][ind]=ten[i][ind];
				ten[i][ind]=temp;
				j_temp=j1[i+1][ind];
				j1[i+1][ind]=j1[i][ind];
				j1[i][ind]=j_temp;
				j_temp=j2[i+1][ind];
				j2[i+1][ind]=j2[i][ind];
				j2[i][ind]=j_temp;
				j_temp=j3[i+1][ind];
				j3[i+1][ind]=j3[i][ind];
				j3[i][ind]=j_temp;
			}
			else
			{
				return ;
			}
		}
	}
}

static void zero3(void * oz, int n1, int n2, int n3)
{
	double (* z)[n2][n1] = (double (* )[n2][n1])oz;
	int i1, i2, i3;
	#pragma event zero3#0 start
	
	struct timeval start_zero3_0, end_zero3_0;
	gettimeofday(&start_zero3_0, NULL);
	
	#pragma loop name zero3#0 
	for (i3=0; i3<n3; i3 ++ )
	{
		#pragma loop name zero3#0#0 
		for (i2=0; i2<n2; i2 ++ )
		{
			#pragma loop name zero3#0#0#0 
			for (i1=0; i1<n1; i1 ++ )
			{
				z[i3][i2][i1]=0.0;
			}
		}
	}
	#pragma event zero3#0 stop
	
	gettimeofday(&end_zero3_0, NULL);
	printf("Time zero3_0 seconds %0.8f \n", time_diff(&start_zero3_0, &end_zero3_0));
	
}
