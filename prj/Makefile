#Détermine l'OS sur lequel est compilé le firmware
ifeq ($(OS),Windows_NT)
    detected_OS := Windows
else
    detected_OS := $(shell sh -c 'uname 2>/dev/null || echo Unknown')
endif

#Variables
NAME = swr_power_meter_f8kgl-
export PROCESSOR = 18f1320
export VERSION := V0.8
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
GPSIM_FLAGS := Y # mettre n pour la version non GPSIM
#export DEBUG_ISSUE_n =
ifeq ($(GPSIM_FLAGS),n)
export DEBUG_ISSUE_n =
OUTPUT_TEST = $(NAME)$(VERSION).TEST.hex
OUTPUT_CALIBRATION = $(NAME)$(VERSION).CALIBRATION.hex
OUTPUT = $(NAME)$(VERSION).hex
else
export DEBUG_ISSUE_n =
export DEBUG_ISSUE_n = -DDEBUG_ISSUE_379 -DDEBUG_ISSUE_380 -DDEBUG_ISSUE_389
OUTPUT_TEST = $(NAME)$(VERSION).TEST.GPSIM.hex
OUTPUT_CALIBRATION = $(NAME)$(VERSION).CALIBRATION.GPSIM.hex
OUTPUT = $(NAME)$(VERSION).GPISM.hex
endif

#Composants
COMPS =misc
COMPS +=lcd
COMPS +=i2c
COMPS +=eep
COMPS +=adc
COMPS +=calc
COMPS +=bp
COMPS +=log
COMPS +=flh

#Sources
SRC_COMMUN = main.asm
SRC_COMMUN +=../src/sw/data/eep_int.asm
SRC_COMMUN +=../src/sw/data/lcdmsg.asm
SRC_COMMUN +=../src/sw/data/10logADC.asm
#CALIBRATION_SRC = ../src/sw/data/eep_ext.asm

#Objets
OBJS_COMMUN_TEST = $(SRC_COMMUN:%.asm=%.TEST.o)
OBJS_TEST = $(OBJS_COMMUN_TEST)
OBJS_COMMUN_xWATT = $(SRC_COMMUN:%.asm=%.xWATT.o)
OBJS_xWATT = $(OBJS_COMMUN_xWATT)


#Librairies
LIBS_TEST = $(COMPS:%=../bin/libtest%.a)
LIBS_CALIBRATION = $(COMPS:%=../bin/libcalib%.a)
LIBS_xWATT = $(COMPS:%=../bin/%.xWATT.a)

#Rules
all : project calibration_gpsim update_gpsim_prj $(OUTPUT_TEST) $(OUTPUT_CALIBRATION) $(OUTPUT_xWATT)

rule_test : project $(OUTPUT_TEST)

rule_calibration : project $(OUTPUT_CALIBRATION)

xWATT : project $(OUTPUT_xWATT)

#Règle du firmware de test
$(OUTPUT_TEST) : $(OBJS_TEST) $(LIBS_TEST)
	$(LD) $(LDFLAGS) $(DEBUG_LDFLAGS) -s $(SCRIPT) -o ../bin/$(OUTPUT_TEST) $^
	rm $^
	rm *.lst
	rm -f ../src/sw/data/*.lst
	
#Règle du firmware de calibration
$(OUTPUT_CALIBRATION) : 
	rm $^
	rm *.lst
	rm -f ../src/sw/data/*.lst

#Règle des firmware operationnel
$(OUTPUT_xWATT) : $(OBJS_xWATT) $(LIBS_xWATT)
	$(LD) $(LDFLAGS) -DxWATT $(DEBUG_LDFLAGS) -s $(SCRIPT) -o ../bin/$(OUTPUT) $^
	rm $^
	rm *.lst
	rm -f ../src/sw/data/*.lst

#Règle d'une librairie de test (ie compilation des composants sw)
../bin/libtest%.a:
	make -C $(@:../bin/libtest%.a=../src/sw/%)
	
#Règle d'une librairie du fw opérationnel (ie compilation des composants sw)
../bin/lib%.xWATT.a:
	make -C $(@:../bin/lib%.xWATT.a=../src/sw/%)
		

#Règle d’un objet de test (ie compilation des sources commun avec le flag TEST)
%.TEST.o : %.asm
	$(AS) $(ASFLAGS)  -D$(TEST_FLAGS) $(DEBUG_ISSUE_n) -p $(PROCESSOR) $(INC_DIR) -o $@ $<

#Règle d’un objet opérationnel (ie compilation des sources commun)
%.SWR_POWER_METER.o : %.asm
	$(AS) $(ASFLAGS) -DSWR_POWER_METER $(DEBUG_ISSUE_n) -p $(PROCESSOR) $(INC_DIR) -o $@ $<
%.xWATT.o : %.asm
	$(AS) $(ASFLAGS) -DxWATT $(DEBUG_ISSUE_n) -p $(PROCESSOR) $(INC_DIR) -o $@ $<


clean:
	rm -f *.o
	rm -f *.lst
	rm -f ../bin/*.stc
	rm -f ../bin/swr_power_meter_f8kgl*
	find ../ -name '*.o' -exec rm -r {} \;
	find ../ -name '*.lst' -exec rm -r {} \;


project:
	mkdir -p ../bin
	cp ../prj/swr_power_meter.stc ../bin
	cp ../src/hw/sim/gpsim/netlist.stc ../bin
	cp ../src/tools/gen_table/10logADC.inc ../src/sw/inc

update_gpsim_prj:
	cp ../prj/swr_power_meter.stc ../bin
	cp ../src/hw/sim/gpsim/netlist.stc ../bin


calibration_gpsim:
	gcc $(DEBUG_ISSUE_n) -Wall ../src/tools/calibrator/calibrator.c -o ../src/tools/calibrator/calibrator -lm
	../src/tools/calibrator/calibrator -t -a 2 -p 0.000001 -f
	mv kconv*.hex ../bin
