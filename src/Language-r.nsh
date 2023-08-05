!include LogicLib.nsh
!macro setLanguage gameKey
	SetRegView 32
  	System::Call 'kernel32::GetSystemDefaultLangID() i .r7' 	
	Pop $R7	
	DetailPrint "Detected Language: $7" 
	${If} $7 == 1033 ; English
	${OrIf} $7 == 4105
	${OrIf} $7 == 7177
	${OrIf} $7 == 8201
	${OrIf} $7 == 9225
	${OrIf} $7 == 10249
	${OrIf} $7 == 11273
	${OrIf} $7 == 12297
	${OrIf} $7 == 13321
	${OrIf} $7 == 14345
	${OrIf} $7 == 15369
	${OrIf} $7 == 16393
	${OrIf} $7 == 17417
	${OrIf} $7 == 18441
		DetailPrint "Game Language = English"
		WriteRegDWORD HKLM32 "Software\${gameKey}" "SIMS_LANGUAGE" "USEnglish"
	${ElseIf} $7 == 1036 ; French
	${OrIf} $7 == 2060
	${OrIf} $7 == 3084
	${OrIf} $7 == 4108
	${OrIf} $7 == 5132
	${OrIf} $7 == 6156
	${OrIf} $7 == 7180
	${OrIf} $7 == 8204
	${OrIf} $7 == 9228
	${OrIf} $7 == 10252
	${OrIf} $7 == 11276
	${OrIf} $7 == 12300
	${OrIf} $7 == 13324
	${OrIf} $7 == 14348
	${OrIf} $7 == 15372
	${OrIf} $7 == 58380
		DetailPrint "Game Language = French"
		WriteRegDWORD HKLM32 "Software\${gameKey}" "SIMS_LANGUAGE" "French"
	${ElseIf} $7 == 1031 ; German
	${OrIf} $7 == 2055
	${OrIf} $7 == 3079
	${OrIf} $7 == 4103
	${OrIf} $7 == 5127
		DetailPrint "Game Language = German"
		WriteRegDWORD HKLM32 "Software\${gameKey}" "SIMS_LANGUAGE" "German"
	${ElseIf} $7 == 1040 ; Italian
	${OrIf} $7 == 2064
		DetailPrint "Game Language = Italian"
		WriteRegDWORD HKLM32 "Software\${gameKey}" "SIMS_LANGUAGE" "Italian"
	${ElseIf} $7 == 1034 ; Spanish
	${OrIf} $7 == 2058 ; Spanish (Mexico)
	${OrIf} $7 == 3082
	${OrIf} $7 == 4106
	${OrIf} $7 == 5130
	${OrIf} $7 == 6154
	${OrIf} $7 == 7178
	${OrIf} $7 == 8202
	${OrIf} $7 == 9226
	${OrIf} $7 == 10250
	${OrIf} $7 == 11274
	${OrIf} $7 == 12298
	${OrIf} $7 == 13322
	${OrIf} $7 == 14346
	${OrIf} $7 == 15370
	${OrIf} $7 == 16394
	${OrIf} $7 == 17418
	${OrIf} $7 == 18442
	${OrIf} $7 == 19446
	${OrIf} $7 == 20490
	${OrIf} $7 == 21514
	${OrIf} $7 == 58378
		DetailPrint "Game Language = Spanish"
		WriteRegDWORD HKLM32 "Software\${gameKey}" "SIMS_LANGUAGE" "Spanish"
	${ElseIf} $7 == 1053 ; Swedish
	${OrIf} $7 == 2077
		DetailPrint "Game Language = Swedish"
		WriteRegDWORD HKLM32 "Software\${gameKey}" "SIMS_LANGUAGE" "Swedish"
	${ElseIf} $7 == 1043 ; Dutch
	${OrIf} $7 == 2067
		DetailPrint "Game Language = Dutch"
		WriteRegDWORD HKLM32 "Software\${gameKey}" "SIMS_LANGUAGE" "Dutch"
	${ElseIf} $7 == 2052 ; Chinese (Simplified)
	${OrIf} $7 == 4100
		DetailPrint "Game Language = Chinese (Simplified)"
		WriteRegDWORD HKLM32 "Software\${gameKey}" "SIMS_LANGUAGE" "Simplified Chinese"
	${ElseIf} $7 == 1028 ; Chinese (Traditional)
	${OrIf} $7 == 3076
	${OrIf} $7 == 5124
		DetailPrint "Game Language = Chinese (Traditional)"
		WriteRegDWORD HKLM32 "Software\${gameKey}" "SIMS_LANGUAGE" "Traditional Chinese"
	${ElseIf} $7 == 1049 ; English (UK)
	${OrIf} $7 == 3081
	${OrIf} $7 == 5129
	${OrIf} $7 == 6153
		DetailPrint "Game Language = English (UK)"
		WriteRegDWORD HKLM32 "Software\${gameKey}" "SIMS_LANGUAGE" "USEnglish"
	${ElseIf} $7 == 1049 ; Polish
		DetailPrint "Game Language = Polish"
		WriteRegDWORD HKLM32 "Software\${gameKey}" "SIMS_LANGUAGE" "Polish"
	${ElseIf} $7 == 1054 ; Thai
		DetailPrint "Game Language = Thai"
		WriteRegDWORD HKLM32 "Software\${gameKey}" "SIMS_LANGUAGE" "Thai"
	${ElseIf} $7 == 2070 ; Portuguese	
	${OrIf} $7 == 1046 ; Portuguese (Brazil)
		DetailPrint "Game Language = Portuguese"
		WriteRegDWORD HKLM32 "Software\${gameKey}" "SIMS_LANGUAGE" "Portuguese"
	${ElseIf} $7 == 1041 ; Japanese
		DetailPrint "Game Language = Japanese"
		WriteRegDWORD HKLM32 "Software\${gameKey}" "SIMS_LANGUAGE" "Japanese"
	${ElseIf} $7 == 1042 ; Korean
		DetailPrint "Game Language = Korean"
		WriteRegDWORD HKLM32 "Software\${gameKey}" "SIMS_LANGUAGE" "Korean"
	${EndIf}
!macroend