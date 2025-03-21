@echo off
title Windows Optimizer Config Installer
color 0A

echo ===================================================
echo     WINDOWS OPTIMIZER CONFIG - INSTALLER
echo ===================================================
echo.

:: Verifikasi hak administrator
echo Memeriksa hak administrator...
NET SESSION >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo ERROR: Installer harus dijalankan sebagai Administrator!
    echo Klik kanan pada file installer dan pilih "Run as administrator"
    pause
    exit
)

:: Membuat direktori instalasi
echo Membuat direktori instalasi...
set "INSTALL_DIR=%ProgramFiles%\WindowsOptimizerConfig"
if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"
if not exist "%INSTALL_DIR%\scripts" mkdir "%INSTALL_DIR%\scripts"

:: Menyalin file
echo Menyalin file ke direktori instalasi...
copy main.bat "%INSTALL_DIR%\" >nul
copy README.md "%INSTALL_DIR%\" >nul
copy scripts\*.bat "%INSTALL_DIR%\scripts\" >nul

:: Membuat file woc.bat di System32 untuk akses global
echo Membuat command shortcut...
set "WOC_PATH=%WINDIR%\System32\woc.bat"
echo @echo off > "%WOC_PATH%"
echo start "" "%INSTALL_DIR%\main.bat" >> "%WOC_PATH%"

:: Membuat entri registry untuk uninstaller
echo Membuat entri uninstaller...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\WindowsOptimizerConfig" /v "DisplayName" /t REG_SZ /d "Windows Optimizer Config" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\WindowsOptimizerConfig" /v "UninstallString" /t REG_SZ /d "\"%INSTALL_DIR%\uninstall.bat\"" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\WindowsOptimizerConfig" /v "DisplayVersion" /t REG_SZ /d "1.0.0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\WindowsOptimizerConfig" /v "Publisher" /t REG_SZ /d "YourName" /f

:: Membuat uninstaller
echo Membuat uninstaller...
set "UNINSTALL_PATH=%INSTALL_DIR%\uninstall.bat"
echo @echo off > "%UNINSTALL_PATH%"
echo title Windows Optimizer Config Uninstaller >> "%UNINSTALL_PATH%"
echo color 0C >> "%UNINSTALL_PATH%"
echo. >> "%UNINSTALL_PATH%"
echo echo Menghapus Windows Optimizer Config... >> "%UNINSTALL_PATH%"
echo del /q /f "%WINDIR%\System32\woc.bat" ^>nul 2^>^&1 >> "%UNINSTALL_PATH%"
echo reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\WindowsOptimizerConfig" /f ^>nul 2^>^&1 >> "%UNINSTALL_PATH%"
echo rmdir /s /q "%INSTALL_DIR%" ^>nul 2^>^&1 >> "%UNINSTALL_PATH%"
echo echo. >> "%UNINSTALL_PATH%"
echo echo Windows Optimizer Config berhasil dihapus! >> "%UNINSTALL_PATH%"
echo pause >> "%UNINSTALL_PATH%"

echo.
echo Instalasi selesai!
echo.
echo Anda sekarang dapat menjalankan Windows Optimizer Config
echo dengan mengetikkan 'woc' di Command Prompt.
echo.
pause