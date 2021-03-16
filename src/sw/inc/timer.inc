#define TMR0_CALIBRATION D'07' ;7us de calibration

m_timer0_reset	macro
  CLRF	T0CON
  CLRF	TMR0L
  CLRF 	TMR0H
  endm

m_timer0_start	macro
  CLRF	T0CON
  CLRF	TMR0L
  CLRF 	TMR0H
  MOVLW	TIMER0_START
  MOVWF	T0CON
	endm

m_timer0_restart	macro
  MOVLW	TIMER0_START
  MOVWF	T0CON
	endm


m_timer0_stop	macro
IFNDEF DEBUG_ISSUE_380
  clrf T0CON
ENDIF
  MOVFF	TMR0H,v_tmp
	MOVFF	TMR0L,v_tmp+1
	movlw TMR0_CALIBRATION
	subwf v_tmp+1,f

	endm
