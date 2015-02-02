{$I ok_sklad.inc}
unit KAOutParty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner6, dxEditor6, StdCtrls, ssBaseConst,
  ActnList, ssBaseTypes, ssFormStorage, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, ssbaseDlg, dxTL6, dxDBCtrl6,
  dxDBGrid6, dxDBTLCl6, dxGrClms6, DB, DBClient, ssClientDataSet,
  ImgList, ssSpeedButton, ssPanel, ssGradientPanel, ssBevel, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ssDBLookupCombo, ssLabel, FR_Class, FR_DSet,
  FR_DBSet, TB2Item, Menus, dxmdaset, xButton, Grids, DBGrids, ssDBGrid;

type
  TRetOutPos = record
    PosId: integer;
    SourceId : integer;
  end;

  PRetOutPos = ^TRetOutPos;

  TfrmKAOutParty = class(TBaseDlg)
    aPrintDoc: TAction;
    aSetGridOptions: TAction;
    btnMat: TssSpeedButton;
    btnPrintDoc: TssSpeedButton;
    cdsMaterial: TssClientDataSet;
    colAmount: TdxDBGridColumn;
    colCurrName: TdxDBGridColumn;
    colDocImgIn: TdxDBGridImageColumn;
    colDocImgOut: TdxDBGridImageColumn;
    colDocNumIn: TdxDBGridColumn;
    colDocNumOut: TdxDBGridColumn;
    colInDate: TdxDBGridColumn;
    colMatImg: TdxDBGridImageColumn;
    colMatName: TdxDBGridColumn;
    colmsrname: TdxDBGridColumn;
    colOutDate: TdxDBGridColumn;
    colPosID: TdxDBGridColumn;
    colPriceOut: TdxDBGridColumn;
    colSN: TdxDBGridColumn;
    colSourceID: TdxDBGridColumn;
    dsMaterial: TDataSource;
    dsPartys: TDataSource;
    edFromDate: TcxDateEdit;
    edToDate: TcxDateEdit;
    fdsView: TfrDBDataSet;
    grdMain: TssDBGrid;
    lcbMaterial: TssDBLookupCombo;
    lFromDate: TLabel;
    lMaterial: TLabel;
    lToDate: TLabel;
    mdPartys: TdxMemData;
    mdPartysamount: TFloatField;
    mdPartyscurnamein: TStringField;
    mdPartyscurrid: TIntegerField;
    mdPartyscurridin: TIntegerField;
    mdPartyscurrnameout: TStringField;
    mdPartysdiscountout: TFloatField;
    mdPartysdocnumin: TStringField;
    mdPartysdocnumout: TStringField;
    mdPartysmatid: TIntegerField;
    mdPartysmatimg: TIntegerField;
    mdPartysmatname: TStringField;
    mdPartysmsrname: TStringField;
    mdPartysndsin: TFloatField;
    mdPartysndsout: TFloatField;
    mdPartysondatein: TDateTimeField;
    mdPartysondateout: TDateTimeField;
    mdPartysposid: TIntegerField;
    mdPartyspricein: TFloatField;
    mdPartyspriceout: TFloatField;
    mdPartysratein: TFloatField;
    mdPartysrateout: TFloatField;
    mdPartyssn: TStringField;
    mdPartyssourceid: TIntegerField;
    mdPartyswbidin: TIntegerField;
    mdPartyswbidout: TIntegerField;
    mdPartyswhnameout: TStringField;
    mdPartyswidout: TIntegerField;
    mdPartyswtypein: TIntegerField;
    mdPartyswtypeout: TIntegerField;
    panGrid: TPanel;
    pmMain: TTBPopupMenu;
    ssBevel4: TssBevel;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;

    procedure aApplyExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aOKExecute(Sender: TObject);
    procedure aPrintDocExecute(Sender: TObject);
    procedure aSetGridOptionsExecute(Sender: TObject);
    procedure btnMatClick(Sender: TObject);
    procedure btnPrintDocClick(Sender: TObject);
    procedure colCurrencyGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTypeCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure DataModified(Sender: TObject);
    procedure edFromDatePropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure grdMainColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdMainMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lcbMaterialPropertiesChange(Sender: TObject);
    procedure lcbMaterialPropertiesEditValueChanged(Sender: TObject);
    procedure lcbMaterialPropertiesInitPopup(Sender: TObject);

  private
    CanRefresh: Boolean;
    FCurrCol: TdxDBTreeListColumn;
    FCurrNode: TdxTreeListNode;
    FKAName:String;

    procedure CalcSummary;
    procedure SetGrdWidth;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
    procedure SetOnDate(const Value: TDateTime); override;

  public
    ParentHandle: HWND;
    WID: Integer;
    procedure SetCaptions; override;
  end;

var
  frmKAOutParty: TfrmKAOutParty;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ClientData, prFun, ssFun, ssRegUtils, DateUtils,
  ssDateUtils, prTypes, prRep, ssBaseIntfDlg, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}
//==============================================================================================
procedure TfrmKAOutParty.setid(const Value: integer);
 var
   m: String;
   tmpInt: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmKAOutParty.setid') else _udebug := nil;{$ENDIF}

  CanRefresh := false;
  Fid := Value;

  with newDataSet do
  try
    Screen.Cursor := crSQLWait;
    m := '';

    if lcbMaterial.KeyValue <> lcbMaterial.EmptyValue then m := m + ' and mats.matid=' + IntToStr(lcbMaterial.KeyValue);

    ProviderName := 'pRetOutPartyByKA';

    FetchParams;
    Params.ParamByName('kaid').AsInteger := FID;
    FetchMacros;
    Macros.ParamByName('m').AsString := m;

    if edFromDate.EditText = ''
      then Params.ParamByName('fromdate').AsDateTime := MinDateTime
      else Params.ParamByName('fromdate').AsDateTime := edFromDate.Date;

    if (edToDate.EditText = '') or (edToDate.Date = 0)
      then Params.ParamByName('todate').AsDateTime := MaxDateTime
      else Params.ParamByName('todate').AsDateTime := LastSecondInDay(edToDate.Date);

    Open;
    mdPartys.CopyFromDataSet(Fields[0].DataSet);
    Close;

    FKAName := KAName(dmData.SConnection,FID, tmpInt);
    Self.Caption := rs('fmWaybill', 'PartyOuts') + ':  ' + FKAName;

  finally
    Free;
    Screen.Cursor := crDefault;
    CanRefresh := True;
  end;

  SetGrdWidth;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: Boolean;
    RetPos: TRetOutPos;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult = mrOk then begin
    mdPartys.Locate('posid;sourceid', VarArrayOf([
      grdMain.FocusedNode.Values[colPosID.Index],
      grdMain.FocusedNode.Values[colSourceID.Index]]), []);

    RetPos.PosId := mdPartys.FieldByName('posid').AsInteger;
    RetPos.SourceId := mdPartys.FieldByName('sourceid').AsInteger;

    SendMessage(ParentHandle, WM_REFRESH, Integer(@RetPos), Integer(rtRetPos));
  end
  else CanClose := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := True;
  
  //panGrid.Visible := mdPartys.IsEmpty;
  //grdMain.Visible := not mdPartys.IsEmpty;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.aApplyExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.aApplyExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrYes;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.aOKExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.aOKExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrOK;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.aCancelExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    aOK.Caption := GetRS('Common', 'Select');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aSetGridOptions.Caption := GetRS('Common', 'ColOptions') + '...';

    lFromDate.Caption := GetRS('fmKAgent', 'From');
    lToDate.Caption := GetRS('fmKAgent', 'To');

    with grdMain do begin
      Bands[0].Caption := GetRS('fmMaterials','TitleMaterials');
      Bands[1].Caption := GetRS('fmWaybill','PartyOut');
      Bands[2].Caption := GetRS('fmWaybill','PartyOut');
    end;

    aPrintDoc.Caption := GetRS('Common', 'Print');
    btnPrintDoc.Hint := GetRS('fmWMat', 'DocPreview');

    colSN.Caption := GetRS('fmWaybill', 'SN');
    colMatName.Caption := GetRS('fmWaybill', 'Name');
    colmsrname.Caption := GetRS('fmWaybill', 'Measure');
    colDocNumOut.Caption := GetRS('fmWMat', 'Doc');
    colOutDate.Caption := GetRS('fmWaybill', 'OnDate');
    colAmount.Caption := GetRS('fmWaybill', 'Amount');
    colCurrName.Caption := GetRS('fmWaybill','Curr');
    colPriceOut.Caption := GetRS('fmWaybill', 'PriceOut');
    colDocImgIn.Caption := '';
    colMatImg.Caption := '';
    colDocImgOut.Caption := '';
    
    lcbMaterial.DisplayEmpty := GetRS('Common', 'All');
    lcbMaterial.Text := GetRS('Common', 'All');
    panGrid.Caption := GetRS('fmWaybill', 'EmptyKAOutParty');
    lMaterial.Caption := GetRS('fmWaybill', 'MatName');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.colPriceGetText') else _udebug := nil;{$ENDIF}

  AText := FormatFloat(MoneyDisplayFormat, RoundToA(StrToFloat(AText), -2));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  edToDate.Date := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.SetGrdWidth;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.SetGrdWidth') else _udebug := nil;{$ENDIF}
  AdjustGrid(grdMain, colMatName);
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmKAOutParty.FormCreate(Sender: TObject);
  var
    Temp: TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.FormCreate') else _udebug := nil;{$ENDIF}

  CanRefresh := False;

  if ReadFromRegDate(MainRegKey + '\' + Self.ClassName, 'FromDate', Temp)
    then begin
      if Temp = 0
        then edFromDate.Text := ''
        else edFromDate.Date := Temp;
    end
    else edFromDate.Text := '';

  inherited;

  grdMain.LoadFromRegistry(MainRegKey + '\' + Self.Name + '\' + grdMain.Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.FormDestroy') else _udebug := nil;{$ENDIF}

  WriteToRegDate(MainRegKey + '\' + Self.ClassName, 'FromDate', edFromDate.Date);
  grdMain.SaveToRegistry(MainRegKey + '\' + Self.Name + '\' + grdMain.Name);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.edFromDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.edFromDatePropertiesChange') else _udebug := nil;{$ENDIF}

  if CanRefresh then ID := ID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtMat: begin
      if not cdsMaterial.Active then cdsMaterial.Open;

      lcbMaterial.KeyValue := M.WParam;
      ID := ID;
    end;//rtMat
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.CalcSummary;
(*var
  i: Integer;
  FBallance: Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.CalcSummary') else _udebug := nil;{$ENDIF}

  FBallance := 0;

  with grdMain do
    for i := 0 to Count - 1 do
      case Items[i].Values[colDocType.Index] of
       1, 2, 6: FBallance := FBallance + Items[i].Values[colNPrice.Index];
       -2, -1, -6: FBallance := FBallance - Items[i].Values[colNPrice.Index]
       else FBallance := FBallance + Items[i].Values[colNPrice.Index];
      end;

  txtBallance.Caption := FormatFloat(MoneyDisplayFormat, FBallance) + ' ' + BaseCurrName;

  if FBallance < 0 then txtBallance.Font.Color := clRed
    else txtBallance.Font.Color := clMaroon;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmKAOutParty.grdMainMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
(*var
  FCol: TdxDBTreeListColumn;
  FNode: TdxTreeListNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.grdMainMouseMove') else _udebug := nil;{$ENDIF}

  FCol := grdMain.GetColumnAt(X, Y);
  FNode := grdMain.GetNodeAt(X, Y);
  if (FCol <> nil) and (FNode <> nil) then begin
    if (FCol <> FCurrCol) or (FNode <> FCurrNode) then begin
      Application.CancelHint;
      if grdMain.Canvas.TextWidth(FNode.Values[FCol.Index]) > FCol.Width
        then grdMain.Hint := FNode.Values[FCol.Index]
        else grdMain.Hint := '';
      FCurrCol := FCol;
      FCurrNode := FNode;
    end;
  end
  else begin
    grdMain.Hint := '';
    FCurrCol := nil;
    FCurrNode := nil;
    Application.CancelHint;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmKAOutParty.frDocGetValue(const ParName: String; var ParValue: Variant);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.frDocGetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'basecurrname') then ParValue := BaseCurrName else
  if 0 = AnsiCompareText(ParName, 'BaseCurrID') then ParValue := BaseCurrID else
  if 0 = AnsiCompareText(ParName, 'wname') then
    if WID = 0 then ParValue := rs('Common', 'All')
      else ParValue := FWHName else
  if 0 = AnsiCompareText(ParName, 'matname') then ParValue := FKAName else
  if 0 = AnsiCompareText(ParName, 'personname') then ParValue := mdReport.FieldByName('person').AsString else
  if 0 = AnsiCompareText(ParName, 'measure') then ParValue := FMeasureName else
  if 0 = AnsiCompareText(ParName, 'fromdate') then begin
    if edFromDate.EditText = ''
      then ParValue := '<>'
      else ParValue := edFromDate.EditText;
  end else
  if 0 = AnsiCompareText(ParName, 'todate') then begin
    if edToDate.EditText = ''
      then ParValue := '<>'
      else ParValue := edToDate.EditText;
  end else
  if 0 = AnsiCompareText(ParName, 'RECEIVED') then ParValue := FReceived else
  if 0 = AnsiCompareText(ParName, 'att') then
    if Trim(FAttNum) <> ''
      then ParValue := FAttNum + ' ' + DateToStr(FAttDate);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmKAOutParty.aPrintDocExecute(Sender: TObject);
  var
    DocId, wtype: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.aPrintDocExecute') else _udebug := nil;{$ENDIF}

  DocId := mdPartys.fieldbyname('wbidout').AsInteger;
  wtype := mdPartys.fieldbyname('wtypeout').AsInteger;
  case wtype  of
     1: xRep.ShowRep(rtWBIn, DocId);
    -1: xRep.ShowRep(rtWBOut, DocId);
     4: xRep.ShowRep(rtWBMove, DocId);
     5: xRep.ShowRep(rtWBRest, DocId);
    -5: xRep.ShowRep(rtWriteOff, DocId);
    -6: xRep.ShowRep(rtReturnOut, DocId);
     6: xRep.ShowRep(rtReturnIn, DocId);
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.btnPrintDocClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.btnPrintDocClick') else _udebug := nil;{$ENDIF}

  aPrintDoc.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.colCurrencyGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.colCurrencyGetText') else _udebug := nil;{$ENDIF}

  if AText = '' then AText := BaseCurrName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.grdMainDblClick') else _udebug := nil;{$ENDIF}

  if not mdPartys.IsEmpty then ModalResult := mrOk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.colTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
(*var
  FType: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.colTypeGetText') else _udebug := nil;{$ENDIF}

  FType := ANode.Values[colDocType.Index];
  case FType of
     2: AText := rs('Common', 'DocPayDocIn');
    -2: AText := rs('Common', 'DocPayDocOut');
     1: AText := rs('Common', 'DocWBIn');
    -1: AText := rs('Common', 'DocWBOut');
    -6: AText := rs('Common', 'DocWBRetOut');
     6: AText := rs('Common', 'DocWBRetIn');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmKAOutParty.colTypeCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.colTypeCustomDrawCell') else _udebug := nil;{$ENDIF}

  if not ASelected then AFont.Color := clMaroon;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.lcbMaterialPropertiesInitPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.lcbMaterialPropertiesInitPopup') else _udebug := nil;{$ENDIF}

  if not cdsMaterial.Active then begin
    Screen.Cursor := crSQLWait;

    try
      cdsMaterial.Open;

    finally
      Screen.Cursor := crDefault;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.lcbMaterialPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.lcbMaterialPropertiesChange') else _udebug := nil;{$ENDIF}

  if cdsMaterial.Active and (lcbMaterial.Text = '') then lcbMaterial.ItemIndex := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.lcbMaterialPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.lcbMaterialPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if CanRefresh then ID := ID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.btnMatClick(Sender: TObject);
  var
    intID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.btnMatClick') else _udebug := nil;{$ENDIF}

  try
    intID := lcbMaterial.KeyValue
    
  except
    intID := 0;
  end;

  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, intID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.FormResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.FormResize') else _udebug := nil;{$ENDIF}

  SetGrdWidth;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.FormShow') else _udebug := nil;{$ENDIF}

  inherited;
  SetGrdWidth;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.grdMainKeyDown') else _udebug := nil;{$ENDIF}

  if Key = 13 then begin
    Key := 0;
    grdMainDblClick(grdMain);
  end
  else GoNextKeyDown(Sender, Key, Shift);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.aSetGridOptionsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.aSetGridOptionsExecute') else _udebug := nil;{$ENDIF}

  grdMain.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'PartyOuts');
  ImgList := dmData.Images;
  AIndex := II_WBOUT;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKAOutParty.grdMainColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKAOutParty.grdMainColumnSorting') else _udebug := nil;{$ENDIF}

  Allow := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('KAOutParty', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
