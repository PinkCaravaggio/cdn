@echo off
setlocal EnableDelayedExpansion

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
echo ✅ Uploaded images and URLs:
echo -------------------------------

for %%i in (%IMAGE_DIR%\*) do (
    for %%x in (jpg jpeg png gif webp svg bmp) do (
        echo %%~xi | find /i "%%x" >nul
        if not errorlevel 1 (
            echo !BASE_URL!/%%~nxi%%~xi
        )
    )
)

echo -------------------------------
echo Done!
pause
