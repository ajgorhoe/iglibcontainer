
@echo off

rem Updates some additional modules that are not updated by
rem UpdateDirectoryModules_Base.bat.
rem 
rem These are mainly modules that are not commonly used and are 
rem kind of archived for reference if needed. Still their repositories
rem are normally in writeable state.

rem Start local context, such that generation script does not have side effects:
setlocal
rem Reset the error level (by running an always successfull command):
ver > nul


rem Update the external modules for IGLib by calling into 
rem ../iglib/00_initmodules/

call "%~dp0\iglib\00_initmodules\UpdateIGLibModuleRepos.bat

rem Finally, update the additional modules that are not updated by 
rem the basic update string:

call "%~dp0\UpdateModule_bin.bat" "" "" %*

call "%~dp0\UpdateModule_igapp.bat" "" "" %*



:finalize
cd %InitialDir%
endlocal

