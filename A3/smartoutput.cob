* Alex Hockley, March 23 2016, CIS3190 Assignment 3
* COBOL Cypher
* smartoutput.cob is the function used to display a string without all the spaces, because cobol is dumb and doesnt have a
* trim function

identification division.
program-id. smartoutput.
environment division.

data division.
working-storage section.
01 i pic 9(15).

linkage section.
77 str      pic X(5000).

procedure division using str.
*loop through the string, printing out the non-space characters
 perform varying i from 1 by 1 until i > function length(str)
 if str(i:1) = space
   exit perform cycle
 end-if
  display str(i:1) no advancing
 end-perform
 .
 display ''.
goback.
