global _start

section .text
_start:
	mov eax, 4	
	mov ebx, 1
	mov ecx, 1
	call contador

contador:
	sub 10, ecx
	jz fin
	inc ecx, 1
	jmp contador
	
	int 0x80
