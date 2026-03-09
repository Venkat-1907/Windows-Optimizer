@echo off
title PC Full Optimizer by DANGER
color 0A

echo =================================================
echo         PC Optimization Tool by DANGER
echo =================================================
echo.
echo Starting system cleanup and optimization...
timeout /t 2 >nul

:: 1. Clear User Temp Files
echo [1/9] Clearing User TEMP files...
del /f /s /q %temp%\*
rd /s /q %temp%
mkdir %temp%

:: 2. Clear Windows Temp
echo [2/9] Clearing Windows TEMP files...
del /f /s /q C:\Windows\Temp\*
rd /s /q C:\Windows\Temp
mkdir C:\Windows\Temp

:: 3. Clear Windows Update Cache
echo [3/9] Clearing Windows Update Cache...
net stop wuauserv >nul 2>&1
del /f /s /q C:\Windows\SoftwareDistribution\Download\*
net start wuauserv >nul 2>&1

:: 4. Clear Prefetch Files
echo [4/9] Clearing Prefetch files...
del /f /s /q C:\Windows\Prefetch\*

:: 5. Flush DNS
echo [5/9] Flushing DNS cache...
ipconfig /flushdns

:: 6. Disable Useless Services (Safe ones)
echo [6/9] Disabling unnecessary services...
net stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled
net stop SysMain >nul 2>&1
sc config SysMain start= disabled
net stop Fax >nul 2>&1
sc config Fax start= disabled

:: 7. Empty Recycle Bin
echo [7/9] Emptying Recycle Bin...
PowerShell -Command "Clear-RecycleBin -Force"

:: 8. Free Up RAM
echo [8/9] Freeing up RAM...
PowerShell -Command "[System.GC]::Collect()"

:: 9. Done
echo.
echo =================================================
echo    Optimization Complete! Stay Fast & Clean
echo               
echo =================================================
pause
