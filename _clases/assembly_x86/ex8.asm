global _start

_start:
	call fun
	mov eax,1
	int 0x80

fun:
	;prolog: ------------
	push ebp
	mov ebp, esp
	sub esp,2
	;--------------------
	mov [esp], byte 'H'
	mov [esp+1], byte 'i'
	mov eax,4
	mov ebx,1
	mov ecx,esp
	mov edx,2
	int 0x80
	;epilog: restore vars
	mov esp,ebp
	pop ebp
	;--------------------
	ret
