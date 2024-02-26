	 module derivadas
  		implicit none;
  		contains

  		function df(x,h,tipo,puntos)
  			implicit none
        integer :: tipo,puntos
  			real, intent(in) :: x, h
  			double precision :: df

  			if (puntos==2) then
  				!tipo 1(backwd); 2(center); 3(fowrd)
  				if (tipo==1) then
  					df=( f(x)-f(x-h) )/h
  				else if (tipo==2) then
  					print*, "Error: no existe derivada centrada con 2 puntos!"
  					df=0!(f(x+h)-f(x-h))/(2*h)
  				else if (tipo==3) then
  					df=( f(x+h)-f(x) )/h
  				end if
  			else if(puntos==3) then
  				!tipo 1(backwd); 2(center); 3(fowrd)
  				if (tipo==1) then
  					df=(0.5*f(x-h) -2*f(x) +1.5*f(x+h))/h
  				else if (tipo==2) then
  					df=(0.5*f(x+h) +0*f(x) -0.5*f(x-h))/h
  				else if (tipo==3) then
  					df=(-1.5*f(x-h)+2*f(x) -0.5*f(x+h))/h
  				end if
  			end if
  			return
  		end function 
  		
      function ddf(x,h)
  			implicit none
        double precision :: ddf
  			real :: x, h

  			ddf=(f(x-h)+f(x+h)-2*f(x) )/(h*h)			
  			return
  		end function 
	end module
