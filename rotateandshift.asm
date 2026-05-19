//left shift
        PRESERVE8
        THUMB

        AREA    |.text|, CODE, READONLY
        EXPORT  __main

__main

        LDR     R0, =0x00000002

        LSLS    R1, R0, #1      ; Left shift by 1

STOP
        B       STOP

        END

        //right shift
                PRESERVE8
        THUMB

        AREA    |.text|, CODE, READONLY
        EXPORT  __main

__main

        LDR     R0, =0x00000002

        LSRS    R1, R0, #1      ; Right shift by 1

STOP
        B       STOP

        END

        //rotate right 
                PRESERVE8
        THUMB

        AREA    |.text|, CODE, READONLY
        EXPORT  __main

__main

        LDR     R0, =0x00000002

        RORS    R1, R0, #1      ; Rotate right by 1

STOP
        B       STOP

        END

        //rotate left
                        PRESERVE8
        THUMB

        AREA    |.text|, CODE, READONLY
        EXPORT  __main

__main

        LDR     R0, =0x00000002

        RORS    R1, R0, #31      ; Rotate left by 1

STOP
        B       STOP

        END
        