@echo off
setlocal EnableDelayedExpansion
color 17
cls
echo.
echo.
echo.
echo.
echo Before proceeding, make sure to create a backup of your system.
echo This script will modify various settings. Continue only if you understand the changes.
echo.
set /p "continue=Press ENTER to start the process..."

:: Set common registry key string
set "regKeyHKCU=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun"

:: Add registry key to disallow running Microsoft Edge
reg add "%regKeyHKCU%" /v "1" /d "msedge.exe" /f

echo Registry changes applied.
pause
