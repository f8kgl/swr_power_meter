AS = gpasm
ASFLAGS = -c

LD = gplib
LDFLAGS = -c
INC_DIR = -I../inc/

COMP = lcd

SRC = driver.asm
SRC +=aff.asm
SRC+=fsm.asm

OBJ_TEST = $(SRC:.asm=.TEST.o)

../../../bin/libtest$(COMP).a : $(OBJ_TEST)
	$(LD) $(LDFLAGS) $@ $^
	rm *.o
	rm *.lst

%.TEST.o : %.asm
	$(AS) $(ASFLAGS) $(INC_DIR) -DTEST $(DEBUG_ISSUE_n) $(DEBUG_ISSUE_n) -p $(PROCESSOR) $< -o $@
