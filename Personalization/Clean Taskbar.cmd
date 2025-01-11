@echo off
setlocal EnableDelayedExpansion
color 17
cls
echo.
echo.
echo. ░██████╗░█████╗░██████╗░██╗██████╗░████████╗  ██████╗░██╗░░░██╗
echo. ██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝  ██╔══██╗╚██╗░██╔╝
echo. ╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░  ██████╦╝░╚████╔╝░
echo. ░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░  ██╔══██╗░░╚██╔╝░░
echo. ██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░  ██████╦╝░░░██║░░░
echo. ╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░  ╚═════╝░░░░╚═╝░░░
echo.
echo. ░█████╗░░█████╗░███╗░░██╗████████╗██╗███╗░░██╗██╗░░░██╗███████╗██████╗░  ██████╗░███████╗██╗░░░██╗
echo. ██╔══██╗██╔══██╗████╗░██║╚══██╔══╝██║████╗░██║██║░░░██║██╔════╝██╔══██╗  ██╔══██╗██╔════╝██║░░░██║
echo. ██║░░╚═╝██║░░██║██╔██╗██║░░░██║░░░██║██╔██╗██║██║░░░██║█████╗░░██║░░██║  ██║░░██║█████╗░░╚██╗░██╔╝
echo. ██║░░██╗██║░░██║██║╚████║░░░██║░░░██║██║╚████║██║░░░██║██╔══╝░░██║░░██║  ██║░░██║██╔══╝░░░╚████╔╝░
echo. ╚█████╔╝╚█████╔╝██║░╚███║░░░██║░░░██║██║░╚███║╚██████╔╝███████╗██████╔╝  ██████╔╝███████╗░░╚██╔╝░░
echo. ░╚════╝░░╚════╝░╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░╚══════╝╚═════╝░  ╚═════╝░╚══════╝░░░╚═╝░░░
echo.
echo.
echo Before proceeding, make sure to create a backup of your system.
echo This script will modify various settings. Continue only if you understand the changes.
echo.
set /p "continue=Press ENTER to start the process..."

echo Applying Clean Taskbar...

:: Define Registry Keys
set "RegKeyHKCU=HKEY_CURRENT_USER\Software"
set "RegKeyHKLM=HKEY_LOCAL_MACHINE\SOFTWARE"

:: Disable Meet Now
echo Disabling Meet Now...
reg add "%RegKeyHKCU%\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_DWORD /d 1 /f
reg add "%RegKeyHKLM%\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_DWORD /d 1 /f

:: Disable People
echo Disabling People...
reg add "%RegKeyHKLM%\Policies\Microsoft\Windows\Explorer" /v HidePeopleBar /t REG_DWORD /d 1 /f
reg add "%RegKeyHKCU%\Policies\Microsoft\Windows\Explorer" /v HidePeopleBar /t REG_DWORD /d 1 /f

:: Hide People Bar
echo Hiding People Bar...
reg add "%RegKeyHKLM%\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand /t REG_DWORD /d 0 /f

:: Disable Weather, News, and Interests on taskbar
echo Disabling Weather, News, and Interests on taskbar...
reg add "%RegKeyHKLM%\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 0 /f

:: Hide Weather, News, and Interests on taskbar
echo Hiding Weather, News, and Interests on taskbar...
reg add "%RegKeyHKLM%\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2 /f

echo Clean Taskbar applied.
pause
