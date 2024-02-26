;-------------------------------------
; Assembly (para Linux)
;    "Hello world!"
;-------------------------------------

section .text       ;code segment
  global _start     ;must be declared for linker 
  
_start:            ;tell linker entry point

   mov eax,4       ;(sys_write)
   mov edx,len     ;message length
   mov ecx,msg     ;message to write
   mov ebx,1       ;file descriptor (stdout)
   int 0x80        ;call kernel

   mov eax,1       ;(sys_exit)
   mov ebx,0       ;error id
   int 0x80        ;call kernel

section .data:
   msg db 'hola mundo!',0xa    ;our dear string
   len equ $ - msg             ;length of our dear string

