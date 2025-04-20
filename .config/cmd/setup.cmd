@echo on
rem TODO Make this work for Administrator accounts


goto :main

:set_var
    set _tail=%*
    call set _tail=%%_tail:*%1 =%%
    echo Setting "%~1" to "%_tail%"
    setx %~1 "%_tail%"
    set %~1=%_tail%
goto :eof

:add_path
    for /f "tokens=2* skip=2" %%i in ('reg query HKCU\Environment /v PATH') do (
        echo %%j | find /i "%~1" || call :set_var PATH %%j;%~1
    )
goto :eof

:update_shim <shim_file> <path> <args>
    echo path = "%~2"> %~1
    echo args = %~3>> %~1
goto :eof

:main
where scoop >nul 2>&1
if not %errorlevel% equ 0 (
rem Run this in powershell, before
    echo 	Run this in powershell to install scoop and run this script again:
    echo 	Set-ExecutionPolicy RemoteSigned -scope CurrentUser
    echo 	powershell -Command "Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')"
    rem Install only the absolute essentials
    echo scoop config shim 71
    echo scoop reset -a
    echo scoop install 7zip clink dos2unix grep gpg lf make mingit mpv sed sudo unzip vim
    exit 1
)

@call %~dp0\..\profile.cmd %1

call :set_var XDG_ROOT %USERPROFILE%
if NOT "%1" == "" call :set_var XDG_ROOT ""

call :add_path "C:\bin"
call :set_var XDG_ROOT %USERPROFILE%
call :set_var XDG_CONFIG_HOME %XDG_ROOT%\.config
call :set_var XDG_DATA_HOME %XDG_ROOT%\.local\share
call :set_var XDG_CACHE_HOME %XDG_ROOT%\.cache
call :set_var SCOOP %XDG_ROOT%\scoop

call :set_var VISUAL vim
call :set_var EDITOR %VISUAL%

call :set_var GNUPGHOME %XDG_DATA_HOME%\gnupg
call :set_var GPGHOME %XDG_DATA_HOME%\gnupg
call :set_var PASSWORD_STORE_DIR %XDG_DATA_HOME%\pass
call :set_var PASS_BASE_DIR %XDG_DATA_HOME%\pass

call :set_var LYNX_CFG %XDG_CONFIG_HOME%/lynx/lynx.cfg
call :set_var LYNX_LSS %XDG_CONFIG_HOME%/lynx/lynx.lss

call :set_var FUZZER fzf

call :add_path %USERPROFILE%\.local\bin\cmd

rem Apply config patches
rem TODO Use mklink instead of xcopy, it will prevent overriding changed files in the destination dir.
xcopy /Y %XDG_ROOT%\.config\cmd\patch %XDG_ROOT%\ /S /E

mkdir %SYSTEMDRIVE%\bin
if EXIST "%SCOOP%\apps\busybox\current\busybox.exe" (
    copy "%SCOOP%\apps\busybox\current\busybox.exe" %SYSTEMDRIVE%\bin
    copy "%SCOOP%\apps\scoop\current\supporting\shims\71\shim.exe" %SYSTEMDRIVE%\bin\sh.exe
    call :update_shim C:\bin\sh.shim "C:\bin\busybox.exe" "sh -l"
)
if EXIST "%SCOOP%\apps\lynx\current\lynx.exe" (
    call :update_shim "%SCOOP%\shims\lynx.shim" "%SCOOP%\apps\lynx\current\lynx.exe" "-cfg %XDG_CONFIG_HOME%\lynx\lynx.cfg"
)

rem TODO Report this in scoop and remove this line
del %SCOOP%\apps\gpg\current\bin\gpgconf.ctl

call clink autorun install -- clink inject -q
call clink set clink.autostart "%XDG_CONFIG_HOME%\profile.cmd"
call clink set clink.autoupdate off

