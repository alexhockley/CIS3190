IDENTIFICATION DIVISION.
PROGRAM-ID. A3.
ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
DATA DIVISION.
WORKING-STORAGE SECTION.
01  txt              PIC X(50).
01  encrypted-str    PIC X(50).
PROCEDURE DIVISION.
    DISPLAY "Message to encrypt: " NO ADVANCING
    ACCEPT txt
    CALL 'encrypt' USING txt, encrypted-str    
    DISPLAY "encrypted: " encrypted-str
    STOP RUN.
