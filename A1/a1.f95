program a1
use stack_mod

implicit none

type(stack_type) :: location_stack
character, allocatable :: maze_matrix(:,:)
integer :: rows = 0
integer :: columns = 0
integer :: i = 0;
integer :: j = 0;
character(len=200) :: temp_val
character(len=200) :: filename

print*, "Enter filename: "
read *, filename

open(unit=2, file=filename)
read(2,*) rows, columns
print*, rows
print*, columns

allocate(maze_matrix(rows,columns))

do i=1, rows
  read(2,*) temp_val
  maze_matrix (i,:) = temp_val
end do
print*, maze_matrix(:,:)

close(2)
deallocate(maze_matrix)
end program a1
