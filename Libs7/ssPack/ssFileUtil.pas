unit ssFileUtil;

interface

function NormalDir(const DirName: string): string;

implementation

uses 
  SysUtils, ssStrUtil;

function NormalDir(const DirName: string): string;
begin
  Result := DirName;

  if (Result <> '') and not CharInSet(AnsiLastChar(Result)^, [':', '\'])
  then begin
    if (Length(Result) = 1) and CharInSet(UpCase(Result[1]), ['A'..'Z'])
      then Result := Result + ':\'
      else Result := Result + '\';
  end;
end;

end.
