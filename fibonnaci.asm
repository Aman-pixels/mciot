        PRESERVE8
        THUMB

        AREA    |.text|, CODE, READONLY
        EXPORT  __main

__main

        MOVS    R0, #0      ; First number
        MOVS    R1, #1      ; Second number
        MOVS    R2, #10     ; Count

LOOP
        ADDS    R3, R0, R1  ; R3 = R0 + R1

        MOV     R0, R1
        MOV     R1, R3

        SUBS    R2, R2, #1

        BNE     LOOP

STOP
        B       STOP

        END