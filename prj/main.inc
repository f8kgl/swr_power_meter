	LIST p=16F628A ;tell assembler what chip we are using
	ERRORLEVEL 0, -302 ;suppress bank selection messages
	__config 0x3D18 ;sets the configuration settings (osc type etc.)


