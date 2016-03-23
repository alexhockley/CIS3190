identification division.
program-id. fileread.
environment division.

data division.
working-storage section.

linkage section.
77 str      pic X(5000).
77 filename pic X(50).

procedure division using str, filename.
  display 'reading file'
  open input filename.
  read filename into str.
goback.
