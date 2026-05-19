       #include <LPC17xx.h>

void delay(void);

int main()
{
    LPC_GPIO1->FIODIR |= (1 << 18);     // P1.18 as output

    while(1)
    {
        LPC_GPIO1->FIOSET = (1 << 18);  // LED ON

        delay();

        LPC_GPIO1->FIOCLR = (1 << 18);  // LED OFF

        delay();
    }
}

void delay(void)
{
    int i;

    for(i = 0; i < 1000000; i++);
}
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
        PRESERVE8
        THUMB

        AREA    |.text|, CODE, READONLY
        EXPORT  __main

GPIO1DIR   EQU 0x2009C020
GPIO1SET   EQU 0x2009C038
GPIO1CLR   EQU 0x2009C03C

__main

        LDR     R0, =GPIO1DIR
        LDR     R1, [R0]
        ORR     R1, R1, #0x00040000
        STR     R1, [R0]

LOOP
        LDR     R0, =GPIO1SET
        MOVS    R1, #0x00040000
        STR     R1, [R0]

        BL      DELAY

        LDR     R0, =GPIO1CLR
        STR     R1, [R0]

        BL      DELAY

        B       LOOP

DELAY
        LDR     R2, =0x00FFFFFF

WAIT
        SUBS    R2, R2, #1
        BNE     WAIT
        BX      LR

        END