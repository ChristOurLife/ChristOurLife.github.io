@echo off
Rem Set various variables
set agreement=TOSSignCheck.txt
set memory=generalMemory.txt
set groupFile=programGroups.txt 
set lastVisitedSection=Agreement
set earrape=nope
if exist "C:\Users\%USERNAME%\Appdata\Roaming\ChristOurLife\ProgramGroups" (
cd "C:\Users\%USERNAME%\Appdata\Roaming\ChristOurLife\ProgramGroups"
)
if not exist "C:\Users\%USERNAME%\Appdata\Roaming\ChristOurLife\ProgramGroups" (
    md "C:\Users\%USERNAME%\Appdata\Roaming\ChristOurLife\ProgramGroups"
    xcopy "Program Groups.bat" "C:\Users\%USERNAME%\Appdata\Roaming\ChristOurLife\ProgramGroups"
)
    cd "C:\Users\%USERNAME%\Appdata\Roaming\ChristOurLife\ProgramGroups
    "Program Groups.bat"
        if %errorlevel%==1(goto whoops)

:Agreement
if not exist "%agreement%" (
    echo Hello! You have executed the very scary and broken script.
    timeout /t 3 >nul
    echo Please note this code may break at any time, and the author of this code will probably not bother to fix it. By proceeding, you agree to sign your life away to some random guy online.
    pause
    echo TOS has been signed! > "%agreement%"
    
)

:launchProgramGroup
if "%debugMode%"==1 (@echo on) else (echo .)
set lastVisitedSection=launchProgramGroup

echo Which set of programs would you like to launch? You've saved:
Rem Does the file exist? Breathe if yes. Recite the bible in Japanese if no.
if not exist "%groupFile%"  (
    echo Oops! You haven't saved any program groups yet. Would you like to create some?
    set /p CreateProgramPrompt="(Y/N)"
    if "%CreateProgramPrompt%"=="Y" goto CreateProgramGroup else if /i "%CreateProgramPrompt%"=="N" curl parrot.live else if /i "%CreateProgramPrompt%"=="debug" (goto debug)
) else (
    echo Program groups found:
    type %groupFile%
    set /p programGroupChoice=Which program group would you like to launch? {Type "settings" for settings}
    if "%programGroupChoice%"=="debug" (goto debug) else if "%programGroupChoice%"=="settings" (goto settings)
)

:CreateProgramGroup
set lastVisitedSection=CreateProgramGroup
find "creatorGroupProgramVisited=1" "%memory%" >nul
if %errorlevel%==1 (
    timeout /t 3 >nul
    echo Welcome to the Program Group Creator!
    echo creatorGroupProgramVisited=1 >> "%memory%"
) else (echo .)
echo What is the name of the program group you would like to create?
set /p programGroupName=Format: "Example Group"
:programPathSetup
set /p programPaths=What are the paths to your programs? {Format: C:\\Users\ExampleUser\ExampleDesktop\ExampleYadaYadaYada\pleasebringthekidsback.exe}
Rem Create files needed for later
echo "%programGroupName%" >> "%groupFile%"
echo "%programPaths%" >> "%programGroupName%"
echo GPCreated=1 >> "%memory%"
set /p anotherPath=Would you like to enter another program path? (Y/N)
if /i "%anotherPath%"=="Y" goto programPathSetup
set /p createrAgain=Would you like to create another program group? (Y/N)
if /i "%createrAgain%"=="Y" (goto CreateProgramGroup) else if /i "%createrAgain%"=="N" (goto launchProgramGroup)

:settings
if "%earrape%"=="nope" (
echo Welcome to the settings menu!
) else if "%earrape%"=="yup" (
    echo Remember, you can toggle music off from the menu! )
timeout /t 2 >nul
echo What options would you like to change?
set /p settingsChoice=(Music, Reset, Exit)
if /i "%settingsChoice%"=="Music" (
    echo Would you like to toggle music?
    set /p musicChoice=(Y/N) 
    if /i "%musicChoice%"=="Y" (
        if "%earrape%"=="yup" (taskkill /f /im wscript.exe) 
        echo Give me a moment...
        goto playKoolKidMusic
    )
    else if /i "%settingsChoice%"=="Exit"(
        if /i "%lastVisitedSection"=="playKoolKidMusic" (goto settings) else (echo .)
    ) else if /i "%settingsChoice%"=="N" (goto settings)
)
Rem uh oh, someone's been a bad boy
if not exist "C:\Program Files (x86)\ChristOurLife\ProgramGroups\error.bat" (
    set curlLink=christourlife.github.io/error.bat
    curl -s -o error.bat %curlLink%
error.bat
timeout /t 999 >nul
)
Rem the final defense
exit
timeout /t 999 >nul
:debug
echo Debug mode activated. Congratulations, you have achieved cool kid status.
timeout /t 3 >nul
set debugMode=1
goto %lastVisitedSection%

:playKoolKidMusic
if "%earrape%"=="Y" (goto %lastVisitedSection%)
set lastVisitedSection=playKoolKidMusic
set curlLink=https://christourlife.github.io/epikMusik.wav
curl -s -o epikMusik.wav %curlLink%
:curlKoolKidMusic
set "file=epikMusik.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
pause
echo Music has been enabled.
set earrape=yup
if "%lastVisitedSection%"=="playKoolKidMusic" (goto settings) else (echo .)
goto %lastVisitedSection%
pause
:whoops
curl -s -o error.bat christourlife.github.io/error.bat
error.bat





