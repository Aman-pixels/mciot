#include <stdio.h>
#include "NUC1xx.h"
#include "Driver_Sys.h"
#include "Driver_GPIO.h"
#include "Driver_ADC.h"

void Init_LED()
{
    DrvGPIO_Open(E_GPA, 12, E_IO_OUTPUT);
    DrvGPIO_Open(E_GPA, 13, E_IO_OUTPUT);
    DrvGPIO_Open(E_GPA, 14, E_IO_OUTPUT);

    DrvGPIO_SetBit(E_GPA, 12);
    DrvGPIO_SetBit(E_GPA, 13);
    DrvGPIO_SetBit(E_GPA, 14);
}

void rgb_blink()
{
    int i;

    while(1)
    {
        for(i = 12; i <= 14; i++)
        {
            DrvGPIO_ClrBit(E_GPA, i);
            DrvSYS_Delay(300000);

            DrvGPIO_SetBit(E_GPA, i);
            DrvSYS_Delay(300000);
        }
    }
}

void buzzer(void)
{
    DrvGPIO_ClrBit(E_GPB, 11);
    DrvSYS_Delay(100000);

    DrvGPIO_SetBit(E_GPB, 11);
    DrvSYS_Delay(100000);
}

int main(void)
{
    UNLOCKREG();

    DrvSYS_Open(48000000);

    LOCKREG();

    Init_LED();

    DrvGPIO_Open(E_GPB, 18, E_IO_INPUT);
    DrvGPIO_Open(E_GPB, 14, E_IO_INPUT);

    DrvGPIO_EnableInt(E_IO_BOTH_EDGE,
                       E_MODE,
                       E_INT0,
                       buzzer);

    while(1)
    {
    }
}
