module stack_mod

  implicit none

  !define an element type to store the location (value) and pointer to previous stack element
  type element_type
    integer :: row_loc
    integer :: col_loc
    type(element_type), pointer :: prev  !element before this one in the stack
  end type element_type

  !define a stack type to have pointer access to the top element of the stack
  type stack_type
    type(element_type), pointer :: top=>null()  !top of the stack, init to null
  end type stack_type

  public :: push
  public :: pop

  !define subroutines
  contains

    !push subroutine for pushing onto the stack
    subroutine push(row_val, col_val, stack)
      implicit none

      !init variables
      integer, intent(in) :: row_val
      integer, intent(in) :: col_val
      type(stack_type), intent(inout) :: stack
      type(element_type), pointer :: current

      !set up the new stack element
      allocate(current)
      current%row_loc = row_val
      current%col_loc = col_val
      current%prev => stack%top

      !set up the stack
      stack%top => current

      return
    end subroutine push

    !pop subroutine for popping off the stack
    subroutine pop(stack, row_val, col_val)
      implicit none

      !init variables
      type(stack_type), intent(inout) :: stack
      integer, intent(out) :: row_val
      integer, intent(out) :: col_val
      type(element_type), pointer :: before

      !check if the top is pointing to anything
      if(associated(stack%top)) then
        row_val = stack%top%row_loc
        col_val = stack%top%col_loc

        !now remove the last element
        before => stack%top%prev
        deallocate(stack%top)
        stack%top => before
      end if
      return
    end subroutine pop

end module stack_mod
