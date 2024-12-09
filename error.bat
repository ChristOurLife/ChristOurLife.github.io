@echo off
curl -s -o christourlife.github.io/whoops.mp3
set "file=whoops.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cls
echo Whoops! The script has encountered an unrecoverable error. Would you like to exit?
:prompt
set /p errorChoice=(Y/N)
if /i "%errorChoice%"=="Y" ("%lastVisitedScript%") else if /i "%errorChoice%"=="N" (curl parrot.live) else goto n/a
exit
:n/a
echo Please select Y/N.
goto prompt
