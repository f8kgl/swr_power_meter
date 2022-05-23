AS = gpasm
ASFLAGS = -c

LD = gplib
LDFLAGS = -c
INC_DIR = -I../inc/

COMP = lcd

SRC = aff.asm
SRC += driver.asm

OBJ_TEST = $(SRC:.asm=.TEST.o)
OBJ_xWATT_CALIBRATION = $(SRC:.asm=.xWATT.CALIBRATION.o)
OBJ_SWR_POWER_METER_CALIBRATION = $(SRC:.asm=.SWR_POWER_METER.CALIBRATION.o)


../../../bin/libtest$(COMP).a : $(OBJ_TEST)
	$(LD) $(LDFLAGS) $@ $^
	rm *.o
	rm *.lst

../../../bin/libcalib$(COMP).xWATT.a : $(OBJ_xWATT_CALIBRATION)
	$(LD) $(LDFLAGS) $@ $^
	rm *.o
	rm *.lst

../../../bin/libcalib$(COMP).SWR_POWER_METER.a : $(OBJ_SWR_POWER_METER_CALIBRATION)
	$(LD) $(LDFLAGS) $@ $^
	rm *.o
	rm *.lst

%.TEST.o : %.asm
	$(AS) $(ASFLAGS) $(INC_DIR) -DTEST $(DEBUG_ISSUE_n) -p $(PROCESSOR) $< -o $@

%.xWATT.CALIBRATION.o : %.asm
	$(AS) $(ASFLAGS) $(INC_DIR) -DxWATT -DCALIBRATION $(DEBUG_ISSUE_n) -p $(PROCESSOR) $< -o $@

%.SWR_POWER_METER.CALIBRATION.o : %.asm
	$(AS) $(ASFLAGS) $(INC_DIR) -DSWR_POWER_METER -DCALIBRATION $(DEBUG_ISSUE_n) -p $(PROCESSOR) $< -o $@
