@echo off
setlocal enabledelayedexpansion
set rootPath="C:\ChristOurLife\Launcher"
REM make the scary whooloshanwloohoo directories if first time
cd %rootPath%
findstr /c:"visitedState=true" "mem.txt" >nul
if %errorlevel% equ 1 (
    echo Initializing
    echo .
    timeout /t 1 >nul
    echo .
    timeout /t 1 >nul
    echo .
) else (
    goto menu
)
if not exist "C:\ChristOurLife" (
    echo Allow me a moment to create dependencies for the launcher and other related programs.
    timeout /t 1 >nul
    cd C:\
    mkdir C:\ChristOurLife
    cd C:\ChristOurLife
    echo master dir root created
) else (
    echo Master root already exists?
)
if not exist %rootPath% (
    mkdir %rootPath%
    cd %rootPath%
    echo launcher slave created
    timeout /t 1 >nul
) else (
    echo Launcher slave already exists?
)
REM welcome script
timeout /t 2 >nul
cls
echo Welcome to ChristOurLife's Launcher! This is a hub for all of his programs.
timeout /t 3 >nul
echo Please note that this and all of the other associated programs require an internet connection.
timeout /t 3 >nul
echo visitedState=true >> mem.txt
:menu
cd %rootPath%
echo What program would you like to launch?
REM no stonks
if not exist "list.txt" (
curl -s -O https://christourlife.github.io/list.txt
) else (break)
if errorLevel=1 (
    echo Failed to download file. Check your internet connection and try again.
    timeout /t 5 >nul
    exit
) else (break)
set counter=0
for /f "tokens=*" %%A in (list.txt) do (
    set /a counter+=1
    echo !counter!: %%A
    set item[!counter!]=%%A
)
:select
set /p choice=Enter the number of your selection: 
if not defined choice (
    echo Invalid input. Please try again.
    goto select
)
if defined item[%choice%] (
    set label=!item[%choice%]!
    echo You selected: !label!

) else (
    echo Invalid selection. Please select a valid number from the list.
    goto select
)
REM open the thing and do the thing 
echo Downloading labels.bat...
curl -s -O https://christourlife.github.io/labels.bat
if %errorlevel% neq 0 (
    echo Failed to download labels.bat. Check your internet connection and try again.
    timeout /t 5 >nul
    exit
)
if not exist "%rootPath%\labels.bat" (
    echo labels.bat not found. Download might have failed.
    timeout /t 5 >nul
    exit
)
echo labels.bat downloaded successfully.
echo Running labels.bat...
start "IS THAT FREDDY FAZBEAR?!?!" cmd /c labels.bat
