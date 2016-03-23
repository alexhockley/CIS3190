identification division.
program-id. smartoutput.
environment division.

data division.
working-storage section.
01 i pic 9(15).

linkage section.
77 str      pic X(5000).

procedure division using str

 PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(str)
 if str(i:1) = SPACE
   exit perform cycle
 end-if
  display str(i:1) NO ADVANCING
 end-perform
 .
 display ''.
goback.
