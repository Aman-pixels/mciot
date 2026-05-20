#include <stdio.h>
#include "NUC1xx.h"
#include "Driver_GPIO.h"
#include "Driver_Sys.h"
#include "NUC1xx-LB_002/LCD_Driver.h"
#include "NUC1xx-LB_002/ScanKey.h"

int main(void)
{
    int32_t key_value;
    char text[16];

    UNLOCKREG();

    DrvSYS_Open(48000000);

    LOCKREG();

    Initial_panel();

    clr_all_panel();

    OpenKeyPad();

    print_lcd(0, "Keypad Test");

    while(1)
    {
        key_value = ScanKey();

        if(key_value != 0)
        {
            sprintf(text, "Key pressed:%d", key_value);

            print_lcd(1, text);
        }
        else
        {
            print_lcd(1, "Press a key");
        }

        DrvSYS_Delay(500000);
    }
}
