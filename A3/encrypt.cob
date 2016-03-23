* Alex Hockley, March 23 2016, CIS3190 Assignment 3
* COBOL Cypher
* encrypt.cob is the function used to encrypt the text

identification division.
program-id. encrypt.
environment division.

data division.
working-storage section.
01 a pic 9(15).
01 i pic 9(15).
01 offset pic 9(15).
01 strpos pic 9(15).
01 encrypted-str PIC X(5000).

linkage section.
77 str pic X(5000).
77 res pic x(5000).

procedure division using str, res.
 display 'Encrypting'.
 move str to encrypted-str.
 move 0 to offset.
 move 1 to strpos.
*loop through the whole string, encrypting each alpha character
 perform varying i from 1 by 1 until i > function length(str)
        if encrypted-str (i:1) is not alphabetic or encrypted-str(i:1) = space
            exit perform cylce
        end-if

        if encrypted-str (i:1) is alphabetic-upper
            move function ord("A") to a
        else
            move function ord("a") to a
        end-if

        move function char(function mod(function ord(encrypted-str (i:1))
                - a + offset, 26) + a)
            to encrypted-str (i:1)
        add 1 to offset
        if encrypted-str(i:1) not = space
          move encrypted-str(i:1) to res(strpos:1)
          add 1 to strpos
        end-if
    end-perform
    .
 goback.
