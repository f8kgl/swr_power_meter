#define EEP_ADDR_KCONV_DBM_FWD_TEST 0x06
#define EEP_ADDR_KCONV_DBM_REF_TEST 0x08
#define EEP_ADDR_KCONV_INV_TEST 0x0A
#define EEP_ADDR_KCONV_UNIT_TEST 0x0C
#define EEP_ADDR_CALIBRATION_DONE 0x16

#define UNIT_W 0x0000
#define UNIT_mW 0x0001
#define UNIT_uW 0x0002
#define UNIT_nW 0x0003
#define UNIT_pW 0x0004

enum FW_MODE
  {
    TEST,
    OPERATIONNEL,
    UNKNOWN
  };


typedef struct {
  enum FW_MODE mode;
  uint16_t adc_m;
  double P_in;
  char port[3];
} t_in_value;


typedef struct {
  long double kconv;
  long double kconv_inv;
  long double kconv_dBm;
} t_calc;

typedef struct {
  uint16_t kconv_calib;
  uint16_t unit;
  uint16_t kconv_dBm_calib;
} t_calib;


typedef struct {

  t_in_value param_in;

  t_calc kconv;

  t_calib kconv_calib;

} t_cal_value;
