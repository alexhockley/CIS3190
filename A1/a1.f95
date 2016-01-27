program a1
use stack_mod

implicit none

type(stack_type) :: location_stack
character, allocatable :: maze_matrix(:,:)
integer :: rows = 0
integer :: columns = 0
integer :: i = 0;
integer :: j = 0;
character :: temp_val
character(len=200) :: filename

print*, "Enter filename: "
read *, filename

open(unit=2, file=filename)
read(2,*) rows, columns

allocate(maze_matrix(rows,columns))

do i = 1, rows
  do j = 1, columns
    read(2,*) maze_matrix(i,j)
  end do
end do


close(2)
deallocate(maze_matrix)
end program a1
