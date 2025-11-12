@echo off
setlocal EnableDelayedExpansion

for /F %%a in ('echo prompt $E ^| cmd') do (
    set "ESC=%%a"
)

cd /d "%~dp0"

set "BASE_URL=https://letongchen.art/cdn/images"
set "IMAGE_DIR=images"

git add -A

for /f "tokens=1-4 delims=/- " %%a in ('date /t') do (
    set day=%%a
    set month=%%b
    set year=%%c
)
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set hour=%%a
    set minute=%%b
)

set commitMsg=Auto update %year%-%month%-%day% %hour%:%minute%
git commit -m "%commitMsg%"
git push

echo.
echo.
echo.
echo Upload is completed!
echo Uploaded images and URLs:
echo -------------------------------
for %%i in (%IMAGE_DIR%\*) do (
    for %%x in (jpg jpeg png gif webp svg bmp) do (
        echo %%~xi | find /i "%%x" >nul
        if not errorlevel 1 (
            echo %ESC%[32m!BASE_URL!/%%~nxi%ESC%[0m
        )
    )
)
echo -------------------------------
pause
