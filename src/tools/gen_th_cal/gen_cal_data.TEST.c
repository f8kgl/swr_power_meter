#include <stdio.h>

int main (void)
{
  int i=0;
  char *filename="eep_ext.asm";
  FILE *fp;

  fp = fopen(filename,"w");

  for (i=0;i<8;i++) {
    printf("    DE 0x%02X\n",((i&(0xFF00))>>8));
    fprintf(fp,"    DE 0x%02X\n",((i&(0xFF00))>>8)); 
	   printf("    DE 0x%02X\n",(i&(0xFF)));
    fprintf(fp,"    DE 0x%02X\n",(i&(0xFF))); 

  }

  fprintf(fp,"    end"); 

  fclose(fp);

  return 0;
}

