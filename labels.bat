@echo off  
setlocal enabledelayedexpansion
cd C:\ChristOurLife\Launcher

REM Ensure the label is defined before using it
if not defined label (
    echo The label is not defined. Please use the launcher.
    timeout /t 3 >nul
    exit
)



REM update these if you are forking your own repository to match list.txt's options
:toolbox
curl -s -O https://christourlife.github.io/toolbox.bat
cmd /c "Toolbox by ChristOurLife" toolbox.bat
