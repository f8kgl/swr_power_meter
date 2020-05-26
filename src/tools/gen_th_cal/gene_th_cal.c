#include <stdio.h>

int main (void)
{
  int i=0;
  char *filename="adc_theoric_cal.asm";
  char *filename_entete="entete_cal";
  char *filename_fin="fin_cal";
  FILE *fp,*fp_entete,*fp_fin;
  int c;

  fp = fopen(filename,"w");
  fp_entete = fopen(filename_entete,"r");
  fp_fin = fopen(filename_fin,"r");

  while((c=fgetc(fp_entete))!=EOF)
    {
      fputc(c,fp);
    }

  fprintf(fp,"\n"); 

  for (i=0;i<4096;i++) {
    printf("    DW 0x%03X\n",i);
    fprintf(fp,"    DW 0x%03X\n",i); 
  }

  while((c=fgetc(fp_fin))!=EOF)
    {
      fputc(c,fp);
    }

  fclose(fp);
  fclose(fp_entete);
  fclose(fp_fin);

  return 0;
}

