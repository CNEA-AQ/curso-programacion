      program interpolacion

        use lagrange_interp
        use newton_interp
        use hermite_interp
        use spline_interp

        implicit none
          integer, parameter :: p=10,m=50
          real :: dx=0.5
          real :: x(p), y(p), dy(p)
          real :: xx(m)
          real :: L(m),N(m),H(m),S(m)
          integer :: i

          x=(/(i,i=1,p)/)*dx
          y=exp(x)*cos(3*x**2)
          dy=exp(x)*(-sin(3*x**2)*6*x+cos(3*x**2))
          xx=(/(i,i=1,m)/)*(dx*(real(p)/real(m)))
          
          L=0; N=0; H=0; S=0

          !Interpolación
          call Lagrange(x,y,xx,L)
          call Newton(x,y,xx,N)
          call Hermite(x,y,dy,xx,H)
          call Spline(x,y,xx,S)

          !Guardo datos:
          open(unit=1,file="points.txt")
          do i=1,size(x)
            write(1,"(2(f10.3))") x(i),y(i)
          end do
          close(1)

          open(unit=2,file="interpolacion.txt")
          do i=1,size(xx)
          write(2,'(5(f10.3))') xx(i), L(i), N(i), H(i), S(i)
          end do
          close(2)

          !Ploteo:
          call system('gnuplot -p plot.plt')

      end program
