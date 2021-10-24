
@echo off

rem Updates all IGLib dependencies plus some other external modules aimed
rem at testing, experimentation, etc.

setlocal

rem Reset the error level (by running an always successfull command):
ver > nul

REM rem Call bootstrapping script to define basic directories and scripts:
REM call "%~dp0\BootStrapScripting.bat"




rem ======================== Extended dependencies updates :

call "%~dp0\UpdateIGLibDependenciesExtended.bat"

rem ======================== Extra updates follow:

echo.
echo ---------------------------------------------------------------
echo Updating extra IGLib's external dependencies ...
echo.

echo.
echo    Updating module AccordDotNet ...
rem call "%UpdateRepo%" "%~dp0\SettingsAccordDotNet.bat"
call "%~dp0\UpdateAccordDotNet.bat"
echo.

echo.
echo   ... Updating all available external modules completeed.
echo.

endlocal

