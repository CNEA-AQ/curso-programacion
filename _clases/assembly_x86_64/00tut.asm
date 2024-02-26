;SECTIONS
;.data
;.bss	
;.text
;


;REGISTERS:
;64-bit		32-bit		16-bit	8-bit
;rax		eax		ax	al
;rbx		ebx		bx	bl
;rcx		ecx		cx	cl
;rdx		edx		dx	dl
;
;rsi
;rdi
;	

;SYSCALL
;cuando el programa hace una llamada al kernel del SO
;
;arg1 	arg2	arg3	arg4	arg5	arg6
;rax	rdi	rsi	rdx	

;sys_write:
;	file descriptor 0(stdin) 1(stdout) 2(stderr)

;FLAGS
;son registros que solo guardan 1 bit
;CF (carry)	PF(parity)	ZF(zero)	SF(sign)	OF(overflow)	AF(adjust)	IF(interrupt enabled)
;

;POINTERS
;registros que guardan datos del adress
;RIP (EIP,IP)	index pointer		points to next address to be executed in the control flow
;RSP (ESP,SP)	stack pointer		points to the top address of the stack
;RBP (EBP,BP)	stack base pointer	points to the bottom of the stack

text db "Hello, World!", 10    ;db=byte
