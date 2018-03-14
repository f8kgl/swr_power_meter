NAME = swr_power_meter_f8kgl-
export VERSION := V0.5
OUTPUT = $(NAME)$(VERSION).hex

export PROCESSOR = 16f88
export LKR_DIR =/usr/share/gputils/lkr/
export SCRIPT = $(LKR_DIR)$(PROCESSOR).lkr
INC_DIR = -I../src/sw/inc/
LD = gplink
LDFLAGS = --map -c -s

COMPS = lcd
COMPS += eep
#COMPS +=calc
COMPS +=readadc

LIBS = $(COMPS:%=../bin/%.a)

all : $(OUTPUT)
	rm ../bin/*.a

$(OUTPUT) : main.o $(LIBS)
	$(LD) $(LDFLAGS) $(SCRIPT) -o ../bin/$(OUTPUT) main.o $(LIBS)
	rm main.o
	rm main.lst

../bin/%.a:
	make -C $(@:../bin/%.a=../src/sw/%)

main.o: main.asm
	gpasm -c -p $(PROCESSOR) $(INC_DIR) $<

clean:
	rm ../bin/*