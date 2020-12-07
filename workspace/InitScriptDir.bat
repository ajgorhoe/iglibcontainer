
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
SET InitialDir=%CD%
set BaseScriptDir=%ScriptDir%\scripts
set BaseSettingsScript=%SettingsScriptDir%\Settings.bat

cd %ScriptDir%




cd %InitialDir%


