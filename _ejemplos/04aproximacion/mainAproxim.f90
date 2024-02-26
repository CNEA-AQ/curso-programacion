    	program aproximacion
    	! Aproximacion polinómica de nube de puntos.
    		implicit none
        
         integer, parameter :: n=6,g=3 !puntos y grado del polinomio
    		 real :: x(n),y(n),a(g)
    		 integer :: i
    
        x=(/(i,i=1,n)/)*0.5
        call random_number(y)
        y=y*1e-3 + 4*x**(g-1)
    
    		a= aproxim(x,y,g)
    
    		print*, "Coefs del polinomio:"
    		print*, a
    
    	end program 
