
rem This scripts runs other scripts that include those IGLib-related and
rem other models that are directly included in the containing directory.

@echo off
rem Start local context, such that generation script does not have side effects:
setlocal
rem Reset the error level (by running an always successfull command):
ver > nul

rem Bootstrap scripting such that update scripts are available:
rem Important: bootstrapping must be called before settings, otherwise
rem it would overrite the essential repository settings.
set BootStrapScripting=%~dp0..\%BootStrapScripting.bat
echo.
echo SCRIPT: BootStrapScripting: "%BootStrapScripting%"
echo.
if not exist "%BootStrapScripting%" (
  echo.
  echo ERROR: Variable BootStrapScripting does not contain a valid
  echo   script path.
  echo.
  goto finalize
)
call "%BootStrapScripting%"


echo.
echo UPDATING DIRECTORY MODULES: workspace/base/
echo.

rem Perform updates of individual repos contained in this directory:
rem
rem Passing parameters in the way they are passed is kept in order to
rem support legacy update scripts (although in this directory, all
rem scripts have already been updated to the new modus operandi).
call "%~dp0\UpdateModule_data.bat" "" "" %*
call "%~dp0\UpdateModule_iglib.bat" "" "" %*
call "%~dp0\UpdateModule_iglearn.bat" "" "" %*
call "%~dp0\UpdateModule_igsandbox.bat" "" "" %*
call "%~dp0\UpdateModule_igsolutions.bat" "" "" %*
call "%~dp0\UpdateModule_igtest.bat" "" "" %*
call "%~dp0\UpdateModule_shelldev.bat" "" "" %*
call "%~dp0\UpdateModule_unittests.bat" "" "" %*


:finalize

endlocal

