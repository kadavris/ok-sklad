program LngResEditor;

uses
  SysUtils, xLngManager, Dialogs;

var
  FFileName: string;
begin
  with TxLngManager.Create(nil) do
    try
      with TOpenDialog.Create(nil) do
        try
          if Execute then FFileName := FileName
            else Exit;
        finally
          Free;
        end;
      FileName := FFileName;
      try
        Active := True;
        ShowEditor;
      except
        raise Exception.Create('Invalid resource file!');
      end;
    finally
      Free;
    end;
end.
