@echo off
setlocal enabledelayedexpansion

:: Prompt user for YouTube URL
echo Enter YouTube URL:
set /p yturl=

:: Run yt-dlp with MP3 conversion
yt-dlp -x --audio-format mp3 "!yturl!"

echo.
echo Download complete!
pause
