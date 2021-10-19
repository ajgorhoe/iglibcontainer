
rem This script restores / updates the workspaceprojects/ directory by 
rem cloning the repository that also contains the archived historical projects
rem that are all contained in a single repository. Then, the script also 
rem restores the projexts inside workspaceprojects/ that are contained in 
rem their own individual repositories.

rem If the other repository is currently checked out (the bare container)
rem then remove the workspaceprojects/ first to create a clean clone:
if exist "%~dp0\workspaceprojects\0readme_workspaceprojects_container.txt" (
  rd /s /q "%~dp0\workspaceprojects\"
)

call "%~dp0\UpdateModule_workspaceprojects_all.bat" 

call "%~dp0\workspaceprojects\UpdateDirectoryModules_WorkspaceProjects.bat"

