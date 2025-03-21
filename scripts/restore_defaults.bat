@echo off
title Restore Default Settings
color 0C

echo ===================================================
echo        MENGEMBALIKAN PENGATURAN DEFAULT
echo ===================================================
echo.

echo PERINGATAN: Ini akan mengembalikan pengaturan sistem ke nilai default.
echo Proses ini mungkin akan mempengaruhi performa yang telah dioptimalkan.
echo.
set /p konfirmasi="Apakah Anda yakin ingin melanjutkan? (Y/N): "

if /i "%konfirmasi%"=="Y" (
    echo.
    echo Mengembalikan service ke pengaturan default...
    sc config DiagTrack start= auto
    sc config sysmain start= auto
    sc config WSearch start= auto
    sc config XblAuthManager start= demand
    sc config XblGameSave start= demand
    sc config XboxNetApiSvc start= demand
    
    echo Mengembalikan registry ke pengaturan default...
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 20 /f
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 10 /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 2 /f
    
    echo Mengembalikan pengaturan visual...
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 1 /f
    
    echo Mengembalikan pengaturan Game DVR...
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 1 /f
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v GameDVR_Enabled /t REG_DWORD /d 1 /f
    
    echo Mengembalikan power plan ke Balanced...
    powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e
    
    echo.
    echo Pengaturan default telah dikembalikan.
) else (
    echo.
    echo Operasi dibatalkan. Pengaturan tidak diubah.
)

echo.
pause
exit /b