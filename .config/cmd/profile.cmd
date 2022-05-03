@echo off

cd %USERPROFILE%
prompt $P ∆ 

set VISUAL=vim
set EDITOR=%VISUAL%
set XDG_CONFIG_HOME=%USERPROFILE%\.config
set XDG_DATA_HOME=%USERPROFILE%\.local\share
set XDG_CACHE_HOME=%USERPROFILE%\.cache

%USERPROFILE%\.config\cmd\aliases.cmd
