@echo off
setlocal enabledelayedexpansion
:1
:: Prompt user for YouTube URL
echo Enter YouTube URL:
set /p yturl=

:: Run yt-dlp and download MP3 track to Music folder
yt-dlp -x --audio-format mp3 -o "%USERPROFILE%\Music\%%(title)s.%%(ext)s" "!yturl!"

echo.
echo Download complete! Your music *should* be saved in your Music folder.
pause
set /p Would you like to download another track? (Y/N) =
if /i "!Would you like to download another track? (Y/N)!"=="Y" goto 1
if /i "!Would you like to download another track? (Y/N)!"=="N" exit
exit