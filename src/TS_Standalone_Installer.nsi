Unicode True ;Support Unicode format in the installer
Target x86-unicode

;Include header filess
!include "x64.nsh"
!include "WinVer.nsh"
!include ".\Downloader.nsh"
!include ".\Language-r.nsh"

########################### Installer SETUP
Name "The Sims 1 Starter Pack"
OutFile "..\bin\Standalone Touchup\TS1StarterPack-StandaloneTouchup.exe"
RequestExecutionLevel admin
ShowInstDetails show
InstallDir "$PROGRAMFILES32\The Sims 1 Starter Pack"
SetCompressor /SOLID LZMA
ManifestDPIAware True
VIProductVersion 15.0.0.0
VIAddVersionKey "CompanyName" "osab"
VIAddVersionKey "FileVersion" "15.0.0"
VIAddVersionKey "ProductName" "The Sims 1 Starter Pack"
VIAddVersionKey "ProductVersion" "15.0"

########################### MUI SETUP
brandingText "osab Web Installer v15"
!define MUI_ABORTWARNING
!define MUI_INSTFILESPAGE_COLORS "FFFFFF 000000"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_RIGHT
!define MUI_HEADERIMAGE_BITMAP "..\assets\header.bmp"
!define MUI_HEADERIMAGE_BITMAP_STRETCH AspectFitHeight
!define MUI_WELCOMEFINISHPAGE_BITMAP "..\assets\InstallerImage.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "..\assets\InstallerImage.bmp"
!include "ModernXL.nsh"
!include "MUI2.nsh"
!define MUI_ICON "..\assets\NewInstaller.ico"
!define MUI_PAGE_HEADER_TEXT "TS1: Starter Pack - Web Installer"
!define MUI_PAGE_HEADER_SUBTEXT "TS1 Complete Collection repacked by osab!"
!define MUI_WELCOMEPAGE_TITLE "osab's Sims 1 Starter Pack"
!define MUI_WELCOMEPAGE_TEXT "Welcome to the Sims 1 Starter Pack Touchup Installer (v15). $\n$\nPlease ensure you have downloaded the latest version from the GitHub!"
!define MUI_UNCONFIRMPAGE_TEXT_TOP "WARNING: Before uninstalling, make sure the game folder you chose contains ONLY the uninstaller and game files. The game files MUST be in their own folder with no other essential data! Back up any UserData save files left behind in the game folder if needed! I am not responsible for any data loss!"
!define MUI_LICENSEPAGE_TEXT_TOP "License Information:"
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_FINISHPAGE_LINK "TS2 Community Discord Server!"
!define MUI_FINISHPAGE_LINK_LOCATION "https://discord.gg/ts2community"
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "..\LICENSE.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_DIRECTORY
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH
!insertmacro MUI_LANGUAGE "English"
##################################### Begin Installation

!macro simsTouchup
    SetRegView 32
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "EP2Installed" "1"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "EP3Installed" "1"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "EP3Patch" "2"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "EP4Installed" "1"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "EP5Installed" "1"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "EP5Patch" "1"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "EP6Installed" "1"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "EP7Installed" "1"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "EP8Installed" "1"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "EPDInstalled" "1"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "EPDPatch" "1"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "EPInstalled" "1"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "Installed" "1"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "InstallPath" "$INSTDIR"
    WriteRegDWORD HKLM32 "SOFTWARE\Maxis\The Sims" "Language" "409"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "SIMS_CURRENT_NEIGHBORHOOD_NUM" "1"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "SIMS_CURRENT_NEIGHBORHOOD_PATH" "UserData"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "SIMS_DATA" "$INSTDIR\The Sims"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "SIMS_GAME_EDITION" "255"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "SIMS_LANGUAGE" "USEnglish"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "SIMS_MUSIC" "Music"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "SIMS_SKU" "1"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "SIMS_SOUND" "$INSTDIR\The Sims\SoundData"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "TELEPORT" "1"
    WriteRegStr HKLM32 "SOFTWARE\Maxis\The Sims" "Version" "1.2"
    ${If} $INSTDIR = "$PROGRAMFILES32\The Sims 1 Starter Pack"
    WriteRegStr HKLM64 "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" "$INSTDIR\The Sims\Sims.exe" "RUNASADMIN"
    ${EndIf}
    WriteRegStr HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims.exe" "Path" "$INSTDIR\The Sims"
    WriteRegStr HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\The Sims 1 Starter Pack" "DisplayName" "The Sims 1 Starter Pack"
    WriteRegStr HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\The Sims 1 Starter Pack" "DisplayIcon" "$\"$INSTDIR\The Sims\Sims.exe$\""
    WriteRegStr HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\The Sims 1 Starter Pack" "Publisher" "osab / EA"
    WriteRegStr HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\The Sims 1 Starter Pack" "InstallLocation" "$INSTDIR"
    WriteRegStr HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\The Sims 1 Starter Pack" "UninstallString" "$\"$INSTDIR\Uninstall The Sims 1 Starter Pack.exe$\""
!macroEnd

InstType "Full Installation" IT_FULL

!macro RemovePreviousInstall
    SetRegView 32
    ClearErrors
    EnumRegKey $0 HKLM32 "SOFTWARE\Maxis\The Sims" 0
IfErrors keydontexist keyexists
goto noo
keyexists:
    ReadRegStr $R4 HKLM32 "SOFTWARE\Maxis\The Sims" "InstallPath" 
    MessageBox MB_YESNO|MB_ICONEXCLAMATION "A previous installation of The Sims was detected on this system. Leaving behind remnants in the registry can cause unwanted behavior. Would you like the installer to remove the conflicting registry keys?$\n$\nWARNING: this will remove the keys we detected, rendering the old installation unplayable. Your game file and save file directories will not be affected." IDYES si IDNO noo
si:
    DeleteRegKey HKLM32 "SOFTWARE\Maxis\The Sims" 
    DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims.exe"
    goto noo
keydontexist:
    #key doesn't exist
    DetailPrint "No prior installations were detected. Yay!"
noo:
!macroend

Section "TS1 Starter Pack" Section1
	SectionInstType ${IT_FULL}
    SectionIn RO 
    SetOutPath $INSTDIR
    SetOverwrite on
    InitPluginsDir

    !insertmacro RemovePreviousInstall

	CreateDirectory "$INSTDIR\temp"	
        
    DetailPrint "Adding The Sims Creator no-CD fix..."
    SetOutPath "$INSTDIR\The Sims Creator"
    File "..\components\TheSimsCreator.exe"

    # Touchup
    DetailPrint "Touching Up..."
    !insertmacro simsTouchup
    !insertmacro setLanguage "Maxis\The Sims"
    WriteUninstaller "$INSTDIR\Uninstall The Sims 1 Starter Pack.exe"
SectionEnd

Section "Start Menu/Desktop Shortcut" Section7
	SectionInstType ${IT_FULL}
	SetShellVarContext all
	SetOutPath "$INSTDIR\The Sims"
	CreateDirectory '$SMPROGRAMS\The Sims 1 Starter Pack\'
	CreateShortCut '$SMPROGRAMS\The Sims 1 Starter Pack\The Sims.lnk' '$INSTDIR\The Sims\Sims.exe' "" '$INSTDIR\The Sims\Sims.exe' 0
	CreateShortCut '$Desktop\The Sims.lnk' '$INSTDIR\The Sims\Sims.exe' "" '$INSTDIR\The Sims\Sims.exe' 0
SectionEnd 

Section
	RMDir "$INSTDIR\temp"	
SectionEnd

Section "Uninstall" Section8
	SetRegView 32
	Delete "$INSTDIR\Uninstall The Sims 1 Starter Pack.exe"
	ReadRegStr $R4 HKLM32 "SOFTWARE\Maxis\The Sims" "InstallPath"
    ${If} $R4 = $INSTDIR
	RMDir /r "$R4\The Sims"
	RMDir /r "$R4\The Sims Creator"
    Delete "$R4\Sims1WidescreenPatcher.exe"
    Delete "$R4\PatcherLicense.txt"
    RMDIR /r $R4
    ${EndIf}
	DeleteRegKey HKLM32 "SOFTWARE\Maxis\The Sims"
    DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims.exe"
	DeleteRegKey HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\The Sims 1 Starter Pack"
	DeleteRegValue HKLM64 "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" "$INSTDIR\The Sims\Sims.exe"
	RMDir /r "$SMPROGRAMS\The Sims 1 Starter Pack"
	Delete "$Desktop\The Sims.lnk"
SectionEnd

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${Section1} "Installs The Sims Complete Collection (minimal install)."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section2} "Installs Visual C++ Redist, required for Widescreen Patcher."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section3} "Installs The Sims 1 Widescreen Patcher by FaithBeam."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section7} "Create a shortuct to launch the game in your Start Menu/Desktop."

!insertmacro MUI_FUNCTION_DESCRIPTION_END
