!=========================================================!
!            F O R T R A N   A V A N Z A D O              !
!                  03 -  T Y P E S                       !
!                                                         !
!  AUTOR:    Ramiro A. Espada                             !
!  CREACION: Enero 2019                                   !
!                                                         !
!  OBJETIVO:                                              !
!                                                         !
!=========================================================!
      program types

      type Customer
          character*20 :: name
          integer      :: age
          real         :: balance
      end type Customer


      type(Customer), dimension(2) :: customers

      integer :: n
      type(Customer) ::  cust1
       cust1%name = "Tom Medicci"
       cust1%age  = 32
       cust1%balance = 320.32

       customers(1)=cust1

       customers(2)%name="Lucho Medrano"
       customers(2)%age=29
       customers(2)%balance=223.3

      print*, customers(1)
      print*, customers(2)
      end program types
