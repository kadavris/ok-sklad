unit xFun;

interface

uses Windows, Classes, Forms, Controls, DB;

procedure DSRefresh(ADS: TDataSet; const AKeyName: string; AKeyValue: integer);
function GetMax(DS: TDataSet; const AFieldName: string): integer;

implementation

//==============================================================================================
function GetMax(DS: TDataSet; const AFieldName: string): integer;
  var BM: TBookmark;
begin
    Result := 0;
    BM := DS.GetBookmark;
    try
     DS.First;
     while not DS.Eof do begin
      if DS.FieldByName(AFieldName).AsInteger > Result then Result := DS.FieldByName(AFieldName).AsInteger;
      DS.Next;
     end;
     DS.GotoBookmark(BM);
    finally
     DS.FreeBookmark(BM);
    end;
end;

//==============================================================================================
procedure DSRefresh(ADS: TDataSet; const AKeyName: string; AKeyValue: integer);
  var
    FID: Integer;
begin
   ADS.DisableControls;
   Screen.Cursor := crHourGlass;
   try
     if (AKeyValue=0) and ADS.Active
       then FID := ADS.fieldbyname(AKeyName).AsInteger
       else FID := AKeyValue;

     if ADS.Active then ADS.Close;
     ADS.Open;
     ADS.Locate(AKeyName, FID, []);

   finally
     try ADS.EnableControls; except end;
     Screen.Cursor := crDefault;
   end;
end;

end.
