identification division.
program-id. smartoutput.
environment division.

data division.
working-storage section.
01 i pic 9(15).

linkage section.
77 str      pic X(5000).

procedure division using str.
 perform varying i from 1 by 1 until i > function length(str)
 if str(i:1) = SPACE
   exit perform cycle
 end-if
  display str(i:1) NO ADVANCING
 end-perform
 .
 display ''.
goback.
