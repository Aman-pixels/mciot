#include <LPC17xx.h>

void delay(unsigned int);

int main()
{
    LPC_GPIO1->FIODIR |= (1 << 26);     // P1.26 as output

    while(1)
    {
        LPC_GPIO1->FIOSET = (1 << 26);  // Buzzer ON
        delay(50000);

        LPC_GPIO1->FIOCLR = (1 << 26);  // Buzzer OFF
        delay(50000);
    }
}

void delay(unsigned int d)
{
    unsigned int i;

    for(i = 0; i < d; i++);
}