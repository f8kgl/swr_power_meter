#define TMR0_CALIBRATION D'05'

m_timer0_reset	macro
  CLRF	T0CON
  CLRF	TMR0L
  CLRF 	TMR0H
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
  clrf T0CON
	endm
