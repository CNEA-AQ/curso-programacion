      	module newton_interp
          implicit none
       
            contains
      
      	    subroutine newton(x,y,xx,yy)
      	    	implicit none
      
                real :: x(:),y(:),xx(:),yy(:)
      	    		real, allocatable :: c(:)
      	    		integer :: i,j,n
      
                n=size(x);
      	    		allocate(c(n));c=0 		
      
               c=coefs(x,y)
                
      	       do i=1,size(xx)
      	          yy(i)=c(1)
      	          do j=2,n
      	             yy(i)= yy(i) + c(j)*product((xx(i)-x(:j-1)))
      	          end do
      	       end do
      	     end subroutine
      	
             function coefs(x,y) result(a) 
                implicit none
                real    :: x(:),y(:)
                integer :: n,i,j
                real, allocatable :: T(:,:),a(:)
      
                n=size(x)
                allocate(a(n)); a=0
                allocate(T(n,n)); T=0 

                 T(1,:)=y ! Tabla de diferencias divididas
                 do i=2,size(y)
                   do j=1, (size(y)+1-i)
                     T(i,j)=(T(i-1,j+1)-T(i-1,j))/(x(j+i-1)-x(j))
                   end do
                 end do
      
                 a = T(:,1) ! Vector de coefs del polinomio
              end function
        end module
