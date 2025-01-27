@echo off 
REM set up basic things
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
REM Load settings into RAM
set /p fastMode=<settings.txt
for /f "skip=1 tokens=*" %%a in (settings.txt) do (
    set "programInfo=%%a"
)
REM Check if TOS has been signed
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
:settings
cls
echo 1: Fast mode
echo 2: Program Info
echo 3: Exit
set /p settingsChoice= Please select an option.
if "%settingsChoice%"=="1" (
    :
    echo Fast mode will affect programs that require user input. This can allow for completely automatic installations.
    timeout /t 1 >nul
    echo There are two options for fast mode: Skip programs that require user input, or launch all programs that require user input in the backround.
    timeout /t 1 >nul
    set /p fastModeChoice= Toggle fast mode [1/2]:
    if "%fastModeChoice%"=="1" (
        if "%fastMode%"=="1" (
            echo Fast mode has now been disabled.
            set fastMode=0
            timeout /t 2 >nul
            goto settings
        ) else (cls)
        echo Fast mode is now enabled. Programs that require user input will be skipped.
        set fastMode=1
        timeout /t 2 >nul
        goto menu
    ) else if "%fastModeChoice%"=="2" (
        if "%fastMode%"=="2" (
            echo Fast mode has now been disabled.
            set fastMode=0
            timeout /t 2 >nul
            goto settings
        ) else (cls)
        echo Fast mode is now enabled. Programs that require user input will be launched in the backround.
        timeout /t 1 >nul
        goto menu
    ) else (
        echo Please select a valid option.
        timeout /t 1 >nul
        goto settings
    )
    goto menu
) else if "%settingsChoice%"=="2" (
    echo This setting toggles program info, almost like tooltips. This is useful for programs that you are not familiar with. Descriptions of programs will be displayed with their names.
    timeout /t 1 >nul
    set /p programInfoChoice Toggle Program Info? [Y/N]
    if     "%programInfoChoice%"=="Y" (
        if "%programInfo%"=="1" (
            echo Program info has now been disabled.
            set programInfo=0
            timeout /t 2 >nul
            goto settings
        ) else (cls)
        echo Program info is now enabled. Descriptions of programs will be displayed with their names.
        set programInfo=1
        timeout /t 2 >nul
        goto menu
    ) else if "%programInfoChoice%"=="N" (
        if "%programInfo%"=="0" (
            echo Program info is already disabled.
            timeout /t 2 >nul
            goto settings
        ) else (cls)
        echo Program info is now disabled. Descriptions of programs will not be displayed with their names.
        set programInfo=0
        timeout /t 2 >nul
        goto menu
    ) else (
        echo Please select a valid option.
        timeout /t 1 >nul
        goto settings
    )

    goto menu
) else if "%settingsChoice%"=="3" (
    echo Saving...
    timeout /t 1 >nul
    echo "%fastMode%" > settings.txt
    echo "%programInfo%" >> settings.txt
)
else (
    echo Please select a valid option.
    timeout /t 1 >nul
    goto settings
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
)   else if "%regularChoice1%"=="exit" goto menu
else (
    echo Please select a valid option.
    timeout /t 1 >nul
    goto regularEssentials
)

