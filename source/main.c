#include <stdbool.h>
#include <stdint.h>
#include "inc/hw_memmap.h"
#include "driverlib/fpu.h"
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
#include "driverlib/rom.h"
#include "driverlib/sysctl.h"
#include "driverlib/uart.h"
#include "grlib/grlib.h"
#include "drivers/cfal96x64x16.h"
#include "utils/uartstdio.h"

tContext sContext;
tRectangle sRect;

void Configure(void) {
  // FPU
  ROM_FPULazyStackingEnable();

  // Clock
  ROM_SysCtlClockSet(SYSCTL_SYSDIV_4 | SYSCTL_USE_PLL | SYSCTL_XTAL_16MHZ | SYSCTL_OSC_MAIN);

  // UART
  ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);
  ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);
  ROM_GPIOPinConfigure(GPIO_PA0_U0RX);
  ROM_GPIOPinConfigure(GPIO_PA1_U0TX);
  ROM_GPIOPinTypeUART(GPIO_PORTA_BASE, GPIO_PIN_0 | GPIO_PIN_1);
  UARTClockSourceSet(UART0_BASE, UART_CLOCK_PIOSC);
  UARTStdioConfig(0, 115200, 16000000);

  // Display Driver
  CFAL96x64x16Init();
  GrContextInit(&sContext, &g_sCFAL96x64x16);

  // Display Context
  sRect.i16XMin = 0;
  sRect.i16YMin = 0;
  sRect.i16XMax = GrContextDpyWidthGet(&sContext) - 1;
  sRect.i16YMax = 23;
  GrRectFill(&sContext, &sRect);

  // Color & Font
  GrContextForegroundSet(&sContext, ClrWhite);
  GrContextFontSet(&sContext, g_psFontFixed6x8);
}

int main(void) {
  Configure();

  UARTprintf("Hello, world!\n");

  GrStringDrawCentered(&sContext, "Hello World!", -1, GrContextDpyWidthGet(&sContext) / 2,
                       GrContextDpyHeightGet(&sContext) / 2, 0);

  GrFlush(&sContext);

  while (1) {
  }
}
