#define NB_BYTE D'08'
#define TIMER0_START (1<<TMR0ON) | (1<<T08BIT) | (1<<PSA)

#define TAG_I2C_NACK 0x80
#define TAG_TIMER 0x40
#define TAG_PIC_REG 0x20
#define TAG_FW_VERSION 0x10

m_timer0_start	macro
  CLRF	T0CON
  CLRF	TMR0L
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
