Unicode True ;Support Unicode format in the installer

;Include header files
!include "MUI2.nsh"
!include "x64.nsh"
!include ".\Downloader.nsh"

########################### Installer SETUP
Name "The Sims 1 Starter Pack"
OutFile "..\bin\Web Installer\TS1StarterPack.WebInstaller-v11.exe"
RequestExecutionLevel admin
InstallDir "$PROGRAMFILES32\The Sims 1 Starter Pack"

########################### MUI SETUP
brandingText "osab Web Installer v11"
!define MUI_ABORTWARNING
!define MUI_HEADERIMAGE_BITMAP_STRETCH AspectFitHeight
!define MUI_HEADERIMAGE_BITMAP "..\assets\header.bmp"
!define MUI_ICON "..\assets\NewInstaller.ico"
!define MUI_PAGE_HEADER_TEXT "TS1: Starter Pack - Web Installer"
!define MUI_PAGE_HEADER_SUBTEXT "TS1 Ultimate Collection repacked by osab!"
!define MUI_WELCOMEPAGE_TITLE "osab's Sims 1 Starter Pack"
!define MUI_WELCOMEPAGE_TEXT "Welcome to the Sims 1 Starter Pack Web Installer (v11). Please ensure you have downloaded the latest version from the GitHub! Helpful log messages will be shown in the 'More Details' box."
!define MUI_UNCONFIRMPAGE_TEXT_TOP "WARNING: Before uninstalling, make sure the folder you chose contains ONLY the uninstaller and game files. The game files MUST be in their own separate folder with no other essential data! I am not responsible for any data loss!"
!define MUI_LICENSEPAGE_TEXT_TOP "License Information:"
!define MUI_WELCOMEFINISHPAGE_BITMAP "..\assets\InstallerImage.bmp"
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_FINISHPAGE_LINK "TS2 Community Discord Server!"
!define MUI_FINISHPAGE_LINK_LOCATION "https://discord.gg/invite/ts2-community-912700195249197086"
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
    WriteRegDWORD HKLM32 "SOFTWARE\Maxis\The Sims" "Language" "1033"
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
    WriteRegStr HKLM64 "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" "$INSTDIR\The Sims\Sims.exe" "RUNASADMIN"
    WriteRegStr HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims.exe" "Path" "$INSTDIR\The Sims"
    WriteRegStr HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\The Sims 1 Starter Pack" "DisplayName" "The Sims 1 Starter Pack"
    WriteRegStr HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\The Sims 1 Starter Pack" "DisplayIcon" "$\"$INSTDIR\The Sims\Sims.exe$\""
    WriteRegStr HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\The Sims 1 Starter Pack" "Publisher" "osab / EA"
    WriteRegStr HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\The Sims 1 Starter Pack" "InstallLocation" "$INSTDIR"
    WriteRegStr HKLM32 "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\The Sims 1 Starter Pack" "UninstallString" "$\"$INSTDIR\Uninstall The Sims 1 Starter Pack.exe$\""
!macroEnd

Function .OnInit
	Dialer::AttemptConnect
FunctionEnd

Section "TS1 Starter Pack" Section1
SectionIn RO 
SetOutPath $INSTDIR
SetOverwrite on
InitPluginsDir
AddSize 2400000
	
!insertmacro downloadPack "The Sims" https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v11/SFX_TheSims.v11.exe SFX_TheSims.exe "5f3fc0dceec692f0b528f5e0b0060f2faf717bb88f622ad5d5c7f6eb3435d607"

# Touchup
DetailPrint "Touching Up..."
!insertmacro simsTouchup

RMDir /r "$INSTDIR\temp"

WriteUninstaller "$INSTDIR\Uninstall The Sims 1 Starter Pack.exe"
SectionEnd
	
Section "TS1 Widescreen Patcher" Section2
	inetc::get /POPUP "Downloading TS1 Widescreen Patcher. Choose DDrawCompat as your wrapper!" https://github.com/voicemxil/TS-Starter-Pack/raw/v11/components/Sims1WidescreenPatcher.exe "$INSTDIR\Sims1WidescreenPatcher.exe"
	inetc::get /BANNER "One moment..." https://github.com/voicemxil/TS-Starter-Pack/raw/v11/components/PatcherLicense.txt "$INSTDIR\PatcherLicense.txt"
    Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "Patcher download status: $0. Executing Patcher..." 
	Execwait "$INSTDIR\Sims1WidescreenPatcher.exe"
    FileOpen $6 "$INSTDIR\The Sims\DDrawCompat.ini" a
    FileSeek $6 0 END
    FileWrite $6 "$\r$\n"
    FileWrite $6 "CpuAffinity=all"
    FileWrite $6 "$\r$\n"
    FileClose $6
SectionEnd

Section "Start Menu/Desktop Shortcut" Section7
	SetShellVarContext current
	SetOutPath "$INSTDIR\The Sims"
	CreateDirectory '$SMPROGRAMS\The Sims 1 Starter Pack\'
	CreateShortCut '$SMPROGRAMS\The Sims 1 Starter Pack\The Sims.lnk' '$INSTDIR\The Sims\Sims.exe' "" '$INSTDIR\The Sims\Sims.exe' 0
	CreateShortCut '$Desktop\The Sims.lnk' '$INSTDIR\The Sims\Sims.exe' "" '$INSTDIR\The Sims\Sims.exe' 0
SectionEnd 

Section "Uninstall" Section8
	SetRegView 32
	Delete "$INSTDIR\Uninstall The Sims 1 Starter Pack.exe"
	ReadRegStr $R4 HKLM32 "SOFTWARE\Maxis\The Sims" "InstallPath"
    ${If} $R4 = $INSTDIR
	RMDir /r $R4
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
  !insertmacro MUI_DESCRIPTION_TEXT ${Section2} "Installs The Sims 1 Widescreen Patcher by FaithBeam."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section7} "Create a shortuct to launch the game in your Start Menu/Desktop."

!insertmacro MUI_FUNCTION_DESCRIPTION_END
