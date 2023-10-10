@echo off

cd %USERPROFILE%

set HOME=%USERPROFILE%
set XDG_CONFIG_HOME=%HOME%/.config
set XDG_DATA_HOME=%HOME%/.local/share
set XDG_CACHE_HOME=%HOME%/.cache
set VISUAL=vim
set EDITOR=%VISUAL%

set GNUPGHOME=%XDG_DATA_HOME%/gnupg
set GPGHOME=%XDG_DATA_HOME%/gnupg
set PASSWORD_STORE_DIR=%XDG_DATA_HOME%/pass
set PASS_BASE_DIR=%XDG_DATA_HOME%/pass
set NB_PATH=%XDG_DATA_HOME%/notebook

set PATH=%PATH%;%USERPROFILE%/.local/bin/cmd

@call %XDG_CONFIG_HOME%/cmd/aliases.bat
@call %XDG_CONFIG_HOME%/cmd/userenv.bat
