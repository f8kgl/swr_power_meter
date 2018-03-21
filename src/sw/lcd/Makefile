AS = gpasm
ASFLAGS = -c -DSW_VERSION="\"$(VERSION)\""

LD = gplib
LDFLAGS = -c
INC_DIR = -I../inc/

COMP = lcd

SRC = driver.asm
SRC +=aff.asm

OBJ_TEST = $(SRC:.asm=.TEST.o)

../../../bin/$(COMP).TEST.a : $(OBJ_TEST)
	$(LD) $(LDFLAGS) ../../../bin/$(COMP).TEST.a $(OBJ_TEST)
	rm *.o
	rm *.lst

%.TEST.o : %.asm
	$(AS) $(ASFLAGS) $(INC_DIR) -DTEST -p $(PROCESSOR) $< -o $@
