cmake_minimum_required(VERSION 2.8)
project(transfer)

set (INCLUDE_PATH_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/..)

message("=====Begin CMake ProjectName: " ${PROJECT_NAME} " =====")

IF (WIN32)
    set (HEADERS
        ${CMAKE_CURRENT_SOURCE_DIR}/transfer.h
    )

    set (SOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/transfer.cpp
    )

    list (APPEND PUBLIC_LINK_LIBS common )
    #list (APPEND DEPENDENCIES_LIST common)

    #include path
    include_directories(${INCLUDE_PATH_ROOT}/include ${INCLUDE_PATH_ROOT}/src)

    #lib path
    LINK_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/../bin)

    #output path
    set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/../bin) 

    add_library(${PROJECT_NAME} ${HEADERS} ${SOURCES})

    #dependencies list
    #ADD_DEPENDENCIES(${PROJECT_NAME},${DEPENDENCIES_LIST})

ELSEIF(XCODE)

ENDIF(WIN32)

#link libs
target_link_libraries(${PROJECT_NAME} ${PUBLIC_LINK_LIBS})

message("=====CMake ProjectName: " ${PROJECT_NAME} " complete .=====")
