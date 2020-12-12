
rem This scripts runs other scripts that include those IGLib-related and
rem other models that are directly included in the containing directory.
rem Command-line arguments:
rem   %1: branch / tag name that is checked out (optional, default is master)

@echo off
rem Start local context, such that generation script does not have side effects:
setlocal
rem Reset the error level (by running an always successfull command):
ver > nul

set ScriptDir=%~dp0
set InitialDir=%CD%
set PrimaryInitializationScript=%ScriptDir%InitScriptDir.bat

echo.
echo.
echo.
echo Updating modules in the directory:
echo   %ScriptDir%
echo.
echo.

if exist "%PrimaryInitializationScript%" (
 echo Calling primary initialization script:
 echo   call "%PrimaryInitializationScript%" %*
 call "%PrimaryInitializationScript%" %*
) else (
  echo WARNING: Primary initialization script does not exist:
  echo   "%PrimaryInitializationScript%"
  echo   The workspace/scripts/ module may not be initialized properly.
)

rem Initialization of scripts/ module below should be performed first...
call %ScriptDir%\UpdateModule_scripts.bat "" "" %*

call %ScriptDir%\UpdateModule_codedoc_new.bat "" "" %*
call %ScriptDir%\UpdateModule_codedoc.bat "" "" %*
call %ScriptDir%\UpdateModule_igcpp.bat "" "" %*
call %ScriptDir%\UpdateModule_z_courses.bat "" "" %*
call %ScriptDir%\UpdateModule_applications.bat "" "" %*
call %ScriptDir%\UpdateModule_develop_cobik.bat "" "" %*

:finalize
cd %InitialDir%
endlocal

