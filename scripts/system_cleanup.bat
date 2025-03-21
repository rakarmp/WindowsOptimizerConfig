@echo off
title System Cleanup
color 0A

echo ===================================================
echo               PEMBERSIHAN SISTEM
echo ===================================================
echo.

echo Membersihkan file temporary...
del /q /s %temp%\* >nul 2>&1
del /q /s C:\Windows\Temp\* >nul 2>&1
del /q /s C:\Windows\Prefetch\* >nul 2>&1

echo Membersihkan Windows Update Cache...
net stop wuauserv >nul 2>&1
net stop cryptSvc >nul 2>&1
net stop bits >nul 2>&1
net stop msiserver >nul 2>&1
rd /s /q C:\Windows\SoftwareDistribution >nul 2>&1
mkdir C:\Windows\SoftwareDistribution >nul 2>&1
net start wuauserv >nul 2>&1
net start cryptSvc >nul 2>&1
net start bits >nul 2>&1
net start msiserver >nul 2>&1

echo Membersihkan cache DNS...
ipconfig /flushdns >nul 2>&1

echo Menjalankan Disk Cleanup...
cleanmgr /sagerun:1 /d C: >nul 2>&1

echo Mengoptimalkan penyimpanan...
powershell -command "Optimize-Volume -DriveLetter C -Defrag -Verbose" >nul 2>&1

echo.
echo Pembersihan sistem selesai.
echo.
pause
exit /b