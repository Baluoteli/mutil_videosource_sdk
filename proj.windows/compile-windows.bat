@echo off
echo Usage: compile wayang-windows[32/64]
echo.
SETLOCAL
if "%1" == "32" (set machine=x86) else (set machine=x64)

echo machine:%machine%
echo slnfile:%2
echo config:%3
echo ==================================================================================

set localpath=%~dp0
echo localpath:%localpath%
cd %~dp0
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" %machine%
msbuild %2 /t:Rebuild /p:Configuration=%3 /p:SubsystemVersion=5.1
pause

