section .text:
	global _start

_start:
	mov eax,1
	mov ebx,0
	and eax,ebx
	
	mov ecx,eax
	mov eax,4       ;(sys_write)
	mov edx,1       ;message length
	mov ebx,1       ;file descriptor (stdout)
	int 0x80        ;call kernel

	call _exit

_exit:
	mov eax,1
	mov ebx,0
	int 0x80
