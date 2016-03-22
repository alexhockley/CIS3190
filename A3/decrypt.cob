identification division.
program-id. decrypt.
environment division.

data division.
working-storage section.

linkage section.
77 str pic X(50).
77 decrypted-str pic X(50).

procedure division using str, decrypted-str.
 move str to decrypted-str.
 goback.
