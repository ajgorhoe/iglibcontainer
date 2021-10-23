
@echo off

rem Updates specific external modulles.
rem This script is currently used for testing and we will see where this goes.

setlocal

rem Reset the error level (by running an always successfull command):
ver > nul

rem Call bootstrapping script to define basic directories and scripts:
call "%~dp0\..\bootstrappingscripts\BootStrapScripting.bat"

echo.
echo Updating external module %ModuleDirRelative% ...
echo.
echo Settings:
call "%PrintRepoSettings%"
echo.
rem echo @@@@@@@@@@@@@@@@@@@@@
rem echo Calling:
rem echo   "%UpdateRepo%" "%~dp0\SettingsZedGraph.bat"
call "%UpdateRepo%" "%~dp0\SettingsZedGraph.bat"
echo.
echo   ... Updating external modules completeed.
echo.


endlocal

