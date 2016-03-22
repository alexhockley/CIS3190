identification division.
program-id. encrypt.
environment division.

data division.
working-storage section.

linkage section.
77 str pic X(50).
77 encrypted-str pic X(50).

procedure division using str, encrypted-str.
 move str to encrypted-str.
 goback.
