{$I ok_sklad.inc}
unit EditOrderTmpOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner6, dxEditor6, StdCtrls, ssBaseConst, ssBaseDlg,
  cxMemo, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalc, ssCalcEdit, okSearchEdit, ssLabel, ssBevel,
  ActnList, ssFormStorage, ImgList, xButton, ssPanel, ssGradientPanel,
  ssBaseTypes, cxCheckBox, cxLookAndFeelPainters, cxButtons, ssSpeedButton,
  dxDBGrid6, dxTL6, dxDBCtrl6, dxDBTLCl6, dxGrClms6, ssDBGrid, DB,
  DBClient, ssClientDataSet, Menus, TB2Item, cxCalendar, cxPC, ssMemDS,
  prTypes, Grids, DBGrids;

type
  TfrmEditOrderTmpOut = class(TBaseDlg)
    aAddTmpOrder: TAction;
    aDelPos: TAction;
    aHide: TAction;
    aMatInfo: TAction;
    aMatMove: TAction;
    aMatRsv: TAction;
    btnInfo: TssSpeedButton;
    btnMove: TssSpeedButton;
    btnPartysSelect: TssSpeedButton;
    btnRsv: TssSpeedButton;
    bvlMain: TssBevel;
    bvlPriceInterval: TssBevel;
    cbSelectType: TcxComboBox;
    cdsDetail: TssClientDataSet;
    cdsDetailAMOUNT: TFloatField;
    cdsDetailARTIKUL: TStringField;
    cdsDetailBARCODE: TStringField;
    cdsDetailGRPID: TIntegerField;
    cdsDetailMATID: TIntegerField;
    cdsDetailMATNAME: TStringField;
    cdsDetailMSRNAME: TStringField;
    cdsDetailNDS: TFloatField;
    cdsDetailONVALUE: TFloatField;
    cdsDetailPOSID: TIntegerField;
    cdsDetailPOSTYPE: TIntegerField;
    cdsDetailPRICE: TFloatField;
    cdsDetailpricedef: TFloatField;
    cdsDetailrecno: TIntegerField;
    cdsDetailrsv: TIntegerField;
    cdsDetailsummdef2: TFloatField;
    cdsDetailWBILLID: TIntegerField;
    cdsDetailWHNAME: TStringField;
    cdsDetailWID: TIntegerField;
    cdsOrdered: TssClientDataSet;
    cdsOrderedcertnum: TStringField;
    cdsOrderedCURRID: TIntegerField;
    cdsOrderedDOCID: TIntegerField;
    cdsOrderedDOCNUM: TStringField;
    cdsOrderedkaname: TStringField;
    cdsOrderedNAME: TStringField;
    cdsOrderednotes: TStringField;
    cdsOrderedONDATE: TDateTimeField;
    cdsOrderedONVALUE: TFloatField;
    cdsOrderedORDERED: TFloatField;
    cdsOrderedposdate: TDateTimeField;
    cdsOrderedPOSID: TIntegerField;
    cdsOrderedPRICE: TFloatField;
    cdsOrderedREMAIN: TFloatField;
    cdsOrderedreserved: TFloatField;
    cdsOrderedRSV: TFloatField;
    cdsOrderedSHORTNAME: TStringField;
    cdsOrderedTODATE: TDateTimeField;
    cdsOrderedWBILLID: TIntegerField;
    cdsOrderedWID: TIntegerField;
    cdsOrderedWTYPE: TIntegerField;
    cdsView: TssClientDataSet;
    chbAddToTmpOrder: TcxCheckBox;
    chbRsv: TcxCheckBox;
    colAmount: TdxDBGridColumn;
    colArtikul: TdxDBGridColumn;
    colBarCode: TdxDBGridColumn;
    colChecked: TdxDBGridImageColumn;
    colCurrency: TdxDBGridColumn;
    colDocType: TdxDBGridImageColumn;
    colID: TdxDBGridColumn;
    colKAgent: TdxDBGridColumn;
    colMatId: TdxDBGridColumn;
    colMatName: TdxDBGridColumn;
    colMeasure: TdxDBGridColumn;
    colMeasureName: TdxDBGridColumn;
    colNCurrency: TdxDBGridColumn;
    colNDS: TdxDBGridColumn;
    colNDSRate: TdxDBGridColumn;
    colNPrice: TdxDBGridColumn;
    colNum: TdxDBGridColumn;
    colOAmount: TdxDBGridColumn;
    colOArtikul: TdxDBGridColumn;
    colOMatName: TdxDBGridColumn;
    colOnDate: TdxDBGridColumn;
    colOnValue: TdxDBGridColumn;
    colOWID: TdxDBGridColumn;
    colPosId: TdxDBGridColumn;
    colPosType: TdxDBGridImageColumn;
    colPrice: TdxDBGridColumn;
    colPriceWONDS: TdxDBGridColumn;
    colProducer: TdxDBGridColumn;
    colRate: TdxDBGridColumn;
    colRecNo: TdxDBGridColumn;
    colSerial: TdxDBGridColumn;
    colStatus: TdxDBGridImageColumn;
    colType: TdxDBGridColumn;
    colWHouse: TdxDBGridColumn;
    colWHouseName: TdxDBGridColumn;
    colWId: TdxDBGridColumn;
    dsmdRsv: TDataSource;
    edAmount: TssCalcEdit;
    edDate: TcxDateEdit;
    edKAgent: TokKASearchEdit;
    edMat: TokMatSearchEdit;
    edNum: TokOrderSearchEdit;
    FloatField1: TFloatField;
    grdDet: TssDBGrid;
    grdOrdered: TssDBGrid;
    IntegerField3: TIntegerField;
    lAmount: TssLabel;
    lcbWH: TokWHouseSearchEdit;
    lDate: TssLabel;
    lMatEx: TLabel;
    lType: TssLabel;
    mdPosition: TssMemoryData;
    mdPositionamount: TFloatField;
    mdPositioncertdate: TDateTimeField;
    mdPositioncertnum: TStringField;
    mdPositioncurrid: TIntegerField;
    mdPositioncurrname: TStringField;
    mdPositionDiscount: TFloatField;
    mdPositiondocdate: TDateTimeField;
    mdPositiondocnum: TStringField;
    mdPositiondocnumtxt: TStringField;
    mdPositiongtd: TStringField;
    mdPositionmatid: TIntegerField;
    mdPositionNDS: TFloatField;
    mdPositionondate: TDateTimeField;
    mdPositiononvalue: TFloatField;
    mdPositionposid: TIntegerField;
    mdPositionpostype: TIntegerField;
    mdPositionprice: TFloatField;
    mdPositionpricetxt: TStringField;
    mdPositionproducer: TStringField;
    mdPositionSN: TStringField;
    mdPositionwbillid: TIntegerField;
    mdPositionwhname: TStringField;
    mdPositionwid: TIntegerField;
    mdPositionwtype: TIntegerField;
    mdRsv: TssMemoryData;
    mdRsvpostype: TIntegerField;
    mdRsvpricein: TFloatField;
    mdRsvSN: TStringField;
    pcMain: TcxPageControl;
    pmMain: TTBPopupMenu;
    srcDetail: TDataSource;
    srcOrdered: TDataSource;
    srcPosition: TDataSource;
    srcView: TDataSource;
    stMeasureName: TssBevel;
    TBItem1: TTBItem;
    tsOrder: TcxTabSheet;
    tsOrdered: TcxTabSheet;

    procedure aAddTmpOrderExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aDelPosExecute(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure aMatInfoExecute(Sender: TObject);
    procedure aMatMoveExecute(Sender: TObject);
    procedure aMatRsvExecute(Sender: TObject);
    procedure btnPartysSelectClick(Sender: TObject);
    procedure cbSelectTypePropertiesEditValueChanged(Sender: TObject);
    procedure cdsDetailBeforeOpen(DataSet: TDataSet);
    procedure cdsOrderedBeforeOpen(DataSet: TDataSet);
    procedure cdsViewBeforeOpen(DataSet: TDataSet);
    procedure chbRsvClick(Sender: TObject);
    procedure colPosTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colStatusGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure DataModified(Sender: TObject);
    procedure edAmountPropertiesChange(Sender: TObject);
    procedure edKAgentChange(Sender: TObject);
    procedure edMatChange(Sender: TObject);
    procedure edMatRefButtonClick(Sender: TObject);
    procedure edNumChange(Sender: TObject);
    procedure edNumEditorChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdOrderedCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdOrderedDblClick(Sender: TObject);
    procedure lcbWHChange(Sender: TObject);
    procedure mdPositionCalcFields(DataSet: TDataSet);
    procedure pcMainChange(Sender: TObject);

  private
    FAccID: Integer;
    FAValue: Extended;
    FKAID: Integer;
    FRemain, FAmount: Extended;

    function GetMatID: Integer;
    procedure SetAccID(const Value: Integer);
    procedure SetKAID(const Value: Integer);
    procedure SetMatID(const Value: Integer);
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMSetText(var M: TMessage); message WM_SETTEXT;

  protected
    function DatesAreCorrect: Boolean;
    procedure RealignGrid;
    procedure RefreshDetail;
    procedure setid(const Value: integer); override;
    procedure SetOnDate(const Value: TDateTime); override;
    procedure SetParentName(const Value: string); override;

  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
    procedure DoHelp; override;

    property MatID: Integer read GetMatID write SetMatID;
    property KAID: Integer read FKAID write SetKAID;
    property AccID: Integer read FAccID write SetAccID;
  end;

var
  frmEditOrderTmpOut: TfrmEditOrderTmpOut;

implementation

uses
  prConst, ClientData, prFun, ssCallbackConst, xLngManager, ssFun, TmpOrderInfo, fMessageDlg,
  PartySelect, MatMove, MatRsv, EditMaterials, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmEditOrderTmpOut.setid(const Value: integer);
  var
    FCurrNum: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.setid') else _udebug := nil;{$ENDIF}

  if not IsPattern then FID := Value;

  with newDataSet do
  try
    if edNum.EditMode then
      if OrdersOutAutoNum then begin
        FCurrNum := GetDocNum(dmData.SConnection, dtOrderOut, 1);
        edNum.Editor.Text := OrdersOutPrefix + IntToStr(FCurrNum) + OrdersOutSuffix;
      end
      else edNum.Editor.Text := '';

    if Value <> 0 then begin
      if not IsPattern
        then Self.Caption := dmData.Lng.GetRS('fmOrders', 'TmpEdit')
        else Self.Caption := dmData.Lng.GetRS('fmOrders', 'TmpNew');

      {ProviderName := 'pWaybillDet_Pos';
      FetchParams;
      Params.ParamByName('posid').AsInteger := Value;
      Open;
      if not IsEmpty then begin
        edMat.MatID := FieldByName('matid').AsInteger;
        lcbWH.WID := FieldByName('wid').AsInteger;
        edAmount.Value := FieldByName('amount').AsFloat;
        edNotes.Text := FieldByName('notes').AsString;
      end;
      Close;
      }

      if not IsPattern then btnApply.Enabled := False;

      //edMat.Enabled := False;
      //lcbWH.Enabled := False;
    end
    else Self.Caption := dmData.Lng.GetRS('fmOrders', 'TmpOutNew');

    edAmount.Tag := 1;
    edAmount.Value := WBOutDefAmount;
    edAmount.Tag := 0;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  NewRecord: boolean;
  FWBillID: Integer;
  PosInfo: TPosInfo;
  FPosID: Integer;
  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    with newDataSet do
    try
      if chbAddToTmpOrder.Checked and edMat.IsSerial then begin
        ssMessageDlg(LangMan.GetRS('fmOrders', 'SNNotSupported'), ssmtError, [ssmbOk]);
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

      TrStart;

      try
        NewRecord := (ID = 0);

        FWBillID := edNum.Obj.WBillID;

        if NewRecord then begin
          FID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');

          if edNum.EditMode then begin
            FWBillID := GetMaxID(dmData.SConnection, 'waybilllist', 'wbillid');
            ProviderName := 'pWaybill_InsSS';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FWBillID;
            Params.ParamByName('num').AsString := edNum.Editor.EditingText;
            Params.ParamByName('ondate').AsDateTime := Int(edDate.Date) + Time;
            Params.ParamByName('checked').AsInteger := 0;
            Params.ParamByName('deleted').AsInteger := 0;
            Params.ParamByName('defnum').AsInteger := 0;
            Params.ParamByName('wtype').AsInteger := -16;
            Params.ParamByName('currid').AsInteger := BaseCurrID;
            Params.ParamByName('onvalue').AsFloat := 1;
            Params.ParamByName('kaid').AsInteger := edKAgent.KAID;
            Execute;
          end;
        end;

        ProviderName := 'pWaybillDet_InsSS';
        FetchParams;
        Params.ParamByName('posid').AsInteger := FID;
        Params.ParamByName('matid').AsInteger := edMat.MatID;
        Params.ParamByName('wbillid').AsInteger := FWBillID;
        Params.ParamByName('num').AsInteger := FID;
        Params.ParamByName('wid').AsInteger := lcbWH.WID;
        Params.ParamByName('amount').AsFloat := StrToFloat(edAmount.EditText);
        Params.ParamByName('nds').AsFloat := edMat.NDS;
        Params.ParamByName('ondate').AsDateTime := Now;
        Params.ParamByName('price').AsFloat := 0;
        Params.ParamByName('discount').AsFloat := 0;
        Params.ParamByName('currid').AsInteger := BaseCurrID;
        Params.ParamByName('onvalue').AsFloat := 1;
        Execute;

        if chbRsv.Checked then begin
          ProviderName := 'pWMatTurnOut_Ins';
          FetchParams;
          Params.ParamByName('posid').AsInteger := mdRsv.FieldByName('posid').AsInteger;
          Params.ParamByName('matid').AsInteger := edMat.MatID;
          Params.ParamByName('wid').AsInteger := lcbWH.WID;
          Params.ParamByName('sourceid').AsInteger := FID;
          Params.ParamByName('turntype').AsInteger := 2;
          Params.ParamByName('ondate').AsDateTime := edDate.Date;
          Params.ParamByName('amount').AsFloat := mdRsv.FieldByName('amount').AsInteger;
          Execute;
        end;

        if chbAddToTmpOrder.Checked then begin
          ProviderName := 'pWaybill_Get';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := -16;
          Open;
          if IsEmpty then begin
            Close;
            ProviderName := 'pWaybill_InsS';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := -16;
            Params.ParamByName('num').AsString := 'System';
            Params.ParamByName('ondate').AsDateTime := Date;
            Params.ParamByName('checked').AsInteger := 0;
            Params.ParamByName('deleted').AsInteger := 1;
            Params.ParamByName('defnum').AsInteger := 0;
            Params.ParamByName('wtype').AsInteger := 16;
            Execute;
          end;
          Close;

          ProviderName := 'pWaybillDet_InsS';
          FetchParams;
          FPosID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
          Params.ParamByName('posid').AsInteger := FPosID;
          Params.ParamByName('matid').AsInteger := edMat.MatID;
          Params.ParamByName('wbillid').AsInteger := -16;
          Params.ParamByName('num').AsInteger := FID;
          Params.ParamByName('wid').AsInteger := lcbWH.WID;
          Params.ParamByName('amount').AsFloat := StrToFloat(edAmount.EditText);
          Params.ParamByName('nds').AsFloat := edMat.NDS;
          Params.ParamByName('ondate').AsDateTime := Now;
          Execute;

          ProviderName := 'pWaybillDetAP_InsS';
          FetchParams;
          Params.ParamByName('posid').AsInteger := FPosID;
          Params.ParamByName('notes').AsString := Format(LangMan.GetRS('fmOrders', 'TmpOrderNote'), [edNum.Editor.Text, edKAgent.Obj.NameEx]);
          Params.ParamByName('certnum').AsString := UserFullName;
          Execute;

          ProviderName := 'pWMatTurnOut_Ins';
          FetchParams;
          Params.ParamByName('posid').AsInteger := FPosID;
          Params.ParamByName('matid').AsInteger := edMat.MatID;
          Params.ParamByName('wid').AsInteger := lcbWH.WID;
          Params.ParamByName('sourceid').AsInteger := FPosID;
          Params.ParamByName('turntype').AsInteger := 3;
          Params.ParamByName('ondate').AsDateTime := Now;
          Params.ParamByName('amount').AsFloat := RoundToA(StrToFloat(edAmount.EditText), MatDisplayDigits);
          Execute;

          ProviderName := 'pWMatTurnOut_Ins';
          FetchParams;
          Params.ParamByName('posid').AsInteger := FPosID;
          Params.ParamByName('matid').AsInteger := edMat.MatID;
          Params.ParamByName('wid').AsInteger := lcbWH.WID;
          Params.ParamByName('sourceid').AsInteger := FID;
          Params.ParamByName('turntype').AsInteger := 2;
          Params.ParamByName('ondate').AsDateTime := edDate.Date;
          Params.ParamByName('amount').AsFloat := RoundToA(StrToFloat(edAmount.EditText), MatDisplayDigits);
          Execute;
        end;
        TrCommit;

        SendMessage(MainHandle, WM_REFRESH, FWBillID, -17);
        RefreshFun('TfmOrders', -16);
        RefreshFun('TfmOrders', 16);
        RefreshFun('TfmWMat', 0);

        if (ModalResult = mrYes) then begin
          if NewRecord then begin
            edMat.MatID := 0;
            edMat.Editor.SetFocus;
            edAmount.Value := WBOutDefAmount;
            AccID := FWBillID;
            FID := 0;
          end
        end
        else CanClose := True;

        FModified := False;

      finally
        Free;
      end;

    except
      on e:exception do begin
        TrRollback;
        MessageDlg(e.Message, mtError, [mbOk], 0);
      end;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := (edMat.MatID > 0) and (lcbWH.WID > 0) and (FAValue > 0) and FModified
    and (Trim(edNum.Editor.EditingText) <> '')
    and ((edNum.Obj.WBillID > 0) or (cbSelectType.ItemIndex = 0)) and (edKAgent.KAID > 0) and DatesAreCorrect
    and ((chbRsv.Checked and btnPartysSelect.Enabled) or not chbRsv.Checked);

  aApply.Enabled := aOk.Enabled;

  btnPartysSelect.Enabled := mdPosition.Active and not mdPosition.IsEmpty and edAmount.Enabled and chbRsv.Checked and (FRemain >= FAmount);

  aDelPos.Enabled := not cdsDetail.IsEmpty;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.DataModified(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with dmData.Lng do begin
    edMat.InitRes;
    edMat.SearchNames[0] := GetRS('fmInventory', 'NameShort') + ';name';
    if edMat.CurrentSearchIndex = 0
      then edMat.Caption.Caption := GetRS('fmInventory', 'NameShort') + ':';

    edKAgent.InitRes;
    if edKAgent.CurrentSearchIndex = 0
      then edKAgent.Caption.Caption := GetRS('fmWaybill', 'Client') + ':';

    lcbWH.InitRes;
    aAddTmpOrder.Caption := GetRS('fmOrders', 'AddOrderIn');
    //colDocNum.Caption := GetRS('fmWMat', 'OrderNo');
    //colToDate.Caption := GetRS('fmWMat', 'OrderToDate');
    //colTmpAmount.Caption := GetRS('fmWMat', 'Free');
    //colTmpImg.Caption := '';
    btnInfo.Hint := GetRS('fmOrders', 'PosInfo');
    //aInfo.Caption := GetRS('fmOrders', 'PosInfo');
    colNum.Caption := GetRS('fmOrders', 'OrderNum');
    colOnDate.Caption := GetRS('fmWMat', 'Date');
    colOMatName.Caption := GetRS('fmWaybill', 'MatName');
    colOArtikul.Caption := GetRS('fmWaybill', 'Artikul');
    colOAmount.Caption := GetRS('fmWaybill', 'Amount');
    colMeasure.Caption := GetRS('fmWaybill', 'Measure');

    btnPartysSelect.Hint := GetRS('fmWaybill', 'Partys');

    //colOrdFree.Caption := GetRS('fmWMat', 'Free');
    //colOrdRsv.Caption := GetRS('fmWMat', 'Reserved');

    lAmount.Caption := GetRS('fmWaybill', 'Amount') + ':';
    //lNotes.Caption := GetRS('fmWaybill', 'Notes') + ':';
    aHide.Caption := GetRS('fmOrders', 'ShowOrders') + ' (' + ShortCutToText(aHide.ShortCut) + ')';
    aDelPos.Caption := GetRS('Common', 'Del');
    chbAddToTmpOrder.Properties.Caption := GetRS('fmOrders', 'AddPosToTmpOrder');

    with cbSelectType do begin
      Properties.Items.Clear;
      Properties.Items.Add(GetRS('fmOrders', 'OrderNew'));
      Properties.Items.Add(GetRS('fmOrders', 'OrderSelect'));
      ItemIndex := 0;
    end;

    colRecNo.Caption := GetRS('fmWaybill', 'NumEx');
    colPosType.Caption := '';
    colMatName.Caption := GetRS('fmWaybill', 'MatNameFull');
    colMeasureName.Caption := GetRS('fmWaybill', 'Measure');
    colAmount.Caption := GetRS('fmWaybill', 'Amount');
    colStatus.Caption := GetRS('fmWMat', 'Reserved');

    tsOrder.Caption := GetRS('fmOrders', 'Order') + ' ';
    tsOrdered.Caption := GetRS('fmOrders', 'OrderedMatsByKA') + ' ';

    btnRsv.Hint := GetRS('fmWaybill', 'RsvInfo');
    btnMove.Hint := GetRS('fmWaybill', 'MoveInfo');
    btnInfo.Hint := GetRS('fmWaybill', 'MatInfo');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  SetCaptions;
  lcbWH.RefreshItemsDS;

  edMat.LoadFromRegistry(MainRegKey + '\' + Self.Name + '\' + edMat.Name);
  //RealignGrid;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.WMSetText(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.WMSetText') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.edMatChange(Sender: TObject);
  var
    FWMT: TssMemoryData;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.edMatChange') else _udebug := nil;{$ENDIF}

  stMeasureName.Caption := edMat.Measure;
  DataModified(Self);

  GetMatRestsByKAorWID(dmData.SConnection, edMat.MatID, 0, lcbWH.WID, MaxDateTime, Integer(mdPosition));

  if not mdPosition.IsEmpty then begin
    case ChargeType of
      ctFIFO: mdPosition.SortOnFields('ondate');
      ctLIFO: mdPosition.SortOnFields('ondate', True, True);
    end;

    mdPosition.First;
  end;
  FRemain := GetDSSumm(mdPosition, 'amount');
  edAmountPropertiesChange(nil);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.edAmountPropertiesChange(Sender: TObject);
  var
    TmpRemain, TmpSumm, SummAmount: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.edAmountPropertiesChange') else _udebug := nil;{$ENDIF}

  try
    FAValue := StrToFloat(edAmount.EditingText);
  except
    FAValue := 0;
  end;

  FAmount := FAValue;
  DataModified(Self);

  TmpRemain := 0;
  TmpSumm := 0;
  SummAmount := 0;
  if chbRsv.Checked then begin
    if edAmount.Tag = 0 then begin
      //Резерв позиций
      try
        TmpRemain := StrToFloat(edAmount.EditingText);
        mdRsv.Close;
        mdRsv.Open;
        with mdPosition do begin
          First;
          while not Eof and (TmpRemain > 0) do begin
            if (TmpRemain <= StrToFloat(fieldbyname('amount').AsString))
               and (StrToFloat(FieldByName('amount').AsString) > 0) then begin
              mdRsv.Append;
              mdRsv.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
              mdRsv.FieldByName('pricein').AsFloat := StrToFloat(FieldByName('price').AsString);
              mdRsv.FieldByName('amount').AsFloat := TmpRemain;
              SummAmount := SummAmount + TmpRemain;
              TmpSumm := TmpSumm + (TmpRemain * StrToFloat(FieldByName('price').AsString));

              if not FieldByName('SN').IsNull then mdRsv.FieldByName('SN').AsString := FieldByName('SN').AsString;

              mdRsv.Post;
            end
            else if StrToFloat(FieldByName('amount').AsString) > 0 then begin
              mdRsv.Append;
              mdRsv.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
              mdRsv.FieldByName('pricein').AsFloat := StrToFloat(FieldByName('price').AsString);
              mdRsv.FieldByName('amount').AsFloat := StrToFloat(FieldByName('amount').AsString);
              SummAmount := SummAmount + StrToFloat(FieldByName('amount').AsString);
              TmpSumm := TmpSumm + (StrToFloat(FieldByName('amount').AsString) * StrToFloat(FieldByName('price').AsString));

              if not FieldByName('SN').IsNull then mdRsv.FieldByName('SN').AsString := FieldByName('SN').AsString;

              mdRsv.Post;
            end;

            TmpRemain := TmpRemain - FieldByName('amount').AsFloat;

            Next;
          end;//while
        end;//with

      except
        mdRsv.Close;
      end;
    end;//if edAmount.Tag=0
  end//if chbRsv.Checked then begin
  else begin
    mdRsv.Close;
    mdRsv.Open;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.lcbWHChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.lcbWHChange') else _udebug := nil;{$ENDIF}

  DataModified(Self);

  if (lcbWH.WID > 0) and (edMat.MatID > 0) then edMatChange(edMat);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditOrderTmpOut.GetMatID: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.GetMatID') else _udebug := nil;{$ENDIF}

  Result := edMat.MatID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.SetMatID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.SetMatID') else _udebug := nil;{$ENDIF}

  edMat.MatID := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.edMatRefButtonClick(Sender: TObject);
  var
    AID: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.edMatRefButtonClick') else _udebug := nil;{$ENDIF}

  if not chbRsv.Checked then begin
    try aid := edMat.MatID; except aid := 0; end;
    ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, aid);
  end
  else begin
    ShowModalRef(Self, rtWMat, vtWMat, 'TfmWMat', Now, integer(mdPosition), -edMat.MatID);
  end;

  {try
    AID := edMat.MatID;
  except
    AID := 0;
  end;

  edMat.Editor.SetFocus;
  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, AID);
  }

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtMat:
      edMat.MatID := M.WParam;

    rtWMat:
      begin
        Application.ProcessMessages;
        lcbWH.WID := PPosInfo(M.WParam)^.WID;
        edMat.MatID := PPosInfo(M.WParam)^.MatID;
        if (PPosInfo(M.WParam)^.PosID > 0) and mdPosition.Locate('posid', PPosInfo(M.WParam)^.PosID, [])
        then begin
          mdRsv.Close;
          mdRsv.Open;
          mdRsv.Append;
          mdRsv.FieldByName('posid').AsInteger:=mdPosition.FieldByName('posid').AsInteger;
          mdRsv.FieldByName('postype').AsInteger := -mdPosition.FieldByName('postype').AsInteger;
          mdRsv.FieldByName('pricein').AsFloat:=strtofloat(mdPosition.FieldByName('price').AsString);

          if RoundToA(edAmount.Value, MatDisplayDigits)>RoundToA(mdPosition.FieldByName('amount').AsFloat,MatDisplayDigits) then begin
            mdRsv.FieldByName('amount').AsFloat:=mdPosition.FieldByName('amount').AsFloat;
            edAmount.Tag := 1;
            edAmount.Value := mdRsv.FieldByName('amount').AsFloat;
            edAmount.Tag := 0;
          end//if
          else mdRsv.FieldByName('amount').AsFloat:=RoundToA(edAmount.Value, MatDisplayDigits);

          if not mdPosition.FieldByName('SN').IsNull then mdRsv.FieldByName('SN').AsString:=mdPosition.FieldByName('SN').AsString;

          mdRsv.Post;
        end;//if
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.RealignGrid;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.RealignGrid') else _udebug := nil;{$ENDIF}

  if not btnHide.Checked
    then Self.ClientHeight := panMain.Top + btnHide.Top + btnHide.Height + panButtons.Height + 10
    else Self.ClientHeight := panMain.Top + panButtons.Height + 8 + grdOrdered.Top + grdOrdered.Height + 10;

  grdOrdered.Visible := btnHide.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.cdsOrderedBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.cdsOrderedBeforeOpen') else _udebug := nil;{$ENDIF}

  with (DataSet as TssClientDataSet) do begin
    Params.ParamByName('matid').AsInteger := edMat.MatID;
    Params.ParamByName('getempty').AsInteger := 0;
    Params.ParamByName('ondate').AsDateTime := MaxDateTime;
    Params.ParamByName('wh').AsString := AllowedWH;
    Params.ParamByName('wid').AsInteger := 0;
    Params.ParamByName('kaid').AsInteger := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.grdOrderedCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.grdOrderedCustomDrawCell') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex) then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.aInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.aInfoExecute') else _udebug := nil;{$ENDIF}

  if cdsOrdered.FieldByName('wbillid').AsInteger <> -16 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmTmpOrderInfo.Create(nil) do
  try
    ParentNameEx := 'fmOrders';
    txtPerson.Caption := cdsOrdered.FieldByName('certnum').AsString;
    txtTime.Caption := cdsOrdered.FieldByName('posdate').AsString;
    txtNotes.Caption := cdsOrdered.FieldByName('notes').AsString;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.grdOrderedDblClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.grdOrderedDblClick') else _udebug := nil;{$ENDIF}
  aInfo.Execute;
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.cbSelectTypePropertiesEditValueChanged(Sender: TObject);
  var
    FEn: Boolean;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.cbSelectTypePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  FEn := cbSelectType.ItemIndex = 0;
  lDate.Enabled := FEn;
  edDate.Enabled := FEn;

  if FKAID = 0 then edKAgent.Enabled := FEn;

  if FEn then begin
    edNum.EditMode := True;
    edNum.ShowButtons := sbtHide;
  end
  else begin
    edNum.EditMode := False;
    edNum.ShowButtons := sbtOnlyRef;
  end;

  edNum.ID := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.edNumChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.edNumChange') else _udebug := nil;{$ENDIF}

  if FKAID = 0 then edKAgent.KAID := edNum.Obj.KAID;

  if edNum.Obj.DocDate <> 0 then edDate.Date := edNum.Obj.DocDate;

  DSRefresh(cdsDetail, 'posid', 0);

  if grdDet.FocusedNode <> nil then grdDet.FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  edDate.Date := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.btnPartysSelectClick(Sender: TObject);
  var
    TmpAmount: Extended;
    Str: string;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.btnPartysSelectClick') else _udebug := nil;{$ENDIF}

  TmpAmount := 0;

  if not mdPosition.Active or mdPosition.IsEmpty then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmPartySelect.Create(nil) do
  try
    FBySN := Self.edMat.IsSerial;
    mdSN.Open;
    FAmount := Round(StrToFloat(edAmount.EditingText));
    //FChkAmount := FInAcc and FBySN;
    MatName := Self.edMat.MatName;
    if FBySN then begin
      colAsel.DisableEditor := True;
      colAsel.ReadOnly := True;
    end;

    if True then begin
      mdSN.Append;
      mdSN.FieldByName('posid').AsInteger := 0;
      mdSN.FieldByName('pid').AsInteger := 0;
      if GetDSCount(mdPosition, 'postype', 0) > 0
        then mdSN.FieldByName('docnumtxt').AsString := LangMan.GetRS('fmWaybill', 'MatAtWH')
        else mdSN.FieldByName('docnumtxt').AsString := LangMan.GetRS('fmWaybill', 'NoMatAtWH');
      mdSN.Post;
    end;

    if GetDSCount(mdPosition, 'postype', 1) > 0 then begin
      mdSN.Append;
      mdSN.FieldByName('posid').AsInteger := -1;
      mdSN.FieldByName('pid').AsInteger := -1;
      mdSN.FieldByName('docnumtxt').AsString := LangMan.GetRS('fmWaybill', 'MatOrdered');
      mdSN.Post;
    end;

    with mdPosition do begin
      First;
      while not Eof do begin
        mdSN.Append;
        mdSN.FieldByName('num').AsInteger := mdSN.RecNo;

        if FBySN then mdSN.FieldByName('SN').AsString := FieldByName('SN').AsString;

        mdSN.FieldByName('docnumtxt').AsString := FieldByName('docnumtxt').AsString;
        mdSN.FieldByName('wbillid').AsInteger := FieldByName('wbillid').AsInteger;
        mdSN.FieldByName('wtype').AsInteger := FieldByName('wtype').AsInteger;
        mdSN.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
        mdSN.FieldByName('pid').AsInteger := -FieldByName('postype').AsInteger;
        mdSN.FieldByName('ondate').AsDateTime := FieldByName('ondate').AsDateTime;
        mdSN.FieldByName('amount').AsFloat := FieldByName('amount').AsFloat;
        mdSN.FieldByName('price').AsFloat := FieldByName('price').AsFloat;
        mdSN.FieldByName('currname').AsString := FieldByName('currname').AsString;
        mdSN.FieldByName('gtd').AsString := FieldByName('gtd').AsString;
        mdSN.FieldByName('certnum').AsString := FieldByName('certnum').AsString;
        mdSN.FieldByName('producer').AsString := FieldByName('producer').AsString;

        if FieldByName('certdate').IsNull
          then mdSN.FieldByName('certdate').Clear
          else mdSN.FieldByName('certdate').AsDateTime := FieldByName('certdate').AsDateTime;

        if mdRsv.Active and mdRsv.Locate('posid', FieldByName('posid').AsInteger, [])
        then begin
          mdSN.FieldByName('checked').AsBoolean := True;
          mdSN.FieldByName('asel').AsFloat := mdRsv.FieldByName('amount').AsFloat;
        end
        else begin
          mdSN.FieldByName('checked').AsBoolean := False;
          mdSN.FieldByName('asel').AsFloat := 0
        end;
        mdSN.Post;
        Next;
      end;//while not eof
    end;//with mdPosition

    mdSN.First;
    if ShowModal = mrOk then begin
      mdRsv.Close;
      mdRsv.Open;
      with mdSN do begin
        First;
        TmpAmount := 0;
        while not Eof do begin
          if (FieldByName('checked').AsBoolean) and (RoundToA(FieldByName('asel').AsFloat, MatDisplayDigits) > 0)
             and mdPosition.Locate('posid', FieldByName('posid').AsInteger, [])
          then begin
            mdRsv.Append;
            mdRsv.FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
            mdRsv.FieldByName('pricein').AsFloat := StrToFloat(mdPosition.FieldByName('price').AsString);
            //mdRsv.FieldByName('postype').AsInteger := FieldByName('postype').AsInteger;
            mdRsv.FieldByName('amount').AsFloat := RoundToA(FieldByName('asel').AsFloat, MatDisplayDigits);
            TmpAmount := TmpAmount + mdRsv.FieldByName('amount').AsFloat;
            if not mdPosition.FieldByName('SN').IsNull then begin
              mdRsv.FieldByName('SN').AsString := mdPosition.FieldByName('SN').AsString;
            end;//if
            mdRsv.Post;
          end;//if
          Next;
        end;//while
      end;//with

      edAmount.Tag := 1;
      edAmount.Value := RoundToA(TmpAmount, MatDisplayDigits);
      edAmount.Tag := 0;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.mdPositionCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.mdPositionCalcFields') else _udebug := nil;{$ENDIF}

  with DataSet do begin
    FieldByName('docnumtxt').AsString := FieldByName('docnum').AsString + ' ' +
         LangMan.GetRS('fmWaybill', 'AttDate') + ' ' + DateTimeToStr(FieldByName('docdate').AsDateTime);
    FieldByName('pricetxt').AsString := FloatToStr(FieldByName('price').AsFloat) + ' ' + FieldByName('currname').AsString;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.chbRsvClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.chbRsvClick') else _udebug := nil;{$ENDIF}

  if chbRsv.Checked then begin
    //aAddMatR.Hint := LangMan.GetRS('fmWaybill', 'WHouse');
    edAmountPropertiesChange(edAmount);
  end
  else begin
    //aAddMatR.Hint := LangMan.GetRS('fmWaybill', 'MatAdd');
    mdRsv.Close;
    mdRsv.Open;
  end;
  chbAddToTmpOrder.Checked := not chbRsv.Checked;
  chbAddToTmpOrder.Enabled := not chbRsv.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.edNumEditorChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.edNumEditorChange') else _udebug := nil;{$ENDIF}

  tsOrder.Caption := LangMan.GetRS('fmOrders', 'Order') + ' ';

  if edNum.Editor.EditingText <> ''
    then tsOrder.Caption := tsOrder.Caption + '№' + edNum.Editor.EditingText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.cdsDetailBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.cdsDetailBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsDetail.Params.ParamByName('wbillid').AsInteger := edNum.Obj.WBillID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.colPosTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.colPosTypeGetText') else _udebug := nil;{$ENDIF}

  if AText = '' then AText := '-1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.colRecNoGetText') else _udebug := nil;{$ENDIF}

  AText := IntToStr(ANode.Index + 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.colStatusGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.colStatusGetText') else _udebug := nil;{$ENDIF}

  if AText = '' then AText := '-1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.cdsViewBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.cdsViewBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsView.Params.ParamByName('matid').AsInteger := 0;
  cdsView.Params.ParamByName('fromdate').AsDateTime := MinDateTime;
  cdsView.Params.ParamByName('todate').AsDateTime := MaxDateTime;

  if edKAgent.KAID = 0
    then cdsView.Params.ParamByName('kaid').AsInteger := -1
    else cdsView.Params.ParamByName('kaid').AsInteger := edKAgent.Obj.KAID;

  cdsView.Params.ParamByName('wtype').AsInteger := -16;
  cdsView.Params.ParamByName('checked').AsInteger := 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.edKAgentChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.edKAgentChange') else _udebug := nil;{$ENDIF}

  tsOrdered.Tag := 1;
  RefreshDetail;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.RefreshDetail;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.RefreshDetail') else _udebug := nil;{$ENDIF}

  if (tsOrdered.Tag = 1) and (pcMain.ActivePage = tsOrdered) then begin
    DSRefresh(cdsView, 'posid', 0);
    tsOrdered.Tag := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.pcMainChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.pcMainChange') else _udebug := nil;{$ENDIF}

  RefreshDetail;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.SetKAID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.SetKAID') else _udebug := nil;{$ENDIF}

  FKAID := Value;
  edNum.KAID := Value;
  edKAgent.KAID := Value;
  if Value > 0 then edKAgent.Enabled := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.aMatInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.aMatInfoExecute') else _udebug := nil;{$ENDIF}

  if edMat.MatID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := Self.edMat.MatID;
      CanModify := False;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.aMatMoveExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.aMatMoveExecute') else _udebug := nil;{$ENDIF}

  if edMat.MatID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatMove.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Self.OnDate;
      WID := 0; //cbWHouse.KeyValue;
      ID := Self.edMat.MatID;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.aMatRsvExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.aMatRsvExecute') else _udebug := nil;{$ENDIF}

  if edMat.MatID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatRsv.Create(nil) do
    try
     ParentNameEx := 'fmWMat';
     OnDate := Self.OnDate;
     WID := 0;
     ID := Self.edMat.MatID;
     ShowModal;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditOrderTmpOut.DatesAreCorrect: Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.DatesAreCorrect') else _udebug := nil;{$ENDIF}

  Result := True;
  try
    StrToDate(edDate.EditText);
  except
    Result := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.SetAccID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.SetAccID') else _udebug := nil;{$ENDIF}

  FAccID := Value;

  if Value > 0 then begin
    cbSelectType.ItemIndex := 1;
    edNum.ID := Value;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.aDelPosExecute(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.aDelPosExecute') else _udebug := nil;{$ENDIF}

  if ssMessageDlg(LangMan.GetRS('Common', 'DelConfirmEx2'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes
  then with newDataSet do
  try
    Application.ProcessMessages;
    ProviderName := 'pWaybillDet_DelByPos';
    FetchParams;
    for i := 0 to grdDet.SelectedCount - 1 do begin
      Params.ParamByName('posid').AsInteger :=
        grdDet.SelectedNodes[i].Values[colPosID.Index];
      Execute;
    end;

    DSRefresh(cdsDetail, 'posid', 0);
    RefreshFun('TfmOrders', -16);
    RefreshFun('TfmWMat', 0);
    if grdDet.FocusedNode <> nil
      then grdDet.FocusedNode.Selected := True;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.aAddTmpOrderExecute(Sender: TObject);
  (*var
    i: Integer;
    FPosID: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.aAddTmpOrderExecute') else _udebug := nil;{$ENDIF}

  if ssMessageDlg(LangMan.GetRS('fmOrders', 'AddMatsToTmpOrder'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes
  then with newDataSet do
  try
    Application.ProcessMessages;

    TrStart;

    try
      ProviderName := 'pWaybill_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := -16;
      Open;
      if IsEmpty then begin
        Close;
        ProviderName := 'pWaybill_InsS';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := -16;
        Params.ParamByName('num').AsString := 'System';
        Params.ParamByName('ondate').AsDateTime := Date;
        Params.ParamByName('checked').AsInteger := 0;
        Params.ParamByName('deleted').AsInteger := 1;
        Params.ParamByName('defnum').AsInteger := 0;
        Params.ParamByName('wtype').AsInteger := 16;
        Execute;
      end;
      Close;

      for i := 0 to grdDet.SelectedCount - 1 do begin
        ProviderName := 'pWaybillDet_InsS';
        FetchParams;
        FPosID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
        Params.ParamByName('posid').AsInteger := FPosID;
        Params.ParamByName('matid').AsInteger := grdDet.SelectedNodes;
        Params.ParamByName('wbillid').AsInteger := -16;
        Params.ParamByName('num').AsInteger := FID;
        Params.ParamByName('wid').AsInteger := lcbWH.WID;
        Params.ParamByName('amount').AsFloat := StrToFloat(edAmount.EditText);
        Params.ParamByName('nds').AsFloat := edMat.NDS;
        Params.ParamByName('ondate').AsDateTime := Now;
        Execute;

      if not NewRecord then begin
        ProviderName := 'pWaybillDetAP_Del';
        FetchParams;
        Params.ParamByName('posid').AsInteger := FID;
        Execute;
      end;

      ProviderName := 'pWaybillDetAP_InsS';
      FetchParams;
      Params.ParamByName('posid').AsInteger := FID;
      Params.ParamByName('notes').AsString := edNotes.Text;
      Params.ParamByName('certnum').AsString := UserFullName;
      Execute;

      ProviderName := 'pWMatTurnOut_Del';
      FetchParams;
      Params.ParamByName('posid').AsInteger := FID;
      Execute;

      ProviderName := 'pWMatTurnOut_Ins';
      FetchParams;
      Params.ParamByName('posid').AsInteger := FID;
      Params.ParamByName('matid').AsInteger := edMat.MatID;
      Params.ParamByName('wid').AsInteger := lcbWH.WID;
      Params.ParamByName('sourceid').AsInteger := FID;
      Params.ParamByName('turntype').AsInteger := 3;
      Params.ParamByName('ondate').AsDateTime := Now;
      Params.ParamByName('amount').AsFloat :=
        RoundToA(StrToFloat(edAmount.EditText), MatDisplayDigits);
      Execute;


      ProviderName := 'pWaybillDet_DelByPos';
      FetchParams;
        Params.ParamByName('posid').AsInteger :=
          grdDet.SelectedNodes[i].Values[colPosID.Index];
        Execute;
      end;
      TrCommit;

      DSRefresh(cdsDetail, 'posid', 0);
      if grdDet.FocusedNode <> nil
        then grdDet.FocusedNode.Selected := True;
    except
      TrRollback;
      raise;
    end;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.FormDestroy') else _udebug := nil;{$ENDIF}

  edMat.SaveToRegistry(MainRegKey + '\' + Self.Name + '\' + edMat.Name);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmpOut.DoHelp;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmpOut.DoHelp') else _udebug := nil;{$ENDIF}

  ShowHelpTopic(Self.Name);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditOrderTmpOut', @Debugging, DEBUG_group_ID);{$ENDIF}

finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
