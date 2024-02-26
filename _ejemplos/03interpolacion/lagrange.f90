      module lagrange_interp
       implicit none
  
      contains
        subroutine lagrange(x,y,xx,yy)
            implicit none
          	real :: x(:), y(:)
            real :: xx(:), yy(:)
         	  real, allocatable ::L(:)
            integer :: i, j
         
         allocate(L(size(xx)));  L=0 
         
            do i=1,size(xx)
              do j=1,size(x) 
         
      L(j)=product((xx(i)-[x(:j-1),x(j+1:)])/(x(j)-[x(:j-1),x(j+1:)]))
  
              end do
              yy(i)=sum(y*L)
            end do
    
        end subroutine
  
      end module               
