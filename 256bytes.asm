        PRESERVE8
        THUMB

        AREA    |.text|, CODE, READONLY
        EXPORT  __main

SRC     DCD     0x11,0x22,0x33,0x44
DST     DCD     0x00,0x00,0x00,0x00

__main

        LDR     R0, =SRC        ; Source address
        LDR     R1, =DST        ; Destination address
        MOVS    R2, #4          ; Number of words

LOOP
        LDR     R3, [R0], #4    ; Load data from source
        STR     R3, [R1], #4    ; Store to destination

        SUBS    R2, R2, #1
        BNE     LOOP

STOP
        B       STOP

        END