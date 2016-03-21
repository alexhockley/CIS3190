PROGRAM-ID. A3.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
REPOSITORY.
    FUNCTION encrypt
    FUNCTION decrypt
    .

DATA DIVISION.
WORKING-STORAGE SECTION.
01 txt              PIC X(50).
01 encrypted-str    PIC X(50).

PROCEDURE DIVISION.
  DISPLAY "Message to encrypt: " NO ADVANCING
  ACCEPT txt

  MOVE FUNCTION encrypt(txt) TO encrypted-str
  DISPLAY "Encrypted: " encrypted-str
  DISPLAY "Decrypted: " FUNCTION decrypt(encrypted-str)
  .
END PROGRAM A3.

FUNCTION-ID. encrypt.
DATA DIVISION.
LOCAL-STORAGE SECTION.
01 i              PIC 9(3).
01 a              PIC 9(3).

LINKAGE SECTION.
01 str            PIC X(50).
01 encrypted-str  PIC X(50).

PROCEDURE DIVISION USING str RETURNING encrypted-str.
  MOVE str TO encrypted-str
  PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(str)
    IF encrypted-str (i:1) IS NOT ALPHABETIC OR encrypted-str (i:1) = SPACE
      EXIT PERFORM CYCLE
    END-IF

    IF encrypted-str (i:1) IS ALPHABETIC-UPPER
      MOVE FUNCTION ORD("A") to a
    ELSE
      MOVE FUNCTION ORD("a") to a
    END-IF

    MOVE FUNCTION CHAR(FUNCTION MOD(FUNCTION ORD(encrypted-str (i:1))
      -a + (i-1), 26) + a) TO encrypted-str(i:1)
  END-PERFORM
  .
END FUNCTION encrypt.

FUNCTION-ID. decrypt.

DATA DIVISION.
LINKAGE SECTION.
01 str              PIC X(50).
01 decrypted-str    PIC X(50).

PROCEDURE DIVISION USING str RETURNING decrypted-str.
  MOVE str to decrypted-str.
  PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(str)
    IF decrypted-str (i:1) IS NOT ALPHABETIC OR decrypted-str (i:1) = SPACE
      EXIT PERFORM CYCLE
    END-IF

    IF decrypted-str (i:1) IS ALPHABETIC-UPPER
      MOVE FUNCTION ORD("A") to a
    ELSE
      MOVE FUNCTION ORD("a") to a
    END-IF

    MOVE FUNCTION CHAR(FUNCTION MOD(FUNCTION ORD(decrypted-str (i:1))
      a - (i-1), 26) - a)
      TO decrypted-str(i:1)
  END-PERFORM
  .
END FUNCTION decrypt.
