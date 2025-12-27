# Build script for Alt-BIOS
CC = gcc
AS = nasm
LD = ld

# Freestanding means "No Operating System"
CFLAGS = -m32 -ffreestanding -fno-pie -nostdlib
LDFLAGS = -m elf_i386 -T linker.ld

all: altbios.bin

boot.o: boot.asm
	$(AS) -f elf32 boot.asm -o boot.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

altbios.bin: boot.o main.o
	$(LD) $(LDFLAGS) boot.o main.o -o altbios.bin

clean:
	rm -f *.o altbios.bin
