identification division.
program-id. encrypt.
environment division.

data division.
working-storage section.
01 a pic 9(3).
01 i pic 9(3).
01 offset pic 9(3).
01 strpos pic 9(3).
01 encrypted-str PIC X(50).

linkage section.
77 str pic X(50).
77 res pic x(50).

procedure division using str, res.
 move str to encrypted-str.
 move 0 to offset.
 move 1 to strpos.
 PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(str)
        IF encrypted-str (i:1) IS NOT ALPHABETIC OR encrypted-str(i:1) = SPACE
            EXIT PERFORM CYCLE
        END-IF

        IF encrypted-str (i:1) IS ALPHABETIC-UPPER
            MOVE FUNCTION ORD("A") TO a
        ELSE
            MOVE FUNCTION ORD("a") TO a
        END-IF

        MOVE FUNCTION CHAR(FUNCTION MOD(FUNCTION ORD(encrypted-str (i:1))
                - a + offset, 26) + a)
            TO encrypted-str (i:1)
        add 1 to offset
        if encrypted-str(i:1) IS NOT SPACE
          MOVE encrypted-str(i:1) to res(strpos:1)
          add 1 to strpos
        end-if
    END-PERFORM
    .
 goback.
