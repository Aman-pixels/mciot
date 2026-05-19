        PRESERVE8
        THUMB

        AREA    |.text|, CODE, READONLY
        EXPORT  __main

__main

        LDR     R0, =0x12345678

        AND     R1, R0, #0x000000FF

        AND     R2, R0, #0x0000FF00
        LSRS    R2, R2, #8

        AND     R3, R0, #0x00FF0000
        LSRS    R3, R3, #16

        AND     R4, R0, #0xFF000000
        LSRS    R4, R4, #24

STOP
        B       STOP

        END