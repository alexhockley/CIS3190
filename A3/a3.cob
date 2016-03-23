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
01 in-text           PIC X(5000).
WORKING-STORAGE SECTION.
01  txt              PIC X(5000).
01  inputfile        PIC X(50).
01  encrypted-str    PIC X(5000).
01  decrypted-str    PIC X(5000).
01  end-of-file-switch  PIC XXX value 'NO '.
  88  end-of-file      value 'YES'.
PROCEDURE DIVISION.
    DISPLAY "File to process: " NO ADVANCING
    ACCEPT inputfile
    display 'input file: ' inputfile
    open input input-file.
    perform until end-of-file
      read input-file
        at end
          set end-of-file to true
        not at end
          move in-text to txt
      end-read
    end-perform
    close input-file
    display 'read: ' txt.

    call 'encrypt' using txt, encrypted-str
    call 'decrypt' using txt, decrypted-str
    DISPLAY "original: " txt
    DISPLAY "encrypted: " NO ADVANCING
    call 'smartoutput' using encrypted-str
    DISPLAY "decrypted: " NO ADVANCING
    call 'smartoutput' using decrypted-str
STOP RUN.
