identification division.
program-id. encrypt.
environment division.

data division.
working-storage section.
01 a pic 9(3).
01 i pic 9(3).
01 offset pic 9(3).


linkage section.
77 str pic X(50).
77 encrypted-str pic X(50).

procedure division using str, encrypted-str.
 move str to encrypted-str.
 move 0 to offset.
 PERFORM VARYING i FROM 1 BY 1 UNTIL i > FUNCTION LENGTH(str)
        IF encrypted-str (i:1) IS NOT ALPHABETIC
            EXIT PERFORM CYCLE
        END-IF
        if encrypted-str(i:1) = SPACE
          subtract 1 from i
          exit perform cycle
        end-if

        IF encrypted-str (i:1) IS ALPHABETIC-UPPER
            MOVE FUNCTION ORD("A") TO a
        ELSE
            MOVE FUNCTION ORD("a") TO a
        END-IF

        MOVE FUNCTION CHAR(FUNCTION MOD(FUNCTION ORD(encrypted-str (i:1))
                - a + offset, 26) + a)
            TO encrypted-str (i:1)
        add 1 to offset
    END-PERFORM
    .
 goback.
