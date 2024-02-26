    program jacobi
       implicit none

       real:: A(4,4), b(4), x(4)

       data A/1,-2,3,1,3,0,1,2,-2,1,-1,1,1,1,-2,3/
       data b/1,-2,0,1/
       data x/1,0,1,1/

        print*,"A =";write(*," (4f6.2)")A;
        print*,"b =";write(*," (4f6.2)")b;
        print*,"x0 =";write(*,"(4f6.2)")x;

        call solve(A,x,b)

        print*,"x =";write(*,"(4f6.2)")x;

      contains

        subroutine solve(A,x,b) 
          implicit none
          real, intent(in) :: A(:,:)
          real, intent(inout) :: x(:)
	  real, intent(in) ::b(:)
	  real, allocatable::xnew(:)
          integer :: n,i,iter,maxiter=100
          
          n=size(x)
          allocate(xnew(n)); xnew=x
          
          iter=0
          do while ( iter < maxiter )
            x=xnew
                do i=1,n
                        xnew(i)=( b(i) + A(i,i)*x(i) - sum( A(:,i)*x(:) )  ) / A(i,i)
                end do
                iter=iter+1
          end do
        end subroutine
    end program
