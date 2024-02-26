      module fun_ortogonales

      contains
        function poly(x,n) result(y)
          implicit none
          real :: x, n
          real :: y

          y=x**n
        end function  

        function legendre(x,n) result(y)
          implicit none
          real :: x, n
          real :: y
          integer :: i
          
          do i=1,n
            y=sum(comb(n,i)**2 * (x+i)**(n-i)
            * (x-1)**i
          end do
          y=(1/2**n)**2 * y
          return
        end function  

        function laguerre(x,n) result(y)
          implicit none
          real :: x, n
          real :: y
          integer :: i
          do i=1,n
            y=(-1)**i * comb(n,i)*(1/fact(i))*x**i
          end do
        end function  

        recursive function chebyshev(x,n) result(y)
          implicit none
          real :: x, n
          real :: y
          
          if (n>1) then
            y=2*x*chebyshev(x,n-1)-chebyshev(x,n-2)
          else if (n==0) then
           y=1; return
          else if (n==1) then
           y=x; return
           else
             print*,"Error, valor de "n" no permitido".
             exit
          end if
          
        end function  

        function fourier(x,n) result(y)
          implicit none
          real :: x,n
          real :: y
          y=cos(x*n)
        end function  
       !------------------------------------------------------!
       !funciones auxiliares
       !
       !Gamma(n+1)==fact(n)
       function fact(n)     !Factorial
          implicit none
          integer :: n
          integer :: fact
          integer :: i
          fact=  product( (/(i,i=1,n)/) )
        end function

        function perm(n,r) !Permutaciones
          implicit none
          integer :: n,r
          integer :: perm

          perm= fact(n)/fact(n-r)
        end function

       function comb(n,r)  !Combinaciones
         implicit none
         integer :: n,r
         integer :: comb
                                         
         comb= fact(n)/(fact(r)*fact(n-r))
       end function


      end module
