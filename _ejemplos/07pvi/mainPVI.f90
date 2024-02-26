	program PVI

		implicit none
		real, allocatable :: t(:),y(:)
		real    :: dt,y0
		integer :: n,i
		y0=4
		n=30; dt=0.01	
		t=(/(i, i=0,n-1,1)/) * dt
		allocate(y(size(t))) 

		y(1)=y0	
		do i=2,n
  		   y(i)=y(i-1) + dt*f(y(i-1))
		end do

		! Save data:
		open (unit = 1, file = "pvi_values")
		!write(1,*), t
		!write(1,*) y
		do i=1,n
			write(1,*) t(i),y(i)
		end do	
		close(1)
		! Plot:
		CALL SYSTEM('gnuplot -p pvi_plot.plt')
	contains
		function f(xx) result(yy)
			real, intent(in) :: xx
			real :: yy
			yy=xx**2 - 30*xx + sin(xx)*xx
		end function f
	end program PVI
