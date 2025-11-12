@echo off
setlocal EnableDelayedExpansion

cd /d "%~dp0"

set "BASE_URL=https://letongchen.art/cdn/images"
set "IMAGE_DIR=images"
echo.
echo Uploaded images and URLs:
echo -------------------------------

for %%i in (%IMAGE_DIR%\*) do (
    for %%x in (jpg jpeg png gif webp svg bmp) do (
        echo %%~xi | find /i "%%x" >nul
        if not errorlevel 1 (
            echo !ESC![92m!BASE_URL!/%%~nxi%%~xi!ESC![0m
        )
    )
)

echo -------------------------------
echo Done!
pause