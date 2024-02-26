---
title: Assembly x86 (32-bits)
descripcion: Sintaxis básica de Assembly ó Assembler
date: 2022-01-01
nav_order: 6
phony: true
noclass: true
ready: false
---

> El lenguaje ensamblador (en inglés:*assembly* y la abreviación asm) es un lenguaje de programación de bajo nivel. Consiste en un conjunto de mnemónicos que representan instrucciones básicas para los computadores, microprocesadores, microcontroladores y otros circuitos integrados programables.

Este documento describe la sintaxis para núcleo Linux en procesadores intel x86 (32-bits).

Ensablador es un lenguaje de *bajo nivel* de abstracción, esto le otorga las sieguientes características: 
	- Dificil de leer y escribir por humanos.
	- Requiere muchas más lineas de código que un lenguaje de alto nivel.
	- Mayor control sobre el proceso a programar ya que se explicita el uso de memoria y recursos.
	- Poco portable (depende de la arquitectura de la cpu)

## Hola mundo!

Un programa de ensamblador extremadamente simple se vería así:

```assembly 
section .text      ;code segment
  global _start    ;must be declared for linker 

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
   msg db 'Hola mundo!',0xa    ;our dear string
   len equ $ - msg             ;length of our dear string
```

## Compilación y ejecución:
Primero es necesario conseguir un compilador, por ejemplo ``nasm``, en linux se puede obtener con: ``sudo apt-get install nasm``

Luego si el programa fue escrito en el archivo ``prueba.asm`` entonces se compila: 

```bash
$> nasm -f elf prueba.asm
```

se va a generar un archivo *prueba.o* que hay que linkiarlo al ejecutable:

```bash
$> ld prueba.o -o prueba.exe
```                  

Luego para ejecutar el programa:
```bash
$> ./prueba.exe
```


## Estructura

La estructura general de un problema de ensamblador se muestra a continuación:
```assembly
;asi se comenta
section .text	;seccion de instrucciones
global _start 	;
_start:       	;funcion principal

section .bss	;seccion para reservar espacio para variables.

section .data	;seccion para definir static-data.
```

## Comandos:
La sintaxis general es:

```assembly
	[label]   COM   [operandos]   ;comentario
```
donde `COM` es el comando a ser ejecutado. 
Los principales comandos son:
- ``MOV`` <var>, <value>  : mueve *<value>* a la variable *<var>*
- ``JMP``
- ``PUSH``
- ``POP``


## Registros: 
Son pequeños fragmentos de memoria en la cpu.

### Registros de Proposito General 
 - De datos: (32/16-bits):
	En estos se puede almacenar valores de variables.
  + `EAX`/`AX`: (acumulador) 
  + `EBX`/`BX`: (base)	      	
  + `ECX`/`CX`: (contador)
  + `EDX`/`DX`: (data)

A su vez los registros de 16-bits se dividen en dos registros de 8-bits *xL* y *XH*.
Los nombres son historicos, cualquiera de ellos puede utilizarse para cualquier función.

 - De punteros:
  + `ESP`/`SP`:	(Stack pointer)
  + `EBP`/`BP`:	(Base pointer)
  + `EIP`:	(Instruction pointer)

 - De indices
  + `ESI`/`SI`	(Source Index)
  + `EDI`/`DI`	(Destination Index)

### Registros de Control
Luego de cada operación estos registros son actualizados y brindan información util para el flujo del programa.
  + `OF` (overflow). 
  + `DF` (direction).
  + `IF` (interrupt).
  + `TF` (trap).
  + `SG` (sign).
  + `ZF` (zero).
  + `PF` (parity).
  + `CF` (carry).

### Registros de Segmentos:
  + `.text` (`CS`, code segment)	
  + `.data` (`DS`, data segment)
  + `.bss `  (`SS`, stack segment)


## STACK
Es un array en memoria de *acceso random*, tiene estructura de datos tipo **"LIFO"**.

;Subrutinas:
;CALL
;RET


### Operaciones de sistema:
Los códigos de estas llamadas al kernel del sistema operativo dependen justamente del sistema en que se ejecuta. En el caso de linux, algunas operaciones son:

|id|operacion  	 |eax |ebx                   |ecx            |edx        |esi|edi|def			         |
|--|------------ |----|--------------------- |-------------- |---------- |---|---|------------------------------ |
|0 |`sys_restart`|0x00|                      |-              |           |   |   |`kernel/signal.c:2058		`|		
|1 |`sys_exit   `|0x01|int error_code        |-              |           |   |   |`kernel/exit.c:1046		`|
|2 |`sys_fork   `|0x02|struct pt_regs *      |-              |           |   |   |`arch/alpha/kernel/entry.S:716`|
|3 |`sys_read   `|0x03|unsigned int fd       |char           |size_t     |   |   |`fs/read_write.c:391   	`|
|4 |`sys_write  `|0x04|unsigned int fd       |const char     |size_t     |   |   |`fs/read_write.c:408		`|
|5 |`sys_open   `|0x05|const char <filename> |int flags      |int mode   |   |   |`fs/open.c:900		`|
|6 |`sys_close  `|0x06|unsigned int fd       |-              |           |   |   |`fs/open.c:969		`|
|7 |`sys_waitpid`|0x07|pid_t pid             |int <stat_addr>|int options|   |   |`kernel/exit.c:1771     	`|	
|8 |`sys_creat  `|0x08|const char <pathname> |int mode       |           |   |   |`fs/open.c:933   		`|	
|9 |`sys_link   `|0x09|const char <oldname>  |const <newname>|           |   |   |`fs/namei.c:2520		`|	


Estas llamadas se ejecutan con: ``INT 0x80``

###Adressing modes
- Register addressing

- Immediate addressing

- Memory addressing

```assembly 
;Secciones:
;.data
;.bss	
;.text
;


;Registros:
;64-bit		32-bit		16-bit	8-bit
;rax		eax		ax	al
;rbx		ebx		bx	bl
;rcx		ecx		cx	cl
;rdx		edx		dx	dl
;
;rsi
;rdi
;	

;SYSCALL:
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

;Pointers:
;registros que guardan datos del adress
;RIP (EIP,IP)	index pointer		points to next address to be executed in the control flow
;RSP (ESP,SP)	stack pointer		points to the top address of the stack
;RBP (EBP,BP)	stack base pointer	points to the bottom of the stack

text db "Hello, World!", 10    ;db=byte
```

