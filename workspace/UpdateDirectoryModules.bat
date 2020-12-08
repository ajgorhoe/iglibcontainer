
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

call %ScriptDir%\UpdateModule_scripts.bat
call %ScriptDir%\UpdateModule_codedoc_new.bat
call %ScriptDir%\UpdateModule_codedoc.bat
call %ScriptDir%\UpdateModule_igcpp.bat
call %ScriptDir%\UpdateModule_z_courses.bat
call %ScriptDir%\UpdateModule_applications.bat
call %ScriptDir%\UpdateModule_develop_cobik.bat


cd %InitialDir%
endlocal

