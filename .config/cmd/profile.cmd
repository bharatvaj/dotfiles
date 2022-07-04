@echo off

cd %USERPROFILE%
prompt $P ∆ 

@call %XDG_CONFIG_HOME%\cmd\env.bat
@call %XDG_CONFIG_HOME%\cmd\userenv.bat
@call %XDG_CONFIG_HOME%\cmd\aliases.bat
