Unicode True ;Support Unicode format in the installer
Target amd64-unicode

;Include header files
!define MUI_WELCOMEFINISHPAGE_BITMAP "..\assets\InstallerImage.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "..\assets\InstallerImage.bmp"
!include "ModernXL.nsh"
!include "MUI2.nsh"
!include "x64.nsh"
!include "WinVer.nsh"
!include ".\Downloader.nsh"

########################### Installer SETUP
Name "The Sims 1 Starter Pack"
OutFile "..\bin\Web Installer\TS1StarterPack-WebInstaller.v12.x64.exe"
RequestExecutionLevel admin
ShowInstDetails show
InstallDir "$PROGRAMFILES32\The Sims 1 Starter Pack"
SetCompressor /SOLID LZMA
ManifestDPIAware True
VIProductVersion 12.0.0.0
VIAddVersionKey "CompanyName" "osab"
VIAddVersionKey "FileVersion" "12.0.0"
VIAddVersionKey "ProductName" "The Sims 1 Starter Pack"
VIAddVersionKey "ProductVersion" "12.0"

########################### MUI SETUP
brandingText "osab Web Installer v12"
!define MUI_ABORTWARNING
!define MUI_INSTFILESPAGE_COLORS "FFFFFF 000000"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_RIGHT
!define MUI_HEADERIMAGE_BITMAP "..\assets\header.bmp"
!define MUI_HEADERIMAGE_BITMAP_STRETCH AspectFitHeight
!define MUI_ICON "..\assets\NewInstaller.ico"
!define MUI_PAGE_HEADER_TEXT "TS1: Starter Pack - Web Installer"
!define MUI_PAGE_HEADER_SUBTEXT "TS1 Complete Collection repacked by osab!"
!define MUI_WELCOMEPAGE_TITLE "osab's Sims 1 Starter Pack"
!define MUI_WELCOMEPAGE_TEXT "Welcome to the Sims 1 Starter Pack Web Installer (v12). $\n$\nPlease ensure you have downloaded the latest version from the GitHub! $\n$\nHelpful log messages will be shown in the 'More Details' box."
!define MUI_UNCONFIRMPAGE_TEXT_TOP "WARNING: Before uninstalling, make sure the folder you chose contains ONLY the uninstaller and game files. The game files MUST be in their own separate folder with no other essential data! I am not responsible for any data loss!"
!define MUI_LICENSEPAGE_TEXT_TOP "License Information:"

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

InstType "Full Installation" IT_FULL
InstType "Minimal Installation" IT_MIN

Section "TS1 Starter Pack" Section1
	SectionInstType ${IT_FULL} ${IT_MIN}
SectionIn RO 
SetOutPath $INSTDIR
SetOverwrite on
InitPluginsDir
AddSize 2400000
	
DetailPrint "Downloading The Sims Creator no-CD fix..."
NScurl::http GET "https://raw.githubusercontent.com/voicemxil/TS-Starter-Pack/v12/components/TheSimsCreator.exe" "$INSTDIR\The Sims Creator\TheSimsCreator.exe" /INSIST /BACKGROUND /END

!insertmacro downloadPack "The Sims" https://github.com/mintalien/The-Puppets-2-Definitive-Edition/releases/download/v11/SFX_TheSims.v11.exe SFX_TheSims.exe "5f3fc0dceec692f0b528f5e0b0060f2faf717bb88f622ad5d5c7f6eb3435d607"

# Touchup
DetailPrint "Touching Up..."
!insertmacro simsTouchup

RMDir /r "$INSTDIR\temp"

WriteUninstaller "$INSTDIR\Uninstall The Sims 1 Starter Pack.exe"

ExecShell "open" $INSTDIR
SectionEnd
	
Section "Visual C++ Redist (x64)" Section2
	SectionInstType ${IT_FULL}

	CreateDirectory "$INSTDIR\temp"	
	DetailPrint "Downloading VC Redist..."
	NScurl::http GET "https://aka.ms/vs/17/release/vc_redist.x64.exe" "temp\vc_redist.x64.exe" /RESUME /INSIST /END
	Pop $0
	DetailPrint "VC Redist download status: $0. Executing silently..."
	ExecWait "$INSTDIR\temp\vc_redist.x64.exe /q /norestart"
	Delete "$INSTDIR\temp\vc_redist.x64.exe"
	RMDir /r "$INSTDIR\temp"
	Pop $0
	DetailPrint "Cleanup result: $0"	
SectionEnd

Section "TS1 Widescreen Patcher" Section3
	SectionInstType ${IT_FULL}
    DetailPrint "Downloading The Sims 1 Widescreen Patcher..."
    NSCurl::http GET https://github.com/voicemxil/TS-Starter-Pack/raw/v12/components/Sims1WidescreenPatcher.exe "$INSTDIR\Sims1WidescreenPatcher.exe" /RESUME /INSIST/ END	
	NSCurl::http GET https://github.com/voicemxil/TS-Starter-Pack/raw/v12/components/PatcherLicense.txt "$INSTDIR\PatcherLicense.txt" /BACKGROUND /END
    ${If} ${IsWin7}
    ${OrIf} ${IsWin8}
    ${OrIf} ${IsWin8.1}
        DetailPrint "Windows 7/8/8.1 detected, downloading older DDrawCompat fix..."
        NSCurl::http GET "https://github.com/voicemxil/TS-Starter-Pack/raw/v12/components/ddraw.Win78Fix.dll" "$INSTDIR\The Sims\ddraw.dll" /RESUME /INSIST/ END	
    ${EndIf}
    
    Pop $0 # return value = exit code, "OK" means OK
	DetailPrint "Patcher download status: $0. Executing Patcher..." 
	Execwait "$INSTDIR\Sims1WidescreenPatcher.exe"
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
	ExecShell "open" "$INSTDIR\Fun with Pets\SP9\TSBin"
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
  !insertmacro MUI_DESCRIPTION_TEXT ${Section2} "Installs Visual C++ Redist (x64). Required for Widescreen Patcher."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section3} "Installs The Sims 1 Widescreen Patcher v3.3.0 by FaithBeam."
  !insertmacro MUI_DESCRIPTION_TEXT ${Section7} "Create a shortuct to launch the game in your Start Menu/Desktop."

!insertmacro MUI_FUNCTION_DESCRIPTION_END
