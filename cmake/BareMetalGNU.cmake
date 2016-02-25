cmake_minimum_required(VERSION 3.0.2)

if(CMAKE_SYSTEM_PROCESSOR STREQUAL "cortex-m0")
  set(CPU_FLAGS "-march=armv6-m -mtune=cortex-m0 -mthumb -mfloat-abi=soft")
elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "cortex-m0plus")
  set(CPU_FLAGS "-march=armv6-m -mtune=cortex-m0plus -mthumb -mfloat-abi=soft")
elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "cortex-m1")
  set(CPU_FLAGS "-march=armv6-m -mtune=cortex-m1 -mthumb -mfloat-abi=soft")
elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "cortex-m3")
  set(CPU_FLAGS "-march=armv7-m -mtune=cortex-m3 -mthumb -mfloat-abi=soft")
elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "cortex-m4")
  set(CPU_FLAGS "-march=armv7e-m -mtune=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16")
elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "cortex-m7")
  set(CPU_FLAGS "-march=armv7e-m -mtune=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16")
else()
  message(FATAL_ERROR "Please set to \${CMAKE_SYSTEM_PROCESSOR} variable.")
endif()

set(LINKER_FLAGS "${LINKER_FLAGS} -Wl,--start-group -lc -lg -lgcc -lm -lstdc++ -lsupc++ -Wl,--end-group")
set(LINKER_FLAGS "${LINKER_FLAGS} -Wl,--gc-sections -Wl,-Map=sections.map")

set(CMAKE_C_FLAGS "${CPU_FLAGS} -std=c11 -Wall -Wextra -pipe -ffunction-sections -fdata-sections")
set(CMAKE_CXX_FLAGS "${CPU_FLAGS} -std=c++14 -Wall -Wextra -pipe -ffunction-sections -fdata-sections")
set(CMAKE_ASM_FLAGS "${CPU_FLAGS} -x assembler-with-cpp")
set(CMAKE_EXE_LINKER_FLAGS "${CPU_FLAGS} ${LINKER_FLAGS}")
set(CMAKE_MODULE_LINKER_FLAGS "${CPU_FLAGS} ${LINKER_FLAGS}")
set(CMAKE_SHARED_LINKER_FLAGS "${CPU_FLAGS} ${LINKER_FLAGS}")
set(CMAKE_STATIC_LINKER_FLAGS "${CPU_FLAGS} ${LINKER_FLAGS}")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "C Flags.")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}" CACHE STRING "CXX Flags.")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS}" CACHE STRING "Assembler Flags.")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "Execute Linker Flags.")

set(CMAKE_EXE_LINKER_FLAGS_RELEASE "-O3 -flto" CACHE STRING "Flags used by the linker during release builds.")
set(CMAKE_MODULE_LINKER_FLAGS_RELEASE "-O3 -flto" CACHE STRING "Flags used by the linker during release builds.")
set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "-O3 -flto" CACHE STRING "Flags used by the linker during release builds.")
set(CMAKE_STATIC_LINKER_FLAGS_RELEASE "-O3 -flto" CACHE STRING "Flags used by the linker during release builds.")

if(NOT COMPILER_PREFIX)
  set(COMPILER_PREFIX arm-none-eabi-)
endif()
get_filename_component(CMAKE_C_COMPILER ${COMPILER_PREFIX}gcc PROGRAM)
get_filename_component(CMAKE_CXX_COMPILER ${COMPILER_PREFIX}g++ PROGRAM)
get_filename_component(CMAKE_ASM_COMPILER ${COMPILER_PREFIX}gcc PROGRAM)

set(CMAKE_SYSTEM_NAME Generic)

include(CMakeForceCompiler)
CMAKE_FORCE_C_COMPILER(${CMAKE_C_COMPILER} GNU)
CMAKE_FORCE_CXX_COMPILER(${CMAKE_CXX_COMPILER} GNU)

execute_process(
  COMMAND ${CMAKE_C_COMPILER} --print-libgcc-file-name
  OUTPUT_VARIABLE CMAKE_INSTALL_PREFIX
  OUTPUT_STRIP_TRAILING_WHITESPACE
)
get_filename_component(
  CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}" PATH
)
get_filename_component(
  CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}/.." REALPATH
)
set(
  CMAKE_INSTALL_PREFIX  ${CMAKE_INSTALL_PREFIX} CACHE FILEPATH
  "Install path prefix, prepended onto install directories."
)

set(CMAKE_FIND_ROOT_PATH ${CMAKE_INSTALL_PREFIX})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(BUILD_SHARED_LIBS OFF)

enable_language(ASM)

set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES sections.map)
