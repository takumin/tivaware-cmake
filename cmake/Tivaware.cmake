if(NOT IS_DIRECTORY ${Tivaware_DIR})
  message(FATAL_ERROR "Not found Tivaware directory.")
endif()

if(NOT DEFINED CMAKE_SYSTEM_CHIP)
  message(FATAL_ERROR "Please set to \${CMAKE_SYSTEM_CHIP}")
endif()

set(CMAKE_SYSTEM_PROCESSOR cortex-m4)

add_definitions(-Dgcc -DTARGET_IS_TM4C123_RB1 -DPART_TM4C123GH6PGE)

include_directories(${Tivaware_DIR})

add_library(driverlib STATIC
  ${Tivaware_DIR}/driverlib/adc.c
  ${Tivaware_DIR}/driverlib/aes.c
  ${Tivaware_DIR}/driverlib/can.c
  ${Tivaware_DIR}/driverlib/comp.c
  ${Tivaware_DIR}/driverlib/cpu.c
  ${Tivaware_DIR}/driverlib/crc.c
  ${Tivaware_DIR}/driverlib/des.c
  ${Tivaware_DIR}/driverlib/eeprom.c
  ${Tivaware_DIR}/driverlib/emac.c
  ${Tivaware_DIR}/driverlib/epi.c
  ${Tivaware_DIR}/driverlib/flash.c
  ${Tivaware_DIR}/driverlib/fpu.c
  ${Tivaware_DIR}/driverlib/gpio.c
  ${Tivaware_DIR}/driverlib/hibernate.c
  ${Tivaware_DIR}/driverlib/i2c.c
  ${Tivaware_DIR}/driverlib/interrupt.c
  ${Tivaware_DIR}/driverlib/lcd.c
  ${Tivaware_DIR}/driverlib/mpu.c
  ${Tivaware_DIR}/driverlib/onewire.c
  ${Tivaware_DIR}/driverlib/pwm.c
  ${Tivaware_DIR}/driverlib/qei.c
  ${Tivaware_DIR}/driverlib/shamd5.c
  ${Tivaware_DIR}/driverlib/ssi.c
  ${Tivaware_DIR}/driverlib/sw_crc.c
  ${Tivaware_DIR}/driverlib/sysctl.c
  ${Tivaware_DIR}/driverlib/sysexc.c
  ${Tivaware_DIR}/driverlib/systick.c
  ${Tivaware_DIR}/driverlib/timer.c
  ${Tivaware_DIR}/driverlib/uart.c
  ${Tivaware_DIR}/driverlib/udma.c
  ${Tivaware_DIR}/driverlib/usb.c
  ${Tivaware_DIR}/driverlib/watchdog.c
)

add_library(grlib STATIC
  ${Tivaware_DIR}/grlib/canvas.c
  ${Tivaware_DIR}/grlib/charmap.c
  ${Tivaware_DIR}/grlib/checkbox.c
  ${Tivaware_DIR}/grlib/circle.c
  ${Tivaware_DIR}/grlib/container.c
  ${Tivaware_DIR}/grlib/context.c
  ${Tivaware_DIR}/grlib/image.c
  ${Tivaware_DIR}/grlib/imgbutton.c
  ${Tivaware_DIR}/grlib/keyboard.c
  ${Tivaware_DIR}/grlib/line.c
  ${Tivaware_DIR}/grlib/listbox.c
  ${Tivaware_DIR}/grlib/offscr1bpp.c
  ${Tivaware_DIR}/grlib/offscr4bpp.c
  ${Tivaware_DIR}/grlib/offscr8bpp.c
  ${Tivaware_DIR}/grlib/pushbutton.c
  ${Tivaware_DIR}/grlib/radiobutton.c
  ${Tivaware_DIR}/grlib/rectangle.c
  ${Tivaware_DIR}/grlib/slider.c
  ${Tivaware_DIR}/grlib/string.c
  ${Tivaware_DIR}/grlib/widget.c
  ${Tivaware_DIR}/grlib/fonts/fontcm12.c
  ${Tivaware_DIR}/grlib/fonts/fontcm12b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm12i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm14.c
  ${Tivaware_DIR}/grlib/fonts/fontcm14b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm14i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm16.c
  ${Tivaware_DIR}/grlib/fonts/fontcm16b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm16i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm18.c
  ${Tivaware_DIR}/grlib/fonts/fontcm18b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm18i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm20.c
  ${Tivaware_DIR}/grlib/fonts/fontcm20b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm20i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm22.c
  ${Tivaware_DIR}/grlib/fonts/fontcm22b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm22i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm24.c
  ${Tivaware_DIR}/grlib/fonts/fontcm24b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm24i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm26.c
  ${Tivaware_DIR}/grlib/fonts/fontcm26b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm26i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm28.c
  ${Tivaware_DIR}/grlib/fonts/fontcm28b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm28i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm30.c
  ${Tivaware_DIR}/grlib/fonts/fontcm30b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm30i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm32.c
  ${Tivaware_DIR}/grlib/fonts/fontcm32b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm32i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm34.c
  ${Tivaware_DIR}/grlib/fonts/fontcm34b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm34i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm36.c
  ${Tivaware_DIR}/grlib/fonts/fontcm36b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm36i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm38.c
  ${Tivaware_DIR}/grlib/fonts/fontcm38b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm38i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm40.c
  ${Tivaware_DIR}/grlib/fonts/fontcm40b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm40i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm42.c
  ${Tivaware_DIR}/grlib/fonts/fontcm42b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm42i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm44.c
  ${Tivaware_DIR}/grlib/fonts/fontcm44b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm44i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm46.c
  ${Tivaware_DIR}/grlib/fonts/fontcm46b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm46i.c
  ${Tivaware_DIR}/grlib/fonts/fontcm48.c
  ${Tivaware_DIR}/grlib/fonts/fontcm48b.c
  ${Tivaware_DIR}/grlib/fonts/fontcm48i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc12.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc14.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc16.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc18.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc20.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc22.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc24.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc26.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc28.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc30.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc32.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc34.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc36.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc38.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc40.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc42.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc44.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc46.c
  ${Tivaware_DIR}/grlib/fonts/fontcmsc48.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss12.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss12b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss12i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss14.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss14b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss14i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss16.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss16b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss16i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss18.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss18b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss18i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss20.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss20b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss20i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss22.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss22b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss22i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss24.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss24b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss24i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss26.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss26b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss26i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss28.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss28b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss28i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss30.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss30b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss30i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss32.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss32b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss32i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss34.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss34b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss34i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss36.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss36b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss36i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss38.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss38b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss38i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss40.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss40b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss40i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss42.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss42b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss42i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss44.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss44b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss44i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss46.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss46b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss46i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss48.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss48b.c
  ${Tivaware_DIR}/grlib/fonts/fontcmss48i.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt12.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt14.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt16.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt18.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt20.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt22.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt24.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt26.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt28.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt30.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt32.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt34.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt36.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt38.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt40.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt42.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt44.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt46.c
  ${Tivaware_DIR}/grlib/fonts/fontcmtt48.c
  ${Tivaware_DIR}/grlib/fonts/fontfixed6x8.c
)

include_directories(${Tivaware_DIR}/examples/boards/dk-tm4c123g)
add_library(cfal96x64x16 STATIC ${Tivaware_DIR}/examples/boards/dk-tm4c123g/drivers/cfal96x64x16.c)

add_library(uartstdio STATIC ${Tivaware_DIR}/utils/uartstdio.c)

add_library(ustdlib STATIC ${Tivaware_DIR}/utils/ustdlib.c)

configure_file(${CMAKE_SOURCE_DIR}/cmake/startup.c.in startup.c COPYONLY)
configure_file(${CMAKE_SOURCE_DIR}/cmake/linker.ld.in linker.ld COPYONLY)

set(LINKER_FLAGS "-T linker.ld --entry ResetISR")
