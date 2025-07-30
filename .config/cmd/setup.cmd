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
    call :set_var XDG_ROOT %USERPROFILE%
) else (
    call :set_var XDG_ROOT "%~1"
)
call :set_var XDG_CONFIG_HOME %XDG_ROOT%\.config
call :set_var XDG_DATA_HOME %XDG_ROOT%\.local\share
call :set_var XDG_CACHE_HOME %XDG_ROOT%\.cache
if "%SCOOP_DIR%"=="" set "SCOOP_DIR=%XDG_ROOT%\scoop"

if not exist "%SCOOP_DIR%\shims\scoop.cmd" (

    rem Run this in powershell to install scoop and run this script again:
    rem Set-ExecutionPolicy RemoteSigned -scope CurrentUser
    rem echo powershell -Command "Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')"
    echo If you want to install scoop globally run the contents of
    echo ^%XDG_ROOT^%\.config\cmd\global_scoop.ps1
    
    rem Install only the absolute essentials
    rem scoop install 7zip clink dos2unix grep gpg lf make mingit mpv sed sudo unzip vim
    goto :EOF
)

call :set_var VISUAL vim
call :set_var EDITOR %VISUAL%

call :set_var GNUPGHOME %XDG_DATA_HOME%\gnupg
call :set_var GPGHOME %XDG_DATA_HOME%\gnupg
call :set_var PASSWORD_STORE_DIR %XDG_DATA_HOME%\pass
call :set_var PASS_BASE_DIR %XDG_DATA_HOME%\pass

call :set_var LYNX_CFG %XDG_CONFIG_HOME%/lynx/lynx.cfg
call :set_var LYNX_LSS %XDG_CONFIG_HOME%/lynx/lynx.lss

call :set_var VIFM %XDG_CONFIG_HOME%\vifm

call :set_var FUZZER fzf

rem Apply config patches
rem TODO Use mklink instead of xcopy, it will prevent overriding changed files in the destination dir.
xcopy /S /E /Y %XDG_ROOT%\.config\cmd\patch %XDG_ROOT%\

if not exist "%SYSTEMDRIVE%\bin" ( mkdir %SYSTEMDRIVE%\bin )

if EXIST "%SCOOP%\apps\busybox\current\busybox.exe" (
    copy "%SCOOP%\apps\busybox\current\busybox.exe" %SYSTEMDRIVE%\bin
    copy "%SCOOP%\apps\scoop\current\supporting\shims\71\shim.exe" %SYSTEMDRIVE%\bin\sh.exe
    call :update_shim C:\bin\sh.shim "C:\bin\busybox.exe" "sh -l"
)

if EXIST "%SCOOP%\apps\lynx\current\lynx.exe" (
    call :update_shim "%SCOOP%\shims\lynx.shim" "%SCOOP%\apps\lynx\current\lynx.exe" "-cfg %XDG_CONFIG_HOME%\lynx\lynx.cfg"
)

rem TODO Report this in scoop and remove this line
if EXIST %SCOOP%\apps\gpg\current\bin\gpgconf.ctl (
    del %SCOOP%\apps\gpg\current\bin\gpgconf.ctl
)

call :add_path "%XDG_ROOT%\scoop\shims"
rem Always use \\ infront of '.' (causes issue with findstr)
call :add_path "%XDG_ROOT%\\.local\bin\cmd"
call :add_path "%SYSTEMDRIVE%\bin"

set CLINK_EXE="%XDG_ROOT%\scoop\shims\clink.exe"

if errorlevel 0 (
    echo Setting up clink
    clink autorun set >nul
    clink autorun install
) else (
    echo Cannot find clink in system
)
