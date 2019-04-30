cmake_minimum_required(VERSION 2.8)
project(test)

set (INCLUDE_PATH_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/..)

message("=====Begin CMake Project " ${PROJECT_NAME} " =====")

IF (WIN32)
    set (HEADERS
        ${CMAKE_CURRENT_SOURCE_DIR}/test.h
    )

    set (SOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/test.cpp
    )

    list (APPEND PUBLIC_LINK_LIBS common transfer agora_mvrtc_sdk)

    #include path
    include_directories(
        ${INCLUDE_PATH_ROOT}/include 
        ${INCLUDE_PATH_ROOT}/src)

    #lib path
    LINK_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/../bin)

    #output path
    set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/../bin) 

    #generator executabl.
    add_executable(${PROJECT_NAME} ${HEADERS} ${SOURCES})

ELSEIF(XCODE)

ENDIF(WIN32)

#link libs
target_link_libraries(${PROJECT_NAME} ${PUBLIC_LINK_LIBS})

message("=====CMake ProjectName: " ${PROJECT_NAME} " complete .=====")