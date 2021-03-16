#include <stdio.h>

int main (void)
{
  int i=0;
  double ln=0;
  char *filename="10logADC.asm";
  FILE *fp;

  fp = fopen(filename,"w");

  
  for (i=1;i<2048;i++)
  {
	ln = 10*log(i);
	printf(ADC=0x%03X - 10*log(ADC) = %g\n",i,ln);
  }
  
  fprintf(fp,"    end"); 

  fclose(fp);

  return 0;
}

