AS = gpasm
ASFLAGS = -c

LD = gplib
LDFLAGS = -c
INC_DIR = -I../inc/

COMP = adc

SRC = adc.asm

OBJ_TEST = $(SRC:.asm=.TEST.o)
OBJ_xWATT_CALIBRATION = $(SRC:.asm=.xWATT.CALIBRATION..o)
OBJ_SWR_POWER_METER_CALIBRATION = $(SRC:.asm=.SWR_POWER_METER.CALIBRATION..o)


../../../bin/libtest$(COMP).a : $(OBJ_TEST)
	$(LD) $(LDFLAGS) $@ $^
	rm *.o
	rm *.lst

../../../bin/lib$(COMP).xWATT.a : $(OBJ_xWATT)
	$(LD) $(LDFLAGS) $@ $^
	rm *.o
	rm *.lst

../../../bin/lib$(COMP).SWR_POWER_METER.a : $(OBJ_SWR_POWER_METER)
	$(LD) $(LDFLAGS) $@ $^
	rm *.o
	rm *.lst

%.TEST.o : %.asm
	$(AS) $(ASFLAGS) $(INC_DIR) -DTEST $(DEBUG_ISSUE_n) -p $(PROCESSOR) $< -o $@

%.xWATT.o : %.asm
	$(AS) $(ASFLAGS) $(INC_DIR) -DxWATT -DOPERATIONNEL $(DEBUG_ISSUE_n) -p $(PROCESSOR) $< -o $@

%.SWR_POWER_METER.o : %.asm
	$(AS) $(ASFLAGS) $(INC_DIR) -DSWR_POWER_METER -DOPERATIONNEL $(DEBUG_ISSUE_n) -p $(PROCESSOR) $< -o $@
