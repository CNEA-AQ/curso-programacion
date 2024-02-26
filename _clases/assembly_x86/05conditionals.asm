global _start

_start:
  mov eax,4       ;(sys_write)
  mov edx,len     ;message length
  mov ecx,msg     ;message to write
  mov ebx,1       ;file descriptor (stdout)
  int 0x80        ;call kernel

  mov eax,3       ;(sys_read)
  mov ebx,1       ;file descriptor (stdin)
  mov ecx, numero ;message to write
  int 0x80        ;call kernel

  jp  par
  jmp impar
par:
	mov eax,4
	mov ebx,1
	mov ecx,espar
	mov edx,lespar
	jmp fin
impar:
	mov eax,4
	mov ebx,1
	mov ecx,esimpar
	mov edx,lesimpar
	jmp fin

fin:
	mov eax,1
	mov ebx,0
	int 0x80

section .data:
  msg1 db 'Ingrese un numero',0xa ;mensaje
  len1 equ $ - msg1               ;length of our dear string
  msg2 db 'Su numero es',0xa      ;mensaje
  len2 equ $ - msg2               ;length of our dear string
                          
  espar db 'par.',0xa   	 ;mensaje
  lespar equ $ - espar	   	 ;length of our dear string
  esimpar db 'impar.',0xa    	 ;mensaje
  lesimpar equ $ - esimpar       ;length of our dear string
