
@echo off

rem Updates all IGLib dependencies.

setlocal

rem Reset the error level (by running an always successfull command):
ver > nul

REM rem Call bootstrapping script to define basic directories and scripts:
REM call "%~dp0\BootStrapScripting.bat"




rem ======================== Basic dependencies updates:

call "%~dp0\UpdateIGLibDependencies.bat"

rem ======================== Extended updates follow:

echo.
echo ---------------------------------------------------------------
echo Updating module ...
echo.
echo    Updating module ActiVizDotNet ...
rem call "%UpdateRepo%" "%~dp0\SettingsActiVizDotNet.bat"
call "%~dp0\UpdateActiVizDotNet.bat"
echo.

echo.
echo ---------------------------------------------------------------
echo    Updating module AForgeDotNet ...
rem call "%UpdateRepo%" "%~dp0\SettingsExternalAForgeDotNet.bat"
call "%~dp0\UpdateAForgeDotNet.bat"
echo.

echo.
echo   ... Updating extended IGLib dependencies completeed.
echo.

endlocal

