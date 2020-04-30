#Détermine l'OS sur lequel est compilé le firmware
ifeq ($(OS),Windows_NT)
    detected_OS := Windows
else
    detected_OS := $(shell sh -c 'uname 2>/dev/null || echo Unknown')
endif

#Variables
NAME = swr_power_meter_f8kgl-
export PROCESSOR = 18f1320
export VERSION := V0.7
OUTPUT_TEST = $(NAME)$(VERSION).TEST.I2C.hex
OUTPUT_CALIBRATION = $(NAME)$(VERSION).CALIBRATION.hex
OUTPUT = $(NAME)$(VERSION).hex
ifeq ($(detected_OS),Linux)
export LKR_DIR =/usr/local/share/gputils/lkr/
else
export LKR_DIR =./
endif
export SCRIPT = $(LKR_DIR)$(PROCESSOR)_g.lkr
INC_DIR = -I../src/sw/inc/

#Tools
AS = gpasm
LD = gplink

#Flags
LDFLAGS = --map -c
DEBUG_LDFLAGS = -S2
ASFLAGS = -c -e ON -DSW_VERSION="\"$(VERSION)\""
export TEST_FLAGS = TEST
export CALIBRATION_FLAGS = CALIBRATION

#Composants
COMPS =tempo
COMPS +=lcd
COMPS +=i2c
COMPS +=eep
COMPS +=flh
COMPS +=adc
COMPS +=calc

#Sources
SRC_COMMUN = main.asm
SRC_COMMUN +=../src/sw/data/swversion.asm
SRC_COMMUN +=../src/sw/data/lcdmsg.asm
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
all : project $(OUTPUT_TEST)

rule_test : project $(OUTPUT_TEST)

#Règle du firmware de test
$(OUTPUT_TEST) : $(OBJS_TEST) $(LIBS_TEST)
	$(LD) $(LDFLAGS) $(DEBUG_LDFLAGS) -s $(SCRIPT) -o ../bin/$(OUTPUT_TEST) $^
	rm $^
	rm *.lst
	rm -f ../src/sw/data/*.lst

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
	find ../ -name '*.o' -exec rm -r {} \;
	find ../ -name '*.lst' -exec rm -r {} \;


project:
	mkdir -p ../bin
