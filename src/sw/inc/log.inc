#define NB_BYTE D'08'
#define TIMER0_START (1<<TMR0ON) | (1<<T08BIT) | (1<<PSA)

#define TAG_ADC 0x80
#define ID_LOG_I2C_NACK 0x00
#define ID_LOG_ADC_VAL 0x01
;0x02
;0x03
;0x04

#define TAG_TIMER 0x40
#define ID_LOG_CALIBRATION_TIMER 0x00
IFDEF TEST
#define ID_LOG_SAMPLE_TIMER 0x01
ENDIF
#define ID_LOG_FXM1616U_TIMER 0x02
;0x03
;0x04

#define TAG_PIC 0x20
#define ID_LOG_FW_VERSION 0x00
#define ID_LOG_PIC_REGISTER 0x01
;0x02
;0x03
;0x04

#define TAG_MISC 0x10
;0x00
;0x01
;0x02
;0x03
;0x04

m_timer0_reset	macro
  CLRF	T0CON
  CLRF	TMR0L
  endm

m_timer0_start	macro
  CLRF	T0CON
  CLRF	TMR0L
  MOVLW	TIMER0_START
  MOVWF	T0CON
	endm

m_timer0_restart	macro
  MOVLW	TIMER0_START
  MOVWF	T0CON
	endm


m_timer0_stop	macro
  MOVFF	TMR0L,v_log_data+1
  MOVFF	TMR0H,v_log_data
  clrf T0CON
  movlw 0x05
  subwf v_log_data+1,f
  endm
