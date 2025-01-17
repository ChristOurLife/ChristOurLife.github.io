@echo off  
setlocal enabledelayedexpansion
cd C:\ChristOurLife\Launcher
goto %label%
if errorLevel=1 (
    echo Either this script is bugged (likely), or you launched labels.bat on its own. Please use the launcher.
) 
timeout /t 3 >nul
REM update these if you are forking your own repository to match list.txt's options
------------------------------------------------------------------------------------
:Toolbox
curl -s -O https://christourlife.github.io/Christourlife-toolbox.bat
