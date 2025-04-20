@echo off
setlocal enabledelayedexpansion

rem TODO Follow the official path preference of airblade/voom
rem TODO Remove plugins from pack when change is made in the plugins file
set VIM_PLUGIN_PATH=%USERPROFILE%\.local\share\vim\pack\voom\start
if NOT EXIST %VIM_PLUGIN_PATH% (
    mkdir %VIM_PLUGIN_PATH%
)
cd %VIM_PLUGIN_PATH%
for /f "tokens=*" %%i in ('type %USERPROFILE%\.local\share\vim\plugins ^| findstr /v "^#"') do (
    for /f "delims=/ tokens=2" %%a in ("%%i") do set gpath=%%a
    if not exist !gpath!/.git (
        git clone https://github.com/%%i
    )
)

vim -c "helptags ALL" -c quit >nul 2>&1

endlocal
