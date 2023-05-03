//-------------------------------------------------------------------------//
//                                                                         //
//  This benchmark is a serial C version of the NPB SP code. This C        //
//  version is developed by the Center for Manycore Programming at Seoul   //
//  National University and derived from the serial Fortran versions in    //
//  "NPB3.3-SER" developed by NAS.                                         //
//                                                                         //
//  Permission to use, copy, distribute and modify this software for any   //
//  purpose with or without fee is hereby granted. This software is        //
//  provided "as is" without express or implied warranty.                  //
//                                                                         //
//  Information on NPB 3.3, including the technical report, the original   //
//  specifications, source code, results and information on how to submit  //
//  new results, is available at:                                          //
//                                                                         //
//           http://www.nas.nasa.gov/Software/NPB/                         //
//                                                                         //
//  Send comments or suggestions for this C version to cmp@aces.snu.ac.kr  //
//                                                                         //
//          Center for Manycore Programming                                //
//          School of Computer Science and Engineering                     //
//          Seoul National University                                      //
//          Seoul 151-744, Korea                                           //
//                                                                         //
//          E-mail:  cmp@aces.snu.ac.kr                                    //
//                                                                         //
//-------------------------------------------------------------------------//

//-------------------------------------------------------------------------//
// Authors: Sangmin Seo, Jungwon Kim, Jun Lee, Jeongho Nah, Gangwon Jo,    //
//          and Jaejin Lee                                                 //
//-------------------------------------------------------------------------//

#include "header.h"
#include <time.h> 
#include "headerVariable.h"
#include <stdlib.h>

void adi()
{
  clock_t begin9 = clock();
  compute_rhs();
  clock_t end9 = clock();
  time_spent9 += (double)(end9 - begin9) / CLOCKS_PER_SEC;
  

  clock_t begin10 = clock();
  txinvr();
  clock_t end10 = clock();
  time_spent10 += (double)(end10 - begin10) / CLOCKS_PER_SEC;


  clock_t begin11 = clock();
  x_solve();
  clock_t end11 = clock();
  time_spent11 += (double)(end11 - begin11) / CLOCKS_PER_SEC;


  clock_t begin12 = clock();
  y_solve();
   clock_t end12 = clock();
  time_spent12 += (double)(end12 - begin12) / CLOCKS_PER_SEC;


  clock_t begin13 = clock();
  z_solve();
  clock_t end13 = clock();
  time_spent13 += (double)(end13 - begin13) / CLOCKS_PER_SEC;


  clock_t begin14 = clock();
  add();
  clock_t end14 = clock();
  time_spent14 += (double)(end14 - begin14) / CLOCKS_PER_SEC;
}
