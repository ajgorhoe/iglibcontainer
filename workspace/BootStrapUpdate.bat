@echo off

REM This script just passes execution to 
REM bootstrappingscripts/BootStrapUpdate.bat

setlocal

set RedirectScript=%~dp0\bootstrappingscripts\BootStrapUpdate.bat

echo.
echo %~n0%~x0: redirecting the call to:
echo   %RedirectScript%
echo.
call "%RedirectScript%"

endlocal

REM Legacy code, can be removed afer some time:



REM :: Performs bootstrapping by calling BootStrapScripting.bat
REM :: and in addition, it forces updating IGLibScripts.

REM :: BootStrapScripting.bat itself will skip updating IGLibScripts directory
REM :: if it is already clones, and the curent script makes sure that update is
REM :: performed, terefore it can be run whenever one would like to pull the
REM :: eventual repository updates.

REM setlocal

REM :: Reset the error level (by running an always successfull command):
REM ver > nul

REM :: Call bootstrapping script to define basic directories and strings:
REM call "%~dp0BootStrapScripting.bat"

REM :: Skip updating if BootStrapScripting indicated that it has been 
REM :: performed already:
REM if %BootstrapRepoUpdated% neq 0 goto SkipUpdating
	REM :: Update IGLibScripts, even if the repo is already cloned:
	REM :: Old code: "%UpdateRepo%" "%~dp0\SettingsIGLibScriptsBootstrap.bat"
	REM "%UpdateRepo%" "%BootstrapSettings%"
REM :SkipUpdating

REM BootStrapScripting

REM endlocal
