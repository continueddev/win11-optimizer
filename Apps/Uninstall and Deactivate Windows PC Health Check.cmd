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

:: Set common registry key strings
set "regKeyHKLM=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft"

:: Add registry keys to indicate previous uninstall and installation status
reg add "%regKeyHKLM%\PCHC" /v PreviousUninstall /t REG_DWORD /d 1 /f
reg add "%regKeyHKLM%\PCHealthCheck" /v installed /t REG_DWORD /d 1 /f

echo Registry changes applied.
pause
