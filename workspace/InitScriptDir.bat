
REM rem This is a bootstrapping script that initializes/updates the scripts/
REM rem module such that other module updating scripts can be called.
REM rem Command-line parameters:
REM rem   %1: CheckoutBranch - branch to be checked out (optional).

REM @echo off
REM rem Start local context, such that generation script does not have side effects:
REM setlocal
REM set StoredErrorLevel=0
REM rem Reset the error level (by running an always successfull command):
REM ver > nul


REM call %~dp0\UpdateRepo.bat %~dp0\Settings_scripts.bat

REM ver > nul

REM rem The LEGACY code below is skipped!
REM goto finalize



REM set RepositoryAddress=https://github.com/ajgorhoe/IGLib.modules.IGLibScripts.git
REM set CheckoutDir=scripts11
REM set CheckoutBranch=master

REM set ScriptDir=%~dp0
REM set InitialDir=%CD%
REM set ContainingDir=%ScriptDir%
REM set PrimaryScriptDir=%ScriptDir%scripts
REM set PrimaryInitializationScript=%ScriptDir%InitScriptDir.bat
REM set SecondaryInitializationScript=%ScriptDir%UpdateModule_scripts.bat

REM rem Take into account command-line arguments:
REM if "%~1" NEQ "" (
  REM if "%CheckoutBranch%" NEQ "%~1%" (
    REM echo %0:
    REM echo Checkout branch overridden by command-line argument:
	REM echo   %CheckoutBranch%
	REM echo   replaced by: 
	REM echo   %~1%
    REM echo   	
  REM )
  REM set CheckoutBranch=%~1
REM )

REM rem Try to ensure that the scripts/ directory is updated:
REM set IsPrimaryScriptDirUpdated=0
REM if exist "%PrimaryScriptDir%" (
  REM if exist "%SecondaryInitializationScript%" (
    REM rem If possible, call the secondary initialization script instead
	REM rem of the primary one:
	REM echo Calling secondary initialization script:
	REM echo   call "%SecondaryInitializationScript%" 
    REM call "%SecondaryInitializationScript%" 
	REM set IsPrimaryScriptDirUpdated=1
	REM rem We can skip the other work because initialization or update 
	REM rem of the scripts/ directory was already performed:
    REM goto finalize
  REM )
REM )

REM rem The usual script for updating the scripts/ module could not be called.
REM rem Attempt to initialize/update the module with the code block  below:
REM cd %ContainingDir%

REM echo.
REM echo.
REM echo Initializing the scritps module (BOOTSTRAPPING init script):
REM echo   %ContainingDir%\%CheckoutDir%
REM echo   Repository: %RepositoryAddress%
REM echo   Branch: %CheckoutBranch%
REM echo   From script:
REM echo   %0
REM echo.

REM if not exist "%CheckoutDir%\.git\" (
  REM echo Repository not cloned yet.
  REM if exist "%CheckoutDir%" (
    REM echo.
    REM echo WARNING: Checkout directory already exists: 
	REM echo   %CheckoutDir%
	REM echo Git operations may fail and you may need to remove the following  dir.:
	REM echo   %ContainingDir%\%CheckoutDir%
	REM echo.
  REM )
  REM echo Cloning repository...
  REM call git clone %RepositoryAddress% %CheckoutDir%
  REM echo.
REM )

REM echo Changing to checkout directory...
REM cd %CheckoutDir%

REM echo Adding remote origin...
REM call git remote add origin %RepositoryAddress%

REM echo Fetching remote branches from origin...
REM call git fetch origin
REM rem echo Pulling remote branches from origin...
REM rem call git pull origin

REM if defined CheckoutBranch (
  REM echo Checking out remote %CheckoutBranch% and track...
  REM call git checkout --track origin/%CheckoutBranch%
  REM echo Checking out without -- track parameter in case already tracked...
  REM call git checkout %CheckoutBranch%
  REM echo pulling %CheckoutBranch%...
  REM call git pull origin %CheckoutBranch%
REM ) else (
  REM REM echo Pulling all tracked branches...
  REM REM call git pull origin
REM )

REM :finalize
REM echo.

REM cd %InitialDir%


