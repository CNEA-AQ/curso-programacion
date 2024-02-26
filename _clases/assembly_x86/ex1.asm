global _start
start:
	mov ebx, 42	;ebx=42
	mov eax, 1	;eax=1
	int 0x80	;llamada a sistema

	;Aritmetica
	mov ebx, 132	;ebx=132
	mov eax, ebx	;eax=ebx
	add ebx, ecx	;ebx+=ecx
	sub ebx, edx	;ebx-=edx
	mul ebx		;eax*=ebx
	div edx		;eax/=edx
