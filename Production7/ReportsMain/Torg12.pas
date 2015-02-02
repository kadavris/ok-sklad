{$I ok_sklad.inc}
unit Torg12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ssBevel,
  ExtCtrls, ssBaseSkinForm, ImgList, ssSpeedButton, ssPanel, ssBaseConst,
  ssGradientPanel, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ssDBLookupCombo, DB, DBClient, dxmdaset,
  ssClientDataSet, cxMemo, FR_Class, cxSpinEdit, FR_DSet, FR_DBSet,
  cxCheckBox, FR_E_TXT, FR_E_RTF, xButton, ssFormStorage, cxCalc,
  ssCalcEdit, cxLabel, ssLabel, xCtrls, okClasses, xLngDefs, okMoneyFun;

type
  TfrmTorg12 = class(TfrmBaseSkin)
    panButtons: TPanel;
    ActionList: TActionList;
    aCancel: TAction;
    aSave: TAction;
    aPreview: TAction;
    frDoc: TfrReport;
    bvlFooterSep: TssBevel;
    lCount: TLabel;
    edDocCount: TcxSpinEdit;
    lEntMFO: TLabel;
    chbDefault: TcxCheckBox;
    btnSave: TxButton;
    btnCancel: TxButton;
    xButton1: TxButton;
    aDel: TAction;
    panMain: TPanel;
    sbMain: TScrollBox;
    ssBevel38: TssBevel;
    ssBevel39: TssBevel;
    ssBevel28: TssBevel;
    ssBevel40: TssBevel;
    Panel1: TPanel;
    ssBevel1: TssBevel;
    Label20: TLabel;
    Label21: TLabel;
    ssBevel4: TssBevel;
    ssBevel5: TssBevel;
    Label24: TLabel;
    Label25: TLabel;
    Label1: TLabel;
    txtShipEntOKPO: TssBevel;
    Label2: TLabel;
    ssBevel2: TssBevel;
    ssBevel3: TssBevel;
    Label4: TLabel;
    Label5: TLabel;
    ssBevel7: TssBevel;
    txtShipEnt: TssBevel;
    Label6: TLabel;
    ssBevel9: TssBevel;
    Label7: TLabel;
    txtEnt: TssBevel;
    ssBevel41: TssBevel;
    ssBevel42: TssBevel;
    txtEntOKPOx: TssBevel;
    Label8: TLabel;
    Label9: TLabel;
    ssBevel45: TssBevel;
    Label10: TLabel;
    ssBevel46: TssBevel;
    Label11: TLabel;
    txtReason: TssBevel;
    ssBevel47: TssBevel;
    ssBevel48: TssBevel;
    Label13: TLabel;
    Label14: TLabel;
    ssBevel49: TssBevel;
    Label15: TLabel;
    ssBevel50: TssBevel;
    ssBevel51: TssBevel;
    Label16: TLabel;
    ssBevel52: TssBevel;
    Label17: TLabel;
    ssBevel53: TssBevel;
    ssBevel54: TssBevel;
    ssBevel55: TssBevel;
    ssBevel59: TssBevel;
    ssBevel60: TssBevel;
    ssBevel61: TssBevel;
    ssBevel62: TssBevel;
    Label18: TLabel;
    edOKUD: TcxTextEdit;
    edOKDP: TcxTextEdit;
    Panel2: TPanel;
    Label28: TLabel;
    ssBevel10: TssBevel;
    ssBevel11: TssBevel;
    ssBevel12: TssBevel;
    ssBevel13: TssBevel;
    ssBevel56: TssBevel;
    ssBevel57: TssBevel;
    ssBevel58: TssBevel;
    edNum: TcxTextEdit;
    edDocDate: TcxDateEdit;
    Panel3: TPanel;
    ssBevel16: TssBevel;
    ssBevel17: TssBevel;
    ssBevel20: TssBevel;
    ssBevel22: TssBevel;
    ssBevel24: TssBevel;
    ssBevel25: TssBevel;
    ssBevel33: TssBevel;
    lNDS: TLabel;
    lNDSEx: TLabel;
    ssBevel14: TssBevel;
    ssBevel15: TssBevel;
    ssBevel19: TssBevel;
    ssBevel21: TssBevel;
    ssBevel23: TssBevel;
    ssBevel18: TssBevel;
    ssBevel26: TssBevel;
    ssBevel27: TssBevel;
    ssBevel29: TssBevel;
    ssBevel30: TssBevel;
    ssBevel63: TssBevel;
    ssBevel64: TssBevel;
    ssBevel65: TssBevel;
    ssBevel66: TssBevel;
    ssBevel67: TssBevel;
    ssBevel68: TssBevel;
    ssBevel69: TssBevel;
    ssBevel70: TssBevel;
    ssBevel71: TssBevel;
    ssBevel72: TssBevel;
    ssBevel73: TssBevel;
    ssBevel74: TssBevel;
    ssBevel75: TssBevel;
    ssBevel76: TssBevel;
    ssBevel77: TssBevel;
    ssBevel78: TssBevel;
    ssBevel79: TssBevel;
    ssBevel80: TssBevel;
    ssBevel81: TssBevel;
    Label19: TLabel;
    ssBevel82: TssBevel;
    ssBevel83: TssBevel;
    ssBevel84: TssBevel;
    ssBevel85: TssBevel;
    ssBevel86: TssBevel;
    ssBevel87: TssBevel;
    ssBevel88: TssBevel;
    ssBevel89: TssBevel;
    Label22: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    edAppx: TcxTextEdit;
    ssBevel31: TssBevel;
    FormStorage: TssFormStorage;
    Panel4: TPanel;
    panLeft: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    ssBevel96: TssBevel;
    Label32: TLabel;
    ssBevel34: TssBevel;
    lSumStr: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    ssBevel36: TssBevel;
    Label35: TLabel;
    ssBevel37: TssBevel;
    ssBevel97: TssBevel;
    ssBevel98: TssBevel;
    ssBevel99: TssBevel;
    Label37: TLabel;
    ssBevel100: TssBevel;
    ssBevel101: TssBevel;
    ssBevel102: TssBevel;
    ssBevel104: TssBevel;
    Label39: TLabel;
    lD1: TLabel;
    edPlaceCount: TcxTextEdit;
    edAppx2: TcxTextEdit;
    lcbShipper: TssDBLookupCombo;
    panRight: TPanel;
    ssBevel90: TssBevel;
    ssBevel94: TssBevel;
    ssBevel35: TssBevel;
    Label42: TLabel;
    txtAttNum: TssBevel;
    Label43: TLabel;
    txtAttDate: TLabel;
    Label46: TLabel;
    ssBevel107: TssBevel;
    Label47: TLabel;
    ssBevel108: TssBevel;
    ssBevel109: TssBevel;
    ssBevel110: TssBevel;
    Label48: TLabel;
    ssBevel111: TssBevel;
    ssBevel112: TssBevel;
    ssBevel113: TssBevel;
    Label49: TLabel;
    lD2: TLabel;
    edNetto: TcxTextEdit;
    edBrutto: TcxTextEdit;
    edAtt: TcxTextEdit;
    ssBevel115: TssBevel;
    ssBevel116: TssBevel;
    ssBevel117: TssBevel;
    ssBevel118: TssBevel;
    ssBevel119: TssBevel;
    edAppxCalc: TssCalcEdit;
    edPlaceCountCalc: TssCalcEdit;
    edAppx2Calc: TssCalcEdit;
    edNettoCalc: TssCalcEdit;
    edBruttoCalc: TssCalcEdit;
    txtEntOKPO: TssBevel;
    txtShipKAOKPO: TssBevel;
    txtKAOKPO: TssBevel;
    fsrcMaster: TfrDBDataSet;
    mdReport: TdxMemData;
    Label3: TLabel;
    lDirector: TLabel;
    lShipper: TLabel;
    srcPersons: TDataSource;
    cdsPersons: TssClientDataSet;
    txtShipEx: TxLabelEx;
    kaShip: TokKAgent;
    txtKAEx: TxLabelEx;
    kaKA: TokKAgent;
    kaEnt: TokKAgent;
    txtDir: TssBevel;
    txtBuh: TssBevel;

    procedure aCancelExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aPreviewExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure frDocBeginBand(Band: TfrBand);
    procedure edOnDatePropertiesChange(Sender: TObject);
    procedure edDocCountPropertiesChange(Sender: TObject);
    procedure GoNext(Sender: TObject; var Key: Char);
    procedure aDelExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure edNettoCalcPropertiesChange(Sender: TObject);
    procedure edBruttoCalcPropertiesChange(Sender: TObject);
    procedure edPlaceCountCalcPropertiesChange(Sender: TObject);
    procedure edAppxCalcPropertiesChange(Sender: TObject);
    procedure edAppx2CalcPropertiesChange(Sender: TObject);
    procedure txtShipMouseEnter(Sender: TObject);
    procedure txtShipMouseLeave(Sender: TObject);
    procedure txtShipEntClick(Sender: TObject);
    procedure DataModified(Sender: TObject);
    procedure lcbDirectorPropertiesEditValueChanged(Sender: TObject);
    procedure lcbShipperPropertiesEditValueChanged(Sender: TObject);
    procedure cdsPersonsAfterOpen(DataSet: TDataSet);
    procedure kaShipChange(Sender: TObject);
    procedure txtShipExItemClick(Sender: TObject; Index: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure kaKAChange(Sender: TObject);
    procedure txtKAExItemClick(Sender: TObject; Index: Integer);
    procedure kaShipAddrChange(Sender: TObject);
    procedure kaShipAccountChange(Sender: TObject);
    procedure kaKAAccountChange(Sender: TObject);
    procedure kaKAAddrChange(Sender: TObject);

  private
    FCurrCtrl: TControl;
    FID: integer;
    KAID: integer;
    FModified: boolean;
    FNDS: extended;
    DocExists: Boolean;
    FK: Extended;
    FShipKAID, FShipEntID: Integer;
    FOnDate: TDateTime;
    FOldHintPause: Integer;
    procedure SetID(const Value: integer);
    procedure SetCaptions;
    function GetKA(const KAID: Integer; const WithINN: Boolean; FKA: TokKAgent; AList: TStrings): string;
    function GetEntAddr: string;
    procedure SetOnDate(const Value: TDateTime);
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  public
    ParentHandle: HWND;
    property ID: Integer read FID write SetID;
    property OnDate: TDateTime read FOnDate write SetOnDate;
  end;

var
  frmTorg12: TfrmTorg12;

implementation

uses ClientData, ssFun, prConst, Math, prFun, ssDateUtils, ssStrUtil, prTypes, Udebug;

  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmTorg12.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.aCancelExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.aSaveExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.aSaveExecute') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    TrStart;

    try
      Screen.Cursor := crSQLWait;
      RemoteServer := dmData.SConnection;
      ProviderName := 'pWBTorg12_Del';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FID;
      Execute;

      ProviderName := 'pWBTorg12_Ins';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FID;
      Params.ParamByName('docnum').AsString := edNum.Text;
      Params.ParamByName('okud').AsString := edOKUD.Text;
      Params.ParamByName('docdate').AsDateTime := edDocDate.Date;
      Params.ParamByName('okdp').AsString := edOKDP.Text;
      Params.ParamByName('appx').AsString := edAppx.Text;
      Params.ParamByName('appx2').AsString := edAppx2.Text;
      Params.ParamByName('netto').AsString := edNetto.Text;
      Params.ParamByName('brutto').AsString := edBrutto.Text;
      Params.ParamByName('att').AsString := edAtt.Text;
      Params.ParamByName('placecount').AsString := edPlaceCount.Text;
      Params.ParamByName('shipkaid').AsInteger := FShipKAID;
      Params.ParamByName('shipentid').AsInteger := FShipEntID;

      if lcbShipper.Text = '' then begin
        Params.ParamByName('shipid').DataType := ftInteger;
        Params.ParamByName('shipid').Clear;
      end
      else Params.ParamByName('shipid').AsInteger := lcbShipper.KeyValue;
  //    if lcbDirector.Text = '' then begin
        Params.ParamByName('dirid').DataType := ftInteger;
        Params.ParamByName('dirid').Clear;
  //    end
  //    else Params.ParamByName('dirid').AsInteger := lcbDirector.KeyValue;
  //    if lcbBuh.Text = '' then begin
        Params.ParamByName('buhid').DataType := ftInteger;
        Params.ParamByName('buhid').Clear;
  //    end
    //  else Params.ParamByName('buhid').AsInteger := lcbBuh.KeyValue;

      Params.ParamByName('shipkaaddrid').AsInteger := kaShip.AddrID;
      Params.ParamByName('shipkaaccid').AsInteger := kaShip.AccID;
      Params.ParamByName('kaaddrid').AsInteger := kaKA.AddrID;
      Params.ParamByName('kaaccid').AsInteger := kaKA.AccID;

      Execute;

      if chbDefault.Checked then begin
        ProviderName := 'pWBTorg12Params_Del';
        Params.Clear;
        Execute;

        ProviderName := 'pWBTorg12Params_Ins';
        FetchParams;
        Params.ParamByName('okud').AsString := edOKUD.Text;
        Params.ParamByName('okdp').AsString := edOKDP.Text;
        Params.ParamByName('doccount').AsInteger := edDocCount.Value;
        Execute;
      end;

      TrCommit;
      FModified := False;
      ModalResult := mrOk;

    except
      TrRollback;
      raise;
    end;

  finally
    Screen.Cursor := crDefault;
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.aPreviewExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.aPreviewExecute') else _udebug := nil;{$ENDIF}

  mdReport.First;
  frDoc.ShowReport;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.SetID(const Value: integer);
 var
   s: extended;
   FAccID: Integer;
   ss, se: string;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmTorg12.SetID') else _udebug := nil;{$ENDIF}

  FID := Value;

  with newDataSet do
  try
    ProviderName := 'pWBTorg12Params_Get';
    Open;
    if not IsEmpty then begin
      edOKUD.Text := FieldByName('okud').AsString;
      edOKDP.Text := FieldByName('okdp').AsString;
      edDocCount.Value := Fieldbyname('doccount').AsInteger;
    end;
    Close;
    if edDocCount.Value = 0 then edDocCount.Value := 1;

    ProviderName := 'pDocsRel_WB_WB_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := FID;
    Params.ParamByName('doctype').AsInteger := 2;
    Open;
    if not IsEmpty
      then FAccID := FieldByName('wbillid').AsInteger
      else FAccID := 0;
    Close;

    if FAccID > 0 then begin
      ProviderName := 'pWaybill_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FAccID;
      Open;
      FAccID := FieldByName('defnum').AsInteger;
      Close;
    end;

    ProviderName := 'pWaybill_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := Value;
    Open;
    edNum.Text := FieldByName('num').AsString;
    edDocDate.Date := FieldByName('ondate').AsDateTime;
    FShipKAID := FieldByName('kaid').AsInteger;

    kaKA.KAID := FShipKAID;
    kaShip.KAID := FShipKAID;

    if FieldByName('entid').AsInteger > 0
      then kaEnt.KAID := FieldByName('entid').AsInteger
      else kaEnt.KAID := CurrEnt.KAID;

    if FAccID > 0 then kaEnt.AccID := FAccID;

    se := kaEnt.NameEx + ', »ÕÕ/ œœ ' + kaEnt.INN + '/' + kaEnt.KPP;

    if kaEnt.GetAddr <> '' then se := se + ', ' + kaEnt.GetAddr;
    if kaEnt.Phone <> '' then se := se + ', ÚÂÎ.: ' + kaEnt.Phone;

    se := se + ', ' + kaEnt.GetAcc;
    txtShipEnt.Caption := se;
    txtShipEntOKPO.Caption := kaEnt.OKPO;
    txtEnt.Caption := se;
    txtEntOKPO.Caption := kaEnt.OKPO;

    txtReason.Caption := FieldByName('reason').AsString;
    edAtt.Text := FieldByName('received').AsString;
    txtAttNum.Caption := FieldByName('attnum').AsString;

    if FieldByName('attdate').AsDateTime > 0
      then txtAttDate.Caption := ssDateToStr(FieldByName('attdate').AsDateTime);

    if not FieldByName('personid').IsNull
      then lcbShipper.KeyValue := FieldByName('personid').AsInteger
      else begin
        lcbShipper.Clear;
        lShipper.Caption := '';
      end;
    Close;

    ProviderName := 'pWBTorg12_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := Value;
    Open;
    if not IsEmpty then begin
      FShipKAID := FieldByName('shipkaid').AsInteger;
      FShipEntID := FieldByName('shipentid').AsInteger;
      kaShip.KAID := FShipKAID;
      
      if not FieldByName('shipkaaddrid').IsNull
        then kaShip.AddrID := FieldByName('shipkaaddrid').AsInteger;

      if not FieldByName('shipkaaccid').IsNull
        then kaShip.AccID := FieldByName('shipkaaccid').AsInteger;

      if not FieldByName('kaaddrid').IsNull
        then kaKA.AddrID := FieldByName('kaaddrid').AsInteger;

      if not FieldByName('kaaccid').IsNull
        then kaKA.AccID := FieldByName('kaaccid').AsInteger;

      //      txtShipEnt.Caption := GetKAAddr(FShipEntID, False);
      edNum.Text := FieldByName('docnum').AsString;
      edDocDate.Date := FieldByName('docdate').AsDateTime;
      edAppx.Text := FieldByName('appx').AsString;
      edAppx2.Text := FieldByName('appx2').AsString;
      edOKUD.Text := FieldByName('okud').AsString;
      edOKDP.Text := FieldByName('okdp').AsString;
      edNetto.Text := FieldByName('netto').AsString;
      edBrutto.Text := FieldByName('brutto').AsString;
      edPlaceCount.Text := FieldByName('placecount').AsString;
      edAtt.Text := FieldByName('att').AsString;
{      if FieldByName('dirid').AsInteger = 0 then begin
        lcbDirector.Clear;
        lDirector.Caption := '';
      end
      else lcbDirector.KeyValue := FieldByName('dirid').AsInteger;}
{      if FieldByName('buhid').AsInteger = 0 then begin
        lcbBuh.Clear;
      end
      else lcbBuh.KeyValue := FieldByName('buhid').AsInteger;}
      if FieldByName('shipid').AsInteger = 0 then begin
        lcbShipper.Clear;
        lShipper.Caption := '';
      end
      else lcbShipper.KeyValue := FieldByName('shipid').AsInteger;

      FModified := False;
    end;

{    KAID := fieldbyname('kaid').AsInteger;
    lReason.Caption := fieldbyname('reason').AsString;
    s := RoundToA(fieldbyname('onvalue').AsFloat*fieldbyname('total').AsFloat, -2);
    lSum.Caption := ReplaceStr(FormatFloat(MoneyDisplayFormat, s), DecimalSeparator, ',');
    ss := MoneyToStr(s);
    ss := AnsiUpperCase(ss[1])+Copy(ss, 2, Length(ss)-1);
    lSumStr.Caption := ss;
    memTotalStr.Text := ss;
    lSumStrShort.Caption := MoneyToStrShort(s);

    if FieldByname('withnds').AsInteger=1 then begin
     lNDSStr.Visible := True;
     lNDSStrEx.Visible := True;
     FNDS := s-RoundToA(NDSOut(s, NDS), -2);
     lNDS.Caption := FormatFloat(MoneyDisplayFormat, FNDS)+' '+BaseCurrShortName;
     lNDSEx.Caption := MoneyToStrShort(FNDS);
    end
    else begin
     lNDSStr.Visible := False;
     lNDSStrEx.Visible := False;
     lNDS.Caption := '';
     lNDSEx.Caption := '';
    end;
    Close;

    ProviderName := 'pCashOrder_Get';
    FetchParams;
    Params.ParamByName('paydocid').AsInteger := Value;
    Open;
    if not IsEmpty then begin
     DocExists := True;
     edNum.Text := fieldbyname('num').AsString;
     edOnDate.Date := fieldbyname('ondate').AsDateTime;
     edOKUD.Text := fieldbyname('okud').AsString;
     edDebet.Text := fieldbyname('debet').AsString;
     edCorrAcc.Text := fieldbyname('corracc').AsString;
     FModified := False;
    end;
    Close;}

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmTorg12.FormCreate') else _udebug := nil;{$ENDIF}

  FK := panLeft.Width / panRight.Width;

  FormStorage.IniFileName := MainRegKey;
  FormStorage.IniSection := Self.Name;
  FormStorage.Active := True;

  SetCaptions;

  cdsPersons.Open;

  SmartShowRep(frDoc, 'Waybill_Torg12.frf', False);
  //dmData.i15.GetBitmap(0, edAppxCalc.Properties.ButtonGlyph);
  FOldHintPause := Application.HintHidePause;
  Application.HintHidePause := 10000;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aSave.Enabled := (Trim(edNum.Text)<>EmptyStr) and FModified;
  aPreview.Enabled := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.frDocGetValue(const ParName: String; var ParValue: Variant);
  var FSumNDSPos, FSumWithoutNDSPos, FSummPos, FTmp, FAmount, FPrice: Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.frDocGetValue') else _udebug := nil;{$ENDIF}


  if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := edNum.Text else
  //if 0 = AnsiCompareText(ParName, 'docdatestr') then ParValue := lOnDateStr.Caption;
  if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := DateToStr(edDocDate.Date) else
  if 0 = AnsiCompareText(ParName, 'date_str') then ParValue := ssDateToStr(edDocDate.Date) else
  if 0 = AnsiCompareText(ParName, 'ent') then ParValue := txtEnt.Caption else
  if 0 = AnsiCompareText(ParName, 'shipent') then ParValue := txtShipEnt.Caption else
  //if 0 = AnsiCompareText(ParName, 'total') then ParValue := lSum.Caption;
  if 0 = AnsiCompareText(ParName, 'ka') then ParValue := DelChars(txtKAEx.Captions.Text, [#10, #13]) else
  if 0 = AnsiCompareText(ParName, 'shipka') then ParValue := DelChars(txtShipEx.Captions.Text, [#10, #13]) else
  if 0 = AnsiCompareText(ParName, 'entokpo') then ParValue := txtEntOKPO.Caption else
  if 0 = AnsiCompareText(ParName, 'shipentokpo') then ParValue := txtShipEntOKPO.Caption else
  if 0 = AnsiCompareText(ParName, 'kaokpo') then ParValue := txtKAOKPO.Caption else
  if 0 = AnsiCompareText(ParName, 'shipkaokpo') then ParValue := txtShipKAOKPO.Caption else
  if 0 = AnsiCompareText(ParName, 'okud') then ParValue := edOKUD.Text else
  if 0 = AnsiCompareText(ParName, 'okdp') then ParValue := edOKDP.Text else
  if 0 = AnsiCompareText(ParName, 'reason') then ParValue := txtReason.Caption else
  if 0 = AnsiCompareText(ParName, 'attnum') then ParValue := txtAttNum.Caption else
  if 0 = AnsiCompareText(ParName, 'attdate') then ParValue := txtAttDate.Caption else
  if 0 = AnsiCompareText(ParName, 'att') then ParValue := edAtt.Text else
  if 0 = AnsiCompareText(ParName, 'placecount') then ParValue := edPlaceCount.Text else
  if 0 = AnsiCompareText(ParName, 'netto') then ParValue := edNetto.Text else
  if 0 = AnsiCompareText(ParName, 'brutto') then ParValue := edBrutto.Text else
  if 0 = AnsiCompareText(ParName, 'appx') then ParValue := edAppx.Text else
  if 0 = AnsiCompareText(ParName, 'appx2') then ParValue := edAppx2.Text else
  if 0 = AnsiCompareText(ParName, 'poscountstr') then ParValue := PropisRUS(mdReport.RecordCount, 0) else
  if 0 = AnsiCompareText(ParName, 'propis') then ParValue := lSumStr.Caption else
  if 0 = AnsiCompareText(ParName, 'director') then ParValue := txtDir.Caption else
  if 0 = AnsiCompareText(ParName, 'buh') then ParValue := txtBuh.Caption else
  if 0 = AnsiCompareText(ParName, 'shipper') then ParValue := lcbShipper.Text else
  if 0 = AnsiCompareText(ParName, 'directorjob') then ParValue := lDirector.Caption else
  if 0 = AnsiCompareText(ParName, 'shipperjob') then ParValue := lShipper.Caption else
  if 0 = AnsiCompareText(ParName, 'possumnds') then begin
    NDSCalc(mdReport.FieldByName('amount').AsFloat,
      mdReport.FieldByName('price2').AsFloat *
      mdReport.FieldByName('onvalue').AsFloat,
      mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);
      ParValue := RoundToA(FSumNDSPos + FSumWithoutNDSPos, -2);
  end else
  if 0 = AnsiCompareText(ParName, 'posnds') then begin
    NDSCalc(mdReport.FieldByName('amount').AsFloat,
      mdReport.FieldByName('price2').AsFloat *
      mdReport.FieldByName('onvalue').AsFloat,
      mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);
      ParValue := RoundToA(FSumNDSPos, -2);
  end else
  if 0 = AnsiCompareText(ParName, 'posprice') then begin
    if mdReport.FieldByName('amount').AsFloat = 1
      then begin
        NDSCalc(mdReport.FieldByName('amount').AsFloat,
          mdReport.FieldByName('price2').AsFloat *
          mdReport.FieldByName('onvalue').AsFloat,
          mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);
        FSummPos := RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
        ParValue := FSummPos - RoundToA(FSumNDSPos, -2);
      end
      else ParValue := mdReport.FieldByName('price').AsFloat *
        mdReport.FieldByName('onvalue').AsFloat;
  end else
  if 0 = AnsiCompareText(ParName, 'possum') then begin
    NDSCalc(mdReport.FieldByName('amount').AsFloat,
      mdReport.FieldByName('price2').AsFloat *
      mdReport.FieldByName('onvalue').AsFloat,
      mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);
    FSummPos := RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
      //       FWONDS := RoundToA(FSumm - FNDS, -2);
    FSumWithoutNDSPos := FSummPos - RoundToA(FSumNDSPos, -2);
    ParValue := FSumWithoutNDSPos;
  end;// else

{   else

  if 0 = AnsiCompareText(ParName, 'totalstr') then ParValue := lSumStr.Caption;
     if 0 = AnsiCompareText(ParName, 'debet') then ParValue := edDebet.Text;
     if 0 = AnsiCompareText(ParName, 'corracc') then ParValue := edCorrAcc.Text;
     if 0 = AnsiCompareText(ParName, 'totalstrshort') then ParValue := lSumStrShort.Caption;
     if 0 = AnsiCompareText(ParName, 'nds') then ParValue := FormatFloat(MoneyDisplayFormat, FNDS);
     if 0 = AnsiCompareText(ParName, 'withnds') then
      if lNDSStr.Visible then ParValue := 1
       else ParValue := 0;}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.frDocBeginBand(Band: TfrBand);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.frDocBeginBand') else _udebug := nil;{$ENDIF}

   if band.Typ=btMasterData then begin
     band.IsVirtualDS := True;
     band.DataSet.RangeEndCount := edDocCount.Value;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmTorg12.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    //Self.Caption := GetRS('fmPayDoc', 'InCashOrder');

    aCancel.Caption := GetRS('Common', 'Cancel');
    aSave.Caption := GetRS('Common', 'Save');
    aDel.Caption := GetRS('Common', 'Del');
    aPreview.Caption := GetRS('fmPayDoc', 'Preview');
    lCount.Caption := GetRS('fmPayDoc', 'DocCount');

    txtShipEx.Hint := GetRS('fmWaybill', 'Torg12ShipHint');
    txtKAEx.Hint := txtShipEx.Hint;

    chbDefault.Properties.Caption := GetRS('fmPayDoc', 'SetDefault');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.edOnDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.edOnDatePropertiesChange') else _udebug := nil;{$ENDIF}

     FModified := True;
     try
//      lOnDate.Caption := DateToStr(edOnDate.EditValue);
//      lOnDateStr.Caption := DateToStrRUS(edOnDate.EditValue);
       lD1.Caption := ssDateToStr(edDocDate.Date);
       lD2.Caption := lD1.Caption;
     except
     end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.edDocCountPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.edDocCountPropertiesChange') else _udebug := nil;{$ENDIF}

  if edDocCount.Value < 1 then edDocCount.Value := 1
  else if edDocCount.Value > 100000 then edDocCount.Value := 100000;

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.GoNext(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.GoNext') else _udebug := nil;{$ENDIF}


  if NextCtrlOnEnter and (Key=#13) then begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.aDelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.aDelExecute') else _udebug := nil;{$ENDIF}

  with newDataSet do
    try
      ProviderName := 'pCashOrder_Del';
      FetchParams;
      Params.ParamByName('paydocid').AsInteger := ID;
      Execute;
      SendMessage(ParentHandle, WM_REFRESH, ID, 0);
      DocExists := False;
      FModified := True;
      ModalResult := mrOk;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.FormShow') else _udebug := nil;{$ENDIF}


  inherited;

  Self.Width := Self.Width + 1;
  Self.Width := Self.Width - 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.FormResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.FormResize') else _udebug := nil;{$ENDIF}


  inherited;

  panLeft.Width := Trunc(FK * (panLeft.Width + panRight.Width) / (1 + FK));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.edNettoCalcPropertiesChange(Sender: TObject);
var
  FValue: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.edNettoCalcPropertiesChange') else _udebug := nil;{$ENDIF}


  try
    FValue := Trunc(StrToFloat(edNettoCalc.EditingText));
  except
      begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  end;

  edNetto.Text := PropisRUS(FValue, 0) + ' Í„';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.edBruttoCalcPropertiesChange(Sender: TObject);
  var
    FValue: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.edBruttoCalcPropertiesChange') else _udebug := nil;{$ENDIF}

  try
    FValue := Trunc(StrToFloat(edBruttoCalc.EditingText));
  except
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  edBrutto.Text := PropisRUS(FValue, 0) + ' Í„';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.edPlaceCountCalcPropertiesChange(Sender: TObject);
  var
    FValue: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.edPlaceCountCalcPropertiesChange') else _udebug := nil;{$ENDIF}

  try
    FValue := Trunc(StrToFloat(edPlaceCountCalc.EditingText));
  except
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  edPlaceCount.Text := PropisRUS(FValue, 2);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.edAppxCalcPropertiesChange(Sender: TObject);
var
  FValue: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.edAppxCalcPropertiesChange') else _udebug := nil;{$ENDIF}


  try
    FValue := Trunc(StrToFloat(edAppxCalc.EditingText));
  except
      begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  end;

  edAppx.Text := PropisRUS(FValue, 2, True);
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.edAppx2CalcPropertiesChange(Sender: TObject);
var
  FValue: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.edAppx2CalcPropertiesChange') else _udebug := nil;{$ENDIF}


  try
    FValue := Trunc(StrToFloat(edAppx2Calc.EditingText));
  except
      begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  end;

  edAppx2.Text := PropisRUS(FValue, 2, True);
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmTorg12.GetKA(const KAID: Integer; const WithINN: Boolean; FKA: TokKAgent; AList: TStrings): string;
var
  S: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.GetKA') else _udebug := nil;{$ENDIF}


  AList.Clear;
  S := FKA.NameEx;
  if FKA.KType in [1, 2] then begin
    if FKA.DocNum <> ''
      then S := S + ', œ‡ÒÔÓÚ  ' + FKA.DocSeries + ' ' + FKA.DocNum + ', '
      else S := S + ', '; 
    AList.Add(S);
  end
  else begin
    if WithINN and (FKA.INN <> '')
      then S := S + ', »ÕÕ/ œœ ' + FKA.INN + '/' + FKA.KPP + ', '
      else S := S + ', ';
    AList.Add(S);
  end;
  S := FKA.GetAddr;

  if FKA.Phone <> ''
    then S := S + ', ÚÂÎ.: ' + FKA.Phone + ' ';
  AList.Add(S);

  if not FKA.Accounts.IsEmpty then begin
    S := FKA.GetAcc;
    AList.Add(S);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.SetOnDate') else _udebug := nil;{$ENDIF}


  FOnDate := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.txtShipMouseEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.txtShipMouseEnter') else _udebug := nil;{$ENDIF}


  with Sender as TssBevel do begin
    Font.Color := clBlue;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.txtShipMouseLeave(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.txtShipMouseLeave') else _udebug := nil;{$ENDIF}


  with Sender as TssBevel do begin
    Font.Color := clWindowText;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.txtShipEntClick(Sender: TObject);
var
  AID: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.txtShipEntClick') else _udebug := nil;{$ENDIF}


    begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  FCurrCtrl := Sender as TControl;

  AID := FShipEntID;
  ShowModalRef(Self, rtKAgent, vtKAgent, 'TfmKAgent', Self.OnDate, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.WMRefresh') else _udebug := nil;{$ENDIF}


  case TRefType(M.LParam) of
    rtKAgent:
      begin
        if FCurrCtrl = txtShipEx then begin
          FShipKAID := M.WParam;
          kaShip.KAID := FShipKAID;
        end else
        if FCurrCtrl = txtShipEnt then begin
          FShipEntID := M.WParam;
//          txtShipEnt.Caption := GetKAAddr(FShipEntID, False);
        end;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.DataModified') else _udebug := nil;{$ENDIF}


  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.lcbDirectorPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.lcbDirectorPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}


  {if cdsPersons.Locate('kaid', lcbDirector.KeyValue, [])
    then lDirector.Caption := cdsPersons.FieldByName('job').AsString;
  if not cdsPersons.FieldByName('jobtype').IsNull then
    case cdsPersons.FieldByName('jobtype').AsInteger of
      0: lDirector.Caption := rs('fmKAgent', 'Director');
      1: lDirector.Caption := rs('fmKAgent', 'Buh');
    end;}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.lcbShipperPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.lcbShipperPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}


  if cdsPersons.Locate('kaid', lcbShipper.KeyValue, [])
    then lShipper.Caption := cdsPersons.FieldByName('job').AsString;
    
  if not cdsPersons.FieldByName('jobtype').IsNull then
    case cdsPersons.FieldByName('jobtype').AsInteger of
      0: lDirector.Caption := rs('fmKAgent', 'Director');
      1: lDirector.Caption := rs('fmKAgent', 'Buh');
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.cdsPersonsAfterOpen(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.cdsPersonsAfterOpen') else _udebug := nil;{$ENDIF}

  if cdsPersons.Locate('jobtype', 0, [])
     then lcbDirector.KeyValue := cdsPersons.FieldByName('kaid').AsInteger;
  if cdsPersons.Locate('jobtype', 1, [])
     then lcbBuh.KeyValue := cdsPersons.FieldByName('kaid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
function TfrmTorg12.GetEntAddr: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.GetEntAddr') else _udebug := nil;{$ENDIF}


  Result := EntFullName;

  if EntAddr <> '' then Result := Result + ', ' + EntAddr;

  if EntPhone <> '' then Result := Result + ', ÚÂÎ.: ' + EntPhone;

  Result := Result + ', /Ò ' + EntAccount + ' ‚ ' + EntBank + ', Í/Ò ' + EntCorrAcc + ' ¡»  ' + EntMFO;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.kaShipChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.kaShipChange') else _udebug := nil;{$ENDIF}

  GetKA(kaShip.KAID, True, kaShip, txtShipEx.Captions);
  txtShipKAOKPO.Caption := kaShip.OKPO;
  txtDir.Caption := kaEnt.Director;
  txtBuh.Caption := kaEnt.Buh;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.txtShipExItemClick(Sender: TObject; Index: Integer);
var
  S: string;
  AID: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.txtShipExItemClick') else _udebug := nil;{$ENDIF}


  case Index of
    0: begin
         FCurrCtrl := Sender as TControl;
         AID := FShipKAID;
         ShowModalRef(Self, rtKAgent, vtKAgent, 'TfmKAgent', Self.OnDate, AID);
       end;
    1: begin
         kaShip.NextAddr;
          S := kaShip.GetAddr;
         if kaShip.Phone <> ''
           then S := S + ', ÚÂÎ.: ' + kaShip.Phone + ' ';
         txtShipEx.Captions[1] := S;
       end;
    2: begin
         if txtShipEx.Captions.Count > 2 then begin
           kaShip.NextAccount;
           txtShipEx.Captions[2] := kaShip.GetAcc;
         end;
       end;
  end;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.FormDestroy') else _udebug := nil;{$ENDIF}


  Application.HintHidePause := FOldHintPause;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.kaKAChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.kaKAChange') else _udebug := nil;{$ENDIF}


  GetKA(kaKA.KAID, True, kaKA, txtKAEx.Captions);
  txtKAOKPO.Caption := kaKA.OKPO;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.txtKAExItemClick(Sender: TObject; Index: Integer);
var
  S: string;
  AID: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.txtKAExItemClick') else _udebug := nil;{$ENDIF}


  case Index of
    1: begin
         kaKA.NextAddr;
          S := kaKA.GetAddr;
         if kaKA.Phone <> ''
           then S := S + ', ÚÂÎ.: ' + kaKA.Phone + ' ';
         txtKAEx.Captions[1] := S;
       end;
    2: begin
         if txtKAEx.Captions.Count > 2 then begin
           kaKA.NextAccount;
           txtKAEx.Captions[2] := kaKA.GetAcc;
         end;
       end;
  end;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.kaShipAddrChange(Sender: TObject);
var
  S: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.kaShipAddrChange') else _udebug := nil;{$ENDIF}


  if kaShip.AddrID > 0 then begin
    S := kaShip.GetAddr;
    if kaShip.Phone <> ''
      then S := S + ', ÚÂÎ.: ' + kaShip.Phone + ' ';
    txtShipEx.Captions[1] := S;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.kaShipAccountChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.kaShipAccountChange') else _udebug := nil;{$ENDIF}


  if kaShip.AccID > 0 then begin
    txtShipEx.Captions[2] := kaShip.GetAcc;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.kaKAAccountChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.kaKAAccountChange') else _udebug := nil;{$ENDIF}


  if kaKA.AccID > 0 then begin
    txtKAEx.Captions[2] := kaKA.GetAcc;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmTorg12.kaKAAddrChange(Sender: TObject);
var
  S: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmTorg12.kaKAAddrChange') else _udebug := nil;{$ENDIF}


  if kaKA.AddrID > 0 then begin
    S := kaKA.GetAddr;
    if kaKA.Phone <> ''
      then S := S + ', ÚÂÎ.: ' + kaKA.Phone + ' ';
    txtKAEx.Captions[1] := S;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Torg12', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
