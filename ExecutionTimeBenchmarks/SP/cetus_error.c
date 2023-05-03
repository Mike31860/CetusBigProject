/*
Copyright (C) 1991-2020 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it andor
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https:www.gnu.org/licenses/>. 
*/
/*
This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it. 
*/
/*
glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default. 
*/
/*
wchar_t uses Unicode 10.0.0.  Version 10.0 of the Unicode Standard is
   synchronized with ISOIEC 10646:2017, fifth edition, plus
   the following additions from Amendment 1 to the fifth edition:
   - 56 emoji characters
   - 285 hentaigana
   - 3 additional Zanabazar Square characters
*/
/* ------------------------------------------------------------------------- */
/*                                                                          */
/*  This benchmark is a serial C version of the NPB SP code. This C         */
/*  version is developed by the Center for Manycore Programming at Seoul    */
/*  National University and derived from the serial Fortran versions in     */
/*  "NPB3.3-SER" developed by NAS.                                          */
/*                                                                          */
/*  Permission to use, copy, distribute and modify this software for any    */
/*  purpose with or without fee is hereby granted. This software is         */
/*  provided "as is" without express or implied warranty.                   */
/*                                                                          */
/*  Information on NPB 3.3, including the technical report, the original    */
/*  specifications, source code, results and information on how to submit   */
/*  new results, is available at:                                           */
/*                                                                          */
/*           http:www.nas.nasa.govSoftware/NPB/                          */
/*                                                                          */
/*  Send comments or suggestions for this C version to cmp@aces.snu.ac.kr   */
/*                                                                          */
/*          Center for Manycore Programming                                 */
/*          School of Computer Science and Engineering                      */
/*          Seoul National University                                       */
/*          Seoul 151-744, Korea                                            */
/*                                                                          */
/*          E-mail:  cmp@aces.snu.ac.kr                                     */
/*                                                                          */
/* ------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------- */
/* Authors: Sangmin Seo, Jungwon Kim, Jun Lee, Jeongho Nah, Gangwon Jo,     */
/*          and Jaejin Lee                                                  */
/* ------------------------------------------------------------------------- */
#include "header.h"
#include <math.h>
#include <stdlib.h>
/* --------------------------------------------------------------------- */
/* this function computes the norm of the difference between the */
/* computed solution and the exact solution */
/* --------------------------------------------------------------------- */
void error_norm(double rms[5])
{
	int i, j, k, m, d;
	double xi, eta, zeta, u_exact[5], add;
	#pragma loop name error_norm#0 
	for (m=0; m<5; m ++ )
	{
		rms[m]=0.0;
	}
	#pragma loop name error_norm#1 
	for (k=0; k<=(grid_points[2]-1); k ++ )
	{
		zeta=(((double)k)*dnzm1);
		#pragma loop name error_norm#1#0 
		for (j=0; j<=(grid_points[1]-1); j ++ )
		{
			eta=(((double)j)*dnym1);
			#pragma loop name error_norm#1#0#0 
			for (i=0; i<=(grid_points[0]-1); i ++ )
			{
				xi=(((double)i)*dnxm1);
				exact_solution(xi, eta, zeta, u_exact);
				#pragma loop name error_norm#1#0#0#0 
				for (m=0; m<5; m ++ )
				{
					add=(u[k][j][i][m]-u_exact[m]);
					rms[m]=(rms[m]+(add*add));
				}
			}
		}
	}
	#pragma loop name error_norm#2 
	for (m=0; m<5; m ++ )
	{
		#pragma loop name error_norm#2#0 
		for (d=0; d<3; d ++ )
		{
			rms[m]=(rms[m]/((double)(grid_points[d]-2)));
		}
		rms[m]=sqrt(rms[m]);
	}
	return ;
}

void rhs_norm(double rms[5])
{
	int i, j, k, d, m;
	double add;
	#pragma loop name rhs_norm#0 
	for (m=0; m<5; m ++ )
	{
		rms[m]=0.0;
	}
	#pragma loop name rhs_norm#1 
	for (k=1; k<=nz2; k ++ )
	{
		#pragma loop name rhs_norm#1#0 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name rhs_norm#1#0#0 
			for (i=1; i<=nx2; i ++ )
			{
				#pragma loop name rhs_norm#1#0#0#0 
				for (m=0; m<5; m ++ )
				{
					add=rhs[k][j][i][m];
					rms[m]=(rms[m]+(add*add));
				}
			}
		}
	}
	#pragma loop name rhs_norm#2 
	for (m=0; m<5; m ++ )
	{
		#pragma loop name rhs_norm#2#0 
		for (d=0; d<3; d ++ )
		{
			rms[m]=(rms[m]/((double)(grid_points[d]-2)));
		}
		rms[m]=sqrt(rms[m]);
	}
	return ;
}
