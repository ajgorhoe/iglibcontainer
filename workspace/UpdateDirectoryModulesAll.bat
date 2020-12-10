
rem This scripts runs other scripts that include ALL IGLib-related and
rem other models included in any containing directory. This is done by
rem successivelly calling other scripts that update modules in specific
rem principa directories in the prescribed structure, such as workspace, workspaceprojects, workspace/base, etc.

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
echo Updating IGLib modules in ALL directories...
echo   %ScriptDir%
echo.

set PrimaryScript=%ScriptDir%\InitScriptDir.bat
set PrimaryScriptDir=%ScriptDir%\scripts\

if not exist "%PrimaryScriptDir%" (
  if 
)


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

