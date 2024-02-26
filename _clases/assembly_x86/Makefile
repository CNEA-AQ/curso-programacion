script: script.o
	ld script.o -o script
script.o: script.asm
	nasm -f elf script.asm
clean:
	rm *.o script
