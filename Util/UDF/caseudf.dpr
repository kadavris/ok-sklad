library caseudf;

{ Copyright Dmitry Kuzmenko, Epsylon Technologies }
{ e-mail: dima@demo.ru,  web: http://ib.demo.ru   }
{ вообще о копирайте на такие функции говорить
  смешно, так что пользуйтесь на здоровье         }


{ поместите dll в каталог intrbase\bin для 4.2,
  или intrbase\lib для 5.0. Выполните DDL-команды
  создания нужных вам функций в БД при помощи
  Database Explorer или WISQL.
  Функции CharxxxxBuf для конвертации символов
  пользуются информацией о локализации 95/NT, поэтому
  поддержка русской кодовой страницы должна быть
  обязательно включена там, где установлен сервер IB.

  длину CSTRING в DDL-объявлении функций вы можете
  выбрать не 255, а любую, не меньшую чем длина
  полей CHAR или VARCHAR, которые вы собираетесь
  передавать в данные функции.


  place dll to correct directory (lib for 5.x or UDF for 6.x).
  Run UDF declaration commands. (copy from here and paste in any tool
  that can work with Interbase/Firebird).
  Functions CharxxxxBuf uses current locale to uppercase and lowercase
  character strings.

  You can modify CSTRING result length to any size (not only 255). }

uses
  Windows, SysUtils;

{ если вам потребуется аллокировать память для функций с FREE_IT
(см. документацию по IB 5.0), то нужно пользоваться не мифической
 функцией SysAlloc, а вот такой: 


 If you need to allocate memory for FREE_IT functions you
 can use this declaration (or use ib_util.dll):}
 

 function malloc(Size: Integer): PChar; cdecl; external 'msvcrt.dll';

{ причем пользователям C++Builder это тоже рекомендуется, поскольку
стандартный malloc использует борландовский менеджер памяти, а IB
написан на MS C, и соответственно использует микрософтовский
менеджер памяти. 

 It is also recommended to use this malloc or ib_util for Borland C++/Builder
 users, because Interbase for Windows always being compiled with MSVC, wich have
 different memory allocation mechanisms than Borland C/C++ compilers.}

{ DECLARE EXTERNAL FUNCTION UPCASE
   CSTRING(255) RETURNS CSTRING(255)
  ENTRY_POINT 'UpCase'  MODULE_NAME 'CASEUDF' }

function UpCase(CStr: PChar): PChar; cdecl; export;
 begin
  CharUpperBuff(CStr, Length(CStr));
  Result := CStr;
 end;

{ DECLARE EXTERNAL FUNCTION LOCASE
   CSTRING(255) RETURNS CSTRING(255)
  ENTRY_POINT 'LoCase'  MODULE_NAME 'CASEUDF' }

function LoCase(CStr: PChar): PChar; cdecl; export;
 begin
  CharLowerBuff(CStr, Length(CStr));
  Result:=CStr;
 end;

{ DECLARE EXTERNAL FUNCTION ISDIGIT
   CSTRING(255) RETURNS INTEGER BY VALUE
  ENTRY_POINT 'IsDigit'  MODULE_NAME 'CASEUDF' }

function IsDigit(c: pchar): integer;
 begin
  if StrToIntDef(c, -1) >= 0 then
   Result:=1
  else
   Result:=0;
 end;

{ DECLARE EXTERNAL FUNCTION SUBSTR
   CSTRING(255), INTEGER, INTEGER
   RETURNS CSTRING(255)
  ENTRY_POINT 'SubStr'  MODULE_NAME 'CASEUDF' }

{ функция SubStr взята из UDFDemo }  
function SubStr(CString: PChar; var FromPos, ToPos: Integer): PChar; cdecl; export;
var
  Length: Integer;
begin
  Length := StrLen(CString);
  Result := CString + Length;
  if (FromPos > 0) and (ToPos >= FromPos) then begin
    if Length >= FromPos then Result := CString + FromPos - 1;
    if Length > ToPos then CString[ToPos] := #0;
  end;
end;

exports
 UpCase,
 LoCase,
 IsDigit,
 SubStr;

begin
 isMultiThread:=True;
end.
