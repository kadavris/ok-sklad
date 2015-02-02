{$I ok_sklad.inc}
unit fOrders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWBDoc, dxExEdtr6, DB, ssDataSource, DBClient,
  ssClientDataSet, TB2Item, Menus, ActnList, dxInspRw, dxInspct, dxCntner6,
  dxDBTLCl6, dxGrClms6, cxPC, cxDropDownEdit, ssDBLookupCombo,
  cxImageComboBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxCalendar, ssSpeedButton, StdCtrls, dxDBGrid6, dxTL6, dxDBCtrl6, 
  prTypes, ssDBGrid, ssBevel, ExtCtrls, ssPeriod, okPeriod, EditAccOut,
  ssMemDS, dxExEdtr, dxCntner;

type
  TfmOrders = class(TfmBaseWBDoc)
    aCreateAcc: TAction;
    aCreateWBIn: TAction;
    aCreateWBOut: TAction;
    aPrintAll: TAction;
    aPrintInvoice: TAction;
    aPrintWBOut: TAction;
    aPrintWP: TAction;
    aTmpAdd: TAction;
    aTmpCreateOrder: TAction;
    aTmpDel: TAction;
    aTmpPosColOptions: TAction;
    aTmpProps: TAction;
    aTmpRefresh: TAction;
    cdsDetailGRPID: TIntegerField;
    cdsDetailPOSTYPE: TIntegerField;
    cdsDetailrsv: TIntegerField;
    cdsDetailtax: TStringField;
    cdsMainADDRESS: TStringField;
    cdsMainATTDATE: TDateTimeField;
    cdsMainATTNUM: TStringField;
    cdsMainCHECKED: TIntegerField;
    cdsMainCITY: TStringField;
    cdsMainCOUNTRY: TStringField;
    cdsMainCURRID: TIntegerField;
    cdsMainCURRNAME: TStringField;
    cdsMainDEFNUM: TIntegerField;
    cdsMainDISTRICT: TStringField;
    cdsMainDOCID: TIntegerField;
    cdsMaindocsaldo: TFloatField;
    cdsMainEMAIL: TStringField;
    cdsMainENTID: TIntegerField;
    cdsMainFAX: TStringField;
    cdsMainKAFULLNAME: TStringField;
    cdsMainKAID: TIntegerField;
    cdsMainKANAME: TStringField;
    cdsMainKAPHONE: TStringField;
    cdsMainKATYPE: TIntegerField;
    cdsMainNDS: TFloatField;
    cdsMainNOTES: TStringField;
    cdsMainNUM: TStringField;
    cdsMainONDATE: TDateTimeField;
    cdsMainONVALUE: TFloatField;
    cdsMainPERSONID: TIntegerField;
    cdsMainPERSONNAME: TStringField;
    cdsMainPOSTINDEX: TStringField;
    cdsMainREASON: TStringField;
    cdsMainRECEIVED: TStringField;
    cdsMainSUMMALL: TFloatField;
    cdsMainSUMMINCURR: TFloatField;
    cdsMainSUMMPAY: TFloatField;
    cdsMainTODATE: TDateTimeField;
    cdsMainWBILLID: TIntegerField;
    cdsMainWTYPE: TIntegerField;
    cdsMainWWW: TStringField;
    cdsTempPos: TssClientDataSet;
    colDocID: TdxDBGridColumn;
    colPosType: TdxDBGridImageColumn;
    colRsv: TdxDBGridImageColumn;
    colStatus: TdxDBGridColumn;
    colTmpAmount: TdxDBGridColumn;
    colTmpBarCode: TdxDBGridColumn;
    colTmpFree: TdxDBGridColumn;
    colTmpImg: TdxDBGridImageColumn;
    colTmpMatArtikul: TdxDBGridColumn;
    colTmpMatName: TdxDBGridColumn;
    colTmpMsrName: TdxDBGridColumn;
    colTmpNotes: TdxDBGridColumn;
    colTmpPosID: TdxDBGridColumn;
    colTmpRsv: TdxDBGridColumn;
    colToDate: TdxDBGridColumn;
    grdTempPos: TssDBGrid;
    irToDate: TdxInspectorTextRow;
    pmPrint: TTBPopupMenu;
    pmTmpPos: TTBPopupMenu;
    srcTempPos: TDataSource;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem20: TTBItem;
    TBItem21: TTBItem;
    TBItem22: TTBItem;
    TBItem24: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBItemPI: TTBItem;
    TBSeparatorItem12: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBSeparatorItem9: TTBSeparatorItem;
    tsTmpPos: TcxTabSheet;

    procedure aAddPayDocExecute(Sender: TObject);
    procedure aCreateAccExecute(Sender: TObject);
    procedure aCreateWBInExecute(Sender: TObject);
    procedure aCreateWBOutExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aPrintAllExecute(Sender: TObject);
    procedure aPrintInvoiceExecute(Sender: TObject);
    procedure aPrintWBOutExecute(Sender: TObject);
    procedure aPrintWPExecute(Sender: TObject);
    procedure aTmpAddExecute(Sender: TObject);
    procedure aTmpCreateOrderExecute(Sender: TObject);
    procedure aTmpDelExecute(Sender: TObject);
    procedure aTmpPosColOptionsExecute(Sender: TObject);
    procedure aTmpPropsExecute(Sender: TObject);
    procedure aTmpRefreshExecute(Sender: TObject);
    procedure cbCheckedPropertiesChange(Sender: TObject);
    procedure cdsDetailCalcFields(DataSet: TDataSet);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure cdsTempPosAfterOpen(DataSet: TDataSet);
    procedure cdsTempPosBeforeOpen(DataSet: TDataSet);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRsvGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colStatusCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colStatusGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummInCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTmpFreeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTmpImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure FrameResize(Sender: TObject);
    procedure grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdDetNeedAdjust(Sender: TObject); override;
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure grdMainDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdTempPosCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdTempPosDblClick(Sender: TObject);
    procedure grdTempPosGetNodeDragText(Sender: TObject; Node: TdxTreeListNode; Column: TdxTreeListColumn; var AText: String);
    procedure grdTempPosGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdTempPosNeedAdjust(Sender: TObject);
    procedure pcMainDrawTabEx(AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);
    procedure tsTmpPosShow(Sender: TObject);

  private
    function  getSelPos: String;
    procedure GetTaxes;
    procedure colTaxGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTaxRateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);

  protected
    procedure GetSummAll; override;
    procedure RefreshDetail; override;
    procedure SetCurrentID(const Value: integer); override;

  public
    procedure DoOpen(AParam: Variant); override;
    procedure UpdateActionList; override;
    procedure DoCheck(EditRequest: Boolean); override;
    procedure SetCaptions; override;
    procedure DoPrint(AParam: integer = 0); override;
    procedure DoPrintPopup(X, Y: Integer); override;
    procedure NotifyChanged; override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure DoClose; override;
    procedure DoHelp; override;
    procedure SetParam(const Value: Integer); override;
  end;

var
  fmOrders: TfmOrders;

//==============================================================================================
implementation

uses
  BaseFrame, BaseRef, ssDateUtils, EditOrderOut, EditOrderIn,
  ClientData, fMessageDlg, prConst, prFun, ssCallbackConst, xLngManager,
  prRep, ssFun, ssBaseConst, Waybill, EditWaybill, EditOrderTmp,
  EditWaybillOut, EditPayDoc, ssStrUtil, Udebug, xLngDefs;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmOrders.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.DoOpen') else _udebug := nil;{$ENDIF}

  tsMainList.Show;
  _ID_ := 'wbillid';

  case FunID of
    64: begin
          GetTaxes;
          RefType := prTypes.rtOrderOut;
          EditingClass := TfrmEditOrderOut;
          cdsDetailFetch.ProviderName := 'pWaybillDet_GetOutEx';
          aCreateWBIn.Visible := False;
          tsTmpPos.TabVisible := False;
        end;

    65: begin
          RefType := prTypes.rtOrderIn;
          cdsDetailtax.Free;
          EditingClass := TfrmEditOrderIn;
          cdsDetailFetch.ProviderName := 'pWaybillDet_GetIn';
          cdsDetailrsv.FieldKind := fkCalculated;
          aCreateWBOut.Visible := False;
          tsTmpPos.TabVisible := True;
        end;
  end;

  inherited;

  colRsv.Width := 25;
  GrpID := Self.Tag;
  pcMain.Visible := not ModalView;
  Splitter1.Visible := not ModalView;

  if ModalView then panClient.Align := alClient;

  SetCaptions;
  grdMainNeedAdjust(grdMain);

  if RefType = prTypes.rtOrderOut then tsPositions.Show;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.cdsMainBeforeOpen(DataSet: TDataSet);
 var
   m: String;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  if RefType = prTypes.rtOrderIn then begin
    DSRefresh(cdsTempPos, 'posid', 0);

    with grdTempPos do if FocusedNode <> nil then FocusedNode.Selected := True;
  end;

  m := '';
  with cdsMain do begin
    if (lcbKAgent.KeyValue <> lcbKAgent.EmptyValue) and panFilter.Visible
      then m := m + ' and wbl.kaid=' + IntToStr(lcbKAgent.KeyValue);

    case cbChecked.EditValue of
      1: m := m + ' and wbl.checked=0';
      2: m := m + ' and wbl.checked=1';
      3: m := m + ' and wbl.checked=2';
    end;//case
    
    FetchMacros;
    Macros.ParamByName('m').AsString := m;
    FetchParams;
(*if (MultiEntsViewType = 1) and (Self.Tag = -16)
  then Params.ParamByName('in_entid').AsInteger := CurrEnt.KAID
  {else} Params.ParamByName('in_entid').AsInteger := 0;
    *)

    case RefType of
      prTypes.rtOrderIn  : Params.ParamByName('doctype').AsInteger := 16;
      prTypes.rtOrderOut : Params.ParamByName('doctype').AsInteger := -16;
    end;

    if panFilter.Visible
      then Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate
      else Params.ParamByName('fromdate').AsDateTime := MinDateTime;

    if panFilter.Visible
      then Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate)
      else Params.ParamByName('todate').AsDateTime := MaxDateTime;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.RefreshDetail;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.RefreshDetail') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.UpdateActionList') else _udebug := nil;{$ENDIF}

  inherited;

  if not ModalView then begin
    aProperties.Enabled := (grdMain.SelectedCount > 0)
      and (not grdMain.FocusedNode.HasChildren)
      and (VarToInt(grdMain.FocusedNode.Values[colChecked.Index]) = 0);

    aCheck.Enabled := (grdMain.SelectedCount > 0)
      and (VarToInt(grdMain.FocusedNode.Values[colChecked.Index]) = 0);

    aDel.Enabled := aProperties.Enabled;
  end
  else begin
    aNew.Enabled := False;
    aProperties.Enabled := False;
    aCheck.Enabled := False;
    aDel.Enabled := False;
  end;

  aRefresh.Enabled := True;
  aPrint.Enabled := grdMain.SelectedCount > 0;

  aMatInfo.Enabled := not cdsDetail.IsEmpty;
  aMatMove.Enabled := aMatInfo.Enabled;
  aMatRsv.Enabled := aMatInfo.Enabled;
  aMC.Enabled := aMatInfo.Enabled;

  aGotoDoc.Enabled := not cdsRel.IsEmpty;
  aFindAtWH.Enabled := not cdsDetail.IsEmpty;
  aAddPayDoc.Enabled := not cdsMain.IsEmpty;

  aCheck.Visible := False;
  aCreateWBIn.Enabled := aCheck.Enabled;
  aCreateWBOut.Enabled := aCheck.Enabled;
  aDRPrint.Enabled := not cdsRel.IsEmpty;

  UpdateButtonStates;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.DoCheck(EditRequest: Boolean);
  var
    eStr: string;
    WBillID: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.DoCheck') else _udebug := nil;{$ENDIF}

  case RefType of
    prTypes.rtOrderIn:  aCreateWBIn.Execute;
    prTypes.rtOrderOut: aCreateWBOut.Execute;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.SetCaptions;
  var
    FTitle: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    FindList.Clear;
    FindList.AddObject(GetRS('fmWaybill', 'FiltNum') + ';' + 'num', pointer(1));
    FindList.AddObject(GetRS('fmWaybill', 'FiltDate') + ';' + 'ondate', pointer(2));
    FindList.AddObject(GetRS('fmWaybill', 'FiltKAIn') + ';' + 'kaname', pointer(3));
    tsMainList.Caption := GetRS('fmOrders', 'MainList');

    tsInfo.Caption := GetRS('fmOrders', 'Info');
    colRsv.Caption := GetRS('fmWMat', 'Reserved');
    colStatus.Caption := GetRS('fmWaybill', 'DocStatus');
    aCreateWBIn.Caption := GetRS('fmOrders', 'CreateWBIn') + '...';
    aCreateWBOut.Caption := GetRS('fmOrders', 'CreateWBOut') + '...';
    aAddPayDoc.Caption := GetRS('fmOrders', 'AddPayment') + '...';
    aShowNullBallance.Caption := GetRS('fmOrders', 'ShowNullBallance');
    colPosType.Caption := '';
    aCreateAcc.Caption := GetRS('fmOrders', 'CreateAcc');
    aPrintInvoice.Caption := GetRS('fmOrders', 'PrintInvoice');
    aPrintWBOut.Caption := GetRS('fmOrders', 'PrintWBOut');

    case RefType of
      prTypes.rtOrderOut:
        begin
          irKAgent.Caption := GetRS('fmWaybill', 'Client');
          irToDate.Caption := GetRS('fmOrders', 'ShipTill');
          colToDate.Caption := GetRS('fmOrders', 'ShipTill');
          lKAgent.Caption := GetRS('fmWaybill', 'Client');
          colName.Caption := GetRS('fmWaybill', 'Client');
          Self.Caption := GetRS('frmOptions', 'OrdersOut');
          colRsv.Visible := True;
          aAddPayDoc.ImageIndex := II_PDIN;
          cbChecked.Properties.Items[0].Description := GetRS('Common', 'All');
          cbChecked.Properties.Items[2].Description := GetRS('fmOrders', 'Shipped');
          cbChecked.Properties.Items[1].Description := GetRS('fmOrders', 'Actuals');
          cbChecked.Properties.Items[3].Description := GetRS('fmOrders', 'WBCreated');
        end;

      prTypes.rtOrderIn:
        begin
          aPrintInvoice.Enabled := False;
          irKAgent.Caption := GetRS('fmWaybill', 'Supplier');
          irToDate.Caption := GetRS('fmOrders', 'ReceiveTill');
          colToDate.Caption := GetRS('fmOrders', 'ReceiveTill');
          lKAgent.Caption := GetRS('fmWaybill', 'Supplier');
          colName.Caption := GetRS('fmWaybill', 'Supplier');
          colRsv.Visible := False;
          colRsv.Tag := 0;
          aAddPayDoc.ImageIndex := II_PDOUT;
          Self.Caption := GetRS('frmOptions', 'OrdersIn');
          cbChecked.Properties.Items[0].Description := GetRS('Common', 'All');
          cbChecked.Properties.Items[2].Description := GetRS('fmOrders', 'Performed');
          cbChecked.Properties.Items[1].Description := GetRS('fmOrders', 'Actuals');
          cbChecked.Properties.Items[3].Description := GetRS('fmOrders', 'WBCreated');
        end;
    end;

    FTitle := Self.Caption;
    SendMessage(ParentHandle, WM_SETPARENTCAPTION, Integer(@FTitle), 0);
    colTmpMatName.Caption := GetRS('fmWaybill', 'MatName');
    colTmpMatArtikul.Caption := GetRS('fmWaybill', 'Artikul');
    colTmpAmount.Caption := GetRS('fmWaybill', 'Amount');
    colTmpFree.Caption := GetRS('fmWMat', 'Free');
    colTmpRsv.Caption := GetRS('fmWMat', 'Reserved');
    colTmpNotes.Caption := GetRS('fmWaybill', 'Notes');
    colTmpBarCode.Caption := GetRS('fmMaterials', 'BarCode');
    colTmpMsrName.Caption := GetRS('fmWaybill', 'Measure');
    aTmpPosColOptions.Caption := GetRS('Common', 'ColOptions') + '...';

    aTmpAdd.Caption := GetRS('Common', 'Add');
    aTmpProps.Caption := GetRS('Common', 'Properties');
    aTmpDel.Caption := GetRS('Common', 'Del');
    aTmpRefresh.Caption := GetRS('Common', 'Refresh');
    aTmpCreateOrder.Caption := GetRS('fmOrders', 'CreateOrderIn') + '...';
  end; // with langman

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.DoPrint(AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.DoPrint') else _udebug := nil;{$ENDIF}

  inherited;

  case RefType of
    prTypes.rtOrderIn:  xRep.ShowRep(rtOrderIn, cdsMain.FieldByName(_ID_).AsInteger, AParam);
    prTypes.rtOrderOut: xRep.ShowRep(rtOrderOut, cdsMain.FieldByName(_ID_).AsInteger, AParam);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.DoPrintPopup(X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.DoPrintPopup') else _udebug := nil;{$ENDIF}

  inherited;

  pmPrint.Popup(X,Y);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.aPrintAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.aPrintAllExecute') else _udebug := nil;{$ENDIF}

  inherited;

  DoPrint(0);
  //ShowMessage('aPrintAll');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.aPrintWPExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.aPrintWPExecute') else _udebug := nil;{$ENDIF}

  inherited;
  //ShowMessage('aPrintWP');
  DoPrint(1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.colImgGetText') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmOrders.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}
    
  ImgList := dmData.Images;

  case RefType of
    prTypes.rtOrderOut:
      begin
        AText := rs('frmOptions', 'OrdersOut');
        AIndex := II_ORDEROUT;
      end;

    prTypes.rtOrderIn:
      begin
        AText := rs('frmOptions', 'OrdersIn');
        AIndex := II_ORDERIN;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  inherited;

  if cdsMain.FieldByName('todate').IsNull
    then irToDate.Text := ''
    else irToDate.Text := cdsMain.FieldByName('todate').AsString;

  if ModalView and (cdsMain.FieldByName('checked').AsInteger = 0)
    then FCurrentID := cdsMain.FieldByName('wbillid').AsInteger
    else FCurrentID := -1;

  UpdateActionList;  

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.colRsvGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.colRsvGetText') else _udebug := nil;{$ENDIF}


  AText := '-1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.grdDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  ImgList := dmData.Images;

  case RefType of
    prTypes.rtOrderOut:
      begin
        AText := rs('fmWaybill', 'DocOrderOut');
        AIndex := II_ORDEROUT;
      end;

    prTypes.rtOrderIn:
      begin
        AText := rs('fmWaybill', 'DocOrderIn');
        AIndex := II_ORDERIN;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.colStatusGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.colStatusGetText') else _udebug := nil;{$ENDIF}


  case VarToInt(ANode.Values[colChecked.Index]) of
    1: begin
         if RefType = prTypes.rtOrderIn
           then AText := rs('fmOrders', 'Performed')
           else AText := rs('fmOrders', 'Shipped');
       end;

    2: begin
         AText := rs('fmOrders', 'WBCreated');
       end;

    0: begin
         if not VarIsNull(ANode.Values[colToDate.Index])
            and (VarToStr(ANode.Values[colToDate.Index]) <> '')
            and (ANode.Values[colToDate.Index] < Self.OnDate)
         then AText := rs('fmOrders', 'Expired')
         else AText := rs('fmOrders', 'Actual');
       end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.colStatusCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.colStatusCustomDrawCell') else _udebug := nil;{$ENDIF}

  if not ASelected then
    if VarToInt(ANode.Values[colChecked.Index]) = 1 then begin
      AFont.Color := clGreen;
    end
    else begin
      if not VarIsNull(ANode.Values[colToDate.Index])
         and (VarToStr(ANode.Values[colToDate.Index]) <> '')
         and (ANode.Values[colToDate.Index] < Self.OnDate)
        then AFont.Color := clRed
        else if VarToInt(ANode.Values[colChecked.Index]) = 2
          then AFont.Color := clBlue
          else AFont.Color := clWindowText;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  if ModalView and (VarToInt(ANode.Values[colChecked.Index]) <> 0)
    then AFont.Color := clBtnShadow;

  if not ASelected and (VarToFloat(ANode.Values[colDocSaldo.Index]) > 0) then begin
    case RefType of
      prTypes.rtOrderIn:  if OrdersInSelectNP then AColor := CL_OK_OI_NOT_PAID;
      prTypes.rtOrderOut: if OrdersOutSelectNP then AColor := CL_OK_OO_NOT_PAID;
    end;
  end
  else inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.cdsMainCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.cdsMainCalcFields') else _udebug := nil;{$ENDIF}

  DataSet.FieldByName('docsaldo').AsCurrency :=
    DataSet.FieldByName('summall').AsFloat - DataSet.FieldByName('summpay').AsFloat;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtDocs, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.aCreateWBInExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.aCreateWBInExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditWaybill.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmWaybill';
    OnDate := Self.OnDate;
    ID := 0;
    CreateByOrder(Self.cdsMain.FieldByName('wbillid').AsInteger);
    ShowModal;

  finally
    Free;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.grdDetNeedAdjust(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.grdDetNeedAdjust') else _udebug := nil;{$ENDIF}

  grdDet.Adjust(nil, [colRecNo, colPosType, colRsv]);
  GetSummAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  grdMain.Adjust(colName, [colImg, colChecked]);
  grdDetNeedAdjust(grdDet);
  grdTempPosNeedAdjust(grdTempPos);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.cdsTempPosAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.cdsTempPosAfterOpen') else _udebug := nil;{$ENDIF}

  //tsMainList.TabVisible := not DataSet.IsEmpty;
  //bvlMainListTop.Visible := not DataSet.IsEmpty;
  //tsTmpPos.TabVisible := not DataSet.IsEmpty;

  if not DataSet.IsEmpty
    then tsTmpPos.Caption := rs('fmOrders', 'Exec') + '        '
    else tsTmpPos.Caption := rs('fmOrders', 'TempOrder');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.colTmpImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.colTmpImgGetText') else _udebug := nil;{$ENDIF}

  AText := '0';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.pcMainDrawTabEx(AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.pcMainDrawTabEx') else _udebug := nil;{$ENDIF}

  if (ATab.Index = 3) and not cdsTempPos.IsEmpty
    then Font.Style := [fsBold];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.aTmpPosColOptionsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.aTmpPosColOptionsExecute') else _udebug := nil;{$ENDIF}

  grdTempPos.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.grdTempPosGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.grdTempPosGetOptionsTitle') else _udebug := nil;{$ENDIF}

  ImgList := dmData.Images;
  AText := rs('frmOptions', 'OrdersIn');
  AIndex := II_ORDERIN;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.grdTempPosNeedAdjust(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.grdTempPosNeedAdjust') else _udebug := nil;{$ENDIF}

  grdTempPos.Adjust(nil, [colTmpImg]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.aTmpPropsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.aTmpPropsExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditOrderTmp.Create(nil) do
  try
    MainHandle := Self.Handle;
    ID := Self.cdsTempPos.FieldByName('posid').AsInteger;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.grdTempPosDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.grdTempPosDblClick') else _udebug := nil;{$ENDIF}

  aTmpProps.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.DoRefresh(const AID: integer; AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.DoRefresh') else _udebug := nil;{$ENDIF}

  if AParam = -16 then begin
    DSRefresh(cdsTempPos, 'posid', 0);

    with grdTempPos do if FocusedNode <> nil then FocusedNode.Selected := True;
  end
  else inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.aTmpRefreshExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.aTmpRefreshExecute') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsTempPos, 'posid', 0);

  with grdTempPos do if FocusedNode <> nil then FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.aTmpDelExecute(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.aTmpDelExecute') else _udebug := nil;{$ENDIF}

  if ((grdTempPos.SelectedCount = 1)
     and (ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes))
     or ((grdTempPos.SelectedCount > 1) and (mrYes = ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [grdTempPos.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo])))
  then try
    if grdTempPos.SelectedCount > 1 then fProgress.Show;
    Application.ProcessMessages;
    fProgress.Caption := rs('Common', 'Deleting');
    fProgress.UpDate;
    fProgress.pbMain.Max := grdTempPos.SelectedCount;

    for i := 0 to grdTempPos.SelectedCount - 1 do begin
      TrStart;

      try
        if not DeleteDataEx(dmData.SConnection, 'waybilldet', 'posid', grdTempPos.SelectedNodes[i].Values[colTmpPosID.Index])
          then raise Exception.Create('Error!');

        TrCommit;

      except
        on E:Exception do begin
          TrRollback;

          if (grdTempPos.SelectedCount = 1) then begin
            ssMessageDlg(rs('fmOrders', 'DelTmpError') + #10#13 + e.Message, ssmtError, [ssmbOk]);
            {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
            Exit;
          end
          else if mrYes <> ssMessageDlg(Format(rs('Common', 'NoDeleteEx'), [grdTempPos.SelectedNodes[i].Values[colTmpMatName.Index]]), ssmtError, [ssmbYes, ssmbNo])
          then begin
            TrRollback;
            Break;
          end;
        end;
      end;

      fProgress.lText.Caption := '[' + VarToStr(grdTempPos.SelectedNodes[i].Values[colTmpMatName.Index]) + '] ';
      fProgress.pbMain.StepIt;
      Application.ProcessMessages;
    end;

    aRefresh.Execute;
    RefreshFun('TfmWMat', 0);
    UpdateActionList;

  finally
    if fProgress.Visible then fProgress.Hide;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.aTmpAddExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.aTmpAddExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditOrderTmp.Create(nil) do
  try
    MainHandle := Self.Handle;
    ID := 0;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  aTmpProps.Enabled := (grdTempPos.SelectedCount = 1);
  aTmpDel.Enabled := (grdTempPos.SelectedCount > 0);
  aTmpCreateOrder.Enabled := (grdTempPos.SelectedCount > 0);

  case CountryRules.AR of
    accRul_UA: begin
      //aCreateInvoice.Visible := True;
      aPrintInvoice.Visible := True;
    end;

    else begin
      //aCreateInvoice.Visible := False; // UA Tax WB actually
      aPrintInvoice.Visible := False;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.DoClose') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.cdsTempPosBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.cdsTempPosBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsTempPos.Params.ParamByName('ondate').AsDateTime := MaxDateTime;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.grdTempPosCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.grdTempPosCustomDrawCell') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  if (VarToFloat(ANode.Values[colTmpRsv.Index]) > 0) and (AColumn = colTmpRsv)
    then AFont.Color := clRed;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.colTmpFreeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.colTmpFreeGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, RoundToA(StrToFloat(AText) -
      StrToFloat(ANode.Values[colTmpRsv.Index]), MatDisplayDigits));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.grdMainDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  var
    FNode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.grdMainDragOver') else _udebug := nil;{$ENDIF}

  FNode := grdMain.GetNodeAt(X, Y);

  if FNode = nil then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if Source = grdTempPos then Accept := VarToInt(FNode.Values[colChecked.Index]) = 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.grdTempPosGetNodeDragText(Sender: TObject; Node: TdxTreeListNode; Column: TdxTreeListColumn; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.grdTempPosGetNodeDragText') else _udebug := nil;{$ENDIF}

  if grdTempPos.SelectedCount = 1
    then AText := Node.Values[colTmpMatName.Index]
    else AText := IntToStr(grdTempPos.SelectedCount) + ' ' + rs('fmMaterials', 'MatREx');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.grdMainDragDrop(Sender, Source: TObject; X, Y: Integer);
  var
    FNode: TdxTreeListNode;
    i: Integer;
    FCurrID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.grdMainDragDrop') else _udebug := nil;{$ENDIF}

  FNode := grdMain.GetNodeAt(X, Y);

  if FNode = nil then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if Source = grdTempPos then begin
    if mrYes <> ssMessageDlg(Format(rs('fmOrders', 'AddMatsToOrder'), [VarToStr(FNode.Values[colNum.Index]), VarToStr(FNode.Values[colName.Index])]), ssmtWarning, [ssmbYes, ssmbNo])
    then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    with newDataSet do
    try
      ProviderName := 'pOrder_Get';
      FetchParams;
      Params.ParamByName('docid').AsInteger := FNode.Values[colDocID.Index];
      Open;
      FCurrID := FieldByName('currid').AsInteger;

      if IsEmpty or (FieldByName('checked').AsInteger <> 0) then begin
        Close;
        ssMessageDlg(rs('fmOrders', 'CantAddMatsToOrder'), ssmtError, [ssmbOk]);
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;
      Close;

      fProgress.pbMain.Max := grdTempPos.SelectedCount;
      fProgress.Caption := rs('Common', 'Executing');
      fProgress.Show;
      ProviderName := 'pOrder_UpdPosParent';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FNode.Values[colID.Index];
      Params.ParamByName('currid').AsInteger := FCurrID;

      for i := 0 to grdTempPos.SelectedCount - 1 do begin
        fProgress.lText.Caption := VarToStr(grdTempPos.SelectedNodes[i].Values[colTmpMatName.Index]);
        Application.ProcessMessages;
        Params.ParamByName('posid').AsInteger := grdTempPos.SelectedNodes[i].Values[colTmpPosID.Index];
        Execute;
        fProgress.pbMain.StepIt;
        Application.ProcessMessages;
      end;

    finally
      if fProgress.Visible then fProgress.Hide;
      Free;
    end;

    aRefresh.Execute;
    RefreshFun('TfmWMat', 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.aTmpCreateOrderExecute(Sender: TObject);
  var
    FPos: string;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.aTmpCreateOrderExecute') else _udebug := nil;{$ENDIF}

  FPos := '';

  if grdTempPos.SelectedCount = 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  for i := 0 to grdTempPos.SelectedCount - 1 do
    FPos := FPos + VarToStr(grdTempPos.SelectedNodes[i].Values[colTmpPosID.Index]) + ',';

  if FPos <> '' then System.Delete(FPos, Length(FPos), 1);

  with TfrmEditOrderIn.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := Self.Name;
    OnDate := Self.OnDate;
    ID := 0;
    AddTmpPos(FPos);
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.aCreateWBOutExecute(Sender: TObject);
 var
   FPos, FSvc: string;
   i: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.aCreateWBOutExecute') else _udebug := nil;{$ENDIF}

  FPos := ''; FSvc := '';
  DSRefresh(cdsDetail, 'posid', 0);

  GetSummAll;

  if (Sender as TComponent).Tag = 1 then begin
    for i := 0 to grdDet.Count - 1 do
      if grdDet.Items[i].Values[colPosType.Index] = 0
        then FPos := FPos + IntToStr(grdDet.Items[i].Values[colPosID.Index]) + ','
        else FSvc := FSvc + IntToStr(-grdDet.Items[i].Values[colPosID.Index]) + ',';
  end
  else begin
    for i := 0 to grdDet.SelectedCount - 1 do
      if grdDet.SelectedNodes[i].Values[colPosType.Index] = 0
        then FPos := FPos + IntToStr(grdDet.SelectedNodes[i].Values[colPosID.Index]) + ','
        else FSvc := FSvc + IntToStr(-grdDet.SelectedNodes[i].Values[colPosID.Index]) + ',';
  end;

  if FPos <> '' then System.Delete(FPos, Length(FPos), 1);
  if FSvc <> '' then System.Delete(FSvc, Length(FSvc), 1);

  with TfrmEditWaybillOut.Create(nil) do
  try
    WBType := wbtWaybillOut;
    MainHandle := Self.Handle;
    ParentNameEx := 'fmWaybill';
    OnDate := Self.OnDate;
    ID := 0;
    CreateByOrderOut(cdsMain.FieldByName('wbillid').AsInteger, FPos, FSvc);
    ShowModal;

  finally
    Free;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.cbCheckedPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.cbCheckedPropertiesChange') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.colSummInCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.colSummInCurrGetText') else _udebug := nil;{$ENDIF}

  if AText <> '' then AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText)) + ' ' + VarToStr(ANode.Values[colCurrName.Index]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.DoHelp;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.DoHelp') else _udebug := nil;{$ENDIF}

  case RefType of
    prTypes.rtOrderIn:  ShowHelpTopic('fmOrdersIn');
    prTypes.rtOrderOut: ShowHelpTopic('fmOrdersOut');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.tsTmpPosShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.tsTmpPosShow') else _udebug := nil;{$ENDIF}

  ssMessageDlg(rs('fmOrders', 'TmpNote'), ssmtInformation, [ssmbOk], 'TmpOrderNote', True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.SetCurrentID') else _udebug := nil;{$ENDIF}

  if cdsMain.Locate('wbillid', Value, []) then SelectFocusedNode;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.grdMainDblClick') else _udebug := nil;{$ENDIF}

  if ModalView then begin
    if cdsMain.FieldByName('checked').AsInteger = 0 then begin
      FCurrentID := cdsMain.FieldByName('wbillid').AsInteger;
      SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);
    end;
  end
  else inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.SetParam(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.SetParam') else _udebug := nil;{$ENDIF}

  if Value > 0 then begin
    if not cdsKAgent.Active then cdsKAgent.Open;

    lcbKAgent.KeyValue := Value;
    lcbKAgent.Enabled := False;
    btnKagent.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.aAddPayDocExecute(Sender: TObject);
  var
    S: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.aAddPayDocExecute') else _udebug := nil;{$ENDIF}

  if cdsMain.FieldByName('docsaldo').AsCurrency <= 0 then begin
    ssMessageDlg(rs('fmWaybill', 'CantAddPay'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmEditPayDoc.Create(nil) do
  try
    MainHandle := Self.Handle;

    case Self.RefType of
      prTypes.rtOrderIn:
        begin
          GrpID := -1;
          WType := 16;
          S := rs('fmWaybill', 'DocOrderIn');
        end;

      prTypes.rtOrderOut:
        begin
          GrpID := 1;
          WType := -16;
          S := rs('fmWaybill', 'DocOrderOut');
        end;
    end;

    ParentNameEx := 'fmPayDoc';
    ID := 0;
    edTotal.Value := cdsMain.FieldByName('docsaldo').AsCurrency;
    WBillID := Self.cdsMain.FieldByName(_ID_).AsInteger;
    edReason.Text := S + amountPrefix + Self.cdsMain.FieldByName('num').AsString;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.cdsDetailCalcFields(DataSet: TDataSet);
  var
    S, T, TaxID: string;
    i: Integer;
    TaxRate: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.cdsDetailCalcFields') else _udebug := nil;{$ENDIF}

  if Self.RefType = prTypes.rtOrderIn then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with DataSet do begin
    S := FieldByName('tax').AsString;

    if S <> '' then begin
      for i := 1 to WordCount(S, [';']) do begin
        T := ExtractWord(i, S, [';']);
        TaxID := Trim(ExtractWord(1, T, [',']));

        try
          TaxRate := StrToFloat(ReplaceStr(ExtractWord(2, T, [',']), '.', DecimalSeparator));
        except
          TaxRate := 0;
        end;

        if TaxRate > 0 then FieldByName('Tax' + TaxID).AsFloat := TaxRate;
      end;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.colTaxGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.colTaxGetText') else _udebug := nil;{$ENDIF}

  if AText <> '' then AText := AText + '%';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.colTaxRateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.colTaxRateGetText') else _udebug := nil;{$ENDIF}

  if AText <> '' then AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.GetTaxes;
  var
    ACol: TdxDBTreeListColumn;
    FField: TFloatField;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.GetTaxes') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pTaxes_List';
    Open;
    while not Eof do begin
      FField := TFloatField.Create(cdsDetail);
      FField.Name := 'fldTax' + FieldByName('taxid').AsString;
      FField.FieldKind := fkInternalCalc;
      FField.FieldName := 'Tax' + FieldByName('taxid').AsString;
      FField.DataSet := cdsDetail;

      ACol := grdDet.CreateColumnEx(TdxDBGridColumn, grdDet);
      ACol.Name := 'colTax' + FieldByName('taxid').AsString;
      ACol.FieldName := 'Tax' + FieldByName('taxid').AsString;
      ACol.Visible := False;
      ACol.Tag := 1;
      ACol.HeaderAlignment := taCenter;
      ACol.Caption := FieldByName('name').AsString + ', %';
      ACol.Width := 60;
      ACol.OnGetText := colTaxGetText;

      FField := TFloatField.Create(cdsDetail);
      FField.Name := 'fldTaxRate' + FieldByName('taxid').AsString;
      FField.FieldKind := fkInternalCalc;
      FField.FieldName := 'TaxRate' + FieldByName('taxid').AsString;
      FField.DataSet := cdsDetail;

      ACol := grdDet.CreateColumnEx(TdxDBGridColumn, grdDet);
      ACol.Name := 'colTaxRate' + FieldByName('taxid').AsString;
      ACol.FieldName := 'TaxRate' + FieldByName('taxid').AsString;
      ACol.Visible := False;
      ACol.Tag := 1;
      ACol.HeaderAlignment := taCenter;
      ACol.Caption := FieldByName('name').AsString;
      ACol.Width := 60;
      ACol.OnGetText := colTaxRateGetText;

      Next;
    end;

    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.GetSummAll;
  var
    i, j: Integer;
    PriceCurrOutNDS, SummCurrOutNDS, SummCurrNDS, SummCurr,
    PriceDefOutNDS, SummDefOutNDS, SummDefNDS, SummDef, PosSummTax, SummTax: Extended;
    AllSummCurr, AllSummDefOutNDS, AllSummDefNDS, AllSummDef, FAmount :Extended;
    FNorm: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.GetSummAll') else _udebug := nil;{$ENDIF}

  if Self.RefType = prTypes.rtOrderIn then begin
    inherited;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with grdDet do begin
    AllSummCurr := 0;
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;

    for i := 0 to Count - 1 do begin
      FAmount := 0;
      
      try
        FAmount := ssStrToFloat(Items[i].Values[colAmount.Index]);

        if cdsDetail.FindField('onvalue') <> nil then FCurrRate := ssStrToFloat(Items[i].Values[colRate.Index]);

        FNorm := 0;

        try
          if not VarIsNull(Items[i].Values[colNorm.Index]) and (Items[i].Values[colNorm.Index] <> '')
            then FNorm := ssStrToFloat(Items[i].Values[colNorm.Index])
            else FNorm := 1;

        except
          FNorm := 0;
        end;

        if FNorm > 0 then FAmount := FNorm * FAmount;

        SummCurr := RoundToA(FAmount * ssStrTofloat(Items[i].Values[colPriceInCurr.Index]), -2);

        NDSCalc(FAmount, ssStrTofloat(Items[i].Values[colPriceInCurr.Index]), ssstrtofloat(Items[i].Values[colNDS.Index]), 1,
                SummDefOutNDS, SummDefNDS);

        SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
        SummDefOutNDS := SummDef - RoundToA(SummDefNDS, -2);
        PosSummTax := 0;

        for j := 0 to ColumnCount - 1 do begin
          if (Pos('colTax', Columns[j].Name) > 0) and (Pos('colTaxRate', Columns[j].Name) = 0) and (not VarIsNull(Items[i].Values[j]))
          then begin
            SummTax := RoundToA(SummDefOutNDS * ssStrToFloat(Items[i].Values[j]) / 100, -2);
            PosSummTax := PosSummTax + SummTax;
          end;
        end;

        Items[i].Values[colSummCurr.Index] := SummCurr + PosSummTax;
        AllSummCurr := AllSummCurr + SummCurr + PosSummTax;
        
      except
        Items[i].Values[colSummCurr.Index] := 0;
      end;

      try
        if FCurrRate > 0 then begin
          NDSCalc(FAmount, ssStrTofloat(Items[i].Values[colPriceInCurr.Index]) * FCurrRate,
                  ssStrTofloat(Items[i].Values[colNDS.Index]), 1, SummDefOutNDS, SummDefNDS);

          SummDef := RoundToA(SummDefNDS + SummDefOutNDS, -2);
          SummDefOutNDS := SummDef - RoundToA(SummDefNDS, -2);

          PosSummTax := 0;
          for j := 0 to ColumnCount - 1 do begin
            if (Pos('colTax', Columns[j].Name) > 0) and (Pos('colTaxRate', Columns[j].Name) = 0) and (not VarIsNull(Items[i].Values[j]))
            then begin
              SummTax := RoundToA(SummDefOutNDS * ssStrToFloat(Items[i].Values[j]) / 100, -2);
              Items[i].Values[ColumnByName('colTaxRate' + Copy(Columns[j].Name, 7, Length(Columns[j].Name) - 6)).Index] := SummTax;
              PosSummTax := PosSummTax + SummTax;
            end;
          end;

          SummDef := SummDef + PosSummTax;

          AllSummDefOutNDS := AllSummDefOutNDS + SummDefOutNDS;
          AllSummDefNDS := AllSummDefNDS + RoundToA(SummDefNDS, -2);
          AllSummDef := AllSummDef + SummDef;
          Items[i].Values[colSummDef.Index] := SummDef;
          Items[i].Values[colSummDefWONDS.Index] := SummDef - RoundToA(SummDefNDS, -2);
          Items[i].Values[colDetNDS.Index] := RoundToA(SummDefNDS, -2);

          NDSCalc(1, ssStrTofloat(Items[i].Values[colPriceInCurr.Index]) * FCurrRate,
                  ssStrTofloat(Items[i].Values[colNDS.Index]), 1, SummDefOutNDS, SummDefNDS);

          Items[i].Values[colPrice.Index] := RoundToA(SummDefOutNDS + SummDefNDS, -2);
          Items[i].Values[colPriceWONDS.Index] := RoundToA(SummDefOutNDS + SummDefNDS, -2) - RoundToA(SummDefNDS, -2);
         end
         else Items[i].Values[colSummDef.Index] := 0;

      except
        Items[i].Values[colSummDef.Index] := 0;
      end;
    end;

    AllSummDef := RoundToA(AllSummDef, -2);

    stSummCurr.Caption := FormatFloat(MoneyDisplayFormat, AllSummCurr);
    stSummDefNoNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefOutNDS);
    stSummDefNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefNDS);
    stSummDef.Caption := FormatFloat(MoneyDisplayFormat, AllSummDef);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOrders.aCreateAccExecute(Sender: TObject);
  var
    FPos: string;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOrders.aCreateAccExecute') else _udebug := nil;{$ENDIF}

  if grdDet.Count = 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  FPos := '';
  for i := 0 to grdDet.Count - 1 do
    FPos := FPos + VarToStr(grdDet.Items[i].Values[colPosID.Index]) + ',';

  if FPos <> '' then System.Delete(FPos, Length(FPos), 1);

  with TfrmEditAccOut.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmOrders';
    OnDate := Self.OnDate;
    ID := 0;
    edKAgent.KAID := cdsMain.FieldValues['kaid'];
    AddMats(FPos);
    ShowModal;
    
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmOrders.getSelPos: String;
  var i: integer;
begin
  Result := '';

  for i := 0 to grdDet.SelectedCount - 1 do
    Result := Result + VarToStr(grdDet.SelectedNodes[i].Values[colPosID.Index]) + ',';
end;

//==============================================================================================
procedure TfmOrders.aPrintInvoiceExecute(Sender: TObject);
begin
  if grdDet.Focused // show only selected positions?
    then xRep.ShowRep(rtAccOut, cdsMain.FieldByName(_ID_).AsInteger, 0, 0, getSelPos)
    else xRep.ShowRep(rtAccOut, cdsMain.FieldByName(_ID_).AsInteger);
end;

//==============================================================================================
procedure TfmOrders.aPrintWBOutExecute(Sender: TObject);
begin
  if grdDet.Focused // show only selected positions?
    then xRep.ShowRep(rtWBOut, cdsMain.FieldByName(_ID_).AsInteger, 0, 0, getSelPos)
    else xRep.ShowRep(rtWBOut, cdsMain.FieldByName(_ID_).AsInteger);
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fOrders', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
