script: script.asm
	nasm -f elf64 script.asm -o script.o
	ld script.o -o script
clean:
	rm *.o script
