@echo off

cd %USERPROFILE%
prompt $P ∆ 

@call %XDG_CONFIG_HOME%\cmd\environment.bat
@call %XDG_CONFIG_HOME%\cmd\aliases.bat
