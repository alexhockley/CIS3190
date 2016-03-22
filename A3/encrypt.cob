IDENTIFICATION DIVISION.
PROGRAM-ID. encrypt.

DATA DIVISION.
  WORKING-STORAGE SECTION.
    LINKAGE SECTION.
    01 str            PC X(50).
    01 encrypted-str  PC X(50).

PROCEDURE DIVISION USING str, encrypted-str
  DISPLAY 'In encrypt'.
  MOVE str TO encrypted-str.
  goback.
