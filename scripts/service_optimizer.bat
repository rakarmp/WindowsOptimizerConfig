@echo off
title Windows Service Optimizer
color 0A

echo ===================================================
echo            OPTIMASI SERVICE WINDOWS
echo ===================================================
echo.
echo Menonaktifkan service yang tidak diperlukan...
echo.

:: Daftar service yang akan dinonaktifkan
set "services_to_disable=DiagTrack sysmain WSearch TabletInputService PcaSvc MapsBroker lfsvc SharedAccess wisvc RetailDemo XblAuthManager XblGameSave XboxNetApiSvc WMPNetworkSvc"

:: Nonaktifkan service
for %%s in (%services_to_disable%) do (
    echo Menonaktifkan %%s...
    sc config %%s start= disabled
    sc stop %%s >nul 2>&1
)

:: Service untuk gaming yang akan diatur ke manual
echo.
echo Mengatur service gaming ke manual...
sc config xbgm start= demand
sc config XboxGipSvc start= demand

:: Tetap aktifkan service penting
echo.
echo Memastikan service penting tetap aktif...
sc config Dnscache start= auto
sc start Dnscache >nul 2>&1

:: Nonaktifkan Superfetch
echo Mengoptimalkan Superfetch untuk performa...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f

echo.
echo Optimasi service selesai.
echo.
pause
exit /b