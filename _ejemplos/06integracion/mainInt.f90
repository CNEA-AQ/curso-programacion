	program integracion
	implicit none
	real :: a,b
	integer :: n
	a=-10.; b=7.; n=100

	! Newton-Cotes : .................
	print*, "Integral analítica: ", I(b)-I(a)
	print*, "** Formulas CERRADAS ----------"
	print*, "Regla del rectangulo: ",rectangulo(a,b,n)	
	print*, "Regla del trapecio: ",  trapecio(a,b,n)
	print*, "Regla de simpson: ", simpson(a,b,n)
	print*, "Regla de 'Tres octavos': ", tresoctav(a,b,n)
	print*, "Regla de 'Cuatro nodos': ", cuatro(a,b,n)
	print*, "** Formulas ABIERTAS ----------"
	print*, "Regla del punto medio: ", puntomedio(a,b,n)
	print*, "n=1: ", n1(a,b,n)
	print*, "n=2: ", n2(a,b,n)
	print*, "n=3: ", n3(a,b,n)
	! .................................
	contains
	! Funcion a integrar:
		function f(x) result(y)
			implicit none
			real, intent(in) :: x
			real:: y
			y = x**3 + 14*x - 30
		end function f
	! Integral analítica (PRIMITIVA de f) evaluada en x:
		function I(x)
			implicit none
			real, intent(in) :: x
			real:: I
			I=(1/4.)*x**4 +7*(x**2)-30*x			
			return
		end function I
	! --------------------------------------------------- !
	! Formulas de Newton-Cotes (cerradas)
		! RECTANGULO
		function rectangulo(a,b,n)
		real, intent(in) :: a,b
		integer, intent(in) :: n
		real :: h, rectangulo
		integer :: i
		h=(b-a)/n
		rectangulo=0
		do i=1, n
			rectangulo=rectangulo+(h*f(a+h*i))
		end do
		return
		end function rectangulo
		! TRAPECIO:		
		function trapecio(a,b,n)
		real, intent(in) :: a,b
		integer, intent(in) :: n
		real :: h, trapecio
		integer :: i
		h=(b-a)/n
		trapecio=0
		do i=1, n
			trapecio=trapecio+(h*0.5*(f(a+h*i)+f(a+h*i-h)))
		end do
		return
		end function trapecio
		! SIMPSON:
		function simpson(a,b,n)
		real, intent(in) :: a,b
		integer, intent(in) :: n
		real :: h, simpson
		integer :: i
		h=(b-a)/(n-1)
		if (MOD(n,2)==0) then
			i=1		
			simpson=(f(a+h*i)+f(a+h*i-h))*0.5*h
		else
			i=0
			simpson=0
		end if
		do i=i+1,n-2,2
			!print*,i
			simpson=simpson+(h/3.)*(f(a+h*i-h)+4*f(a+h*i)+f(a+h*i+h))   
		end do
		return
		end function simpson

		! "Tres-octavos"
		function tresoctav(a,b,n)
		real, intent(in) :: a,b
		integer, intent(in) :: n
		real :: h, tresoctav
		integer :: i
		h=(b-a)/(n-1)
		if (MOD(n,2)==1) then
			i=1		
			tresoctav=(f(a+h*i)+f(a+h*i-h))*0.5*h
		else
			i=0
			tresoctav=0
		end if
		do i=i+1,n-3,3
			!print*,i
   			tresoctav=tresoctav+  f(a+h*i-h)   *(3.*h/8.)
			tresoctav=tresoctav+3*f(a+h*i)     *(3.*h/8.)
			tresoctav=tresoctav+3*f(a+h*i+h)   *(3.*h/8.)
			tresoctav=tresoctav+  f(a+h*i+h+h)*(3.*h/8.)
		end do
		return
		end function tresoctav
		! "n=4"
		function cuatro(a,b,n)
		real, intent(in) :: a,b
		integer, intent(in) :: n
		real :: h, cuatro
		integer :: i
		h=(b-a)/(n-1)
		if (MOD(n,2)==0) then
			i=1		
			cuatro=(f(a+h*i)+f(a+h*i-h))*0.5*h
		else
			i=0
			cuatro=0
		end if
		do i=i+1,n-4,4
			cuatro=cuatro+7 *f(a+h*i-h)  *(2.*h/45.)
			cuatro=cuatro+32*f(a+h*i)    *(2.*h/45.)
			cuatro=cuatro+12*f(a+h*i+h)  *(2.*h/45.)
			cuatro=cuatro+32*f(a+h*i+h*2)*(2.*h/45.)
			cuatro=cuatro+7 *f(a+h*i+h*3)*(2.*h/45.)
		end do
		return
		end function cuatro
	! --------------------------------------------------- !
	! Formulas de Newton-Cotes (abiertas)

		function puntomedio(a,b,n)
		real, intent(in) :: a,b
		integer, intent(in) :: n
		real :: h, puntomedio
		integer :: i
		h=(b-a)/(n+2)
		do i=0,n,2
			puntomedio=puntomedio+h*2*f(a+i*h)
		end do
		return
		end function puntomedio	
		function n1(a,b,n)
		real, intent(in) :: a,b
		integer, intent(in) :: n
		real :: h, n1
		integer :: i
		h=(b-a)/(n+2)
		do i=0,n-1,3
			n1=n1+(3*h/2)*(f(a+i*h)+f(a+i*h+h))
		end do
		return
		end function n1
		function n2(a,b,n)
		real, intent(in) :: a,b
		integer, intent(in) :: n
		real :: h, n2
		integer :: i
		h=(b-a)/(n+2)
		do i=0,n-2,4
			n2=n2+(4*h/3)*(2*f(a+i*h)-f(a+i*h+h)+2*f(a+i*h+2*h))
		end do
		return
		end function n2	
		function n3(a,b,n)
		real, intent(in) :: a,b
		integer, intent(in) :: n
		real :: h, n3
		integer :: i
		h=(b-a)/(n+2)
		do i=0,n,5
			n3=n3+(5*h/24)*(11*f(a+i*h)+f(a+i*h+h))
			n3=n3+(5*h/24)*(f(a+i*h+2*h)+11*f(a+i*h+3*h))
		end do
		return
		end function n3		
	end program integracion
