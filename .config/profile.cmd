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
doskey ?=lynx -cfg "%XDG_CONFIG_HOME%\lynx\lynx.cfg" $*

rem FIXME This has the draw back that, if scripts are launched in %WINDIR%\System32,
rem like "Open command prompt" or make, it will just cd into %USERPROFILE%
IF /I "%CD%"=="%WINDIR%\System32" (cd /D "%USERPROFILE%")

set FM=vifm

if exist "%XDG_CONFIG_HOME%\cmd\unstaged.cmd" @call %XDG_CONFIG_HOME%\cmd\unstaged.cmd
