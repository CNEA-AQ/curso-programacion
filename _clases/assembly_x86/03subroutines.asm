;------------------------------
; Assembly (para Linux)
;------------------------------

section .text
  global _start
  
_start:
 mov eax, msg  ;move addr of msg into EAX
 call strlen   ;LLAMO SUBRUTINA! "strlen"

 mov edx, eax
                                           
 mov ecx,msg     ;message to write
 mov ebx,1       ;file descriptor (stdout)
 mov eax,4       ;(sys_write)
 int 0x80        ;call kernel
                                           
 mov eax,1       ;(sys_exit)
 mov ebx,0       ;error id
 int 0x80        ;call kernel

strlen:
  push ebx      ;push value in EBX onto stack to preserve it while subroutine is executed
  mov  ebx, eax ;move addr in EAX into EBX (both are pointed to the same addr)

next:
  cmp byte [eax], 0 ;comparar 
  jz fin       ;si el resultado es 0 (true) jump a "finished"
  inc eax      ;incrementar en 1 a eax 
  jmp next     ;saltar a "nextchar"

fin:
  sub eax,ebx
  pop ebx
  ret           ;FIN DE SUBRUTINA (volver)

section .data:
  msg db 'ola ameo, portate bien!',0xa   

