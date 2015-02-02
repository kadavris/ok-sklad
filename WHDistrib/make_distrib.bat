rem Build version: 2.1.5.2313
D: && cd D:\Projects\WHDistrib || exit

perl backupOldDistr.pl


@echo --------------------------------------------------
@echo - ENG-com-oi --------------------
"D:\Program Files\NSIS\makensis.exe" /V2 /D_VARS_=vars_ok-inventory.inc /D_LANGVARS_=vars_ok-inventory_langs.inc /D_BRANDFILESINC_=vars_ok-inventory_brandFiles.inc install.nsi

@echo --------------------------------------------------
@echo - ENG-free-oi --------------------
"D:\Program Files\NSIS\makensis.exe" /V2 /D_VARS_=vars_ok-inventory-demo-new.inc /D_LANGVARS_=vars_ok-inventory-demo-new_langs.inc /D_BRANDFILESINC_=vars_ok-inventory-demo-new_brandFiles.inc install.nsi

@echo --------------------------------------------------
@echo - RUS-com --------------------
"D:\Program Files\NSIS\makensis.exe" /V2 /D_VARS_=vars_ok-sklad-ru.inc /D_LANGVARS_=vars_ok-sklad-ru_langs.inc /D_BRANDFILESINC_=vars_ok-sklad-ru_brandFiles.inc install.nsi

@echo --------------------------------------------------
@echo - RUS-free --------------------
"D:\Program Files\NSIS\makensis.exe" /V2 /D_VARS_=vars_ok-sklad-demo-new.inc /D_LANGVARS_=vars_ok-sklad-demo-new_langs.inc /D_BRANDFILESINC_=vars_ok-sklad-demo-new_brandFiles.inc install.nsi

@echo --------------------------------------------------
@echo - UKR-com --------------------
"D:\Program Files\NSIS\makensis.exe" /V2 /D_VARS_=vars_ok-sklad-ua.inc /D_LANGVARS_=vars_ok-sklad-ua_langs.inc /D_BRANDFILESINC_=vars_ok-sklad-ua_brandFiles.inc install.nsi
