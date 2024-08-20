@echo off

doskey n=cd $*
doskey g=git $*
doskey e=%EDITOR% $*
doskey l=lfcd.cmd
doskey ls=dir /B $*
doskey m=make $*
doskey pwd=cd
doskey rm=del $*
doskey clear=cls
doskey cat=type $*
doskey hb=sh %USERPROFILE%\.local\bin\sh\hb $*

if exist "%XDG_CONFIG_HOME%\cmd\userenv.cmd" @call %XDG_CONFIG_HOME%\cmd\userenv.cmd
