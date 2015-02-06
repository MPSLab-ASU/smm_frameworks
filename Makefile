PROGRAM = test_stack_manager

INCLUDEDIRS=-I /home/jcai/Applications/gem5_smm/jcai/programs/smm/stack_management/stack_manager/
INCLUDE=-include stack_manager.h
LIBDIRS= 
LIBS = -lm 

OBJECTS = stack_manager.s example.s
CC=clang
CFLAGS = $(INCLUDEDIRS) $(INCLUDE) -O0
LDFLAGS = $(LIBDIRS) $(LIBS) -static -Wl,-T,spm.ld

all: $(PROGRAM)

$(PROGRAM): $(OBJECTS)
	$(CC) -o $@ $(OBJECTS) $(LDFLAGS)
	objdump -d $@ > $@.dis
%.s: %.c
	$(CC) -S $(CFLAGS) $< -o $@

clean:
	-rm -f  $(PROGRAM) *.s *.dis

	
