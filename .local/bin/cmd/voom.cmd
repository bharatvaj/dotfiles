@echo off

rem TODO Follow the official path preference of airblade/voom
rem TODO Remove plugins from pack when change is made in the plugins file
set VIM_PLUGIN_PATH=%USERPROFILE%\.local\share\vim\pack\voom\start
if NOT EXIST %VIM_PLUGIN_PATH% (
    mkdir %VIM_PLUGIN_PATH%
)
cd %VIM_PLUGIN_PATH%
for /f "tokens=*" %%i in ('type %USERPROFILE%\.local\share\vim\plugins ^| findstr /v "^#"') do (
    git clone https://github.com/%%i
)
