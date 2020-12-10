
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
set PrimaryInitializationScript=%ScriptDir%InitScriptDir.bat
set SecondaryInitializationScript=%ScriptDir%UpdateModule_scripts.bat
set PrimaryScriptDir=%ScriptDir%scripts\

echo.
echo.
echo.
echo Updating modules in the directory:
echo   %ScriptDir%
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
    goto AfterSecondaryScriptCalled
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
    echo ERROR: Neither primary nor secondary initialization script could 
	echo   be called to uppdate the scripts/ directory.
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

rem Initialization of scripts/ module below should be performed first...
call "%SecondaryInitializationScript%"
:AfterSecondaryScriptCalled

call %ScriptDir%\UpdateModule_codedoc_new.bat
call %ScriptDir%\UpdateModule_codedoc.bat
call %ScriptDir%\UpdateModule_igcpp.bat
call %ScriptDir%\UpdateModule_z_courses.bat
call %ScriptDir%\UpdateModule_applications.bat
call %ScriptDir%\UpdateModule_develop_cobik.bat


:finalize
cd %InitialDir%
endlocal

