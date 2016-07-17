CC=cc
CFLAGS=-c -Wall -m32
ASM=nasm
ASM_FLAGS=-f elf32
LINKER=ld
KERNEL_LDFLAGS=-m elf_i386 -T src/kernel/boot/init.ld
C_SOURCES=$(shell find . -name *.c)
ASM_SOURCES=$(shell find . -name *.asm)
C_OBJECTS=$(C_SOURCES:.c=.c.o)
ASM_OBJECTS=$(ASM_SOURCES:.asm=.asm.o)
KERNEL_NAME=pos-kernel

all: kernel
    
kernel: $(C_OBJECTS) $(ASM_OBJECTS) 
	$(LINKER) $(KERNEL_LDFLAGS) $(C_OBJECTS) $(ASM_OBJECTS) -o $(KERNEL_NAME)

%.c.o: %.c
	$(CC) $(CFLAGS) $< -o $@
    
%.asm.o: %.asm
	$(ASM) $(ASM_FLAGS) $< -o $@

clean:
	rm -f $(KERNEL_NAME) $(C_OBJECTS) $(ASM_OBJECTS)