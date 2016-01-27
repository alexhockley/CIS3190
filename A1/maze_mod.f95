module maze_mod

  implicit none

  !module variables
  type maze_type
    character, allocable :: maze(:,:) !2D array of characters, size TBD
    integer :: rows     !rows in maze
    integer :: columns  !columns in maze
  end type maze_type

end module maze_mod
