	module puntofijo
		implicit none

	 contains
   function pf(a,b) result(x)
        implicit none
        real, intent(in) :: a,b
        double precision :: err, minerr=1e-8
        real :: x
        integer :: it, maxit 
      x=(a+b)/2
      it=0; err=abs((aa+bb)/2)
      do while(err>minerr .and. it<maxit)
          x = x - f(x)
          e = abs(f(x))
        it = it+1
      end do
   end function
    
	end module
