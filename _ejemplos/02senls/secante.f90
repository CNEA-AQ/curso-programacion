 module secante
   implicit none

   contains
   
   function secante(a,b) result(c)
    	  implicit none
        real, intent(in) :: a,b
    	  real :: c,fa,fb,
        double precision :: err, minerr=1e-8
    	  integer :: it, maxit=1000
    	  
    	  it=0; err=abs(f(a)-f(b))
    	  
        do while(err>minerr .and. it<maxit)
    		    fa=f(a);fb=f(b)
    		    c= b- fb*((fb-fa)/(fb-fa))
    		    a=b
    		    b=c
    	      err=abs(f(a)-f(b))
    		    it=it+1
    	  end do
   end function
    
 end module
