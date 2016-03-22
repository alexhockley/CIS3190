identification division.
program-id. encrypt.
environment division.

data division.
working-storage section.

linkage section.
77 g1 pic 99.
77 g2 pic 99.
77 res pic 9(3).

procedure division using g1, g2, res.
 compute res = g1 + g2.
 goback.
