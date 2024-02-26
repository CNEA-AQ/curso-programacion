		module DiferenciasFinitas
      implicit none
      contains

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
    
    end module
