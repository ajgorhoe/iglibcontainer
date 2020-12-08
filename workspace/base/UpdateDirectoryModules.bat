
@echo off
rem Start local context, such that generation script does not have side effects:
setlocal
set StoredErrorLevel=0
rem Reset the error level (by running an always successfull command):
ver > nul

set ScriptDir=%~dp0
set InitialDir=%CD%

echo.
echo.
echo.
echo Updating modules in the directory:
echo   %ScriptDir%
echo.

call %ScriptDir%\InitScriptDir.bat

call %ScriptDir%\UpdateModule_data.bat
call %ScriptDir%\UpdateModule_igapp.bat
call %ScriptDir%\UpdateModule_iglib.bat
call %ScriptDir%\UpdateModule_igsandbox.bat
call %ScriptDir%\UpdateModule_igsolutions.bat
call %ScriptDir%\UpdateModule_igtest.bat
call %ScriptDir%\UpdateModule_unittests.bat


cd %InitialDir%
endlocal

