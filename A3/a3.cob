IDENTIFICATION DIVISION.
PROGRAM-ID. A3.
ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
DATA DIVISION.
WORKING-STORAGE SECTION.
01  txt              PIC X(50000).
01  inputfile        PIC X(50).
01  encrypted-str    PIC X(50000).
01  decrypted-str    PIC X(50000).
PROCEDURE DIVISION.
    DISPLAY "File to process: " NO ADVANCING
    ACCEPT inputfile
    call 'fileread' using txt, inputfile
    call 'encrypt' using txt, encrypted-str
    call 'decrypt' using txt, decrypted-str
    DISPLAY "original: "  txt
    DISPLAY "encrypted: " encrypted-str
    DISPLAY "decrypted: " decrypted-str
STOP RUN.
