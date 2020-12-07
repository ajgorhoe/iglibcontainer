
@echo off
rem Start local context, such that generation script does not have side effects:
setlocal
set StoredErrorLevel=0
rem Reset the error level (by running an always successfull command):
ver > nul

set ScriptDir=%~dp0
set InitialDir=%CD%

echo.
echo Updating modules in the directory:
  %ScriptDir%
echo.

call %ScriptDir%\UpdateModule_igcpp.bat
call %ScriptDir%\UpdateModule_igcpp.bat


cd %InitialDir%
endlocal

