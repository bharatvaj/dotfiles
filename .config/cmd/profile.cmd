@echo off

cd %USERPROFILE%
prompt $P ∆ 

@call %XDG_CONFIG_HOME%\cmd\env.bat
@call %XDG_CONFIG_HOME%\cmd\userenv.bat

@call %XDG_CONFIG_HOME%\cmd\aliases.bat

set VISUAL=vim
set EDITOR=%VISUAL%
set XDG_CONFIG_HOME=%USERPROFILE%\.config
set XDG_DATA_HOME=%USERPROFILE%\.local\share
set XDG_CACHE_HOME=%USERPROFILE%\.cache

set MYVIMRC=%XDG_CONFIG_HOME%\vim\vimrc
set VIMINIT=source $MYVIMRC

%XDG_CONFIG_HOME%\cmd\aliases.cmd
