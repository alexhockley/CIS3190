identification division.
program-id. encrypt.
environment division.

data division.
working-storage section.

linkage section.
77 str pic X(50).
77 encrypted-str pic X(50).

procedure division using str, encrypted-str.
 move str to encrypted-str.
 PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(str)
        IF encrypted-str (i:1) IS NOT ALPHABETIC OR encrypted-str (i:1) = SPACE
            EXIT PERFORM CYCLE
        END-IF

        IF encrypted-str (i:1) IS ALPHABETIC-UPPER
            MOVE FUNCTION ORD("A") TO a
        ELSE
            MOVE FUNCTION ORD("a") TO a
        END-IF

        MOVE FUNCTION CHAR(FUNCTION MOD(FUNCTION ORD(encrypted-str (i:1))
                - a + i, 26) + a)
            TO encrypted-str (i:1)
    END-PERFORM
    .
 goback.
