#Variables
NAME = swr_power_meter_f8kgl-
export PROCESSOR = 16f88
export VERSION := V0.5
OUTPUT_TEST = $(NAME)$(VERSION).TEST.hex
OUTPUT_CALIBRATION = $(NAME)$(VERSION).CALIBRATION.hex
OUTPUT = $(NAME)$(VERSION).hex
export LKR_DIR =/usr/share/gputils/lkr/
export SCRIPT = $(LKR_DIR)$(PROCESSOR).lkr
INC_DIR = -I../src/sw/inc/

#Tools
AS = gpasm
LD = gplink

#Flags
LDFLAGS = --map -c
DEBUG_LDFLAGS = -S2
ASFLAGS = -c -DSW_VERSION="\"$(VERSION)\""
export TEST_FLAGS = TEST
export CALIBRATION_FLAGS = CALIBRATION

#Composants
COMPS = lcd
COMPS += eep
#COMPS +=calc
COMPS +=readadc
#COMPS +=flh

#Sources
SRC_COMMUN = main.asm
SRC_COMMUN +=../src/sw/data/swversion.asm
SRC_TEST = ../src/sw/data/adc_theoric_cal.asm

#Objets
OBJS_COMMUN_TEST = $(SRC_COMMUN:%.asm=%.TEST.o)
OBJS_TEST_FW = $(SRC_TEST:%.asm=%.o)
OBJS_TEST = $(OBJS_COMMUN_TEST)
OBJS_TEST += $(OBJS_TEST_FW)

#Librairies
LIBS_TEST = $(COMPS:%=../bin/libtest%.a)
LIBS_CALIBRATION = $(COMPS:%=../bin/libcalib%.a)
LIBS = $(COMPS:%=../bin/%.a)

#Rules
all : $(OUTPUT_TEST)

rule_test : $(OUTPUT_TEST)

#Règle du firmware de test
$(OUTPUT_TEST) : $(OBJS_TEST) $(LIBS_TEST)
	$(LD) $(LDFLAGS) $(DEBUG_LDFLAGS) -s $(SCRIPT) -o ../bin/$(OUTPUT_TEST) $^
	rm $^
	rm *.lst

#Règle d'une librairie de test
../bin/libtest%.a:
	make -C $(@:../bin/libtest%.a=../src/sw/%)

#Règle d’un objet de test issus des sources commun à tous les firmware 
%.TEST.o : %.asm
	$(AS) $(ASFLAGS) -D$(TEST_FLAGS) -p $(PROCESSOR) $(INC_DIR) -o $@ $<

#Règle d’un objet du firmware test
%.o : %.asm
	$(AS) $(ASFLAGS) -D$(TEST_FLAGS) -p $(PROCESSOR) $(INC_DIR) -o $@ $<

clean:
	rm -f *.o
	rm -f *.lst
	rm -f ../bin/*
	rm -f ../src/sw/data/*.o
	rm -f ../src/sw/data/*.lst

