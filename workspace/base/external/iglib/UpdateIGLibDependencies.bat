
@echo off

rem Updates all IGLib modules.

setlocal

rem Reset the error level (by running an always successfull command):
ver > nul

REM rem Call bootstrapping script to define basic directories and scripts:
REM call "%~dp0\BootStrapScripting.bat"

echo.
echo Updating external IGLib dependencies (basic set) ...
echo.

echo.
echo    Updating module ZedGraph ...
rem call "%UpdateRepo%" "%~dp0\SettingsZedGraph.bat"
call "%~dp0\UpdateZedGraph.bat"
echo.

echo.
echo    Updating module MathNetNumerics ...
rem call "%UpdateRepo%" "%~dp0\SettingsMathNetNumerics.bat"
call "%~dp0\UpdateMathNetNumerics.bat"
echo.

echo.
echo   ... Updating basic IGLib dependencies completed.
echo.

endlocal

