cmake_minimum_required(VERSION 2.8)
project(videosource)

set (INCLUDE_PATH_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/..)
list (APPEND ${INCLUDE_PATH_ROOT} ${CMAKE_CURRENT_SOURCE_DIR}/../include)
list (APPEND ${INCLUDE_PATH_ROOT} ${CMAKE_CURRENT_SOURCE_DIR}/../src)
list (APPEND ${INCLUDE_PATH_ROOT} ${CMAKE_CURRENT_SOURCE_DIR}/../src/system/win32/sdk/include)

set(LIB_PATH_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/../bin)
list (APPEND ${LIB_PATH_ROOT} ${CMAKE_CURRENT_SOURCE_DIR}/../src/system/win32/sdk/lib)

message("=====Begin CMake Project " ${PROJECT_NAME} " =====")

IF (WIN32)
    set (HEADERS
        ${CMAKE_CURRENT_SOURCE_DIR}/videosource.h
    )

    set (SOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/videosource.cpp
    )

    list (APPEND PUBLIC_LINK_LIBS common transfer agora_rtc_sdk)
    
    #include path
    include_directories(${INCLUDE_PATH_ROOT})

    #lib path
    LINK_DIRECTORIES(${LIB_PATH_ROOT})

    #output path
    set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/../bin)
    
    #generator executable
    add_executable(${PROJECT_NAME} ${HEADERS} ${SOURCES})

ELSEIF(XCODE)

ENDIF(WIN32)

#link libs
target_link_libraries(${PROJECT_NAME} ${PUBLIC_LINK_LIBS})

message("=====CMake Project " ${PROJECT_NAME} " complete .=====")
