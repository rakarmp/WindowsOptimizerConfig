@echo off
title Network Optimizer
color 0A

echo ===================================================
echo               OPTIMASI JARINGAN
echo ===================================================
echo.

echo Mengoptimalkan koneksi jaringan...

:: Reset Winsock
netsh winsock reset >nul 2>&1
netsh int ip reset >nul 2>&1

:: Optimasi TCP/IP
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global congestionprovider=ctcp >nul 2>&1
netsh int tcp set global ecncapability=enabled >nul 2>&1

:: Optimasi DNS
netsh int ip set dns "Wi-Fi" static 1.1.1.1 >nul 2>&1
netsh int ip add dns "Wi-Fi" 1.0.0.1 index=2 >nul 2>&1
netsh int ip set dns "Ethernet" static 1.1.1.1 >nul 2>&1
netsh int ip add dns "Ethernet" 1.0.0.1 index=2 >nul 2>&1

:: Menonaktifkan IPv6 (untuk performa IPv4)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v DisabledComponents /t REG_DWORD /d 255 /f

:: Memprioritaskan game dan aplikasi melalui QoS
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\javaw" /v "Application Name" /t REG_SZ /d "javaw.exe" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\javaw" /v "Version" /t REG_SZ /d "1.0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\javaw" /v "Protocol" /t REG_SZ /d "*" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\javaw" /v "Local Port" /t REG_SZ /d "*" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\javaw" /v "Local IP" /t REG_SZ /d "*" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\javaw" /v "Remote Port" /t REG_SZ /d "*" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\javaw" /v "Remote IP" /t REG_SZ /d "*" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\javaw" /v "DSCP Value" /t REG_SZ /d "46" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\javaw" /v "Throttle Rate" /t REG_SZ /d "-1" /f

echo.
echo Optimasi jaringan selesai.
echo.
pause
exit /b