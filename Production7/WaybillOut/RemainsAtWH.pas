{$I ok_sklad.inc}
unit RemainsAtWH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner6, dxEditor6, StdCtrls,
  ActnList, ssBaseTypes, ssFormStorage, cxCheckBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, ssBaseDlg,
  ssBevel, ImgList, ssSpeedButton, ssPanel, ssGradientPanel, xButton, dxTL6,
  dxDBCtrl6, dxDBGrid6, ssDBGrid, DB, DBClient, ssClientDataSet,
  prTypes, TB2Item, Menus;

type
  TfrmRemainsAtWH = class(TBaseDlg)
    aSelectWH: TAction;
    btnMove: TssSpeedButton;
    bvlMain: TssBevel;
    cdsRsv_Temp: TssClientDataSet;
    cdsWHouse: TssClientDataSet;
    cdsWHouseNAME: TStringField;
    cdsWHouseREMAIN: TFloatField;
    cdsWHousereserved: TFloatField;
    cdsWHouseRSV: TFloatField;
    cdsWHouseWID: TIntegerField;
    pmMain: TTBPopupMenu;
    srcWHouse: TDataSource;
    TBItem19: TTBItem;
    grdWHouse: TssDBGrid;
    colWID: TdxDBGridColumn;
    colWName: TdxDBGridColumn;
    colWRemain: TdxDBGridColumn;
    colWFree: TdxDBGridColumn;
    colWReserved: TdxDBGridColumn;
    panEmpty: TPanel;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aSelectWHExecute(Sender: TObject);
    procedure btnMoveClick(Sender: TObject);
    procedure cdsWHouseBeforeOpen(DataSet: TDataSet);
    procedure cdsWHouseCalcFields(DataSet: TDataSet);
    procedure colWFreeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colWRemainGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colWReservedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure DataModified(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure grdWHouseCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdWHouseDblClick(Sender: TObject);
    procedure grdWHouseKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;

  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
  end;

var
  frmRemainsAtWH: TfrmRemainsAtWH;

implementation

uses
  ssBaseConst, prConst, ClientData, prFun,
  ssCallbackConst, xLngManager, ssDateUtils, ssFun, MatMove, udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmRemainsAtWH.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmRemainsAtWH.setid') else _udebug := nil;{$ENDIF}

  FID := Value;
  DSRefresh(cdsWHouse, 'wid', 0);
  panEmpty.Visible := cdsWHouse.IsEmpty;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRemainsAtWH.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmRemainsAtWH.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK] then SendMessage(MainHandle, WM_REFRESH, cdsWHouse.FieldByName('wid').AsInteger, Integer(-20));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRemainsAtWH.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRemainsAtWH.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := (grdWHouse.Count > 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRemainsAtWH.DataModified(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRemainsAtWH.DataModified') else _udebug := nil;{$ENDIF}

  FModified:=True;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRemainsAtWH.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRemainsAtWH.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with dmData.Lng do begin
    Self.Caption := GetRS('fmWMat', 'MatsAtWH');
    aOk.Caption := GetRS('Common', 'Select');

    btnMove.Hint := GetRS('fmWMat', 'MoveInfoEx');
    panEmpty.Caption := GetRS('fmWMat', 'NoMatAtWH');
    aSelectWH.Caption := GetRS('fmWMat', 'SelectWH');

    colWName.Caption := GetRS('fmWMat', 'Title');
    colWRemain.Caption := GetRS('fmWMat', 'AllRemain');
    colWFree.Caption := GetRS('fmWMat', 'Free');
    colWReserved.Caption := GetRS('fmWMat', 'Reserved');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRemainsAtWH.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRemainsAtWH.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRemainsAtWH.cdsWHouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRemainsAtWH.cdsWHouseBeforeOpen') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsRsv_Temp, 'posid', 0);

  with (DataSet as TssClientDataSet).Params do begin
    ParamByName('matid').AsInteger := FID;
    ParamByName('ondate').AsDateTime := LastSecondInDay(Self.OnDate);
    ParamByName('wh').AsString := AllowedWH;
    ParamByName('wid').AsInteger := 0;
    ParamByName('kaid').AsInteger := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRemainsAtWH.cdsWHouseCalcFields(DataSet: TDataSet);
  var
    FRsv: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRemainsAtWH.cdsWHouseCalcFields') else _udebug := nil;{$ENDIF}

  FRsv := DataSet.FieldByName('Rsv').AsFloat;

  with cdsRsv_Temp do
    if Active then begin
      First;
      while not Eof do begin
        if ((FieldByName('visible').AsInteger = 1)
            or
            ((FieldByName('visible').AsInteger = 0) and (fieldbyname('addr').AsInteger = ServerAddr)))
           and
           (FieldByname('wid').AsInteger = cdsWHouse.FieldByName('wid').AsInteger) and (FieldByname('matid').AsInteger = FID)
        then FRsv := FRsv + fieldbyname('amount').asFloat;
        Next;
      end;
    end;

  DataSet.FieldByName('reserved').AsFloat := FRsv;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRemainsAtWH.colWRemainGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRemainsAtWH.colWRemainGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, RoundToA(StrToFloat(AText), MatDisplayDigits));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRemainsAtWH.colWFreeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRemainsAtWH.colWFreeGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, RoundToA(ANode.Values[colWRemain.Index] -
      ANode.Values[colWReserved.Index], MatDisplayDigits));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRemainsAtWH.colWReservedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  var
    FRsv: Extended;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRemainsAtWH.colWReservedGetText') else _udebug := nil;{$ENDIF}

  try
    FRsv := ANode.Values[colWReserved.Index];
  except
    FRsv := 0;
  end;

  AText := FormatFloat(MatDisplayFormat, RoundToA(FRsv, MatDisplayDigits));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRemainsAtWH.grdWHouseCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRemainsAtWH.grdWHouseCustomDrawCell') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  if (ANode.Values[colWReserved.Index] > 0) and (AColumn = colWReserved)
    then AFont.Color := clRed;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRemainsAtWH.grdWHouseDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRemainsAtWH.grdWHouseDblClick') else _udebug := nil;{$ENDIF}

  if grdWHouse.Count > 0 then aOK.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRemainsAtWH.grdWHouseKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRemainsAtWH.grdWHouseKeyDown') else _udebug := nil;{$ENDIF}

  if Key = 13 then begin
    Key := 0;
    grdWHouseDblClick(grdWHouse);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRemainsAtWH.btnMoveClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRemainsAtWH.btnMoveClick') else _udebug := nil;{$ENDIF}

  if grdWHouse.Count = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatMove.Create(nil) do
  try
    ParentNameEx := 'fmWMat';
    OnDate := Self.OnDate;
    WID := cdsWHouse.FieldByName('wid').AsInteger;
    ID := FID;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRemainsAtWH.aSelectWHExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRemainsAtWH.aSelectWHExecute') else _udebug := nil;{$ENDIF}

  grdWHouseDblClick(grdWHouse);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('RemainsAtWH', @Debugging, DEBUG_group_ID);
  {$ENDIF}

finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
