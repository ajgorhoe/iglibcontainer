
rem This scripts runs other scripts that include those IGLib-related and
rem other models that are directly included in the containing directory.

@echo off
rem Start local context, such that generation script does not have side effects:
setlocal
rem Reset the error level (by running an always successfull command):
ver > nul

set ScriptDir=%~dp0
set InitialDir=%CD%
set PrimaryInitializationScript=%ScriptDir%..\workspace\InitScriptDir.bat

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

call %ScriptDir%\UpdateModule_00tests.bat "" "" %*
call %ScriptDir%\UpdateModule_00testsext.bat "" "" %*
call %ScriptDir%\UpdateModule_anka.bat "" "" %*


cd %InitialDir%
endlocal
