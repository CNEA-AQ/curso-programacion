!=========================================================!
!            F O R T R A N   A V A N Z A D O              !
!                 04 -  P O I N T E R S                   !
!                                                         !
!  AUTOR:    Ramiro A. Espada                             !
!  CREACION: Enero 2019                                   !
!                                                         !
!  OBJETIVO:                                              !
!                                                         !
!=========================================================!
!http://www.pcc.qub.ac.uk/tec/courses/f90/stu-notes/F90_notesMIF_12.html
     	program pointers
          	implicit none
          
          	real, target	:: vecino
          	real, pointer	:: yo
          
          	yo => vecino
          
          	yo=1.0
          
          	print*,"vecino: ",vecino,". yo: ",yo
          
          	vecino=3.0
          
          
          	print*,"vecino: ",vecino,". yo: ",yo
          
          
          	yo=5.0
          
          	print*,"vecino: ",vecino,". yo: ",yo
          
          
          	nullify(yo)    !Desasociar
          	associated(yo) !pregunta si está asociado
          
          
          
     	end program 
ccc  POINTERS:
c	Son un tipo de variables capaces de almacenar data guardada en otras variables (targets).
c	Son una alternativa flexible a arrays allocatables
c	Útiles para manipular estructuras de datos dinámicos (linked lists)
c

c     Los pointers pueden pensarse como variables que están dinámicamente asociadas con alguna variable "target". Decimos que los pointers "apuntan a" sus targets.
c	Los "targets" pueden ser:
c	     Variables del mismo tipo que l pointer y declarado explicitamente como TARGET.
c	    Otros pointers del mismo tipo.
c	    Memoria allocatada para el pointer.



cc Asignación:
c	=>	(asociacion)
c	=	(asignacion de valor)
 	INTEGER, POINTER :: pt
	INTEGER, TARGET :: x=34, y=0

	pt => x ! pt points to x
	y = pt ! y equals x
	pt => y ! pt points to y
	pt = 17 ! y equals 17

cc Desreferenciación:
c	Los pointers se desreferencian automaticamente cuando:
c		- Aparecen en una expresiond e I/O
c		- Aparecen en alguna expresion


cc Facts:
c 	are inerently allocatables
c 	must have the same type as its target


