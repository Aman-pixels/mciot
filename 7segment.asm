        PRESERVE8
        THUMB

        AREA    |.text|, CODE, READONLY
        EXPORT  __main

GPIO0DIR   EQU 0x2009C000
GPIO0SET   EQU 0x2009C018
GPIO0CLR   EQU 0x2009C01C

__main

        LDR     R0, =GPIO0DIR
        LDR     R1, =0x000000FF
        STR     R1, [R0]

LOOP

        LDR     R0, =GPIO0SET
        LDR     R1, =0x0000003F      ; Display 0
        STR     R1, [R0]

        BL      DELAY

        LDR     R0, =GPIO0CLR
        LDR     R1, =0x000000FF
        STR     R1, [R0]

        B       LOOP

DELAY
        LDR     R2, =0x00FFFFFF

WAIT
        SUBS    R2, R2, #1
        BNE     WAIT
        BX      LR

        END

        // c code
        #include <LPC17xx.h>

unsigned char seg_code[10] =
{
    0x3F,   //0
    0x06,   //1
    0x5B,   //2
    0x4F,   //3
    0x66,   //4
    0x6D,   //5
    0x7D,   //6
    0x07,   //7
    0x7F,   //8
    0x6F    //9
};

void delay(void);

int main()
{
    int i;

    LPC_GPIO0->FIODIR = 0x000000FF;     // P0.0 to P0.7 as output

    while(1)
    {
        for(i = 0; i < 10; i++)
        {
            LPC_GPIO0->FIOPIN = seg_code[i];

            delay();
        }
    }
}

void delay(void)
{
    int j;

    for(j = 0; j < 1000000; j++);
}