
rem This script restores / updates the workspaceprojects/ directory by 
rem cloning the directory that also contains the archived historical projects
rem that are all contained in a single repository. Then, the script also 
rem restores the projexts inside workspaceprojects/ that are contained in 
rem their own individual repositories.


call "%~dp0\UpdateModule_workspaceprojects_container.bat" 

call "%~dp0\workspaceprojects\UpdateDirectoryModules_WorkspaceProjects.bat"

