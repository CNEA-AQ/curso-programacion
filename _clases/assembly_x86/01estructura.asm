;--------------------------------
; Assembly (para Linux)
;	Estructura + stdin
;--------------------------------
section .data:
  msg1 db 'Introduzca su nombre: ' ;mensaje
  len1 equ $ - msg1               ;length of our dear string
  msg2 db 'Hola '  	 	  ;mensaje
  len2 equ $ - msg2               ;length of our dear string

section .bss
  nombre: resb 255


section .text     ;code segment
  global _start   ;must be declared for linker 
  
_start:           ;tell linker entry point

   call _askinput
   call _getinput
   call _saludo
   call _exit

_askinput:
   mov eax,4       ;(sys_write)
   mov edx,len1    ;message length
   mov ecx,msg1    ;message to write         
   mov ebx,1       ;file descriptor (stdout)  
   int 0x80        ;call kernel               
   ret
 
_getinput: 
  mov eax,3       ;(sys_read)
  mov ebx,1       ;file descriptor (stdin)
  mov ecx, nombre ;message to write
  int 0x80        ;call kernel
  ret

_saludo: 
  mov ecx, msg2
  mov edx, len2
  mov eax, 4
  mov ebx, 1
  int 0x80

  mov ecx, nombre
  mov edx, 10
  mov eax, 4
  mov ebx, 1 
  int 0x80

  mov ecx, 0xa
  int 0x80  
  ret


_exit:
   mov eax,1      ;(sys_exit)
   mov ebx,0      ;error id
   int 0x80       ;call kernel

