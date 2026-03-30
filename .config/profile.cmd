@echo off

doskey cat=type $*
doskey clear=cls
doskey d=curl -fLO $*

doskey dot=mklink /J "%XDG_HOME%\.git" "%XDG_DATA_HOME%\wt\dotfiles.git"
doskey undot=rmdir "%XDG_HOME%\.git"

doskey e=%EDITOR% $*
doskey g=git $*
doskey hb=sh %USERPROFILE%\.local\bin\sh\hb $*
doskey l=vifm .
doskey ls=dir /B $*
doskey m=make $*
doskey n=cd $*
doskey open=start $*
doskey pwd=cd
doskey rm=del $*
doskey x=7z x $*
doskey killall=taskkill /f /im $*
set FM=vifm

rem FIXME Enabling this causes right click menus like "Open command prompt" not to work
rem IF /I x"%COMSPEC%"==x%CMDCMDLINE% (cd /D %USERPROFILE%)

if exist "%XDG_CONFIG_HOME%\cmd\unstaged.cmd" @call %XDG_CONFIG_HOME%\cmd\unstaged.cmd
