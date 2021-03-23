#include <fcntl.h>
#include <stdio.h>
#include <math.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
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
  int n=0;

  while (((pow(10,n) * p_kconv->kconv_inv)<1)&&(n<=12))
    n+=3;

  if (n>12)
    return -1;


  switch(n) {
  case 0:
    p_calib->unit = UNIT_W;
    break;
  case 3:
    p_calib->unit = UNIT_mW;
    break;
  case 6:
    p_calib->unit = UNIT_uW;
    break;
  case 9:
    p_calib->unit = UNIT_nW;
    break;
  case 12:
    p_calib->unit = UNIT_pW;
    break;
    }

  p_calib->kconv_calib = (uint16_t) (pow(10,n) * p_kconv->kconv_inv);
  p_calib->kconv_dBm_calib =(uint16_t) (10*(p_kconv->kconv_dBm));

  adjust = 100*(p_kconv->kconv_dBm - floor(p_kconv->kconv_dBm));
   if (adjust >= 50)
    p_calib->kconv_dBm_calib++;




  printf("1/Kconv=0x%04X (%d) (unit=0x%04X)\n",p_calib->kconv_calib,p_calib->kconv_calib,p_calib->unit);
  printf("Kconv(dBm)=0x%04X (%d)\n",p_calib->kconv_dBm_calib,p_calib->kconv_dBm_calib);
  return 0;
}

char* get_timestamp ()
{
  time_t now = time (NULL);
  return asctime (localtime (&now));
}

int
f_create_hex_file(t_calib *p_calib, char port[3])
{
  char filename[128];
  time_t timestamp = time( NULL );
  struct tm * timeInfos = localtime( & timestamp );
  int fp;
  uint8_t checksum;
  char line[7][32];
  uint8_t byte[2];
  int i;
  size_t length;

  sprintf(&(line[0][0]),":020000040000FA\n");
  sprintf(&(line[1][0]),":0200000400F00A\n");

  byte[1] = (p_calib->kconv_dBm_calib & 0xFF00)>>8;
  byte[0] = (p_calib->kconv_dBm_calib & 0x00FF);

  if (strcmp(port,"FWD")==0) {
    checksum = 0x02 + EEP_ADDR_KCONV_DBM_FWD_TEST + byte[0] + byte[1];
    checksum =~checksum;
    checksum++;
    sprintf(&(line[2][0]),":0200%02X00%02X%02X%02X\n",EEP_ADDR_KCONV_DBM_FWD_TEST,byte[1],byte[0],checksum);
  } else {
    checksum = 0x02 + EEP_ADDR_KCONV_DBM_REF_TEST + 0x00 + 0x00;
    checksum =~checksum;
    checksum++;
    sprintf(&(line[2][0]),":0200%02X000000%02X\n",EEP_ADDR_KCONV_DBM_REF_TEST,checksum);
  }

  if (strcmp(port,"FWD")==0) {

    byte[1] = (p_calib->kconv_calib & 0xFF00)>>8;
    byte[0] = (p_calib->kconv_calib & 0x00FF);
    checksum = 0x02 + EEP_ADDR_KCONV_INV_TEST + byte[0] + byte[1];
    checksum =~checksum;
    checksum++;
    sprintf(&(line[3][0]),":0200%02X00%02X%02X%02X\n",EEP_ADDR_KCONV_INV_TEST,byte[1],byte[0],checksum);
    checksum = 0x02 + EEP_ADDR_KCONV_UNIT_TEST + p_calib->unit;
    checksum =~checksum;
    checksum++;
    sprintf(&(line[4][0]),":0200%02X00%04X%02X\n",EEP_ADDR_KCONV_UNIT_TEST,p_calib->unit,checksum);
  }

  sprintf(&(line[5][0]),":00000001FF\n");

  if (strcmp(port,"FWD")==0)
    sprintf(filename,"kconv_fwd.%02d%02d%04d%02d%02d%02d.xWATT.hex",
    timeInfos->tm_mday,timeInfos->tm_mon+1,timeInfos->tm_year+1900,
    timeInfos->tm_hour, timeInfos->tm_min, timeInfos->tm_sec);
  else
    sprintf(filename,"kconv_ref.%02d%02d%04d%02d%02d%02d.xWATT.hex",
    timeInfos->tm_mday,timeInfos->tm_mon+1,timeInfos->tm_year+1900,
    timeInfos->tm_hour, timeInfos->tm_min, timeInfos->tm_sec);

  printf("---------- %s -----------\n",filename);

#ifdef DEBUG_ISSUE_389
  for (i=2;i<3;i++)
#else
  for (i=0;i<3;i++)
#endif
    printf("%s",&(line[i][0]));
  printf("%s",&(line[5][0]));

  fp = open(filename, O_WRONLY | O_CREAT | O_APPEND, 0666);
#ifdef DEBUG_ISSUE_389
  for (i=2;i<3;i++)
#else
  for (i=0;i<3;i++)
#endif
  {
    length = strlen(&(line[i][0]));
    write(fp,&(line[i][0]),length);
  }
  length = strlen(&(line[5][0]));
  write(fp,&(line[5][0]),length);
  close(fp);

  sprintf(filename,"kconv_fwd.%02d%02d%04d%02d%02d%02d.SWR_POWER_METER.hex",
  timeInfos->tm_mday,timeInfos->tm_mon+1,timeInfos->tm_year+1900,
  timeInfos->tm_hour, timeInfos->tm_min, timeInfos->tm_sec);

  printf("---------- %s -----------\n",filename);

#ifdef DEBUG_ISSUE_389
  printf("%s",&(line[2][0]));
#else
  for (i=0;i<2;i++)
    printf("%s",&(line[i][0]));
#endif
  for (i=3;i<=5;i++)
    printf("%s",&(line[i][0]));
  printf("------------------------------------------------------\n");

  fp = open(filename, O_WRONLY | O_CREAT | O_APPEND, 0666);
#ifdef DEBUG_ISSUE_389
  length = strlen(&(line[2][0]));
  write(fp,&(line[2][0]),length);
#else
  for (i=0;i<2;i++) {
    length = strlen(&(line[i][0]));
    write(fp,&(line[i][0]),length);
  }
#endif
  for (i=3;i<=5;i++) {
    length = strlen(&(line[i][0]));
    write(fp,&(line[i][0]),length);
  }
  close(fp);

  return 0;
}

int main (int argc, char **argv)
{
  int c;
  char *end;
  t_cal_value calibration_value;
  int ret;

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



  f_calc_Kconv(&(calibration_value.param_in), &(calibration_value.kconv));
  ret =f_calc_calib(&(calibration_value.kconv),&(calibration_value.kconv_calib));

  if (ret !=0) {
    printf("Erreur de calibration\n");
    return -1;
  }

  f_create_hex_file(&(calibration_value.kconv_calib),calibration_value.param_in.port);




  return 0;

}
