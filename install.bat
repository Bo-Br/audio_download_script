@echo off
chcp 65001 >nul
setlocal

echo ========================================
echo   Install Program for YouTube -> MP3
echo ========================================
echo.

echo [1/3] testing winget...
where winget >nul 2>&1
if errorlevel 1 (
echo.
echo error: winget not found.
echo Install "App Installer" from Microsoft Store.
echo.
pause
exit /b 1
)

echo.
echo [2/3] Downloading FFmpeg...
winget install --id Gyan.FFmpeg.Shared -e --accept-package-agreements --accept-source-agreements

if errorlevel 1 (
echo.
echo Can't install FFmpeg.
pause
exit /b 1
)

echo.
echo [3/3] Install yt-dlp...
winget install --id yt-dlp.yt-dlp -e --accept-package-agreements --accept-source-agreements

if errorlevel 1 (
echo.
echo Can't install yt-dlp.
pause
exit /b 1
)

echo.
echo ========================================
echo   Installation Complete!
echo ========================================
echo.
echo Testing yt-dlp:
yt-dlp --version

echo.
echo Testing FFmpeg:
ffmpeg -version

echo.
echo Now add some links into links.txt and launch download_mp3.bat
echo.
pause
