@echo off
set agreement=TOSSignCheck.txt
set rootPath=C:\ChristOurLife\Toolbox
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
    echo uh oh lojfudopsdijgp osjgolsedugmdeu r
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
echo Welcome to ChristOurLife's Toolbox!
timeout /t 2 >nul
echo Select a group of operations:
timeout /t 1 >nul
echo Basic (Restart explorer, check users, etc)
echo Advanced (Improve network performance, go into safe mode, etc)

set /p operationChoice= Please choose an operation.
if /I "%operationChoice%"=="Basic" (
    goto basicOptions
) else if /I "%operationChoice%"=="Advanced" (
    goto advancedOptions
) else if /I "%operationChoice%"=="Hidden" (
    goto hiddenOptions
) else (
    echo Invalid choice. Please try again.
    timeout /t 2 >nul
    goto menu
)

timeout /t 1 >nul
echo What are YOU doing here?
timeout /t 4 >nul
exit

:basicOptions 
cls
echo What operation would you like to perform?
echo 1: Restart explorer
echo 2: Check users
echo 3: Display system information
echo 4: Exit to main menu
set /p basicChoice= Please choose an operation.
if "%basicChoice%"=="1" (
    taskkill /f /im explorer.exe
    start explorer.exe
    goto basicOptions
) else if "%basicChoice%"=="2" (
    net user
    pause
    goto basicOptions
) else if "%basicChoice%"=="3" (
    systeminfo
    pause
    goto basicOptions
) else if "%basicChoice%"=="4" (
    goto menu
) else (
    echo Invalid choice. Please try again.
    timeout /t 2 >nul
    goto basicOptions
)
:advancedOptions
cls
echo What advanced operation would you like to perform?
echo 1: Improve network performance
echo 2: Go into safe mode
echo 3: Enable verbose logging
echo 4: Exit to main menu
set /p advancedChoice= Please choose an operation.
if "%advancedChoice%"=="1" (
    
    goto advancedOptions
) else if "%advancedChoice%"=="2" (
    echo Going into safe mode...
    bcdedit /set {current} safeboot minimal
    shutdown /r /t 0
    goto advancedOptions
) else if "%advancedChoice%"=="3" (
    echo Enabling verbose logging...
    bcdedit /set {current} bootlog yes
    set /p restartChoice=Would you like to restart? (Y/N): 
    if /I "%restartChoice%"=="Y" (
        shutdown /r /t 0
    ) else (
        echo Verbose logging enabled. Please restart your computer later to apply changes.
    )
    goto advancedOptions
) else if "%advancedChoice%"=="4" (
    goto menu
) else (
    echo Invalid choice. Please try again.
    timeout /t 2 >nul
    goto advancedOptions
)

timeout /t 1 >nul
echo What are YOU doing here?
timeout /t 4 >nul
exit 

timeout /t 4 >nul
exit 

:hiddenOptions
cls
echo What operation would you like to perform?
echo 1: Bypass UAC (User Account Control)
echo 2: Scan network
echo 3: Exit to main menu
set /p hiddenChoice= Please choose an operation.
if /I "%hiddenChoice%"=="1" (
    echo Creating scheduled task to bypass UAC...
    schtasks /create /tn "BypassUAC" /tr "cmd /c start cmd /k \"cd /d %rootPath% && bypassuac.bat\"" /sc onlogon /rl highest
    echo Task created. Running task...
    schtasks /run /tn "BypassUAC"
    timeout /t 2 >nul
    echo Task is active. Will restart on logon.
    timeout /t 3 >nul
    goto hiddenOptions
) else if /I "%hiddenChoice%"=="2" (
    echo Working...
    echo Scanning network...
    if not exist "C:\ChristOurLife\Toolbox\NetworkUtils" (
        mkdir "C:\ChristOurLife\Toolbox\NetworkUtils"
    )
    arp -a > "C:\ChristOurLife\Toolbox\NetworkUtils\ipaddresses.txt"
    echo Network scan complete. Results saved to C:\ChristOurLife\Toolbox\NetworkUtils\ipaddresses.txt
    timeout /t 2 >nul
    echo Would you like to view the results?
    set /p viewResults= (Y/N)
    if /I "%viewResults%"=="Y" (
        notepad "C:\ChristOurLife\Toolbox\NetworkUtils\ipaddresses.txt"
    ) else (echo .)
    goto hiddenOptions
) else if /I "%hiddenChoice%"=="3" (
    goto menu
) else (
    echo Invalid choice. Please try again.
    timeout /t 2 >nul
    goto hiddenOptions
)

timeout /t 1 >nul
echo What are YOU doing here?
timeout /t 4 >nul
exit

