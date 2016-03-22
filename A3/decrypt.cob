IDENTIFICATION DIVISION.
PROGRAM-ID. decrypt.

DATA DIVISION.
  WORKING-STORAGE SECTION.
    LINKAGE SECTION.
    01 str            PC X(50).
    01 decrypted-str  PC X(50).

PROCEDURE DIVISION USING str, decrypted-str
  DISPLAY 'In decrypt'.
  MOVE str TO decrypted-str.
  goback.
