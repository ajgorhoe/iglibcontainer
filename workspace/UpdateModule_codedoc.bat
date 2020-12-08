
@echo off
rem Start local context, such that generation script does not have side effects:
setlocal
set StoredErrorLevel=0
rem Reset the error level (by running an always successfull command):
ver > nul

set RepositoryAddress=https://gitlab.com/ajgorhoe/iglib.workspace.codedoc.git
set ModuleDirRelative=doc\codedoc
set CheckoutBranch=master

set ScriptDir=%~dp0
SET InitialDir=%CD%
set BaseScriptDir=%ScriptDir%\scripts
set BaseSettingsScript=%BaseScriptDir%\Settings.bat

call %BaseSettingsScript%

call %SettingsScript_GitModule% %RepositoryAddress% %ModuleDir% %CheckoutBranch%

call %GitUpdateModuleScript% %RepositoryAddress% %ModuleDir% %CheckoutBranch%


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







