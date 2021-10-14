
@echo off

REM This script just passes execution to 
REM bootstrappingscripts/BootStrapScripting.bat

set RedirectScript=%~dp0\bootstrappingscripts\BootStrapScripting.bat

echo.
echo %~n0%~x0: redirecting the call to:
echo   %RedirectScript%
echo.
call "%RedirectScript%"


