{$IFNDEF PKG}
{$I ok_sklad.inc}
{$ENDIF}
unit ssFun;

interface

uses
  {$IFNDEF PKG}BaseFrame,{$ENDIF}
  ssBaseDlg, ssBaseTypes, prTypes, ssRegUtils,

  Windows, Classes, Forms, Controls, DB, Dialogs,
  dxDBGrid6, dxDBCtrl6, dxTL6, dxDBTL6,
  ComCtrls, ExtCtrls;

type
  TfilterType = (ftBegin, ftSubstr, ftEnd);

function FindNode(AGrid: TCustomdxDBTreeListControl; const AFName: string; AValue: string; LocateType: TLocateType; AStartIndex: Integer; AFwd: Boolean = True): TdxTreeListNode;
function FindNodeTr(AGrid: TdxDBTreeList; const AFName: string; AValue: string; LocateType: TLocateType; AStartIndex: integer): TdxTreeListNode;
function GetDSCount(DS: TDataSet; const AFieldName: string; AValue: Variant): Integer;
function GetDSCountDistinct(DS: TDataSet; const AFieldName: string): Integer;
function GetDSStr(DS: TDataSet; const AFieldName: string): string;
function GetDSSumm(DS: TDataSet; const AFieldName: string): Extended;
function GetDSSummCurr(DS: TDataSet; const AFieldName: string; const ACondFName: string; ACondValue: Variant): Extended;
function GetMax(DS: TDataSet; const AFieldName: string): integer;
function GetMaxAbs(DS: TDataSet; const AFieldName: string): Integer;
function GetMin(DS: TDataSet; const AFieldName: string): integer;
function GetNDS(AValue, ARate: Extended): Extended;
function GetNDSOut(AValue, ARate: Extended): Extended;
function GetNDSOutEx(AValue, ARate: Extended): Extended;

function keyboardIndicator: String;

function NDSIn(AValue, ARate: Extended): Extended;
function NDSOut(AValue, ARate: Extended): Extended;
function QuotedStrEx(const S: string; AChar: Char): string;
function RestoreGridColumns(grid: TdxDBGrid; flt: String; filterType: TfilterType; regKey: String): Boolean;
function RoundToA(const AValue: Extended; const ADigit: integer): Extended;
function RoundToF(const AValue: Extended; const ADigits: Integer; AMiddle: Integer = 5): Extended;
function SalesPriceRound(APrice: Extended): Extended;
function SaveGridColumns(grid: TdxDBGrid; flt: String; filterType: TfilterType; regKey: String): Boolean;
function ShowModalRef(AParent: TWinControl; ARefType: TRefType; AViewType: TCCViewType; const ASection: string; AOnDate: TDateTime; AID: integer; AParam: Integer = 0): TModalResult;
function TreeLocate(ATree: TTreeView; AID: Integer; APID: Integer = -1; ARefreshParent: Boolean = False): Boolean;
function VarToFloat(AValue: Variant): Extended;
function VarToInt(AValue: Variant): Integer;
procedure AdjustGrid(AGrid: TCustomdxTreeListControl; ACol: TdxDBTreeListColumn);
procedure NDSCalc(Amount, PriceNDS, NDS: extended; CalcType: integer; var SummOut, SummNDS:Extended);
procedure ShowModalByClass(AParent: TBaseDlg; AClass: TBaseDlgClass; const AResName: string; AID, ASource: Integer; AGrpID: integer = 0);
procedure ShowModalWH(AParent: TWinControl; AOnDate: TDateTime; AID: integer; AMode: Integer = 0; AParam: Integer = 0; AKAID: Integer = 0);
procedure ShowWindowStyle(AHandle: HWND);

//==============================================================================================
implementation

uses
  {$IFNDEF PKG}WMat, CCMain,{$ENDIF}
  okFramelist,
  udebug, SysUtils, Registry, Math, prConst, ssBaseConst, Variants;

const
  roundScale: array[-15..15] of extended = (
    0.000000000000001, // -15
    0.00000000000001, // -14
    0.0000000000001, // -13
    0.000000000001, // -12
    0.00000000001, // -11
    0.0000000001, // -10
    0.000000001, // -9
    0.00000001, // -8
    0.0000001, // -7
    0.000001, // -6
    0.00001, // -5
    0.0001, // -4
    0.001, // -3
    0.01, // -2
    0.1, // -1
    1, // 0
    10, // 1
    100, // 2
    1000, // 3
    10000, // 4
    100000, // 5
    1000000, // 6
    10000000, // 7
    100000000, // 8
    1000000000, // 9
    10000000000, // 10
    100000000000, // 11
    1000000000000, // 12
    10000000000000, // 13
    100000000000000, // 14
    1000000000000000 // 15
  );

var
  {$IFNDEF PKG}WMatModal: TfrmCCMain = nil;{$ENDIF}
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

//==============================================================================================
function GetDSCountDistinct(DS: TDataSet; const AFieldName: string): Integer;
  var
    BM: TBookmark;
    FList: TList;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetDSCountDistinct') else _udebug := nil;{$ENDIF}

  Result := 0;
  BM := DS.GetBookmark;
  FList := TList.Create;
  DS.DisableControls;

  try
    DS.First;
    while not DS.Eof do begin
      if FList.IndexOf(Pointer(DS.FieldByName(AFieldName).AsInteger)) = -1 then begin
        FList.Add(Pointer(DS.FieldByName(AFieldName).AsInteger));
        Inc(Result);
      end;
      DS.Next;
    end;

  finally
    DS.GotoBookmark(BM);
    DS.FreeBookmark(BM);
    DS.EnableControls;
    FList.Clear;
    FList.Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetDSStr(DS: TDataSet; const AFieldName: string): string;
  var
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetDSStr') else _udebug := nil;{$ENDIF}

  Result := '';
  BM := DS.GetBookmark;
  DS.DisableControls;
  try
    DS.First;
    while not DS.Eof do begin
      Result := Result + VarToStr(DS.FieldByName(AFieldName).AsVariant) + ',';
      DS.Next;
    end;

    if Result <> '' then System.Delete(Result, Length(Result), 1);

  finally
    DS.GotoBookmark(BM);
    DS.FreeBookmark(BM);
    DS.EnableControls;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function VarToFloat(AValue: Variant): Extended;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'VarToFloat') else _udebug := nil;{$ENDIF}

  try
    if VarIsNull(AValue)
      then Result := 0.0
      else Result := AValue;
  except
    Result := 0.0;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function VarToInt(AValue: Variant): Integer;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'VarToInt') else _udebug := nil;{$ENDIF}

  try
    if VarIsNull(AValue)
      then Result := 0
      else Result := AValue;
  except
    Result := 0;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function QuotedStrEx(const S: string; AChar: Char): string;
  var
    i: Integer;
    //_udebug: Tdebug;
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'QuotedStrEx') else _udebug := nil;{$ENDIF}

  Result := '';
  for i := 1 to Length(S) do begin
    Result := Result + S[i];
    if S[i] = AChar then Result := Result + S[i];
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetDSSummCurr(DS: TDataSet; const AFieldName: string; const ACondFName: string; ACondValue: Variant): Extended;
  var
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetDSSummCurr') else _udebug := nil;{$ENDIF}

  Result := 0.0;

  BM := DS.GetBookmark;

  try
    DS.First;

    while not DS.Eof do begin
      if ACondFName <> '' then begin
        if DS.FieldByName(ACondFName).AsVariant = ACondValue
          then Result := Result + DS.FieldByName(AFieldName).AsCurrency;
      end
      else Result := Result + DS.FieldByName(AFieldName).AsCurrency;

      DS.Next;
    end;

  finally
    DS.GotoBookmark(BM);
    DS.FreeBookmark(BM);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetDSCount(DS: TDataSet; const AFieldName: string; AValue: Variant): Integer;
 var
   BM: TBookmark;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetDSCount') else _udebug := nil;{$ENDIF}

  Result := 0;

  BM := DS.GetBookmark;

  try
    DS.First;
    while not DS.Eof do begin
      if DS.FieldByName(AFieldName).AsVariant = AValue then Inc(Result);
      DS.Next;
    end;

  finally
    DS.GotoBookmark(BM);
    DS.FreeBookmark(BM);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetDSSumm(DS: TDataSet; const AFieldName: string): Extended;
 var
   BM: TBookmark;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetDSSumm') else _udebug := nil;{$ENDIF}

  Result := 0;
  BM := DS.GetBookmark;
  try
    DS.First;
    while not DS.Eof do begin
      Result := Result + DS.FieldByName(AFieldName).AsFloat;
      DS.Next;
    end;

  finally
    DS.GotoBookmark(BM);
    DS.FreeBookmark(BM);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure AdjustGrid(AGrid: TCustomdxTreeListControl; ACol: TdxDBTreeListColumn);
  var
    AStyle: Integer;
    Offset, W, i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'AdjustGrid') else _udebug := nil;{$ENDIF}

  AStyle := GetWindowLong(AGrid.Handle, GWL_STYLE);

  if AStyle and WS_VSCROLL = WS_VSCROLL
    then Offset := 19
    else Offset := 2;

  W := AGrid.Width - Offset;

  for i := 0 to AGrid.VisibleColumnCount - 1 do
    if AGrid.VisibleColumns[i] <> ACol
      then W := W - AGrid.VisibleColumns[i].Width;

  ACol.Width := W;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function FindNodeTr(AGrid: TdxDBTreeList; const AFName: string; AValue: string; LocateType: TLocateType; AStartIndex: integer): TdxTreeListNode;
  var
    FCol: TdxDBTreeListColumn;
    i, p: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

 function FindCh(ANode:TdxTreeListNode;const FCol: TdxDBTreeListColumn; AValue: string; LocateType: TLocateType):TdxTreeListNode;
   var
     i, p: integer;
 begin
   Result := nil;
   with ANode do begin
     if Count > 0 then begin
       for i := 0 to Count - 1 do begin
         p := Pos(AnsiLowerCase(AValue), AnsiLowerCase(Items[i].Values[FCol.Index]));

         case LocateType of
           ltFull:  if AnsiLowerCase(Items[i].Values[FCol.Index]) = AnsiLowerCase(AValue) then begin
                      Result := Items[i];
                      Exit;
                    end;

           ltBegin: if p = 1 then begin
                      Result := Items[i];
                      Exit;
                    end;

           ltSubstr: if p <> 0 then begin
                       Result := Items[i];
                       Exit;
                     end;
         end;

         Result := FindCh(Items[i],FCol,AValue,LocateType);

         if Result <> nil then Exit;

       end;
     end
     else Result := nil;
   end;
 end;

begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'FindNodeTr') else _udebug := nil;{$ENDIF}

  Result := nil;
  with AGrid do begin
    FCol := FindColumnByFieldName(AFName);
    if FCol = nil then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    for i := 0 to Count-1 do begin
      if Items[i].Index>AStartIndex then begin
        p := Pos(AnsiLowerCase(AValue), AnsiLowerCase(Items[i].Values[FCol.Index]));

        case LocateType of
          ltFull:
              if AnsiLowerCase(Items[i].Values[FCol.Index])=AnsiLowerCase(AValue) then begin
                Result := Items[i];
                {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
                Exit;
              end;

          ltBegin:
              if p = 1 then begin
                Result := Items[i];
                {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
                Exit;
              end;

          ltSubstr:
              if p <> 0 then begin
                Result := Items[i];
                {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
                Exit;
              end;
        end;//case

        Result := FindCh(Items[i],FCol,AValue,LocateType);

        if Result <> nil then begin
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;
      end;//if
    end; // for
  end; // with

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function InternalTreeLocate(ATree: TTreeView; ANode: TTreeNode; AID: Integer; APID: Integer = -1; ARefreshParent: Boolean = False): Boolean;

 procedure ExpandToParent(ANode: TTreeNode);
 begin
   if not ANode.Parent.Expanded then begin
     ANode.Parent.Expand(False);
     ExpandToParent(ANode.Parent);
   end;
 end;

 function LocateNode(AValue: integer): boolean;
   var
     i: Integer;
 begin
   Result := False;
   for i := 0 to ATree.Items.Count - 1 do begin
     if (ATree.Items[i].Text <> EmptyStr) and (Integer(ATree.Items[i].Data) = AValue) then begin
       ExpandToParent(ATree.Items[i]);
       ATree.Selected := ATree.Items[i];
       Result := True;
       Exit;
     end
     else if (ATree.Items[i].Text <> EmptyStr) and (Integer(ATree.Items[i].Data) = APID) and ARefreshParent
          then ATree.Items[i].Expand(False);
   end;
 end;

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'InternalTreeLocate') else _udebug := nil;{$ENDIF}

  Result := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TreeLocate(ATree: TTreeView; AID: Integer; APID: Integer = -1; ARefreshParent: Boolean = False): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TreeLocate') else _udebug := nil;{$ENDIF}

  Result := InternalTreeLocate(ATree, nil, AID, APID, ARefreshParent);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function SalesPriceRound(APrice: Extended): Extended;
  var
    f,i: Extended;
begin
  if RPType = rpNone then begin
    Result := APrice;
    Exit;
  end;
  
  i := int(APrice);
  f := Frac(APrice);

  case RPType of
    rpHigh:
      begin
        if PriceRoundInt > 0 then begin
          if f > 0.0 then i := i + 1;
          f := 0.0;
          i := RoundToF(i, PriceRoundInt, 0);
        end
        else f := RoundToF(f, -PriceRoundFrac, 0); // mandatory scale up
      end;

    rpLow:
      begin
        if PriceRoundInt > 0 then begin
          f := 0.0;
          i := RoundToF(i, PriceRoundInt, 10);
        end
        else f := RoundToF(f, -PriceRoundFrac, 10); // mandatory scale down
      end;
  end;

  Result := i + f;
end;

//==============================================================================================
{* if AFracDigits set and ADigits > 0 then rounds int and frac part separately (Adigits is for int part, then)
}
function RoundToF(const AValue: Extended; const ADigits: Integer; AMiddle: Integer = 5): Extended;
  var ScaledPart, Temp : Extended;
begin
  ScaledPart := AValue / roundScale[Adigits];
  Temp := frac(ScaledPart) * 10; // last digit to be rounded
  ScaledPart := Int(ScaledPart);
  if (ADigits > 0) and (ScaledPart = 0.0) then begin // int part scaling underflow
    Result := AValue;
    Exit;
  end;

  if Abs(Temp) >= AMiddle then ScaledPart := ScaledPart + Sign(ScaledPart);

  Result := ScaledPart * roundScale[Adigits];
end;

//==============================================================================================
function RoundToA(const AValue: Extended; const ADigit: integer): Extended;
  (*var
     ScaledPart, Temp : Extended;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'RoundToA') else _udebug := nil;{$ENDIF}

  Result := roundToF(AValue, ADigit, 5);
  {ScaledPart := AValue / Exp(ADigit * Ln(10));
  Temp := Frac(ScaledPart);
  ScaledPart := Int(ScaledPart);
  if Temp >= 0.499 then ScaledPart := ScaledPart + 1;
  if Temp <= -0.499 then ScaledPart := ScaledPart - 1;
  Result := RoundTo(ScaledPart * Exp(ADigit * Ln(10)), ADigit);
  }
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetNDS(AValue, ARate: Extended): Extended;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetNDS') else _udebug := nil;{$ENDIF}

  Result := (AValue / 100) * ARate;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetNDSOutEx(AValue, ARate: Extended): Extended;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetNDSOutEx') else _udebug := nil;{$ENDIF}

  try
    Result := AValue / (100 + ARate) * ARate
  except
    Result := 0;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetNDSOut(AValue, ARate: Extended): Extended;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetNDSOut') else _udebug := nil;{$ENDIF}

  try
    Result := AValue * 100 / (100 + ARate);
  except
    Result := 0;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function NDSIn(AValue, ARate: Extended): Extended;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'NDSIn') else _udebug := nil;{$ENDIF}

  try
    Result := (AValue / 100) * (100 + ARate);
  except
    Result := 0;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function NDSOut(AValue, ARate: Extended): Extended;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'NDSOut') else _udebug := nil;{$ENDIF}

  try
    Result := AValue/(1+ARate/100);
  except
    Result := 0;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function FindNode(AGrid: TCustomdxDBTreeListControl; const AFName: string; AValue: string; LocateType: TLocateType; AStartIndex: Integer; AFwd: Boolean = True): TdxTreeListNode;

 var
  FCol: TdxDBTreeListColumn;
  i, p: integer;

  function Exec(AItem: TdxTreeListNode): TdxTreeListNode;
  begin
    Result := nil;
    p := Pos(AnsiLowerCase(AValue), Trim(AnsiLowerCase(VarToStr(AItem.Values[FCol.Index]))));
    case LocateType of
      ltFull:
        if AnsiLowerCase(VarToStr(AItem.Values[FCol.Index])) = AnsiLowerCase(AValue)
        then begin
          Result := AItem;
          Exit;
        end;

      ltBegin:
        if p = 1 then begin
          Result := AItem;
          Exit;
        end;

     ltSubstr:
       if p <> 0 then begin
         Result := AItem;
         Exit;
       end;
    end;
  end;

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'FindNode') else _udebug := nil;{$ENDIF}

  try //finally
    Result := nil;
    with AGrid do begin
      FCol := FindColumnByFieldName(AFName);
      if FCol = nil then Exit;

      if AFwd then for i := AStartIndex + 1 to Count - 1 do begin
        Result := Exec(Items[i]);
        if Result <> nil then Exit;
      end
      else if AStartIndex > 0 then
        for i := AStartIndex - 1 downto 0 do begin
          Result := Exec(Items[i]);
          if Result <> nil then Exit;
        end;
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function GetMax(DS: TDataSet; const AFieldName: string): integer;
 var
   BM: TBookmark;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetMax') else _udebug := nil;{$ENDIF}

  Result := 0;
  BM := DS.GetBookmark;
  try
    DS.First;
    while not DS.Eof do begin
      if DS.FieldByName(AFieldName).AsInteger>Result then Result := DS.FieldByName(AFieldName).AsInteger;
      DS.Next;
    end;
    DS.GotoBookmark(BM);

  finally
    DS.FreeBookmark(BM);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetMaxAbs(DS: TDataSet; const AFieldName: string): Integer;
 var
   BM: TBookmark;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetMaxAbs') else _udebug := nil;{$ENDIF}

  Result := 0;
  BM := DS.GetBookmark;

  try
    DS.First;
    while not DS.Eof do begin
      if Abs(DS.FieldByName(AFieldName).AsInteger) > Result
        then Result := Abs(DS.FieldByName(AFieldName).AsInteger);
      DS.Next;
    end;
    DS.GotoBookmark(BM);

  finally
    DS.FreeBookmark(BM);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetMin(DS: TDataSet; const AFieldName: string): integer;
 var
   BM: TBookmark;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetMin') else _udebug := nil;{$ENDIF}

  Result := 0;
  BM := DS.GetBookmark;
  try
    DS.First;
    while not DS.Eof do begin
      if DS.FieldByName(AFieldName).AsInteger>Result then Result := DS.FieldByName(AFieldName).AsInteger;
      DS.Next;
    end;
    DS.GotoBookmark(BM);

  finally
    DS.FreeBookmark(BM);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure ShowWindowStyle(AHandle: HWND);
  var
    AStyle: integer;
    Res: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ShowWindowStyle') else _udebug := nil;{$ENDIF}

  Res := '';
  AStyle := GetWindowLong(AHandle, GWL_STYLE);

  if AStyle > 0 then begin
    if AStyle and WS_BORDER = WS_BORDER then Res := Res+'WS_BORDER, ';
    if AStyle and WS_CAPTION = WS_CAPTION then Res := Res+'WS_CAPTION, ';
    if AStyle and WS_CHILD = WS_CHILD then Res := Res+'WS_CHILD, ';
    if AStyle and WS_CHILDWINDOW = WS_CHILDWINDOW then Res := Res+'WS_CHILDWINDOW, ';
    if AStyle and WS_CLIPCHILDREN = WS_CLIPCHILDREN then Res := Res+'WS_CLIPCHILDREN, ';
    if AStyle and WS_CLIPSIBLINGS = WS_CLIPSIBLINGS then Res := Res+'WS_CLIPSIBLINGS, ';
    if AStyle and WS_DISABLED = WS_DISABLED then Res := Res+'WS_DISABLED, ';
    if AStyle and WS_DLGFRAME = WS_DLGFRAME then Res := Res+'WS_DLGFRAME, ';
    if AStyle and WS_GROUP = WS_GROUP then Res := Res+'WS_GROUP, ';
    if AStyle and WS_HSCROLL = WS_HSCROLL then Res := Res+'WS_HSCROLL, ';
    if AStyle and WS_ICONIC = WS_ICONIC then Res := Res+'WS_ICONIC, ';
    if AStyle and WS_MAXIMIZE = WS_MAXIMIZE then Res := Res+'WS_MAXIMIZE, ';
    if AStyle and WS_MAXIMIZEBOX = WS_MAXIMIZEBOX then Res := Res+'WS_MAXIMIZEBOX, ';
    if AStyle and WS_MINIMIZE = WS_MINIMIZE then Res := Res+'WS_MINIMIZE, ';
    if AStyle and WS_MINIMIZEBOX = WS_MINIMIZEBOX then Res := Res+'WS_MINIMIZEBOX, ';
    if AStyle and WS_OVERLAPPED = WS_OVERLAPPED then Res := Res+'WS_OVERLAPPED, ';
    if AStyle and WS_OVERLAPPEDWINDOW = WS_OVERLAPPEDWINDOW then Res := Res+'WS_OVERLAPPEDWINDOW, ';
    if AStyle and WS_POPUP = WS_POPUP then Res := Res+'WS_POPUP, ';
    if AStyle and WS_POPUPWINDOW = WS_POPUPWINDOW then Res := Res+'WS_POPUPWINDOW, ';
    if AStyle and WS_SIZEBOX = WS_SIZEBOX then Res := Res+'WS_SIZEBOX, ';
    if AStyle and WS_SYSMENU = WS_SYSMENU then Res := Res+'WS_SYSMENU, ';
    if AStyle and WS_TABSTOP = WS_TABSTOP then Res := Res+'WS_TABSTOP, ';
    if AStyle and WS_THICKFRAME = WS_THICKFRAME then Res := Res+'WS_THICKFRAME, ';
    if AStyle and WS_TILED = WS_TILED then Res := Res+'WS_TILED, ';
    if AStyle and WS_TILEDWINDOW = WS_TILEDWINDOW then Res := Res+'WS_TILEDWINDOW, ';
    if AStyle and WS_VISIBLE = WS_VISIBLE then Res := Res+'WS_VISIBLE, ';
    if AStyle and WS_VSCROLL = WS_VSCROLL then Res := Res+'WS_VSCROLL, ';
  end;

  AStyle := GetWindowLong(AHandle, GWL_EXSTYLE);
  if AStyle and WS_EX_RIGHTSCROLLBAR = WS_EX_RIGHTSCROLLBAR then Res := Res + 'WS_EX_RIGHTSCROLLBAR, ';
  ShowMessage(Res);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure ShowModalWH(AParent: TWinControl; AOnDate: TDateTime;
                      AID: integer; AMode: Integer = 0; AParam: Integer = 0;
                      AKAID: Integer = 0);

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ShowModalWH') else _udebug := nil;{$ENDIF}

  with TfrmCCMainClass.Create(nil, rtWMat, 'TfmWMat') do
  try
    ParentHandle := AParent.Handle;
    WindowState := wsNormal;
    OnDate := AOnDate;
    Param := AParam;
    ViewType := vtWMat;
    TfmWMat(FrameList.FcurrFrame).FMode := AMode;

    if AMode > 1 then TfmWMat(FrameList.FcurrFrame).DocInfo := TokAddDocInfo(Pointer(AKAID)^);

    if AKAID > 0 then
      with TfmWMat(FrameList.FcurrFrame) do begin
        aShowFilter.Checked := True;
        aShowFilter.Enabled := False;
        lcbKAgentPropertiesInitPopup(lcbKAgent);

        if AMode = 6
          then lcbKAgent.KeyValue := TokAddDocInfo(Pointer(AKAID)^).KAID
          else lcbKAgent.KeyValue := AKAID;

        lcbKAgent.Enabled := False;
        lKAgent.Enabled := False;
        btnKagent.Enabled := False;
      end;

    if AID <> 0 then ID := AID;

    FrameList.FcurrFrame.DoShow;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function ShowModalRef(AParent: TWinControl; ARefType: TRefType; AViewType: TCCViewType;
                      const ASection: string; AOnDate: TDateTime; AID: integer; AParam: Integer = 0): TModalResult;
  var
    FCCForm: TfrmCCMain;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ShowModalRef') else _udebug := nil;{$ENDIF}

  Result := mrNone;
  {if ARefType = rtWMat then begin
    if WMatModal = nil then WMatModal := TfrmCCMainClass.Create(nil, ARefType, ASection);
    FCCForm := WMatModal;
  end
  else} FCCForm := TfrmCCMainClass.Create(nil, ARefType, ASection);
  //FCCForm := TfrmCCMainClass.Create(nil);

  with FCCForm do
    try
      ParentHandle := AParent.Handle;
      WindowState := wsNormal;
      OnDate := AOnDate;
      Param := AParam;
      ViewType := AViewType;
      Param := AParam;

      if AID <> 0 then ID := AID;

      Result := ShowModal;

    finally
      {if ARefType = rtWMat
        then WMatModal.Hide
        else} Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure ShowModalByClass(AParent: TBaseDlg; AClass: TBaseDlgClass; const AResName: string; AID, ASource: Integer; AGrpID: integer = 0);
 var
   EdForm: TBaseDlg;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ShowModalByClass') else _udebug := nil;{$ENDIF}

  EdForm := AClass.Create(nil);
  with EdForm do
    try
       GrpID := AGrpID;
       ID := AID;
       MainHandle := AParent.Handle;
       ParentNameEx := AResName;
       OnDate := AParent.OnDate;
       SourceID := ASource;
       ShowModal;
    finally
       Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure NDSCalc(Amount, PriceNDS, NDS: Extended; CalcType: Integer; var SummOut, SummNDS: Extended);
  var
    PriceOut: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'NDSCalc') else _udebug := nil;{$ENDIF}

  PriceOut := RoundToA(NDSOut(PriceNDS, NDS), -10);

  case CalcType of
    0:
      begin
        SummOut := RoundToA(Amount * PriceOut, -10);
        SummNDS := RoundToA((SummOut / 100) * NDS, -10);
      end;

    1:
      begin
        SummOut := RoundToA((PriceOut * (NDS / 100 + 1)) * Amount, -10);
        SummNDS := RoundToA(SummOut / (NDS + 100) * NDS, -10);
        SummOut := SummOut - SummNDS;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function SaveGridColumns(grid: TdxDBGrid; flt: String; filterType: TfilterType; regKey: String): Boolean;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'SaveGridColumns') else _udebug := nil;{$ENDIF}

  Result := True;
  try
    with grid do begin
      for i := 0 to ColumnCount - 1 do
        if Pos(flt, Columns[i].Name) = 1 then begin
          WriteToRegInt(regKey + '\' + Columns[i].Name, 'Width', Columns[i].Width);
          WriteToRegInt(regKey + '\' + Columns[i].Name, 'Index', Columns[i].Index);
          WriteToRegInt(regKey + '\' + Columns[i].Name, 'Visible', Integer(Columns[i].Visible));
        end;
    end;

  except
    Result := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function RestoreGridColumns(grid: TdxDBGrid; flt: String; filterType: TfilterType; regKey: String): Boolean;
  var
    i,v: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'RestoreGridColumns') else _udebug := nil;{$ENDIF}

  Result := True;
  try
    with grid do begin
      for i := 0 to ColumnCount - 1 do
        if Pos(flt, Columns[i].Name) = 1 then begin
          if ReadFromRegInt(regKey + '\' + Columns[i].Name, 'Width', v) and (v > 200) and (v < 3000) // :) reasonable min
            then Columns[i].Width := v;

          if ReadFromRegInt(regKey + '\' + Columns[i].Name, 'Index', v) and (v > 0) and (v < ColumnCount)
            then Columns[i].Index := v;

          if ReadFromRegInt(regKey + '\' + Columns[i].Name, 'Visible', v) and ((v = 0) or (v = 1))
            then Columns[i].Visible := (v = 1)
            else Columns[i].Visible := True;
        end;
    end;

  except
    Result := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function keyboardIndicator: String;
  var
    kl: word;
begin
  kl := GetKeyboardLayout(0) mod $100;
  case kl of
    $36: Result := 'AF';
    $1c: Result := 'AL';
    $01: Result := 'AR';
    $2C: Result := 'AZ';
    $2d: Result := 'BA';
    $23: Result := 'BE';
    $02: Result := 'BU';
    $03: Result := 'CA';
    $04: Result := 'CH';
    $1a: Result := 'CR';
    $05: Result := 'CZ';
    $06: Result := 'DA';
    $13: Result := 'DU';
    $09: Result := 'EN';
    $25: Result := 'ES';
    $38: Result := 'FA';
    $29: Result := 'FA';
    $0b: Result := 'FI';
    $0c: Result := 'FR';
    $07: Result := 'GE';
    $08: Result := 'GR';
    $0d: Result := 'HE';
    $0e: Result := 'HU';
    $0f: Result := 'IC';
    $21: Result := 'IN';
    $10: Result := 'IT';
    $11: Result := 'JA';
    $12: Result := 'KO';
    $26: Result := 'LA';
    $27: Result := 'LI';
    $14: Result := 'NO';
    $15: Result := 'PO';
    $16: Result := 'PO';
    $18: Result := 'RO';
    $19: Result := 'RU';
    $1b: Result := 'SL';
    $24: Result := 'SL';
    $0a: Result := 'SP';
    $1d: Result := 'SW';
    $1e: Result := 'TH';
    $1f: Result := 'TU';
    $22: Result := 'UK';
    $2a: Result := 'VI';
//$422: Result := 'UA';
//$419: Result := 'RU';
//$409: Result := 'EN';
    else
      Result := '??';
  end;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ssFun', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
