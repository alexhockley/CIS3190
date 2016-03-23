IDENTIFICATION DIVISION.
PROGRAM-ID. A3.
ENVIRONMENT DIVISION.
input-output section.
file-control.
  select input-file assign to inputfile
  organization is line sequential.

DATA DIVISION.
file section.
fd input-file.
01 in-text           PIC X(50000);
WORKING-STORAGE SECTION.
01  txt              PIC X(50000).
01  inputfile        PIC X(50).
01  encrypted-str    PIC X(50000).
01  decrypted-str    PIC X(50000).
PROCEDURE DIVISION.
    DISPLAY "File to process: " NO ADVANCING
    ACCEPT inputfile
    display 'input file: ' inputfile
    open input input-file.
    read input-file into txt.
    display 'read: ' txt.

    call 'encrypt' using txt, encrypted-str
    call 'decrypt' using txt, decrypted-str
    DISPLAY "original: "  txt
    DISPLAY "encrypted: " encrypted-str
    DISPLAY "decrypted: " decrypted-str
STOP RUN.
