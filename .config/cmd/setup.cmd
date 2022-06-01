@echo off
powershell %XDG_CONFIG_HOME%\cmd\setup.ps1
@call %XDG_CONFIG_HOME%\cmd\environment.bat

:: Apply config patches
:: TODO Use mklink instead of xcopy, it will prevent overriding changed files in the destination dir.
xcopy /Y %USERPROFILE%\.config\cmd\patch %USERPROFILE%\ /S /E

IF NOT EXIST %USERPROFILE%\.config\vim\vimrc mklink %USERPROFILE%\_vimrc %USERPROFILE%\.config\vim\vimrc

mkdir %SYSTEMDRIVE%\bin
cp %SCOOP%\apps\busybox\current\busybox.exe %SYSTEMDRIVE%\bin
cp %SCOOP%\shims\sh.* %SYSTEMDRIVE%\bin
