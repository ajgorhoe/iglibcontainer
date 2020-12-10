
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
set PrimaryScriptDir=%ScriptDir%scripts\
set PrimaryInitializationScript=%ScriptDir%InitScriptDir.bat
set SecondaryInitializationScript=%ScriptDir%UpdateModule_scripts.bat

echo.
echo.
echo Updating IGLib modules in ALL directories...
echo.
echo.


rem Try to ensure that the scripts/ directory is updated:
set IsPrimaryScriptDirUpdated=0
if exist "%PrimaryScriptDir%" (
  if exist %SecondaryInitializationScript% (
    rem Reset errorlevel:
	echo Calling secondary initialization script:
	echo   call "%SecondaryInitializationScript%" %*
    call "%SecondaryInitializationScript%" %*
	set IsPrimaryScriptDirUpdated=1
  )
)
if %IsPrimaryScriptDirUpdated% EQU 0 (
  if exist "%PrimaryInitializationScript%" (
	  echo Calling primary initialization script:
	  echo   call "%PrimaryInitializationScript%" %*
      call "%PrimaryInitializationScript%" %*
	  set IsPrimaryScriptDirUpdated=1

  )
)
if %IsPrimaryScriptDirUpdated% EQU 0 (
  if not exist "%PrimaryScriptDir%" (
    echo.
	echo.
    echo ERROR: Neither primary nor secondary initialization script could 
	echo   be called to uppdate the scripts/ directory.
	echo Operation aborted.
	echo.
	echo.
	goto finalize
  ) else (
      echo.
      echo WARNING: Neither primary nor secondary initialization script could 
	  echo   be called to uppdate the scripts/ directory.
	  echo This may not be fatal because the scripts/ dir. exists.
      echo.
  )
)


call %ScriptDir%\UpdateModule_scripts.bat
call %ScriptDir%\UpdateModule_codedoc_new.bat
call %ScriptDir%\UpdateModule_codedoc.bat
call %ScriptDir%\UpdateModule_igcpp.bat
call %ScriptDir%\UpdateModule_z_courses.bat
call %ScriptDir%\UpdateModule_applications.bat
call %ScriptDir%\UpdateModule_develop_cobik.bat

:finalize

cd %InitialDir%
endlocal

