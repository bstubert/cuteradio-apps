# Copyright (c) Burkhard Stubert (burkhard.stubert@embeddeduse.com)
#
# Set environment variables in IDE:
#
#     SDK_SYSROOTS=/private/Projects/WtwAutomation/work-wtw-yocto-2.7/sdk-egscore-1.4.1/sysroots
#

cmake_minimum_required(VERSION 3.18)
include_guard(GLOBAL)

set(SDK_SYSROOTS $ENV{SDK_SYSROOTS})
set(HOST_SYSROOT ${SDK_SYSROOTS}/x86_64-fslcsdk-linux)

set(OE_QMAKE_PATH_EXTERNAL_HOST_BINS "${HOST_SYSROOT}/usr/bin")

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_SYSROOT ${SDK_SYSROOTS}/armv8a-fslc-linux)
set(CMAKE_PREFIX_PATH ${CMAKE_SYSROOT}/usr/lib/cmake)
set(CMAKE_C_COMPILER ${HOST_SYSROOT}/usr/bin/aarch64-fslc-linux/aarch64-fslc-linux-gcc)
set(CMAKE_CXX_COMPILER ${HOST_SYSROOT}/usr/bin/aarch64-fslc-linux/aarch64-fslc-linux-g++)

set(QT_COMPILER_FLAGS "-march=armv8-a+crc+crypto -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security")
set(QT_COMPILER_FLAGS_RELEASE "-O2 -pipe")
set(QT_LINKER_FLAGS "-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -Wl,-z,relro,-z,now")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

include(CMakeInitializeConfigs)

function(cmake_initialize_per_config_variable _PREFIX _DOCSTRING)
  if (_PREFIX MATCHES "CMAKE_(C|CXX|ASM)_FLAGS")
    set(CMAKE_${CMAKE_MATCH_1}_FLAGS_INIT "${QT_COMPILER_FLAGS}")

    foreach (config DEBUG RELEASE MINSIZEREL RELWITHDEBINFO)
      if (DEFINED QT_COMPILER_FLAGS_${config})
        set(CMAKE_${CMAKE_MATCH_1}_FLAGS_${config}_INIT "${QT_COMPILER_FLAGS_${config}}")
      endif()
    endforeach()
  endif()

  if (_PREFIX MATCHES "CMAKE_(SHARED|MODULE|EXE)_LINKER_FLAGS")
    foreach (config SHARED MODULE EXE)
      set(CMAKE_${config}_LINKER_FLAGS_INIT "${QT_LINKER_FLAGS}")
    endforeach()
  endif()

  _cmake_initialize_per_config_variable(${ARGV})
endfunction()
