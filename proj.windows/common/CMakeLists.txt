cmake_minimum_required(VERSION 2.8)
project(common)

include (../common.cmake)

set (INCLUDE_PATH_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/..)

message("=====Begin CMake Project " ${PROJECT_NAME} " =====")

IF (WIN32)
    set (HEADERS
        ${CMAKE_CURRENT_SOURCE_DIR}/common.h
    )

    set (SOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/common.cpp
    )

    include_directories(${INCLUDE_PATH_ROOT}/include ${INCLUDE_PATH_ROOT}/src)
    set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/../bin)
    add_library(${PROJECT_NAME} ${HEADERS} ${SOURCES})

ELSEIF(XCODE)

ENDIF(WIN32)

message("=====CMake Project " ${PROJECT_NAME} " complete .=====")
