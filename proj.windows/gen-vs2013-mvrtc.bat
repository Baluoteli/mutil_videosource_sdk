set DEST_ROOT=.\build\vs2013_mvrtc
set DEST_ROOM_X64=.\build\vs2013_mvrtc_x64
set AGORA_SDK_VERSION=%1
set AGORA_SDK_BUILD_NUMBER=%2

if exist %DEST_ROOT% goto DONE_CHECK_DIR
mkdir %DEST_ROOT%
:DONE_CHECK_DIR


if exist %DEST_ROOT% goto DONE_CHECK_DIR_X64
mkdir %DEST_ROOT_X64%
:DONE_CHECK_DIR_X64

@echo off
cd %DEST_ROOT%
echo localPath: %cd%
cmake -T v120_xp -G "Visual Studio 12 2013" ..\..


