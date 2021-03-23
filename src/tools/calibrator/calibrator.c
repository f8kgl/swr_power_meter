#include <stdio.h>
#include <math.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include "calibrator.h"

int f_calc_Kconv(t_in_value *p_in, t_calc *p_kconv)
{
  uint16_t adc_m = p_in->adc_m;
  double P_in = p_in->P_in;

  p_kconv->kconv = adc_m/P_in;
  p_kconv->kconv_inv = 1/p_kconv->kconv;
  p_kconv->kconv_dBm = -(30 -(10 * log10(p_kconv->kconv)));

  printf("------------------------------------------------------\n");
  printf("Port=%s\nkconv = %.12LfnW\n1/kconv = %.12Lf\n%.3LfdB\n",p_in->port,p_kconv->kconv,p_kconv->kconv_inv,p_kconv->kconv_dBm);
  return 0;
}

int f_calc_calib(t_calc *p_kconv, t_calib *p_calib)
{
  int adjust;

  p_calib->kconv_calib = (uint16_t) (pow(10,9) * p_kconv->kconv_inv);
  p_calib->kconv_dBm_calib =(uint16_t) (10*(p_kconv->kconv_dBm));

  adjust = 100*(p_kconv->kconv_dBm - floor(p_kconv->kconv_dBm));
   if (adjust >= 50)
    p_calib->kconv_dBm_calib++;

  printf("0x%04X (%d)\n",p_calib->kconv_dBm_calib,p_calib->kconv_dBm_calib);
  printf("------------------------------------------------------\n");
  return 0;
}

int main (int argc, char **argv)
{
  int c;
  char *end;
  t_cal_value calibration_value;
#if 0
  char *filename_eeprom="kconv.TEST.hex";
  char *filename_gpsim="kconv.GPSIM.hex";
  FILE *fp_eeprom;
  FILE *fp_gpsim;
  uint8_t checksum;
#endif

#if 0
  fp_eeprom = fopen(filename_eeprom,"w");
  fp_gpsim = fopen(filename_gpsim,"w");
#endif

  while ((c=getopt(argc,argv,"otfra:p:"))!=-1)
    switch(c)
      {
      case 'o':
	calibration_value.param_in.mode = OPERATIONNEL;
	printf("Mode opérationnel\n");
	break;
      case 't':
	calibration_value.param_in.mode =TEST;
	printf("Mode test\n");
	break;
      case 'a':
	calibration_value.param_in.adc_m = (uint16_t) strtol(optarg,&end,10);
	printf("adc = 0x%04X\n",calibration_value.param_in.adc_m);
	break;
      case 'p' :
	calibration_value.param_in.P_in =strtod(optarg,&end);
	printf("P_in = %.6f\n",calibration_value.param_in.P_in);
	break;
      case 'f' : 
	strcpy(calibration_value.param_in.port,"FWD");
	printf("Port FWD\n");
	break;
      case 'r' :
	strcpy(calibration_value.param_in.port,"REF");
	printf("Port REF\n");
	break;
	
      }


  //paramètre d'entrée : port, adc, P_calib,TEST ou OPERATIONNEL
#if 0
  strcpy(calibration_value.param_in.port,"FWD");
  calibration_value.param_in.adc_m = 2;
  calibration_value.param_in.P_in = 1*pow(10,-6);
#endif
  

  f_calc_Kconv(&(calibration_value.param_in), &(calibration_value.kconv));
  f_calc_calib(&(calibration_value.kconv),&(calibration_value.kconv_calib));

  


#if 0
  kconv_nW[0] = pow(10,9)/(pow(2,log2(adc_m[0]/Pcalib_W[0])));
  kconv_dBm[0] = (uint16_t) -(10 * 10 * log10(kconv_nW[0] * pow(10,-6)));

  adjust = (int) (10+floor(10*(-10*log10(kconv_nW[0] * pow(10,-6))+floor(10*log10(kconv_nW[0] * pow(10,-6))))));
  if (adjust > 4)
    kconv_dBm[0]++;
#endif



#if 0
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

#endif

  return 0;

}
