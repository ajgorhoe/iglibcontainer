
rem This is a bootstrapping script that initializes/updates the scripts/
rem module such that other module updating scripts can be called.
rem Command-line parameters:
rem   %1: CheckoutBranch - branch to be checked out (optional).

@echo off
rem Start local context, such that generation script does not have side effects:
setlocal
set StoredErrorLevel=0
rem Reset the error level (by running an always successfull command):
ver > nul

set RepositoryAddress=https://github.com/ajgorhoe/IGLib.workspace.scripts.git
set CheckoutDir=scripts
set CheckoutBranch=master

set ScriptDir=%~dp0
set InitialDir=%CD%
set ContainingDir=%ScriptDir%
set PrimaryScriptDir=%ScriptDir%scripts
set PrimaryInitializationScript=%ScriptDir%InitScriptDir.bat
set SecondaryInitializationScript=%ScriptDir%UpdateModule_scripts.bat

rem Take into account command-line arguments:
if "%~1" NEQ "" (
  if "%CheckoutBranch%" NEQ "%~1%" (
    echo %0:
    echo Checkout branch overridden by command-line argument:
	echo   %CheckoutBranch%
	echo   replaced by: 
	echo   %~1%
    echo   	
  )
  set CheckoutBranch=%~1
)

rem Try to ensure that the scripts/ directory is updated:
set IsPrimaryScriptDirUpdated=0
if exist "%PrimaryScriptDir%" (
  if exist "%SecondaryInitializationScript%" (
    rem If possible, call the secondary initialization script instead
	rem of the primary one:
	echo Calling secondary initialization script:
	echo   call "%SecondaryInitializationScript%" 
    call "%SecondaryInitializationScript%" 
	set IsPrimaryScriptDirUpdated=1
	rem We can skip the other work because initialization or update 
	rem of the scripts/ directory was already performed:
    goto finalize
  )
)

rem The usual script for updating the scripts/ module could not be called.
rem Attempt to initialize/update the module with the code block  below:
cd %ContainingDir%

echo.
echo.
echo Initializing the scritps module (BOOTSTRAPPING init script):
echo   %ContainingDir%\%CheckoutDir%
echo   Repository: %RepositoryAddress%
echo   Branch: %CheckoutBranch%
echo   From script:
echo   %0
echo.

if not exist "%CheckoutDir%\.git\" (
  echo Repository not cloned yet.
  if exist "%CheckoutDir%" (
    echo.
    echo WARNING: Checkout directory already exists: 
	echo   %CheckoutDir%
	echo Git operations may fail and you may need to remove the following  dir.:
	echo   %ContainingDir%\%CheckoutDir%
	echo.
  )
  echo Cloning repository...
  call git clone %RepositoryAddress% %CheckoutDir%
  echo.
)

echo Changing to checkout directory...
cd %CheckoutDir%

echo Adding remote origin...
call git remote add origin %RepositoryAddress%

echo Fetching remote branches from origin...
call git fetch origin
rem echo Pulling remote branches from origin...
rem call git pull origin

if defined CheckoutBranch (
  echo Checking out remote %CheckoutBranch% and track...
  call git checkout --track origin/%CheckoutBranch%
  echo Checking out without -- track parameter in case already tracked...
  call git checkout %CheckoutBranch%
  echo pulling %CheckoutBranch%...
  call git pull origin %CheckoutBranch%
) else (
  REM echo Pulling all tracked branches...
  REM call git pull origin
)

:finalize
echo.

cd %InitialDir%


