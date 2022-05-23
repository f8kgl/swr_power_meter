#Détermine l'OS sur lequel est compilé le firmware
ifeq ($(OS),Windows_NT)
    detected_OS := Windows
else
    detected_OS := $(shell sh -c 'uname 2>/dev/null || echo Unknown')
endif

#Variables
NAME = f8kgl-
xWATT_HW = xWATT_meter_
SWR_POWER_METER_HW = swr_power_meter_
export PROCESSOR = 18f1320
export VERSION := V1.0
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
OUTPUT_TEST = $(SWR_POWER_METER_HW)$(NAME)$(VERSION).TEST.hex
else
export DEBUG_ISSUE_n =
export DEBUG_ISSUE_n = -DDEBUG_ISSUE_379 -DDEBUG_ISSUE_380 -DDEBUG_ISSUE_389
OUTPUT_TEST = $(xWATT_HW)$(NAME)$(VERSION).TEST.GPSIM.hex
endif
OUTPUT_CALIBRATION = $(SWR_POWER_METER_HW)$(NAME)$(VERSION).CALIBRATION.hex
OUTPUT_CALIBRATION += $(xWATT_HW)$(NAME)$(VERSION).CALIBRATION.hex

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

#Objets
OBJS_COMMUN_TEST = $(SRC_COMMUN:%.asm=%.TEST.o)
OBJS_TEST = $(OBJS_COMMUN_TEST)
OBJS_TEST += ../src/sw/data/10logADC.TEST.o
OBJS_xWATT_CALIBRATION = $(SRC_COMMUN:%.asm=%.xWATT.CALIBRATION.o)
OBJS_xWATT_CALIBRATION += ../src/sw/data/10logADC.xWATT.CALIBRATION.o
OBJS_SWR_POWER_METER_CALIBRATION = $(SRC_COMMUN:%.asm=%.SWR_POWER_METER.CALIBRATION.o)
OBJS_SWR_POWER_METER_CALIBRATION +=../src/sw/data/10logADC.SWR_POWER_METER.CALIBRATION.o

#Librairies
LIBS_TEST = $(COMPS:%=../bin/libtest%.a)
LIBS_xWATT_CALIBRATION = $(COMPS:%=../bin/libcalib%.xWATT.a)
LIBS_SWR_POWER_METER_CALIBRATION = $(COMPS:%=../bin/libcalib%.SWR_POWER_METER.a)

#Rules
all : project update_gpsim_prj test calibration operationnel

test : project $(OUTPUT_TEST)

calibration : project $(OUTPUT_CALIBRATION)

clean:
	rm -f *.o
	rm -f *.lst
	rm -f ../bin/*.stc
	rm -f ../bin/swr_power_meter*
	rm -f ../bin/xWATT*
	rm -f ../bin/lib*
	find ../ -name '*.o' -exec rm -r {} \;
	find ../ -name '*.lst' -exec rm -r {} \;

project:
	mkdir -p ../bin
	cp ../prj/*.stc ../bin
	cp ../src/hw/sim/gpsim/netlist.stc ../bin
	cp ../src/tools/gen_table/10logADC.inc ../src/sw/inc

update_gpsim_prj:
	cp ../prj/swr_power_meter.stc ../bin
	cp ../src/hw/sim/gpsim/netlist.stc ../bin


calibration_gpsim:
	gcc $(DEBUG_ISSUE_n) -Wall ../src/tools/calibrator/calibrator.c -o ../src/tools/calibrator/calibrator -lm
	../src/tools/calibrator/calibrator -t -a 2 -p 0.000001 -f
	../src/tools/calibrator/calibrator -t -a 2 -p 0.000001 -r
	mv kconv*.hex ../bin


#Règle du firmware de test
$(OUTPUT_TEST) : $(OBJS_TEST) $(LIBS_TEST)
	$(LD) $(LDFLAGS) $(DEBUG_LDFLAGS) -s $(SCRIPT) -o ../bin/$(OUTPUT_TEST) $^
	rm $^
	rm *.lst
	rm -f ../src/sw/data/*.lst

#Règle du firmware de calibration
xWATT%.CALIBRATION.hex : $(OBJS_xWATT_CALIBRATION) $(LIBS_xWATT_CALIBRATION)
	$(LD) $(LDFLAGS) $(DEBUG_LDFLAGS) -s $(SCRIPT) -o ../bin/xWATT%.CALIBRATION.hex $^
	rm $^
	rm *.lst
	rm -f ../src/sw/data/*.lst
swr_power_meter%.CALIBRATION.hex : $(OBJS_SWR_POWER_METER_CALIBRATION) $(LIBS_SWR_POWER_METER_CALIBRATION)
	$(LD) $(LDFLAGS) $(DEBUG_LDFLAGS) -s $(SCRIPT) -o ../bin/xWATT%.CALIBRATION.hex $^
	rm $^
	rm *.lst
	rm -f ../src/sw/data/*.lst


#Règle d'une librairie de test (ie compilation des composants sw)
../bin/libtest%.a:
	make -C $(@:../bin/libtest%.a=../src/sw/%) ../../$@

#Règle d'une librairie de calibration
../bin/libcalib%.xWATT.a:
	make -C $(@:../bin/libcalib%.xWATT.a=../src/sw/%) ../../$@
../bin/libcalib%.SWR_POWER_METER.a:
	make -C $(@:../bin/libcalib%.SWR_POWER_METER.a=../src/sw/%) ../../$@


#Règle d’un objet de test (ie compilation des sources commun avec le flag TEST)
%.TEST.o : %.asm
	$(AS) $(ASFLAGS) -DTEST $(DEBUG_ISSUE_n) -p $(PROCESSOR) $(INC_DIR) -o $@ $<

#Règle d’un objet de calibration
%.SWR_POWER_METER.CALIBRATION.o : %.asm
	$(AS) $(ASFLAGS) -DSWR_POWER_METER -DCALIBRATION $(DEBUG_ISSUE_n) -p $(PROCESSOR) $(INC_DIR) -o $@ $<
%.xWATT.CALIBRATION.o : %.asm
	$(AS) $(ASFLAGS) -DxWATT -DCALIBRATION $(DEBUG_ISSUE_n) -p $(PROCESSOR) $(INC_DIR) -o $@ $<
