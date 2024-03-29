program a1
use stack_mod

implicit none

type(stack_type) :: location_stack

integer :: rows = 0
integer :: columns = 0
integer :: i = 0
integer :: j = 0
integer :: i2 = 0
integer :: j2 = 0
integer :: loop_flag = 0
integer :: found_flag = 0
integer :: linelen = 0
character(len=1000) :: temp_val
character(len=200) :: filename
character (len=1), dimension(1000,1000) :: maze_matrix

integer :: cur_row = 1;
integer :: cur_col = 1;

print*, "Enter filename: "
read *, filename

open(unit=2, file=filename)
read(2,*) rows, columns


do i=1, rows
  read(2,*) temp_val
  linelen = len(trim(temp_val))
  do j=1, linelen
    maze_matrix(i,j) = temp_val(j:j)
  end do
end do

!find start
do i2=1, rows
  do j2=1, columns
    if (maze_matrix(i2,j2) .eq. 'o') then
      cur_row = i2
      cur_col = j2
      loop_flag = 1
      exit
    end if
  end do
  if (loop_flag .eq. 1) then
    exit
  end if
end do

call push(cur_row, cur_col,location_stack)
do while (associated(location_stack%top))
  call pop(location_stack, cur_row, cur_col)


  !if we are at the end
  if (maze_matrix(cur_row, cur_col) .eq. 'e') then
    found_flag = 1

    !empty the stack
    do while (associated(location_stack%top))
      call pop(location_stack, cur_row, cur_col)
    end do

  else if (maze_matrix(cur_row, cur_col) .ne. '*' .and. maze_matrix(cur_row, cur_col) .ne. 'v') then
    maze_matrix(cur_row, cur_col) = 'v'
    call push(cur_row, cur_col+1, location_stack)
    call push(cur_row, cur_col-1, location_stack)
    call push(cur_row-1, cur_col, location_stack)
    call push(cur_row+1, cur_col, location_stack)
  end if
end do

if (found_flag == 1) then
  print*, "Maze traversed successfully"
else
  print*, "Exit not found"
end if

close(2)
end program a1
