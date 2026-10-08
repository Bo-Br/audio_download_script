```bat
@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

if not exist "2.links.txt" (
    echo error :file 2.links.txt not found
    pause
    exit /b 1
)

if not exist "MP3" mkdir "MP3"

echo ========================================
echo       YouTube -> MP3 320 kbps
echo ========================================
echo.

for /f "usebackq delims=" %%L in ("2.links.txt") do (
    if not "%%L"=="" (
        set "URL=%%L"

        echo.
        echo [*] Uploading:
        echo     !URL!
        echo.

        rem if it's a link to a playlist we download the full playlist
        echo !URL! | findstr /i "youtube.com/playlist?list=" >nul
        if not errorlevel 1 (
            echo [*] Playlist detected, downloading...

            yt-dlp ^
                -x ^
                --audio-format mp3 ^
                --audio-quality 320K ^
                -o "MP3\%%(title)s.%%(ext)s" ^
                "!URL!"
        ) else (
            rem If it's a link to a video, we download only this track
            echo [*] Video detected, downloading...

            yt-dlp ^
                --no-playlist ^
                -x ^
                --audio-format mp3 ^
                --audio-quality 320K ^
                -o "MP3\%%(title)s.%%(ext)s" ^
                "!URL!"
        )

        if errorlevel 1 (
            echo [!] ERROR downloading
        ) else (
            echo [+] Done
        )
    )
)

echo.
echo ========================================
echo All links chcked
echo Mp3's are into the MP3 directory
echo ========================================
pause
```
