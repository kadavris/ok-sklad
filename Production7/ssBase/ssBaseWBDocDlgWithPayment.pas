{$I ok_sklad.inc}
unit ssBaseWBDocDlgWithPayment;

interface

uses
  ssPageControl, okSearchEdit, ssBaseWBDocDlg,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBClient, ssClientDataSet, DB, dxmdaset,
  ActnList, ssFormStorage, ImgList, xButton, ssPanel, ssGradientPanel,
  dxDBGrid6, dxTL6, dxDBCtrl6, dxDBTLCl6, dxGrClms6, dxCntner6, ssDBGrid,
  ssBevel, StdCtrls, cxControls, cxGroupBox, ssGroupBox, ssSpeedButton,
  ExtCtrls, cxDropDownEdit, ssDBLookupCombo, cxMaskEdit, cxCalc,
  ssCalcEdit, cxTextEdit, cxContainer, cxEdit, cxCheckBox, ssLabel,
  ComCtrls, cxPC, cxSpinEdit, cxTimeEdit,
  cxCalendar;

type
  TfrmBaseWBDocDlgWithPayment = class(TfrmBaseWBDocDlg)
    btnCashDesks: TssSpeedButton;
    btnFinPay: TssSpeedButton;
    btnPayMPerson: TssSpeedButton;
    cbPayCurr: TssDBLookupCombo;
    cdsPayMPersons: TssClientDataSet;
    cdsPayType: TssClientDataSet;
    chbPay: TcxCheckBox;
    edPayNum: TokPayDocSearchEdit;
    edPaySumm: TssCalcEdit;
    gbPayment: TssGroupBox;
    lAcc: TssLabel;
    lCashDesks: TssLabel;
    lcbAccount: TssDBLookupCombo;
    lcbCashDesks: TssDBLookupCombo;
    lcbPayMPerson: TssDBLookupCombo;
    lcbPayType: TssDBLookupCombo;
    lPayCurr: TssLabel;
    lPayMPerson: TssLabel;
    lPaySumm: TssLabel;
    lPayType: TssLabel;
    pcPayType: TssPageControl;
    srcPayMPersons: TDataSource;
    srcPayType: TDataSource;
    tsCash: TcxTabSheet;
    tsCashless: TcxTabSheet;

    procedure btnCashDesksMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCashDesksMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFinPayMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFinPayMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPayMPersonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cbCurrPropertiesChange(Sender: TObject);
    procedure cbCurrPropertiesEditValueChanged(Sender: TObject);
    procedure cbPayCurrKeyPress(Sender: TObject; var Key: Char);
    procedure cbPayCurrPropertiesChange(Sender: TObject);
    procedure cdsCashDesksAfterOpen(DataSet: TDataSet);
    procedure cdsEntAccCalcFields(DataSet: TDataSet);
    procedure chbPayClick(Sender: TObject);
    procedure chbPayKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chbPayKeyPress(Sender: TObject; var Key: Char);
    procedure edDatePropertiesChange(Sender: TObject);
    procedure edPayNumChange(Sender: TObject);
    procedure edPayNumEditorChange(Sender: TObject);
    procedure edRatePropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcbCashDesksEnter(Sender: TObject);
    procedure lcbCashDesksExit(Sender: TObject);
    procedure lcbPayMPersonPropertiesEditValueChanged(Sender: TObject);
    procedure lcbPayTypeEnter(Sender: TObject);
    procedure lcbPayTypeExit(Sender: TObject);
    procedure lcbPayTypePropertiesEditValueChanged(Sender: TObject);
    procedure lcbPayTypePropertiesInitPopup(Sender: TObject);
    procedure PayDocModified(Sender: TObject);

  protected
    FPayDocModified: Boolean;
    OldPayCurrID: Integer;
    FPayNum: string;
    FCurrCtrl: TControl;

    function CheckByContr(edContr:TokContractSearchEdit;ACurrid:Integer;ADocDate:TDateTime): boolean;
    procedure SelectPay(AState: Boolean);

  public
    procedure SetCaptions; override;

  end;

var
  frmBaseWBDocDlgWithPayment: TfrmBaseWBDocDlgWithPayment;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ssBaseConst, prConst, prFun, ClientData, ssFun,fMessageDlg, okClasses, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.chbPayClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.chbPayClick') else _udebug := nil;{$ENDIF}

  edPayNum.Enabled := chbPay.Checked;
  SelectPay(chbPay.Checked);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.lcbPayTypePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.lcbPayTypePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  case lcbPayType.KeyValue of
    1: begin
         pcPayType.Visible := True;
         pcPayType.ActivePageIndex := 0;
       end;

    2: begin
         pcPayType.Visible := True;
         pcPayType.ActivePageIndex := 1
       end;

    else pcPayType.Visible := False;
  end;
  FPayDocModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.lcbPayTypePropertiesInitPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.lcbPayTypePropertiesInitPopup') else _udebug := nil;{$ENDIF}

  lcbPayType.Properties.DropDownWidth := lcbPayType.Width - 2;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.chbPayKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.chbPayKeyDown') else _udebug := nil;{$ENDIF}

  if (ssCtrl in Shift) and (Key in [VK_DOWN, VK_UP]) then begin
    if not chbPay.Checked then begin
      Key := 0;
      if aOK.Enabled then btnOK.SetFocus
        else btnCancel.SetFocus;
    end
    else GoNextKeyDown(Sender, Key, Shift);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.chbPayKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.chbPayKeyPress') else _udebug := nil;{$ENDIF}

  if NextCtrlOnEnter and (Key = #13) and not chbPay.Checked then begin
    Key := #0;
    if aOK.Enabled
      then btnOK.SetFocus
      else btnCancel.SetFocus;
  end
  else GoNext(Sender, Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.PayDocModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.PayDocModified') else _udebug := nil;{$ENDIF}

  FPayDocModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.lcbCashDesksEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.lcbCashDesksEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.lcbCashDesksExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.lcbCashDesksExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.lcbPayMPersonPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.lcbPayMPersonPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  with Sender as TcxComboBox do begin
    SelStart := 0;
    SelLength := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.btnCashDesksMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.btnCashDesksMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbCashDesks;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.btnCashDesksMouseUp(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.btnCashDesksMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.btnPayMPersonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.btnPayMPersonMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPayMPerson;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    btnCashDesks.Hint := GetRS('fmPayDoc', 'CashDesksRef');
    //lPayNum.Caption := GetRS('fmWaybill', 'PayNum') + ':';
    lPayMPerson.Caption := GetRS('fmWaybill', 'MPerson') + ':';
    lPayCurr.Caption := GetRS('fmWaybill', 'Curr') + ':';
    lPaySumm.Caption := GetRS('fmWaybill', 'Summ') + ':';
    lPayType.Caption := GetRS('fmWaybill', 'PayType') + ':';
    chbPay.Properties.Caption := GetRS('fmWaybill', 'ExecPayment');
    btnPayMPerson.Hint := GetRS('fmWaybill', 'aPersons');
    lCashDesks.Caption := GetRS('fmPayDoc', 'CashDesk') + ':';
    lAcc.Caption := GetRS('fmPayDoc', 'Account') + ':';
    btnFinPay.Hint := GetRS('fmFinance', 'Finance');

    edPayNum.InitRes;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.cbPayCurrKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.cbPayCurrKeyPress') else _udebug := nil;{$ENDIF}

  if NextCtrlOnEnter and (Key = #13) then begin
    Key := #0;
    if aOK.Enabled
      then btnOK.SetFocus
      else btnCancel.SetFocus;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  btnPayMPerson.ImageIndex := 32;
  btnCashDesks.ImageIndex := 42;
  btnFinPay.ImageIndex := 44;

  cdsCashDesks.Open;
  cdsEntAcc.Open;

  OldPayCurrID := cbPayCurr.KeyValue;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.cdsEntAccCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.cdsEntAccCalcFields') else _udebug := nil;{$ENDIF}

  cdsEntAcc.FieldByName('fullname').AsString :=
    cdsEntAcc.FieldByName('accnum').AsString + ' ' + LangMan.GetRS('fmPayDoc', 'In') + ' ' + cdsEntAcc.FieldByName('name').AsString;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.cdsCashDesksAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.cdsCashDesksAfterOpen') else _udebug := nil;{$ENDIF}

  DataSet.Locate('def', 1, []);
  lcbCashDesks.KeyValue := DataSet.FieldByName('cashid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.lcbPayTypeEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.lcbPayTypeEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPayType;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.lcbPayTypeExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.lcbPayTypeExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.btnFinPayMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.btnFinPayMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPayType;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.btnFinPayMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.btnFinPayMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.cbPayCurrPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.cbPayCurrPropertiesChange') else _udebug := nil;{$ENDIF}

  edPaySumm.Value := RoundToA(CurrToCurr(dmData.SConnection, OldPayCurrID,
                     cbPayCurr.KeyValue, Self.OnDate, cbCurr.KeyValue, edRate.Value) * edPaySumm.Value, -2);

  OldPayCurrID := cbPayCurr.KeyValue;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmBaseWBDocDlgWithPayment.CheckByContr(edContr:TokContractSearchEdit;ACurrid:Integer;ADocDate:TDateTime): boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.CheckByContr') else _udebug := nil;{$ENDIF}

  Result := False;
  FGridRefresh := true;

  //check ondate
  if (edContr.Obj.DocDate > ADocDate) or ((edContr.Obj.ToDate > 0) and (ADocDate > edContr.Obj.ToDate)) then begin
    ssMessageDlg(Format(LangMan.GetRS('fmContr','CheckErr7'), [edContr.Obj.Num, DateToStr(edContr.Obj.DocDate), DateToStr(edContr.Obj.ToDate)]), ssmtError, [ssmbOk]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end
  else if ACurrID <> edContr.Obj.CurrID then begin //check todate
    ssMessageDlg(Format(LangMan.GetRS('fmContr','CheckErr7'),[edContr.Obj.Num, DateToStr(edContr.Obj.DocDate), DateToStr(edContr.Obj.ToDate)]),ssmtError, [ssmbOk]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end
  else with mdDet do begin//check detail
    First;

    while not Eof do begin
      //matid exists?
      if edContr.Obj.Detail.Locate('matid',FieldByName('matid').AsInteger,[])
      then begin
        //price is correct?
        if edContr.Obj.Detail.FieldByName('price').IsNull
           or (edContr.Obj.Detail.FieldByName('price').AsFloat = FieldByName('price').AsFloat)
        then begin
          //amount is correct?
          if edContr.Obj.Detail.FieldByName('amount').IsNull
             or (edContr.Obj.Detail.FieldByName('remain').AsFloat >= FieldbyName('amount').AsFloat)
          then Result := True
          else begin
            ssMessageDlg(Format(LangMan.GetRS('fmContr','CheckErr3'), [inttostr(RecNo) + '.' + FieldByName('matname').AsString, edContr.Obj.Num]),ssmtError, [ssmbOk]);
            Result := False;
            Break;
          end;
        end
        else begin
          ssMessageDlg(Format(LangMan.GetRS('fmContr','CheckErr2'), [inttostr(RecNo) + '.' + FieldByName('matname').AsString, edContr.Obj.Num]),ssmtError, [ssmbOk]);
          Result := False;
          Break;
        end;
      end
      else begin
        GetSummAll;
        ssMessageDlg(Format(LangMan.GetRS('fmContr','CheckErr1'),[edContr.Obj.Num,inttostr(RecNo)+'.'+FieldByName('matname').AsString]),ssmtError, [ssmbOk]);
        Result := False;
        Break;
      end;

      Next;
    end;//while
  end;//with

  if Result then begin
    if AllSummCurr > edContr.Obj.RestSumm then begin
      ssMessageDlg(Format(LangMan.GetRS('fmContr','CheckErr4'),[edContr.Obj.Num]),ssmtError, [ssmbOk]);
      Result := False;
    end
    else begin
      if GetDSSumm(mdDet,'amount')>edContr.Obj.RestAmount then begin
        ssMessageDlg(Format(LangMan.GetRS('fmContr','CheckErr5'),[edContr.Obj.Num]),ssmtError, [ssmbOk]);
        Result := False;
      end;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.edPayNumEditorChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.edPayNumEditorChange') else _udebug := nil;{$ENDIF}

  FPayDocModified := True;
  if chbPay.Checked then FPayNum := edPayNum.Editor.EditingText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  edPayNum.AdjustCtrls;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.SelectPay(AState: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.SelectPay') else _udebug := nil;{$ENDIF}

  lcbPayType.Enabled := AState;
  edPaySumm.Enabled := AState;
  cbPayCurr.Enabled := AState;
  lPayType.Enabled := AState;
  lPaySumm.Enabled := AState;
  lPayCurr.Enabled := AState;
  lPayMPerson.Enabled := AState;
  lcbPayMPerson.Enabled := AState;
  btnPayMPerson.Enabled := AState;
  lCashDesks.Enabled := AState;
  lAcc.Enabled := AState;
  lcbAccount.Enabled := AState;
  lcbCashDesks.Enabled := AState;
  btnCashDesks.Enabled := AState;
  btnFinPay.Enabled := AState;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.edPayNumChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.edPayNumChange') else _udebug := nil;{$ENDIF}

  if edPayNum.PayDocID > 0 then begin
    with edPayNum.Obj do begin
      lcbPayType.KeyValue := PTypeID;

      if MPersonID > 0
        then lcbPayMPerson.KeyValue := MPersonID
        else lcbPayMPerson.Clear;

      cbPayCurr.KeyValue := CurrID;
      edPaySumm.Value := SummAll;

      if AccID > 0
        then lcbAccount.KeyValue := AccID
        else begin
          lcbAccount.KeyValue := 0;
          lcbAccount.Clear;
        end;

      if CashID > 0
        then lcbCashDesks.KeyValue := CashID;
    end;
  end
  else begin
    //lcbAccount.Clear;
    //lcbCashDesks.Clear;
    edPaySumm.Value := 0;
    lcbPayMPerson.KeyValue := 0;
    lcbPayMPerson.Clear;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.cbCurrPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.cbCurrPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.edRatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.edRatePropertiesChange') else _udebug := nil;{$ENDIF}

  inherited;

  FPayDocModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.cbCurrPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.cbCurrPropertiesChange') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlgWithPayment.edDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlgWithPayment.edDatePropertiesChange') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ssBaseWBDocDlgWithPayment', @Debugging, DEBUG_group_ID);

//==============================================================================================
finalization
  //debugUnregisterUnit(DEBUG_unit_ID);

end.
