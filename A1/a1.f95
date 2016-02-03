program a1
use stack_mod

implicit none

type(stack_type) :: location_stack

integer :: rows = 0
integer :: columns = 0
integer :: i = 0
integer :: j = 0
integer :: linelen = 0
character(len=1000) :: temp_val
character(len=200) :: filename
character (len=1), dimension(1000,1000) :: maze_matrix

print*, "Enter filename: "
read *, filename

open(unit=2, file=filename)
read(2,*) rows, columns
print*, rows
print*, columns


do i=1, rows
  read(2,*) temp_val
  linelen = len(trim(temp_val))
  do j=1, linelen
    maze_matrix(i,j) = temp_val(j:j)
  end do
end do


close(2)
end program a1
