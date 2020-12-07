
@echo off
rem Start local context, such that generation script does not have side effects:
setlocal
set StoredErrorLevel=0
rem Reset the error level (by running an always successfull command):
ver > nul

set RepositoryAddress=https://gitlab.com/ajgorhoe/iglib.workspace.scripts.git
rem https://gitlab.com/ajgorhoe/iglib.workspace.codedoc_develop.git
set CheckoutDir=scripts
set CheckoutBranch=master

set ScriptDir=%~dp0
set InitialDir=%CD%

cd %ScriptDir%

echo.
echo.
echo Initializing the scritp directory:
echo   %ScriptDir%\%CheckoutDir%
echo   Repository: %RepositoryAddress%
echo   Branch: %CheckoutBranch%


if not exist "%CheckoutDir%\.git\" (
  echo Repository not cloned yet.
  if exist "%CheckoutDir%" (
    echo.
    echo WARNING: Checkout directory already exists: 
	echo   %CheckoutDir%
	echo Git operations may fail and you may need to remove the following  dir.:
	echo   %ScriptDir%\%CheckoutDir%
	echo.
  )
  echo Repository not yet cloned, cloning...
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

REM echo Before new checkout block...
REM if defined CheckoutBranch (
  REM echo Checking out remote %CheckoutBranch% and track...
  REM call git checkout --track remotes/origin/%CheckoutBranch%
  REM echo Checking out without -- track parameter, in case already tracked...
  REM call git checkout remotes/origin/%CheckoutBranch%
  REM echo pulling %CheckoutBranch%...
  REM call git pull origin %CheckoutBranch%
REM )


echo Before ORIGINAL checkout block...
if defined CheckoutBranch (
  echo Checking out remote %CheckoutBranch% and track...
  call git checkout --track remotes/origin/%CheckoutBranch%
  echo Checking out without -- track parameter in case already tracked...
  call git checkout remotes/origin/%CheckoutBranch%
  echo pulling %CheckoutBranch%...
  call git pull origin %CheckoutBranch%
) else (
  REM echo Pulling all tracked branches...
  REM call git pull origin
)



:finalize
echo.

cd %InitialDir%


