#include <stdio.h>
#include <math.h>
#include <stdint.h>

int main (void)
{
  int i=0;
  double ln=0;
  uint16_t lut=0;
  char *filename="10logADC.inc";
  FILE *fp;

  fp = fopen(filename,"w");

  
  for (i=1;i<=2048;i++)
  {
    ln = 10*log10(i);
    lut  = (int) round(10*ln);
    printf("ADC=0x%04X(%d) - 10*log(ADC) = %.1fdB (%d 0x%04X) - DW 0x%04X\n",i,i,ln,lut, lut,lut);
    fprintf(fp,"    DW 0x%04X\n",lut);
  }
 
  fclose(fp);

  return 0;
}

