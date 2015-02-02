{$I ok_sklad.inc}
unit DocsList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseSkinForm, ImgList, ssSpeedButton, ssPanel, ExtCtrls,
  ssGradientPanel, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  dxDBGrid6, xButton, cxGraphics, cxCustomData, cxStyles, cxTL, Grids,
  DBGrids, DB, dxmdaset, cxInplaceContainer, cxTLData, cxDBTL, dxTL6,
  dxDBCtrl6, dxCntner6, dxDBTL6, dxDBTLCl6, ClientData, FR_DSet, FR_DBSet,
  FR_Class, ssBevel, ssLabel, xLngDefs;

type
  TfrmDocsList = class(TfrmBaseSkin)
    aApply: TAction;
    aCancel: TAction;
    ActionList: TActionList;
    aOK: TAction;
    aPrinDoc: TAction;
    aPrintAll: TAction;
    btnCancel: TxButton;
    btnColExp: TssSpeedButton;
    btnErrMess: TssSpeedButton;
    btnHelp: TssSpeedButton;
    btnLock: TssSpeedButton;
    btnOK: TxButton;
    btnPrintAll: TssSpeedButton;
    btnPrintDoc: TssSpeedButton;
    colAmount: TdxDBTreeListColumn;
    colCheked: TdxDBTreeListImageColumn;
    colMatName: TdxDBTreeListColumn;
    colName: TdxDBTreeListColumn;
    colNum: TdxDBTreeListColumn;
    colONDATE: TdxDBTreeListColumn;
    colPosNum: TdxDBTreeListColumn;
    colWBILLID: TdxDBTreeListColumn;
    colWType: TdxDBTreeListColumn;
    dbgListDet: TdxDBTreeList;
    dlDocsList: TDataSource;
    dsReport: TDataSource;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    frReport1: TfrReport;
    lAmount: TssLabel;
    lDocCount: TssLabel;
    lPosCount: TssLabel;
    lTotal: TssLabel;
    mdDocsList: TdxMemData;
    mdRepDet: TdxMemData;
    mdReport: TdxMemData;
    panButtons: TPanel;
    panFooter: TPanel;
    PanTopBtn: TPanel;
    ssBevel3: TssBevel;
    txtAmount: TssBevel;
    txtDocCount: TssBevel;
    txtPosCount: TssBevel;
    txtTotal: TssBevel;

    procedure aApplyExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aOKExecute(Sender: TObject);
    procedure aPrinDocExecute(Sender: TObject);
    procedure aPrintAllExecute(Sender: TObject);
    procedure btnColExpClick(Sender: TObject);
    procedure btnErrMessClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnLockClick(Sender: TObject);
    procedure btnOkGetDrawParams(Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor; AFont: TFont);
    procedure colNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colWBILLIDGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure dbgListDetGetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
    procedure dsReportDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);
    procedure GoNext(Sender: TObject; var Key: Char);
    procedure GoNextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    docnum, docdate, kafullname,reason, curnds, propis, personname,
    received, att, attdate, kaphone, kaaddr, todate, whousein,
    whouseout, personin, personout: string;
    FSumNDS, FSumAll:Extended;
    procedure SetCaptions;

  public
    procedure GetCounts;
  end;

var
  frmDocsList: TfrmDocsList;

implementation

uses
  prConst, ssBaseConst, ssClientDataSet, DBClient, prFun, ssFun, prRep, udebug;

{$IFDEF UDEBUG}
var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

{$R *.dfm}

//==============================================================================================
procedure TfrmDocsList.btnOkGetDrawParams(Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor; AFont: TFont);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.btnOkGetDrawParams') else _udebug := nil;{$ENDIF}

  if AState in [cxbsHot, cxbsPressed] then begin
      AFont.Style := [fsBold];
      AColor := TcxButton(Sender).Colors.Normal;
     end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmDocsList.aApplyExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.aApplyExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrYes;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.aOKExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.aOKExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrOk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.aCancelExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.GoNext(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.GoNext') else _udebug := nil;{$ENDIF}

  if NextCtrlOnEnter and (Key=#13) then begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.GoNextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.GoNextKeyDown') else _udebug := nil;{$ENDIF}

  if ssCtrl in Shift then
   case Key of
     VK_UP   : Perform(WM_NEXTDLGCTL, 1, 0);
     VK_DOWN : Perform(WM_NEXTDLGCTL, 0, 0);
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 var
   Ctrl: TWinControl;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.FormKeyDown') else _udebug := nil;{$ENDIF}

  if (ssCtrl in Shift) and (Key in [VK_DOWN, VK_UP]) then begin
    Ctrl := Self.ActiveControl;
    if (Ctrl is TcxCustomInnerTextEdit) and
      ((Ctrl as TcxCustomInnerTextEdit).Parent is TcxCustomDropDownEdit) and not
      (TcxCustomDropDownEdit((Ctrl as TcxCustomInnerTextEdit).Parent).DroppedDown)
    then begin
      case Key of
        VK_DOWN : Perform(WM_NEXTDLGCTL, 0, 0);
        VK_UP   : Perform(WM_NEXTDLGCTL, 1, 0);
      end;
      Key := 0;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.FormShow(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TdxDBTreeList then
      with (Components[i] as TdxDBTreeList) do begin
        HighlightColor := GridHighlightColor;
        HighlightTextColor := clWindow;
        HideSelectionColor := GridHideSelColor;
        HideSelectionTextColor := clWindow;
        HideFocusRect := True;
      end;

  AdjustGrid(dbgListDet, colName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.FormClose(Sender: TObject; var Action: TCloseAction);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.FormClose') else _udebug := nil;{$ENDIF}

  mdDocsList.Close;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.dbgListDetGetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.dbgListDetGetImageIndex') else _udebug := nil;{$ENDIF}

  case Node.Values[dbgListDet.ColumnByFieldName('wtype').Index] of
      -1: Index := 62;
       1: Index := 51;
       2: Index := 112;
       4: Index := 98;
    -100: Index := 74;
      -5: Index := 125;
      -6: Index := 128;
       6: Index := 127;
     -16: Index := II_ORDEROUT;
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.colNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.colNameGetText') else _udebug := nil;{$ENDIF}

  case ANode.Values[colWType.Index] of
    -1: AText := rs('fmWaybill','TitleWaybillOut') + amountPrefix + ANode.Values[colNum.Index]+' '+rs('fmWaybill','AttDate')+' '+DateTimeToStr(ANode.Values[colONDATE.Index]);
     1: AText := rs('fmWaybill','TitleWaybill')+amountPrefix+ANode.Values[colNum.Index]+' '+rs('fmWaybill','AttDate')+' '+DateTimeToStr(ANode.Values[colONDATE.Index]);
     2: AText := rs('fmWaybill','TitleAccOut')+amountPrefix+ANode.Values[colNum.Index]+' '+rs('fmWaybill','AttDate')+' '+DateTimeToStr(ANode.Values[colONDATE.Index]);
     4: AText := rs('fmWaybill','TitleWaybillMov')+amountPrefix+ANode.Values[colNum.Index]+' '+rs('fmWaybill','AttDate')+' '+DateTimeToStr(ANode.Values[colONDATE.Index]);
    -5: AText := rs('fmWriteOff','TitleWriteOff')+amountPrefix+ANode.Values[colNum.Index]+' '+rs('fmWaybill','AttDate')+' '+DateTimeToStr(ANode.Values[colONDATE.Index]);
    -6: AText := rs('fmWaybill','ReturnOutTitle')+amountPrefix+ANode.Values[colNum.Index]+' '+rs('fmWaybill','AttDate')+' '+DateTimeToStr(ANode.Values[colONDATE.Index]);
     6: AText := rs('fmWaybill','ReturnOutTitle')+amountPrefix+ANode.Values[colNum.Index]+' '+rs('fmWaybill','AttDate')+' '+DateTimeToStr(ANode.Values[colONDATE.Index]);
   -16: AText := rs('fmWaybill', 'DocOrderOut') + amountPrefix + ANode.Values[colNum.Index]+' '+rs('fmWaybill','AttDate')+' '+DateTimeToStr(ANode.Values[colONDATE.Index]);
  -100: AText := inttostr(ANode.Values[colPosNum.Index]) + '. ' + ANode.Values[colMatName.Index];
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.colWBILLIDGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.colWBILLIDGetText') else _udebug := nil;{$ENDIF}

  AText := '';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.aPrinDocExecute(Sender: TObject);
  var
    tmpwtype, wbillid:integer;
    FSumWithoutNDSPos,FSumNDSPos, FSumWithoutNDS:Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.aPrinDocExecute') else _udebug := nil;{$ENDIF}

  if mdDocsList.FieldByName('wtype').AsInteger = -100 then begin
    wbillid := dbgListDet.FocusedNode.Parent.Values[colWBILLID.Index];
    tmpwtype := dbgListDet.FocusedNode.Parent.Values[colWType.Index];
  end
  else begin
    wbillid := dbgListDet.FocusedNode.Values[colWBILLID.Index];
    tmpwtype := dbgListDet.FocusedNode.Values[colWType.Index];
  end;


  case tmpwtype of
    //Расходная накладная
    -1:begin
      xRep.ShowRep(prRep.rtWBOut, wbillid);
    end;//-1

    //Счёт
    2:begin
       xRep.ShowRep(prRep.rtAccOut, wbillid);
    end;//2

    -5:begin//Акт списания
       xRep.ShowRep(prRep.rtWriteOff, wbillid);
    end;//-5

    -6:begin//Возврат поставщику
       xRep.ShowRep(prRep.rtReturnOut, wbillid);
    end;//-5

    //Накладная перемещения
    4:begin
       xRep.ShowRep(prRep.rtWBMove, wbillid);
    end;//4
  end;//case

  docnum := '';
  docdate := '';
  kafullname := '';
  reason := '';
  curnds := '';
  propis := '';
  personname := '';
  received := '';
  att := '';
  FSumNDS := 0;
  FSumAll := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.aPrintAllExecute(Sender: TObject);
  var
    BM:TBookmark;
    s: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.aPrintAllExecute') else _udebug := nil;{$ENDIF}

 BM := mdDocsList.GetBookmark;
 mdDocsList.DisableControls;
 try
   mdReport.CopyFromDataSet(mdDocsList);
   //Удаление товаров
   mdReport.First;
   while not mdReport.Eof do begin
     if mdReport.FieldByName('wtype').AsInteger = -100
     then mdReport.Delete
     else begin
       mdReport.Edit;
       s := ' ' + amountPrefix + mdReport.FieldByName('num').AsString + rs('fmWaybill','AttDate',3) + DateTimeToStr(mdReport.FieldByName('ondate').AsDateTime);
       case mdReport.FieldByName('wtype').AsInteger of
         -1: mdReport.FieldByName('name').AsString := RS('fmWaybill','TitleWaybillOut') + s;
          1: mdReport.FieldByName('name').AsString := RS('fmWaybill','TitleWaybill') + s;
          2: mdReport.FieldByName('name').AsString := RS('fmWaybill','TitleAccOut') + s;
          4: mdReport.FieldByName('name').AsString := RS('fmWaybill','TitleWaybillMov') + s;
         -5: mdReport.FieldByName('name').AsString := RS('fmWriteOff','TitleWriteOff') + s;
       end;//case
       mdReport.Next;
     end;
   end;
   mdReport.Tag := 100;

   SmartShowRep(frReport1, 'DocsList.frf');

 finally
   mdDocsList.GotoBookmark(BM);
   mdDocsList.FreeBookmark(BM);
   mdDocsList.EnableControls;
   mdReport.Tag := 0;
   mdReport.Close;
   mdRepDet.Close;
 end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.frReport1GetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.frReport1GetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := docnum
  else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := docdate
  else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
  else if 0 = AnsiCompareText(ParName, 'entaddr') then ParValue := EntAddr
  else if 0 = AnsiCompareText(ParName, 'entphone') then ParValue := EntPhone
  else if 0 = AnsiCompareText(ParName, 'entaccount') then ParValue := EntAccount
  else if 0 = AnsiCompareText(ParName, 'entbank') then ParValue := EntBank
  else if 0 = AnsiCompareText(ParName, 'entmfo') then ParValue := EntMFO
  else if 0 = AnsiCompareText(ParName, 'entokpo') then ParValue := EntOKPO
  else if 0 = AnsiCompareText(ParName, 'kaphone') then ParValue := kaphone
  else if 0 = AnsiCompareText(ParName, 'kaaddr') then ParValue := kaaddr
  else if 0 = AnsiCompareText(ParName, 'todate') then ParValue := todate
  else if 0 = AnsiCompareText(ParName, 'kafullname') then ParValue := kafullname
  else if 0 = AnsiCompareText(ParName, 'curnds') then ParValue := curnds
  else if 0 = AnsiCompareText(ParName, 'propis') then ParValue := propis
  else if 0 = AnsiCompareText(ParName, 'sumnds') then ParValue := FSumNDS
  else if 0 = AnsiCompareText(ParName, 'sumall') then ParValue := FSumAll
  else if 0 = AnsiCompareText(ParName, 'whousein') then ParValue := whousein
  else if 0 = AnsiCompareText(ParName, 'whouseout') then ParValue := whouseout
  else if 0 = AnsiCompareText(ParName, 'personin') then ParValue := personin
  else if 0 = AnsiCompareText(ParName, 'personout') then ParValue := personout
  else if 0 = AnsiCompareText(ParName, 'reason') then ParValue := reason
  else if 0 = AnsiCompareText(ParName, 'personname') then ParValue := personname
  else if 0 = AnsiCompareText(ParName, 'received') then ParValue := received
  else if 0 = AnsiCompareText(ParName, 'att') then ParValue := att
  else if 0 = AnsiCompareText(ParName, 'reptitle') then ParValue := panTitleBar.Caption;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.dsReportDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.dsReportDataChange') else _udebug := nil;{$ENDIF}

 if (mdReport.Tag = 100) and mdReport.Active then begin
   mdRepDet.Close;
   mdRepDet.CopyFromDataSet(mdDocsList);
   mdRepDet.First;

   while not mdRepDet.Eof do begin
     if (mdRepDet.FieldByName('pwbid').AsInteger=mdReport.FieldByName('docid').AsInteger)
        and (mdRepDet.FieldByName('wtype').AsInteger = -100)
     then mdRepDet.Next
     else mdRepDet.Delete;
   end;
 end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.btnLockClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.btnLockClick') else _udebug := nil;{$ENDIF}

  LockScreen;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.btnHelpClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.btnHelpClick') else _udebug := nil;{$ENDIF}

  ShowHelpTopic(Self.ClassName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    colWBILLID.Caption := '';
    colCheked.Caption := '';
    btnPrintDoc.Hint := GetRS(Self.Name, 'ViewDoc');
    btnPrintAll.Hint := GetRS(Self.Name, 'PrintAll');
    colName.Caption := GetRS('fmMaterials', 'Name');
    colAmount.Caption := GetRS('fmWaybill', 'Amount');
    colNum.Caption := GetRS('fmWaybill', 'Num');
    colONDATE.Caption := GetRS('fmWaybill', 'OnDate');

    lDocCount.Caption := GetRS(Self.Name, 'DocCount') + ':';
    lPosCount.Caption := GetRS(Self.Name, 'PosCount') + ':';

    btnLock.Hint := GetRS('Common', 'Lock');
    btnHelp.Hint := GetRS('Common', 'Help');
    btnColExp.Hint := GetRS('frmDocsList', 'CollapseTree');

    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  setFontStyle(dbgListDet.HeaderFont, True);

  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.btnColExpClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.btnColExpClick') else _udebug := nil;{$ENDIF}

  if not btnColExp.Checked then begin
    dbgListDet.FullExpand;
    btnColExp.Hint := rs('frmDocsList', 'CollapseTree');
  end
  else begin
    dbgListDet.FullCollapse;
    btnColExp.Hint := rs('frmDocsList', 'ExpandTree');
  end;
  AdjustGrid(dbgListDet, colName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.GetCounts;
  var
    FDocCount, FPosCount: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.GetCounts') else _udebug := nil;{$ENDIF}

  FDocCount := 0;
  FPosCount := 0;
  with mdDocsList do begin
    First;
    while not Eof do begin
      if FieldByName('pwbid').AsInteger = FieldByName('docid').AsInteger
        then Inc(FDocCount)
        else Inc(FPosCount);
      Next;
    end;
  end;
  txtDocCount.Caption := IntToStr(FDocCount);
  txtPosCount.Caption := IntToStr(FPosCount);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDocsList.btnErrMessClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDocsList.btnErrMessClick') else _udebug := nil;{$ENDIF}

  SendMsg;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('DocsList', @Debugging, DEBUG_group_ID);{$ENDIF}
   
//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
