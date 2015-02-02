library caseudf;

{ Copyright Dmitry Kuzmenko, Epsylon Technologies }
{ e-mail: dima@demo.ru,  web: http://ib.demo.ru   }
{ ������ � ��������� �� ����� ������� ��������
  ������, ��� ��� ����������� �� ��������         }


{ ��������� dll � ������� intrbase\bin ��� 4.2,
  ��� intrbase\lib ��� 5.0. ��������� DDL-�������
  �������� ������ ��� ������� � �� ��� ������
  Database Explorer ��� WISQL.
  ������� CharxxxxBuf ��� ����������� ��������
  ���������� ����������� � ����������� 95/NT, �������
  ��������� ������� ������� �������� ������ ����
  ����������� �������� ���, ��� ���������� ������ IB.

  ����� CSTRING � DDL-���������� ������� �� ������
  ������� �� 255, � �����, �� ������� ��� �����
  ����� CHAR ��� VARCHAR, ������� �� �����������
  ���������� � ������ �������.


  place dll to correct directory (lib for 5.x or UDF for 6.x).
  Run UDF declaration commands. (copy from here and paste in any tool
  that can work with Interbase/Firebird).
  Functions CharxxxxBuf uses current locale to uppercase and lowercase
  character strings.

  You can modify CSTRING result length to any size (not only 255). }

uses
  Windows, SysUtils;

{ ���� ��� ����������� ������������ ������ ��� ������� � FREE_IT
(��. ������������ �� IB 5.0), �� ����� ������������ �� ����������
 �������� SysAlloc, � ��� �����: 


 If you need to allocate memory for FREE_IT functions you
 can use this declaration (or use ib_util.dll):}
 

 function malloc(Size: Integer): PChar; cdecl; external 'msvcrt.dll';

{ ������ ������������� C++Builder ��� ���� �������������, ���������
����������� malloc ���������� ������������� �������� ������, � IB
������� �� MS C, � �������������� ���������� ���������������
�������� ������. 

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

{ ������� SubStr ����� �� UDFDemo }  
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
