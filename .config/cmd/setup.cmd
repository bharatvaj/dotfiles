@echo on
rem TODO Make this work for Administrator accounts

goto :main

:set_var
    set "_tail=%*"
    call set "_tail=%%_tail:*%1 =%%"
    echo.%~1		%_tail%
    setx "%~1" "%_tail%" >nul
    set "%~1=%_tail%"
goto :eof

:create_dir
setlocal
    if not exist "%~1\" (
        echo mkdir "%~1"
        mkdir "%~1"
    )
endlocal
goto :eof

:add_path
    setlocal EnableDelayedExpansion

    for /f "skip=2 tokens=2*" %%i in ('reg query "HKCU\Environment" /v PATH 2^>nul') do (
        set "UserPath=%%j"
    )

    if not defined UserPath set "UserPath="

    echo !UserPath! | findstr /I /L /C:"%~1" >nul
    if errorlevel 1 (
        if defined UserPath (
            set "NewUserPath=!UserPath!;%~1"
        ) else (
            set "NewUserPath=%~1"
        )
        echo Adding to PATH: %~1
        setx PATH "!NewUserPath!" >nul
        set PATH="!NewUserPath!"
    ) else (
        echo Skipping PATH add: %~1
    )
endlocal
goto :eof

:update_shim <shim_file> <path> <args>
    echo path = "%~2"> %~1
    echo args = %~3>> %~1
goto :eof

:main
@call %~dp0\..\profile.cmd %1

if "%~1" == "" (
    call :set_var XDG_HOME %USERPROFILE%
    call :set_var SCOOP %SYSTEMROOT:~0,2%\ProgramData\scoop
) else (
    call :set_var XDG_HOME %~1
    call :set_var SCOOP %XDG_HOME%\scoop
)
echo SCOOP is "%SCOOP%"

call :set_var XDG_CACHE_HOME %XDG_HOME%\.cache
call :set_var XDG_CONFIG_HOME %XDG_HOME%\.config
call :set_var XDG_DATA_HOME %XDG_HOME%\.local\share
call :set_var XDG_STATE_HOME %XDG_HOME%\.local\state

if not exist "%SCOOP%\apps\scoop\current\bin\scoop.ps1" (

    rem Run this in powershell to install scoop and run this script again:
    rem Set-ExecutionPolicy RemoteSigned -scope CurrentUser
    rem echo powershell -Command "Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')"
    rem TODO Autorun? Print the current settings like Mode: USER or Mode: Admin
    echo If you want to install scoop globally run the contents of
    echo %XDG_HOME%\.config\cmd\global_scoop.ps1
    
    rem Install only the absolute essentials
    rem TODO Fix global install apps like gpg and firefox, by making it use the XDG_HOME
    rem set base="7zip clink dos2unix grep make mingit mpv sed sudo unzip vim"
    rem set full="%cmd% git-annex firefox"
    rem TODO Use a parameter to mention this rather hardcoding this value
    rem scoop install %full%
    scoop config shim kiennq

    goto :EOF
)

call :set_var VISUAL vim
call :set_var EDITOR %VISUAL%

call :set_var GNUPGHOME %XDG_DATA_HOME%\gnupg
call :set_var GPGHOME %XDG_DATA_HOME%\gnupg
call :set_var PASSWORD_STORE_DIR %XDG_DATA_HOME%\pass
call :set_var PASS_BASE_DIR %XDG_DATA_HOME%\pass

call :set_var LYNX_CFG %XDG_CONFIG_HOME%\lynx\lynx.cfg
call :set_var LYNX_LSS %XDG_CONFIG_HOME%\lynx\lynx.lss

call :set_var VIFM %XDG_CONFIG_HOME%\vifm

call :set_var FUZZER wlines
call :set_var ChocolateyToolsLocation %SYSTEMROOT:~0,2%\ProgramData\Tools

rem XDG Dirs
call :create_dir "%XDG_HOME%"
call :create_dir "%XDG_CACHE_HOME%"
call :create_dir "%XDG_CONFIG_HOME%"
call :create_dir "%XDG_DATA_HOME%"
call :create_dir "%XDG_STATE_HOME%"

rem Vim Dirs
call :create_dir "%XDG_STATE_HOME%\vim"
call :create_dir "%XDG_STATE_HOME%\vim\backup"
call :create_dir "%XDG_STATE_HOME%\vim\swap"

rem Apply config patches
rem TODO Use mklink instead of xcopy, it will prevent overriding changed files in the destination dir.
xcopy /S /E /Y %XDG_HOME%\.config\cmd\patch %XDG_HOME%\

if not exist "%SYSTEMDRIVE%\bin" ( mkdir %SYSTEMDRIVE%\bin )

if EXIST "%SCOOP%\apps\busybox\current\busybox.exe" (
    copy "%SCOOP%\apps\busybox\current\busybox.exe" %SYSTEMDRIVE%\bin
    copy "%SCOOP%\apps\scoop\current\supporting\shims\kiennq\shim.exe" %SYSTEMDRIVE%\bin\sh.exe
    call :update_shim C:\bin\sh.shim "C:\bin\busybox.exe" "sh -l"
)

if EXIST "%SCOOP%\apps\lynx\current\lynx.exe" (
    call :update_shim "%SCOOP%\shims\lynx.shim" "%SCOOP%\apps\lynx\current\lynx.exe" "-cfg %XDG_CONFIG_HOME%\lynx\lynx.cfg"
)

rem TODO Report this in scoop and remove this line
if EXIST %SCOOP%\apps\gpg\current\bin\gpgconf.ctl (
    del %SCOOP%\apps\gpg\current\bin\gpgconf.ctl
)

call :add_path "%SCOOP%\shims"
rem Always use \\ infront of '.' (causes issue with findstr)
call :add_path "%XDG_HOME%\.local\bin\cmd"
call :add_path "%SYSTEMDRIVE%\bin"
call :add_path "%APPDATA%\Python\Python313\Scripts"

if errorlevel 0 (
    echo Setting up clink
    clink autorun set >nul
    clink autorun install
) else (
    echo Cannot find clink in system
)
