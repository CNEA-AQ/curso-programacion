	module CuadraturaGaussiana
	implicit none
    real :: weights(:)
    real :: roots(:)

		! Transforma la integral al intervalo de legendre [-1,1]
		if (n==2) then
			weights= (/-0.57735,0.57735/)
			roots  = (/1.000000,1.000000/)
		else if (n==3) then
			roots=  (/0.00000, -0.774597,0.774597/)
			weights=(/0.888889,0.555556, 0.555556/)
		else if (n==4) then
			roots=  (/0.339981,-0.339981,0.861136,-0.861136/)
			weights=(/0.652145, 0.652145,0.347855, 0.347855/)
		else if (n==5) then
			roots=(/ 0.000000,-0.538469, 0.538469, 0.538469, 0.90618/)
			weights=(/0.568889,0.478629,0.478629,0.236927,0.236927/)
		else if (n==6) then
		 	weights=(/0.3607,0.3607,0.467913, 0.467913,0.17132,0.17132/)
      roots=(/0.6612,-0.6612,0.2386,-0.2386,-0.9324,0.9324/)
		end if

	contains
	! --------------------------------------------------- !
		! CUADRATURA GAUSSIANA
		function GaussQ(a,b,n)
			real, intent(in) :: a, b
			integer, intent(in):: n
			real, allocatable :: weights(:),roots(:)
			real :: GaussQ
			integer :: i
		allocate(weights(n));allocate(roots(n))
		! Elije los puntos optimos para evaluar la funcion.			
		!

















		! Cuadratura:
		do i=1,n
		GaussQ=GaussQ+weights(i)*f((b-a)*roots(i)*0.5 + (b+a)*0.5)
		end do
		GaussQ=GaussQ*(b-a)*0.5
		return
		!1) llevar la integral al intervalo [-1,1]
		!x=(t*(b-a)+b+a /2) ! cambiod de variable
		! despues se integra usando raices tabuladas de los polinomios de legendre
		end function GaussQ
	end module
