;
!include "${_VARS_}"
!define _OK_REG_KEY_ "Software\Operator\Sklad"

ShowInstDetails hide
ShowUnInstDetails hide
LicenseBkColor /windows
LicenseForceSelection checkbox
RequestExecutionLevel admin
XPStyle on

Caption "${_TITLE_} ${_MOTTO_}"
BrandingText "${_COPYRIGHT_}"

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "${_TITLE_}"
!define PRODUCT_VERSION "${_VER_}"
!define PRODUCT_PUBLISHER "${_COMPANY_}"
!define PRODUCT_WEB_SITE "${_URL_}"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\${PRODUCT_NAME}"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

!include "MUI2.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "..\pics\icons\32x32\MainIcon.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "..\pics\install\nsis-header.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "..\pics\install\side.bmp"  

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSISLanguage"

!insertmacro MUI_PAGE_WELCOME
!define MUI_LICENSEPAGE_RADIOBUTTONS
!insertmacro MUI_PAGE_LICENSE "${_LICENSE_}"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY

var ICONS_GROUP
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "${_INSTDIR_}"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"
!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
!insertmacro MUI_PAGE_INSTFILES

; Finish page
;!define MUI_FINISHPAGE_RUN "$INSTDIR\Server\ok_server_free.exe"
;!define MUI_FINISHPAGE_RUN_PARAMETERS "-reg"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!include "${_LANGVARS_}"
!define MUI_LANGDLL_ALWAYSSHOW
!define MUI_LANGDLL_ALLLANGUAGES

!include "install_langstrings.nsi"

!insertmacro MUI_RESERVEFILE_LANGDLL
; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "${_SETUPEXE_}"
InstallDir "$PROGRAMFILES\${_INSTDIR_}"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""

VIProductVersion "${_VERFULL_}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${_TITLE_}"
;VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "A test comment"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "${_COMPANY_}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalTrademarks" "${_TITLE_} is a trademark of ${_COMPANY_}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "${_COPYRIGHT_}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${_MOTTO_}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${_VER_}"

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

;==================================================================================================
;==================================================================================================
;==================================================================================================
; actual sections to choose
!include "install_${_DISTR_}.nsi"

;==================================================================================================
;==================================================================================================
;==================================================================================================
Section -AdditionalIcons
  SetOutPath $INSTDIR
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\$(lang_website).lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\$(lang_uninstall).lnk" "$INSTDIR\uninst.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\Client\ok-client.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"

  WriteRegStr "HKLM" "${_OK_REG_KEY_}" "Lang" "${_LANG_}"
  WriteRegStr "HKCU" "${_OK_REG_KEY_}" "Lang" "${_LANG_}"
  WriteRegStr "HKLM" "${_OK_REG_KEY_}" "RepLang" "${_LANG_}"
  WriteRegStr "HKCU" "${_OK_REG_KEY_}" "RepLang" "${_LANG_}"
  WriteRegDWORD "HKLM" "${_OK_REG_KEY_}" "CountryID" "${_COUNTRYID_}"
  WriteRegDWORD "HKCU" "${_OK_REG_KEY_}" "CountryID" "${_COUNTRYID_}"
  WriteRegDWORD "HKLM" "${_OK_REG_KEY_}" "AccRules" "-1"
  WriteRegDWORD "HKCU" "${_OK_REG_KEY_}" "AccRules" "-1"
;  WriteRegStr   HKLM "${_OK_REG_KEY_}" "ClientPath" "$INSTDIR\Client"
;  WriteRegStr   HKLM "${_OK_REG_KEY_}" "ServerPath" "$INSTDIR\Server"
SectionEnd

Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(lang_UninstSuccess)"
FunctionEnd

Function un.onInit
!insertmacro MUI_UNGETLANGUAGE
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "$(lang_UninstQuery)" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  !insertmacro MUI_STARTMENU_GETFOLDER "Application" $ICONS_GROUP
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"

  ExecWait "$INSTDIR\Server\scktsrvr.exe -UNINSTALL -SILENT"

  Delete "$INSTDIR\Server\*.*"
  Delete "$INSTDIR\Server\ext\*.*"
  RMDir "$INSTDIR\Server\ext"
  Delete "$INSTDIR\Server\lng\*.*"
  RMDir "$INSTDIR\Server\lng"
  Delete "$INSTDIR\Server\upd\*.*"
  RMDir "$INSTDIR\Server\upd"
  MessageBox MB_YESNO|MB_ICONQUESTION "$(lang_deletedbs)" IDNO +2
  Delete "$INSTDIR\Server\userdb\demodb.?db"

  ExecWait "$INSTDIR\FireBird\firebird-uninst.bat $INSTDIR\FireBird\bin"
  Delete "firebird-inst.bat"
  Delete "firebird-uninst.bat"
  Delete "$SYSDIR\Firebird2Control.cpl"

  Delete "$SMPROGRAMS\$ICONS_GROUP\$(lang_uninstall).lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\$(lang_website).lnk"
  Delete "$DESKTOP\${_TITLE_} $(lang_client).lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\${_TITLE_} $(lang_client).lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\${_TITLE_} $(lang_server).lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\$(lang_register).lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\$(lang_firebirdcpl).lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\$(lang_repedit).lnk"

  RMDir "$SMPROGRAMS\$ICONS_GROUP"
  RMDir /r "$INSTDIR\FireBird"
  RMDir /r "$INSTDIR\Client"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"

  DeleteRegKey HKLM "${_OK_REG_KEY_}"
  DeleteRegKey HKCU "${_OK_REG_KEY_}"

  SetAutoClose true

  MessageBox MB_YESNO|MB_ICONQUESTION "$(lang_RebootRequired)" IDNO +2
  Reboot
SectionEnd
