module newtonraphson
   implicit none

  contains
    
   function NR(a,b) result(x)
     implicit none
    	  real, intent(in) :: a,b
        double precision :: err,minerr=1e-8
        real :: x,fx,dfx,eps=1e-8
        integer :: it, maxit=1000
   
        x=(a+b)/2
        it=0; err=abs(f(x))
    
        do while(err>minerr .and. it<maxit)
          fx=f(x)
          dfx= (f(x+eps)-fx ) / eps
          x  = x -(fx/dfx)

          err=abs(f(x)); it=it+1
        end do
   end function 
    
end module
