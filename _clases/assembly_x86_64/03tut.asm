;Math and STACK
section .data
	digit db 0,10

section .text
global _start

_start:
;	add rax,5	;rax=rax+5
;	sub rax,rbx	;rax=rax-rbx
;	mul 2		;rax*=2
;	div 2		;rax/=2
;	inc rax		;rax+1
;	dec rax		;rax-1
;	adc rax,rbx	;rax=rax+rbx+CF
;	sbb rax,rbx	;rax=rax-rbx-CF

	;ASCII-extended (8-bit code)

	push 3
	push 8
	push 7

	pop rax
	call _printRAXDigit
	pop rax
	call _printRAXDigit
	pop rax
	call _printRAXDigit
	pop rax
	call _printRAXDigit

	call _end

_printRAXDigit:
	add rax,48	;en ascii los numeros empiezan en el 48
	mov [digit],al
	mov rax,1
	mov rdi,1
	mov rsi, digit
	mov rdx, 2
	syscall
	ret

_end:
	mov rax,60
	mov rdi,0	
	syscall
