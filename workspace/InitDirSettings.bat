
@echo off



set WorkspaceDir=%~dp0

set InitScriptingCommand=%WorkspaceDir%\InitScripting.bat

if not exist "%InitScriptingCommand%" (
  echo.
  echo ERROR: InitScriptingCommand does not exist:
  echo   "%InitScriptingCommand%"
  echo.
)
call "%InitScriptingCommand%"

