@echo off

cd %USERPROFILE%

set XDG_ROOT=%1
if "%XDG_ROOT%" == "" set XDG_ROOT=%USERPROFILE%
set XDG_CONFIG_HOME=%XDG_ROOT%\.config
set XDG_DATA_HOME=%XDG_ROOT%\.local\share
set XDG_CACHE_HOME=%XDG_ROOT%\.cache
set VISUAL=vim
set EDITOR=%VISUAL%

set GNUPGHOME=%XDG_DATA_HOME%/gnupg
set GPGHOME=%XDG_DATA_HOME%/gnupg
set PASSWORD_STORE_DIR=%XDG_DATA_HOME%/pass
set PASS_BASE_DIR=%XDG_DATA_HOME%/pass

set FUZZER=fzf

set PATH=%PATH%;%USERPROFILE%\.local\bin\cmd;%USERPROFILE%\work\spm

@call %XDG_CONFIG_HOME%\cmd\aliases.cmd
if exist "%XDG_CONFIG_HOME%\cmd\userenv.cmd" @call %XDG_CONFIG_HOME%\cmd\userenv.cmd
