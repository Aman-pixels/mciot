#include <LPC17xx.h>

unsigned int adc_value;

void adc_init(void);

int main()
{
    adc_init();

    while(1)
    {
        LPC_ADC->ADCR |= (1 << 24);          // Start conversion

        while(!(LPC_ADC->ADGDR & (1U << 31))); // Wait for conversion complete

        adc_value = (LPC_ADC->ADGDR >> 4) & 0xFFF; // Read 12-bit ADC value
    }
}

void adc_init(void)
{
    LPC_SC->PCONP |= (1 << 12);      // Power ON ADC

    LPC_PINCON->PINSEL1 |= (1 << 14); // P0.23 as AD0.0

    LPC_ADC->ADCR =
            (1 << 0)  |   // Select channel AD0.0
            (4 << 8)  |   // ADC clock divider
            (1 << 21);    // Enable ADC
}