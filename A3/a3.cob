000001 PROGRAM-ID. A3.
000002 ENVIRONMENT DIVISION.
000003 CONFIGURATION SECTION.
000004 REPOSITORY.
000005     FUNCTION encrypt
000006     FUNCTION decrypt
000007     .
000008 DATA DIVISION.
000009 WORKING-STORAGE SECTION.
000010 01 txt              PIC X(50).
000011 01 encrypted-str    PIC X(50).
000012 PROCEDURE DIVISION.
000013   DISPLAY "Message to encrypt: " NO ADVANCING
000014   ACCEPT txt
000015   MOVE FUNCTION encrypt(txt) TO encrypted-str
000016   DISPLAY "Encrypted: " encrypted-str
000017   DISPLAY "Decrypted: " FUNCTION decrypt(encrypted-str)  .
000018 END PROGRAM A3.
000019 FUNCTION-ID. encrypt.
000020 DATA DIVISION.
000021 LOCAL-STORAGE SECTION.
000022 01 i              PIC 9(3).
000023 01 a              PIC 9(3).
000024 LINKAGE SECTION.
000025 01 str            PIC X(50).
000026 01 encrypted-str  PIC X(50).
000027 PROCEDURE DIVISION USING str RETURNING encrypted-str.
000028   MOVE str TO encrypted-str
000029   PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(str)
000030     IF encrypted-str (i:1) IS NOT ALPHABETIC OR encrypted-str (i:1) = SPACE
000031       EXIT PERFORM CYCLE
000032     END-IF
000033     IF encrypted-str (i:1) IS ALPHABETIC-UPPER
000034       MOVE FUNCTION ORD("A") to a
000035     ELSE
000036       MOVE FUNCTION ORD("a") to a
000037     END-IF
000038     MOVE FUNCTION CHAR(FUNCTION MOD(FUNCTION ORD(encrypted-str (i:1))-a + (i-1), 26) + a) TO encrypted-str(i:1)
000039   END-PERFORM  .
000040 END FUNCTION encrypt.
000041 FUNCTION-ID. decrypt.
000042 DATA DIVISION.
000043 LINKAGE SECTION.
000044 01 str              PIC X(50).
000045 01 decrypted-str    PIC X(50).
000046 PROCEDURE DIVISION USING str RETURNING decrypted-str.
000047   MOVE str to decrypted-str.
000048   PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(str)
000049     IF decrypted-str (i:1) IS NOT ALPHABETIC OR decrypted-str (i:1) = SPACE
000050       EXIT PERFORM CYCLE
000051     END-IF
000052     IF decrypted-str (i:1) IS ALPHABETIC-UPPER
000053       MOVE FUNCTION ORD("A") to a
000054     ELSE
000055       MOVE FUNCTION ORD("a") to a
000056     END-IF
000057     MOVE FUNCTION CHAR(FUNCTION MOD(FUNCTION ORD(decrypted-str (i:1))a - (i-1), 26) - a)
000058       TO decrypted-str(i:1)
000059   END-PERFORM
000060   .
000061 END FUNCTION decrypt.
