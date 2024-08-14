@echo on

rem TODO Make this work for Administrator accounts

where scoop >nul 2>&1
if not %errorlevel% equ 0 (
rem Run this in powershell, before
    echo 	Run this in powershell to install scoop and run this script again:
    echo 	Set-ExecutionPolicy RemoteSigned -scope CurrentUser
    echo 	powershell -Command "Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')"
    rem Install only the absolute essentials
    echo scoop install 7zip clink dos2unix grep gpg lf make mingit mpv sed sudo unzip vim
    exit 1
)

@call %~dp0\..\profile.cmd

rem Apply config patches
rem TODO Use mklink instead of xcopy, it will prevent overriding changed files in the destination dir.
xcopy /Y %USERPROFILE%\.config\cmd\patch %USERPROFILE%\ /S /E

rem IF NOT EXIST %USERPROFILE%\.config\vim\vimrc mklink %USERPROFILE%\_vimrc %USERPROFILE%\.config\vim\vimrc

if "%SCOOP%" == "" (
	echo "SCOOP variable not set, defaulting to %USERPROFILE%\scoop"
	set SCOOP=%USERPROFILE%\scoop
)

mkdir %SYSTEMDRIVE%\bin
copy %SCOOP%\apps\busybox\current\busybox.exe %SYSTEMDRIVE%\bin
copy %SCOOP%\shims\sh.* %SYSTEMDRIVE%\bin

rem TODO Report this in scoop and remove this line
del %SCOOP%\apps\gpg\current\bin\gpgconf.ctl

call clink autorun install -- clink inject -q
call clink set clink.autostart "%XDG_CONFIG_HOME%\profile.cmd"
call clink set clink.autoupdate off

