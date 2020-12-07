
@echo off
rem Start local context, such that generation script does not have side effects:
setlocal
set StoredErrorLevel=0
rem Reset the error level (by running an always successfull command):
ver > nul

set RepositoryAddress=https://gitlab.com/ajgorhoe/iglib.workspace.igcpp.git
rem https://gitlab.com/ajgorhoe/iglib.workspace.codedoc_develop.git

set CheckoutDir=codedoc_develop
set CheckoutBranch=master

set DirLocal=%~dp0
SET InitialDir=%CD%
set BaseScriptDir=%ScriptDir%\..\scripts
set BaseSettingsScript=%SettingsScriptDir%\Settings.bat

rem get information on the script:
call %BaseSettingsScript%



rem Call the appropriate settings script:
call %SettingsScript_GitModule% %RepositoryAddress% %CheckoutDir% %CheckoutBranch%

call %GitUpdateModuleScript%


:finalize

cd %InitialDir%


IF 1 NEQ 0 (
  if defined StoredErrorLevel (
    set ERRORLEVEL=%StoredErrorLevel%
  ) else (
    rem Print settings that were used in the current generation:
    echo.
    echo __________________________________
    echo Generation script - SETTINGS used:
    call %PrintSettingsScript% %*
    echo __________________________________
    echo.
  )
)

if %StoredErrorLevel% NEQ 0 (
  set ERRORLEVEL=%StoredErrorLevel%
  echo An error occurred in %0:
  echo   StoredErrorLevel = %StoredErrorLevel%
  rem echo   ERRORLEVEL = %ERRORLEVEL%
  echo   Error message: %ErrorMessage%
  exit /b %StoredErrorLevel%
)

endlocal

