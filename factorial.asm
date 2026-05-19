        PRESERVE8
        THUMB

        AREA    |.text|, CODE, READONLY
        EXPORT  __main

__main

        LDR     R0, =5          ; Number
        MOVS    R1, #1          ; Factorial result

LOOP
        CMP     R0, #0
        BEQ     STOP

        MULS    R1, R1, R0
        SUBS    R0, R0, #1

        B       LOOP

STOP
        B       STOP

        END