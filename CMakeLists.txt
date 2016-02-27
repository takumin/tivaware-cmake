cmake_minimum_required(VERSION 3.0.2)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
set(CMAKE_SYSTEM_CHIP TM4C123GH6PGE)
set(Tivaware_DIR /opt/tivaware)
include(Tivaware)
include(BareMetalGNU)
project(example)

add_executable(${CMAKE_PROJECT_NAME}.elf
  ${CMAKE_SOURCE_DIR}/source/main.c
  startup.c
)
target_link_libraries(${CMAKE_PROJECT_NAME}.elf
  driverlib
  grlib
  cfal96x64x16
  uartstdio
  ustdlib
)
add_custom_target(${PROJECT_NAME}.bin ALL
  COMMAND ${CMAKE_OBJCOPY} -O binary ${PROJECT_NAME}.elf ${PROJECT_NAME}.bin
  DEPENDS ${PROJECT_NAME}.elf
)
set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES ${PROJECT_NAME}.bin)

add_custom_target(flash
  COMMAND lm4flash -v ${PROJECT_NAME}.bin
  DEPENDS ${PROJECT_NAME}.bin
)
