@echo off
setlocal EnableDelayedExpansion

set start_path="C:\ProgramData\Microsoft\Windows\Start Menu"
cd %start_path%

set row=
for /f "usebackq tokens=*" %%f in (`dir /b/s *.lnk`) do set row=!row!"%%f";

:s_tmploop
set s_tmpfile="%tmp%\s_spot.%random%.tmp"
if exist %s_tmpfile% goto:s_tmploop

wmenu.exe -e %row% | more > "!s_tmpfile!"

set /p c_tmpfile=<!s_tmpfile!
if not exist "%c_tmpfile%" exit
del /f !s_tmpfile!
start "%c_tmpfile%" "%c_tmpfile%"
endlocal
