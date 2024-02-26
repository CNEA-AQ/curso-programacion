 module biseccion
   implicit none

   contains
  
  function bisection(a,b) result(c)
    implicit none
  	  real, intent(in) :: a,b
  	  real :: c
      double precision :: err, minerr=1e-8
      integer :: it, maxit=1000
      
      it=0; err=abs(f(a)-f(b))
      do while(err>minerr .and. it<maxit)
         c = (a+b)/2
        if (f(c)*f(a)<0) then;  b=c
        else;  a=c
        end if
        err=abs(f(a)-f(b))
        it=it+1
      end do

  end function
    
 end module
