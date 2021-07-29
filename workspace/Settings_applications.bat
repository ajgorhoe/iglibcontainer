
@echo off

rem Sets parameters for cloning or updating the scripts/ directory.
rem For more details, see comments in Settings_scripts.bat.

call %~dp0\InitDirSettings.bat

set ModuleDirRelative=applications

set CheckoutBranch=master
set RepositoryAddress=https://github.com/ajgorhoe/IGLib.workspace.applications.git
set RepositoryAddressSecondary=
set RepositoryAddressLocal=
set Remote=origin
set RemoteSecondary=originSecondary
set RemoteLocal=local

set ModuleDir=%~dp0\%ModuleDirRelative%

rem If command-line arguments were specified then interpret them as another command and run the command:
if "%~1" NEQ "" (
    echo.
    echo Settings script: Executing recursve commnd specified by arguments:
    echo   cmd /c "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
    echo.
    cmd /c "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%~7" "%~8" "%~9"
)


