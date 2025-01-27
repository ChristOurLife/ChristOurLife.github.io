@echo off 
set agreement=TOSSignCheck.txt
set rootPath=C:\ChristOurLife\Essentials
cd %rootPath%
if %errorlevel% neq 0 (
    mkdir %rootPath%
    cd %rootPath%
    echo "firstVisit=1" >> mem.txt
    goto Agreement
) else (
    goto Agreement
)
if %errorlevel% neq 0 (
    echo dir exists, didn't catch it?
    timeout /t 3 >nul
    curl -s -O https://christourlife.github.io/error.bat
    error.bat
)
:Agreement
findstr /c:"firstVisit=1" "mem.txt" >nul
if %errorlevel% neq 0 goto menu
findstr /c:"TOS has been signed!" "%agreement%" >nul
if %errorlevel% neq 0 (
    cls
    echo Hello! You have executed the very scary and broken script.
    timeout /t 3 >nul
    echo Please note this code may break at any time, and the author of this code will probably not bother to fix it. By proceeding, you agree to sign your life away to some random guy online.
    timeout /t 3 >nul
    echo Additionally, the author [ChristOurLife] is NOT responsible for any cybercrimes OR liable for any damage caused by this software. 
    :consentStatement
    set /p consent= Please type "I agree." to proceed. 
    if "%consent%"=="I agree." (
        goto theaftermathofthisstupidtossignchecki'mfriggindonewiththiscode
    ) else if "%consent%"=="debug" (
        set debugMode=1
        echo .
        timeout /t 1 >nul
        cls
        goto consentStatement
    ) else (
        goto consentStatement
    )
)
:theaftermathofthisstupidtossignchecki'mfriggindonewiththiscode
echo TOS has been signed! > "%agreement%"
echo "firstVisit=0" > mem.txt
goto menu
REM erm wat da sigmah
echo what are you doing here?
timeout /t 1 >nul
exit
else (
    goto menu
)
:menu
cls 
echo Welcome to ChristOurLife's Essentials!
timeout /t 2 >nul
:menuChoice
set /p menuChoice= Please select an option:
echo 1. Install Essentials
echo 2. Check out my website!
echo 3. Settings
echo 4. Info
echo 5. Exit
REM FINALLY, A CLEAN CHOICE SELECTION
if "%menuChoice%"=="1" goto installEssentials
else if "%menuChoice%"=="2" start https://christourlife.github.io
else if "%menuChoice%"=="3" goto settings
else if "%menuChoice%"=="4" goto info
else if "%menuChoice%"=="5" exit
else (
    echo Please select a valid option.
    goto menuChoice
)
:installEssentials
cls
echo Note: Most of these programs are 64 bit. Do create an issue on GitHub if you want 32 bit versions.
timeout /t 1 >nul
set /p installProfile= Please select a profile [set of programs] to install:
echo 1. Regular Essentials [Web browser, Text editor, Media player, etc]
echo 2. Developer Essentials [IDE, Git, Docker, etc]
echo 3. Office Essentials [Office 365/Libre Office, PDF reader, etc ]
echo 4. Gaming Essentials [Game launchers, Social gaming platforms, Screen recorders/clippers, etc]
echo 5. Content Creator Essentials [Video/audio editor, streaming software, etc]
echo 6. All Essentials [NOT RECOMMENDED]
if "%installProfile%"=="1" goto regularEssentials
else if "%installProfile%"=="2" goto developerEssentials
else if "%installProfile%"=="3" goto officeEssentials
else if "%installProfile%"=="4" goto gamingEssentials
else if "%installProfile%"=="5" goto contentCreatorEssentials
else if "%installProfile%"=="6" goto allEssentials
else (
    echo Please select a valid option.
    timeout /t 1 >nul
    goto installEssentials
)
:regularEssentials
cls
echo You have started the installation of Regular Essentials. Type "exit" to cancel at any time. You will have to uninstall any programs you don't want to keep.
timeout /t 1 >nul
echo 1: Google Chrome
echo 2: Brave
echo 3: DuckDuckGo
echo 4: Firefox
set /p regularChoice1= Which web browser would you like to install? 
if "%regularChoice1%"=="1" (
    echo Installing Google Chrome...
    timeout /t 1 >nul
    curl -s -O https://dl.google.com/tag/s/dl/chrome/install/googlechromestandaloneenterprise64.msi
    start /wait msiexec /i googlechromestandaloneenterprise64.msi /quiet /norestart
    del googlechromestandaloneenterprise64.msi
) else if "%regularChoice1%"=="2" (
    echo Installing Brave...
    timeout /t 1 >nul
    curl -s -O https://laptop-updates.brave.com/latest/winx64
    start /wait winx64
    del winx64
) else if "%regularChoice1%"=="3" (
    echo Installing DuckDuckGo...
    timeout /t 1 >nul
    curl -s -O https://staticcdn.duckduckgo.com/windows-desktop-browser/installer/funnel_browser_searchresults/DuckDuckGo.appinstaller
    start /wait DuckDuckGo.appinstaller
    echo Sorry! You'll have to manually install this one. DuckDuckGo didn't want to make it easy.
    pause
) else if "%regularChoice1%"=="4" (
    echo Installing Firefox...
    timeout /t 1 >nul
    curl -s -O https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US
    start /wait "Firefox Setup 118.0.2.exe"
    del "Firefox Setup 118.0.2.exe"
) else (
    echo Please select a valid option.
    timeout /t 1 >nul
    goto regularEssentials
)

