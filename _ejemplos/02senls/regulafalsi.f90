	module regulafalsi
   implicit none

   contains
   function regulafalsi(a,b) result(c)
        implicit none
          real, intent(in) :: a,b
          double precision :: err, minerr
          real :: c,fa,fb
          integer :: it, maxit=1000

        it=0; err=abs(f(a)-f(b))
      
        do while(err>minerr .and. it<maxit)
          fa=f(a); fb=f(b)
          c = abs(a*fb - b*fa) / abs(fb-fa)
          
          if (f(c)*fa<0) then;  b=c
          else; a=c
          end if
          
          err=abs(f(a)-f(b)); it=it+1
        end do
   end function
    
	end module
