{$I ok_sklad.inc}
unit EditMoneyMove;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxEditor, StdCtrls, ssBaseConst,
  ActnList, ssBaseTypes, ssFormStorage, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, ssbaseDlg, ImgList,
  ssSpeedButton, ssBevel, ssPanel, ssGradientPanel, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, ssDBComboBox, cxCalc, ssCalcEdit, DB, DBClient,
  ssClientDataSet, ssDBLookupCombo, cxCheckBox, ssLabel, xButton, TB2Item,
  Menus, cxSpinEdit, cxTimeEdit, cxPC, ComCtrls, okSearchEdit,
  ssPageControl;

type
  TfrmEditMoneyMove = class(TBaseDlg)
    aFinance: TAction;
    aSetPanels: TAction;
    aWBDocs: TAction;
    btnAdFrom: TssSpeedButton;
    btnBallance: TssSpeedButton;
    btnCashDesks: TssSpeedButton;
    btnChargeType: TssSpeedButton;
    btnCvFinFrom: TssSpeedButton;
    btnCvFromRate: TssSpeedButton;
    btnCvToRate: TssSpeedButton;
    btnFinance: TssSpeedButton;
    btnFinFrom: TssSpeedButton;
    btnFinTo: TssSpeedButton;
    btnPrint: TssSpeedButton;
    btnSetPanels: TssSpeedButton;
    btnSetTime: TssSpeedButton;
    bvlKA: TssBevel;
    bvlMainInfo: TssBevel;
    bvlNotes: TssBevel;
    cbAdFrom: TcxComboBox;
    cbAdType: TcxComboBox;
    cbCvFrom: TcxComboBox;
    cbFrom: TcxComboBox;
    cbTo: TcxComboBox;
    cbType: TcxComboBox;
    cdsCashDesks: TssClientDataSet;
    cdsChargeType: TssClientDataSet;
    cdsCurrency: TssClientDataSet;
    cdsEntAcc: TssClientDataSet;
    cdsEntAccACCID: TIntegerField;
    cdsEntAccACCNUM: TStringField;
    cdsEntAccBANKID: TIntegerField;
    cdsEntAccfullname: TStringField;
    cdsEntAccMFO: TStringField;
    cdsEntAccNAME: TStringField;
    cdsEntAccTYPEID: TIntegerField;
    cdsEntAccTYPENAME: TStringField;
    cdsPayMPersons: TssClientDataSet;
    cdsPayType: TssClientDataSet;
    chbChecked: TcxCheckBox;
    edAdTotal: TssCalcEdit;
    edCCFromSumm: TssCalcEdit;
    edCCPercent: TssCalcEdit;
    edCCToSumm: TssCalcEdit;
    edCvFromTotal: TssCalcEdit;
    edCvToTotal: TssCalcEdit;
    edDocNum: TcxTextEdit;
    edOnDate: TcxDateEdit;
    edReason: TcxTextEdit;
    edTime: TcxTimeEdit;
    edTotalFrom: TssCalcEdit;
    edTotalTo: TssCalcEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    imgType: TImage;
    lAccount: TssLabel;
    lAccountTo: TssLabel;
    lAdAcc: TssLabel;
    lAdCash: TssLabel;
    lAdFrom: TssLabel;
    lAdSaldoFrom: TLabel;
    lAdSaldoTo: TLabel;
    lAdTotal: TLabel;
    lAdType: TssLabel;
    lCashDesk: TssLabel;
    lCashDeskTo: TssLabel;
    lcbAccount: TssDBLookupCombo;
    lcbAccountTo: TssDBLookupCombo;
    lcbAdAcc: TssDBLookupCombo;
    lcbAdCash: TssDBLookupCombo;
    lcbAdCurr: TssDBLookupCombo;
    lcbCashDesks: TssDBLookupCombo;
    lcbCashDeskTo: TssDBLookupCombo;
    lcbCCCharge: TssDBLookupCombo;
    lcbCCFromAcc: TssDBLookupCombo;
    lcbCCFromCurr: TssDBLookupCombo;
    lcbCCToCashDesk: TssDBLookupCombo;
    lcbCCToCurr: TssDBLookupCombo;
    lcbCurrency: TssDBLookupCombo;
    lcbCurrTo: TssDBLookupCombo;
    lcbCvFromAcc: TssDBLookupCombo;
    lcbCvFromCashDesk: TssDBLookupCombo;
    lcbCvFromCurr: TssDBLookupCombo;
    lcbCvToCurr: TssDBLookupCombo;
    lcbPersonName: TssDBLookupCombo;
    lCCCharge: TssLabel;
    lCCFromAcc: TssLabel;
    lCCFromSaldo: TLabel;
    lCCFromSumm: TLabel;
    lCCPercent: TLabel;
    lCCPercentEx: TssLabel;
    lCCToCash: TssLabel;
    lCCToSaldo: TLabel;
    lCCToSumm: TLabel;
    lCvFrom: TssLabel;
    lCvFromAcc: TssLabel;
    lCvFromCashDesk: TssLabel;
    lCvFromCurr: TLabel;
    lCvFromRate: TLabel;
    lCvFromSumm: TLabel;
    lCvSaldoFrom: TLabel;
    lCvSaldoTo: TLabel;
    lCvToCurr: TLabel;
    lCvToRate: TLabel;
    lCvToSumm: TLabel;
    lDocNum: TLabel;
    lFrom: TssLabel;
    lNotes: TLabel;
    lOnDate: TLabel;
    lPersonname: TLabel;
    lReason: TLabel;
    lSaldoFrom: TLabel;
    lSaldoTo: TLabel;
    lSummFrom: TLabel;
    lSummTo: TLabel;
    lTo: TssLabel;
    lType: TssLabel;
    memNotes: TMemo;
    nbAdFrom: TNotebook;
    nbCvFrom: TNotebook;
    nbFrom: TNotebook;
    nbTo: TNotebook;
    panKA: TPanel;
    panMainInfo: TPanel;
    panNotes: TPanel;
    pcMain: TssPageControl;
    srcCashDesks: TDataSource;
    srcChargeType: TDataSource;
    srcCurrency: TDataSource;
    srcEntAcc: TDataSource;
    srcPayMPersons: TDataSource;
    srcPayType: TDataSource;
    ssBevel1: TssBevel;
    ssSpeedButton1: TssSpeedButton;
    ssSpeedButton3: TssSpeedButton;
    ssSpeedButton4: TssSpeedButton;
    tsAdjust: TcxTabSheet;
    tsCashAndCharge: TcxTabSheet;
    tsConvert: TcxTabSheet;
    tsMove: TcxTabSheet;
    txtAdSaldoFrom: TssBevel;
    txtAdSaldoTo: TssBevel;
    txtCCFromSaldo: TssBevel;
    txtCCToSaldo: TssBevel;
    txtCvFromCurr: TssBevel;
    txtCvSaldoFrom: TssBevel;
    txtCvSaldoTo: TssBevel;
    txtCvToCurr: TssBevel;
    txtSaldoFrom: TssBevel;
    txtSaldoTo: TssBevel;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aFinanceExecute(Sender: TObject);
    procedure aSetPanelsExecute(Sender: TObject);
    procedure btnAdFromMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCashDesksMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCashDesksMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnChargeTypeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnChargeTypeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCvFinFromMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCvFromRateClick(Sender: TObject);
    procedure btnFinanceMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFinanceMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFinFromMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFinFromMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFinToMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnSetTimeClick(Sender: TObject);
    procedure cbAddTypePropertiesEditValueChanged(Sender: TObject);
    procedure cbAdFromPropertiesEditValueChanged(Sender: TObject);
    procedure cbCvFromPropertiesChange(Sender: TObject);
    procedure cbCvFromPropertiesEditValueChanged(Sender: TObject);
    procedure cbFromEnter(Sender: TObject);
    procedure cbFromExit(Sender: TObject);
    procedure cbFromPropertiesChange(Sender: TObject);
    procedure cbFromPropertiesEditValueChanged(Sender: TObject);
    procedure cbToPropertiesChange(Sender: TObject);
    procedure cbToPropertiesEditValueChanged(Sender: TObject);
    procedure cbTypePropertiesChange(Sender: TObject);
    procedure cbTypePropertiesEditValueChanged(Sender: TObject);
    procedure cdsCashDesksAfterOpen(DataSet: TDataSet);
    procedure cdsCurrencyAfterOpen(DataSet: TDataSet);
    procedure cdsCurrencyBeforeOpen(DataSet: TDataSet);
    procedure cdsEntAccCalcFields(DataSet: TDataSet);
    procedure chbConvertClick(Sender: TObject);
    procedure DataModified(Sender: TObject);
    procedure edAddTotalPropertiesChange(Sender: TObject);
    procedure edCCFromSummPropertiesChange(Sender: TObject);
    procedure edCCToSummPropertiesChange(Sender: TObject);
    procedure edCvFromTotalPropertiesChange(Sender: TObject);
    procedure edCvToTotalPropertiesChange(Sender: TObject);
    procedure edOnDateExit(Sender: TObject);
    procedure edOnDateKeyPress(Sender: TObject; var Key: Char);
    procedure edOnDatePropertiesChange(Sender: TObject);
    procedure edOnDatePropertiesEditValueChanged(Sender: TObject);
    procedure edTotalFromPropertiesChange(Sender: TObject);
    procedure edTotalPropertiesChange(Sender: TObject);
    procedure edTotalPropertiesEditValueChanged(Sender: TObject);
    procedure edTotalToPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcbAccountPropertiesChange(Sender: TObject);
    procedure lcbAccountPropertiesEditValueChanged(Sender: TObject);
    procedure lcbAccountPropertiesNewLookupDisplayText(Sender: TObject; const AText: TCaption);
    procedure lcbAccountToPropertiesEditValueChanged(Sender: TObject);
    procedure lcbAdAccPropertiesEditValueChanged(Sender: TObject);
    procedure lcbAdCurrPropertiesEditValueChanged(Sender: TObject);
    procedure lcbCashDesksEnter(Sender: TObject);
    procedure lcbCashDesksPropertiesChange(Sender: TObject);
    procedure lcbCashDesksPropertiesEditValueChanged(Sender: TObject);
    procedure lcbCashDeskToPropertiesEditValueChanged(Sender: TObject);
    procedure lcbCCChargePropertiesChange(Sender: TObject);
    procedure lcbCurrencyPropertiesEditValueChanged(Sender: TObject);
    procedure lcbCvFromAccPropertiesEditValueChanged(Sender: TObject);
    procedure lcbCvFromCashDeskPropertiesEditValueChanged(Sender: TObject);
    procedure lcbCvFromCurrPropertiesEditValueChanged(Sender: TObject);
    procedure lcbCvToCurrPropertiesEditValueChanged(Sender: TObject);
    procedure lcbToCurrPropertiesEditValueChanged(Sender: TObject);

  private
    FCurrCtrl: TControl;
    FTotalDef: extended;
    FDateChanged: boolean;
    FCurrNum: Integer;
    FLoaded: Boolean;
    FPanNotesVis, FPanDocVis: Boolean;
    FRealigned: Boolean;
    FOldSumm: Extended;
    FWBillID: Integer;
    FFormTitle: string;
    FSaldo: Extended;
    FSrcID, FDestID, FChargeID: Integer;
    FLockEdits: Boolean;
    FChargeSumm: Extended;
  
    F_lcbAccFrom, F_lcbAccTo, F_lcbCashFrom, F_lcbCashTo, F_lcbCurrFrom, F_lcbCurrTo: TssDBLookupCombo;
    F_cbFrom, F_cbTo: TcxComboBox;
    F_edFrom: TssCalcEdit;

    function RecalcBallance(AType, AID, ACurrID: Integer): Extended;
    procedure WMRecordChanged(var M: TMessage); message WM_RECORDCHANGED;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRealignPanels(var M: TMessage); message WM_REALIGNPANELS;
    procedure SavePanVisibility;
    procedure LoadPanVisibility;
    procedure RealignPanels;
    procedure RecalcDocSaldo;
    procedure SetWBillID(const Value: Integer);
    procedure GetSaldos;
    procedure GetSaldo(AType: Integer);
    procedure DisableFrom;
    procedure DisableTo;
    procedure GetAdImg;

  protected
    FOperMode: Boolean;
    FFromSaldo, FToSaldo, FToSumm, FFromSumm: Extended;
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
    procedure SetOnDate(const Value: TDateTime); override;

  public
    ParentHandle: HWND;
    WType: Integer;

    procedure SetCaptions; override;
    procedure DefineOperation(AType, AFromCashID, AFromAccID, AToCashID, AToAccID, AFromCurr, AToCurr: Integer);
    property WBillID: Integer read FWBillID write SetWBillID;
  end;

var
  frmEditMoneyMove: TfrmEditMoneyMove;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ClientData, prFun, prTypes,
  ssFun, CurrencyEdit, ssDateUtils, ssCallbackConst, Progress, fMessageDlg,
  ssRegUtils, KATurnover, ssStrUtil, SetPanels, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}
//==============================================================================================
procedure TfrmEditMoneyMove.setid(const Value: integer);
  var
    FType: TDocType;
    FPr, FSuf: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditMoneyMove.setid') else _udebug := nil;{$ENDIF}

  FLoaded := False;
  if not IsPattern then FID := Value;

  if Value = 0 then begin
    FCurrNum := GetMaxID(dmData.SConnection, 'paydoc', 'operid');
    edDocNum.Text := IntToStr(FCurrNum);
  end
  else edDocNum.Text := EmptyStr;

  with newDataSet do
  try
    if Value <> 0 then begin
      if not IsPattern
        then Self.Caption := rs('fmMoneyMove', 'TitleProps')
        else Self.Caption := rs('fmMoneyMove', 'TitleNew');

      ProviderName := 'pMoneyMove_GetAd';
      FetchParams;
      Params.ParamByName('operid').AsInteger := Value;
      Open;

      if FieldByName('doctype').AsInteger <> 6 then begin
        Close;
        ProviderName := 'pMoneyMove_Get';
        FetchParams;
        Params.ParamByName('operid').AsInteger := Value;
        Open;
      end;

      FFormTitle := panTitleBar.Caption;

      if not IsEmpty then begin
        cbType.ItemIndex := Abs(FieldByName('doctype').AsInteger) - 3;
        edOnDate.Date := Int(FieldByName('ondate').AsDateTime);
        edTime.Time := Frac(FieldByName('ondate').AsDateTime);
        edDocNum.Text := FieldByName('docnum').AsString;
        DSRefresh(cdsCurrency, 'currid', 0);

        if cbType.ItemIndex = 0 then begin
          lcbCurrency.KeyValue := FieldByName('currid').AsInteger;
          lcbCurrTo.KeyValue := FieldByName('destcurrid').AsInteger;
          edTotalFrom.Value := FieldByName('total').AsCurrency;

          if not FieldByName('accid').IsNull then begin
            cbFrom.ItemIndex := 1;
            lcbAccount.KeyValue := FieldByName('accid').AsInteger;
          end
          else begin
            cbFrom.ItemIndex := 0;
            lcbCashDesks.KeyValue := FieldByName('cashid').AsInteger
          end;

          if not FieldByName('destaccid').IsNull then begin
            cbTo.ItemIndex := 1;
            lcbAccountTo.KeyValue := FieldByName('destaccid').AsInteger;
          end
          else begin
            cbTo.ItemIndex := 0;
            lcbCashDeskTo.KeyValue := FieldByName('destcashid').AsInteger
          end;

        end
        else if cbType.ItemIndex = 1 then begin
          lcbCvFromCurr.KeyValue := FieldByName('currid').AsInteger;
          lcbCvToCurr.KeyValue := FieldByName('destcurrid').AsInteger;
          edCvFromTotal.Value := FieldByName('total').AsFloat;

          if not FieldByName('accid').IsNull then begin
            cbCvFrom.ItemIndex := 1;
            lcbCvFromAcc.KeyValue := FieldByName('accid').AsInteger;
          end
          else begin
            cbCvFrom.ItemIndex := 0;
            lcbCvFromCashDesk.KeyValue := FieldByName('cashid').AsInteger
          end;
        end
        else if cbType.ItemIndex = 2 then begin
          lcbCCFromAcc.KeyValue := FieldByName('accid').AsInteger;
          lcbCCToCashDesk.KeyValue := FieldByName('destcashid').AsInteger;
          lcbCCFromCurr.KeyValue := FieldByName('currid').AsInteger;
          lcbCCToCurr.KeyValue := FieldByName('destcurrid').AsInteger;
          lcbCCCharge.KeyValue := FieldByName('chargeid').AsInteger;

          edCCFromSumm.Value := FieldByName('total').AsCurrency + VarToInt(FieldByName('totalcharge').AsCurrency);

          edCCPercent.Value := RoundToA(FieldByName('totalcharge').AsCurrency /
            (FieldByName('totalcharge').AsCurrency + FieldByName('total').AsCurrency) * 100, -3);

          FChargeID := FieldByName('chargepaydocid').AsInteger
        end
        else if cbType.ItemIndex = 3 then begin
          if not FieldByName('accid').IsNull then begin
            cbAdFrom.ItemIndex := 1;
            lcbAdAcc.KeyValue := FieldByName('accid').AsInteger;
          end
          else begin
            cbAdFrom.ItemIndex := 0;
            lcbAdCash.KeyValue := FieldByName('cashid').AsInteger
          end;

          lcbAdCurr.KeyValue := FieldByName('currid').AsInteger;

          if FieldByName('total').AsCurrency > 0
            then cbAdType.ItemIndex := 0
            else cbAdType.ItemIndex := 1;
          GetSaldo(0);
          edAdTotal.Value := Abs(FieldByName('total').AsCurrency);
        end;

        FSrcID := FieldByName('paydocid').AsInteger;
        FDestID := FieldByName('destpaydocid').AsInteger;
        //FOldSumm := FieldByName('total').AsFloat;
        chbChecked.Checked := FieldByName('checked').AsInteger = 1;
        memNotes.Text := FieldByName('notes').AsString;
        edReason.Text := FieldByName('reason').AsString;
      end;

      if FieldByName('mpersonid').IsNull
        then lcbPersonName.ItemIndex := 0
        else lcbPersonName.ItemIndex := FieldByName('mpersonid').asInteger;

      Close;

      btnApply.Enabled := False;

    end // if Value <> 0
    else begin
      Self.Caption := rs('fmMoneyMove', 'TitleNew');
      FFormTitle := panTitleBar.Caption;

      with cdsPayMPersons do begin
        if cdsPayMPersons.RecordCount = 0
          then lcbPersonName.Enabled := False
          else if Locate('userid', UserID, []) then lcbPersonName.KeyValue := FieldByName('kaid').AsInteger;
      end;
    end;

    if UserID <> 0 then begin
      lcbPersonName.Enabled := False;
      if Value <> 0 then  // editing enabled only for document owner or admin
        with cdsPayMPersons do
          if Locate('userid', UserID, []) and (lcbPersonName.KeyValue <> FieldByName('kaid').AsInteger)
          then EditingDisabled := True;
    end;

  finally
    Free;
  end;

  FDateChanged := False;
  FLoaded := True;

  if not GetUserAccessByClass(Self.ParentNameEx, uaPost) then begin
    chbChecked.Hint := rs('Common', 'noRights');
    chbChecked.Checked := False;
    chbChecked.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: boolean;
    intTmp: Integer;
    FCashFrom, Fcb: Integer;
    FOnValue: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditMoneyMove.FormCloseQuery') else _udebug := nil;{$ENDIF}


  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    if chbChecked.Checked then begin
      if mrYes = ssMessageDlg(rs('fmPayDoc', 'CheckMoneyMode'), ssmtWarning, [ssmbYes, ssmbNo], 'CheckMoneyMode', True)
      then begin
        if not ReadFromRegInt(MainRegKey, 'CheckMoneyModeEx', intTmp) then begin
          SavePrgParam(dmData.SConnection, 'CheckMoney', 1);
          CheckMoney := True;
          if ReadFromRegInt(MainRegKey, 'CheckMoneyMode', intTmp) then WriteToRegInt(MainRegKey, 'CheckMoneyModeEx', 1);
        end
      end
      else begin
        if not ReadFromRegInt(MainRegKey, 'CheckMoneyModeEx', intTmp) then begin
          SavePrgParam(dmData.SConnection, 'CheckMoney', 0);
          CheckMoney := False;
          if ReadFromRegInt(MainRegKey, 'CheckMoneyMode', intTmp)
            then WriteToRegInt(MainRegKey, 'CheckMoneyModeEx', 1);
        end;
      end;
    end;

    if F_lcbCashFrom = nil
      then FCashFrom := 0
      else FCashFrom := F_lcbCashFrom.KeyValue;

    if F_cbFrom = nil
      then Fcb := 1
      else Fcb := F_cbFrom.ItemIndex;

    if chbChecked.Checked then
      if not ((cbType.ItemIndex = 3) and (cbAdType.ItemIndex = 0))
         and not CheckMoneyDlg(dmData.SConnection, edOnDate.Date, Fcb, F_lcbAccFrom.KeyValue, FCashFrom, F_lcbCurrFrom.KeyValue, F_edFrom.EditValue)
      then begin
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    with newDataSet do
    try
      TrStart;

      try
        NewRecord := (ID = 0);

        if NewRecord then begin
          FID := GetMaxID(dmData.SConnection, 'paydoc', 'operid');
          FSrcID := GetMaxID(dmData.SConnection, 'paydoc', 'paydocid');
          FDestID := GetMaxID(dmData.SConnection, 'paydoc', 'paydocid');
        end;

        if NewRecord
          then ProviderName := 'pPayDoc_MM_Ins'
          else ProviderName := 'pPayDoc_MM_Upd';

        FetchParams;
        Params.ParamByName('operid').AsInteger := FID;
        Params.ParamByName('ondate').AsDateTime := edOnDate.Date + Frac(edTime.Time);
        Params.ParamByName('docnum').AsString := edDocNum.Text;
        Params.ParamByName('kaid').DataType := ftInteger;
        Params.ParamByName('kaid').Clear;
        Params.ParamByName('checked').AsInteger := Integer(chbChecked.Checked);
        Params.ParamByName('withnds').AsInteger := 1;

        Params.ParamByName('mpersonid').DataType := ftInteger;
        if lcbPersonName.EditingText = ''
          then Params.ParamByName('mpersonid').Clear
          else Params.ParamByName('mpersonid').asInteger := lcbPersonName.KeyValue;

        Params.ParamByName('ctypeid').AsInteger := 1;
        Params.ParamByName('notes').AsString := memNotes.Text;
        Params.ParamByName('reason').AsString := edReason.Text;

        if cbType.ItemIndex = 2
          then Params.ParamByName('total').AsFloat := FFromSumm - FChargeSumm
          else Params.ParamByName('total').AsFloat := FFromSumm;

        if F_cbFrom <> nil
          then Params.ParamByName('ptypeid').AsInteger := F_cbFrom.ItemIndex + 1
          else Params.ParamByName('ptypeid').AsInteger := 2;

        Params.ParamByName('doctype').AsInteger := -3 - cbType.ItemIndex;
        Params.ParamByName('currid').AsInteger := F_lcbCurrFrom.KeyValue;
        FOnValue := GetCurrencyRateEx(dmData.SConnection, F_lcbCurrFrom.KeyValue, edOnDate.Date + Frac(edTime.Time));
        Params.ParamByName('onvalue').AsFloat := FOnValue;

        if (F_cbFrom <> nil) and (F_cbFrom.ItemIndex = 0)
          then Params.ParamByName('cashid').AsInteger := F_lcbCashFrom.KeyValue
          else begin
            Params.ParamByName('cashid').DataType := ftInteger;
            Params.ParamByName('cashid').Clear;
          end;

        if (F_cbFrom = nil) or (F_cbFrom.ItemIndex = 1)
          then Params.ParamByName('accid').AsInteger := F_lcbAccFrom.KeyValue
          else begin
            Params.ParamByName('accid').DataType := ftInteger;
            Params.ParamByName('accid').Clear;
          end;

        Params.ParamByName('paydocid').AsInteger := FSrcID;

        if cbType.ItemIndex = 3 then begin
          Params.ParamByName('doctype').AsInteger := 6;
          if cbAdType.ItemIndex = 1
            then Params.ParamByName('total').AsFloat := -FFromSumm;
        end;
        Execute;

        if cbType.ItemIndex <> 3 then begin
          Params.ParamByName('total').AsFloat := FToSumm;

          if F_cbTo <> nil
            then Params.ParamByName('ptypeid').AsInteger := F_cbTo.ItemIndex + 1
            else Params.ParamByName('ptypeid').AsInteger := 1;

          Params.ParamByName('currid').AsInteger := F_lcbCurrTo.KeyValue;

          FOnValue := GetCurrencyRateEx(dmData.SConnection, F_lcbCurrTo.KeyValue, edOnDate.Date + Frac(edTime.Time));

          Params.ParamByName('onvalue').AsFloat := FOnValue;
          Params.ParamByName('doctype').AsInteger := 3 + cbType.ItemIndex;

          if (F_cbTo = nil) or (F_cbTo.ItemIndex = 0)
            then Params.ParamByName('cashid').AsInteger := F_lcbCashTo.KeyValue
            else begin
              Params.ParamByName('cashid').DataType := ftInteger;
              Params.ParamByName('cashid').Clear;
            end;

          if (F_cbTo <> nil) and (F_cbTo.ItemIndex = 1)
            then Params.ParamByName('accid').AsInteger := F_lcbAccTo.KeyValue
            else begin
              Params.ParamByName('accid').DataType := ftInteger;
              Params.ParamByName('accid').Clear;
            end;
          Params.ParamByName('paydocid').AsInteger := FDestID;
          Execute;
        end;

        if cbType.ItemIndex = 2 then begin
          if NewRecord then FChargeID := GetMaxID(dmData.SConnection, 'paydoc', 'paydocid');

          Params.ParamByName('operid').AsInteger := FID;
          Params.ParamByName('ondate').AsDateTime := edOnDate.Date + Frac(edTime.Time);
          Params.ParamByName('docnum').AsString := edDocNum.Text;
          Params.ParamByName('kaid').DataType := ftInteger;
          Params.ParamByName('kaid').Clear;
          Params.ParamByName('checked').AsInteger := Integer(chbChecked.Checked);
          Params.ParamByName('withnds').AsInteger := 1;

          Params.ParamByName('mpersonid').DataType := ftInteger;
          if lcbPersonName.EditingText = ''
            then Params.ParamByName('mpersonid').Clear
            else Params.ParamByName('mpersonid').asInteger := lcbPersonName.KeyValue;

          Params.ParamByName('notes').AsString := memNotes.Text;
          Params.ParamByName('reason').AsString := edReason.Text;
          Params.ParamByName('total').AsFloat := FChargeSumm;
          Params.ParamByName('ptypeid').AsInteger := 2;
          Params.ParamByName('doctype').AsInteger := -2;
          Params.ParamByName('currid').AsInteger := F_lcbCurrFrom.KeyValue;
          FOnValue := GetCurrencyRateEx(dmData.SConnection, F_lcbCurrFrom.KeyValue, edOnDate.Date + Frac(edTime.Time));
          Params.ParamByName('onvalue').AsFloat := FOnValue;
          Params.ParamByName('cashid').DataType := ftInteger;
          Params.ParamByName('cashid').Clear;
          Params.ParamByName('accid').AsInteger := F_lcbAccFrom.KeyValue;
          Params.ParamByName('paydocid').AsInteger := FChargeID;
          Params.ParamByName('ctypeid').AsInteger := lcbCCCharge.KeyValue;
          Execute;
        end;

        TrCommit;
        //TrCommit;
        SendMessage(MainHandle, WM_REFRESH, FID, 0);

        if FOperMode
          then RefreshFun('TfmMoneyMove', 0)
          else RefreshFun('TfmFinance', 0);

        if (ModalResult = mrYes) then begin
          if NewRecord then begin
            if not IsPattern then begin
              edTotalFrom.Value := 0;
              edCvFromTotal.Value := 0;
              edCCFromSumm.Value := 0;
              edCCPercent.Value := 0;
              edReason.Text := '';
              memNotes.Text := '';
            end;

            ID := 0;
            GetSaldos;
            
            if FOperMode then edTotalFrom.SetFocus;
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
          //TrRollback;
          ssMessageDlg(e.Message, ssmtError, [ssmbOk]);
        end;
      end;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := (FFromSumm > 0) and (Trim(edDocNum.EditingText) <> '');
  aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.DataModified') else _udebug := nil;{$ENDIF}


  FModified:=True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    lOnDate.Caption := GetRS('fmPayDoc', 'Date') + ':';
    lNotes.Caption := GetRS('fmPayDoc', 'Notes') + ':';
    lReason.Caption := GetRS('fmPayDoc', 'Reason') + ':';
    lDocNum.Caption := GetRS('fmPayDoc', 'DocNum') + ':';
    lSummFrom.Caption := GetRS('fmMoneyMove', 'WriteOff') + ':';
    //lRate.Caption := GetRS('fmPayDoc', 'Rate') + ':';
    lCashDesk.Caption := GetRS('fmPayDoc', 'CashDesk') + ':';
    lAccount.Caption := GetRS('fmPayDoc', 'Account') + ':';
    lCashDeskTo.Caption := GetRS('fmPayDoc', 'CashDesk') + ':';
    lAccountTo.Caption := GetRS('fmPayDoc', 'Account') + ':';
    //btnSetPanels.Hint := GetRS('fmWaybill', 'SetPanels');
    btnFinance.Hint := GetRS('fmFinance', 'Finance');
    btnAdFrom.Hint := GetRS('fmFinance', 'Finance');
    btnFinFrom.Hint := GetRS('fmFinance', 'Finance');
    btnFinTo.Hint := GetRS('fmFinance', 'Finance');
    btnCvFinFrom.Hint := GetRS('fmFinance', 'Finance');
    lFrom.Caption := GetRS('fmMoneyMove', 'From') + ':';
    lTo.Caption := GetRS('fmMoneyMove', 'To') + ':';

    lCvFromCashDesk.Caption := GetRS('fmPayDoc', 'CashDesk') + ':';
    lCvFromAcc.Caption := GetRS('fmPayDoc', 'Account') + ':';
    lCvFrom.Caption := GetRS('fmMoneyMove', 'From') + ':';
    with cbCvFrom do begin
      Properties.Items.Add(GetRS('fmMoneyMove', 'FromCash'));
      Properties.Items.Add(GetRS('fmMoneyMove', 'FromAcc'));
      ItemIndex := 0;
    end;
    lCvFromCurr.Caption := GetRS('fmMoneyMove', 'FromCurr') + ':';
    lCvToCurr.Caption := GetRS('fmMoneyMove', 'ToCurr') + ':';
    lCvFromRate.Caption := GetRS('fmMoneyMove', 'Rate') + ':';
    lCvToRate.Caption := GetRS('fmMoneyMove', 'Rate') + ':';
    lCvFromSumm.Caption := GetRS('fmMoneyMove', 'WriteOff') + ':';
    lCvToSumm.Caption := GetRS('fmMoneyMove', 'PutOn') + ':';
    lCvSaldoFrom.Caption := GetRS('fmMoneyMove', 'Saldo') + ':';
    lCvSaldoTo.Caption := GetRS('fmMoneyMove', 'Saldo') + ':';

    lCCFromAcc.Caption := GetRS('fmMoneyMove', 'FromAcc') + ':';
    lCCFromSumm.Caption := GetRS('fmMoneyMove', 'WriteOff') + ':';
    lCCPercent.Caption := GetRS('fmMoneyMove', 'WriteOff') + ':';
    lCCFromSaldo.Caption := GetRS('fmMoneyMove', 'Saldo') + ':';
    lCCToCash.Caption := GetRS('fmMoneyMove', 'ToCash') + ':';
    lCCToSumm.Caption := GetRS('fmMoneyMove', 'PutOn') + ':';
    lCCToSaldo.Caption := GetRS('fmMoneyMove', 'Saldo') + ':';
    lCCCharge.Caption := GetRS('fmMoneyMove', 'Charge') + ':';

    lSaldoFrom.Caption := GetRS('fmMoneyMove', 'Saldo') + ':';
    lSaldoTo.Caption := GetRS('fmMoneyMove', 'Saldo') + ':';
    lSummTo.Caption := GetRS('fmMoneyMove', 'PutOn') + ':';
    lType.Caption := GetRS('fmMoneyMove', 'OperType') + ':';
    lAdTotal.Caption := GetRS('fmMoneyMove', 'Summ') + ':';
    lAdSaldoFrom.Caption := GetRS('fmMoneyMove', 'SaldoBefore') + ':';
    lAdSaldoTo.Caption := GetRS('fmMoneyMove', 'SaldoAfter') + ':';
    lAdType.Caption := GetRS('fmMoneyMove', 'OperType') + ':';

    with cbType do begin
      Properties.Items.Add(GetRS('fmPayDoc', 'OperMove'));
      Properties.Items.Add(GetRS('fmPayDoc', 'OperConvert'));
      Properties.Items.Add(GetRS('fmMoneyMove', 'CashWithCharge'));
      Properties.Items.Add(GetRS('fmMoneyMove', 'Adjust'));
      ItemIndex := 0;
    end;

    with cbAdType do begin
      Properties.Items.Add(GetRS('fmMoneyMove', 'PutOn'));
      Properties.Items.Add(GetRS('fmMoneyMove', 'WriteOff'));
      ItemIndex := 0;
    end;
    lAdCash.Caption := GetRS('fmPayDoc', 'CashDesk') + ':';
    lAdAcc.Caption := GetRS('fmPayDoc', 'Account') + ':';

    with cbFrom do begin
      Properties.Items.Add(rs('fmMoneyMove', 'FromCash'));
      Properties.Items.Add(rs('fmMoneyMove', 'FromAcc'));
      ItemIndex := 0;
    end;

    with cbTo do begin
      Properties.Items.Add(rs('fmMoneyMove', 'ToCash'));
      Properties.Items.Add(rs('fmMoneyMove', 'ToAcc'));
      ItemIndex := 0;
    end;

    btnSetTime.Hint := GetRS('fmWaybill', 'EditTime');
    btnChargeType.Hint := GetRS('fmPayDoc', 'ChargeTypeRef');

    chbChecked.Properties.Caption := GetRS('fmPayDoc', 'CheckDoc');
    btnCvFromRate.Hint := GetRS('fmPayDoc', 'ChangeRate');
    btnCvToRate.Hint := GetRS('fmPayDoc', 'ChangeRate');

    lPersonName.Caption := rs('fmPayDoc', 'MPerson');
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.SetOnDate') else _udebug := nil;{$ENDIF}


  inherited;

  edOnDate.Date:=Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.FormCreate(Sender: TObject);
 var
  Temp: Integer;
  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.FormCreate') else _udebug := nil;{$ENDIF}


  inherited;

  edOnDate.Date := Date;
  edTime.Time := Time;
  dmData.i15.GetBitmap(0, edTotalFrom.Properties.ButtonGlyph);
  dmData.i15.GetBitmap(0, edTotalTo.Properties.ButtonGlyph);
  dmData.i15.GetBitmap(0, edCvToTotal.Properties.ButtonGlyph);
  dmData.i15.GetBitmap(0, edCvFromTotal.Properties.ButtonGlyph);
  dmData.i15.GetBitmap(0, edCCFromSumm.Properties.ButtonGlyph);
  dmData.i15.GetBitmap(0, edCCToSumm.Properties.ButtonGlyph);
  dmData.i15.GetBitmap(0, edCCPercent.Properties.ButtonGlyph);
  btnCashDesks.ImageIndex := II_CASHDESK;
  btnChargeType.ImageIndex := II_CHARGETYPE;

  cdsCurrency.Open;
  cdsCashDesks.Open;
  cdsEntAcc.Open;
  cdsChargeType.Open;
  cdsPayType.Open;
  cdsPayMPersons.Open;
  lcbCurrency.KeyValue := BaseCurrID;
  edTotalPropertiesChange(edTotalFrom);

  panNotes.Align := alTop;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.cdsCurrencyBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.cdsCurrencyBeforeOpen') else _udebug := nil;{$ENDIF}


  if edOnDate.Text = ''
   then cdsCurrency.Params.ParamByName('ondate').AsDateTime:=0
   else cdsCurrency.Params.ParamByName('ondate').AsDateTime:=Int(edOnDate.Date);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.edOnDatePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.edOnDatePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}
                     
  FModified := True;
  FDateChanged := True;
  edOnDateExit(edOnDate);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.edTotalPropertiesChange(Sender: TObject);
  var
    v, FSum: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.edTotalPropertiesChange') else _udebug := nil;{$ENDIF}
   
  try
    v := StrToFloat(edTotalFrom.Text);
  except
    v := 0;
  end;

  if cdsCurrency.Locate('currid', lcbCurrency.KeyValue, []) then begin
    FSum := cdsCurrency.FieldByName('onvalue').AsFloat;

    if cdsCurrency.Locate('currid', lcbCurrTo.KeyValue, [])
      then FSum := (FSum / cdsCurrency.FieldByName('onvalue').AsFloat) * v;
  end
  else Fsum := 0;
  FToSumm := FSum;

  //txtToSumm.Caption := FormatFloat(MoneyDisplayFormat, FSum) + ' ' + lcbToCurr.EditText;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditMoneyMove.RecalcBallance(AType, AID, ACurrID: Integer): Extended;
  var
    m: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.RecalcBallance') else _udebug := nil;{$ENDIF}

  Result := 0;

  with newDataSet do
  try
    ProviderName := 'pMoneySaldo_GetEx';
    FetchParams;
    FetchMacros;
    Params.ParamByName('ondate').AsDateTime := MaxDateTime;
    Params.ParamByName('currid').AsInteger := ACurrID;
    if AType = 0
      then m := ' and ms.cashid=' + IntToStr(AID)
      else m := ' and ms.accid=' + IntToStr(AID);

    Macros.ParamByName('m').AsString := m;
    Open;
    Result := FieldByName('saldo').AsCurrency;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.edTotalPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.edTotalPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.btnCvFromRateClick(Sender: TObject);
  var
    Flcb: TssDBLookupCombo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.btnCvFromRateClick') else _udebug := nil;{$ENDIF}
   
  if Sender = btnCvFromRate then Flcb := lcbCvFromCurr
  else if Sender = btnCvToRate
  then Flcb := lcbCvToCurr
  else begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmCurrencyEdit.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmCurrency';
    OnDate := Int(Self.edOnDate.Date);
    cdsCurrency.Locate('currid', Flcb.KeyValue, []);
    ID := Self.cdsCurrency.fieldbyname('currid').AsInteger;

    if Self.cdsCurrency.FieldByName('ondate').AsDateTime = Int(Self.edOnDate.Date)
      then SubID := Self.cdsCurrency.fieldbyname('rateid').AsInteger;

    SetFocusToRate := True;
    SetInactive;

    if ShowModal = mrOk then begin
      FLoaded := False;
      cdsCurrency.DisableControls;
      DSRefresh(cdsCurrency, 'currid', 0);
      cdsCurrency.EnableControls;
      Flcb.KeyValue := cdsCurrency.fieldbyname('currid').AsInteger;
      Flcb.Properties.OnEditValueChanged(Flcb);
      FLoaded := True;
    end;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.edOnDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.edOnDatePropertiesChange') else _udebug := nil;{$ENDIF}

  if edOnDate.Text <> edOnDate.EditText then begin
    FModified:=True;
    FDateChanged:=True;
  end;  

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.edOnDateExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.edOnDateExit') else _udebug := nil;{$ENDIF}
   
  inherited;

  if FDateChanged then begin
    lcbCurrency.Properties.OnEditValueChanged := nil;
    DSRefresh(cdsCurrency, 'currid', 0);
    lcbCurrency.KeyValue:=cdsCurrency.fieldbyname('currid').AsInteger;
    lcbCurrency.Properties.OnEditValueChanged := lcbCurrencyPropertiesEditValueChanged;
    //RecalcBallance;
    FLoaded := False;
    lcbCurrencyPropertiesEditValueChanged(lcbCurrency);
    FLoaded := True;
    FDateChanged:=False;
    //btnRate.Invalidate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.edOnDateKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.edOnDateKeyPress') else _udebug := nil;{$ENDIF}

  if Key = #13 then begin
    if FDateChanged then begin
      DSRefresh(cdsCurrency, 'currid', 0);
      lcbCurrency.KeyValue:=cdsCurrency.fieldbyname('currid').AsInteger;
      //RecalcBallance;
      FDateChanged:=False;
      //btnRate.Invalidate;
      if NextCtrlOnEnter then Perform(WM_NEXTDLGCTL, 0, 0);
    end
    else if NextCtrlOnEnter then Perform(WM_NEXTDLGCTL, 0, 0);

    Key := #0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.WMRecordChanged(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.WMRecordChanged') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditMoneyMove.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of

   rtChargeType:
     begin
       DSRefresh(cdsChargeType, 'ctypeid', M.WParam);
       lcbCCCharge.KeyValue := M.WParam;
     end;

   rtFinances:
     begin
       if FCurrCtrl = cbFrom then begin
         if (M.WParam > 0) and (M.WParam < 1000000) then begin
           cbFrom.ItemIndex := 0;
           lcbCashDesks.KeyValue := M.WParam;
         end
         else begin
           cbFrom.ItemIndex := 1;
           lcbAccount.KeyValue := M.WParam - 1000000;
         end;
       end;

       if FCurrCtrl = cbAdFrom then begin
         if (M.WParam > 0) and (M.WParam < 1000000) then begin
           cbAdFrom.ItemIndex := 0;
           lcbAdCash.KeyValue := M.WParam;
         end
         else begin
           cbAdFrom.ItemIndex := 1;
           lcbAdAcc.KeyValue := M.WParam - 1000000;
         end;
       end;

       if FCurrCtrl = cbCvFrom then begin
         if (M.WParam > 0) and (M.WParam < 1000000) then begin
           cbCvFrom.ItemIndex := 0;
           lcbCvFromCashDesk.KeyValue := M.WParam;
         end
         else begin
           cbCvFrom.ItemIndex := 1;
           lcbCvFromAcc.KeyValue := M.WParam - 1000000;
         end;
       end;

       if FCurrCtrl = cbTo then begin
         if (M.WParam > 0) and (M.WParam < 1000000) then begin
           cbTo.ItemIndex := 0;
           lcbCashDeskTo.KeyValue := M.WParam;
         end
         else begin
           cbTo.ItemIndex := 1;
           lcbAccountTo.KeyValue := M.WParam - 1000000;
         end;
       end;
     end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.cdsCurrencyAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.cdsCurrencyAfterOpen') else _udebug := nil;{$ENDIF}

  lcbCurrency.KeyValue := BaseCurrID;
  lcbCurrTo.KeyValue := BaseCurrID;
  lcbCvFromCurr.KeyValue := BaseCurrID;
  lcbCvToCurr.KeyValue := BaseCurrID;
  lcbCCFromCurr.KeyValue := BaseCurrID;
  lcbCCToCurr.KeyValue := BaseCurrID;
  lcbAdCurr.KeyValue := BaseCurrID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.WMLayoutChanged(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.WMLayoutChanged') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditMoneyMove.btnSetTimeClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.btnSetTimeClick') else _udebug := nil;{$ENDIF}

  edTime.Time := Time;
  edOnDate.Date := Date;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbCurrencyPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbCurrencyPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  {btnRate.Caption := cdsCurrency.fieldbyname('onvalue').AsString;
  btnRate.Enabled := lcbCurrency.KeyValue <> BaseCurrID;
  edTotalPropertiesChange(edTotalFrom);
  FModified := True;
  if Self.Visible and CheckCurrency and
    (cdsCurrency.fieldbyname('ondate').AsDateTime <> Int(edOnDate.Date)) and
    (lcbCurrency.KeyValue <> BaseCurrID) and (lcbCurrency.Text <> BaseCurrName) and
    (lcbCurrency.Text <> EmptyStr) and FLoaded
    then btnRateClick(btnRate);
  btnRate.Invalidate;
  }

  GetSaldo(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  if ID = 0 then lcbCurrencyPropertiesEditValueChanged(lcbCurrency);

  if cbType.ItemIndex = 3 then begin
    GetSaldo(0);
    edAddTotalPropertiesChange(edAdTotal);
  end
  else GetSaldos;

  panTitleBar.Caption := FFormTitle + ' (' + cbType.EditText + ')';

  try
    if FOperMode then
      case cbType.ItemIndex of
        0: edTotalFrom.SetFocus;
        1: edCvFromTotal.SetFocus;
      end;
  except
  end;    

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbCashDesksEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbCashDesksEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbCashDesks;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.btnCashDesksMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.btnCashDesksMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbCashDesks;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.cdsEntAccCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.cdsEntAccCalcFields') else _udebug := nil;{$ENDIF}

  cdsEntAcc.FieldByName('fullname').AsString :=
    cdsEntAcc.FieldByName('accnum').AsString + ' ' + rs('fmPayDoc', 'In') + ' ' + cdsEntAcc.FieldByName('name').AsString;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.aSetPanelsExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.aSetPanelsExecute') else _udebug := nil;{$ENDIF}

  with TfrmSetPanels.Create(nil) do
  try
    MainHandle := Self.Handle;
    FList.AddObject(rs('fmPayDoc', 'PanMainInfo'), panMainInfo);
    FList.AddObject(rs('fmPayDoc', 'PanKA'), panKA);
    FList.AddObject(rs('fmPayDoc', 'PanSumm'), panSumm);
    FList.AddObject(rs('fmPayDoc', 'PanDoc'), panDoc);
    FList.AddObject(rs('fmPayDoc', 'PanNotes'), panNotes);
    SetPanels;
    ShowModal;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditMoneyMove.WMRealignPanels(var M: TMessage);
 (*var
  FList: TStringList;
  i: Integer;
  FVis: Boolean;
  FPan: TPanel;
  FOffs: Integer;
  Y: Integer;
  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.WMRealignPanels') else _udebug := nil;{$ENDIF}

  FList := TStringList(Pointer(M.WParam));
  FOffs := 0;
  panNotes.Align := alNone;
  for i := 0 to FList.Count - 1 do begin
    FVis := FList.Strings[i] = '1';
    FPan := TPanel(FList.Objects[i]);
    if FPan.Visible <> FVis then begin
      if FVis then FOffs := FOffs + FPan.Height
        else FOffs := FOffs - FPan.Height;
      FPan.Visible := FVis;
    end;
  end;
  panNotes.Align := alClient;
  if FOffs <> 0 then Self.Height := Self.Height + FOffs;

  Y := panSumm.Top + panSumm.Height - 1;
  if panDoc.Visible then begin
    panDoc.Top := Y;
    Y := Y + panDoc.Height;
  end;
  SavePanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditMoneyMove.SavePanVisibility;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.SavePanVisibility') else _udebug := nil;{$ENDIF}

  FPanDocVis := panDoc.Visible;
  FPanNotesVis := panNotes.Visible;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditMoneyMove.LoadPanVisibility;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.LoadPanVisibility') else _udebug := nil;{$ENDIF}

  panDoc.Visible := FPanDocVis;
  panNotes.Visible := FPanNotesVis;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditMoneyMove.RealignPanels;
  (*
  var
    FOffs: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.RealignPanels') else _udebug := nil;{$ENDIF}

  FOffs := 0;
  if not panDoc.Visible then FOffs := FOffs - panDoc.Height;
  if not panNotes.Visible then FOffs := FOffs - panNotes.Height;
  panNotes.Align := alClient;
  if not panNotes.Visible then FOffs := FOffs + 7;
  if FOffs <> 0 then Self.Height := Self.Height + FOffs;
  SavePanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditMoneyMove.RecalcDocSaldo;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.RecalcDocSaldo') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditMoneyMove.SetWBillID(const Value: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.SetWBillID') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditMoneyMove.btnCashDesksMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.btnCashDesksMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.cdsCashDesksAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.cdsCashDesksAfterOpen') else _udebug := nil;{$ENDIF}

  DataSet.Locate('def', 1, []);
  lcbCashDesks.KeyValue := DataSet.FieldByName('cashid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.aFinanceExecute(Sender: TObject);
  var
    aid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.aFinanceExecute') else _udebug := nil;{$ENDIF}

  if FCurrCtrl = lcbCCCharge then begin
    try aid := lcbCCCharge.KeyValue; except aid := 0; end;
    lcbCCCharge.SetFocus;
    ShowModalRef(Self, rtChargeType, vtChargeType, 'TfmChargeType', Self.OnDate, aid);
  end
  else if FCurrCtrl = btnFinance
    then ShowFinance(Self, Date)
    else ShowFinance(Self, Date, 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.chbConvertClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.chbConvertClick') else _udebug := nil;{$ENDIF}

  lcbToCurr.Enabled := chbConvert.Checked;
  if not chbConvert.Checked then lcbToCurr.KeyValue := lcbCurrency.KeyValue;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditMoneyMove.cbFromPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.cbFromPropertiesChange') else _udebug := nil;{$ENDIF}
    
  nbFrom.PageIndex := cbFrom.ItemIndex;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.cbToPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.cbToPropertiesChange') else _udebug := nil;{$ENDIF}


  nbTo.PageIndex := cbTo.ItemIndex;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbAccountPropertiesNewLookupDisplayText(Sender: TObject; const AText: TCaption);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbAccountPropertiesNewLookupDisplayText') else _udebug := nil;{$ENDIF}

  With Sender as TcxComboBox do begin
    SelStart := 0;
    SelLength := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.cbTypePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.cbTypePropertiesChange') else _udebug := nil;{$ENDIF}

  pcMain.ActivePageIndex := cbType.ItemIndex;
  imgType.Picture.Bitmap.Height := 0;

  case cbType.ItemIndex of
    0: begin
        F_lcbAccFrom := lcbAccount;
        F_lcbAccTo := lcbAccountTo;
        F_lcbCashFrom := lcbCashDesks;
        F_lcbCashTo := lcbCashDeskTo;
        F_lcbCurrFrom := lcbCurrency;
        F_lcbCurrTo := lcbCurrTo;
        F_cbFrom := cbFrom;
        F_cbTo := cbTo;
        F_edFrom := edTotalFrom;
        dmData.Images.GetBitmap(175, imgType.Picture.Bitmap);
       end;

    1: begin
        F_lcbAccFrom := lcbCvFromAcc;
        F_lcbAccTo := lcbCvFromAcc;
        F_lcbCashFrom := lcbCvFromCashDesk;
        F_lcbCashTo := lcbCvFromCashDesk;
        F_lcbCurrFrom := lcbCvFromCurr;
        F_lcbCurrTo := lcbCvToCurr;
        F_cbFrom := cbCvFrom;
        F_cbTo := cbCvFrom;
        F_edFrom := edCvFromTotal;
        dmData.Images.GetBitmap(174, imgType.Picture.Bitmap);
       end;
    2: begin
        F_lcbAccFrom := lcbCCFromAcc;
        F_lcbAccTo := nil;
        F_lcbCashFrom := nil;
        F_lcbCashTo := lcbCCToCashDesk;
        F_lcbCurrFrom := lcbCCFromCurr;
        F_lcbCurrTo := lcbCCToCurr;
        F_cbFrom := nil;
        F_cbTo := nil;
        F_edFrom := edCCFromSumm;
        dmData.Images.GetBitmap(179, imgType.Picture.Bitmap);
       end;
    3: begin
        F_lcbAccFrom := lcbAdAcc;
        F_lcbAccTo := nil;
        F_lcbCashFrom := lcbAdCash;
        F_lcbCashTo := nil;
        F_lcbCurrFrom := lcbAdCurr;
        F_lcbCurrTo := lcbAdCurr;
        F_cbFrom := cbAdFrom;
        F_cbTo := nil;
        F_edFrom := edAdTotal;
        //dmData.Images.GetBitmap(179, imgType.Picture.Bitmap);
        GetAdImg;
       end;
  end;

  imgType.Invalidate;

  panTitleBar.Caption := FFormTitle + ' (' + cbType.Text + ')';

  if (cbType.ItemIndex = 1) and (txtCvSaldoFrom.Caption = '') then GetSaldos;

  if (cbType.ItemIndex = 2) and (txtCCFromSaldo.Caption = '') then GetSaldos;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbAccountPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbAccountPropertiesChange') else _udebug := nil;{$ENDIF}

  if cbType.ItemIndex = 1 then lcbAccountTo.KeyValue := lcbAccount.KeyValue;

  With Sender as TcxComboBox do begin
    SelStart := 0;
    SelLength := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbCashDesksPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbCashDesksPropertiesChange') else _udebug := nil;{$ENDIF}

  if cbType.ItemIndex = 1 then lcbCashDeskTo.KeyValue := lcbCashDesks.KeyValue;

  With Sender as TcxComboBox do begin
    SelStart := 0;
    SelLength := 0;
  end;

  GetSaldos;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.GetSaldos;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.GetSaldos') else _udebug := nil;{$ENDIF}

  Application.ProcessMessages;
  GetSaldo(0);
  GetSaldo(1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbAccountToPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbAccountToPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  GetSaldo(1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbToCurrPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbToCurrPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  edTotalPropertiesChange(edTotalFrom);
  GetSaldo(1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.cbFromPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.cbFromPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  Application.ProcessMessages;
  GetSaldo(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.cbToPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.cbToPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  Application.ProcessMessages;
  GetSaldo(1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbCashDeskToPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbCashDeskToPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  GetSaldo(1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbAccountPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbAccountPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  GetSaldo(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.DefineOperation(AType, AFromCashID, AFromAccID,AToCashID, AToAccID, AFromCurr, AToCurr: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.DefineOperation') else _udebug := nil;{$ENDIF}

  FOperMode := True;
  cbType.ItemIndex := AType;

  case AType of
    0: begin
        if AFromAccID > 0 then begin
          cbFrom.ItemIndex := 1;
          lcbAccount.KeyValue := AFromAccID;
        end
        else if AFromCashID > 0 then begin
          cbFrom.ItemIndex := 0;
          lcbCashDesks.KeyValue := AFromCashID;
        end;

        if AToAccID > 0 then begin
          cbTo.ItemIndex := 1;
          lcbAccountTo.KeyValue := AToAccID;
        end
        else if AToCashID > 0 then begin
          cbTo.ItemIndex := 0;
          lcbCashDeskTo.KeyValue := AToCashID;
        end;
       end;

    1: begin
        if AFromAccID > 0 then begin
          cbCvFrom.ItemIndex := 1;
          lcbCvFromAcc.KeyValue := AFromAccID;
        end
        else if AFromCashID > 0 then begin
          cbCvFrom.ItemIndex := 0;
          lcbCvFromCashDesk.KeyValue := AFromCashID;
        end;
        if AFromCurr <> 0 then lcbCvFromCurr.KeyValue := AFromCurr;
        if AToCurr <> 0 then lcbCvToCurr.KeyValue := AToCurr;
       end;

    2: begin
         lcbCCFromAcc.KeyValue := AFromAccID;
       end;
  end;


  cbType.Enabled := False;
  lType.Enabled := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.DisableFrom;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.DisableFrom') else _udebug := nil;{$ENDIF}

  lFrom.Enabled := False;
  cbFrom.Enabled := False;
  lcbAccount.Enabled := False;
  lAccount.Enabled := False;
  lCashDesk.Enabled := False;
  lcbCashDesks.Enabled := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.DisableTo;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.DisableTo') else _udebug := nil;{$ENDIF}

  lTo.Enabled := False;
  cbTo.Enabled := False;
  lcbAccountTo.Enabled := False;
  lAccountTo.Enabled := False;
  lCashDeskTo.Enabled := False;
  lcbCashDeskTo.Enabled := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.GetSaldo(AType: Integer);
  var
    FSumm: Extended;
    FlcbAcc, FlcbCash, FlcbCurr: TssDBLookupCombo;
    FedSumm: TssCalcEdit;
    Fnb: TNotebook;
    FtxtSaldo: TssBevel;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.GetSaldo') else _udebug := nil;{$ENDIF}

  if not Self.Visible then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  Screen.Cursor := crSQLWait;
  FlcbAcc := nil;
  FlcbCash := nil;
  FlcbCurr := nil;
  FedSumm := nil;
  Fnb := nil;
  FtxtSaldo := nil;

  try
    case cbType.ItemIndex of
      0: begin
           if AType = 0 then begin
             FlcbAcc := lcbAccount;
             FlcbCash := lcbCashDesks;
             FlcbCurr := lcbCurrency;
             FedSumm := edTotalFrom;
             Fnb := nbFrom;
             FtxtSaldo := txtSaldoFrom;
           end
           else begin
             FlcbAcc := lcbAccountTo;
             FlcbCash := lcbCashDeskTo;
             FlcbCurr := lcbCurrTo;
             FedSumm := edTotalTo;
             Fnb := nbTo;
             FtxtSaldo := txtSaldoTo;
           end;
         end;

      1: begin
           if AType = 0 then begin
             FlcbAcc := lcbCvFromAcc;
             FlcbCash := lcbCvFromCashDesk;
             FlcbCurr := lcbCvFromCurr;
             FedSumm := edCvFromTotal;
             Fnb := nbCvFrom;
             FtxtSaldo := txtCvSaldoFrom;
           end
           else begin
             FlcbAcc := lcbCvFromAcc;
             FlcbCash := lcbCvFromCashDesk;
             FlcbCurr := lcbCvToCurr;
             FedSumm := edCvToTotal;
             Fnb := nbCvFrom;
             FtxtSaldo := txtCvSaldoTo;
           end;
         end;

      2: begin
           if AType = 0 then begin
             FlcbAcc := lcbCCFromAcc;
             FlcbCash := nil;
             FlcbCurr := lcbCCFromCurr;
             FedSumm := edCCFromSumm;
             Fnb := nil;
             FtxtSaldo := txtCCFromSaldo;
           end
           else begin
             FlcbAcc := nil;
             FlcbCash := lcbCCToCashDesk;
             FlcbCurr := lcbCCToCurr;
             FedSumm := edCCToSumm;
             Fnb := nil;
             FtxtSaldo := txtCCToSaldo;
           end;
         end;

      3: begin
           if AType = 0 then begin
             FlcbAcc := lcbAdAcc;
             FlcbCash := lcbAdCash;
             FlcbCurr := lcbAdCurr;
             FedSumm := nil;
             Fnb := nbAdFrom;
             FtxtSaldo := txtAdSaldoFrom;
           end;
           {else begin
             FlcbAcc := nil;
             FlcbCash := lcbCCToCashDesk;
             FlcbCurr := lcbCCToCurr;
             FedSumm := edCCToSumm;
             Fnb := nil;
             FtxtSaldo := txtCCToSaldo;
           end;
           }
         end;
    end;

    if AType = 0 then begin
      if Fnb = nil
        then FSaldo := RecalcBallance(1, FlcbAcc.KeyValue, FlcbCurr.KeyValue)
        else if Fnb.PageIndex = 0
          then FSaldo := RecalcBallance(0, FlcbCash.KeyValue, FlcbCurr.KeyValue)
          else FSaldo := RecalcBallance(1, FlcbAcc.KeyValue, FlcbCurr.KeyValue);

      try
        FSumm := RoundToA(StrToFloat(FedSumm.EditText), -2);
      except
        FSumm := 0;
      end;

      (*{$IFDEF LITE}
      if Assigned(Fnb) and (Fnb.PageIndex = 0)
        then FtxtSaldo.Caption := RS('Common', 'NA')
        else
      {$ENDIF}
      *)
      FtxtSaldo.Caption := FormatFloat(MoneyDisplayFormat, FSaldo - FSumm) + ' ' + FlcbCurr.EditText;

      if FSaldo - FSumm < 0
        then FtxtSaldo.Font.Color := clRed
        else FtxtSaldo.Font.Color := clMaroon;

      FFromSaldo := FSaldo;
    end
    else begin
      if Fnb = nil
        then FSaldo := RecalcBallance(0, FlcbCash.KeyValue, FlcbCurr.KeyValue)
        else if Fnb.PageIndex = 0
             then FSaldo := RecalcBallance(0, FlcbCash.KeyValue, FlcbCurr.KeyValue)
             else FSaldo := RecalcBallance(1, FlcbAcc.KeyValue, FlcbCurr.KeyValue);

      try
        FSumm := RoundToA(StrToFloat(FedSumm.EditText), -2);
      except
        FSumm := 0;
      end;

      (*{$IFDEF LITE}
      if (Fnb = nil) or (Fnb.PageIndex = 0)
        then FtxtSaldo.Caption := rs('Common', 'NA')
        else
      {$ENDIF}
      *)
      FtxtSaldo.Caption := FormatFloat(MoneyDisplayFormat, FSaldo + FSumm) + ' ' + FlcbCurr.EditText;

      if FSaldo + FSumm < 0
        then FtxtSaldo.Font.Color := clRed
        else FtxtSaldo.Font.Color := clMaroon;

      FToSaldo := FSaldo;
    end;

  finally
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbCashDesksPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbCashDesksPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  GetSaldo(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.edTotalFromPropertiesChange(Sender: TObject);
  var
    FSumm, FRate: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.edTotalFromPropertiesChange') else _udebug := nil;{$ENDIF}

  if not FLockEdits then begin
    FLockEdits := True;

    try
      try
        FSumm := RoundToA(StrToFloat(TssCalcEdit(Sender).EditText), -2);
      except
        FSumm := 0;
      end;

      FFromSumm := FSumm;

      if cdsCurrency.Locate('currid', lcbCurrency.KeyValue, []) then begin
        FRate := cdsCurrency.FieldByName('onvalue').AsFloat;

        if cdsCurrency.Locate('currid', lcbCurrTo.KeyValue, [])
          then FSumm := FRate / cdsCurrency.FieldByName('onvalue').AsFloat * FSumm;
      end;

      FToSumm := FSumm;
      edTotalTo.Value := FToSumm;

    finally
      FLockEdits := False;
    end;
  end;

  //{$IFNDEF LITE}
  txtSaldoFrom.Caption := FormatFloat(MoneyDisplayFormat, FFromSaldo - FFromSumm) + ' ' + lcbCurrency.EditText;
  //{$ENDIF}

  if FFromSaldo - FFromSumm < 0
    then txtSaldoFrom.Font.Color := clRed
    else txtSaldoFrom.Font.Color := clMaroon;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.edTotalToPropertiesChange(Sender: TObject);
  var
    FSumm, FRate: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.edTotalToPropertiesChange') else _udebug := nil;{$ENDIF}

  if not FLockEdits then begin
    FLockEdits := True;

    try
      try
        FSumm := RoundToA(StrToFloat(edTotalTo.EditText), -2);
      except
        FSumm := 0;
      end;

      FToSumm := FSumm;

      if cdsCurrency.Locate('currid', lcbCurrTo.KeyValue, []) then begin
        FRate := cdsCurrency.FieldByName('onvalue').AsFloat;
if cdsCurrency.Locate('currid', lcbCurrency.KeyValue, [])
          then FSumm := FRate / cdsCurrency.FieldByName('onvalue').AsFloat * FSumm;
      end;
      FFromSumm := FSumm;
      edTotalFrom.Value := FSumm;

    finally
      FLockEdits := False;
    end;
  end;

  //{$IFNDEF LITE}
  txtSaldoTo.Caption := FormatFloat(MoneyDisplayFormat, FToSaldo + FToSumm) + ' ' + lcbCurrTo.EditText;
  //{$ENDIF}

  if FToSaldo + FToSumm < 0
    then txtSaldoTo.Font.Color := clRed
    else txtSaldoTo.Font.Color := clMaroon;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.cbCvFromPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.cbCvFromPropertiesChange') else _udebug := nil;{$ENDIF}

  nbCvFrom.PageIndex := cbCvFrom.ItemIndex;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbCvFromCurrPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbCvFromCurrPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  txtCvFromCurr.Caption := lcbCvFromCurr.Text;
  if cdsCurrency.Locate('currid', lcbCvFromCurr.KeyValue, []) then begin
    btnCvFromRate.Caption := FormatFloat('0.###', cdsCurrency.FieldByName('onvalue').AsFloat);
    btnCvFromRate.Enabled := lcbCvFromCurr.KeyValue <> BaseCurrID;
    btnCvFromRate.Invalidate;
  end;
  GetSaldo(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbCvToCurrPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbCvToCurrPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  txtCvToCurr.Caption := lcbCvToCurr.Text;
  if cdsCurrency.Locate('currid', lcbCvToCurr.KeyValue, []) then begin
    btnCvToRate.Caption := FormatFloat('0.###', cdsCurrency.FieldByName('onvalue').AsFloat);
    btnCvToRate.Enabled := lcbCvToCurr.KeyValue <> BaseCurrID;
    btnCvToRate.Invalidate;
  end;
  GetSaldo(1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbCvFromCashDeskPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbCvFromCashDeskPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  GetSaldos;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbCvFromAccPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbCvFromAccPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  GetSaldos;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.cbCvFromPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.cbCvFromPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  Application.ProcessMessages;
  GetSaldos;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.edCvFromTotalPropertiesChange(Sender: TObject);
  var
    FSumm, FRate: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.edCvFromTotalPropertiesChange') else _udebug := nil;{$ENDIF}

  if not FLockEdits then begin
    FLockEdits := True;

    try
      try
        FSumm := RoundToA(StrToFloat(TssCalcEdit(Sender).EditText), -2);
      except
        FSumm := 0;
      end;

      FFromSumm := FSumm;

      if cdsCurrency.Locate('currid', lcbCvFromCurr.KeyValue, []) then begin
        FRate := cdsCurrency.FieldByName('onvalue').AsFloat;
        if cdsCurrency.Locate('currid', lcbCvToCurr.KeyValue, [])
          then FSumm := FRate / cdsCurrency.FieldByName('onvalue').AsFloat * FSumm;
      end;

      FToSumm := FSumm;
      edCvToTotal.Value := FToSumm;

    finally
      FLockEdits := False;
    end;
  end;

  //{$IFNDEF LITE}
  txtCvSaldoFrom.Caption := FormatFloat(MoneyDisplayFormat, FFromSaldo - FFromSumm) + ' ' + lcbCvFromCurr.EditText;
  //{$ENDIF}
  if FFromSaldo - FFromSumm < 0
    then txtCvSaldoFrom.Font.Color := clRed
    else txtCvSaldoFrom.Font.Color := clMaroon;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.edCvToTotalPropertiesChange(Sender: TObject);
  var
    FSumm, FRate: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.edCvToTotalPropertiesChange') else _udebug := nil;{$ENDIF}

  if not FLockEdits then begin
    FLockEdits := True;
    try
      try
        FSumm := RoundToA(StrToFloat(edCvToTotal.EditText), -2);
      except
        FSumm := 0;
      end;

      FToSumm := FSumm;

      if cdsCurrency.Locate('currid', lcbCvToCurr.KeyValue, []) then begin
        FRate := cdsCurrency.FieldByName('onvalue').AsFloat;
        if cdsCurrency.Locate('currid', lcbCvFromCurr.KeyValue, [])
          then FSumm := FRate / cdsCurrency.FieldByName('onvalue').AsFloat * FSumm;
      end;
      FFromSumm := FSumm;
      edCvFromTotal.Value := FSumm;

    finally
      FLockEdits := False;
    end;
  end;

  //{$IFNDEF LITE}
  txtCvSaldoTo.Caption := FormatFloat(MoneyDisplayFormat, FToSaldo + FToSumm) + ' ' + lcbCvFromCurr.EditText;
  //{$ENDIF}

  if FToSaldo + FToSumm < 0
    then txtCvSaldoTo.Font.Color := clRed
    else txtCvSaldoTo.Font.Color := clMaroon;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.cbFromEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.cbFromEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.cbFromExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.cbFromExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.btnFinFromMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.btnFinFromMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := cbFrom;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.btnFinFromMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.btnFinFromMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.btnFinToMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.btnFinToMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := cbTo;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.btnCvFinFromMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.btnCvFinFromMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := cbCvFrom;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.edCCFromSummPropertiesChange(Sender: TObject);
  var
    FSumm, FPerc, FRate: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.edCCFromSummPropertiesChange') else _udebug := nil;{$ENDIF}

  if not FLockEdits then begin
    FLockEdits := True;
    try
      try
        FSumm := RoundToA(StrToFloat(edCCFromSumm.EditText), -2);
      except
        FSumm := 0;
      end;

      try
        FPerc := RoundToA(StrToFloat(edCCPercent.EditText), -2);
      except
        FPerc := 0;
      end;

      FChargeSumm := RoundToA(FSumm * FPerc / 100, -2);

      FFromSumm := FSumm;

      if cdsCurrency.Locate('currid', lcbCCFromCurr.KeyValue, []) then begin
        FRate := cdsCurrency.FieldByName('onvalue').AsFloat;
        if cdsCurrency.Locate('currid', lcbCCToCurr.KeyValue, [])
          then FSumm := FRate / cdsCurrency.FieldByName('onvalue').AsFloat * (FSumm - FChargeSumm);
      end;
      FToSumm := FSumm;
      edCCToSumm.Value := FToSumm;

    finally
      FLockEdits := False;
    end;
  end;

  txtCCFromSaldo.Caption := FormatFloat(MoneyDisplayFormat, FFromSaldo - FFromSumm) + ' ' + lcbCCFromCurr.EditText;

  if FFromSaldo - FFromSumm < 0
    then txtCCFromSaldo.Font.Color := clRed
    else txtCCFromSaldo.Font.Color := clMaroon;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.edCCToSummPropertiesChange(Sender: TObject);
  var
    FSumm, FPerc, FRate, FFromSumm: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.edCCToSummPropertiesChange') else _udebug := nil;{$ENDIF}

  if not FLockEdits then begin
    FLockEdits := True;
    try
      try
        FSumm := RoundToA(StrToFloat(edCCToSumm.EditText), -2);
      except
        FSumm := 0;
      end;

      try
        FFromSumm := RoundToA(StrToFloat(edCCFromSumm.EditText), -2);
      except
        FFromSumm := 0;
      end;

      try
        FPerc := RoundToA(StrToFloat(edCCPercent.EditText), -2);
      except
        FPerc := 0;
      end;

      FToSumm := FSumm;

      if cdsCurrency.Locate('currid', lcbCCToCurr.KeyValue, []) then begin
        FRate := cdsCurrency.FieldByName('onvalue').AsFloat;
        if cdsCurrency.Locate('currid', lcbCCFromCurr.KeyValue, [])
  //then FSumm := FRate / cdsCurrency.FieldByName('onvalue').AsFloat * FSumm * 100 / (100 - FPerc);
          then if FFromSumm <> 0
            then FPerc := 100 - (FRate / cdsCurrency.FieldByName('onvalue').AsFloat * FSumm / FFromSumm * 100)
            else FPerc := 0;
      end;
      //FFromSumm := FSumm;

      FChargeSumm := RoundToA(FFromSumm * FPerc / 100, -2);
  //edCCFromSumm.Value := FFromSumm;
      edCCPercent.Value := FPerc;

    finally
      FLockEdits := False;
    end;
  end;

  //{$IFNDEF LITE}
  txtCCToSaldo.Caption := FormatFloat(MoneyDisplayFormat, FToSaldo + FToSumm) + ' ' + lcbCCToCurr.EditText;
  //{$ENDIF}

  if FToSaldo + FToSumm < 0
    then txtCCToSaldo.Font.Color := clRed
    else txtCCToSaldo.Font.Color := clMaroon;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbCCChargePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbCCChargePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.btnChargeTypeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.btnChargeTypeMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbCCCharge;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.btnChargeTypeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.btnChargeTypeMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.btnFinanceMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.btnFinanceMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.btnFinanceMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.btnFinanceMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.cbAddTypePropertiesEditValueChanged(Sender: TObject);
  var
    li: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.cbAddTypePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if cbAdType.ItemIndex = 0 then begin
    lAdFrom.Caption := rs('fmMoneyMove', 'To') + ':';

    with cbAdFrom do begin
      li := ItemIndex;
      if li = -1 then li := 0;
      Properties.Items.Clear;
      Properties.Items.Add(rs('fmMoneyMove', 'ToCash'));
      Properties.Items.Add(rs('fmMoneyMove', 'ToAcc'));
      ItemIndex := li;
    end;
  end
  else begin
    lAdFrom.Caption := rs('fmMoneyMove', 'From') + ':';

    with cbAdFrom do begin
      li := ItemIndex;
      if li = -1 then li := 0;
      Properties.Items.Clear;
      Properties.Items.Add(rs('fmMoneyMove', 'FromCash'));
      Properties.Items.Add(rs('fmMoneyMove', 'FromAcc'));
      ItemIndex := li;
    end;
  end;

  if cbType.ItemIndex = 3 then GetAdImg;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.cbAdFromPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.cbAdFromPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  nbAdFrom.PageIndex := cbAdFrom.ItemIndex;
  GetSaldo(0);
  edAddTotalPropertiesChange(edAdTotal);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.btnAdFromMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.btnAdFromMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := cbAdFrom;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbAdAccPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbAdAccPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  GetSaldo(0);
  DataModified(Sender);
  edAddTotalPropertiesChange(edAdTotal);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.lcbAdCurrPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.lcbAdCurrPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  DataModified(Sender);
  GetSaldo(0);
  edAddTotalPropertiesChange(edAdTotal);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.edAddTotalPropertiesChange(Sender: TObject);
  var
    FSumm: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.edAddTotalPropertiesChange') else _udebug := nil;{$ENDIF}

  try
    FSumm := StrToFloat(edAdTotal.EditText);
  except
    FSumm := 0;
  end;

  FFromSumm := FSumm;
  if cbAdType.ItemIndex = 0
    then FSumm := FSaldo + FSumm
    else FSumm := FSaldo - FSumm;

  txtAdSaldoTo.Caption := FormatFloat(MoneyDisplayFormat, FSumm) + ' ' + lcbAdCurr.Text;
  if FSumm < 0
    then txtAdSaldoTo.Font.Color := clRed
    else txtAdSaldoTo.Font.Color := clMaroon;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.cbTypePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.cbTypePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if (cbType.ItemIndex = 3) and (txtAdSaldoFrom.Caption = '')
    then lcbAdAccPropertiesEditValueChanged(lcbAdAcc);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMoneyMove.GetAdImg;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMoneyMove.GetAdImg') else _udebug := nil;{$ENDIF}

  imgType.Picture.Bitmap.Height := 0;

  if cbAdType.ItemIndex = 0
    then dmData.Images.GetBitmap(193, imgType.Picture.Bitmap)
    else dmData.Images.GetBitmap(192, imgType.Picture.Bitmap);

  imgType.Invalidate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditMoneyMove', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
