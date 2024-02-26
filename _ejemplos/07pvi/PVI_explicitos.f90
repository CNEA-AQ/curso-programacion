	program PVI
	! Resuelve ODEs de la forma y'= f(y,t)
		implicit none
		integer, parameter :: n=30
		real, allocatable :: t(:),y(:)
		real :: h
		integer :: i
		h=.1
		t=(/(i,i=0,n-1)/); t=t*h

		!y=Euler(yo=.5,t=t,h=h)
		!y=MidPoint(yo=.5,t=t,h=h)
		!y=Heun(yo=.5,t=t,h=h)
		!y=RK2(yo=.5,t=t,h=h)
		!y=RK4(yo=.5,t=t,h=h)
		! Save data:
		open (unit = 1, file = "values")
		do i=1,n
			write(1,*) t(i),y(i)
		end do
		close(1)
		! Plot:
		CALL SYSTEM('gnuplot -p pvi_plot.plt')
	!..............................................
		contains
		! Función:
		function f(t,y)
			real :: t,y,f
			f=log(y**(-2)+sin(y))*t
			return
		end function f	
	! METODOS EXPLICITOS ---------------------------
		! EULER:
		function Euler(yo,t,h)	result(u)
			real, intent(in) :: t(:),yo,h
			real, allocatable :: u(:)
			allocate(u(n));u=0
			u(1)=yo
			do i=1,n-1
			   u(i+1)=u(i)+h*f(t(i),u(i))
			end do
		end function Euler
		function Midpoint(yo,t,h)	result(u)
			real, intent(in) :: t(:),yo,h
			real, allocatable :: u(:)
			allocate(u(n));u=0
			u(1)=yo
			do i=1,n-1
				if (i==1) then
				   u(i+1)=u(i)+h*f(t(i),u(i))
				else
				   u(i+1)=u(i-1) + 2*h*f(t(i),u(i))
				end if
			end do
		end function Midpoint
		! RUNGE KUTTA Orden 2
		function RK2(yo,t,h)	result(u)
			real, intent(in) :: t(:),yo,h
			real, allocatable :: u(:)
			allocate(u(n));u=0
			u(1)=yo
			do i=1,n-1
			   u(i+1)=u(i)+h*f( t(i)+h*0.5, u(i)+h*0.5*f(t(i),u(i)))
			end do
		end function RK2
		! RUNGE KUTTA Orden 4
		function RK4(yo,t,h)	result(u)
			real, intent(in) :: t(:),yo,h
			real, allocatable :: u(:)
			real :: k1,k2,k3,k4
			allocate(u(n));u=0
			u(1)=yo
			do i=1,n-1
			   k1=h*f(t(i), u(i))
			   k2=h*f(t(i)+h*0.5, u(i)+0.5*k1)
			   k3=h*f(t(i)+0.5*h, u(i)+0.5*k2)
			   k4=h*f(t(i), u(i)+k3)		
			  u(i+1)=u(i)+(k1+2*k2+2*k3+k4)/6
			end do
		end function RK4
		! HEUN
		function Heun(yo,t,h)	result(u)
			real, intent(in) :: t(:),yo,h
			real, allocatable :: u(:)
			allocate(u(n));u=0
			u(1)=yo
			do i=1,n-1
			  u(i+1)=u(i)+h*f(t(i),u(i))!Predictor
			  u(i+1)=u(i)+h*0.5*(f(t(i),u(i))+f(t(i+1),u(i+1)))!Corrector
			end do
		end function Heun
	!	! Euler Modificado
	!	function Euler2(yo,t,h)	result(u)
	!		real, intent(in) :: t(:),yo,h
	!		real, allocatable :: u(:)
	!		allocate(u(n));u=0
	!		u(1)=yo
	!		do i=1,n-1
	!		   u(i+1)=u(i)+h*f(u(i),t(i))
	!		end do
	!	end function Euler2		
	! METODOS IMPLICITOS ----------------------------
		!function implicito()
		!end function implicito


	end program PVI
