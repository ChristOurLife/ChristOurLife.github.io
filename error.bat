@echo off
echo Whoops! The script has encountered an unrecoverable error. Would you like to continue?
:prompt
set /p errorChoice=(Y/N)
if /i "%errorChoice%"=="Y" ("%lastVisitedScript%") else if /i "%errorChoice%"=="N" (curl parrot.live) else goto n/a
exit
:n/a
echo Please select Y/N.
goto prompt
