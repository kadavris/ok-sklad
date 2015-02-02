program FixConf;

{$APPTYPE CONSOLE}

uses
  SysUtils, Classes{, regexp};

const
  FStr = 'ExternalFileAccess = ';

var
  FName, FDest, S, Res: string;
  FPos, i: Integer;

begin
  if ParamCount < 2 then Exit;
  FName := StringReplace(ParamStr(1), '$', ' ', [rfReplaceAll]);
  FDest := StringReplace(ParamStr(2), '$', ' ', [rfReplaceAll]);

  with TStringList.Create do
  try
    LoadFromFile(FName);
    FPos := Pos(FStr, Text);

    if FPos > 0 then begin
      for i := 0 to Count - 1 do begin
        S := Strings[i];
        FPos := Pos(FStr, S);

        if FPos > 0 then begin
          if Pos('Full', Copy(S, FPos + Length(FStr), Length(S) - FPos)) = 1
            then Res := FStr + 'Full' 
          else if (Pos('Restrict', Copy(S, FPos + Length(FStr), Length(S) - FPos)) = 1)
            then if (Pos(FDest, S) = 0)
              then Res := FStr + Trim(Copy(S, FPos + Length(FStr), Length(S) - FPos - Length(FStr) + 1)) + ';' + FDest
              else Res := FStr + Trim(Copy(S, FPos + Length(FStr), Length(S) - FPos - Length(FStr) + 1)) 
          else if Pos('None', Copy(S, FPos + Length(FStr), Length(S) - FPos)) = 1
            then Res := FStr + 'Restrict ' + FDest;

          Strings[i] := Res;  
        end;
      end;
    end
    else begin
      Add(FStr + 'Restrict ' + FDest);
    end;

    SaveToFile(FName);

  finally
    Free;
  end;
end.
 