@echo off

rem This scripts runs other scripts that update those IGLib-related and
rem other models that are directly included in the containing directory.
rem Command-line arguments:

rem Start local context, such that generation script does not have side effects:
setlocal
rem Reset the error level (by running an always successfull command):
ver > nul


rem LEGACY code:
rem Legacy code below is not needed any more (not even for execution 
rem of legacy update scripts) because legacy scripts are now part of
rem repository and do not need to be cloned from elsewhere. 
REM set ScriptDir=%~dp0
REM set InitialDir=%CD%
REM set PrimaryInitializationScript=%ScriptDir%InitScriptDir.bat

REM echo.
REM echo.
REM echo.
REM echo Updating modules in the directory:
REM echo   %ScriptDir%
REM echo.
REM echo.

REM if exist "%PrimaryInitializationScript%" (
 REM echo Calling primary initialization script:
 REM echo   call "%PrimaryInitializationScript%" %*
 REM call "%PrimaryInitializationScript%" %*
REM ) else (
  REM echo WARNING: Primary initialization script does not exist:
  REM echo   "%PrimaryInitializationScript%"
  REM echo   The workspace/scripts/ module may not be initialized properly.
REM )

REM rem Initialization of scripts/ module below should be performed first...
REM call %~dp0\UpdateModule_scripts.bat "" "" %*

echo.
echo UPDATING DIRECTORY MODULES: workspace/
echo.

rem Perform updates of individual contained in this directory:
rem
rem Passing parameters in the way they are passed is kept in order to
rem support legacy update scripts (although in this directory, all
rem scripts have already been updated to the new modus operandi).
call "%~dp0\UpdateModule_codedoc_new.bat" "" "" %*
call "%~dp0\UpdateModule_codedoc.bat" "" "" %*
call "%~dp0\UpdateModule_igcpp.bat" "" "" %*
call "%~dp0\UpdateModule_z_courses.bat" "" "" %*
call "%~dp0\UpdateModule_applications.bat" "" "" %*

:finalize

endlocal

