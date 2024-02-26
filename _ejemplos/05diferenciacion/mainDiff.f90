	program derivadas
    use diff
    use richardson
		implicit none;
		!...................................................
		! funcion evaluada en x
		print*, "f(x)=",f(x=15.)
		! Derivada analítica de f evaluada en x		
		print*, "f'(x)=",cos(15.)+2*15
		! derivada de f en x (con dos puntos).
		print*, df(x=15.,h=0.01,tipo=1,puntos=2)
		print*, df(x=15.,h=0.01,tipo=2,puntos=2)
		print*, df(x=15.,h=0.01,tipo=3,puntos=2)
		! derivada de f en x (con tres puntos).
		print*, df(x=15.,h=0.01,tipo=1,puntos=3)
		print*, df(x=15.,h=0.01,tipo=2,puntos=3)
		print*, df(x=15.,h=0.01,tipo=3,puntos=3)
		! Extrapolación de richardson:
		print*, richardson(x=15.,h=0.001,tipo=2,puntos=3)		

		! Derivada segunda
		print*, "f''(x)= ",-sin(15.)+2
		print*, ddf(x=15.,h=0.01)
		! .................................................
		contains
		function f(x)
			real, intent(in) :: x
			double precision :: f			
			f=sin(x)+x*x
			return
		end function f
	end program derivadas
