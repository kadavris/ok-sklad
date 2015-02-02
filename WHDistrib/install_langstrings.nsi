;
LangString lang_deletedbs ${LANG_ENGLISH} "Do you want to delete database files?"
LangString lang_deletedbs ${LANG_SPANISHINTERNATIONAL} "?Desea eliminar los archivos de base de datos?"

!if ${LANG_RUSSIAN} > 0
  LangString lang_deletedbs ${LANG_RUSSIAN} "Вы хотите удалить файлы баз данных?"
!endif

;-----------------------------
LangString lang_instListDescFree   ${LANG_ENGLISH} "OK-Client and OK-Server modules, FireBird SQL v2 - a stable and well-developed open source SQL Server software."
LangString lang_instListDescFree   ${LANG_SPANISHINTERNATIONAL} "Modulos de OK-Cliente y OK-Servidor, FireBird SQL v2 - el software de SQL servidor de codigo abierto estable y bien desarrollado."

LangString lang_instListDescClient ${LANG_ENGLISH} "Client application"
LangString lang_instListDescClient ${LANG_SPANISHINTERNATIONAL} "Aplicacion del cliente"
LangString lang_instListDescServer ${LANG_ENGLISH} "Server-side modules. Install only for single-user license or on the server computer for multi-user license"
LangString lang_instListDescServer ${LANG_SPANISHINTERNATIONAL} "Modulos del servidor. Instalar solo para la licencia de usuario unico o en el equipo servidor de licencia multi-usuario"

LangString lang_instListDescSQL    ${LANG_ENGLISH} "This is stable and well-developed open source SQL Server software."
LangString lang_instListDescSQL    ${LANG_SPANISHINTERNATIONAL} "Es el software de SQL servidor de codigo abierto estable y bien desarrollado."


!if ${LANG_RUSSIAN} > 0
  LangString lang_instListDescFree   ${LANG_RUSSIAN} "Модули OK-Клиент и ОК-Сервер для однопользовательской версии, FireBird SQL v2 - стабильный и функциональный SQL сервер с открытым кодом"
  LangString lang_instListDescClient ${LANG_RUSSIAN} "Клиентская часть (Рабочее место)"
  LangString lang_instListDescServer ${LANG_RUSSIAN} "Серверная часть. Устанавливайте вместе с клиентской частью если у Вас только 1 рабочее место или же только на серверный компьютер, если у Вас многопользовательская лицензия"
  LangString lang_instListDescSQL    ${LANG_RUSSIAN} "Это стабильный и функциональный SQL сервер с открытым кодом. Устанавливайте только вместе с серверной частью"
!endif

;-----------------------------
LangString lang_instvccrt8 ${LANG_ENGLISH} "Launching installer for Microsoft Visual C++ redistributable"
LangString lang_instvccrt8 ${LANG_SPANISHINTERNATIONAL} "Lanzamiento de programa de instalacion de Microsoft Visual C++ Redistributable"

!if ${LANG_RUSSIAN} > 0
  LangString lang_instvccrt8 ${LANG_RUSSIAN} "Запускаем установку Microsoft Visual C++ redistributable"
!endif

;-----------------------------
LangString lang_RebootRequired ${LANG_ENGLISH} "Reboot is required to complete the operation. Do you wish to do it now?"
LangString lang_RebootRequired ${LANG_SPANISHINTERNATIONAL} "Es necesario reiniciar para completar la operacion. ?Desea hacerlo ahora?"

!if ${LANG_RUSSIAN} > 0
  LangString lang_rebootRequired ${LANG_RUSSIAN} "Для завершения деинсталляции рекомендуется перезагрузка. Сделать это сейчас?"
!endif

;-----------------------------
LangString lang_scktsrvrInst ${LANG_ENGLISH} "Registering Borland Socket Server application. Please ignore the 1073: 'service already exist' error that may arise."
LangString lang_scktsrvrInst ${LANG_SPANISHINTERNATIONAL} "Registro de Borland Socket Application Server. Por favor, ignore el error 1073 que pueda surgir: 'servicio ya existe'"

LangString lang_scktsrvrUninst ${LANG_ENGLISH} "Trying to deinstall Borland Socket server. Please ignore the 1060: 'service does not exist' error that may arise."
LangString lang_scktsrvrUninst ${LANG_SPANISHINTERNATIONAL} "Tratando desinstalar Borland Socket Server. Por favor, ignore el error que pueda surgir 1060: 'servicio no existe'"

!if ${LANG_RUSSIAN} > 0
  LangString lang_scktsrvrInst ${LANG_RUSSIAN} "Инсталлируем Borland Socket Server. Пожалуйста игнорируйте ошибку 1073: 'service already exist' если она возникнет."
  LangString lang_scktsrvrUninst ${LANG_RUSSIAN} "Деинсталлируем Borland Socket Server. Пожалуйста игнорируйте ошибку 1060: 'service does not exist' если она возникнет."
!endif

;-----------------------------
LangString lang_UninstSuccess ${LANG_ENGLISH} "Deinstallation of $(^Name) was successful."
LangString lang_UninstSuccess ${LANG_SPANISHINTERNATIONAL} "Desinstalaciin de $(^Name) completo."
!if ${LANG_RUSSIAN} > 0
  LangString lang_UninstSuccess ${LANG_RUSSIAN} "Деинсталляция $(^Name) прошла успешно."
!endif

;-----------------------------
LangString lang_UninstQuery ${LANG_ENGLISH} "Do you really want to uninstall $(^Name) and all of it's components?"
LangString lang_UninstQuery ${LANG_SPANISHINTERNATIONAL} "?Este seguro que desea desinstalar $(^Name) y todos sus componentes?"

!if ${LANG_RUSSIAN} > 0
  LangString lang_UninstQuery ${LANG_RUSSIAN} "Do you really want to uninstall $(^Name) and all of it's components?"
!endif

;-----------------------------
; Shortcuts
  LangString lang_uninstall ${LANG_ENGLISH} "Uninstall"
  LangString lang_uninstall ${LANG_SPANISHINTERNATIONAL} "Desinstalar"
  LangString lang_website   ${LANG_ENGLISH} "Our Internet site"
  LangString lang_website   ${LANG_SPANISHINTERNATIONAL} "Nuestro sitio web"

  LangString lang_client    ${LANG_ENGLISH} "Client"
  LangString lang_client    ${LANG_SPANISHINTERNATIONAL} "Cliente"

  LangString lang_server    ${LANG_ENGLISH} "Server"
  LangString lang_server    ${LANG_SPANISHINTERNATIONAL} "Servidor"

  LangString lang_register  ${LANG_ENGLISH} "Enter registration key"
  LangString lang_register  ${LANG_SPANISHINTERNATIONAL} "Introducir clave de registraci?n"

  LangString lang_firebirdcpl ${LANG_ENGLISH} "FireBird SQL Server control panel"
  LangString lang_firebirdcpl ${LANG_SPANISHINTERNATIONAL} "Panel de control del servidor SQL FireBird"

  LangString lang_repedit   ${LANG_ENGLISH} "Reports Editor"
  LangString lang_repedit   ${LANG_SPANISHINTERNATIONAL} "Editor de informes"

; Shortcuts - Russian
!if ${LANG_RUSSIAN} > 0
  LangString lang_uninstall ${LANG_RUSSIAN} "Удалить"
  LangString lang_website   ${LANG_RUSSIAN} "Наш сайт в Интернет"
  LangString lang_client    ${LANG_RUSSIAN} "Клиент"
  LangString lang_server    ${LANG_RUSSIAN} "Сервер"
  LangString lang_register  ${LANG_RUSSIAN} "Ввести регистрационный ключ"
  LangString lang_firebirdcpl ${LANG_RUSSIAN} "Панель управления FireBird SQL Server"
  LangString lang_repedit   ${LANG_RUSSIAN} "Редактор отчётов"
!endif

;LangString lang_ ${LANG_ENGLISH} ""
!if ${LANG_RUSSIAN} > 0
;  LangString lang_ ${LANG_RUSSIAN} ""
!endif
