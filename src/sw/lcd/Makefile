AS = gpasm
ASFLAGS = -c

LD = gplib
LDFLAGS = -c
INC_DIR = -I../inc/

COMP = lcd

SRC = driver.asm
SRC +=aff.asm

OBJ_TEST = $(SRC:.asm=.TEST.o)
OBJ_xWATT = $(SRC:.asm=.xWATT.o)


../../../bin/libtest$(COMP).a : $(OBJ_TEST)
	$(LD) $(LDFLAGS) $@ $^
	rm *.o
	rm *.lst

../../../bin/libtest$(COMP).xWATT.a : $(OBJ_xWATT)
	$(LD) $(LDFLAGS) $@ $^
	rm *.o
	rm *.lst

%.TEST.o : %.asm
	$(AS) $(ASFLAGS) $(INC_DIR) -DTEST $(DEBUG_ISSUE_n) -p $(PROCESSOR) $< -o $@

%.xWATT.o : %.asm
	$(AS) $(ASFLAGS) $(INC_DIR) -DxWATT $(DEBUG_ISSUE_n) -p $(PROCESSOR) $< -o $@
