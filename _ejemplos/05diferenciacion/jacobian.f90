	module jacobian
	 use diff, only df
    
   implicit none
	
  contains
	! ....................................................
	function Jacobian(x) result(J)
		real, allocatable :: J(:), dxi(:)
		real :: h=1e-6
		real, intent(in) :: x(:)
		integer :: n,i
		
    n=size(x);
		allocate(J(n,n))
		
    do i=1,n
			dxi=(/0,0/); dxi(i)=h
			J(i)=(F(x+dxi)-F(x-dxi))/(2*h) 
		end do
		
	end function 
	end module

