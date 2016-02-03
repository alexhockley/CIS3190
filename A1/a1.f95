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

integer :: cur_row = 1;
integer :: cur_col = 1;
type(element_type), pointer :: temp_elem

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

!find start
do i=1, rows
  do j=1, columns
    if maze_matrix(i,j) .eq. 's'
      cur_row = i
      cur_col = j
      i = rows+1
      j + rows+1
    end if
  end do
end do

push(cur_row, cur_col,location_stack)
do while (associated(location_stack%top))
  pop(location_stack, cur_row, cur_col)

  !if we are at the end
  if maze_matrix(cur_row, cur_col) .eq. 'e'
    print*, "Maze traversed"

    !empty the stack
    do while (associated(location_stack%top))
      pop(location_stack, cur_row, cur_col)
    end do

  else if maze_matrix(cur_row, cur_col) .ne. '*' or maze_matrix(cur_row, cur_col) .ne. 'v'
    maze_matrix(cur_row, cur_col) = 'v'
    push(cur_row, cur_col+1, location_stack)
    push(cur_row, cur_col-1, location_stack)
    push(cur_row-1, cur_col, location_stack)
    push(cur_row+1, cur_col, location_stack)
  end if
end do


close(2)
end program a1
