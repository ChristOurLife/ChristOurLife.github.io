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
:Toolbox
curl -s -O https://christourlife.github.io/christourlife-toolbox.bat
cmd /c christourlife-toolbox.bat
timeout /t 5 >nul
exit
:Essentials
curl -s -O https://christourlife.github.io/christourlife-essentials.bat
cmd /c christourlife-essentials.bat
timeout /t 5 >nul
exit
