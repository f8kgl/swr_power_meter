AS = gpasm
ASFLAGS = -c -DSW_VERSION="\"$(VERSION)\""

LD = gplib
LDFLAGS = -c
INC_DIR = -I../inc/

COMP = lcd

SRC = driver.asm
SRC +=aff.asm

OBJ = $(SRC:.asm=.o)

../../../bin/$(COMP).a : $(OBJ)
	$(LD) $(LDFLAGS) ../../../bin/$(COMP).a $(OBJ)
	rm *.o
	rm *.lst

%.o : %.asm
	$(AS) $(ASFLAGS) $(INC_DIR) -p $(PROCESSOR) $<
