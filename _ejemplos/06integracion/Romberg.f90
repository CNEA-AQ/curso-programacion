	module Romberg
	implicit none
	
  contains
		! ROMBERG ( extrap de richardson)	
		function romberg(a,b,n)
		real, intent(in) :: a,b
		integer, intent(in) :: n
		real :: h, romberg
		real, allocatable :: R(:,:)
		integer :: i,j,k,ncols
		h=b-a
		ncols=5
		allocate(R(ncols,n)); R=0
		do i=1,n 
		!Primer columna de R, pongo integrales calculadas con i-divisiones en cada fila
		   R(1,i)= trapecio(a,b,i)
		end do
		!Armo la matriz de Romberg, y aplico la formulita.
		do j=2,ncols 	 ! cada columna
			do k=j,n ! cada fila
			   R(j,k)=R(j-1,k)+( R(j-1,k)-R(j-1,k-1) )/((4**(j-1))-1)
			end do
		end do	
		!print*, R
		romberg=R(ncols,n)
		return
		end function romberg
	end module
