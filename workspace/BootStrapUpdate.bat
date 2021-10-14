@echo off

REM This script just passes execution to 
REM bootstrappingscripts/BootStrapUpdate.bat

setlocal

set RedirectScript=%~dp0\bootstrappingscripts\BootStrapUpdate.bat

echo.
echo %~n0%~x0: redirecting the call to:
echo   %RedirectScript%
echo.
call "%RedirectScript%"

endlocal

