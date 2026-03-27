@echo off
setlocal

if "%FUZZER%" == "" (
    echo Environment variable FUZZER not set
    exit /b 1
)

if "%PASSWORD_STORE_DIR%" == "" (
    set PASSWORD_STORE_DIR="%USERPROFILE%\.local\share\pass\"
)

if not exist "%PASSWORD_STORE_DIR%" (
    echo %PASSWORD_STORE_DIR% not set
    exit /b 1
)

for /f %%i in ('"%PASSTOOL% ls -f | %FUZZER%"') do (
    set selected_pass=%%i
)

if "%selected_pass%" equ "" (
    exit /b
)

if "%1" equ "" (
    if "%selected_pass:~0,5%" equ "totp/" (
        %PASSTOOL% otp %selected_pass%
    ) else (
        %PASSTOOL% show %selected_pass%
    )
) else (
    %PASSTOOL% %selected_pass%
)

endlocal
