@echo off
chcp 65001 >nul
setlocal

if not exist "links.txt" (
    echo Ошибка: файл links.txt не найден.
    pause
    exit /b 1
)

if not exist "MP3" mkdir "MP3"

echo ========================================
echo   YouTube -> MP3 320 kbps
echo ========================================
echo.

for /f "usebackq delims=" %%L in ("links.txt") do (
    if not "%%L"=="" (
        echo.
        echo [*] Скачиваю: %%L
        yt-dlp ^
            -x ^
            --audio-format mp3 ^
            --audio-quality 320K ^
            --no-playlist ^
            -o "MP3\%%(title)s.%%(ext)s" ^
            "%%L"

        if errorlevel 1 (
            echo [!] ОШИБКА при скачивании: %%L
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