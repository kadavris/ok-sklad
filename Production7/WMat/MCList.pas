{$I ok_sklad.inc}
unit MCList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseIntfDlg, ActnList, ImgList, xButton, ssSpeedButton,
  ssPanel, ExtCtrls, ssGradientPanel, ssFormStorage, dxTL6, dxDBCtrl6,
  dxDBGrid6, dxCntner6, ssBaseDlg, TB2Item, Menus, cxControls, cxContainer,
  cxEdit, cxTextEdit, ssLabel, StdCtrls, okSearchEdit, 
  prTypes, ssBevel, ssBaseConst, DB, ssMemDS, DBClient, ssClientDataSet;

type
  TfrmMCList = class(TBaseDlg)
    aMatInfo: TAction;
    aMatMove: TAction;
    aMatRsv: TAction;
    btnMatInfo: TssSpeedButton;
    btnMatMove: TssSpeedButton;
    btnMatRsv: TssSpeedButton;
    cdsMC: TssClientDataSet;
    cdsMCARTIKUL: TStringField;
    cdsMCCURRDATE: TDateTimeField;
    cdsMCCURRID: TIntegerField;
    cdsMCID: TIntegerField;
    cdsMCMSRNAME: TStringField;
    cdsMCNAME: TStringField;
    cdsMCONVALUE: TFloatField;
    cdsMCPRICE: TFloatField;
    cdsMCREMAIN: TFloatField;
    cdsMCreserved: TFloatField;
    cdsMCRSV: TFloatField;
    cdsMCSHORTNAME: TStringField;
    cdsRsv_Temp: TssClientDataSet;
    colArtikul: TdxDBGridColumn;
    colFree: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colMeasure: TdxDBGridColumn;
    colName: TdxDBGridColumn;
    colNo: TdxDBGridColumn;
    colPrice: TdxDBGridColumn;
    colRemain: TdxDBGridColumn;
    colReserved: TdxDBGridColumn;
    colShortName: TdxDBGridColumn;
    edMat: TokMatSearchEdit;
    grdMain: TdxDBGrid;
    panEmpty: TPanel;
    panFilter: TPanel;
    pmDet: TTBPopupMenu;
    srcMC: TDataSource;
    TBItem10: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aMatInfoExecute(Sender: TObject);
    procedure aMatMoveExecute(Sender: TObject);
    procedure aMatRsvExecute(Sender: TObject);
    procedure cdsMCBeforeOpen(DataSet: TDataSet);
    procedure cdsMCCalcFields(DataSet: TDataSet);
    procedure colFreeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colReservedCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure edMatChange(Sender: TObject);
    procedure edMatRefButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    FCanModify: Boolean;
    FID: Integer;

    procedure SetCanModify(const Value: Boolean);
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
  public
    CheckRemain: Boolean;

    procedure SetCaptions; override;
    procedure SetID(const Value: Integer); override;

    //property ID: Integer read FID write SetID;
    property CanModify: Boolean read FCanModify write SetCanModify;
  end;

var
  frmMCList: TfrmMCList;

implementation

uses
  prConst, EditMaterials, MatMove, MatRsv, prFun, ssFun, xLngManager, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmMCList.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.SetCaptions') else _udebug := nil;{$ENDIF}


  inherited;

  with LangMan do begin
    aOk.Caption := GetRS('Common', 'Select');
    Self.Caption := GetRS('fmWMat', 'MCListFor');

    colName.Caption := GetRS('fmMaterials', 'MCName');
    colPrice.Caption := GetRS('fmWMat', 'LastInPrice');
    colRemain.Caption := GetRS('fmWMat', 'AllRemain');
    colFree.Caption := GetRS('fmWMat', 'Free');
    colReserved.Caption := GetRS('fmWMat', 'Reserved');
    colMeasure.Caption := GetRS('fmWMat', 'Measure');

    aMatRsv.Caption := GetRS('fmWaybill', 'RsvInfo');
    aMatMove.Caption := GetRS('fmWaybill', 'MoveInfo');
    aMatInfo.Caption := GetRS('fmWaybill', 'MatInfo');
    btnMatRsv.Hint := GetRS('fmWaybill', 'RsvInfo');
    btnMatMove.Hint := GetRS('fmWaybill', 'MoveInfo');
    btnMatInfo.Hint := GetRS('fmWaybill', 'MatInfo');

    panEmpty.Caption := GetRS('fmWMat', 'MCNotDefine');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.grdMainDblClick') else _udebug := nil;{$ENDIF}


  if CanModify or not CheckRemain then aOK.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.ActionListUpdate') else _udebug := nil;{$ENDIF}


  aOk.Enabled := (grdMain.Count > 0) and
    (not VarIsNull(grdMain.FocusedNode.Values[colRemain.Index]) or not CheckRemain);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.grdMainKeyDown') else _udebug := nil;{$ENDIF}


  if Key = 13 then aOk.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.grdMainCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}


  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex)
    then AColor := GridOddLinesColor;
  try
    if VarIsNull(ANode.Values[colRemain.Index]) or (ANode.Values[colRemain.Index] = 0)
      then if not ASelected then AFont.Color := clBtnShadow;
  except
    AFont.Color := clBtnShadow;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.colNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.colNameGetText') else _udebug := nil;{$ENDIF}


  AText := ' ' + AText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.colPriceGetText') else _udebug := nil;{$ENDIF}


  if AText <> EmptyStr then begin
    AText := AText + ' ' + VarToStr(ANode.Values[colShortName.Index]);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.colReservedCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.colReservedCustomDrawCell') else _udebug := nil;{$ENDIF}


  try
    if (AText <> EmptyStr) and (StrToFloat(AText) <> 0)
      then AFont.Color := clRed;
  except
  end;  

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.aMatInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.aMatInfoExecute') else _udebug := nil;{$ENDIF}


  if grdMain.Count = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := Self.grdMain.FocusedNode.Values[Self.colID.Index];
      CanModify := False;
      ShowModal;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.aMatMoveExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.aMatMoveExecute') else _udebug := nil;{$ENDIF}


  if grdMain.Count = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatMove.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Self.OnDate;
      WID := 0; //cbWHouse.KeyValue;
      ID := Self.grdMain.FocusedNode.Values[Self.colID.Index];
      ShowModal;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.aMatRsvExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.aMatRsvExecute') else _udebug := nil;{$ENDIF}


  if grdMain.Count = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatRsv.Create(nil) do
    try
     ParentNameEx := 'fmWMat';
     OnDate := Self.OnDate;
     WID := 0;
     ID := Self.grdMain.FocusedNode.Values[Self.colID.Index];
     ShowModal;
   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.colNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.colNoGetText') else _udebug := nil;{$ENDIF}


  AText := IntToStr(ANode.AbsoluteIndex + 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.WMLayoutChanged') else _udebug := nil;{$ENDIF}


  edMat.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.edMatRefButtonClick(Sender: TObject);
 var
   aid: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.edMatRefButtonClick') else _udebug := nil;{$ENDIF}


  try
    aid := edMat.MatID;
  except
    aid := 0;
  end;
  edMat.Editor.SetFocus;
  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.WMRefresh') else _udebug := nil;{$ENDIF}


  case TRefType(M.LParam) of
    rtMat:
      begin
        edMat.MatID := M.WParam;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.FormShow') else _udebug := nil;{$ENDIF}


  inherited;

  if edMat.Enabled then edMat.Editor.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.SetID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmMCList.SetID') else _udebug := nil;{$ENDIF}


  FID := Value;
  edMat.MatID := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmMCList.FormCreate') else _udebug := nil;{$ENDIF}


  inherited;
  
  FCanModify := True;
  edMat.LoadFromRegistry(MainRegKey + '\' + Self.Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.FormDestroy') else _udebug := nil;{$ENDIF}


  edMat.SaveToRegistry(MainRegKey + '\' + Self.Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.edMatChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.edMatChange') else _udebug := nil;{$ENDIF}


  DSRefresh(cdsMC, 'id', 0);
  panEmpty.Visible := cdsMC.IsEmpty;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.cdsMCBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.cdsMCBeforeOpen') else _udebug := nil;{$ENDIF}


  cdsMC.Params.ParamByName('matid').AsInteger := edMat.MatID;
  cdsMC.Params.ParamByName('ondate').AsDateTime := Self.OnDate;
  DSRefresh(cdsRsv_Temp, 'posid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.cdsMCCalcFields(DataSet: TDataSet);
 var
   FRsv: Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.cdsMCCalcFields') else _udebug := nil;{$ENDIF}


  FRsv := DataSet.FieldByName('rsv').AsFloat;
  with cdsRsv_Temp do
    if Active then begin
      First;
      while not Eof do begin
        if ((FieldByName('visible').AsInteger = 1) or
           ((FieldByName('visible').AsInteger = 0) and
            (fieldbyname('addr').AsInteger = ServerAddr))) and
           (FieldByName('matid').AsInteger = DataSet.FieldByName('id').AsInteger)
          then FRsv := FRsv + FieldByName('amount').AsFloat;
        Next;
      end;
    end;
  DataSet.FieldByName('reserved').AsFloat := FRsv;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.colFreeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.colFreeGetText') else _udebug := nil;{$ENDIF}


  if not VarIsNull(ANode.Values[colRemain.Index])
    then AText := FormatFloat(MatDisplayFormat, RoundToA(ANode.Values[colRemain.Index] -
                  ANode.Values[colReserved.Index], MatDisplayDigits));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.SetCanModify(const Value: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.SetCanModify') else _udebug := nil;{$ENDIF}


  FCanModify := Value;
  aOk.Caption := LangMan.GetRS('Common', 'OK');
  edMat.Enabled := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMCList.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMCList.FormCloseQuery') else _udebug := nil;{$ENDIF}


  if ModalResult = mrOk then begin
    SendMessage(MainHandle, WM_REFRESH, cdsMC.FieldByName('id').AsInteger, Ord(rtMC));
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('MCList', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
