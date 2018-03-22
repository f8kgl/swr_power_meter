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
LDFLAGS = --map -c -s
ASFLAGS = -c
export TEST_FLAGS = TEST
export CALIBRATION_FLAGS = CALIBRATION

#Composants
COMPS = lcd
COMPS += eep
#COMPS +=calc
COMPS +=readadc

#Librairies
LIBS_TEST = $(COMPS:%=../bin/%.TEST.a)
LIBS_CALIBRATION = $(COMPS:%=../bin/%.CALIBRATION.a)
LIBS = $(COMPS:%=../bin/%.a)

#Rules
all : $(OUTPUT_TEST)
	rm ../bin/*.a

rule_test : $(OUTPUT_TEST)
	rm ../bin/*.a

$(OUTPUT_TEST) : main.TEST.o cal.TEST.o $(LIBS_TEST)
	$(LD) $(LDFLAGS) $(SCRIPT) -o ../bin/$(OUTPUT_TEST) main.TEST.o cal.TEST.o $(LIBS_TEST)
	rm main.TEST.o
	rm main.TEST.lst
	rm cal.TEST.o
	rm cal.TEST.lst

../bin/%.TEST.a:
	make -C $(@:../bin/%.TEST.a=../src/sw/%)

main.TEST.o: main.asm
	$(AS) $(ASFLAGS) -D$(TEST_FLAGS) -p $(PROCESSOR) $(INC_DIR) -o $@ $<

cal.TEST.o: cal.asm
	$(AS) $(ASFLAGS) -D$(TEST_FLAGS) -p $(PROCESSOR) $(INC_DIR) -o $@ $<

clean:
	rm ../bin/*
