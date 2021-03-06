cmake_minimum_required(VERSION 2.8)
project(videosource)

include (../common.cmake)

set (INCLUDE_PATH_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/../../include)
set (INCLUDE_PATH_RTCSDK ${CMAKE_CURRENT_SOURCE_DIR}/../../src/system/win32/sdk/include)

set (LIB_PATH_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/../bin)
set (LIB_PATH_RTCSDK ${CMAKE_CURRENT_SOURCE_DIR}/../../src/system/win32/sdk/lib)

message("=====Begin CMake Projecd " ${PROJECT_NAME} " =====")

IF (WIN32)
    set (HEADERS
        ${CMAKE_CURRENT_SOURCE_DIR}/videosource.h
    )

    set (SOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/videosource.cpp
    )

    list (APPEND PUBLIC_LINK_LIBS common transfer agora_rtc_sdk)
    
    #include path
    include_directories( ${INCLUDE_PATH_ROOT} ${INCLUDE_PATH_RTCSDK})

    #lib path
    link_directories (${LIB_PATH_ROOT} ${LIB_PATH_RTCSDK})

    #output path
    set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/../bin)
    
    #generator executable
    add_executable(${PROJECT_NAME} ${HEADERS} ${SOURCES})
    
    #copy rtcsdk dll to bin executable directory.
    IF (NOT EXISTS ${PROJECT_SOURCE_DIR}/../bin/debug)
        message("debug command")
        add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../../src/system/win32/sdk/dll/** ${PROJECT_SOURCE_DIR}/../bin/debug/**
    )
    ENDIF()

    IF (NOT EXISTS ${PROJECT_SOURCE_DIR}/../bin/release)
        message("release command")
        add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/../../src/system/win32/sdk/dll/** ${PROJECT_SOURCE_DIR}/../bin/release/**
    )
    ENDIF()

ELSEIF(XCODE)

ENDIF(WIN32)

#link libs
target_link_libraries(${PROJECT_NAME} ${PUBLIC_LINK_LIBS})

message("=====CMake Project " ${PROJECT_NAME} " complete .=====")
