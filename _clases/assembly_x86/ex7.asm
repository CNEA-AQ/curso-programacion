global _start

_start:
	call fun
	mov eax, 1
	int 0x80

fun:
	mov ebx, 42
	;pop eax	;estas dos lineas
	;jmp eax	;hacen lo mismo que "ret".
	ret
