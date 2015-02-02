{$I ok_sklad.inc}
unit PartySelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseDlg, ActnList, ssFormStorage, ImgList, xButton, ssPanel,
  ssGradientPanel, ssSpeedButton, ExtCtrls, ClientData, dxTL6, dxDBCtrl6,
  dxDBGrid6, DB, dxCntner6, ssDBGrid, ssMemDS, dxDBTLCl6, dxGrClms6, TB2Item,
  Menus, Grids, DBGrids, dxExEdtr6, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, ssLabel, ssBevel, ssBaseConst, FR_Class, FR_DSet,
  FR_DBSet, dxDBTL6;

type
  TfrmPartySelect = class(TBaseDlg)
    aContextFind: TAction;
    aExcel: TAction;
    aFind: TAction;
    aFindBegin: TAction;
    aFindByDoc: TAction;
    aFindBySN: TAction;
    aFindConcurr: TAction;
    aFindProps: TAction;
    aFindSubstr: TAction;
    aPrint: TAction;
    aSelAll: TAction;
    aShowGrdOptions: TAction;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btnCheck: TssSpeedButton;
    btnDel: TssSpeedButton;
    btnDirUp: TssSpeedButton;
    btnDyn: TssSpeedButton;
    btnErrMess: TssSpeedButton;
    btnExcel: TssSpeedButton;
    btnFind: TssSpeedButton;
    btnFindParams: TssSpeedButton;
    btnHelp1: TssSpeedButton;
    btnLock1: TssSpeedButton;
    btnNew: TssSpeedButton;
    btnPatternNew: TssSpeedButton;
    btnPrint: TssSpeedButton;
    btnProps: TssSpeedButton;
    btnReconnect: TssSpeedButton;
    btnRefresh: TssSpeedButton;
    btnView: TssSpeedButton;
    bvlBarTop: TssBevel;
    colAmount: TdxDBGridColumn;
    colAsel: TdxDBGridCalcColumn;
    colCertDate: TdxDBGridColumn;
    colCertNum: TdxDBGridColumn;
    colChk: TdxDBGridCheckColumn;
    colCurrName: TdxDBGridColumn;
    colDocNum: TdxDBGridColumn;
    colGTD: TdxDBGridColumn;
    colImg: TdxDBGridImageColumn;
    colNum: TdxDBGridMaskColumn;
    colondate: TdxDBGridColumn;
    colPosID: TdxDBGridColumn;
    colPrice: TdxDBGridColumn;
    colProducer: TdxDBGridColumn;
    colSN: TdxDBGridMaskColumn;
    colWBillID: TdxDBTreeListColumn;
    dbgSN: TssDBTreeList;
    dsSN: TDataSource;
    edFind: TcxTextEdit;
    frDBDSMaster: TfrDBDataSet;
    frReport1: TfrReport;
    mdSN: TssMemoryData;
    mdSNamount: TFloatField;
    mdSNasel: TFloatField;
    mdSNcertdate: TDateTimeField;
    mdSNcertnum: TStringField;
    mdSNchecked: TBooleanField;
    mdSNcurrname: TStringField;
    mdSNdocnumtxt: TStringField;
    mdSNgtd: TStringField;
    mdSNNum: TIntegerField;
    mdSNondate: TDateField;
    mdSNpid: TIntegerField;
    mdSNposid: TIntegerField;
    mdSNprice: TFloatField;
    mdSNproducer: TStringField;
    mdSNSN: TStringField;
    mdSNsourceid: TIntegerField;
    mdSNwbillid: TIntegerField;
    mdSNwtype: TIntegerField;
    mnuFindBegin: TTBItem;
    mnuFindConcurr: TTBItem;
    mnuFindParamsSep: TTBSeparatorItem;
    mnuFindSubstr: TTBItem;
    panBar: TPanel;
    pmFind: TTBPopupMenu;
    pmGrd: TTBPopupMenu;
    sepDyn: TBevel;
    sepPrint: TBevel;
    TBItem11: TTBItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    txtLang2: TssLabel;

    procedure aContextFindExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aExcelExecute(Sender: TObject);
    procedure aFindBeginExecute(Sender: TObject);
    procedure aFindByDocExecute(Sender: TObject);
    procedure aFindBySNExecute(Sender: TObject);
    procedure aFindConcurrExecute(Sender: TObject);
    procedure aFindExecute(Sender: TObject);
    procedure aFindPropsExecute(Sender: TObject);
    procedure aFindSubstrExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aSelAllExecute(Sender: TObject);
    procedure aShowGrdOptionsExecute(Sender: TObject);
    procedure colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colAselGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colChkCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colChkGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colChkToggleClick(Sender: TObject; const Text: String; State: TdxCheckBoxState);
    procedure colDocNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure dbgSNChangeNode(Sender: TObject; OldNode, Node: TdxTreeListNode);
    procedure dbgSNColumnSorting(Sender: TObject; Column: TdxTreeListColumn; var Allow: Boolean);
    procedure dbgSNCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgSNDblClick(Sender: TObject);
    procedure dbgSNEdited(Sender: TObject; Node: TdxTreeListNode);
    procedure dbgSNEditing(Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
    procedure dbgSNGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure dbgSNKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgSNNeedAdjust(Sender: TObject);
    procedure edFindPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frReport1BeforePrint(Memo: TStringList; View: TfrView);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);
    procedure mdSNAfterScroll(DataSet: TDataSet);
    procedure mdSNBeforeScroll(DataSet: TDataSet);

  private
    FError:boolean;
    FindIndex: Integer;
    FMatName: string;

    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure SetMatName(const Value: string);
    function CheckAmount: Boolean;

  protected
    procedure RealignGrid;
    function GetFirstVisibleCol(AGrid: TdxDBGrid): TdxDBTreeListColumn;

  public
    FRetInMode:Boolean;
    FAmount:Integer;
    FChkAmount:Boolean;
    FBySN:boolean;

    property MatName: string read FMatName write SetMatName;
    procedure SetCaptions; override;
  end;

var
  frmPartySelect: TfrmPartySelect;

implementation

uses 
  prConst, ssBaseIntfDlg, fMessageDlg, Math,
  ssBaseTypes, ssFun, Export, prFun, prRep, ssStrUtil, Udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
function TfrmPartySelect.GetFirstVisibleCol(AGrid: TdxDBGrid): TdxDBTreeListColumn;
  var
    i: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.GetFirstVisibleCol') else _udebug := nil;{$ENDIF}
  
  Result := nil;

  for i := 1 to AGrid.ColumnCount - 1 do
    if (AGrid.Columns[i].Visible) and (AGrid.Columns[i].Index > 3) then begin
      Result := AGrid.Columns[i];
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



//==============================================================================================
procedure TfrmPartySelect.WMLayoutChanged(var M: TMessage);
begin
 txtLang2.Caption := keyboardIndicator;
end;

//==============================================================================================
procedure TfrmPartySelect.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    Self.Caption := GetRS('fmWaybill','Partys');
    colNum.Caption := amountPrefix(False);
    colSN.Caption := GetRS('fmWaybill','SN');
    aSelAll.Caption := GetRS('Common','SelectAll');
    colDocNum.Caption := GetRS('fmKAgent','Doc');
    colAmount.Caption := GetRS('fmWaybill','FreeAtWH');
    colAsel.Caption := GetRS('fmWaybill','Amount');
    colPrice.Caption := GetRS('fmWaybill', 'InPrice');
    colImg.Caption := EmptyStr;

    colProducer.Caption := GetRS('fmMaterials', 'Producer');
    colCertNum.Caption := GetRS('fmWaybill', 'CertNum');
    colCertDate.Caption := GetRS('fmWaybill', 'CertDate');
    colGTD.Caption := GetRS('fmWaybill', 'GTD');

    btnLock1.Hint := btnLock.Hint;
    btnErrMess.Hint := btnSendErrMessage.Hint;
    btnHelp1.Hint := btnHelp.Hint;

    aFind.Caption := GetRS('Common', 'Find');
    aFind.Hint := aFind.Caption;
    aFindProps.Caption := GetRS('Common', 'FindParams');
    aFindProps.Hint := aFindProps.Caption;
    aFindBegin.Caption := GetRS('Common', 'FindBegin');
    aFindConcurr.Caption := GetRS('Common', 'FindConcurr');
    aFindSubstr.Caption := GetRS('Common', 'FindSubst');
    aContextFind.Caption := GetRS('Common', 'FindContext');
    aFindByDoc.Caption := colDocNum.Caption;
    aFindBySN.Caption := colSN.Caption;
    aShowGrdOptions.Caption := GetRS('Common', 'ColOptions') + '...';
    aPrint.Caption := GetRS('Common','Print');
    aPrint.Hint := aPrint.Caption;
    aExcel.Caption := GetRS('Common', 'Excel');
    aExcel.Hint := aExcel.Caption;
  end;//with

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.FormCreate') else _udebug := nil;{$ENDIF}


  FRetInMode := False;
  SendMessage(Self.Handle, WM_LAYOUTCHANGED, 0, WORD(GetKeyboardLayout(0)));
  FError := True;
  FBySN := False;
  SetCaptions;
  dbgSN.LoadFromRegistry(MainRegKey + '\' + Self.Name);

  mdSNasel.DisplayFormat := MatDisplayFormat;

//  dmData.i14.GetBitmap(2, colAsel.ButtonGlyph);
//  colASel.ButtonGlyph.Transparent := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.aSelAllExecute(Sender: TObject);
var BM:TBookmark;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.aSelAllExecute') else _udebug := nil;{$ENDIF}


  with mdSN do begin
    if not FRetInMode then begin
      DisableControls;
      BM := GetBookmark;
      try
        First;
        while not Eof do begin
          Edit;
          FieldByName('asel').AsFloat := FieldByName('amount').AsFloat;
          FieldByName('checked').AsBoolean := True;
          Post;
          Next;
        end;//while
      finally
        GotoBookmark(BM);
        FreeBookmark(BM);
        EnableControls;
      end;
    end
    else begin
      Edit;
      FieldByName('asel').AsFloat := FieldByName('amount').AsFloat;
      FieldByName('checked').AsBoolean := True;
      Post;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
  var BM:TBookmark;
  am:integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.FormCloseQuery') else _udebug := nil;{$ENDIF}


  if ModalResult = mrOk then begin
    if not CheckAmount then begin
      ssMessageDlg(rs('fmWaybill', 'WBOutErrAmount'), ssmtError,
        [ssmbOk]);
      CanClose := False;   
        begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    end;
    if FChkAmount then begin
      with mdSN do begin
        DisableControls;
        BM := GetBookmark;
        try
          First;
          am := 0;
          while not Eof do begin
            if FieldByName('checked').AsBoolean then inc(am);
            Next;
          end;
        finally
          GotoBookmark(BM);
          FreeBookmark(BM);
          EnableControls;
        end;
      end;//with mdSN do begin
      if am <> FAmount then begin
        CanClose := False;
        ssMessageDlg(Format(rs('fmWaybill', 'SNAmountErr'),[FAmount]),ssmtWarning,[ssmbok]);
      end
      else CanClose := True;
    end;  
  end
  else CanClose := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.dbgSNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.dbgSNKeyDown') else _udebug := nil;{$ENDIF}


  if (Key = 13) then
    if (dbgSN.FocusedNode = dbgSN.LastNode)
      then begin
        dbgSN.CloseEditor;
        if btnOk.Enabled then btnOk.SetFocus;
      end
      else dbgSN.GotoNext(False)
    else GoNextKeyDown(Sender, Key, Shift);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.FormShow') else _udebug := nil;{$ENDIF}


  inherited;

  try
    dbgSN.FocusedColumn := 1;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.dbgSNChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.dbgSNChangeNode') else _udebug := nil;{$ENDIF}


{  try
    dbgSN.ColumnByFieldName('asel').DisableEditor := (not Node.Values[colChk.Index]);
  except
    dbgSN.ColumnByFieldName('asel').DisableEditor := True;
  end;}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.dbgSNCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.dbgSNCustomDrawCell') else _udebug := nil;{$ENDIF}


  if ANode.Level = 0 then begin
    AFont.Color := clWindowText;
    AFont.Style := [fsBold];
    AColor := $00BBBBBB;
  end
  else begin
    if (VarToFloat(ANode.Values[colAmount.Index]) -
        VarToFloat(ANode.Values[colASel.Index]) < 0) or
       (ANode.Values[colASel.Index] < 0)
      then AFont.Color := clRed;
    FError := (AFont.Color = clRed);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.ActionListUpdate') else _udebug := nil;{$ENDIF}


  aOK.Enabled := not FError;
  aPrint.Enabled := (not mdSN.IsEmpty)and(ShowPrices);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.colChkToggleClick(Sender: TObject;
  const Text: String; State: TdxCheckBoxState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.colChkToggleClick') else _udebug := nil;{$ENDIF}


  if dbgSN.FocusedNode.Level = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  case State of
    cbsChecked:begin
      mdSN.FieldByName('checked').AsBoolean := True;
      mdSN.FieldByName('asel').AsFloat := mdSN.FieldByName('amount').AsFloat;
    end;//cbsChecked
    cbsUnchecked:begin
      mdSN.FieldByName('checked').AsBoolean := False;
      mdSN.FieldByName('asel').AsFloat := 0;
    end;//cbsUnchecked
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.aFindPropsExecute(Sender: TObject);
var Pos: TPoint;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.aFindPropsExecute') else _udebug := nil;{$ENDIF}


  Pos := panBar.ClientToScreen(Point(btnFindParams.Left, btnFindParams.Top+btnFindParams.Height+1));
  pmFind.Popup(Pos.X, Pos.Y);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.aFindBeginExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.aFindBeginExecute') else _udebug := nil;{$ENDIF}


  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.aFindConcurrExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.aFindConcurrExecute') else _udebug := nil;{$ENDIF}


  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.aFindSubstrExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.aFindSubstrExecute') else _udebug := nil;{$ENDIF}


  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.aContextFindExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.aContextFindExecute') else _udebug := nil;{$ENDIF}


  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.aFindByDocExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.aFindByDocExecute') else _udebug := nil;{$ENDIF}


  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.aFindBySNExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.aFindBySNExecute') else _udebug := nil;{$ENDIF}


  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.edFindPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.edFindPropertiesChange') else _udebug := nil;{$ENDIF}


//  if aContextFind.Checked then aFind.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.aFindExecute(Sender: TObject);
  var
   FNode: TdxTreeListNode;
   FName: string;
   ftype: TLocateType;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.aFindExecute') else _udebug := nil;{$ENDIF}


     begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

   FindIndex := -1;
   if edFind.Text=EmptyStr then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

   if aFindByDoc.Checked then FName := 'docnumtxt' else
   if aFindBySN.Checked then FName := 'sn';

   if aFindConcurr.Checked then ftype := ltFull else
   if aFindBegin.Checked then ftype := ltBegin else
   if aFindSubstr.Checked then ftype := ltSubstr;

   //FNode := FindNode(dbgSN, FName, edFind.Text, ftype, FindIndex);
   if FNode <> nil then begin
    FindIndex := FNode.Index;
    dbgSN.ClearSelection;
    mdSN.Locate('posid', FNode.Values[colPosID.Index], []);
    dbgSN.FocusedNode.Selected := True;
    dbgSN.FocusedColumn := dbgSN.ColumnByFieldName(FName).Index;

   end else ssMessageDlg(rs('Common', 'FindError') + ', ' + rs('Common', 'DSEnd'), ssmtInformation, [ssmbOk]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.RealignGrid;
  var ACol: TdxDBTreeListColumn;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.RealignGrid') else _udebug := nil;{$ENDIF}


{  ACol := GetFirstVisibleCol(dbgSN);
  if ACol <> nil then AdjustGrid(dbgSN,ACol);}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfrmPartySelect.aShowGrdOptionsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.aShowGrdOptionsExecute') else _udebug := nil;{$ENDIF}


  dbgSN.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.dbgSNNeedAdjust(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.dbgSNNeedAdjust') else _udebug := nil;{$ENDIF}


  RealignGrid;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.dbgSNGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.dbgSNGetOptionsTitle') else _udebug := nil;{$ENDIF}


  AText := rs('fmWaybill','Partys');
  ImgList := dmData.Images;
  AIndex := 171;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.aExcelExecute(Sender: TObject);
  var ExportLIst: TStringList;
     i:integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.aExcelExecute') else _udebug := nil;{$ENDIF}


    begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  ExportList := TStringList.Create;
  with ExportList do begin
    for i := 0 to dbgSN.ColumnCount-1 do
      if dbgSN.Columns[i].Tag=1 then AddObject(dbgSN.Columns[i].Name,pointer(integer(dbgSN.Columns[i].Visible)));
  end;

  with TfrmExport.Create(nil) do
  try
    FunID := 0;
//    grdExp := dbgSN;
    lName.Caption := Self.Caption;
    FList := ExportList;
{    if ShowModal=mrOk then begin
      ExportToExcel(dbgSN,ExportList,chbShowExcel.Checked);
    end;}
  finally
    ExportList.Free;
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.aPrintExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.aPrintExecute') else _udebug := nil;{$ENDIF}


  if not mdSN.IsEmpty then
  case mdSN.FieldByName('wtype').AsInteger of
    1: xRep.ShowRep(rtWBIn,mdSN.FieldByName('wbillid').AsInteger);
    4: xRep.ShowRep(rtWBMove,mdSN.FieldByName('wbillid').AsInteger);
    5: xRep.ShowRep(rtWBRest,mdSN.FieldByName('wbillid').AsInteger);
    6: xRep.ShowRep(rtReturnIn,mdSN.FieldByName('wbillid').AsInteger);
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.frReport1GetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.frReport1GetValue') else _udebug := nil;{$ENDIF}


  if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.frReport1BeforePrint(Memo: TStringList; View: TfrView);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.frReport1BeforePrint') else _udebug := nil;{$ENDIF}


  if (View.Name = 'EntLogo'){and FUseLogo}and(EntLogo.Size>0) then begin
    EntLogo.Position := 0;
    TfrPictureView(View).Picture.Bitmap.LoadFromStream(EntLogo);
  end;//if EntLogo

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.colPriceGetText') else _udebug := nil;{$ENDIF}


  try
    AText := FormatFloat(PriceDisplayFormat, StrToFloat(AText)) + ' ' + ANode.Values[colCurrName.Index];
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.FormDestroy') else _udebug := nil;{$ENDIF}


  dbgSN.SaveToRegistry(MainRegKey + '\' + Self.Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.colAmountGetText') else _udebug := nil;{$ENDIF}


//  AText := FormatFloat(MatDisplayFormat, StrToFloat(AText));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.dbgSNEdited(Sender: TObject; Node: TdxTreeListNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.dbgSNEdited') else _udebug := nil;{$ENDIF}


{  try
    dbgSN.ColumnByFieldName('asel').DisableEditor := (not Node.Values[colChk.Index]);
  except
    dbgSN.ColumnByFieldName('asel').DisableEditor := True;
  end;}
  mdSN.Edit;
  if VarToFloat(Node.Values[colAsel.Index]) > 0
    then mdSN.FieldByName('checked').AsBoolean := True
    else mdSN.FieldByName('checked').AsBoolean := False;
  mdSN.Post;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.colAselGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.colAselGetText') else _udebug := nil;{$ENDIF}


  try
    AText := FormatFloat(MatDisplayFormat, StrToFloat(DelChars(AText, [ThousandSeparator])));
  except
  end;  

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.SetMatName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.SetMatName') else _udebug := nil;{$ENDIF}


  FMatName := Value;

  Self.Caption := rs('fmWaybill', 'Partys') + ': ' + Value ;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.mdSNBeforeScroll(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.mdSNBeforeScroll') else _udebug := nil;{$ENDIF}


  inherited;
{  if FRetInMode and (mdSN.Tag=0) then begin
    DataSet.Edit;
    DataSet.FieldByName('checked').AsBoolean := False;
    if FBySN then DataSet.FieldByName('asel').AsFloat := 0;
    DataSet.Post;
  end;}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.mdSNAfterScroll(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.mdSNAfterScroll') else _udebug := nil;{$ENDIF}


  inherited;
{  if FRetInMode and (mdSN.Tag=0) then begin
    DataSet.Edit;
    DataSet.FieldByName('checked').AsBoolean := True;
    if FBySN then DataSet.FieldByName('asel').AsFloat := DataSet.FieldByName('amount').AsFloat;
    DataSet.Post;
  end;}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.dbgSNDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.dbgSNDblClick') else _udebug := nil;{$ENDIF}


  if FRetInMode and aOK.Enabled then aOK.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.colChkGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.colChkGetText') else _udebug := nil;{$ENDIF}


  if ANode.Level = 0 then AText := '-1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.colImgGetText') else _udebug := nil;{$ENDIF}


  if ANode.Level = 0 then AText := '-138';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.dbgSNEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.dbgSNEditing') else _udebug := nil;{$ENDIF}


  Allow := Node.Level > 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.colChkCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.colChkCustomDrawCell') else _udebug := nil;{$ENDIF}


  if ANode.Level = 0 then begin
    ACanvas.Brush.Color := $00BBBBBB;
    ACanvas.FillRect(ARect);
    ADone := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.dbgSNColumnSorting(Sender: TObject; Column: TdxTreeListColumn; var Allow: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.dbgSNColumnSorting') else _udebug := nil;{$ENDIF}


  Allow := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmPartySelect.CheckAmount: Boolean;
var
  BM: TBookmark;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.CheckAmount') else _udebug := nil;{$ENDIF}


  Result := True;
  with mdSN do begin
    BM := GetBookmark;
    DisableControls;
    try
      First;
      while not Eof do begin
        if (FieldByName('amount').AsFloat - FieldByName('asel').AsFloat < 0) or
           (FieldByName('asel').AsFloat < 0) then begin
          Result := False;
            begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

        end;
        Next;
      end;
    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
      EnableControls;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmPartySelect.colDocNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmPartySelect.colDocNumGetText') else _udebug := nil;{$ENDIF}


  if VarToInt(ANode.Values[colWBillID.Index]) = -16
    then AText := rs('fmOrders', 'Temp');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('PartySelect', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
