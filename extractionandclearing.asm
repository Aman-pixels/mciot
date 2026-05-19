//extraction
        PRESERVE8
        THUMB

        AREA    |.text|, CODE, READONLY
        EXPORT  __main

__main

        LDR     R0, =0x0000000F

        ANDS    R1, R0, #0x01      ; Extract LSB

STOP
        B       STOP

        END

        //clearing
                PRESERVE8
        THUMB

        AREA    |.text|, CODE, READONLY
        EXPORT  __main

__main

        LDR     R0, =0x0000000F

        BICS    R1, R0, #0x01      ; Clear LSB

STOP
        B       STOP

        END