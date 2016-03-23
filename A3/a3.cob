* Alex Hockley, March 23 2016, CIS3190 Assignment 3
* COBOL Cypher
* a3.cob is the main calling function for this assignment. It takes file input and sends it off to external functions to
* encrypt, decrypt and display (without spaces)

identification division.
program-id. A3.
environment division.
input-output section.
file-control.
  select input-file assign to inputfile
  organization is line sequential.

data division.
file section.
fd input-file.
01 in-text           PIC X(5000).
working-storage section.
01  txt              PIC X(5000).
01  inputfile        PIC X(50).
01  encrypted-str    PIC X(5000).
01  decrypted-str    PIC X(5000).
01  end-of-file-switch  PIC XXX value 'NO '.
  88  end-of-file      value 'YES'.

procedure division.
    display "File to process: " no advancing
    accept inputfile
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

    call 'encrypt' using txt, encrypted-str
    call 'decrypt' using txt, decrypted-str
    display "original: " no advancing
    call 'smartoutput' using txt
    display "encrypted: " no advancing
    call 'smartoutput' using encrypted-str
    display "decrypted: " no advancing
    call 'smartoutput' using decrypted-str
stop run.
