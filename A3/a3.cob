IDENTIFICATION DIVISION.
PROGRAM-ID. A3.
ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
DATA DIVISION.
WORKING-STORAGE SECTION.
01  txt              PIC X(50).
01  encrypted-str    PIC X(50).
01  decrypted-str    PIC X(50).
PROCEDURE DIVISION.
    DISPLAY "Message to encrypt: " NO ADVANCING
    ACCEPT txt
    CALL 'encrypt' USING txt, encrypted-str
    CALL 'decrypt' USING encrypted-str, decrypted-str
    DISPLAY "original: "  txt
    DISPLAY "encrypted: " encrypted-str
    DISPLAY "decrypted: " decrypted-str
    STOP RUN.
