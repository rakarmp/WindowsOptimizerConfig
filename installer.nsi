!include "MUI2.nsh"

Name "Windows Optimizer Config"
OutFile "WindowsOptimizerConfig-Setup.exe"
InstallDir "$PROGRAMFILES\WindowsOptimizerConfig"
RequestExecutionLevel admin

!define MUI_ABORTWARNING

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE "Indonesian"

Section "Install"
  SetOutPath "$INSTDIR"
  File "main.bat"
  File "README.md"
  
  CreateDirectory "$INSTDIR\scripts"
  SetOutPath "$INSTDIR\scripts"
  File "scripts\*.bat"
  
  SetOutPath "$INSTDIR"
  File "installer.bat"
  
  ExecWait '"$INSTDIR\installer.bat"'
SectionEnd