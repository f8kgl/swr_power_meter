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
  uint8_t kconv_nW_byte[2];
  uint16_t unit = 0x0003;

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


 printf(":020000040000FA\n");
 printf(":0200000400F00A\n");

 kconv_dBm_byte[1] = (kconv_dBm[0] & 0xFF00)>>8;
 kconv_dBm_byte[0] = (kconv_dBm[0] & 0x00FF);
 checksum = 0x02 + 0x06 + kconv_dBm_byte[0] + kconv_dBm_byte[1];
 checksum =~checksum;
 checksum++;
 printf(":02000600%02X%02X%02X\n",kconv_dBm_byte[1],kconv_dBm_byte[0],checksum);
 checksum = 0x02 + 0x08 + 0x00 + 0x00;
 checksum =~checksum;
 checksum++;
 printf(":020008000000%02X\n",checksum);

 kconv_nW_byte[1] = (((uint16_t)kconv_nW[0]) & 0xFF00)>>8;
 kconv_nW_byte[0] = (((uint16_t)kconv_nW[0]) & 0x00FF);
 checksum = 0x02 + 0x0A + kconv_nW_byte[0] + kconv_nW_byte[1];
 checksum =~checksum;
 checksum++;
 printf(":02000A00%02X%02X%02X\n",kconv_nW_byte[1],kconv_nW_byte[0],checksum);
 checksum = 0x02 + 0x0C + unit;
 checksum =~checksum;
 checksum++;
 printf(":02000C00%04X%02X\n",unit,checksum);
 printf(":00000001FF\n");


 //fp_eeprom
 fprintf(fp_eeprom,":020000040000FA\n");
 fprintf(fp_eeprom,":0200000400F00A\n");

 kconv_dBm_byte[1] = (kconv_dBm[0] & 0xFF00)>>8;
 kconv_dBm_byte[0] = (kconv_dBm[0] & 0x00FF);
 checksum = 0x02 + 0x06 + kconv_dBm_byte[0] + kconv_dBm_byte[1];
 checksum =~checksum;
 checksum++;
 fprintf(fp_eeprom,":02000600%02X%02X%02X\n",kconv_dBm_byte[1],kconv_dBm_byte[0],checksum);
 checksum = 0x02 + 0x08 + 0x00 + 0x00;
 checksum =~checksum;
 checksum++;
 fprintf(fp_eeprom,":020008000000%02X\n",checksum);

 kconv_nW_byte[1] = (((uint16_t)kconv_nW[0]) & 0xFF00)>>8;
 kconv_nW_byte[0] = (((uint16_t)kconv_nW[0]) & 0x00FF);
 checksum = 0x02 + 0x0A + kconv_nW_byte[0] + kconv_nW_byte[1];
 checksum =~checksum;
 checksum++;
 fprintf(fp_eeprom,":02000A00%02X%02X%02X\n",kconv_nW_byte[1],kconv_nW_byte[0],checksum);
 checksum = 0x02 + 0x0C + unit;
 checksum =~checksum;
 checksum++;
 fprintf(fp_eeprom,":02000C00%04X%02X\n",unit,checksum);
 fprintf(fp_eeprom,":00000001FF\n");

 //fp_gpsim
 kconv_dBm_byte[1] = (kconv_dBm[0] & 0xFF00)>>8;
 kconv_dBm_byte[0] = (kconv_dBm[0] & 0x00FF);
 checksum = 0x02 + 0x06 + kconv_dBm_byte[0] + kconv_dBm_byte[1];
 checksum =~checksum;
 checksum++;
 fprintf(fp_gpsim,":02000600%02X%02X%02X\n",kconv_dBm_byte[1],kconv_dBm_byte[0],checksum);
 checksum = 0x02 + 0x08 + 0x00 + 0x00;
 checksum =~checksum;
 checksum++;
 fprintf(fp_gpsim,":020008000000%02X\n",checksum);

 kconv_nW_byte[1] = (((uint16_t)kconv_nW[0]) & 0xFF00)>>8;
 kconv_nW_byte[0] = (((uint16_t)kconv_nW[0]) & 0x00FF);
 checksum = 0x02 + 0x0A + kconv_nW_byte[0] + kconv_nW_byte[1];
 checksum =~checksum;
 checksum++;
 fprintf(fp_gpsim,":02000A00%02X%02X%02X\n",kconv_nW_byte[1],kconv_nW_byte[0],checksum);
 checksum = 0x02 + 0x0C + unit;
 checksum =~checksum;
 checksum++;
 fprintf(fp_gpsim,":02000C00%04X%02X\n",unit,checksum);
 fprintf(fp_gpsim,":00000001FF\n");


  fclose(fp_eeprom);
  fclose(fp_gpsim);



  return 0;

}
