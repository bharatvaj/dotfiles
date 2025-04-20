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

for /f %%i in ('"gopass ls -f | %FUZZER%"') do (
    set selected_pass=%%i
)

if "%selected_pass%" equ "" (
    exit /b
)

if "%1" equ "" (
    if "%selected_pass:~0,5%" equ "totp/" (
        gopass otp -c %selected_pass%
    ) else (
        gopass show -c %selected_pass%
    )
) else (
    gopass %1 %selected_pass%
)

endlocal
