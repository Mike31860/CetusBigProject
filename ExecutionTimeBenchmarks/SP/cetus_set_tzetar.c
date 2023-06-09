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
#include <stdlib.h>
/* --------------------------------------------------------------------- */
/* block-diagonal matrix-vector multiplication                        */
/* --------------------------------------------------------------------- */
void tzetar()
{
	int i, j, k;
	double t1, t2, t3, ac, xvel, yvel, zvel, r1, r2, r3, r4, r5;
	double btuz, ac2u, uzik1;
	if (timeron)
	{
		timer_start(14);
	}
	#pragma loop name tzetar#0 
	for (k=1; k<=nz2; k ++ )
	{
		#pragma loop name tzetar#0#0 
		for (j=1; j<=ny2; j ++ )
		{
			#pragma loop name tzetar#0#0#0 
			for (i=1; i<=nx2; i ++ )
			{
				xvel=us[k][j][i];
				yvel=vs[k][j][i];
				zvel=ws[k][j][i];
				ac=speed[k][j][i];
				ac2u=(ac*ac);
				r1=rhs[k][j][i][0];
				r2=rhs[k][j][i][1];
				r3=rhs[k][j][i][2];
				r4=rhs[k][j][i][3];
				r5=rhs[k][j][i][4];
				uzik1=u[k][j][i][0];
				btuz=(bt*uzik1);
				t1=((btuz/ac)*(r4+r5));
				t2=(r3+t1);
				t3=(btuz*(r4-r5));
				rhs[k][j][i][0]=t2;
				rhs[k][j][i][1]=((( - uzik1)*r2)+(xvel*t2));
				rhs[k][j][i][2]=((uzik1*r1)+(yvel*t2));
				rhs[k][j][i][3]=((zvel*t2)+t3);
				rhs[k][j][i][4]=((((uzik1*((( - xvel)*r2)+(yvel*r1)))+(qs[k][j][i]*t2))+((c2iv*ac2u)*t1))+(zvel*t3));
			}
		}
	}
	if (timeron)
	{
		timer_stop(14);
	}
	return ;
}
