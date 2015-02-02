{$I ok_sklad.inc}
unit ok_rep;

interface

uses
  SysUtils, ssClientDataSet;

var
  OKR_Ents, OKR_Attrs, OKR_EntRel: TssClientDataSet;

function OKR_BuildQuery(EntID: Integer; KeyValue: Integer; const AttrList: array of Variant): string;

implementation

uses
  DB, Classes, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


//==============================================================================================
function OKR_GetJoin(FromID, ToID: Integer; ASQL: TStringList): Boolean;
  var
    BM: TBookmark;
    FPID: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'OKR_GetJoin') else _udebug := nil;{$ENDIF}

  Result := False;
  with OKR_EntRel do begin
    BM := GetBookmark;
    try
      First;
      while not Eof do begin
        if FieldByName('id').AsInteger = FromID then begin
          if ASQL.IndexOfObject(TObject(FieldByName('pid').AsInteger)) <> -1
            then FPID := -1
            else FPID := FieldByName('pid').AsInteger;

          ASQL.AddObject(' join ' + FieldByName('pname').AsString + ' on ' +
              FieldByName('pname').AsString + '.' + FieldByName('pkeyfield').AsString + '=' +
              FieldByName('name').AsString + '.' + FieldByName('pkeyfield').AsString, TObject(FPID));

          if FieldByName('pid').AsInteger = ToID then begin
            Result := True;
            {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
            Exit;
          end
          else begin
            if OKR_GetJoin(FieldByName('pid').AsInteger, ToID, ASQL) then begin
              Result := True;
              {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
              Exit;
            end
            else ASQL.Delete(ASQL.Count - 1);
          end;
        end;
        Next;
      end;
    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function OKR_BuildQuery(EntID: Integer; KeyValue: Integer; const AttrList: array of Variant): string;
 var
   FSel: string;
   FFrom, FWhere: string;
   i: Integer;
   FJoinSQL: TStringList;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'OKR_BuildQuery') else _udebug := nil;{$ENDIF}


  FJoinSQL := TStringList.Create;

  Result := ''; FSel := ''; FWhere := 'where ';
  if OKR_Ents.Locate('id', EntID, [])
    then FFrom := ' from ' + OKR_Ents.FieldByName('tablename').AsString
    else begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

  for i := Low(AttrList) to High(AttrList) do begin
    if OKR_Attrs.Locate('attrid', AttrList[i], []) then begin
      FSel := FSel + OKR_Attrs.FieldByName('tablename').AsString + '.' +
              OKR_Attrs.FieldByName('fieldname').AsString + ',';
      OKR_GetJoin(EntID, OKR_Attrs.FieldByName('id').AsInteger, FJoinSQL);
    end;
  end;

  System.Delete(FSel, Length(FSel), 1);
  FSel := 'select ' + FSel;
  i := 0;
  while i < FJoinSQL.Count do begin
    if Integer(FJoinSQL.Objects[i]) = -1
      then FJoinSQL.Delete(i)
      else Inc(i);
  end;

  FFrom := FFrom + FJoinSQL.Text;

  if OKR_Ents.FieldByName('cond').AsString <> ''
    then FWhere := FWhere + OKR_Ents.FieldByName('cond').AsString;

  if KeyValue <> -1 then begin
    if Length(FWhere) > 6 then FWhere := FWhere + ' and ';
    FWhere := FWhere + OKR_Ents.FieldByName('tablename').AsString + '.' +
              OKR_Ents.FieldByName('keyfield').AsString + '=' + IntToStr(KeyValue);
  end;
  FJoinSQL.Free;
  Result := FSel + FFrom + FWhere;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ok_rep', @Debugging, DEBUG_group_ID);{$ENDIF}

  OKR_Ents := TssClientDataSet.Create(nil);
  OKR_EntRel := TssClientDataSet.Create(nil);
  OKR_Attrs := TssClientDataSet.Create(nil);
  OKR_Ents.ProviderName := 'pOKR_Ents_List';
  OKR_EntRel.ProviderName := 'pOKR_EntRel_List';
  OKR_Attrs.ProviderName := 'pOKR_Attrs_List';

finalization
  OKR_Ents.Free;
  OKR_EntRel.Free;
  OKR_Attrs.Free;

  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}
end.
