#include <stdio.h>

int main (void)
{
  int i=0,j=0;
  char *filename="eep_ext.asm";
  FILE *fp;

  fp = fopen(filename,"w");

  
  //FWD
  for (i=0;i<4096;i++) {
    printf("    DATA 0x%02X\n",((i&(0xFF00))>>8));
    fprintf(fp,"    DATA 0x%02X\n",((i&(0xFF00))>>8)); 
	   printf("    DATA 0x%02X\n",(i&(0xFF)));
    fprintf(fp,"    DATA 0x%02X\n",(i&(0xFF))); 

  }

  //REF
  for (i=0;i<4096;i++) {
    printf("    DATA 0x%02X\n",((i&(0xFF00))>>8));
    fprintf(fp,"    DATA 0x%02X\n",((i&(0xFF00))>>8)); 
	   printf("    DATA 0x%02X\n",(i&(0xFF)));
    fprintf(fp,"    DATA 0x%02X\n",(i&(0xFF))); 

  }

  //FWD/REF
  for (i=0;i<32;i++) {
	for (j=1;j<128;j++) {
    printf("    DATA 0x%02X\n",(((i/j)&(0xFF00))>>8));
    fprintf(fp,"    DATA 0x%02X\n",(((i/j)&(0xFF00))>>8)); 
	   printf("    DATA 0x%02X\n",((i/j)&(0xFF)));
    fprintf(fp,"    DATA 0x%02X\n",((i/j)&(0xFF))); 
	}
  }
  
  
  fprintf(fp,"    end"); 

  fclose(fp);

  return 0;
}

