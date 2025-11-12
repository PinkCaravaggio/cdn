@echo off
SETLOCAL EnableDelayedExpansion
for /F %%a in ('echo prompt $E ^| cmd') do (
    set "ESC=%%a"
)

echo %ESC%[31mThis text is red.%ESC%[0m
echo %ESC%[32mThis text is green.%ESC%[0m
echo %ESC%[1;34mThis text is bold blue.%ESC%[0m
echo %ESC%[4mThis text is underlined.%ESC%[0m
pause