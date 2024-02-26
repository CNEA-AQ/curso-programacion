	program integracion
	implicit none

	contains
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
	end module
