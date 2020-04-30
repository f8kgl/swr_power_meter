#define I2C_PORT PORTA
#define SDA 2
#define SCL 3
#define SDA_DIR		TRISA,SDA  	; Serial data dir (E/S)
#define carry_bit STATUS,C

m_sda_input	macro
	bsf 	SDA_DIR			;SDA en entrée
	endm

m_sda_output	macro
	bcf 	SDA_DIR			;SDA en sortie
	endm
