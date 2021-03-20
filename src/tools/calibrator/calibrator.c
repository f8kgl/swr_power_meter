#include <stdio.h>
#include <math.h>
#include <stdint.h>

int main (void)
{
  uint16_t kconv_dBm[6];
  long double kconv_nW[6];
  uint16_t adc_m[6];
  double Pcalib_W[6];
  int adjust;
  char *filename_eeprom="kconv.TEST.hex";
  char *filename_gpsim="kconv.GPSIM.hex";
  FILE *fp_eeprom;
  FILE *fp_gpsim;
  uint8_t checksum;
  uint8_t kconv_dBm_byte[2];

  fp_eeprom = fopen(filename_eeprom,"w");
  fp_gpsim = fopen(filename_gpsim,"w");


  adc_m[0] = 2;
  Pcalib_W[0] = 1*pow(10,-6);

  kconv_nW[0] = pow(10,9)/(pow(2,log2(adc_m[0]/Pcalib_W[0])));
  kconv_dBm[0] = (uint16_t) -(10 * 10 * log10(kconv_nW[0] * pow(10,-6)));

  adjust = (int) (10+floor(10*(-10*log10(kconv_nW[0] * pow(10,-6))+floor(10*log10(kconv_nW[0] * pow(10,-6))))));
  if (adjust > 4)
    kconv_dBm[0]++;

  printf("kconv = %.1LfnW ",kconv_nW[0]);
  printf("/ %.1fdB",((10 * 10 * log10(kconv_nW[0] * pow(10,-6))))/10);
  printf(" -> 0x%04X(%d) \n",kconv_dBm[0],kconv_dBm[0]);


  kconv_dBm_byte[1] = (kconv_dBm[0] & 0xFF00)>>8;
  kconv_dBm_byte[0] = (kconv_dBm[0] & 0x00FF);

  checksum = 0x02 + 0x06 + kconv_dBm_byte[0] + kconv_dBm_byte[1];
  checksum =~checksum;
  checksum++;

 printf(":020000040000FA\n");
 printf(":0200000400F00A\n");
 printf(":02000600%02X%02X%02X\n",kconv_dBm_byte[0],kconv_dBm_byte[1],checksum);
 printf(":00000001FF\n");


 fprintf(fp_eeprom,":020000040000FA\n");
 fprintf(fp_eeprom,":0200000400F00A\n");
 fprintf(fp_eeprom,":02000600%02X%02X%02X\n",kconv_dBm_byte[1],kconv_dBm_byte[0],checksum);
 fprintf(fp_eeprom,":00000001FF\n");
 fprintf(fp_gpsim,":02000600%02X%02X%02X\n",kconv_dBm_byte[1],kconv_dBm_byte[0],checksum);
 fprintf(fp_gpsim,":00000001FF\n");

  fclose(fp_eeprom);
  fclose(fp_gpsim);



  return 0;

}
