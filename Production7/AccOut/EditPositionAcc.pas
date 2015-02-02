{$I ok_sklad.inc}
unit EditPositionAcc; // used in EditAccOut, EditWaybillOut, EditOrderOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, Dialogs, ActnList, Buttons, DB, DBClient, Grids,
  Mask, ImgList, TB2Item, Menus, DBGrids,

  dxCntner6, dxEditor6, dxTL6, dxDBCtrl6, dxDBGrid6, dxDBTLCl6, dxGrClms6, dxmdaset,

  cxControls, cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxCheckBox, cxButtons,
  cxMemo, cxDBEdit, cxDropDownEdit, cxCalc, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxListView, cxButtonEdit, cxCalendar, cxSpinEdit, cxRadioGroup,

  prTypes, ssBaseTypes, ssFormStorage, ssBaseDlg, ssDBComboBox, ssClientDataSet, ssBevel,
  ssSpeedButton, ssPanel, ssGradientPanel, ssBaseConst, ssCalcEdit, ssLabel, ssMemDS,
  ssDBLookupCombo, okSearchEdit, ssCheckBox,

  xButton, xLngDefs;

type
  TokDCInfo = record
    PosID: Integer;
    CardID: Integer;
    Total: Extended;
  end;

  TfrmEditPositionAcc = class(TBaseDlg)
    aAddMatR: TAction;
    aAddWHouse: TAction;
    aMC: TAction;
    aOrder: TAction;
    aOrderOut: TAction;
    aPartysSelect: TAction;
    aRemainsAtWH: TAction;
    aSetKurs: TAction;
    aSetPanels: TAction;
    aShowNDS: TAction;
    aShowPriceIn: TAction;
    aShowSN: TAction;
    btnInfo: TssSpeedButton;
    btnMC: TssSpeedButton;
    btnMove: TssSpeedButton;
    btnOrder: TssSpeedButton;
    btnOrderOut: TssSpeedButton;
    btnRemainsAtWH: TssSpeedButton;
    btnRsv: TssSpeedButton;
    btnSetPanels: TssSpeedButton;
    btnShowNDS: TssSpeedButton;
    bvlAddPrps: TssBevel;
    bvlDiscount: TssBevel;
    bvlMat: TssBevel;
    bvlPrice: TssBevel;
    bvlPriceIn: TssBevel;
    bvlSN: TssBevel;
    bvlSummary: TssBevel;
    bvlWarranty: TssBevel;
    cbProducer: TcxComboBox;
    cbReuseModal: TssCheckBox;
    cbWHouse: TssDBLookupCombo;
    cbWPeriodType: TcxComboBox;
    cdsPriceTypes: TssClientDataSet;
    cdsWhouse: TssClientDataSet;
    cdsWhouseADDR: TStringField;
    cdsWhouseDEF: TIntegerField;
    cdsWhouseDELETED: TIntegerField;
    cdsWhouseNAME: TStringField;
    cdsWhouseNOTES: TStringField;
    cdsWhouseWID: TIntegerField;
    chbDiscount: TcxCheckBox;
    chbRsv: TcxCheckBox;
    chbWarranty: TcxCheckBox;
    DataSource1: TDataSource;
    dsmdPosition: TDataSource;
    dsmdRsv: TDataSource;
    dsPriceTypes: TDataSource;
    dsWhouse: TDataSource;
    edAmount: TssCalcEdit;
    edCertDate: TcxDateEdit;
    edCertNum: TcxTextEdit;
    edDiscCard: TokDiscCardSearchEdit;
    edDiscount: TssCalcEdit;
    edFindMat: TokMatSearchEdit;
    edGTD: TcxTextEdit;
    edMatRB: TcxRadioGroup;
    edNDS: TssCalcEdit;
    edPrice: TssCalcEdit;
    edSN: TcxButtonEdit;
    edWPeriod: TcxSpinEdit;
    FloatField1: TFloatField;
    IntegerField3: TIntegerField;
    lAmount: TssLabel;
    lAmountEx: TLabel;
    lAvgPrice: TLabel;
    lcbPriceTypes: TssDBLookupCombo;
    lCertDate: TssLabel;
    lCertNum: TssLabel;
    lGTD: TssLabel;
    lHolder: TssLabel;
    lKurs: TLabel;
    lMatEx: TLabel;
    lMaxPrice: TLabel;
    lMinPrice: TLabel;
    lNDS: TssLabel;
    lNDSRate: TssLabel;
    lPrice: TssLabel;
    lPriceDiscount: TssLabel;
    lPriceInterval: TssLabel;
    lPriceType: TssLabel;
    lProducer: TssLabel;
    lRemain: TssLabel;
    lRemainAll: TLabel;
    lRsv: TLabel;
    lSN: TssLabel;
    lSummary: TLabel;
    lSummWithNDS: TssLabel;
    lSummWONDS: TLabel;
    lTitle: TLabel;
    lWhouse: TssLabel;
    lWPeriod: TssLabel;
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
    mdwmt: TdxMemData;
    PanAddProps: TPanel;
    panDiscount: TPanel;
    panInterval: TPanel;
    panMat: TPanel;
    panPrice: TPanel;
    panPriceIn: TPanel;
    panSN: TPanel;
    panSummary: TPanel;
    panWarranty: TPanel;
    rbtDiscCard: TcxRadioButton;
    rbtDiscManual: TcxRadioButton;
    sbAddWHouse: TssSpeedButton;
    sbKurs: TssSpeedButton;
    sbPartysSelect: TssSpeedButton;
    sbShowPriceIn: TssSpeedButton;
    ssBevel1: TssBevel;
    ssBevel8: TssBevel;
    ssSpeedButton1: TssSpeedButton;
    stAmountEx: TssBevel;
    stAvgPrice: TssBevel;
    stCurrShortName: TssBevel;
    stMaxPrice: TssBevel;
    stMeasureName: TssBevel;
    stMinPrice: TssBevel;
    stPriceDiscount: TssBevel;
    stRemain: TssBevel;
    stRemainAll: TssBevel;
    stRsv: TssBevel;
    stSumm: TssBevel;
    stSummNDS: TssBevel;
    stSummWithNDS: TssBevel;
    txtDiscHolder: TssBevel;
    txtFinallyPriceCurr: TssBevel;
    txtSummAmount: TssBevel;
    txtSummNDS: TssBevel;
    txtSummWithNDS: TssBevel;
    txtSummWONDS: TssBevel;
    btnDiscountType: TssSpeedButton;

    procedure aAddMatRExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aMCExecute(Sender: TObject);
    procedure aOrderExecute(Sender: TObject);
    procedure aOrderOutExecute(Sender: TObject);
    procedure aPartysSelectExecute(Sender: TObject);
    procedure aRemainsAtWHExecute(Sender: TObject);
    procedure aSetKursExecute(Sender: TObject);
    procedure aSetPanelsExecute(Sender: TObject);
    procedure aShowNDSExecute(Sender: TObject);
    procedure aShowPriceInExecute(Sender: TObject);
    procedure aShowSNExecute(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure btnMoveClick(Sender: TObject);
    procedure btnRsvClick(Sender: TObject);
    procedure cbProducerPropertiesInitPopup(Sender: TObject);
    procedure cbReuseModalClick(Sender: TObject);
    procedure cbReuseModalShow;
    procedure cbWHouseKeyPress(Sender: TObject; var Key: Char);
    procedure cbWHousePropertiesEditValueChanged(Sender: TObject);
    procedure cdsPriceTypesAfterOpen(DataSet: TDataSet);
    procedure cdsPriceTypesBeforeOpen(DataSet: TDataSet);
    procedure cdsWhouseAfterOpen(DataSet: TDataSet);
    procedure cdsWhouseBeforeOpen(DataSet: TDataSet);
    procedure chbDiscountPropertiesChange(Sender: TObject);
    procedure chbRsvClick(Sender: TObject);
    procedure chbRsvPropertiesChange(Sender: TObject);
    procedure chbWarrantyClick(Sender: TObject);
    procedure DataModified(Sender: TObject);
    procedure DoHelp; override;
    procedure edAmountKeyPress(Sender: TObject; var Key: Char);
    procedure edAmountPropertiesChange(Sender: TObject);
    procedure edDiscCardChange(Sender: TObject);
    procedure edDiscountKeyPress(Sender: TObject; var Key: Char);
    procedure edDiscountPropertiesChange(Sender: TObject);
    procedure edFindMatChange(Sender: TObject);
    procedure edFindMatKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edFindMatOnTypeChange(Sender: TObject);
    procedure edFindMatRefButtonClick(Sender: TObject);
    procedure edFindMatWeightChanged(Sender: TObject);
    procedure edMatEnter(Sender: TObject);
    procedure edMatExit(Sender: TObject);
    procedure edMatKeyPress(Sender: TObject; var Key: Char);
    procedure edMatRBClick(Sender: TObject);
    procedure edNamePropertiesChange(Sender: TObject);
    procedure edNDSPropertiesChange(Sender: TObject);
    procedure edPriceKeyPress(Sender: TObject; var Key: Char);
    procedure edPriceNoNDSKeyPress(Sender: TObject; var Key: Char);
    procedure edPriceNondsPropertiesChange(Sender: TObject);
    procedure edPricePropertiesChange(Sender: TObject);
    procedure edPricePropertiesEditValueChanged(Sender: TObject);
    procedure edShortNamePropertiesChange(Sender: TObject);
    procedure edSN1Enter(Sender: TObject);
    procedure edSN1Exit(Sender: TObject);
    procedure edSNPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edSummCurrNoNdsPropertiesChange(Sender: TObject);
    procedure edSummCurrPropertiesChange(Sender: TObject);
    procedure edWPeriodPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcbPriceTypesPropertiesChange(Sender: TObject);
    procedure mdPositionCalcFields(DataSet: TDataSet);
    procedure rbtDiscCardKeyPress(Sender: TObject; var Key: Char);
    procedure rbtDiscManualClick(Sender: TObject);
    procedure sbAddMatMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbAddWHouseMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnDiscountTypeClick(Sender: TObject);

  private
    FDocType: TDocType;

    function AllowTax(const ATaxType, AKType: Integer): Boolean;
    function CheckRest:boolean;
    function GetDCSum: Extended;
    procedure CalcSummary;
    procedure GetProducers;
    procedure LoadPanVisibility;
    procedure RealignPanels;
    procedure SavePanVisibility;
    procedure SetCurrID(const Value: integer);
    procedure SetCurrName(const Value: string);
    procedure SetDocType(const Value: TDocType);
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRealignPanels(var M: TMessage); message WM_REALIGNPANELS;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMSetText(var M: TMessage); message WM_SETTEXT;

  protected
    WHChangeMode, ManualPrice, CloseMode: Boolean;
    EdCanChange: Boolean;
    FBSPressed: Boolean;
    FBySN : Boolean;
    FCanRefresh: Boolean;
    FCardID: Integer;
    FCurrCtrl: TControl;
    FCurrName: string;
    FDirectDiscount: Extended;
    FDiscChanged: Boolean;
    FFindStr: string;
    FKeyPressed: Boolean;
    FMatID, FWid : Integer;
    FMatName, FArtikul, FMsrName : string;
    FPanDiscountVis, FPanSummaryVis, FPanSNVis, FPanAddPropsVis, FPanIntervalVis, FPanWarrantyVis: Boolean;
    FPosSum: Extended;
    FRealigned: Boolean;
    FRsv, FRemain, FAvgPrice, FMinPrice, FMaxPrice, FLastInPrice: Extended;
    FSumWONDS: Extended;
    LockFind: Boolean;

    procedure SetAddProps; virtual;
    procedure setid(const Value: integer); override;
    procedure DoCreate; override;
    procedure GetMatRestsLocal(DS: TssMemoryData); virtual;
    procedure SaveAddProps; virtual;
    procedure GetRests;

  public
    AOMode: Boolean;
    FAccOutID: Integer;
    FbyAcc: Boolean;
    FbyOrder: Boolean;
    FCurrID: integer;
    FmdDC: TdxMemData;
    FmdDCT: TssMemoryData;
    FInAcc: boolean;
    FKAID: Integer;
    FMaxAmount: Extended;
    FPosNDS:Extended;
    FRateDate: TDateTime;
    FRateID: integer;
    KAType: Integer;
    FExchangeRate: Extended;
    NDSPayer: Boolean;
    ParentHandle2: HWND;
    ParentHandle: HWND;
    PTypeID: Integer;
    WBType: Integer;

    // these are actually pointers to parent form tables
    parentMDWmatTurn: TdxMemData;
    parentMDWmatTurnOld: TdxMemData;
    parentMDTmpIds: TdxMemData;
    parentMDDet: TdxMemData;

Input: record // collection of caller parameters passed to this form
      MDSDet: TdxMemData;
      MDSWMatTurn: TdxMemData;
      MDSWMatTurnOld: TdxMemData;
      MDSTmpIds: TdxMemData;
    end;

    procedure SetCaptions; override;

    property CurrID: integer read FCurrID write SetCurrID;
    property CurrName: string read FCurrName write SetCurrName;
    property DocType: TDocType read FDocType write SetDocType;
  end;

var
  frmEditPositionAcc: TfrmEditPositionAcc;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  DateUtils, prConst, CurrencyEdit, ClientData, Login, prFun, ssFun,
  fMaterials,fWHouse, ssBaseIntfDlg, fMessageDlg, EditMaterials,
  MatMove, MatRsv, ssRegUtils, MCList, ssStrUtil, PartySelect,
  SetPanels, Serials, Math, EditOrderTmp, EditOrderTmpOut, RemainsAtWH, udebug;

{$IFDEF UDEBUG}
var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}


{$R *.dfm}

//==============================================================================================
procedure TfrmEditPositionAcc.DoHelp;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.DoHelp') else _udebug := nil;{$ENDIF}
  ShowHelpTopic('TfrmEditPositionAcc');
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.cbReuseModalShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.cbReuseModalShow') else _udebug := nil;{$ENDIF}

  if BarcodesEnabled then begin
    if edFindMat.Enabled and (edFindMat.CurrentSearchIndex = 2) // reuse modal for packet barcode entering
      then cbReuseModal.Visible := True
      else cbReuseModal.Visible := False;

    cbReuseModal.Enabled := cbReuseModal.Visible;
  end
  else begin
    cbReuseModal.Checked := False;
    cbReuseModal.Visible := False;
    cbReuseModal.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.GetMatRestsLocal(DS: TssMemoryData);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.GetMatRestsLocal') else _udebug := nil;{$ENDIF}

  GetMatRestsByKAorWID(dmData.SConnection, FMatID, 0, FWid, MaxDateTime, Integer(DS));

  if FbyAcc then begin
    if not parentMDWmatTurnOld.IsEmpty then begin
      DS.First;
      while not DS.Eof do begin
        if not parentMDWmatTurnOld.Locate('posid', DS.FieldByName('posid').AsInteger, [])
          then DS.Delete
          else begin
            DS.Edit;
            DS.FieldByName('amount').AsFloat := parentMDWmatTurnOld.FieldByName('amount').AsFloat;
            DS.Post;
            DS.Next;
          end;
      end;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.WMRefresh(var M: TMessage);
  var
    FRR: Boolean;
    FTmp: string;
    FMatChanged: Boolean;
    loopM: TMessage;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.WMRefresh') else _udebug := nil;{$ENDIF}

  if M.LParam = -16 then begin
    with TPosInfo(Pointer(M.WParam)^) do begin
      FRR := (edFindMat.MatID <> MatID);

      if edFindMat.MatID = 0 then begin
        edFindMat.MatID := MatID;
        cbWHouse.KeyValue := WID;
      end;

      if FRR then GetRests;
    end;
  end
  else if M.LParam = -17 then FAccOutID := M.WParam
  else if M.LParam = -20 then cbWHouse.KeyValue := M.WParam
  else case TRefType(M.LParam) of
    rtMat, rtMC:
      begin
        LockFind := True;
        FMatChanged := True; // AP: assuming material should change always
        //FMatChanged := not WHChangeMode;

        try
          if edFindMat.MatID <> M.WParam then begin
            edFindMat.Tag := 1;
            edFindMat.MatID := M.WParam;
            edFindMat.Tag := 0;
            FMatChanged := True;
          end;

          FMatID   := edFindMat.MatID;
          FMatName := edFindMat.MatName;
          FArtikul := edFindMat.Artikul;
          FMsrName := edFindMat.Measure;
          cbProducer.Text := edFindMat.Producer;

          FBySN := edFindMat.IsSerial;

          if FBySN
            then edAmount.DecimalPlaces := 0
            else edAmount.DecimalPlaces := Trunc(Abs(MatDisplayDigits));

          stMeasureName.Caption := FMsrName;
          txtSummAmount.Caption := FMsrName;

          if NDSPayer
            then FPosNDS := edFindMat.NDS
            else FPosNDS := 0;

          edNDS.Value := FPosNDS;

          if (FCardID = 0) and (((FID <> 0) and rbtDiscManual.Checked) or (FID = 0)) then begin
            edDiscount.Tag := 1;
            edDiscCard.CardID := 0;
            FDirectDiscount := GetDiscount(dmData.SConnection, FMatID, FKAID);
            edDiscount.Value := FDirectDiscount;
            edDiscount.Tag := 0;
            chbDiscount.Checked := (FDirectDiscount > 0);

            if FDirectDiscount > 0 then rbtDiscManual.Checked := True;
          end;

          if not WHChangeMode then begin
            FWid := edFindMat.WID;

            if FWid <= 0 then begin
               cdsWhouse.Locate('def', 1, []);
               cbWHouse.KeyValue := cdsWHouse.FieldByName('wid').AsInteger;
               FWid := cbWHouse.KeyValue;
             end
             else begin
               cbWHouse.Tag := 1;
               cbWHouse.KeyValue := FWid;
               cbWHouse.Tag := 0;
             end;
          end;

          GetMatRestsLocal(mdPosition);

          if not mdPosition.IsEmpty then begin
            case ChargeType of
              ctFIFO: mdPosition.SortOnFields('postype;ondate');
              ctLIFO: mdPosition.SortOnFields('postype;ondate',true,true);
            end;//case

            mdPosition.First;
          end;

          if not WHChangeMode then begin
            lcbPriceTypes.Properties.OnChange := nil;
            DSRefresh(cdsPriceTypes, 'ptypeid', 0);
            lcbPriceTypes.Properties.OnChange := lcbPriceTypesPropertiesChange;
          end;

          //Получение интервала цен для товара
          if FMatChanged then begin
            GetMatPrices(dmData.SConnection, FMatID, FMinPrice, FMaxPrice, FAvgPrice, FLastInPrice, FRemain, FRsv);
            FMinPrice := FMinPrice * FExchangeRate;
            FMaxPrice := FMaxPrice * FExchangeRate;
            FAvgPrice := FAvgPrice * FExchangeRate;
            FLastInPrice := FLastInPrice * FExchangeRate;

            stRemainAll.Caption := FormatFloat(MatDisplayFormat, RoundToA(FRemain - FRsv, MatDisplayDigits));

            if ShowPrices then begin
              stMinPrice.Caption := FormatFloat(PriceDisplayFormatEx, FMinPrice/FExchangeRate);
              stMaxPrice.Caption := FormatFloat(PriceDisplayFormatEx, FMaxPrice/FExchangeRate);
              stAvgPrice.Caption := FormatFloat(PriceDisplayFormatEx, FAvgPrice/FExchangeRate);
            end
            else begin
              stMinPrice.Caption := rs('Common', 'NA');
              stMaxPrice.Caption := rs('Common', 'NA');
              stAvgPrice.Caption := rs('Common', 'NA');
            end;//else
          end;

          FRemain := 0;
          with mdPosition do begin
            First;
            while not Eof do begin
              FRemain := FRemain + FieldByName('amount').AsFloat;
              Next;
            end;
            First;
          end;
          FRemain := RoundToA(FRemain, MatDisplayDigits);

          if FMaxAmount > 0
            then stRemain.Caption := FormatFloat(MatDisplayFormat, FMaxAmount)
            else stRemain.Caption := FormatFloat(MatDisplayFormat, FRemain);

          stRsv.Caption := FormatFloat(MatDisplayFormat, FRsv);
          if FRsv > 0
            then stRsv.Font.Color := clRed
            else stRsv.Font.Color := clMaroon;

          edAmountPropertiesChange(nil);
          if not WHChangeMode
            then lcbPriceTypesPropertiesChange(lcbPriceTypes);

          SetAddProps;
          FModified := true;

        finally
          LockFind := False;
        end;
      end;//rtMat, rtMC: begin

    rtWHouse:
      begin
        cbWHouse.Tag := 1;
        DSRefresh(cdsWhouse, 'wid', M.WParam);
        cbWHouse.Tag := 0;

        FWid := M.WParam;
        cbWhouse.KeyValue := FWid;
      end;//rtWHouse

    rtWMat:
      begin
        //Application.ProcessMessages; // strange shit happens here

        // AP: 2007-01-29 - WMat form's warehouse didn't processed later
        edFindMat.Tag := 1;
        edFindMat.WareHouses := IntToStr(PPosInfo(M.WParam)^.WID);
        edFindMat.MatID := PPosInfo(M.WParam)^.MatID;

        loopM.LParam := integer(rtMat);
        loopM.WParam := PPosInfo(M.WParam)^.matid;
        WMRefresh(loopM);
        //SendMessage(Self.Handle, WM_REFRESH, PPosInfo(M.WParam)^.matid, integer(rtMat));

        edFindMat.Tag := 0;

        if (PPosInfo(M.WParam)^.posid > 0) and mdPosition.Locate('posid',PPosInfo(M.WParam)^.posid,[])
        then begin
          mdRsv.Close;
          mdRsv.Open;
          mdRsv.Append;
          mdRsv.FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
          mdRsv.FieldByName('postype').AsInteger := -mdPosition.FieldByName('postype').AsInteger;
          mdRsv.FieldByName('pricein').AsFloat := strtofloat(mdPosition.FieldByName('price').AsString);

          if RoundToA(edAmount.Value, MatDisplayDigits)
             > RoundToA(mdPosition.FieldByName('amount').AsFloat, MatDisplayDigits)
          then begin
            mdRsv.FieldByName('amount').AsFloat := mdPosition.FieldByName('amount').AsFloat;
            edAmount.Tag := 1;
            edAmount.Value := mdRsv.FieldByName('amount').AsFloat;
            edAmount.Tag := 0;
          end
          else mdRsv.FieldByName('amount').AsFloat := RoundToA(edAmount.Value, MatDisplayDigits);

          if not mdPosition.FieldByName('SN').IsNull then begin
            mdRsv.FieldByName('SN').AsString := mdPosition.FieldByName('SN').AsString;
            edSN.Text := mdPosition.FieldByName('SN').AsString;
          end;//if
          mdRsv.Post;

        end;//if locate posid
      end;//rtWMat:
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.setid(const Value: integer);
  var
    BM: TBookmark;
    ASourceId, APosId, ATmpId, wid: Integer;
    AAmount, remain, rsv: Extended;
    msrname,artikul: string;
    FPrice: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditPositionAcc.setid') else _udebug := nil;{$ENDIF}

  CloseMode := False;
  cbWHouse.Tag := 1;
  cdsWhouse.Open;
  cbWHouse.Tag := 0;

  // set NDS
  //if EntNDSPayer = 1 then FPosNDS := NDS else FPosNDS := 0;

  edNDS.Value := FPosNDS;

  case WBType of
    wbtOrderOut:
      begin
        edFindMat.AllowZeroRest := True;
        lWHouse.Enabled := True;
        cbWHouse.Enabled := True;
        sbAddWHouse.Enabled := True;
        chbRsv.Enabled := True;
        chbRsv.Checked := False;
        edFindMat.Enabled := True;
        edAmount.Enabled := True;
      end;

    wbtAccOut:
      begin
        lWHouse.Enabled := True;
        cbWHouse.Enabled := True;
        sbAddWHouse.Enabled := True;
        chbRsv.Enabled := True;
        edFindMat.Enabled := True;
        edAmount.Enabled := True;
      end;

    wbtWayBillOut:
      begin
        edFindMat.AllowZeroRest := True; // temporary measure !
        lWHouse.Enabled := not FbyAcc;
        cbWHouse.Enabled := not FbyAcc;
        sbAddWHouse.Enabled := not FbyAcc;
        chbRsv.Enabled := not FbyAcc;
        edFindMat.Enabled := not FbyAcc;
        edAmount.Enabled := not FbyAcc;
      end;

  end;

  if Value <> 0 then begin
    //mdwmt.CopyFromDataSet(parentMDWmatTurnOld);
    Fid := Value;
    LockFind := True;

    aPartysSelect.Enabled := edAmount.Enabled;

    //Освобождение редактируемых позиций (старых)
    parentMDWmatTurnOld.First;

    while not parentMDWmatTurnOld.Eof do begin
      if  ID = parentMDWmatTurnOld.FieldByName('sourceid').AsInteger
      then begin
        with newDataSet do
        try
          ProviderName := 'pWayBill_GetMatID_WID';
          FetchParams;
          Params.ParamByName('posId').AsInteger := parentMDWmatTurnOld.FieldByName('posid').AsInteger;
          Open;

          if not IsEmpty then begin
            parentMDTmpIDs.Append;
            parentMDTmpIDs.FieldByName('sourceid').AsInteger := parentMDWmatTurnOld.FieldByName('sourceid').AsInteger;
            parentMDTmpIDs.FieldByName('amount').AsFloat := RoundToA(-strtofloat(parentMDWmatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits);
            parentMDTmpIDs.FieldByName('posid').AsInteger := parentMDWmatTurnOld.FieldByName('posid').AsInteger;

            parentMDTmpIDs.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(parentMDWmatTurnOld.FieldByName('posid').AsInteger,
                                                             Fields[0].AsInteger, Fields[1].AsInteger, 0,
                                                             -strtofloat(parentMDWmatTurnOld.fieldbyname('amount').AsString));
            parentMDTmpIDs.FieldByName('free').AsInteger := 1;
            parentMDTmpIDs.FieldByName('forall').AsInteger := 0;
            parentMDTmpIDs.Post;
          end;//if not IsEmpty
          Close;

        finally
          Free;
        end;
      end;//if parentMDWmatTurnOld.FieldByName('sourceid').AsInteger = ID

      parentMDWmatTurnOld.Next;
    end;//while not parentMDWmatTurnOld.Eof

    //Освобождение редактируемых позиций (новых)
    parentMDTmpIDs.First;

    while not parentMDTmpIDs.Eof do begin
      if (parentMDTmpIDs.FieldByName('sourceid').AsInteger = ID) and (parentMDTmpIDs.FieldByName('free').AsInteger <> 1)
      then begin
        with newDataSet do
        try
          ProviderName := 'pWayBill_GetMatID_WID';
          FetchParams;
          Params.ParamByName('posId').AsInteger := parentMDTmpIDs.FieldByName('posid').AsInteger;
          Open;

          if not IsEmpty then begin
            BM := parentMDTmpIDs.GetBookmark;  //Сохранение текщей позиции
            ASourceId := parentMDTmpIDs.FieldByName('sourceid').AsInteger;
            AAmount := parentMDTmpIDs.FieldByName('amount').AsFloat;
            APosId := parentMDTmpIDs.FieldByName('posid').AsInteger;
            ATmpId := parentMDTmpIDs.FieldByName('tmpid').AsInteger;

            try
              parentMDTmpIDs.Append;
              parentMDTmpIDs.FieldByName('sourceid').AsInteger := ASourceId;
              parentMDTmpIDs.FieldByName('amount').AsFloat := -AAmount;
              parentMDTmpIDs.FieldByName('posid').AsInteger := APosId;

              parentMDTmpIDs.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(APosId,
                                                                 Fields[0].AsInteger,Fields[1].AsInteger, 0, -AAmount);

              parentMDTmpIDs.FieldByName('free').AsInteger := 1;
              parentMDTmpIDs.FieldByName('forall').AsInteger := 0;
              parentMDTmpIDs.Post;

            finally
              parentMDTmpIDs.GotoBookmark(BM);
              parentMDTmpIDs.FreeBookmark(BM);
            end;

          end;//if not IsEmpty
          Close;

        finally
          Free;
        end;
      end;//if

      parentMDTmpIDs.Next;
    end;//while not mdTmpIds.Eof

    FMatID := parentMDDet.fieldbyname('matid').AsInteger;
    edFindMat.MatID := FMatID;
    //FMatName := MatName(dmData.SConnection,FMatID,FMsrName,FArtikul,FWid,FBySN);

    if FBySN
      then edAmount.DecimalPlaces := 0
      else edAmount.DecimalPlaces := Trunc(Abs(MatDisplayDigits));

    DSRefresh(cdsPriceTypes, 'ptypeid', 0);
    stMeasureName.Caption := FMsrName;
    cbWHouse.KeyValue := parentMDDet.fieldbyname('wid').AsInteger;
    cbProducer.Text := parentMDDet.FieldByName('producer').AsString;
    edGTD.Text := parentMDDet.FieldByName('gtd').AsString;
    edCertNum.Text := parentMDDet.FieldByName('certnum').AsString;
    edCertDate.Date := parentMDDet.FieldByName('certdate').AsDateTime;

    if edCertDate.Date = 0 then edCertDate.EditText := '';

    FPosNDS := StrToFloat(parentMDDet.fieldbyname('nds').AsString);
    edNDS.Value := FPosNDS;

    if not parentMDDet.FieldByName('cardid').IsNull then begin
      rbtDiscCard.Checked := True;
      edDiscCard.CardID := parentMDDet.FieldByName('cardid').AsInteger;
    end
    else begin
      rbtDiscManual.Checked := True;
      edDiscCard.CardID := 0;
    end;

    edDiscount.Value := parentMDDet.fieldbyname('discount').AsFloat;
    chbDiscount.Checked := edDiscount.Value > 0;

    FPrice := StrToFloat(parentMDDet.fieldbyname('price').AsString);

    if WBOutPriceType = 1 then FPrice := NDSOut(FPrice, FPosNDS);

    FPrice := RoundToA((FPrice / (100 - parentMDDet.fieldbyname('discount').AsFloat)) * 100, -6);

    edPrice.Value := FPrice;
    edAmount.Tag := 1;
    edAmount.Value := StrToFloat(parentMDDet.fieldbyname('amount').AsString);
    edAmount.Tag := 0;

    if (WBType = wbtWaybillOut) and (parentMDDet.FindField('warrantyperiod') <> nil) then begin
      chbWarranty.Checked := not parentMDDet.FieldByName('warrantyperiod').IsNull;
      if chbWarranty.Checked then begin
        edWPeriod.Value := parentMDDet.FieldByName('warrantyperiod').AsInteger;
        cbWPeriodType.ItemIndex := parentMDDet.FieldByName('warrantyperiodType').AsInteger;
      end
      else begin
        edWPeriod.Clear;
        cbWPeriodType.ItemIndex := 1;
      end;
    end;

    //запись в mdRsv
    mdRsv.Close;
    mdRsv.Open;
    with parentMDWmatTurn do begin
      First;
      while not Eof do begin
        if (FieldByName('sourceid').AsInteger = Value) and mdPosition.Locate('posid',FieldByName('posid').AsInteger,[])
        then begin
          mdRsv.Append;
          mdRsv.FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
          mdRsv.FieldByName('pricein').AsFloat := strtofloat(mdPosition.FieldByName('price').AsString);
          mdRsv.FieldByName('postype').AsInteger := -mdPosition.FieldByName('postype').AsInteger;
          mdRsv.FieldByName('amount').AsFloat := FieldByName('amount').AsFloat;

          if not mdPosition.FieldByName('SN').IsNull then begin
            mdRsv.FieldByName('SN').AsString := mdPosition.FieldByName('SN').AsString;
            edSN.Text := edSN.Text + mdPosition.FieldByName('SN').AsString + '; ';
          end;

          mdRsv.Post;
        end;//if (FieldByName('sourceid').AsInteger = Value) and mdPosition.Locate('posid',FieldByName('posid').AsInteger,[])
        Next;
      end;//while not Eof
    end;//with parentMDWmatTurn

    edSN.Text := parentMDDet.FieldByName('sn').AsString;

    ManualPrice := true;
    if parentMDDet.fieldbyname('PTypeId').IsNull
      then lcbPriceTypes.Text := ''
      else lcbPriceTypes.KeyValue := parentMDDet.fieldbyname('PTypeId').AsInteger;
    ManualPrice := false;

    chbRsv.Checked := (chbRsv.Tag = 1);
    FModified := false;
    LockFind := False;
  end // if Value<>0 -----------------------------

  else begin // Adding new
    EdFindMat.Tag := 1; // prevent redundant refreshes before all the stuff is set
    
    with newDataSet do
    try
      ProviderName := 'pDC_GetByKA';
      FetchParams;
      Params.ParamByName('kaid').AsInteger := FKAID;
      Params.ParamByName('ondate').AsDateTime := OnDate;
      Open;
      if not IsEmpty then begin
        chbDiscount.Checked := True;
        rbtDiscCard.Checked := True;
        edDiscCard.CardID := FieldByName('cardid').AsInteger;
        FCardID := edDiscCard.CardID;
      end;
      Close;

    finally
      Free;
    end;
    mdPosition.Close;

    Application.ProcessMessages;

    //set default whouse
    cbWHouse.Tag := 1;
    if (cbWHouse.EditText = '') and cdsWHouse.Locate('def', 1, []) then begin
      FWid := cdsWHouse.fieldbyname('wid').AsInteger;
      cbWhouse.KeyValue := FWid;
      FWid := 0;
    end;
    cbWHouse.Tag := 0;

    edAmount.Tag := 1;
    edAmount.Value := WBOutDefAmount;
    edAmount.Tag := 0;

    edPrice.Value := 0;

    // go to wMat form
    if (ID = 0) and ( (WBOutAutoWH and (WBType = wbtWaybillOut)) or (AccOutAutoWH and (WBType = wbtAccOut)) )
    then begin
      aAddMatRExecute(nil);
      FModified := true;
    end;//if

    EdFindMat.Tag := 0;
  end;//if Value=0

  Application.ProcessMessages;

  if WBType = wbtOrderOut // setting allowed warehouses list
    then EdFindMat.WareHouses := ''
    else EdFindMat.WareHouses := IntToStr(cbWHouse.KeyValue);

  if WBOutAutoPrice > 0 then lcbPriceTypes.Enabled := False;

  if not Self.Visible then Self.ShowModal;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditPositionAcc.CheckRest: boolean;
  var
    mdTmpPosition : TssMemoryData;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.CheckRest') else _udebug := nil;{$ENDIF}

  if not chbRsv.Checked then begin
    Result := True;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  CheckRest := false;
  mdTmpPosition := TssMemoryData.Create(nil);

  try
    mdTmpPosition.CopyStructure(mdPosition);
    //GetMatRestsByKAorWID(dmData.SConnection,FMatID,0,FWid,MaxDateTime,integer(mdTmpPosition));
    GetMatRestsLocal(mdTmpPosition);

    with mdRsv do begin
      First;
      while not Eof do begin
        if (mdTmpPosition.Locate('posid',FieldByName('posid').AsInteger,[])
           and
           (RoundToA(mdTmpPosition.FieldByName('amount').AsFloat, MatDisplayDigits)
            >= RoundToA(FieldByName('amount').AsFloat, MatDisplayDigits)))
        then Result := True
        else begin
          Result := False;
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;

        Next;
      end;//while not eof
    end;//with mdRsv

  finally
    mdTmpPosition.Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord, fCheck: Boolean;
    NextID: Integer;
    TmpAmount: Extended;
    OldAmount, FTaxSumm: Extended;
    DC_Info: TokDCInfo;
    tmd: ^TdxMemData; // tmp
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.FormCloseQuery') else _udebug := nil;{$ENDIF}

  while LockFind do sleep(100);

  CloseMode := True;

  if (id <> 0) and (ModalResult in [mrCancel]) then begin
    //Удаление освобождённых позиций
    with parentMDTmpIDs do begin
      First;
      while not Eof do begin
        if (FieldByName('sourceid').AsInteger = ID) and (FieldByName('free').AsInteger = 1) then begin
          dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
          Delete;
        end//if
        else Next;
      end;//while not eof
    end;//with
  end;//if (id <> 0) and (ModalResult in [mrCancel])

  if ModalResult in [mrOK, mrYes] then begin
    fCheck := CheckRest;
    CanClose := False;

    if (id <> 0) and fCheck then begin
      //Удаление освобождённых позиций
      with parentMDTmpIDs do begin
        First;
        while not Eof do begin
          if (FieldByName('sourceid').AsInteger = id) and (FieldByName('free').AsInteger = 1)
          then begin
            dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
            Delete;
          end//if
          else Next;
        end;//while not eof
      end;//with
    end;//if id<>0

    if fCheck then begin
      CanClose := False;

      with parentMDDet do begin
        if ID = 0 then begin
          NextID := dsNextPosID(Fields[0].DataSet);
          Append;
          FieldByName('posid').AsInteger := NextID;
        end//if ID=0
        else Edit;

        FieldByName('status').AsInteger := Integer(chbRsv.Checked);
        FieldByName('postype').AsInteger := 0;
        FieldByName('matid').AsInteger := FMatID;
        FieldByName('matname').AsString := FMatName;
        FieldByName('artikul').AsString := FArtikul;
        FieldByName('barcode').AsString := edFindMat.BarCode;
        FieldByName('wid').AsInteger := cbWHouse.KeyValue;
        FieldByName('whname').AsString := cbWHouse.Text;
        FieldByName('amount').AsFloat := RoundToA(StrToFloat(edAmount.EditText), MatDisplayDigits);
        FieldByName('price').AsFloat := strtofloat(stPriceDiscount.Caption);
        FieldByName('msrname').AsString := stMeasureName.Caption;
        FieldByName('producer').AsString := cbProducer.EditingText;
        FieldByName('gtd').AsString := edGTD.EditingText;
        FieldByName('certnum').AsString := edCertNum.EditingText;

        if Trim(edCertDate.EditingText) = ''
          then FieldByName('certdate').Clear
          else FieldByName('certdate').AsDateTime := edCertDate.Date;

        if (WBType = wbtWaybillOut) and (FindField('warrantyperiod') <> nil) then begin
          if chbWarranty.Checked then begin
            FieldByName('warrantyperiod').AsInteger := StrToInt(edWPeriod.EditingText);
            FieldByName('warrantyperiodtype').AsInteger := cbWPeriodType.ItemIndex;
          end
          else begin
            FieldByName('warrantyperiod').Clear;
            FieldByName('warrantyperiodtype').Clear;
          end;
        end;

        FieldByName('onvalue').AsFloat := FExchangeRate;
        FieldByName('nds').AsFloat := FPosNDS;

        if lcbPriceTypes.Text = ''
          then FieldByName('PTypeID').Clear
          else FieldByName('PTypeID').AsInteger := lcbPriceTypes.KeyValue;

        FieldByName('cardid').Clear;
        FieldByName('holder').Clear;
        FieldByName('cardnum').Clear;

        if chbDiscount.Checked then begin
          FieldByName('discount').AsFloat := StrToFloat(edDiscount.EditText);

          if rbtDiscCard.Checked then begin
            FieldByName('cardid').AsInteger := edDiscCard.CardID;
            FieldByName('holder').AsString := edDiscCard.Obj.Holder;
            FieldByName('cardnum').AsString := edDiscCard.Obj.Num;
          end;
        end
        else FieldByName('discount').AsFloat := 0;

        FieldByName('fullprice').AsFloat := FieldByName('price').AsFloat / (100 - FieldByName('discount').AsFloat) * 100;

        if (edSN.Text <> '') and (chbRsv.Checked)
          then FieldByName('SN').AsString := edSN.Text
          else FieldByName('SN').Clear;

        if not edFindMat.Taxes.IsEmpty then begin
          edFindMat.Taxes.First;

          while not edFindMat.Taxes.Eof do begin
            if AllowTax(edFindMat.Taxes.FieldByName('taxtype').AsInteger, KAType) then begin
              FTaxSumm := RoundToA(FSumWONDS * edFindMat.Taxes.FieldByName('onvalue').AsFloat / 100, -2);
              FieldByName('Tax' + edFindMat.Taxes.FieldByName('taxid').AsString).AsFloat := edFindMat.Taxes.FieldByName('onvalue').AsFloat;
              FieldByName('TaxRate' + edFindMat.Taxes.FieldByName('taxid').AsString).AsFloat := FTaxSumm;
            end;

            edFindMat.Taxes.Next;
          end;
        end;

        Post;
      end;//with parentMDDet

      SaveAddProps;

      //Удаление всего резерва для текущего sourceid
      with parentMDTmpIDs do begin
        First;

        while not Eof do begin
          if FieldByName('sourceid').AsInteger = id then begin
            dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
            Delete;
          end
          else Next;
        end;//while not eof
      end;//with parentMDTmpIDs

      //Удаление всех записей из parentMDWmatTurn для текущего sourceid
      with parentMDWmatTurn do begin
        First;

        while not Eof do
          if fieldbyname('sourceid').AsInteger = id
            then Delete
            else Next;
      end;//with parentMDWmatTurn

      //************* Запись в parentMDWmatTurn новых позиций
      mdRsv.First;
      while not mdRsv.Eof do begin
        //Запись в parentMDWmatTurn
        with parentMDWmatTurn do begin
          Append;
          FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
          FieldByName('matid').AsInteger := FMatID;
          FieldByName('wid').AsInteger := cbWHouse.KeyValue;
          FieldByName('sourceid').AsInteger := parentMDDet.FieldByName('posid').AsInteger;
          FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits);
          FieldByName('ondate').AsDateTime := 0;
        end;

        if not mdRsv.fieldbyname('SN').IsNull then parentMDWmatTurn.FieldByName('SN').AsString := mdRsv.fieldbyname('SN').AsString;

        parentMDWmatTurn.Post;

        if parentMDWmatTurnOld.Locate('posid;sourceid', VarArrayOf([mdRsv.fieldbyname('posid').AsInteger,ID]),[])
        then begin
          with parentMDWmatTurnOld do begin
            Edit;
            FieldByName('flag').AsInteger := 1;
            Post;
          end;

          if RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits) > RoundToA(strtofloat(parentMDWmatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits)
          then begin
            // Получить сумму для текущего posid в mdTmpIds
            with parentMDTmpIDs do begin
              First;
              TmpAmount := 0;
              while not Eof do begin
                if (FieldByName('posid').AsInteger = mdRsv.fieldbyname('posid').AsInteger)
                  then TmpAmount := RoundToA(TmpAmount + RoundToA(strtofloat(FieldByName('amount').AsString), MatDisplayDigits), MatDisplayDigits);

                Next;
              end;

              if TmpAmount < 0
              then begin
                if RoundToA(-TmpAmount, MatDisplayDigits)
                   > RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString) - strtofloat(parentMDWmatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits)
                then begin
                  Append;
                  FieldByName('sourceid').AsInteger := parentMDDet.FieldByName('posid').AsInteger;
                  FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
                  //Разница для себя
                  FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString) - strtofloat(parentMDWmatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits);

                  FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, FMatID, FWid, 0,
                                                    strtofloat(parentMDTmpIDs.FieldByName('amount').AsString));

                  FieldByName('free').AsInteger := 0;
                  FieldByName('forall').AsInteger := 0;
                  Post;
                end
                else begin
                  Append;
                  FieldByName('sourceid').AsInteger := parentMDDet.FieldByName('posid').AsInteger;
                  FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
                  //Доступное кол-во для себя TmpAmount*-1
                  FieldByName('amount').AsFloat := RoundToA(-TmpAmount, MatDisplayDigits);

                  FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, FMatID, FWid, 0,
                                                    strtofloat(parentMDTmpIDs.FieldByName('amount').AsString));

                  FieldByName('free').AsInteger := 0;
                  FieldByName('forall').AsInteger := 0;
                  Post;

                  if 0 <> RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString)
                          - strtofloat(parentMDWmatTurnOld.fieldbyname('amount').AsString) + TmpAmount, MatDisplayDigits)
                  then begin
                    Append;
                    FieldByName('sourceid').AsInteger := parentMDDet.FieldByName('posid').AsInteger;
                    FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
                    //Разницу для всех strtofloat(mdRsv.fieldbyname('amount').AsString)-TmpAmount*-1
                    FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString)
                                                     - strtofloat(parentMDWmatTurnOld.fieldbyname('amount').AsString) + TmpAmount, MatDisplayDigits);

                    FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, FMatID, FWid, 1,
                                                      strtofloat(parentMDTmpIDs.FieldByName('amount').AsString));

                    FieldByName('free').AsInteger := 0;
                    Post;
                  end;//if RoundToA...
                end;//else roundtoa(tmpamount

              end//if TmpAmount<0
              else begin
                Append;
                FieldByName('sourceid').AsInteger := parentMDDet.FieldByName('posid').AsInteger;
                FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
                //Разница для всех
                FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString)-strtofloat(parentMDWmatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits);

                FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, FMatID, FWid, 1,
                                                  strtofloat(parentMDTmpIDs.FieldByName('amount').AsString));

                FieldByName('free').AsInteger := 0;
                FieldByName('forall').AsInteger := 1;
                Post;
              end;//else if TmpAmount<0
            end;//with parentMDTmpIDs

          end//if roundtoa

          else with parentMDTmpIDs do begin
            if 0 <> RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString)
               - strtofloat(parentMDWmatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits)
            then begin
              Append;
              FieldByName('sourceid').AsInteger := parentMDDet.FieldByName('posid').AsInteger;
              FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
              //Разница для себя
              FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString) - strtofloat(parentMDWmatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits);

              FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, FMatID, FWid, 0,
                                                strtofloat(parentMDTmpIDs.FieldByName('amount').AsString));

              FieldByName('free').AsInteger := 0;
              FieldByName('forall').AsInteger := 0;
              Post;
            end;
          end;

        end // if parentMDWmatTurnOld.Locate('posid;sourceid', VarArrayOf([mdRsv.fieldbyname('posid').AsInteger,ID]),[])

        else begin
          {Проверка. Получить сумму для текущего posid в mdTmpIds}
          with parentMDTmpIDs do begin
            First;
            TmpAmount := 0;
            while not Eof do begin
              if (FieldByName('posid').AsInteger = mdRsv.fieldbyname('posid').AsInteger)
                then TmpAmount := RoundToA(TmpAmount + FieldByName('amount').AsFloat, MatDisplayDigits);
              Next;
            end;
          end;//with parentMDTmpIDs

          if TmpAmount < 0 then begin
            if RoundToA(-TmpAmount, MatDisplayDigits) > RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits)
            then begin
              parentMDTmpIDs.Append;
              parentMDTmpIDs.FieldByName('sourceid').AsInteger := parentMDDet.FieldByName('posid').AsInteger;
              parentMDTmpIDs.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
              //Всё кол-во для себя
              parentMDTmpIDs.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits);

              parentMDTmpIDs.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger,FMatID,FWid, 0,
                                                               strtofloat(parentMDTmpIDs.FieldByName('amount').AsString));

              parentMDTmpIDs.FieldByName('free').AsInteger := 0;
              parentMDTmpIDs.FieldByName('forall').AsInteger := 0;
              parentMDTmpIDs.Post;
            end
            else begin
              parentMDTmpIDs.Append;
              parentMDTmpIDs.FieldByName('sourceid').AsInteger := parentMDDet.FieldByName('posid').AsInteger;
              parentMDTmpIDs.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
              //Доступное кол-во для себя TmpAmount*-1
              parentMDTmpIDs.FieldByName('amount').AsFloat := RoundToA(-TmpAmount, MatDisplayDigits);

              parentMDTmpIDs.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger,FMatID,FWid, 0,
                                                               strtofloat(parentMDTmpIDs.FieldByName('amount').AsString));

              parentMDTmpIDs.FieldByName('free').AsInteger := 0;
              parentMDTmpIDs.FieldByName('forall').AsInteger := 0;
              parentMDTmpIDs.Post;

              if RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString) + TmpAmount, MatDisplayDigits) <> 0
              then begin
                parentMDTmpIDs.Append;
                parentMDTmpIDs.FieldByName('sourceid').AsInteger := parentMDDet.FieldByName('posid').AsInteger;
                parentMDTmpIDs.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
                //Разницу для всех strtofloat(mdRsv.fieldbyname('amount').AsString) + TmpAmount
                parentMDTmpIDs.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString) + TmpAmount, MatDisplayDigits);

                parentMDTmpIDs.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, FMatID, FWid,
                                                                 1, strtofloat(parentMDTmpIDs.FieldByName('amount').AsString));

                parentMDTmpIDs.FieldByName('free').AsInteger := 0;
                parentMDTmpIDs.FieldByName('forall').AsInteger := 1;
                parentMDTmpIDs.Post;
              end;
            end;//else
          end
          else begin
            parentMDTmpIDs.Append;
            parentMDTmpIDs.FieldByName('sourceid').AsInteger := parentMDDet.FieldByName('posid').AsInteger;
            parentMDTmpIDs.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
            //Всё кол-во для всех
            parentMDTmpIDs.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits);
            parentMDTmpIDs.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger,FMatID,FWid, 1,strtofloat(parentMDTmpIDs.FieldByName('amount').AsString));
            parentMDTmpIDs.FieldByName('free').AsInteger := 0;
            parentMDTmpIDs.FieldByName('forall').AsInteger := 1;
            parentMDTmpIDs.Post;
          end;//else
        end;//else

        mdRsv.Next;
      end;//while not mdRsv.Eof

      //Освобождение оставшихся позиций, старых
      with parentMDWmatTurnOld do begin
        First;

        while not Eof do begin
          if (FieldByName('sourceid').AsInteger = ID) and (FieldByName('flag').AsInteger <> 1)
          then begin
            Edit;
            FieldByName('flag').AsInteger := 1;
            Post;

            //Освобождение для себя
            parentMDTmpIDs.Append;
            parentMDTmpIDs.FieldByName('sourceid').AsInteger := FieldByName('sourceid').AsInteger;
            parentMDTmpIDs.FieldByName('posid').AsInteger := fieldbyname('posid').AsInteger;
            parentMDTmpIDs.FieldByName('amount').AsFloat := -RoundToA(strtofloat(fieldbyname('amount').AsString), MatDisplayDigits);
            parentMDTmpIDs.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(fieldbyname('posid').AsInteger, fieldbyname('matid').asinteger,fieldbyname('wid').asinteger, 0, -RoundToA(strtofloat(fieldbyname('amount').AsString), MatDisplayDigits));
            parentMDTmpIDs.FieldByName('free').AsInteger := 0;
            parentMDTmpIDs.FieldByName('forall').AsInteger := 0;
            parentMDTmpIDs.Post;
          end;//if

          Next;
        end;//while not Eof

        First;
        while not Eof do begin
          Edit;
          FieldByName('flag').AsInteger := 0;
          Post;
          Next;
        end;//while not eof
      end;//with parentMDWmatTurnOld

      SendMessage(ParentHandle, WM_REFRESH, 0, 9);

      if WBOutCheckDC then begin
        if ID = 0
          then DC_Info.PosID := NextID
          else DC_Info.PosID := FID;

        if chbDiscount.Checked and rbtDiscCard.Checked
          then DC_Info.CardID := edDiscCard.CardID
          else DC_Info.CardID := 0;

        DC_Info.Total := RoundToA(FPosSum * FExchangeRate, -2);
        SendMessage(ParentHandle, WM_DC_REFRESH, Integer(@DC_Info), 0);
      end;

      if ID = 0 then begin
        if ModalResult = mrYes then begin
          LockFind := True;
          edFindMat.MatID := 0;
          LockFind := False;
          edAmount.Value := WBOutDefAmount;
          stRemain.Caption := '0';
          stRsv.Caption := '0';
          edPrice.Value := 0;
          edDiscCard.CardID := 0;
          stMinPrice.Caption := '';
          stAvgPrice.Caption := '';
          stMaxPrice.Caption := '';
          ID := 0;
          DSRefresh(cdsPriceTypes, 'ptypeid', 0);
          edFindMat.Editor.SetFocus;
        end
        else CanClose := True;
      end//if ID=0
      else begin
        if ModalResult = mrOK
        then CanClose := True
        else begin
          mdRsv.Close;
          edSN.Text := '';
          chbRsv.Tag := integer(chbRsv.Checked);

          if cbProducer.Properties.Items.IndexOf(cbProducer.EditingText) = -1
            then cbProducer.Properties.Items.Add(cbProducer.EditingText);

          ID := ID; // reinit
        end;

        FModified := False;
      end;//else
    end//if CheckRest
    else begin
      CanClose := false;
      SendMessage(Self.Handle, WM_REFRESH, FMatID,integer(rtMat));
      ssMessageDlg(RS('fmWaybill','WMatChange'),ssmtError,[ssmbOk]);
    end;//else
  end//if ModalResult in [mrOK, mrYes]
  else CanClose := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
 var
   FEnPrice: Boolean;
   FAmount, FRemainEx: Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  if not allowALUpdate then Exit;
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.ActionListUpdate') else _udebug := nil;{$ENDIF}

  edSN.Enabled := (FBySN and (FMatID > 0));
  lSN.Enabled := edSN.Enabled;

  aPartysSelect.Enabled := (mdPosition.Active) and (not mdPosition.IsEmpty) and edAmount.Enabled and chbRsv.Checked;

  aSetKurs.Enabled := (CurrID <> BaseCurrID);

  lNDSRate.Visible := btnShowNDS.Checked;
  edNDS.Visible := btnShowNDS.Checked;

  PanPriceIn.Visible := sbShowPriceIn.Checked;

  if FMaxAmount > 0
    then FRemainEx := FMaxAmount
    else FRemainEx := FRemain;

  try
    if (strtofloat(edAmount.EditingText) <= 0) or ((RoundToA(strtofloat(edAmount.EditingText), MatDisplayDigits) > FRemainEx)
       and chbRsv.Checked)
    then begin
      if RoundToA(strtofloat(edAmount.EditingText), MatDisplayDigits) > FRemainEx
        then stRemain.Font.Color := clRed
        else stRemain.Font.Color := clMaroon;
    end
    else begin
      lAmount.Font.Color := clBlack;
      stRemain.Font.Color := clMaroon;
      lRemain.Font.Color := clBlack;
    end;

  except
  end;

  try
    FAmount := StrToFloat(edAmount.EditingText);
  except
    FAmount := 0;
  end;

  try
    if (strtofloat(edDiscount.EditText) >= 0) and (strtofloat(edDiscount.EditText) <= 100)
      then chbDiscount.Style.Font.Color := clBlack
      else chbDiscount.Style.Font.Color := clRed;

  except
    chbDiscount.Style.Font.Color := clRed;
  end;

  try
    if ((StrToFloat(edPrice.EditingText) = 0) and WBOutAllowZero) or (StrToFloat(edPrice.EditingText) <> 0)
      then FEnPrice := True
      else FEnPrice := False;

  except
    FEnPrice := False;
  end;

  {try if strtofloat(stPriceDiscount.Caption)<=0 then lPriceDiscount.Font.Color := clRed
      else lPriceDiscount.Font.Color := clBlack;
  except lPriceDiscount.Font.Color := clRed; end;

  try
    if StrToFloat(stPriceDiscount.Caption) < StrToFloat(stAvgPrice.Caption)
      then stAvgPrice.Font.Color := clYellow
      else stAvgPrice.Font.Color := clMaroon;

  except
    stAvgPrice.Font.Color := clMaroon;
  end;
  }

  edDiscount.Enabled := chbDiscount.Checked and chbDiscount.Enabled and rbtDiscManual.Checked;
  rbtDiscCard.Enabled := chbDiscount.Checked;
  edDiscCard.Enabled := rbtDiscCard.Checked and chbDiscount.Checked;
  lHolder.Enabled := edDiscCard.Enabled;
  rbtDiscManual.Enabled := chbDiscount.Checked;

  if (not chbRsv.Checked) or (chbRsv.Checked and (FAmount <= FRemain)) then begin
    chbRsv.Enabled := True;
    chbRsv.Style.StyleController := dmdata.scMain;
  end
  else begin
    chbRsv.Checked := False;
    chbRsv.Enabled := False;
    chbRsv.Style.StyleController := dmdata.scMainErr;
  end;

  aOk.Enabled := ( FByOrder and ( (chbRsv.Checked and (FAmount <= FRemain)) or not chbRsv.Checked ) )
    or ((stRemain.Font.Color <> clRed ) and FEnPrice
    and (chbDiscount.Style.Font.Color <> clRed) and (lPriceDiscount.Font.Color <> clRed)
    and (edFindMat.MatID > 0) and (FAmount > 0) and (FPosNDS >= 0));

  aApply.Enabled := aOk.Enabled and FModified;

  aRemainsAtWH.Enabled := edFindMat.MatID > 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.DataModified(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.SetCaptions;
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    aPartysSelect.Hint := GetRS('fmWaybill', 'Partys');
    aOK.Caption := GetRS('Common','OK');
    aCancel.Caption := GetRS('Common','Cancel');
    aApply.Caption := GetRS('Common','Apply');
    aAddMatR.Hint := GetRS('fmWaybill','MatAdd');
    aShowSN.Caption := GetRS('fmWaybill','SNs');
    sbAddWHouse.Hint := GetRS('fmWaybill','WHouseRef');
    btnShowNDS.Hint := GetRS('fmWaybill', 'ShowNDS');
    btnSetPanels.Hint := GetRS('fmWaybill', 'SetPanels');
    btnOrder.Hint := GetRS('fmOrders', 'AddOrderIn');
    btnOrderOut.Hint := GetRS('fmOrders', 'TmpOutNew');
    btnRemainsAtWH.Hint := GetRS('fmWMat', 'MatsAtWH');

    edFindMat.InitRes;
    edFindMat.SearchNames[0] := GetRS('fmInventory', 'NameShort') + ';name';

    if edFindMat.CurrentSearchIndex = 0 then edFindMat.Caption.Caption := GetRS('fmInventory', 'NameShort') + ':';

    edMatRB.Caption := GetRS('Common', 'FindParams');
    edMatRB.Properties.Items.Clear;

    for i := 0 to EdFindMat.SearchNames.Count - 1 do
      with edMatRB.Properties.Items do begin
        Add;
        Items[i].Caption := ExtractWord(1, edFindMat.SearchNames[i], [';']);
        Items[i].Value := i;
      end;
    edMatRB.ItemIndex := edFindMat.CurrentSearchIndex;

    lWhouse.Caption := GetRS('fmWaybill','WHouse') + ':';
    lAmount.Caption := GetRS('fmWaybill','Amount') + ':';
    lAmountEx.Caption := GetRS('fmWaybill', 'Amount') + ':';
    lSummary.Caption := GetRS('fmWaybill', 'Total') + ':';
    lSummWithNDS.Caption := GetRS('fmWaybill', 'Summ') + ' ' + GetRS('fmWaybill', 'withNDS') + ':';
    lPrice.Caption := GetRS('fmWaybill','PriceWithNDS') + ':';
    lRsv.Caption := GetRS('fmWaybill', 'Rsv') + ':';
    lMinPrice.Caption := GetRS('fmWaybill', 'MinPrice') + ':';
    lMaxPrice.Caption := GetRS('fmWaybill', 'MaxPrice') + ':';
    lAvgPrice.Caption := GetRS('fmWaybill', 'AvgPrice') + ':';
    aSetKurs.Hint := GetRS('fmWaybill','SetKurs');
    lKurs.Caption := GetRS('fmWaybill','FExchangeRate') + ':';
    chbRsv.Properties.Caption := GetRS('fmWaybill', 'RsvMat');
    chbDiscount.Properties.Caption := GetRS('fmWaybill', 'ApplyDiscount') + ':';
    lRemain.Caption := GetRS('fmWaybill', 'RemainWH') + ':';
    lRemainAll.Caption := GetRS('fmWaybill', 'RemainAll') + ':';
    lPriceType.Caption := GetRS('fmWaybill', 'PriceType') + ':';
    lPriceInterval.Caption := GetRS('fmWaybill', 'InPriceInterval') + ':';
    lPriceDiscount.Caption := GetRS('fmWaybill', 'PriceDiscount') + ':';
    btnRsv.Hint := GetRS('fmWaybill','RsvInfo');
    btnMove.Hint := GetRS('fmWaybill','MoveInfo');
    btnInfo.Hint := GetRS('fmWaybill','MatInfo');
    btnMC.Hint := GetRS('fmWaybill', 'MCList');

    lSN.Caption := GetRS('fmWaybill','SNs') + ':';
    lNDSRate.Caption := GetRS('fmMaterials', 'NDSRate') + ':';
    //lDisc.Caption := GetRS('fmWaybill', 'Discount') + ', %:';
    lGTD.Caption := GetRS('fmWaybill', 'GTD') + ':';
    lCertNum.Caption := GetRS('fmWaybill', 'CertNum') + ':';
    lCertDate.Caption := GetRS('fmWaybill', 'CertDate') + ':';
    lProducer.Caption := GetRS('fmWaybill', 'Producer') + ':';

    chbWarranty.Properties.Caption := GetRS('fmWaybill', 'WarrantyDoc');
    lWPeriod.Caption := GetRS('fmWaybill', 'WarrantyPeriod') + ':';

    with cbWPeriodType.Properties do begin
      Items.Clear;
      Items.Add(GetRS('Period', 'Year_RM'));
      Items.Add(GetRS('Period', 'Month_RM'));
      cbWPeriodType.ItemIndex := 1;
    end;

    lHolder.Caption := GetRS('fmDiscCards', 'Holder') + ':';
    rbtDiscCard.Caption := GetRS('fmWaybill', 'DiscCard');
    rbtDiscManual.Caption := GetRS('fmWaybill', 'Manual');

    cbReuseModal.Properties.Caption := GetRS('fmWaybill', 'ReuseModalCap');
    cbReuseModal.Hint := GetRS('fmWaybill', 'ReuseModalHint');
  end;

  edDiscCard.InitRes;

  inherited;

  case CountryRules.AR of
    accRul_RU,
    accRul_UA: ;

    else
      begin
        lGTD.Visible := False;
        edGTD.Visible := False;
        lCertNum.Visible := False;
        edCertNum.Visible := False;
        lCertDate.Visible := False;
        edCertDate.Visible := False;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edNamePropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edNamePropertiesChange') else _udebug := nil;{$ENDIF}

  lWName.Visible := Trim(edName.Text)='';
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edShortNamePropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edShortNamePropertiesChange') else _udebug := nil;{$ENDIF}

  DataModified(Sender);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.FormCreate(Sender: TObject);
  var
    intTmp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.FormCreate') else _udebug := nil;{$ENDIF}

  edFindMat.OnTypeChanged := edFindMatOnTypeChange;
  edFindMat.AllowZeroRest := False;
  inherited;

  WHChangeMode := False;
  FInAcc := False;
  sbAddWHouse.ImageIndex := 26;
  edAmount.DecimalPlaces := Trunc(Abs(MatDisplayDigits));
  btnShowNDS.ImageIndex := 104;
  panSummary.Align := alTop;
  panSummary.Height := 93;

  SetCaptions;

  cdsPriceTypes.Open;
  sbShowPriceIn.ImageIndex := 104;
  ManualPrice := False;
  FCanRefresh := True;

  edFindMat.LoadFromRegistry(MainRegKey + '\' + Self.Name + '\Find');

  if ReadFromRegInt(MainRegKey + '\' + Self.Name + '\', 'Rsv', intTmp)
    then chbRsv.Checked := intTmp = 1;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'ReuseModal', intTmp)
    then cbReuseModal.Checked := intTmp = 1;

  cbReuseModalShow;

  FByOrder := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edAmountPropertiesChange(Sender: TObject);
 var
   tmpremain, tmpsumm, summamount: Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edAmountPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  CalcSummary;
  tmpremain := 0;
  tmpsumm := 0;
  summamount := 0;

  if chbRsv.Checked then begin
    if edAmount.Tag = 0 then begin
      //Резерв позиций
      try
        edSN.Text := '';
        tmpremain := strtofloat(edAmount.EditingText);
        mdRsv.Close;
        mdRsv.Open;
        with mdPosition do begin
          First;

          while not Eof and (tmpremain > 0) do begin
           if (tmpremain <= strtofloat(fieldbyname('amount').AsString)) and (strtofloat(fieldbyname('amount').AsString) > 0)
           then begin
             mdRsv.Append;
             mdRsv.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
             mdRsv.FieldByName('pricein').AsFloat := strtofloat(FieldByName('price').AsString);
             mdRsv.FieldByName('amount').AsFloat := tmpremain;
             summamount := summamount + tmpremain;
             tmpsumm := tmpsumm + (tmpremain * strtofloat(FieldByName('price').AsString));

             if not FieldByName('SN').IsNull then begin
               mdRsv.FieldByName('SN').AsString := FieldByName('SN').AsString;
               edSN.Text := edSN.Text+mdRsv.FieldByName('SN').AsString+'; ';
             end;

             mdRsv.Post;
           end//if
           else
             if strtofloat(fieldbyname('amount').AsString) > 0 then begin
               mdRsv.Append;
               mdRsv.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
               mdRsv.FieldByName('pricein').AsFloat := strtofloat(FieldByName('price').AsString);
               mdRsv.FieldByName('amount').AsFloat := strtofloat(FieldByName('amount').AsString);
               summamount := summamount + strtofloat(FieldByName('amount').AsString);
               tmpsumm := tmpsumm + (strtofloat(FieldByName('amount').AsString) * strtofloat(FieldByName('price').AsString));

               if not FieldByName('SN').IsNull then begin
                 mdRsv.FieldByName('SN').AsString := FieldByName('SN').AsString;
                 edSN.Text := edSN.Text + mdRsv.FieldByName('SN').AsString + '; ';
               end;//if

               mdRsv.Post;
             end;//if

           tmpremain := tmpremain - fieldbyname('amount').AsFloat;
           Next;
          end;//while
        end;//with

        if edSN.Text <> '' then edSN.Text := System.Copy(edSN.Text, 1, Length(edSN.Text) - 2);

      Except
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
procedure TfrmEditPositionAcc.edSummCurrPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edSummCurrPropertiesChange') else _udebug := nil;{$ENDIF}

  edsummdef.Value := edSummCurr.Value * FExchangeRate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edPriceNondsPropertiesChange(Sender: TObject);
  (*var
    v: extended;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edPriceNondsPropertiesChange') else _udebug := nil;{$ENDIF}

  if edPriceNoNDS.Tag=0 then begin
    try
      edPrice.Tag := 1;

      if edPriceNoNDS.EditingText=''
        then v := 0
        else v := NDSIn(StrToFloat(edPriceNoNDS.EditingText), PosNDS);

      edPrice.Value := v;
      edPrice.Tag := 0;

    except
      edPrice.Tag := 0;
      edPrice.Text := '';
    end;

    CalcSummary;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edSummCurrNoNdsPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edSummCurrNoNdsPropertiesChange') else _udebug := nil;{$ENDIF}

  edSummDefNoNds.Value := edSummCurrNoNds.Value * FExchangeRate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPositionAcc.cdsWhouseAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.cdsWhouseAfterOpen') else _udebug := nil;{$ENDIF}

  if cdsWHouse.Locate('def', 1, []) then cbWhouse.KeyValue := cdsWHouse.FieldByName('wid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.CalcSummary;
 var
   FNDS, FSumWithNDS: Extended;
   FFinalPrice, FPrice, FPriceWONDS: Extended;
   FTaxSumm: Extended;
   FTmp: Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.CalcSummary') else _udebug := nil;{$ENDIF}

  stAmountEx.Caption := edAmount.Text;

  if CurrID <> BaseCurrID
    then lNDS.Caption := rs('fmWaybill', 'NDS') + ':'
    else lNDS.Caption := rs('fmWaybill', 'NDS') + ' ' + FloatToStr(FPosNDS) + '%:';

  try
    FPrice := StrToFloat(edPrice.EditText);
  except
    FPrice := 0;
  end;

  FPriceWONDS := FPrice;

  if WBOutPriceType = 1
    then FPrice := NDSIn(FPrice, FPosNDS)
    else FPriceWONDS := NDSOut(FPrice, FPosNDS);

  try
    if chbDiscount.Checked then begin
      try
        if btnDiscountType.Caption = '%'
          then FFinalPrice := RoundToA(FPrice - ((FPrice / 100) * StrToFloat(edDiscount.EditText)), -6)
          else FFinalPrice := RoundToA(FPrice - StrToFloat(edDiscount.EditText), -6);

      except
        FFinalPrice := StrToFloat(edPrice.EditText);
      end; // try
    end
    else begin
      FFinalPrice := FPrice;
    end;

    FFinalPrice := RoundToA(FFinalPrice, -6);

    if not ManualPrice then FFinalPrice := SalesPriceRound(FFinalPrice);

    stPriceDiscount.Caption := FloatToStr(FFinalPrice);

    NDSCalc(StrToFloat(edAmount.EditText), FFinalPrice, FPosNDS, 1, FSumWONDS, FNDS);
    FSumWithNDS := RoundToA(FSumWONDS + FNDS, -2);
    FSumWONDS := RoundToA(FSumWithNDS - RoundToA(FNDS, -2), -2);

    FTaxSumm := 0;

    if True{chbUseTaxes.Checked} then begin
      if not edFindMat.Taxes.IsEmpty then
        with edFindMat.Taxes do begin
          First;
          while not Eof do begin
            if AllowTax(FieldByName('taxtype').AsInteger, KAType)
              then FTaxSumm := FTaxSumm + RoundToA(FSumWONDS * FieldByName('onvalue').AsFloat / 100, -2);
              
            Next;
          end;
        end;
    end;

    if CurrID = BaseCurrID then begin
      stSumm.Caption := FormatFloat(MoneyDisplayFormat, FSumWONDS);
      stSummNDS.Caption := FormatFloat(MoneyDisplayFormat, FNDS);
      stSummWithNDS.Caption := FormatFloat(MoneyDisplayFormat, FSumWithNDS + FTaxSumm);
      FPosSum := FSumWithNDS + FTaxSumm;
    end
    else begin
      FPosSum := RoundToA(FFinalPrice * StrToFloat(edAmount.EditText), RoundSumm) + FTaxSumm;
      stSumm.Caption := FormatFloat(MoneyDisplayFormat, FPosSum);
    end;

    stSumm.Hint := stSumm.Caption;
    stSummNDS.Hint := stSummNDS.Caption;
    stSummWithNDS.Hint := stSummWithNDS.Caption;
    stAmountEx.Hint := stAmountEx.Caption;

  except
    stSumm.Caption := '';
    stSummNDS.Caption := '';
    stSummWithNDS.Caption := '';
    stSumm.Hint := stSumm.Caption;
    stSummNDS.Hint := stSummNDS.Caption;
    stSummWithNDS.Hint := stSummWithNDS.Caption;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfrmEditPositionAcc.SetCurrID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.SetCurrID') else _udebug := nil;{$ENDIF}

  FCurrID := Value;

  if Value = BaseCurrID then begin
    if WBOutPriceType = 0
      then lPrice.Caption := rs('fmWaybill', 'PriceWithNDS') + ':'
      else lPrice.Caption := rs('fmWaybill', 'PriceWONDS') + ':';

    lSummWONDS.Caption := rs('fmWaybill', 'Summ') + ' ' + rs('fmWaybill', 'outNDS') + ':';
  end
  else begin
    lPrice.Caption := rs('fmWaybill','Price') + ':';
    lSummWONDS.Caption := rs('fmWaybill', 'Summ') + ':';
    //lPriceNoNDS.Enabled := False;
    //edPriceNoNDS.Enabled := False;
    lNDS.Enabled := False;
    stSummNDS.Enabled := False;
    lSummWithNDS.Enabled := False;
    stSummWithNDS.Enabled := False;
    stSummWithNDS.Caption := '';
    stSummNDS.Caption := '';
    //stCurrShortNameOutNDS.Font.Color := clBtnShadow;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edPricePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edPricePropertiesChange') else _udebug := nil;{$ENDIF}

  if edPrice.Focused then begin
    ManualPrice := True;
    lcbPriceTypes.Text := '';
    ManualPrice := false;
  end;

  FModified := True;

  CalcSummary;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.aShowPriceInExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.aShowPriceInExecute') else _udebug := nil;{$ENDIF}

  aShowPriceIn.Checked := not aShowPriceIn.Checked;
  sbShowPriceIn.Checked := not sbShowPriceIn.Checked;

  {if aShowPriceIn.Checked
      then Top := Top+PanPriceIn.Height
      else Top := Top-PanPriceIn.Height;
  PanPriceIn.Visible := sbShowPriceIn.Checked;
  }

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edAmountKeyPress(Sender: TObject; var Key: Char);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edAmountKeyPress') else _udebug := nil;{$ENDIF}

  if (lAmount.Font.Color <> clRed) and (Key = #13) then edPrice.setFocus;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edPriceKeyPress(Sender: TObject; var Key: Char);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edPriceKeyPress') else _udebug := nil;{$ENDIF}

  if Key = '-' then Key := #0;
  if Key = #13
    then edNDS.setFocus
    else GoNext(Sender, Key);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edPriceNoNDSKeyPress(Sender: TObject; var Key: Char);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edPriceNoNDSKeyPress') else _udebug := nil;{$ENDIF}

  if lPrice.Font.Color <> clRed then GoNext(Sender,Key);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.chbRsvPropertiesChange(Sender: TObject);
  var
   tmpAmount:Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.chbRsvPropertiesChange') else _udebug := nil;{$ENDIF}

  //if chbRsv.Checked then sbAddMat.Action := aAddMatR
  //else sbAddMat.Action := aAddMat;

  tmpAmount := edAmount.Value;
  edAmount.Value := WBOutDefAmount;
  edAmount.Value := tmpAmount;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.aAddMatRExecute(Sender: TObject);
  var
    aid:integer; mr: TModalResult;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.aAddMatRExecute') else _udebug := nil;{$ENDIF}

  if edDiscCard.Editor.Focused
  then edDiscCard.ShowRef
  else if FCurrCtrl = cbWHouse then begin
    try
      aid := cbWHouse.KeyValue;
    except
      aid := 0;
    end;

    cbWhouse.SetFocus;
    ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate, aid);
  end
  else if FCurrCtrl = edAmount then begin
    aPartysSelect.Execute;
  end
  else begin
    if (not FByOrder) and (chbRsv.Checked or WBOutAutoWH) then begin
      mr := ShowModalRef(Self, rtWMat, vtWMat, 'TfmWMat', Now, integer(mdPosition), -FMatID);
    end
    else begin
      try
        aid := edFindMat.MatID;
      except
        aid := 0;
      end;

      mr := ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, aid);
    end;

    {if (mr = mrCancel) and (edFindMat.Text = '') then begin
       ModalResult := mrCancel; // cancel on warehouse and no mat selected yet - cancelling too
    end;
    }
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edMatKeyPress(Sender: TObject; var Key: Char);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edMatKeyPress') else _udebug := nil;{$ENDIF}

  if (Key = #8) and (edFindMat.MatID>0) then begin
    Delete(FFindStr, Length(FFindStr), 1);
    FBSPressed := True;
  end
  else begin
    if (Key = #13) {and not FKeyPressed} then
      if lMat.Font.Color <> clRed
        then GoNext(Sender,Key)
        else Key := #0;
    FBSPressed := False;
  end;
  FKeyPressed := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPositionAcc.cbWHouseKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.cbWHouseKeyPress') else _udebug := nil;{$ENDIF}

  if (Key = #13) and (lWhouse.Font.Color <> clRed) then edAmount.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.lcbPriceTypesPropertiesChange(Sender: TObject);
  var
    FPrice: Extended;
    FWithNDS: Boolean;
    FTmp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  if ManualPrice then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.lcbPriceTypesPropertiesChange') else _udebug := nil;{$ENDIF}

  try
    FPrice := 0.0;

    if FMatID > 0 then begin
      if WBOutAutoPrice > 0 then begin

        if WBOutAutoPrice = 1
          then FTmp := 0
          else FTmp := FKAID;

        FPrice := GetLastOutPrice(dmData.SConnection, FMatID, CurrID, OnDate, FExchangeRate, FTmp);
        FPrice := RoundToA(FPrice, PriceDisplayDigits);

        FWithNDS := True;

        case WBOutPriceType of
          0: if not FWithNDS then FPrice := NDSIn(FPrice, FPosNDS);
          1: if FWithNDS then FPrice := NDSOut(FPrice, FPosNDS);
        end;
        FPrice := RoundToA(FPrice, PriceDisplayDigits);

        edPrice.Value := FPrice;
      end //if WBOutAutoPrice > 0
      else if (WBOutAutoPrice = 0) or (FPrice = 0) then begin
        if POType = poAvg
          then FPrice := FAvgPrice
          else FPrice := FLastInPrice;

        if lcbPriceTypes.EditingText <> '' then begin
          FPrice := GetDefPriceOut(dmData.SConnection, FMatID, lcbPriceTypes.KeyValue, FPrice, OnDate, FExchangeRate, FWithNDS, CurrID);

          case WBOutPriceType of
            0: if not FWithNDS then FPrice := NDSIn(FPrice, FPosNDS);
            1: if FWithNDS then FPrice := NDSOut(FPrice, FPosNDS);
          end;

          FPrice := RoundToA(FPrice, PriceDisplayDigits);
          edPrice.Value := FPrice;
        end
        else edPrice.Value := 0;

      end
    end
    else edPrice.Value := 0;

  except
    edPrice.Value := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.chbDiscountPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.chbDiscountPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  try
    if not(chbDiscount.Checked)
       and not((StrToFloat(edDiscount.EditText) >= 0) and (StrToFloat(edDiscount.EditText) <= 100))
    then edDiscount.Value := 0;

  except
    edDiscount.Value := 0;
  end;

  CalcSummary;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edDiscountKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edDiscountKeyPress') else _udebug := nil;{$ENDIF}

  if Key > #29 then FDiscChanged := True;
  if chbDiscount.Style.Font.Color <> clRed then GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edDiscountPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edDiscountPropertiesChange') else _udebug := nil;{$ENDIF}

  try
    if btnDiscountType.Caption = '%' then begin
      if StrToFloat(edDiscount.EditText) > 99
        then edDiscount.Value := 99
        else if StrToFloat(edDiscount.EditText) < 0 then edDiscount.Value := 0;
    end
    else begin
      if StrToFloat(edDiscount.EditText) >= StrToFloat(edPrice.EditText) then edDiscount.Value := 0;
    end;

  except
  end;

  if edDiscount.Tag = 0 then begin
    FModified := true;
    CalcSummary;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.aSetKursExecute(Sender: TObject);
  (*var
    remain, rsv: extended;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.aSetKursExecute') else _udebug := nil;{$ENDIF}

  with TfrmCurrencyEdit.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmCurrency';
    OnDate := Self.OnDate;
    ID := Self.CurrID;
    if Self.FRateDate=Self.OnDate then SubID := Self.FRateID;
    SetFocusToRate := True;
    SetInactive;

    if ShowModal = mrOk then  begin
      FExchangeRate := GetCurrencyRate(dmData.SConnection, Self.FCurrID, Self.OnDate, Self.FRateDate, Self.FRateID);
      aSetKurs.Caption := FloatToStr(FExchangeRate);
      SendMessage(ParentHandle2, WM_REFRESH, 0, integer(rtSetKurs));

      //Получение интервала цен для товара по новому курсу
      GetMatPrices(dmData.SConnection, edMat.Tag,FMinPrice,FMaxPrice,FAvgPrice,FLastInPrice,remain, rsv);

      if ShowPrices then begin
        stMinPrice.Caption := FormatFloat(MoneyDisplayFormat, minprice/FExchangeRate);
        stMaxPrice.Caption := FormatFloat(MoneyDisplayFormat, maxprice/FExchangeRate);
        stAvgPrice.Caption := FormatFloat(MoneyDisplayFormat, avgprice/FExchangeRate);
      end
      else begin
        stMinPrice.Caption := rs('Common', 'NA');
        stMaxPrice.Caption := rs('Common', 'NA');
        stAvgPrice.Caption := rs('Common', 'NA');
      end;

      AvgPrice := avgprice / FExchangeRate;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPositionAcc.btnInfoClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.btnInfoClick') else _udebug := nil;{$ENDIF}

  if FMatID = 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := FMatID;
      CanModify := False;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.btnMoveClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.btnMoveClick') else _udebug := nil;{$ENDIF}

  if FMatID = 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatMove.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Self.OnDate;
      WID := 0; //cbWHouse.KeyValue;
      ID := FMatID;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.btnRsvClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.btnRsvClick') else _udebug := nil;{$ENDIF}

  if FMatID = 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatRsv.Create(nil) do
    try
     ParentNameEx := 'fmWMat';
     OnDate := Self.OnDate;
     WID := 0;
     ID := FMatID;
     ShowModal;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.cdsPriceTypesBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.cdsPriceTypesBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsPriceTypes.Params.ParamByName('matid').AsInteger := FMatID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  edFindMat.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.FormDestroy') else _udebug := nil;{$ENDIF}

  {if mnuName.Checked
    then Temp := 0
    else Temp := 1;

  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'FindField', Temp);
  if aFindBegin.Checked then Temp := 0
  else if aFindSubstr.Checked then Temp := 1
  else if aFindConcurr.Checked then Temp := 2;
  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'FindCriteria', Temp);
  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'ContextFind', Integer(aContextFind.Checked));
  }

  WriteToRegInt(MainRegKey + '\' + Self.Name + '\', 'Rsv', Integer(chbRsv.Checked));
  edFindMat.SaveToRegistry(MainRegKey + '\' + Self.Name + '\Find');
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'ReuseModal', Integer(cbReuseModal.Checked));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.chbRsvClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.chbRsvClick') else _udebug := nil;{$ENDIF}

  if chbRsv.Checked
    then begin
      aAddMatR.Hint := rs('fmWaybill', 'WHouse');
      edAmountPropertiesChange(edAmount);
    end
    else begin
      aAddMatR.Hint := rs('fmWaybill', 'MatAdd');
      mdRsv.Close;
      mdRsv.Open;
    end;

    SetAddProps;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edMatEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edMatEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edMatExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edMatExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.sbAddMatMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.sbAddMatMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.sbAddWHouseMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.sbAddWHouseMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := cbWHouse;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.cbWHousePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.cbWHousePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if (cbWHouse.KeyValue <= 0) or (cbWHouse.Tag <> 0) then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  EdFindMat.WareHouses := IntToStr(cbWHouse.KeyValue); // setting allowed warehouses list

  if edFindMat.MatID <= 0 then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  WHChangeMode := True;
  FWid := cbWHouse.KeyValue;
  //EdFindMat.findAgain;
  SendMessage(Self.Handle, WM_REFRESH, FMatID, Integer(rtMat));
  WHChangeMode := False;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edPricePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edPricePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if edPrice.Value < 0 then edPrice.Value := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edNDSPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edNDSPropertiesChange') else _udebug := nil;{$ENDIF}

  if edNDS.Tag = 0 then
    try
      FPosNDS := StrToFloat(edNDS.EditText);
    except
      FPosNDS := 0;
    end;

  FModified := True;
  CalcSummary;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.aPartysSelectExecute(Sender: TObject);
  var
    tmpamount:Extended;
    str:string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.aPartysSelectExecute') else _udebug := nil;{$ENDIF}

  tmpamount := 0;

  if (not mdPosition.Active) or (mdPosition.IsEmpty) then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmPartySelect.Create(nil) do
  try
    FBySN := Self.FBySN;
    mdSN.Open;

    try
      FAmount := Round(StrToFloat(edAmount.EditingText));
    except
      FAmount := 0;
    end;

    FChkAmount := FInAcc and FBySN;
    MatName := Self.FMatName;

    {if FBySN then begin
      colAsel.Precision := 0;
  colAsel.DisableEditor := true;
  colAsel.ReadOnly := True;
    end;
    else colAsel.Precision := 3;
    }

    //if GetDSCount(mdPosition, 'postype', 0) > 0 then begin
      mdSN.Append;
      mdSN.FieldByName('posid').AsInteger := 0;
      mdSN.FieldByName('pid').AsInteger := 0;

      if GetDSCount(mdPosition, 'postype', 0) > 0
        then mdSN.FieldByName('docnumtxt').AsString := rs('fmWaybill', 'MatAtWH')
        else mdSN.FieldByName('docnumtxt').AsString := rs('fmWaybill', 'NoMatAtWH');

      mdSN.Post;
    //end;

    if GetDSCount(mdPosition, 'postype', 1) > 0 then begin
      mdSN.Append;
      mdSN.FieldByName('posid').AsInteger := -1;
      mdSN.FieldByName('pid').AsInteger := -1;
      mdSN.FieldByName('docnumtxt').AsString := rs('fmWaybill', 'MatOrdered');
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

        if mdRsv.Active and mdRsv.Locate('posid',FieldByName('posid').AsInteger,[]) then begin
          mdSN.FieldByName('checked').AsBoolean := true;
          mdSN.FieldByName('asel').AsFloat := mdRsv.FieldByName('amount').AsFloat;
        end//if
        else begin
          mdSN.FieldByName('checked').AsBoolean := false;
          mdSN.FieldByName('asel').AsFloat := 0
        end;//else

        mdSN.Post;
        Next;
      end;//while not eof
    end;//with mdPosition

    mdSN.First;

    if ShowModal = mrOk then begin
      mdRsv.Close;
      mdRsv.Open;
      edSN.Text := '';

      with mdSN do begin
        First;
        tmpamount := 0;

        while not Eof do begin
          if (FieldByName('checked').AsBoolean)
             and (RoundToA(FieldByName('asel').AsFloat, MatDisplayDigits) > 0)
             and mdPosition.Locate('posid',FieldByName('posid').AsInteger, [])
          then begin
            mdRsv.Append;
            mdRsv.FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
            mdRsv.FieldByName('pricein').AsFloat := strtofloat(mdPosition.FieldByName('price').AsString);
//mdRsv.FieldByName('postype').AsInteger := FieldByName('postype').AsInteger;
            mdRsv.FieldByName('amount').AsFloat := RoundToA(FieldByName('asel').AsFloat, MatDisplayDigits);

            tmpamount := tmpamount + mdRsv.FieldByName('amount').AsFloat;

            if not mdPosition.FieldByName('SN').IsNull then begin
              mdRsv.FieldByName('SN').AsString := mdPosition.FieldByName('SN').AsString;
              edSN.Text := edSN.Text+mdPosition.FieldByName('SN').AsString+'; ';
            end;//if

            mdRsv.Post;
          end;//if

          Next;
        end;//while
      end;//with

      SetAddProps;

      if edSN.Text <> '' then edSN.Text := System.Copy(edSN.Text,1,Length(edSN.Text)-2);

      edAmount.Tag := 1; edAmount.Value := RoundToA(tmpamount, MatDisplayDigits); edAmount.Tag := 0;
    end;//if

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edSN1Enter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edSN1Enter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := edSN;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edSN1Exit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edSN1Exit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.mdPositionCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.mdPositionCalcFields') else _udebug := nil;{$ENDIF}

  with DataSet do begin
    FieldByName('docnumtxt').AsString := FieldByName('docnum').AsString
         + rs('fmWaybill','AttDate',3) + DateTimeToStr(FieldByName('docdate').AsDateTime);

    FieldByName('pricetxt').AsString := FloatToStr(FieldByName('price').AsFloat) + ' ' + FieldByName('currname').AsString;
  end;//with

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edfindMatOnTypeChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edfindMatOnTypeChange') else _udebug := nil;{$ENDIF}

  edMatRB.ItemIndex := edFindMat.CurrentSearchIndex;
  cbReuseModalShow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edFindMatChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edFindMatChange') else _udebug := nil;{$ENDIF}

  FMatID := edFindMat.MatID;

  if edFindMat.MatID = 0
    then lMatEx.Caption := ''
    else begin
      lMatEx.Left := lTitle.Left + lTitle.Width;
      lMatEx.Width := panTitleButtons.Left - 2 - lMatEx.Left;
      lMatEx.Caption := ': ' + edFindMat.MatName;
      FModified := true;
    end;

  if edFindMat.Tag = 0
    then SendMessage(Self.Handle, WM_REFRESH, FMatID, integer(rtMat));

  if Self.Visible then
    if cbReuseModal.Visible and cbReuseModal.Checked and (edFindMat.searchState = oseFound)
    then ModalResult := mrYes;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edFindMatRefButtonClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edFindMatRefButtonClick') else _udebug := nil;{$ENDIF}

  FCurrCtrl := edFindMat;
  edFindMat.Editor.SetFocus;
  aAddMatR.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.aShowNDSExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.aShowNDSExecute') else _udebug := nil;{$ENDIF}

  aShowNDS.Checked := not aShowNDS.Checked;
  btnShowNDS.Checked := not aShowNDS.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.cdsPriceTypesAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.cdsPriceTypesAfterOpen') else _udebug := nil;{$ENDIF}

  if (PTypeID > 0) and cdsPriceTypes.Locate('ptypeid', PTypeID, [])
    then lcbPriceTypes.KeyValue := PTypeID
    else if cdsPriceTypes.Locate('def', 1, [])
      then begin
        lcbPriceTypes.KeyValue := 0;
        lcbPriceTypes.KeyValue := cdsPriceTypes.FieldByName('ptypeid').AsInteger;
      end;  

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.aSetPanelsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.aSetPanelsExecute') else _udebug := nil;{$ENDIF}

  with TfrmSetPanels.Create(nil) do
  try
    MainHandle := Self.Handle;
    FList.AddObject(rs('fmWaybill', 'PanMat'), panMat);
    FList.AddObject(rs('fmWaybill', 'PanPrice'), panPrice);
    FList.AddObject(rs('fmWaybill', 'PanSN'), panSN);
    FList.AddObject(rs('fmWaybill', 'PanAddProps'), panAddProps);
    FList.AddObject(rs('fmWaybill', 'PanDiscount'), panDiscount);
    FList.AddObject(rs('fmWaybill', 'PanInterval'), panInterval);

    if panWarranty.Tag <> -1 then FList.AddObject(rs('fmWaybill', 'PanWarranty'), panWarranty);

    FList.AddObject(rs('fmWaybill', 'PanSummary'), panSummary);
    SetPanels;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.WMRealignPanels(var M: TMessage);
 var
   FList: TStringList;
   i: Integer;
   FVis: Boolean;
   FPan: TPanel;
   FOffs: Integer;
   Y: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.WMRealignPanels') else _udebug := nil;{$ENDIF}

  FList := TStringList(Pointer(M.WParam));
  FOffs := 0;
  panSummary.Align := alNone;
  panSummary.Height := 93;

  for i := 0 to FList.Count - 1 do begin
    FVis := FList.Strings[i] = '1';
    FPan := TPanel(FList.Objects[i]);
    //if FPan.Visible <> FVis then begin
      if FVis then FOffs := FOffs + FPan.Height;
  //else FOffs := FOffs - FPan.Height;
      FPan.Visible := FVis;
//end;
  end;
  panSummary.Align := alClient;
  Self.ClientHeight := panMat.Top + BaseHeight + FOffs + 21;
  //if FOffs <> 0 then Self.Height := Self.Height + FOffs;

  Y := panPrice.Top + panPrice.Height - 1;
  if panSN.Visible then begin
    panSN.Top := Y;
    Y := Y + panSN.Height;
  end;

  if panDiscount.Visible then begin
    panDiscount.Top := Y;
    Y := Y + panDiscount.Height;
  end;

  if panInterval.Visible then begin
    panInterval.Top := Y;
    Y := Y + panInterval.Height;
  end;

  if panAddProps.Visible then begin
    panAddProps.Top := Y;
    Y := Y + panAddProps.Height;
  end;

  if panWarranty.Visible then begin
    panWarranty.Top := Y;
    Y := Y + panWarranty.Height;
  end;
  SavePanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.RealignPanels;
  var
    FOffs: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.RealignPanels') else _udebug := nil;{$ENDIF}

  FOffs := panPrice.Top + panPrice.Height;
  PanSummary.Height := 93;
  if panDiscount.Visible then FOffs := FOffs + panDiscount.Height;
  if panInterval.Visible then FOffs := FOffs + panInterval.Height;
  if panSN.Visible then FOffs := FOffs + panSN.Height;
  if panSummary.Visible then FOffs := FOffs + panSummary.Height;
  if panAddProps.Visible then FOffs := FOffs + panAddProps.Height;
  if panWarranty.Visible then FOffs := FOffs + panWarranty.Height;
  panSummary.Align := alClient;
  //if not panSummary.Visible then FOffs := FOffs + 7;
  if FOffs <> 0 then Self.ClientHeight := BaseHeight + FOffs + 21;
  SavePanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.DoCreate;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.DoCreate') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.FormShow') else _udebug := nil;{$ENDIF}

  try
    if WBType <> wbtWaybillOut then begin
      panWarranty.Visible := False;
      panWarranty.Tag := -1;

      with FormStorage.StoredProps do Delete(IndexOf('panWarranty.Visible'));
    end;

    if not FRealigned then begin
      RealignPanels;
      FRealigned := True;
    end
    else LoadPanVisibility;

    if not edAmount.Enabled then edPrice.SetFocus;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.SavePanVisibility;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.SavePanVisibility') else _udebug := nil;{$ENDIF}

  FPanDiscountVis := panDiscount.Visible;
  FPanIntervalVis := panInterval.Visible;
  FPanSNVis := panSN.Visible;
  FPanAddPropsVis := panAddProps.Visible;
  FPanWarrantyVis := panWarranty.Visible;
  FPanSummaryVis := panSummary.Visible;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.LoadPanVisibility;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.LoadPanVisibility') else _udebug := nil;{$ENDIF}

  panSN.Visible := FPanSNVis;
  panDiscount.Visible := FPanDiscountVis;
  panInterval.Visible := FPanIntervalVis;
  panAddProps.Visible := FPanAddPropsVis;
  panWarranty.Visible := FPanWarrantyVis;
  panSummary.Visible := FPanSummaryVis;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.aShowSNExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.aShowSNExecute') else _udebug := nil;{$ENDIF}

  if FBySN then
  with TfrmSerials.Create(nil) do
  try
    colSN.DisableEditor := true;
    mdSN.Open;

    with mdRsv do begin
      First;

      while not Eof do begin
        if mdPosition.Locate('posid',FieldByName('posid').AsInteger,[]) and not mdPosition.FieldByName('SN').IsNull
        then begin
          mdSN.Append;
          mdSN.FieldByName('num').AsInteger := mdSN.RecNo;
          mdSN.FieldByName('sn').AsString := mdPosition.FieldByName('SN').AsString;
          mdSN.Post;
        end;//if

        Next;
      end;//while
    end;//with

    if not mdSN.IsEmpty then begin
      mdSN.First;
      ShowModal;
    end;//if

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edSNPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edSNPropertiesButtonClick') else _udebug := nil;{$ENDIF}

  aShowSN.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.SetCurrName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.SetCurrName') else _udebug := nil;{$ENDIF}

  FCurrName := Value;

  txtFinallyPriceCurr.Caption := Value;
  stCurrShortName.Caption := Value;
  txtSummNDS.Caption := Value;
  txtSummWONDS.Caption := Value;
  txtSummWithNDS.Caption := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.GetProducers;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.GetProducers') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  with newDataSet do
    try
      ProviderName := 'p_Mat_GetProducers';
      Open;

      while not Eof do begin
        if FieldByName('producer').AsString <> ''
          then cbProducer.Properties.Items.Add(FieldByName('producer').AsString);

        Next;
      end;
      Close;

    finally
      Free;
      Screen.Cursor := crDefault;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.cbProducerPropertiesInitPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.cbProducerPropertiesInitPopup') else _udebug := nil;{$ENDIF}

  if cbProducer.Properties.Items.Count = 0 then GetProducers;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.SetAddProps;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.SetAddProps') else _udebug := nil;{$ENDIF}

  if chbRsv.Checked then begin
    if not mdRsv.Active then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    mdRsv.First;
    if mdPosition.Locate('posid', mdRsv.FieldByName('posid').AsInteger, [])
    then begin
      cbProducer.EditingText := mdPosition.FieldByName('producer').AsString;
      edGTD.EditingText := mdPosition.FieldByName('gtd').AsString;
      edCertNum.EditingText := mdPosition.FieldByName('certnum').AsString;

      if mdPosition.FieldByName('certdate').AsDateTime = 0
        then edCertDate.EditValue := Null
        else edCertDate.Date := mdPosition.FieldByName('certdate').AsDateTime;
    end;
  end
  else begin
    cbProducer.Clear;
    edGTD.Clear;
    edCertNum.Clear;
    edCertDate.EditValue := Null;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.SaveAddProps;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.SaveAddProps') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
function TfrmEditPositionAcc.AllowTax(const ATaxType, AKType: Integer): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.AllowTax') else _udebug := nil;{$ENDIF}

  Result := ((ATaxType in [TaxForAll, TaxForPersons]) and (AKType in [bpKindClient, bpKindAny]))
               or
            ((ATaxType in [TaxForAll, TaxForCompanies]) and (AKType in [bpKindSupplier]));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.chbWarrantyClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.chbWarrantyClick') else _udebug := nil;{$ENDIF}

  lWPeriod.Enabled := chbWarranty.Checked;
  edWPeriod.Enabled := chbWarranty.Checked;
  cbWPeriodType.Enabled := chbWarranty.Checked;
  if chbWarranty.Checked and (edWPeriod.Text = '') then edWPeriod.Value := 12;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edWPeriodPropertiesChange(Sender: TObject);
  var
    D1, D2: Char;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edWPeriodPropertiesChange') else _udebug := nil;{$ENDIF}

  if edWPeriod.EditingText = '' then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  D1 := edWPeriod.EditingText[Length(edWPeriod.EditingText)];

  if Length(edWPeriod.EditingText) > 1
    then D2 := edWPeriod.EditingText[Length(edWPeriod.EditingText) - 1]
    else D2 := #0;

  if D1 = '1' then begin
    cbWPeriodType.Properties.Items[0] := rs('Period', 'Year');
    cbWPeriodType.Properties.Items[1] := rs('Period', 'Month');
  end
  else if (D1 in ['2'..'4']) and (D2 <> '1') then begin
    cbWPeriodType.Properties.Items[0] := rs('Period', 'Year_R');
    cbWPeriodType.Properties.Items[1] := rs('Period', 'Month_R');
  end
  else begin
    cbWPeriodType.Properties.Items[0] := rs('Period', 'Year_RM');
    cbWPeriodType.Properties.Items[1] := rs('Period', 'Month_RM');
  end;

  cbWPeriodType.ItemIndex := cbWPeriodType.ItemIndex;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.aMCExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.aMCExecute') else _udebug := nil;{$ENDIF}

  if FMatID <= 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMCList.Create(nil) do
  try
    MainHandle := Self.Handle;
    OnDate := Self.OnDate;
    ID := Self.FMatID;
    MainHandle := Self.Handle;
    CheckRemain := False;
    CanModify := False;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.WMSetText(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.WMSetText') else _udebug := nil;{$ENDIF}

  inherited;

  lTitle.Caption := panTitleBar.Caption;

  if not Assigned(edFindMat) then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if (edFindMat.MatID = 0)
    then lMatEx.Caption := ''
    else begin
      lMatEx.Left := lTitle.Left + lTitle.Width;
      lMatEx.Width := panTitleButtons.Left - 2 - lMatEx.Left;
      lMatEx.Caption := ': ' + edFindMat.MatName;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edDiscCardChange(Sender: TObject);
  var
    FDisc: Extended;
    FSum: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edDiscCardChange') else _udebug := nil;{$ENDIF}

  txtDiscHolder.Caption := edDiscCard.Obj.Holder;
  FDisc := edDiscCard.Obj.Discount;

  if (edDiscCard.CardID > 0) and WBOutCheckDC and FmdDCT.Active and FmdDCT.Locate('cardid', edDiscCard.CardID, [])
  then begin
    FSum := edDiscCard.Obj.Total + GetDCSum;

    with FmdDCT do begin
      try
        SortOnFields('cardid;treshold');

        First;
        while not Eof do begin
          if (FieldByName('cardid').AsInteger = edDiscCard.CardID) and (FSum < FieldByName('treshold').AsFloat)
          then begin
            Prior;
            Break;
//FDisc := FieldByName('onvalue').AsFloat;
//Exit;
          end;

          Next;
        end;

        FDisc := FieldByName('onvalue').AsFloat;

      finally
      end;
    end;
  end;
  edDiscount.Value := FDisc;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.rbtDiscManualClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.rbtDiscManualClick') else _udebug := nil;{$ENDIF}

  if rbtDiscCard.Checked
    then txtDiscHolder.Caption := edDiscCard.Obj.Holder
    else txtDiscHolder.Caption := '';

  if rbtDiscManual.Checked
    then begin
      if not FDiscChanged then edDiscount.Value := FDirectDiscount
    end
    else if edDiscCard.CardID > 0
      then edDiscount.Value := edDiscCard.Obj.Discount;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edFindMatWeightChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edFindMatWeightChanged') else _udebug := nil;{$ENDIF}

  edAmount.Value := edFindMat.Weight;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.rbtDiscCardKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.rbtDiscCardKeyPress') else _udebug := nil;{$ENDIF}

  if Key = #13 then edDiscCard.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditPositionAcc.GetDCSum: Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.GetDCSum') else _udebug := nil;{$ENDIF}

  Result := 0;
  with FmdDC do begin
    First;
    while not Eof do begin
      if (FieldByName('cardid').AsInteger = edDiscCard.CardID)
         and (FieldByName('posid').AsInteger <> 0)
         and (FieldByName('posid').AsInteger <> FID)
      then Result := Result + FieldByName('total').AsCurrency;

      Next;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.cdsWhouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.cdsWhouseBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWhouse.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.aOrderExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.aOrderExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditOrderTmp.Create(nil) do
  try
    MainHandle := Self.Handle;
    ID := 0;

    if edFindMat.MatID > 0 then edMat.MatID := edFindMat.MatID;

    lcbWH.WID := Self.cbWHouse.KeyValue;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.GetRests;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.GetRests') else _udebug := nil;{$ENDIF}

  GetMatRestsLocal(mdPosition);

  if not mdPosition.IsEmpty then begin
    case ChargeType of
      ctFIFO: mdPosition.SortOnFields('postype;ondate');
      ctLIFO: mdPosition.SortOnFields('postype;ondate', True, True);
    end;

    mdPosition.First;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.aOrderOutExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.aOrderOutExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditOrderTmpOut.Create(nil) do
  try
    MainHandle := Self.Handle;
    ID := 0;
    OnDate := Self.OnDate;
    KAID := Self.FKAID;
    AccID := FAccOutID;

    if edFindMat.MatID > 0 then edMat.MatID := edFindMat.MatID;

    lcbWH.WID := Self.cbWHouse.KeyValue;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.SetDocType(const Value: TDocType);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.SetDocType') else _udebug := nil;{$ENDIF}

  FDocType := Value;
  if Value = dtOrderOut then begin
    aOrderOut.Visible := False;
    aOrderOut.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.aRemainsAtWHExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.aRemainsAtWHExecute') else _udebug := nil;{$ENDIF}

  with TfrmRemainsAtWH.Create(nil) do
  try
    ParentNameEx := '';
    MainHandle := Self.Handle;
    OnDate := Self.OnDate;
    ID := Self.edFindMat.MatID;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.cbReuseModalClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.cbReuseModalClick') else _udebug := nil;{$ENDIF}

  if Self.Visible then edFindMat.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edMatRBClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edMatRBClick') else _udebug := nil;{$ENDIF}

  inherited;
  edFindMat.CurrentSearchIndex := edMatRB.ItemIndex;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.edFindMatKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.edFindMatKeyDown') else _udebug := nil;{$ENDIF}

  inherited;

  if Key = 13 then edAmount.setFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if Key <> 13 then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionAcc.FormKeyDown') else _udebug := nil;{$ENDIF}

  inherited;

  if edFindMat.Focused then begin
    edAmount.SetFocus;
    Key := 0;
  end
  else if edAmount.Focused then begin
    edPrice.setFocus;
    Key := 0;
  end
  else if edPrice.Focused then begin
    btnOK.setFocus;
    Key := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionAcc.btnDiscountTypeClick(Sender: TObject);
begin
  if btnDiscountType.Caption = '%'
    then btnDiscountType.Caption := '$'
    else btnDiscountType.Caption := '%';
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditPositionAcc', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
