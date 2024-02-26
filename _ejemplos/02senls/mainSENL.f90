        program roots
    
        use biseccion
        use regulafalsi
        use puntofijo
        use newtonraphson
        use secante
    
        	implicit none
        	real :: a,b
        	
        a=2.0
        	b=5.0
    
                	print*, "Por bisección:"
                	print*, bisection(a,b)
                	
            print*, " Por Regula Falsi"
                	print*, regulafalsi(a,b)
                	
            print*, " Por Punto Fijo"
                	print*, PF(a,b)
                	
            print*, " Por Newton-Raphson"
                	print*, NR(a,b)
                	
            print*, " Por Secante"
                	print*, secante(a,b)
    
      	contains

        real function f(x) 
            real, intent(in) :: x ! input
            f = (x**3) -x *sin(x)
        end function 
        
        end program
