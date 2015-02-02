{$I ok_sklad.inc}
unit EditPayDoc;

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
  Menus, cxSpinEdit, cxTimeEdit, cxPC, ComCtrls, okSearchEdit;

type
  TfrmEditPayDoc = class(TBaseDlg)
    aFinance: TAction;
    aPayMPersons: TAction;
    aSetPanels: TAction;
    aWBDocs: TAction;
    btnBallance: TssSpeedButton;
    btnCashDesks: TssSpeedButton;
    btnChargeType: TssSpeedButton;
    btnFin: TssSpeedButton;
    btnFinance: TssSpeedButton;
    btnKABallance2: TssSpeedButton;
    btnPayMPerson: TssSpeedButton;
    btnPrint: TssSpeedButton;
    btnSetPanels: TssSpeedButton;
    btnSetTime: TssSpeedButton;
    btnWBDocs: TssSpeedButton;
    bvlDoc: TssBevel;
    bvlKA: TssBevel;
    bvlMainInfo: TssBevel;
    bvlNotes: TssBevel;
    bvlSumm: TssBevel;
    cbDocType: TcxComboBox;
    cdsCashDesks: TssClientDataSet;
    cdsChargeType: TssClientDataSet;
    cdsCurrency: TssClientDataSet;
    cdsEntAcc: TssClientDataSet;
    cdsEntAccACCID: TIntegerField;
    cdsEntAccACCNUM: TStringField;
    cdsEntAccBANKID: TIntegerField;
    cdsEntAccDEF: TIntegerField;
    cdsEntAccfullname: TStringField;
    cdsEntAccMFO: TStringField;
    cdsEntAccNAME: TStringField;
    cdsEntAccTYPEID: TIntegerField;
    cdsEntAccTYPENAME: TStringField;
    cdsPayMPersons: TssClientDataSet;
    cdsPayType: TssClientDataSet;
    chbChecked: TcxCheckBox;
    chbDoc: TcxCheckBox;
    chbNDS: TcxCheckBox;
    edContr: TokContractSearchEdit;
    edDocNum: TcxTextEdit;
    edKAgent: TokKASearchEdit;
    edOnDate: TcxDateEdit;
    edRate: TssCalcEdit;
    edReason: TcxTextEdit;
    edTime: TcxTimeEdit;
    edTotal: TssCalcEdit;
    edWBNum: TokDocSearchEdit;
    lAccount: TLabel;
    lBallance: TLabel;
    lCashDesk: TLabel;
    lcbAccount: TssDBLookupCombo;
    lcbCashDesks: TssDBLookupCombo;
    lcbChargeType: TssDBLookupCombo;
    lcbCurrency: TssDBLookupCombo;
    lcbPayMPerson: TssDBLookupCombo;
    lcbPayType: TssDBLookupCombo;
    lChargeType: TssLabel;
    lDocDate: TssLabel;
    lDocNum: TLabel;
    lDocPaid: TssLabel;
    lDocSaldo: TssLabel;
    lDocSum: TssLabel;
    lDocType: TssLabel;
    lNDS: TLabel;
    lNotes: TLabel;
    lOnDate: TLabel;
    lPayMPerson: TssLabel;
    lPayType: TLabel;
    lRate: TLabel;
    lReason: TLabel;
    lTotal: TLabel;
    lTotalDef: TLabel;
    memNotes: TMemo;
    nbPayType: TNotebook;
    panDoc: TPanel;
    panKA: TPanel;
    panMainInfo: TPanel;
    panNotes: TPanel;
    panSumm: TPanel;
    srcCashDesks: TDataSource;
    srcChargeType: TDataSource;
    srcCurrency: TDataSource;
    srcEntAcc: TDataSource;
    srcPayMPersons: TDataSource;
    srcPayType: TDataSource;
    ssBevel1: TssBevel;
    stBallance: TssBevel;
    stCurrencyDef: TssBevel;
    stCurrNDS: TssBevel;
    stNDS: TssBevel;
    stTotalDef: TssBevel;
    txtDocDate: TssBevel;
    txtDocPaid: TssBevel;
    txtDocSaldo: TssBevel;
    txtDocSumm: TssBevel;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aFinanceExecute(Sender: TObject);
    procedure aHelpExecute(Sender: TObject);
    procedure aPayMPersonsExecute(Sender: TObject);
    procedure aSetPanelsExecute(Sender: TObject);
    procedure aWBDocsExecute(Sender: TObject);
    procedure btnBallanceClick(Sender: TObject);
    procedure btnCashDesksMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCashDesksMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnChargeTypeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnChargeTypeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFinMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFinMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnKAgentMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPayMPersonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnSetTimeClick(Sender: TObject);
    procedure cbDocTypePropertiesEditValueChanged(Sender: TObject);
    procedure cdsCashDesksAfterOpen(DataSet: TDataSet);
    procedure cdsCurrencyAfterOpen(DataSet: TDataSet);
    procedure cdsCurrencyBeforeOpen(DataSet: TDataSet);
    procedure cdsEntAccCalcFields(DataSet: TDataSet);
    procedure chbDocClick(Sender: TObject);
    procedure chbNDSClick(Sender: TObject);
    procedure DataModified(Sender: TObject);
    procedure edContrChange(Sender: TObject);
    procedure edKAgentChange(Sender: TObject);
    procedure edKAgentRefButtonClick(Sender: TObject);
    procedure edOnDateExit(Sender: TObject);
    procedure edOnDateKeyPress(Sender: TObject; var Key: Char);
    procedure edOnDatePropertiesChange(Sender: TObject);
    procedure edOnDatePropertiesEditValueChanged(Sender: TObject);
    procedure edRatePropertiesChange(Sender: TObject);
    procedure edTotalPropertiesChange(Sender: TObject);
    procedure edTotalPropertiesEditValueChanged(Sender: TObject);
    procedure edWBNumChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcbCashDesksEnter(Sender: TObject);
    procedure lcbCurrencyPropertiesEditValueChanged(Sender: TObject);
    procedure lcbPayMPersonEnter(Sender: TObject);
    procedure lcbPayMPersonExit(Sender: TObject);
    procedure lcbPayTypeEnter(Sender: TObject);
    procedure lcbPayTypeExit(Sender: TObject);
    procedure lcbPayTypePropertiesEditValueChanged(Sender: TObject);

  private
    FRate: Extended;
    FCurrCtrl: TControl;
    FTotalDef: extended;
    FDateChanged: boolean;
    FCurrNum: Integer;
    FLoaded: Boolean;
    FPanNotesVis, FPanDocVis: Boolean;
    FRealigned: Boolean;
    FOldSumm: Extended;
    FWBillID: Integer;
    FSaldo: Extended;
    FRateChanged: Boolean;

    procedure SetRate;
    procedure RecalcBallance;
    procedure WMRecordChanged(var M: TMessage); message WM_RECORDCHANGED;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRealignPanels(var M: TMessage); message WM_REALIGNPANELS;
    procedure SavePanVisibility;
    procedure LoadPanVisibility;
    procedure RealignPanels;
    procedure RecalcDocSaldo;
    procedure RecalcContrSaldo;
    procedure SetWBillID(const Value: Integer);

  protected
    procedure NoAccess(Sender: TObject);
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
    procedure SetOnDate(const Value: TDateTime); override;

  public
    ParentHandle: HWND;
    WType: Integer;

    procedure SetCaptions; override;
    procedure DoHelp; override;
    property WBillID: Integer read FWBillID write SetWBillID;
  end;

var
  frmEditPayDoc: TfrmEditPayDoc;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ClientData, prFun, prTypes,
  ssFun, CurrencyEdit, ssDateUtils, ssCallbackConst, Progress, fMessageDlg,
  ssRegUtils, KATurnover, ssStrUtil, SetPanels, okClasses, udebug,
  ssBaseIntfDlg;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmEditPayDoc.setid(const Value: integer);
  var
    FAllowAutoNum: Boolean;
    FType: TDocType;
    FPr, FSuf: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditPayDoc.setid') else _udebug := nil;{$ENDIF}

  FLoaded := False;

  if not IsPattern then FID := Value;

  FAllowAutoNum := False;

  if GrpID = 1 then begin
    FAllowAutoNum := PDInAutoNum;
    FType := dtPDIn;
    FPr := PDInPrefix;
    FSuf := PDInSuffix;
    chbChecked.Checked := PDInChecked;
  end
  else if GrpID = -1 then begin
    FAllowAutoNum := PDOutAutoNum;
    FType := dtPDOut;
    FPr := PDOutPrefix;
    FSuf := PDOutSuffix;
    chbChecked.Checked := PDOutChecked;
  end
  else if GrpID = -2 then begin
    FAllowAutoNum := PDChargeAutoNum;
    FType := dtPDCharge;
    FPr := PDChargePrefix;
    FSuf := PDChargeSuffix;
    chbChecked.Checked := PDChargeChecked;
  end
  else begin // for some weird case
    ssMessageDlg('parameters error.', ssmtError, [ssmbOk]);
    Exit;
  end;

  if (Value = 0) and FAllowAutoNum then begin
    FCurrNum := GetDocNum(dmData.SConnection, FType, 1);
    edDocNum.Text := FPr + IntToStr(FCurrNum) + FSuf;
  end
  else edDocNum.Text := '';

  with newDataSet do
  try
    if Value <> 0 then begin
      if not IsPattern then begin
        case GrpID of
           1: Self.Caption := rs(ParentNameEx, 'PayDocInProps');
          -1: Self.Caption := rs(ParentNameEx, 'PayDocOutProps');
          -2: Self.Caption := rs(ParentNameEx, 'PayDocChargeProps');
        end;
      end
      else case GrpID of
         1: Self.Caption := rs(ParentNameEx, 'NewPayDocIn');
        -1: Self.Caption := rs(ParentNameEx, 'NewPayDocOut');
        -2: Self.Caption := rs(ParentNameEx, 'NewPayDocCharge');
      end;

      ProviderName := 'pPayDoc_Get';
      FetchParams;
      Params.ParamByName('paydocid').AsInteger := Value;
      Open;

      if not IsEmpty then begin
        edOnDate.Date := Int(FieldByName('ondate').AsDateTime);

        DSRefresh(cdsCurrency, 'currid', 0);

        lcbCurrency.KeyValue := FieldByName('currid').AsInteger;
        edRate.Value := FieldByName('onvalue').AsFloat;
        edTime.Time := Frac(FieldByName('ondate').AsDateTime);
        edDocNum.Text := FieldByName('docnum').AsString;
        edKAgent.KAID := FieldByName('kaid').AsInteger;
        edTotal.Value := FieldByName('total').AsFloat;
        FOldSumm := FieldByName('total').AsFloat;
        lcbPayType.KeyValue := FieldByName('ptypeid').AsInteger;
        lcbChargeType.KeyValue := FieldByName('ctypeid').AsInteger;
        chbChecked.Checked := (FieldByName('checked').AsInteger = 1);
        chbNDS.Checked := (FieldByName('withnds').AsInteger = 1);
        memNotes.Text := FieldByName('notes').AsString;
        edReason.Text := FieldByName('reason').AsString;

        if not FieldByName('mpersonid').IsNull
          then lcbPayMPerson.KeyValue := FieldByName('mpersonid').AsInteger;

        if not FieldByName('accid').IsNull
          then lcbAccount.KeyValue := FieldByName('accid').AsInteger
          else lcbAccount.EditText := '';

        if not FieldByName('cashid').IsNull
          then lcbCashDesks.KeyValue := FieldByName('cashid').AsInteger
          else lcbCashDesks.EditText := '';
      end;
      Close;

      ProviderName := 'pPayDoc_GetWBList';
      FetchParams;
      Params.ParamByName('paydocid').AsInteger := Value;
      Open;
      if not IsPattern then edKAgent.Enabled := IsEmpty;

      if not IsEmpty then begin
        chbDoc.Checked := True;
        cbDocType.ItemIndex := cbDocType.Properties.Items.IndexOfObject(TObject(FieldByName('wtype').AsInteger));
        edWBNum.ID := FieldByName('wbillid').AsInteger;
      end;
      Close;

      ProviderName := 'pDocsRel_PD_Contr_Get';
      FetchParams;
      Params.ParamByName('paydocid').AsInteger := FID;
      Open;
      if not IsEmpty then begin
        chbDoc.Checked := True;

        if GrpID < 0
          then cbDocType.ItemIndex := cbDocType.Properties.Items.IndexOfObject(TObject(8))
          else cbDocType.ItemIndex := cbDocType.Properties.Items.IndexOfObject(TObject(-8));

        edContr.DocID := FieldByName('docid').AsInteger;
      end
      else edContr.DocID := 0;

      Close;

      btnApply.Enabled := False;
    end
    else case GrpID of
       1: Self.Caption := rs(ParentNameEx, 'NewPayDocIn');
      -1: Self.Caption := rs(ParentNameEx, 'NewPayDocOut');
      -2: Self.Caption := rs(ParentNameEx, 'NewPayDocCharge');
    end;

    if Value = 0 then begin
      with cdsPayMPersons do begin
        if Locate('userid', UserID, []) then lcbPayMPerson.KeyValue := FieldByName('kaid').AsInteger;
      end;
    end;

    if UserID <> 0 then begin
      lcbPayMPerson.Enabled := False;
      btnPayMPerson.Enabled := False;

      if Value <> 0 then  // editing enabled only for document owner or admin
        with cdsPayMPersons do
          if Locate('userid', UserID, []) and (lcbPayMPerson.KeyValue <> FieldByName('kaid').AsInteger)
            then EditingDisabled := True;
    end;

  finally
    Free;
  end;

  //lcbChargeType.Enabled := GrpID = -2;
  //btnChargeType.Visible := lcbChargeType.Enabled;
  //lChargeType.Enabled := lcbChargeType.Enabled;
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
procedure TfrmEditPayDoc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: boolean;
    intTmp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.FormCloseQuery') else _udebug := nil;{$ENDIF}

  try // finally
    if not (ModalResult in [mrOK, mrYes]) then begin
      case GrpID of
         1: if GetDocNum(dmData.SConnection, dtPDIn, 0) = FCurrNum then GetDocNum(dmData.SConnection, dtPDIn, -1);
        -1: if GetDocNum(dmData.SConnection, dtPDOut, 0) = FCurrNum then GetDocNum(dmData.SConnection, dtPDOut, -1);
        -2: if GetDocNum(dmData.SConnection, dtPDCharge, 0) = FCurrNum then GetDocNum(dmData.SConnection, dtPDCharge, -1);
      end;
      Exit;
    end;

    CanClose := False;

    if (GrpID < 0) and chbChecked.Checked then begin
      if mrYes = ssMessageDlg(rs(ParentNameEx, 'CheckMoneyMode'), ssmtWarning, [ssmbYes, ssmbNo], 'CheckMoneyMode', True)
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

      if not CheckMoneyDlg(dmData.SConnection, edOnDate.Date, lcbPayType.KeyValue - 1, lcbAccount.KeyValue,
                           lcbCashDesks.KeyValue, lcbCurrency.KeyValue, edTotal.EditValue)
      then Exit;
    end;

    if chbDoc.Checked and (FSaldo < 0) and (mrYes <> ssMessageDlg(rs('fmPayDoc', 'WrongDocSaldo'), ssmtWarning, [ssmbYes, ssmbNo]))
      then Exit;

    if (lcbCurrency.KeyValue <> BaseCurrID) and (mrYes <> ssMessageDlg(rs(ParentNameEx, 'AnotherCurrWarning'), ssmtWarning, [ssmbYes, ssmbNo], 'DifferentCurrWarning', True))
      then Exit;

    with newDataSet do
    try //except
      TrStart;

      try //finally
        NewRecord := (ID = 0);
        if NewRecord then FID := GetMaxID(dmData.SConnection, 'paydoc', 'paydocid');

        if NewRecord
          then ProviderName := 'pPayDoc_Ins'
          else ProviderName := 'pPayDoc_Upd';

        FetchParams;
        Params.ParamByName('paydocid').AsInteger := FID;
        Params.ParamByName('ondate').AsDateTime := edOnDate.Date + Frac(edTime.Time);
        Params.ParamByName('docnum').AsString := edDocNum.Text;

        if edKAgent.KAID > 0
          then Params.ParamByName('kaid').AsInteger := edKAgent.KAID
          else begin
            Params.ParamByName('kaid').DataType := ftInteger;
            Params.ParamByName('kaid').Clear;
          end;

        Params.ParamByName('ptypeid').AsInteger := lcbPayType.KeyValue;
        Params.ParamByName('ctypeid').AsInteger := lcbChargeType.KeyValue;
        Params.ParamByName('currid').AsInteger := lcbCurrency.KeyValue;
        Params.ParamByName('onvalue').AsFloat := FRate;
        Params.ParamByName('total').AsFloat := RoundToA(StrToFloat(edTotal.EditText), -2);
        Params.ParamByName('doctype').AsInteger := GrpID;

        if lcbPayMPerson.Text = '' then begin
          Params.ParamByName('mpersonid').DataType := ftInteger;
          Params.ParamByName('mpersonid').Clear;
        end
        else Params.ParamByName('mpersonid').AsInteger := lcbPayMPerson.KeyValue;

        if lcbPayType.KeyValue = 1
          then Params.ParamByName('cashid').AsInteger := lcbCashDesks.KeyValue
          else begin
            Params.ParamByName('cashid').DataType := ftInteger;
            Params.ParamByName('cashid').Clear;
          end;

        if (lcbPayType.KeyValue = 2) and (lcbAccount.EditText <> '')
          then Params.ParamByName('accid').AsInteger := lcbAccount.KeyValue
          else begin
            Params.ParamByName('accid').DataType := ftInteger;
            Params.ParamByName('accid').Clear;
          end;

        Params.ParamByName('checked').AsInteger := Integer(chbChecked.Checked);
        Params.ParamByName('withnds').AsInteger := Integer(chbNDS.Checked);
        Params.ParamByName('notes').AsString := memNotes.Text;
        Params.ParamByName('reason').AsString := edReason.Text;
        Execute;

        if FID > 0 then begin
          ProviderName := 'pWaybillPay_DelByPD';
          FetchParams;
          Params.ParamByName('paydocid').AsInteger := FID;
          Execute;
        end;

        if chbDoc.Checked then begin
          if edWBNum.Visible then begin
            ProviderName := 'pWaybillPay_Ins';
            FetchParams;
            Params.ParamByName('paydocid').AsInteger := FID;
            Params.ParamByName('wbillid').AsInteger := edWBNum.ID;
            Execute;
          end
          else begin
            ProviderName := 'pWaybillPay_Contr_Ins';
            FetchParams;
            Params.ParamByName('paydocid').AsInteger := FID;
            Params.ParamByName('docid').AsInteger := edContr.DocID;
            Execute;
          end;
        end;

        TrCommit;

        if chbDoc.Checked and (edContr.DocID > 0) then DoRecalcContract(dmData.SConnection, edContr.DocID);

        if FWBillID > 0 then begin
          SendMessage(MainHandle, WM_REFRESH, FID, 100);
          RefreshFun('TfmPayDoc', 0);
        end
        else SendMessage(MainHandle, WM_REFRESH, FID, 0);

        RefreshFun('TfmFinance', 0);
        RefreshFun('TfmOrders', 16);
        RefreshFun('TfmOrders', -16);
        RefreshFun('TfmWaybill', 0);
        RefreshFun('TfmWaybillOut', 0);

        if GrpID <> -2 then DoRecalcKASaldo(dmData.SConnection, edKAgent.KAID, edOnDate.Date, rs(ParentNameEx, 'RecalcBallance'));

        if RefreshAllClients then begin
          //dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_PAYDOCIN);
          //dmData.SConnection.AppServer.q_add(CA_REFRESH, CA_KAGENTS);
        end;

        if ModalResult = mrYes then begin
          if NewRecord then begin
            if not IsPattern then edTotal.Value := 0;

            ID := 0;

            if FWBillID = 0
              then edKAgent.KAID := 0
              else edWBNum.ReloadData;

            RecalcBallance;

            if GrpID = -2
              then lcbChargeType.SetFocus
              else edDocNum.SetFocus;
          end;
        end
        else CanClose := True;

        FModified := False;

      finally
        Free;
      end;

    except
      on e:exception do begin
        TrRollback;
        ssMessageDlg(e.Message, ssmtError, [ssmbOk]);
      end;
    end; // with newDataSet

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfrmEditPayDoc.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  var
    Total: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.ActionListUpdate') else _udebug := nil;{$ENDIF}

  try
    total := StrToFloat(edTotal.Text);
  except
    Total := 0;
  end;

  aOk.Enabled := (Trim(edDocNum.EditingText) <> '')
     and ( (edKAgent.KAID > 0) or ((edKAgent.KAID = 0) and (GrpID = -2)) )
     and (Trim(lcbPayType.Text) <> '')
     and (Trim(lcbCurrency.Text) <> '')
     and (Total > 0)
     and (((lcbPayType.KeyValue = 2) and (lcbAccount.KeyValue > 0)) or (lcbPayType.KeyValue <> 2))
     and (not chbDoc.Checked or ((edWBNum.ID > 0) and edWBNum.Visible) or ((edContr.DocID > 0) and edContr.Visible));

  aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.DataModified(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.SetCaptions;
  var
    intTmp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    lOnDate.Caption := GetRS(ParentNameEx, 'Date') + ':';
    lNotes.Caption := GetRS(ParentNameEx, 'Notes') + ':';
    lReason.Caption := GetRS(ParentNameEx, 'Reason') + ':';
    lTotal.Caption := GetRS(ParentNameEx, 'Summ') + ':';
    lTotalDef.Caption := GetRS(ParentNameEx, 'SummIn') + ' ' + BaseCurrName + ':';
    lDocNum.Caption := GetRS(ParentNameEx, 'DocNum') + ':';
    lPayType.Caption := GetRS(ParentNameEx, 'PayType') + ':';
    lPayMPerson.Caption := GetRS(ParentNameEx, 'MPerson') + ':';
    lBallance.Caption := GetRS(ParentNameEx, 'Ballance') + ':';
    lRate.Caption := GetRS(ParentNameEx, 'Rate') + ':';
    lNDS.Caption := GetRS(ParentNameEx, 'NDS') + ' ' + FloatToStr(NDS) + '%:';
    lCashDesk.Caption := GetRS(ParentNameEx, 'CashDesk') + ':';
    lAccount.Caption := GetRS(ParentNameEx, 'Account') + ':';
    edWBNum.Caption.Caption := lDocNum.Caption;
    chbDoc.Properties.Caption := GetRS(ParentNameEx, 'WBDoc');
    lDocType.Caption := GetRS(ParentNameEx, 'DocTypes') + ':';
    lDocDate.Caption := GetRS(ParentNameEx, 'Date') + ':';
    lDocSaldo.Caption := GetRS(ParentNameEx, 'DocSaldo') + ':';
    lDocSum.Caption := GetRS(ParentNameEx, 'DocSumm') + ':';
    lDocPaid.Caption := GetRS(ParentNameEx, 'DocPaid') + ':';
    btnSetPanels.Hint := GetRS('fmWaybill', 'SetPanels');
    btnFinance.Hint := GetRS('fmFinance', 'Finance');
    btnFin.Hint := GetRS('fmFinance', 'Finance');

    edContr.InitRes;
    edContr.Caption.Caption := GetRS(ParentNameEx, 'DocNum') + ':';

    if GrpID = 1 then begin
      edKAgent.Caption.Caption := GetRS(ParentNameEx, 'Sender') + ':';
      lChargeType.Caption := GetRS(ParentNameEx, 'ChargeTypeIn') + ':';
    end
    else begin
      edKAgent.Caption.Caption := GetRS(ParentNameEx, 'Receiver') + ':';
      lChargeType.Caption := GetRS(ParentNameEx, 'ChargeTypeOut') + ':';
    end;

    with cbDocType do begin
      if GrpID = 1 then begin
        Properties.Items.AddObject(rs('frmOptions', 'WBOut'), TObject(-1));
        Properties.Items.AddObject(rs('frmOptions', 'AccOut'), TObject(2));
        Properties.Items.AddObject(rs('frmOptions', 'WBRetOut'), TObject(-6));
        Properties.Items.AddObject(rs('fmContr', 'ContractsOut'), TObject(-8));
        Properties.Items.AddObject(rs('frmOptions', 'OrdersOut'), TObject(-16));

        if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'DocIn', intTmp)
          then ItemIndex := intTmp;
      end
      else begin
        Properties.Items.AddObject(rs('frmOptions', 'WBIn'), TObject(1));
        Properties.Items.AddObject(rs('frmOptions', 'WBRetIn'), TObject(6));
        Properties.Items.AddObject(rs('fmContr', 'ContractsIn'), TObject(8));
        Properties.Items.AddObject(rs('frmOptions', 'OrdersIn'), TObject(16));

        if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'DocOut', intTmp)
          then ItemIndex := intTmp;
      end;

      if ItemIndex = -1 then ItemIndex := 0;
    end;

    btnChargeType.Hint := GetRS(ParentNameEx, 'ChargeTypeRef');
    btnCashDesks.Hint := GetRS(ParentNameEx, 'CashDesksRef');
    aPayMPersons.Hint := GetRS(ParentNameEx, 'WorkersRef');
    btnSetTime.Hint := GetRS('fmWaybill', 'EditTime');
    btnBallance.Hint := GetRS('fmWaybill', 'KABallance');
    btnKABallance2.Hint := GetRS('fmWaybill', 'KABallance');

    chbChecked.Properties.Caption := GetRS(ParentNameEx, 'CheckDoc');
    //btnRate.Hint := GetRS(ParentNameEx, 'ChangeRate');

    btnWBDocs.Hint := GetRS('fmWaybill', 'DocReestr');
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  edOnDate.Date := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.FormCreate(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  edKAgent.SetLng;
  edOnDate.Date := Date;
  edTime.Time := Time;
  dmData.i15.GetBitmap(0, edTotal.Properties.ButtonGlyph);
  btnPayMPerson.ImageIndex := 32;
  btnChargeType.ImageIndex := 149;
  btnCashDesks.ImageIndex := II_CASHDESK;
  btnFin.ImageIndex := II_FINANCES;

  cdsPayType.Open;
  cdsCurrency.Open;
  cdsCashDesks.Open;
  cdsEntAcc.Open;
  cdsPayMPersons.Open;
  lcbPayMPerson.KeyValue := -1;
  lcbPayMPerson.Text := '';
  lcbCurrency.KeyValue := BaseCurrID;
  edTotalPropertiesChange(edTotal);
  cdsChargeType.Open;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'PayType', Temp)
    then lcbPayType.KeyValue := Temp;

  if LastChargeType > 0 then lcbChargeType.KeyValue := LastChargeType;

  chbNDS.Checked := CurrEnt.NDSPayer;
  edKAgent.LoadFromRegistry(MainRegKey + '\' + Self.Name);
  panNotes.Align := alTop;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.cdsCurrencyBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.cdsCurrencyBeforeOpen') else _udebug := nil;{$ENDIF}

  if edOnDate.Text = ''
    then cdsCurrency.Params.ParamByName('ondate').AsDateTime := 0
    else cdsCurrency.Params.ParamByName('ondate').AsDateTime := Int(edOnDate.Date);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.edOnDatePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.edOnDatePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  FModified := True;
  FDateChanged := True;
  edOnDateExit(edOnDate);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.edTotalPropertiesChange(Sender: TObject);
  var
    v: extended;
    h: boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.edTotalPropertiesChange') else _udebug := nil;{$ENDIF}

  try
    v := StrToFloat(edTotal.Text);
  except
    v := 0;
  end;

  FTotalDef := RoundToA(FRate * v, -2);
  stTotalDef.Caption := FormatFloat(MoneyDisplayFormat, FTotalDef);
  stCurrencyDef.Caption := BaseCurrName;

  if edWBNum.Visible
    then RecalcDocSaldo
    else RecalcContrSaldo;

  chbNDSClick(chbNDS);
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.RecalcBallance;
  var
    wbIn, wbOut, b: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.RecalcBallance') else _udebug := nil;{$ENDIF}

  if edKAgent.KAID > 0 then begin
    with newDataSet do
    try
      Screen.Cursor := crHourGlass;
      ProviderName := 'pKA_GetSaldo';
      FetchParams;
      Params.ParamByName('kaid').AsInteger := edKAgent.KAID;
      Params.ParamByName('ondate').AsDateTime := LastSecondInDay(edOnDate.Date);
      Open;
      b := Fields[0].AsFloat;
      Close;
      if ShowBallance then begin
        if b < 0
          then stBallance.Font.Color := clRed
          else stBallance.Font.Color := clBlack;

        stBallance.Caption := FormatFloat(MoneyDisplayFormat, b);
      end
      else stBallance.Caption := rs('Common', 'NA');

    finally
      Screen.Cursor := crDefault;
      Free;
    end
  end
  else stBallance.Caption := '';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.lcbPayTypePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.lcbPayTypePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  FModified := True;
  if lcbPayType.KeyValue = 1 then begin
    nbPayType.Visible := True;
    nbPayType.PageIndex := 0;
  end
  else if lcbPayType.KeyValue = 2 then begin
    nbPayType.Visible := True;
    nbPayType.PageIndex := 1;
  end
  else nbPayType.Visible := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.edTotalPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.edTotalPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.chbNDSClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.chbNDSClick') else _udebug := nil;{$ENDIF}

  if chbNDS.Checked then begin
    stNDS.Caption := FormatFloat(MoneyDisplayFormat, FTotalDef-NDSOut(FTotalDef, NDS));
    stCurrNDS.Caption := BaseCurrName;
  end
  else begin
    stNDS.Caption := '';
    stCurrNDS.Caption := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.edOnDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.edOnDatePropertiesChange') else _udebug := nil;{$ENDIF}

  if edOnDate.Text <> edOnDate.EditText then begin
    FModified := True;
    FDateChanged := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.edOnDateExit(Sender: TObject);
  var
   OldR: Boolean;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.edOnDateExit') else _udebug := nil;{$ENDIF}

  if FDateChanged then begin
    OldR := FRateChanged;
    lcbCurrency.Properties.OnEditValueChanged := nil;
    DSRefresh(cdsCurrency, 'currid', 0);
    FRateChanged := OldR;
    lcbCurrency.KeyValue := cdsCurrency.fieldbyname('currid').AsInteger;
    lcbCurrency.Properties.OnEditValueChanged := lcbCurrencyPropertiesEditValueChanged;
    RecalcBallance;
    FLoaded := False;

    if not FRateChanged then lcbCurrencyPropertiesEditValueChanged(lcbCurrency);

    FLoaded := True;
    FDateChanged := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.edOnDateKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.edOnDateKeyPress') else _udebug := nil;{$ENDIF}

  if Key = #13 then begin
    if FDateChanged then begin
      DSRefresh(cdsCurrency, 'currid', 0);
      lcbCurrency.KeyValue := cdsCurrency.fieldbyname('currid').AsInteger;
      RecalcBallance;
      FDateChanged := False;

      if NextCtrlOnEnter then Perform(WM_NEXTDLGCTL, 0, 0);
    end
    else if NextCtrlOnEnter then Perform(WM_NEXTDLGCTL, 0, 0);

    Key := #0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.WMRecordChanged(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.WMRecordChanged') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPayDoc.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.FormDestroy') else _udebug := nil;{$ENDIF}

  edKAgent.SaveToRegistry(MainRegKey + '\' + Self.Name);
  LastPayType := lcbPayType.KeyValue;
  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'PayType', LastPayType);
  //WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'chbDoc', Integer(chbDoc.Checked));

  if GrpID > 0
    then WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'DocIn', cbDocType.ItemIndex)
    else WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'DocOut', cbDocType.ItemIndex);

  LastChargeType := lcbChargeType.KeyValue;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.aPayMPersonsExecute(Sender: TObject);
  var
    aid, fkind: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.aPayMPersonsExecute') else _udebug := nil;{$ENDIF}

  if edContr.Editor.Focused then edContr.ShowRef
  else if FCurrCtrl = lcbPayMPerson then begin
    try aid := lcbPayMPerson.KeyValue; except aid := 0; end;
    lcbPayMPerson.SetFocus;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
  end
  else if FCurrCtrl = lcbPayType then begin
    ShowFinance(Self, Date, 1);
  end
  else if FCurrCtrl = lcbChargeType then begin
    try aid := lcbChargeType.KeyValue; except aid := 0; end;
    lcbChargeType.SetFocus;
    ShowModalRef(Self, rtChargeType, vtChargeType, 'TfmChargeType', Self.OnDate, aid);
  end
  else if FCurrCtrl = lcbCashDesks then begin
    try aid := lcbCashDesks.KeyValue; except aid := 0; end;
    lcbCashDesks.SetFocus;
    ShowModalRef(Self, rtCashDesks, vtCashDesks, 'TfmCashDesks', Self.OnDate, aid);
  end
  else if edKAgent.Editor.Focused then begin
    edKAgentRefButtonClick(edKAgent);
  end
  else if edWBNum.Editor.Focused then begin
    aWBDocs.Execute;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
   rtFinances:
     if (M.WParam > 0) and (M.WParam < 1000000) then begin
       lcbPayType.KeyValue := 1;
       lcbCashDesks.KeyValue := M.WParam;
     end
     else begin
       lcbPayType.KeyValue := 2;
       lcbAccount.KeyValue := M.WParam - 1000000;
     end;

   rtKAgent:
     begin
       edKAgent.KAID := M.WParam;
     end;

   rtWBReestr:
     begin
       edWBNum.ID := M.WParam;
     end;

   rtPersons:
     begin
       DSRefresh(cdsPayMPersons, 'kaid', M.WParam);
       lcbPayMPerson.KeyValue := M.WParam;
       lcbPayMPerson.SelStart := 0;
     end;

   rtCashDesks:
     begin
       DSRefresh(cdsCashDesks, 'cashid', M.WParam);
       lcbCashDesks.KeyValue := M.WParam;
     end;

   rtChargeType:
     begin
       DSRefresh(cdsChargeType, 'ctypeid', M.WParam);
       lcbChargeType.KeyValue := M.WParam;
   //lcbPayMPerson.SelStart := 0;
     end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.cdsCurrencyAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.cdsCurrencyAfterOpen') else _udebug := nil;{$ENDIF}

  lcbCurrency.KeyValue := BaseCurrID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  edKAgent.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.btnSetTimeClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.btnSetTimeClick') else _udebug := nil;{$ENDIF}

  edTime.Time := Time;
  edOnDate.Date := Date;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.lcbCurrencyPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.lcbCurrencyPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if not FRateChanged then edRate.Value := cdsCurrency.FieldByName('onvalue').AsFloat;

  edRate.Enabled := lcbCurrency.KeyValue <> BaseCurrID;
  edTotalPropertiesChange(edTotal);
  FModified := True;

  if Self.Visible and CheckCurrency and
    (cdsCurrency.fieldbyname('ondate').AsDateTime <> Int(edOnDate.Date)) and
    (lcbCurrency.KeyValue <> BaseCurrID) and (lcbCurrency.Text <> BaseCurrName) and
    (lcbCurrency.Text <> '') and FLoaded
  then begin
    SetRate;
  end;

  FRateChanged := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  if ID = 0 then lcbCurrencyPropertiesEditValueChanged(lcbCurrency);

  if not FRealigned then begin
    RealignPanels;
    FRealigned := True;
  end
  else LoadPanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.btnBallanceClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.btnBallanceClick') else _udebug := nil;{$ENDIF}

  if not ShowBallance then begin
    AccessDenied;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if edKAgent.KAID <= 0 then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmKATurnover.Create(nil) do
    try
      ParentNameEx := 'fmKAgent';
      OnDate := edOnDate.Date;
      ID := edKAgent.KAID;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.lcbPayMPersonEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.lcbPayMPersonEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.lcbPayMPersonExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.lcbPayMPersonExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.btnChargeTypeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.btnChargeTypeMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbChargeType;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.btnChargeTypeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.btnChargeTypeMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.btnPayMPersonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.btnPayMPersonMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPayMPerson;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.btnKAgentMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.btnKAgentMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := edKAgent;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.DoHelp;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.DoHelp') else _udebug := nil;{$ENDIF}

  case GrpID of
     1: ShowHelpTopic('fmPDIn');
    -1: ShowHelpTopic('fmPDOut');
    -2: ShowHelpTopic('fmPDCharge');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.aHelpExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.aHelpExecute') else _udebug := nil;{$ENDIF}

  DoHelp;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.lcbCashDesksEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.lcbCashDesksEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbCashDesks;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.btnCashDesksMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.btnCashDesksMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbCashDesks;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.cdsEntAccCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.cdsEntAccCalcFields') else _udebug := nil;{$ENDIF}

  cdsEntAcc.FieldByName('fullname').AsString :=
    cdsEntAcc.FieldByName('accnum').AsString + ' ' + rs('fmPayDoc', 'In') + ' ' + cdsEntAcc.FieldByName('name').AsString;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.edKAgentChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.edKAgentChange') else _udebug := nil;{$ENDIF}

  RecalcBallance;

  if edWBNum.KAID <> edKAgent.KAID then begin
    edWBNum.KAID := edKAgent.KAID;
    edWBNum.ID := 0;
    //edContr.KAID := edKAgent.KAID;
    edContr.DocID := 0;
  end;

  if not edContr.Editor.Focused and not edContr.Locked then begin
    if not edKAgent.Obj.Contracts.IsEmpty and edKAgent.Obj.Contracts.Locate('doctype', Trunc(-8 * GrpID / Abs(GrpID)), [])
      then edContr.DocID := edKAgent.Obj.Contracts.FieldByName('docid').AsInteger
      else edContr.DocID := 0;
    //edContr.KAID := edKAgent.KAID;
    FCurrCtrl := nil;
  end;

  edContr.KAID := edKAgent.KAID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.cbDocTypePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.cbDocTypePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  edWBNum.WType := Integer(cbDocType.Properties.Items.Objects[cbDocType.ItemIndex]);
  edWBNum.ID := 0;
  edContr.DocID := 0;
  edContr.Visible := Abs(Integer(cbDocType.Properties.Items.Objects[cbDocType.ItemIndex])) = 8;
  edWBNum.Visible := not edContr.Visible;

  if Integer(cbDocType.Properties.Items.Objects[cbDocType.ItemIndex]) = 8
    then edContr.ContractType := ctIn
    else if Integer(cbDocType.Properties.Items.Objects[cbDocType.ItemIndex]) = -8
      then edContr.ContractType := ctOut;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.edWBNumChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.edWBNumChange') else _udebug := nil;{$ENDIF}

  if (edKAgent.KAID <> edWBNum.KAID) and (edWBNum.KAID > 0) then begin
    edKAgent.OnChange := nil;
    edKAgent.KAID := edWBNum.KAID;
    RecalcBallance;
    edKAgent.OnChange := edKAgentChange;
  end;
  RecalcDocSaldo;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.aSetPanelsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.aSetPanelsExecute') else _udebug := nil;{$ENDIF}

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
end;

//==============================================================================================
procedure TfrmEditPayDoc.WMRealignPanels(var M: TMessage);
  var
    FList: TStringList;
    i: Integer;
    FVis: Boolean;
    FPan: TPanel;
    FOffs: Integer;
    Y: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.WMRealignPanels') else _udebug := nil;{$ENDIF}

  FList := TStringList(Pointer(M.WParam));
  FOffs := 0;
  panNotes.Align := alNone;

  for i := 0 to FList.Count - 1 do begin
    FVis := FList.Strings[i] = '1';
    FPan := TPanel(FList.Objects[i]);
    if FPan.Visible <> FVis then begin
      if FVis
        then FOffs := FOffs + FPan.Height
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
end;

//==============================================================================================
procedure TfrmEditPayDoc.SavePanVisibility;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.SavePanVisibility') else _udebug := nil;{$ENDIF}

  FPanDocVis := panDoc.Visible;
  FPanNotesVis := panNotes.Visible;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.LoadPanVisibility;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.LoadPanVisibility') else _udebug := nil;{$ENDIF}

  panDoc.Visible := FPanDocVis;
  panNotes.Visible := FPanNotesVis;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.RealignPanels;
  var
    FOffs: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.RealignPanels') else _udebug := nil;{$ENDIF}

  FOffs := 0;
  if not panDoc.Visible then FOffs := FOffs - panDoc.Height;
  if not panNotes.Visible then FOffs := FOffs - panNotes.Height;
  panNotes.Align := alClient;
  if not panNotes.Visible then FOffs := FOffs + 7;
  if FOffs <> 0 then Self.Height := Self.Height + FOffs;
  SavePanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.chbDocClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.chbDocClick') else _udebug := nil;{$ENDIF}

  edWBNum.Enabled := chbDoc.Checked;
  edContr.Enabled := chbDoc.Checked;
  lDocDate.Enabled := chbDoc.Checked;
  lDocType.Enabled := chbDoc.Checked;
  cbDocType.Enabled := chbDoc.Checked;
  lDocSum.Enabled := chbDoc.Checked;
  lDocPaid.Enabled := chbDoc.Checked;
  lDocSaldo.Enabled := chbDoc.Checked;
  btnWBDocs.Enabled := chbDoc.Checked;

  if chbDoc.Checked then begin
    txtDocDate.Font.Color := clWindowText;
    txtDocSaldo.Font.Color := clMaroon;
    txtDocSumm.Font.Color := clMaroon;
    txtDocPaid.Font.Color := clMaroon;
  end
  else begin
    txtDocDate.Font.Color := clBtnShadow;
    txtDocSaldo.Font.Color := clBtnShadow;
    txtDocSumm.Font.Color := clBtnShadow;
    txtDocPaid.Font.Color := clBtnShadow;
  end;

  RecalcDocSaldo;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.aWBDocsExecute(Sender: TObject);
  var
    FInfo: TGrpInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.aWBDocsExecute') else _udebug := nil;{$ENDIF}

  FInfo.ID := Integer(cbDocType.Properties.Items.Objects[cbDocType.ItemIndex]);
  FInfo.PID := edKAgent.KAID;
  ShowModalRef(Self, rtWBReestr, vtWBReestr, 'fmWaybill', edOnDate.Date, edWBNum.ID, Integer(@FInfo));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.RecalcDocSaldo;
 var
  FPaid, FPaySumm: Extended;
  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.RecalcDocSaldo') else _udebug := nil;{$ENDIF}

  FPaySumm := FTotalDef;
  FPaid := RoundToA(edWBNum.PaidSumm + FPaySumm, -2);
  FSaldo := RoundToA(edWBNum.DocSumm - FPaid, -2);
  if chbDoc.Checked then begin
    if FSaldo < 0 then txtDocSaldo.Font.Color := clRed
    else if FSaldo = 0
      then txtDocSaldo.Font.Color := clBlack
      else txtDocSaldo.Font.Color := clMaroon;
  end;

  if edWBNum.ID > 0 then begin
    txtDocDate.Caption := DateToStr(edWBNum.DocDate);
    txtDocSumm.Caption := FormatFloat(MoneyDisplayFormat, edWBNum.DocSumm) + ' ' + BaseCurrName;
    txtDocSaldo.Caption := FormatFloat(MoneyDisplayFormat, FSaldo) + ' ' + BaseCurrName;
    txtDocPaid.Caption := FormatFloat(MoneyDisplayFormat, FPaid) + ' ' + BaseCurrName;
  end
  else begin
    txtDocDate.Caption := '';
    txtDocSumm.Caption := '';
    txtDocSaldo.Caption := '';
    txtDocPaid.Caption := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.edKAgentRefButtonClick(Sender: TObject);
 var
  AID: Integer;
  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.edKAgentRefButtonClick') else _udebug := nil;{$ENDIF}

  try AID := edKAgent.KAID; except AID := 0; end;
  edKAgent.Editor.SetFocus;
  ShowModalRef(Self, rtKAgent, vtKAgent, 'TfmKAgent', Self.OnDate, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.SetWBillID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.SetWBillID') else _udebug := nil;{$ENDIF}

  FWBillID := Value;

  chbDoc.Checked := True;
  chbDoc.Enabled := False;
  cbDocType.ItemIndex := cbDocType.Properties.Items.IndexOfObject(TObject(WType));
  cbDocType.Enabled := False;
  lDocType.Enabled := False;
  edWBNum.ID := Value;
  edWBNum.Enabled := False;
  edKAgent.Enabled := False;
  aWBDocs.Enabled := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.btnCashDesksMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.btnCashDesksMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.cdsCashDesksAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.cdsCashDesksAfterOpen') else _udebug := nil;{$ENDIF}

  DataSet.Locate('def', 1, []);
  lcbCashDesks.KeyValue := DataSet.FieldByName('cashid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.aFinanceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.aFinanceExecute') else _udebug := nil;{$ENDIF}

  ShowFinance(Self, Date);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.lcbPayTypeEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.lcbPayTypeEnter') else _udebug := nil;{$ENDIF}


  FCurrCtrl := lcbPayType;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.lcbPayTypeExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.lcbPayTypeExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.btnFinMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.btnFinMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPayType;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.btnFinMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.btnFinMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.edContrChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.edContrChange') else _udebug := nil;{$ENDIF}


  if (edKAgent.KAID <> edContr.Obj.KAID) and (edContr.Obj.KAID > 0) then begin
    edKAgent.OnChange := nil;
    edKAgent.KAID := edContr.Obj.KAID;
    RecalcBallance;
    edKAgent.OnChange := edKAgentChange;
  end;

  if edContr.DocID > 0 then begin
    lcbCurrency.KeyValue := edContr.Obj.CurrID;
  end;

  lcbCurrency.Enabled := edContr.DocID = 0;
  RecalcContrSaldo;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.NoAccess(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.NoAccess') else _udebug := nil;{$ENDIF}

  showNotAvailable;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.RecalcContrSaldo;
  var
    FPaid, FPaySumm: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.RecalcContrSaldo') else _udebug := nil;{$ENDIF}

  try
    FPaySumm := StrToFloat(edTotal.EditingText);
  except
    FPaySumm := 0;
  end;

  FPaid := RoundToA(edContr.Obj.PaidSumm + FPaySumm, -2);
  FSaldo := RoundToA(edContr.Obj.Summ - FPaid, -2);

  if chbDoc.Checked then begin
    if FSaldo < 0
      then txtDocSaldo.Font.Color := clRed
      else if FSaldo = 0
        then txtDocSaldo.Font.Color := clBlack
        else txtDocSaldo.Font.Color := clMaroon;
  end;

  if edContr.DocID > 0 then begin
    txtDocDate.Caption := DateToStr(edContr.Obj.DocDate);
    txtDocSumm.Caption := FormatFloat(MoneyDisplayFormat, edContr.Obj.Summ) + ' ' + edContr.Obj.CurrName;
    txtDocSaldo.Caption := FormatFloat(MoneyDisplayFormat, FSaldo) + ' ' + edContr.Obj.CurrName;
    txtDocPaid.Caption := FormatFloat(MoneyDisplayFormat, FPaid) + ' ' + edContr.Obj.CurrName;
  end
  else begin
    txtDocDate.Caption := '';
    txtDocSumm.Caption := '';
    txtDocSaldo.Caption := '';
    txtDocPaid.Caption := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.edRatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.edRatePropertiesChange') else _udebug := nil;{$ENDIF}

  try
    FRate := StrToFloat(edRate.EditingText);
  except
    FRate := 1;
  end;

  FRateChanged := True;
  edTotalPropertiesChange(edTotal);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayDoc.SetRate;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayDoc.SetRate') else _udebug := nil;{$ENDIF}

   with TfrmCurrencyEdit.Create(nil) do
     try
       MainHandle := Self.Handle;
       ParentNameEx := 'fmCurrency';
       OnDate := Int(Self.edOnDate.Date);
       cdsCurrency.Locate('currid', lcbCurrency.KeyValue, []);
       ID := Self.cdsCurrency.fieldbyname('currid').AsInteger;

       if Self.cdsCurrency.FieldByName('ondate').AsDateTime = Int(Self.edOnDate.Date)
         then SubID := Self.cdsCurrency.fieldbyname('rateid').AsInteger;

       SetFocusToRate := True;
       SetInactive;

       if ShowModal=mrOk then begin
         FLoaded := False;
         DSRefresh(cdsCurrency, 'currid', 0);
         lcbCurrency.KeyValue := cdsCurrency.fieldbyname('currid').AsInteger;
         FLoaded := True;
       end;

      finally
        Free;
      end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditPayDoc', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
