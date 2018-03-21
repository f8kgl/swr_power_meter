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
CALIBRATION_ADDR = 0x1000

#Tools
AS = gpasm
LD = gplink

#Flags
LDFLAGS = --map -c -s
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

$(OUTPUT_TEST) : main.o cal.o $(LIBS_TEST)
	$(LD) $(LDFLAGS) $(SCRIPT) -o ../bin/$(OUTPUT_TEST) main.o $(LIBS_TEST)
	rm main.o
	rm main.lst
	rm cal.o
	rm cal.lst

../bin/%.TEST.a:
	make -C $(@:../bin/%.TEST.a=../src/sw/%)

main.o: main.asm
	gpasm -c -D $(TEST_FLAGS) -p $(PROCESSOR) $(INC_DIR) $<

cal.o: cal.asm
	gpasm -c -D $(TEST_FLAGS) -p $(PROCESSOR) -D__SW_CALIBRATION_FLH_ADDR=$(CALIBRATION_ADDR) $(INC_DIR) $<

clean:
	rm ../bin/*
