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
    echo There are two options for fast mode: Skip programs that require user input, or launch all programs that require user input in the backround and proceed with the script.
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
echo You have started the installation of Regular Essentials. Type "exit" to cancel at any time, and "skip" to skip a program. You will have to uninstall any programs you don't want to keep.
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
    else if "%regularChoice1%"=="skip" set skipCounter=1
else (
    if "%skipCounter%"=="1" (
        echo Skipping...
        set skipCounter=0
        timeout /t 1 >nul
    ) else (
    echo Please select a valid option.
    timeout /t 1 >nul
    goto regularEssentials
)
)
echo 1: Notepad++
echo 2: Sublime Text
set /p textEditorChoice= Which text editor would you like to install?
if "%textEditorChoice%"=="1" (
    echo Installing Notepad++...
    timeout /t 1 >nul
    curl -s -O npp.8.7.6.Installer.x64.exe
    start /wait npp.8.7.6.Installer.x64.exe
)
if "%textEditorChoice%"=="2" (
    echo Installing Sublime Text...
    timeout /t 1 >nul
    curl -s -O https://download.sublimetext.com/sublime_text_build_4192_x64_setup.exe
    start /wait sublime_text_build_4192_x64_setup.exe
)
else (
    if ("%skipCounter%"=="1") (
        echo Skipping...
        timeout /t 1 >nul
        set skipCounter=0
    ) else (
    echo Please select a valid option.
    timeout /t 1 >nul
    goto regularEssentials
)
)
echo 1: VLC Media Player
echo 2: MPC-HC
echo 3: PotPlayer
echo 4: KMPlayer
set /p mediaPlayerChoice= Which media player would you like to install?
if "%mediaPlayerChoice%"=="1" (
    echo Installing VLC Media Player...
    timeout /t 1 >nul
    curl -s -O https://ftp.osuosl.org/pub/videolan/vlc/3.0.18/win64/vlc-3.0.18-win64.exe 
    start /wait vlc-3.0.18-win64.exe
    del vlc-3.0.18-win64.exe
) else if "%mediaPlayerChoice%"=="2" (
    echo Installing MPC-HC...
    timeout /t 1 >nul
    curl -s -O https://github.com/clsid2/mpc-hc/releases/download/1.9.24/MPC-HC.1.9.24.x64.exe
    start /wait MPC-HC.1.9.24.x64.exe
    del MPC-HC.1.9.24.x64.exe
) else if "%mediaPlayerChoice%"=="3" (
    echo Installing PotPlayer...
    timeout /t 1 >nul
    curl -s -O https://t1.daumcdn.net/potplayer/PotPlayer/Version/Latest/PotPlayerSetup64.exe
    start /wait PotPlayerSetup64.exe
    del PotPlayerSetup64.exe
) else if "%mediaPlayerChoice%"=="4" (
    echo Installing KMPlayer...
    timeout /t 1 >nul
    curl -s -O https://update.kmpmedia.net/player/download/kmp64x/en_US
    start /wait KMP64_2025.1.21.12.exe
    del KMP64_2025.1.21.12.exe
) else if "%mediaPlayerChoice%"=="exit" goto menu
else (
    if ("%skipCounter%"=="1") (
        echo Skipping...
        timeout /t 1 >nul
        set skipCounter=0
    ) else (
    echo Please select a valid option.
    timeout /t 1 >nul
    goto regularEssentials
)
)
echo 1: 7-Zip
echo 2: WinRAR
echo 3: PeaZip
echo 4: Bandizip
set /p archiveManagerChoice= Which archive manager would you like to install?
if "%archiveManagerChoice%"=="1" (
    echo Installing 7-Zip...
    timeout /t 1 >nul
    curl -s -O https://www.7-zip.org/a/7z2102-x64.msi
    start /wait msiexec /i 7z2102-x64.msi /quiet /norestart
    del 7z2102-x64.msi
) else if "%archiveManagerChoice%"=="2" (
    echo Installing WinRAR...
    timeout /t 1 >nul
    curl -s -O https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-621.exe
    start /wait winrar-x64-621.exe
    del winrar-x64-621.exe
) else if "%archiveManagerChoice%"=="3" (
    echo Installing PeaZip...
    timeout /t 1 >nul
    curl -s -O https://github.com/peazip/PeaZip/releases/download/10.2.0/peazip-10.2.0.WIN64.exe
    start /wait peazip-10.2.0.WIN64.exe
    del peazip-10.2.0.WIN64.exe
) else if "%archiveManagerChoice%"=="4" (
    echo Installing Bandizip...
    timeout /t 1 >nul
    curl -s -O https://bandisoft.com/bandizip/dl.php?web
    start /wait BANDIZIP-SETUP-STD-ALL.EXE
    del BANDIZIP-SETUP-STD-ALL.EXE
) else if "%archiveManagerChoice%"=="exit" goto menu
else (
    if ("%skipCounter%"=="1") (
        echo Skipping...
        timeout /t 1 >nul
        set skipCounter=0
    ) else (
    echo Please select a valid option.
    timeout /t 1 >nul
    goto regularEssentials
)
)
echo The installation of Regular Essentials is complete. Enjoy your new programs!
timeout /t 3 >nul
exit
:developerEssentials
echo You have started the installation of Developer Essentials. Type "exit" to cancel at any time, and "skip" to skip a program. You will have to uninstall any programs you don't want to keep.
timeout /t 1 >nul
echo 1: Visual Studio Code
echo 2: IntelliJ IDEA
echo 3: PyCharm
echo 4: Eclipse
set /p ideChoice= Which IDE would you like to install?
if "%ideChoice%"=="1" (
    echo Installing Visual Studio Code...
    timeout /t 1 >nul
    curl -s -O https://update.code.visualstudio.com/latest/win32-x64-user/stable
    start /wait VSCodeSetup-x64.exe
    del VSCodeSetup-x64.exe
) else if "%ideChoice%"=="2" (
    echo Installing IntelliJ IDEA...
    timeout /t 1 >nul
    curl -s -O https://download.jetbrains.com/idea/ideaIC-2021.2.3.exe
    start /wait ideaIC-2021.2.3.exe
    del ideaIC-2021.2.3.exe
) else if "%ideChoice%"=="3" (
    echo Installing PyCharm...
    timeout /t 1 >nul
    curl -s -O https://download.jetbrains.com/python/pycharm-community-2021.2.3.exe
    start /wait pycharm-community-2021.2.3.exe
    del pycharm-community-2021.2.3.exe
) else if "%ideChoice%"=="4" (
    echo Installing Eclipse...
    timeout /t 1 >nul
    curl -s -O https://ftp.osuosl.org/pub/eclipse/oomph/epp/2021-09/R/eclipse-inst-jre-win64.exe
    start /wait eclipse-inst-jre-win64.exe
    del eclipse-inst-jre-win64.exe
) else if "%ideChoice%"=="exit" goto menu
else (
    if ("%skipCounter%"=="1") (
        echo Skipping...
        timeout /t 1 >nul
        set skipCounter=0
    ) else (
    echo Please select a valid option.
    timeout /t 1 >nul
    goto developerEssentials
)
)
echo 1: Git
echo 2: Docker
echo 3: Node.js
echo 4: Python
set /p devToolChoice= Which development tool would you like to install?
if "%devToolChoice%"=="1" (
    echo Installing Git...
    timeout /t 1 >nul
    curl -s -O https://github.com/git-for-windows/git/releases/download/v2.33.0.windows.2/Git-2.33.0.2-64-bit.exe
    start /wait Git-2.33.0.2-64-bit.exe
    del Git-2.33.0.2-64-bit.exe
) else if "%devToolChoice%"=="2" (
    echo Installing Docker...
    timeout /t 1 >nul
    curl -s -O https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe
    start /wait Docker%20Desktop%20Installer.exe
    del Docker%20Desktop%20Installer.exe
) else if "%devToolChoice%"=="3" (
    echo Installing Node.js...
    timeout /t 1 >nul
    curl -s -O https://nodejs.org/dist/v14.17.6/node-v14.17.6-x64.msi
    start /wait msiexec /i node-v14.17.6-x64.msi /quiet /norestart
    del node-v14.17.6-x64.msi
) else if "%devToolChoice%"=="4" (
    echo Installing Python...
    timeout /t 1 >nul
    curl -s -O https://www.python.org/ftp/python/3.9.7/python-3.9.7-amd64.exe
    start /wait python-3.9.7-amd64.exe /quiet InstallAllUsers=1 PrependPath=1
    del python-3.9.7-amd64.exe
) else if "%devToolChoice%"=="exit" goto menu
else (
    if ("%skipCounter%"=="1") (
        echo Skipping...
        timeout /t 1 >nul
        set skipCounter=0
    ) else (
    echo Please select a valid option.
    timeout /t 1 >nul
    goto developerEssentials
)
)
echo The installation of Developer Essentials is complete. Enjoy your new programs!
timeout /t 3 >nul
exit
:officeEssentials
echo You have started the installation of Office Essentials. Type "exit" to cancel at any time, and "skip" to skip a program. You will have to uninstall any programs you don't want to keep.
timeout /t 1 >nul
echo 1: Office 365
echo 2: LibreOffice
set /p officeSuiteChoice= Which office suite would you like to install?
if "%officeSuiteChoice%"=="1" (
    echo Installing Office 365...
    timeout /t 1 >nul
    curl -s -O https://go.microsoft.com/fwlink/?linkid=2264705&clcid=0x409&culture=en-us&country=us
    start /wait OfficeSetup.exe
    del OfficeSetup.exe
) else if "%officeSuiteChoice%"=="2" (
    echo Installing LibreOffice...
    timeout /t 1 >nul
    curl -s -O https://download.documentfoundation.org/libreoffice/stable/25.2.0/win/x86_64/LibreOffice_25.2.0_Win_x86-64.msi
    start /wait msiexec /i LibreOffice_25.2.0_Win_x64-64.msi /quiet /norestart
    del LibreOffice_25.2.0_Win_x64-64.msi
) else if "%officeSuiteChoice%"=="exit" goto menu
else (
    if ("%skipCounter%"=="1") (
        echo Skipping...
        timeout /t 1 >nul
        set skipCounter=0
    ) else (
    echo Please select a valid option.
    timeout /t 1 >nul
    goto officeEssentials
)
)
echo 1: Adobe Acrobat Reader
echo 2: Foxit Reader
set /p pdfReaderChoice= Which PDF reader would you like to install?
if "%pdfReaderChoice%"=="1" (
    echo Installing Adobe Acrobat Reader...
    timeout /t 1 >nul
    curl -s -O https://get.adobe.com/reader/download/?installer=Reader_DC_2021.007.20099_English_for_Windows&standalone=1
    start /wait AcroRdrDCx642100720099_en_US.exe
    del AcroRdrDCx642100720099_en_US.exe
) else if "%pdfReaderChoice%"=="2" (
    echo Installing Foxit Reader...
    timeout /t 1 >nul
    curl -s -O https://cdn01.foxitsoftware.com/product/reader/desktop/win/11.1.0/FoxitReader110_L10N_Setup_Prom.exe
    start /wait FoxitReader110_L10N_Setup_Prom.exe
    del FoxitReader110_L10N_Setup_Prom.exe
) else if "%pdfReaderChoice%"=="exit" goto menu
else (
    if ("%skipCounter%"=="1") (
        echo Skipping...
        timeout /t 1 >nul
        set skipCounter=0
    ) else (
    echo Please select a valid option.
    timeout /t 1 >nul
    goto officeEssentials
)
)
echo The installation of Office Essentials is complete. Enjoy your new programs!
timeout /t 3 >nul
exit
:gamingEssentials
echo You have started the installation of Gaming Essentials. Type "exit" to cancel at any time, and "skip" to skip a program. You will have to uninstall any programs you don't want to keep.
timeout /t 1 >nul
echo 1: Steam
echo 2: Epic Games Launcher
echo 3: GOG Galaxy
echo 4: Origin
set /p gameLauncherChoice= Which game launcher would you like to install?
if "%gameLauncherChoice%"=="1" (
    echo Installing Steam...
    timeout /t 1 >nul
    curl -s -O https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe
    start /wait SteamSetup.exe
    del SteamSetup.exe
) else if "%gameLauncherChoice%"=="2" (
    echo Installing Epic Games Launcher...
    timeout /t 1 >nul
    curl -s -O https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi
    start /wait msiexec /i EpicInstaller-17.2.0.msi /quiet /norestart
    del EpicInstaller-17.2.0.msi
) else if "%gameLauncherChoice%"=="3" (
    echo Installing GOG Galaxy...
    timeout /t 1 >nul
    curl -s -O https://webinstallers.gog-statics.com/download/GOG_Galaxy_2.0.exe
    start /wait GOG_Galaxy_2.0.exe
    del GOG_Galaxy_2.0.exe
) else if "%gameLauncherChoice%"=="4" (
    echo Installing Origin...
    timeout /t 1 >nul
    curl -s -O https://download.dm.origin.com/origin/live/OriginSetup.exe
    start /wait OriginSetup.exe
    del OriginSetup.exe
) else if "%gameLauncherChoice%"=="exit" goto menu
else (
    if ("%skipCounter%"=="1") (
        echo Skipping...
        timeout /t 1 >nul
        set skipCounter=0
    ) else (
    echo Please select a valid option.
    timeout /t 1 >nul
    goto gamingEssentials
)
)
echo 1: Discord
echo 2: TeamSpeak
echo 3: Mumble
set /p socialGamingChoice= Which social gaming platform would you like to install?
if "%socialGamingChoice%"=="1" (
    echo Installing Discord...
    timeout /t 1 >nul
    curl -s -O https://discord.com/api/download?platform=win
    start /wait DiscordSetup.exe
    del DiscordSetup.exe
) else if "%socialGamingChoice%"=="2" (
    echo Installing TeamSpeak...
    timeout /t 1 >nul
    curl -s -O https://files.teamspeak-services.com/releases/client/3.5.6/TeamSpeak3-Client-win64-3.5.6.exe
    start /wait TeamSpeak3-Client-win64-3.5.6.exe
    del TeamSpeak3-Client-win64-3.5.6.exe
) else if "%socialGamingChoice%"=="3" (
    echo Installing Mumble...
    timeout /t 1 >nul
    curl -s -O https://dl.mumble.info/latest/stable/client-windows-x64
    start /wait msiexec /i mumble_client-1.5.735.x64.msi /quiet /norestart
    del mumble_client-1.5.735.x64.msi
) else if "%socialGamingChoice%"=="exit" goto menu
else (
    if ("%skipCounter%"=="1") (
        echo Skipping...
        timeout /t 1 >nul
        set skipCounter=0
    ) else (
    echo Please select a valid option.
    timeout /t 1 >nul
    goto gamingEssentials
)
)
echo 1: OBS Studio
echo 2: XSplit
set /p screenRecorderChoice= Which screen recorder would you like to install?
if "%screenRecorderChoice%"=="1" (
    echo Installing OBS Studio...
    timeout /t 1 >nul
    curl -s -O https://cdn-fastly.obsproject.com/downloads/OBS-Studio-27.1.3-Full-Installer-x64.exe
    start /wait OBS-Studio-27.1.3-Full-Installer-x64.exe
    del OBS-Studio-27.1.3-Full-Installer-x64.exe
) else if "%screenRecorderChoice%"=="2" (
    echo Installing XSplit...
    timeout /t 1 >nul
    curl -s -O  https://cdn2.xsplit.com/download/bc/m54/4.5.2501.2802/xbc_web_installer_4.5.2501.2802.exe
    start /wait xbc_web_installer_4.5.2501.2802.exe
    del xsplit.vc.4.0.2007.2902.exe
) else if "%screenRecorderChoice%"=="exit" goto menu
else (
    if ("%skipCounter%"=="1") (
        echo Skipping...
        timeout /t 1 >nul
        set skipCounter=0
    ) else (
    echo Please select a valid option.
    timeout /t 1 >nul
    goto gamingEssentials
)
)
echo The installation of Gaming Essentials is complete. Enjoy your new programs!
timeout /t 3 >nul
exit