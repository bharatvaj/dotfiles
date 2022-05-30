powershell setup.ps1

# Apply config patches
xcopy %USERPROFILE%\.config\cmd\patch %USERPROFILE%\ /S /E

mklink %USERPROFILE%\_vimrc %USERPROFILE%\.config\vim\vimrc
