        PRESERVE8
        THUMB

        AREA    |.text|, CODE, READONLY
        EXPORT  __main
        ENTRY

__main

        LDR     R0, =0x00000001
        LDR     R1, =0x10000002
        LDR     R2, =0x00000003
        LDR     R3, =0x00000000

        SUBS    R0, R0, R2
        SBCS    R1, R1, R3

STOP
        B       STOP

        END