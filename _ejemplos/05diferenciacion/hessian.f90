  module hessian
    use diff, only ddf
    implicit none
  contains
  ! ....................................................
  function Hessian(x) result(H)
    implicit none
    real, allocatable :: H(:,:)
  	real :: h=1e-6
  	real, intent(in) :: x(:)
    integer :: n,i

    n=size(x);
    allocate(H(n,n))
    do i=1,n
      H(i,j)=ddf() 
    end do
  end function 

  end module

