```bat
@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

if not exist "2.links.txt" (
    echo Ошибка: файл 2.links.txt не найден.
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
        echo [*] Обрабатываю:
        echo     !URL!
        echo.

        rem Если это ПРЯМАЯ ссылка на плейлист — скачиваем весь плейлист
        echo !URL! | findstr /i "youtube.com/playlist?list=" >nul
        if not errorlevel 1 (
            echo [*] Обнаружен плейлист. Скачиваю весь плейлист...

            yt-dlp ^
                -x ^
                --audio-format mp3 ^
                --audio-quality 320K ^
                -o "MP3\%%(title)s.%%(ext)s" ^
                "!URL!"
        ) else (
            rem Если это ссылка на видео — скачиваем только это видео
            echo [*] Обнаружено видео. Скачиваю только этот трек...

            yt-dlp ^
                --no-playlist ^
                -x ^
                --audio-format mp3 ^
                --audio-quality 320K ^
                -o "MP3\%%(title)s.%%(ext)s" ^
                "!URL!"
        )

        if errorlevel 1 (
            echo [!] ОШИБКА при скачивании.
        ) else (
            echo [+] Готово.
        )
    )
)

echo.
echo ========================================
echo Все ссылки обработаны.
echo MP3 находятся в папке MP3
echo ========================================
pause
```
