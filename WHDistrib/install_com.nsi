; commercial install sections
Section "${_TITLE_} $(lang_client)" SEC01
;  LogSet On
  SetOverwrite try
  SetOutPath "$INSTDIR\Client"
  File "/oname=ok-client.exe" "${_CLTEXE_}.exe"

  File "/oname=soapmgr32.dll" "resdll\branding\${_SUFFIX_}.dll"
  File "/oname=borlfl32.dat" "${_CLTEXE_}.faddr"

  File "Client\*.*"
  File "Client\dlls\*.*"
  File "${_SERVERSRC_}\OK_Server.tlb"
  File "${_CLIENTSRC_}\!ReportEditor\ReportEditor.exe"
  SetOutPath "$INSTDIR\Client\RE_LNG"
  File "${_CLIENTSRC_}\!ReportEditor\RE_LNG\*.*"
  SetOutPath "$INSTDIR\Client"

  ExecWait "TRegSvr.exe -t -q OK_Server.tlb"

;  File "texts\ReleaseNotes_${_LANG_}.txt"

  SetOutPath "$INSTDIR\Client\LNG"
  File "${_CLIENTSRC_}\LNG\*.lng"
  File "${_CLIENTSRC_}\LNG\*.ini"

  SetOutPath "$INSTDIR\Client\Reports"
  File /r "${_CLIENTSRC_}\Reports\*.*"

  SetOutPath "$INSTDIR\Client\Help\ENG\HTML"
  File "${_CLIENTSRC_}\Help\ENG\HTML\*.*"
  SetOutPath "$INSTDIR\Client\Help\RUS\HTML"
  File "${_CLIENTSRC_}\Help\RUS\HTML\*.*"

  !include "${_BRANDFILESINC_}"

; Shortcuts
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\${_TITLE_} $(lang_client).lnk" "$INSTDIR\Client\ok-client.exe"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\${_TITLE_} $(lang_repedit).lnk" "$INSTDIR\Client\ReportEditor.exe"
  CreateShortCut "$DESKTOP\${_TITLE_} $(lang_client).lnk" "$INSTDIR\Client\ok-client.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

;----------------------------------------------------------------------------------------------
Section "${_TITLE_} $(lang_server)" SEC02
;  LogSet On
  !define USERDB_DIR "$INSTDIR\Server\UserDB"
  !define DEMODB_FILE "demodb.gdb"

  SetOutPath "${USERDB_DIR}"
  SetOverwrite Off
  File "/oname=${DEMODB_FILE}" "${_DEMODB_}"

  SetOverwrite try
  SetOutPath "$INSTDIR\Server"
  File "/oname=ok-server.exe" "${_SRVEXE_}.exe"
  File "/oname=borlfl32.dat" "${_SRVEXE_}.faddr"

  File "/oname=emptydb.gdb" "${_EMPTYDB_}"
  File "Server\*.*"
  File "Server\dlls\*.*"
  File "/oname=soapmgr32.dll" "resdll\branding\${_SUFFIX_}.dll"

  File "${_SERVERSRC_}\OK_Server.tlb"
;  ExecWait "ok-server.exe -regsvr"
  ExecWait "TRegSvr.exe ok-server.exe"

  File "${_SERVERSRC_}\scktsrvr.exe"
  File "${_SERVERSRC_}\dbdata.sql"

  SetOutPath "$INSTDIR\Server\LNG"
  File "${_SERVERSRC_}\LNG\*.*"

  SetOutPath "$INSTDIR\Server\upd"
  File /r "${_SERVERSRC_}\upd\*.*"

  SetOutPath "$INSTDIR\Server\xml"
  WriteINIStr "$INSTDIR\Server\ok_server.ini" "main" "SysProvDir" "$INSTDIR\Server\xml"
  FlushINI "$INSTDIR\Server\ok_server.ini"

; providers should be always freshies version
  File "${_SERVERSRC_}\xml\provtext.xml"
  File "${_SERVERSRC_}\xml\provgroups.xml"

; and then we'll won't overwrite existing db/users info
  ifFileExists "dbparams.xml" donexml

  File "Server\xml\users.xml"
  File "Server\xml\databases.xml"

; fixing path to the demodb
  ClearErrors
  GetTempFileName $5
  File /oname=$5 "Server\xml\dbparams.xml"
  FileOpen $0 $5 r
  FileOpen $1 "dbparams.xml" w
  ifErrors dbxml

  FileRead $0 $2
  FileWrite $1 $2
  FileWrite $1 "${USERDB_DIR}\${DEMODB_FILE}"
  FileRead $0 $2
  FileWrite $1 $2

  Fileclose $0
  Fileclose $1

  dbxml:
  Delete $5
  ClearErrors
; done fixing path

  donexml:

  SetOutPath "$INSTDIR\Server"
  DetailPrint "$(lang_scktsrvrInst)"
  ;ExecWait "scktsrvr.exe -UNINSTALL -SILENT"
  ;sleep 3000
  ExecWait "scktsrvr.exe -INSTALL -SILENT"

; Shortcuts
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\${_TITLE_} $(lang_server).lnk" "$INSTDIR\Server\ok-Server.exe"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\$(lang_register).lnk" "$INSTDIR\Server\ok-Server.exe" "-reg"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

;----------------------------------------------------------------------------------------------
Section "FireBird SQL Server" SEC03
; LogSet On
  SetOutPath "$INSTDIR\FireBird"
  SetOverwrite try
  File "firebird-inst.bat"
  File "firebird-uninst.bat"

  File /r "FireBird\*.*"

; FB control panel and vc2005 redistr
  DetailPrint "$(lang_instvccrt8)"
  ExecWait "FireBird\system32\vccrt8_Win32.msi" $0
  SetOutPath "$SYSDIR"
  File "FireBird\system32\Firebird2Control.cpl"

  SetOutPath "$INSTDIR\FireBird"
  ExecWait "bin\instsvc.exe stop" $0
  ExecWait "firebird-uninst.bat $\"bin$\"" $0
  sleep 3000
  ExecWait "firebird-inst.bat $\"bin$\"" $0

; Shortcuts
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\$(lang_firebirdcpl).lnk" "$SYSDIR\Firebird2Control.cpl"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

; Section descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} "$(lang_instListDescClient)"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} "$(lang_instListDescServer)"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC03} "$(lang_instListDescSQL)"
!insertmacro MUI_FUNCTION_DESCRIPTION_END
