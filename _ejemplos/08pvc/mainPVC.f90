	program PVC
	! Resuelve y''=f(t,y,y') con f(a)=a0, f(b)=b0.
		implicit none
		real, allocatable :: t(:),y(:),yy(:)
		real    :: a,b,a0,b0,dt
		integer :: n,i
		!.....................
		!params
		a=1.;b=2.
		a0=0.;b0=1.		
		dt=0.25!25
		!.....................
		n=(b-a)/dt
		t=(/(i, i=0,n,1)/)*dt +a
	!..................................................
	!main
!		yy=solution(t)
!		y=tiro(a,b,a0,b0,t,dt)
		y=DifFinitas(a,b,a0,b0,t,dt)
		yy=tiroNL(a,b,a0,b0,t,dt)
!		y=DifFinitasNL(a,b,a0,b0,t,dt)
		call saveData(t,y,yy)
		call plot()
	! .................................................
	contains
		function solution(t)
			real, intent(in) ::t(:)
			real, allocatable:: solution(:)
			solution=exp(2.)*t-t+3.*exp(2.-t)-exp(3.-t)+exp(t-1.)-3.*exp(t)
			solution=solution/(1.-exp(2.))
			return
		end function solution
		function f(t,y)
			real, intent(in) :: t,y
			real :: f
			!f=y**3	 !NO LINEAL
			f= y+t   !LINEAL			
			return
		end function f
		!#####################
		!# + PVCs            #
		!#####################
		!tiro (lineal)
		! *** resuelve dos PVI (y1,y2), luego usa una formula obtener la solucion al PVC.
		function tiro(a,b,a0,b0,t,dt)
			real, intent(in)::a,b,a0,b0,t(:),dt
			real, allocatable :: tiro(:),y1(:),y2(:),dy1(:),dy2(:)
			integer :: i,n
			n=size(t)
			!solve y1   => y(a)=a0, y'(a)=0	
			allocate(y1(n));y1(1)=a0	
			allocate(dy1(n));dy1(1)=0.		
			do i=1,n-1
				dy1(i+1)=dy1(i)+dt*f(t(i),y1(i))
				y1(i+1)=y1(i)+dt*dy1(i)
			end do
			!solve y2,  => y(a)=0,y(a)'=1
			allocate(y2(n));y2(1)=0.
			allocate(dy2(n));dy2(1)=1.				
			do i=1,n-1
				dy2(i+1)=dy2(i)+dt*f(t(i),y1(i))
				y2(i+1)=y2(i)+dt*dy2(i)
			end do
			!solve y
			tiro=y1+(b0-y1)*y2/y2(n)
			return
		end function tiro
		!tiro (no lineal)
		! *** Resuelve un PVI con y(a)=a0, y'(a)=k, donde k se busca iterativamente
 		! de forma que y(b)=b0
		function tiroNL(a,b,a0,b0,t,dt)
			real, intent(in)::a,b,a0,b0,t(:),dt
			real, allocatable :: tiroNL(:),y(:),dy(:)
			integer :: i,n,max_iter,iter
			real :: k,z,dz
			n=size(t)		
			k=(b0-a0)/(b-a)
			max_iter=100; iter=0
			allocate(y(n))
			allocate(dy(n))
			do while (iter<max_iter)
				iter=iter+1
				!solve y, con => y(a)=a0 & dy(a)=k
				y(1)=a0
				dy(1)=k
			z=0;dz=1 !para iteracion de Newton
				do i=1,n-1
					y(i+1)=y(i)+dt*dy(i)
					dy(i+1)=dy(i)+dt*f(t(i),y(i))
					!Iteracion de Newton:
					!solve z,  => dz(a)=1, z(a)=0
					dz=dz+dt*(y(i+1)*z+dy(i+1)*dz)
					z=z+dt*dz
				end do
				if (y(n)-b0<0.000001) then
					print*,"Solución encontrada."
					iter=max_iter
				else
					print*, k
					k=k-(y(n)-b0)/z
				end if
			end do
			tiroNL=y
			return
		end function tiroNL
		!diferencias finitas (NO LINEAL)
		function DifFinitas(a,b,a0,b0,t,dt)
			real, intent(in)::a,b,a0,b0,t(:),dt
			real, allocatable :: DifFinitas(:),y(:),dy(:)
			integer :: i,j,n,max_iter,iter
			real :: k,z,dz
			real, allocatable :: Jacobian(:,:)
			n=(b-a)/dt
			allocate(y(n));y(1)=a0;y(n)=b0
			! Construyo semilla.
			y=(/(i, i=0,n,1)/)*dt*((b0-a0)/(b-a)) +a0
			allocate(Jacobian(n,n))
			max_iter=100;iter=0		
			do while (iter<max_iter)
				!Construyo el jacobiano:
				Jacobian=0.
				do i=1,n
					do j=1,n
					 if(i==j) then
					   Jacobian(i,j)=2+dt*dt*f(t(i),y(i))
					 elseif(i==j-1) then
					   Jacobian(i,j)=-1+0.5*dt*f(t(i),y(i))
					 elseif(i==j+1) then
					   Jacobian(i,j)=-1-0.5*dt*f(t(i),y(i))
					 end if
				        end do
				end do
				print*, "Matriz Jacobiana"
				print*, Jacobian
				!if () then
				!else
				!end if 
			end do
			DifFinitas=y
			return
		end function DifFinitas

		! ------------------------------------------
		!save data		
		subroutine saveData(t,y,yy)
			real, intent(in):: t(:),y(:),yy(:)
			integer :: i,n
			n=size(t)
			! Save data:
			open (unit = 1, file = "pvc_values")
			do i=1,n
				write(1,*) t(i),y(i),yy(i)
			end do	
			close(1)
		end subroutine saveData		
		!plot.
		subroutine plot()
			! Plot:
			CALL SYSTEM('gnuplot -p pvc_plot.plt')
		end subroutine plot
	end program PVC
