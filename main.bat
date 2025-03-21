@echo off
title WINDOWS OPTIMIZER CONFIG by @rakarmp
color 0A
setlocal enabledelayedexpansion

:: Verifikasi hak administrator
echo Memeriksa hak administrator...
NET SESSION >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo ERROR: Script harus dijalankan sebagai Administrator!
    echo Klik kanan pada file script dan pilih "Run as administrator"
    pause
    exit
)

:MENU
cls
echo ===================================================
echo         WINDOWS OPTIMIZER CONFIG by @rakarmp
echo ===================================================
echo.
echo  [1] Optimasi Service Windows
echo  [2] Pembersihan System - Defrag (Need time to complete)
echo  [3] Optimasi Registry untuk Gaming
echo  [4] Optimasi Jaringan
echo  [5] Optimasi Visual Effects
echo  [6] Kembalikan Pengaturan Default (Restore)
echo  [7] Keluar
echo.
echo ===================================================
echo.

set /p pilihan="Masukkan pilihan Anda [1-7]: "

if "%pilihan%"=="1" call scripts\service_optimizer.bat
if "%pilihan%"=="2" call scripts\system_cleanup.bat
if "%pilihan%"=="3" call scripts\registry_gaming.bat
if "%pilihan%"=="4" call scripts\network_optimizer.bat
if "%pilihan%"=="5" call scripts\visual_effects.bat
if "%pilihan%"=="6" call scripts\restore_defaults.bat
if "%pilihan%"=="7" exit

echo.
echo Kembali ke menu utama...
timeout /t 2 >nul
goto MENU