
rem This scripts runs other scripts that include those IGLib-related and
rem other models that are directly included in the containing directory.

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

call %ScriptDir%\UpdateModule_00tests.bat
call %ScriptDir%\UpdateModule_00testsext.bat
call %ScriptDir%\UpdateModule_anka.bat


cd %InitialDir%
endlocal

