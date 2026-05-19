      #include <LPC17xx.h>

void delay(void);

int main()
{
    LPC_GPIO1->FIODIR |= (1 << 18);   // Red LED
    LPC_GPIO1->FIODIR |= (1 << 19);   // Green LED
    LPC_GPIO1->FIODIR |= (1 << 20);   // Blue LED

    while(1)
    {
        // RED
        LPC_GPIO1->FIOSET = (1 << 18);

        delay();

        LPC_GPIO1->FIOCLR = (1 << 18);

        // GREEN
        LPC_GPIO1->FIOSET = (1 << 19);

        delay();

        LPC_GPIO1->FIOCLR = (1 << 19);

        // BLUE
        LPC_GPIO1->FIOSET = (1 << 20);

        delay();

        LPC_GPIO1->FIOCLR = (1 << 20);
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

        ORR     R1, R1, #0x01C00000
        STR     R1, [R0]

LOOP

        LDR     R0, =GPIO1SET
        LDR     R1, =0x00400000
        STR     R1, [R0]
        BL      DELAY

        LDR     R0, =GPIO1CLR
        STR     R1, [R0]

        LDR     R0, =GPIO1SET
        LDR     R1, =0x00800000
        STR     R1, [R0]
        BL      DELAY

        LDR     R0, =GPIO1CLR
        STR     R1, [R0]

        LDR     R0, =GPIO1SET
        LDR     R1, =0x01000000
        STR     R1, [R0]
        BL      DELAY

        LDR     R0, =GPIO1CLR
        STR     R1, [R0]

        B       LOOP

DELAY
        LDR     R2, =0x00FFFFFF

WAIT
        SUBS    R2, R2, #1
        BNE     WAIT
        BX      LR

        END