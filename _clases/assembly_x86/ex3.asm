global _start

section .text

_start:
	mov ecx, 97
	mov ebx, 42
	mov eax,1
	cmp ecx, 100
	jg skip
	mov ebx, 13
	int 0x80
skip:
	int 0x80


;conditional jumps:
;	je	;==
;	jne	;!=
;	jg	;>
;	jge	;>=
;	jl	;<
;	jle	;<=
