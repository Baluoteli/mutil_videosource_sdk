cmake_minimum_required(VERSION 2.8)
project(mutilvideomanager)

set (INCLUDE_PATH_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/..)

message("=====Begin CMake Project " ${PROJECT_NAME} " =====")

IF (WIN32) 
    set (HEADERS
        ${CMAKE_CURRENT_SOURCE_DIR}/mutilvideomanager.h
    )

    set (SOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/mutilvideomanager.cpp
    )

    list (APPEND PUBLIC_LINK_LIBS common transfer)

    #include path
    include_directories(${INCLUDE_PATH_ROOT}/include ${INCLUDE_PATH_ROOT}/src)

    #lib path
    LINK_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/../bin)

    #output path
    set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/../bin) 

    #generator lib vcxproj
    set(TARGET_NAME agora_mvrtc_sdk)
    add_library(${TARGET_NAME} SHARED ${HEADERS} ${SOURCES})

ELSEIF(XCODE)

ENDIF(WIN32)

#link libs
target_link_libraries(${TARGET_NAME} ${PUBLIC_LINK_LIBS})

message("=====CMake ProjectName: " ${PROJECT_NAME} " complete .=====")
