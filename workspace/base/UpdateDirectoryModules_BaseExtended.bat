
@echo off

rem Updates base AND some additional modules (that are not updated by
rem UpdateDirectoryModules_Base.bat).
rem 
rem These are mainly modules that are not commonly used and are 
rem kind of archived for reference if needed. Still their repositories
rem are normally in writeable state.

rem Start local context, such that generation script does not have side effects:
setlocal
rem Reset the error level (by running an always successfull command):
ver > nul

rem First, perform the usual update that updates the basic modules:
rem (this will also perform bootstrapping)
call "%~dp0\UpdateDirectoryModules_Base.bat"

rem Then call addditional updates:

call "%~dp0\iglib\UpdateDirectoryModules_Additional.bat" %*


:finalize
cd %InitialDir%
endlocal

