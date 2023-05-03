

#include <stdio.h>

int main()
{
 int LX1 = 5 , idel[2400][6][6][6], ntemp , iel , j ,i;
    
    for (iel = 0; iel < 10; iel++) {
    ntemp = LX1*LX1*LX1*iel;
    for (j = 0; j < LX1; j++) {
      for (i = 0; i < LX1; i++) {
        idel[iel][0][j][i] = ntemp+i*LX1 + j*LX1*LX1+LX1 - 1;
        idel[iel][1][j][i] = ntemp+i*LX1 + j*LX1*LX1;
        idel[iel][2][j][i] = ntemp+i*1 + j*LX1*LX1+LX1*(LX1-1);
        idel[iel][3][j][i] = ntemp+i*1 + j*LX1*LX1;
        idel[iel][4][j][i] = ntemp+i*1 + j*LX1+LX1*LX1*(LX1-1);
        idel[iel][5][j][i] = ntemp+i*1 + j*LX1;


        if(iel == 1 ){
        printf("idel[%d][0][%d][%d] = %d\n", iel ,j ,i , idel[iel][0][j][i]);
        printf("idel[%d][1][%d][%d] = %d\n", iel ,j ,i , idel[iel][1][j][i]);
        printf("idel[%d][2][%d][%d] = %d\n", iel ,j ,i , idel[iel][2][j][i]);
        printf("idel[%d][3][%d][%d] = %d\n", iel ,j ,i , idel[iel][3][j][i]);
        printf("idel[%d][4][%d][%d] = %d\n", iel ,j ,i , idel[iel][4][j][i]);
        printf("idel[%d][5][%d][%d] = %d\n", iel ,j ,i , idel[iel][5][j][i]);

        }


      }
    }
  }

return 0;

}