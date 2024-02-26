    module richardson
    implicit none
    ! Extrapolación de richardson:
    !print*, richardson(x=15.,h=0.001,tipo=2,puntos=3)		
    ! .................................................
      contains
      function richardson(x,h,tipo,puntos)
      	real:: richardson
      	integer, intent(in) :: tipo,puntos
      	real, intent(in) :: x, h

      	richardson= (4/3)*df(x,h/2,tipo,puntos) - (1/3)*df(x,h,tipo,puntos) 
      	!richardson= 2*df(x,h/2,tipo,puntos) - df(x,h,tipo,puntos) 			
      end function
    end module
