        PRESERVE8
        THUMB

        AREA    |.text|, CODE, READONLY
        EXPORT  __main

__main

        LDR     R0, =5
        LDR     R1, =10

        MOV     R2, R0
        MOV     R0, R1
        MOV     R1, R2

STOP
        B       STOP

        END