        module hermite_interp
          implicit none
       
            contains
      
            subroutine Hermite(x,y,dy,xx,yy)
              !Evalua polinomio de Hermite con coeficientes "c"
              !Muy parecido a Newton pero utiliza los f(x_i) y también los f'(x_i)
             implicit none
                real, intent(inout):: x(:),y(:),dy(:),xx(:),yy(:)
            		!real, allocatable :: c(:)
                integer :: i,j,n,nn
                real, allocatable :: z(:),fz(:),c(:)
              
                n=size(x)*2
                nn=size(xx)
               allocate(z(n));   z(1:n-1:2)=x;  z(2:n:2)=x
               allocate(fz(n)); fz(1:n-1:2)=y; fz(2:n:2)=y
               allocate(c(n)); c=coefs(z,fz,dy)

               do i=1,nn
                  yy(i)=c(1)
                  do j=2,n
                     yy(i)= yy(i) + c(j)*product((xx(i)-z(:j-1)))
                  end do
               end do
               return
             end subroutine
        
             function coefs(x,y,dy) result(c)
                implicit none
                  real :: x(:),y(:)
                  real :: dy(:)
                  real, allocatable :: c(:)
                  real, allocatable :: T(:,:)
                  integer :: n
                  n=size(x)
                    allocate(T(n,n)); T=0 
                    allocate(c(n))
                    T = difdiv2(x,y,dy)
                    c = T(1,:)
              end function

              function difdiv2(x,y,dy) result(T)!Adaptado para hermite
                implicit none
                  integer :: n,m,i
                  real :: x(:),y(:)
                  real :: dy(:)
                  real, allocatable ::T(:,:)
    
                  n=size(x)
                  allocate(T(n,n))
              !i=0
                  T=0; T(:,1)=y; 
              !i=1
                  T(1:n-1,2)=(T(2:n,1)-T(1:n-1,1))/(x(2:n)-x(1:n-1)) 
                  T(1:n-1:2,2)=dy

                  do i=2,n
                    m=n-i
              T(1:m,i+1)=(T(2:m+1,i)-T(1:m,i))/(x(i+1:n)-x(1:m)) 
                  !Mirar patrón de indices: los x van x_{i+1:n}-x_{1:n-i}
                  end do
              end function
 
              function difdiv(x,y) result(T)!Diferencias divididas tradicional
                implicit none
                  integer :: n,m,i
                  real :: x(:),y(:)
                  real, allocatable ::T(:,:)
    
                  n=size(x)
                  allocate(T(n,n))
                  T=0; T(:,1)=y
                  do i=1,n
                    m=n-i
              T(1:m,i+1)=(T(2:m+1,i)-T(1:m,i))/(x(i+1:n)-x(1:m)) 
                  !Mirar patrón de indices: los x van x_{i+1:n}-x_{1:n-i}
                  end do
              end function
      

        end module
