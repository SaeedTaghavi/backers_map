program bakerMap
implicit none
real :: x,y,dx,dy,x_temp,x_1,y_temp,y_1,y_next,x_next
real, parameter :: a = 0.2 !a should be in (0,.5]
integer:: i,j,iteration
integer, parameter::frames =5, N=128
character (len=10) :: dataname,framename
dx = 1./real(N); 
dy = 1./real(N); 
!producing the first data set

call system('rm -rf data/ && mkdir data')
!call system('rm -rf frames/ && mkdir frames')

!do i =0,frames
!---creating a filename for frame
	!write(framename,'(a,i2.2,a)')'frame',i
!---creating a filename for data
	!write(dataname,'(a,i2.2,a)')'data',i
!end do

x=0.0
do while(x<=1.)
  y=0.0
  do while(y<=1.)
    open(11,file='base',access='append')
    write(11,*)x,y
    close(11)
    x_temp=x
    y_temp=y
    do i=1,frames
      x_1=x_next(x_temp,a)
      y_1=y_next(x_temp,y_temp,a)
      write(dataname,'(a,i2.2,a)')'data',i
      open(11,file=dataname,access='append')
      write(11,*) x_1,y_1
      close(11)
      x_temp=x_1
      y_temp=y_1
    end do
    y = y + dy
  end do
  x = x + dx
end do
call system ('mv base data0* data')
end 

real function x_next(x,a)
implicit none
real ::x,a

if (0<=x .and. x <.5) then
      x_next = 2.0*x
    elseif (x>=.5 .and. x<1.) then
	  x_next = 2.0*x-1.0
	end if
end function

real function y_next(x,y,a)
implicit none
real ::x,y,a
if (0<=x .and. x <.5) then
      y_next = a * y
    elseif (x>=.5 .and. x<1.) then
	  y_next = a * y + 0.5   
	end if
end function
