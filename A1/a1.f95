program a1
use stack_mod

implicit none

type(stack_type) :: location_stack
character, allocable :: maze_matrix(:,:)
integer :: rows = 0
integer :: columns = 0
character(len=200) :: filename

print*, "Enter filename: "
read *, filename

print*, filename




end program a1
