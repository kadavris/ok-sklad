{$I ok_sklad.inc}
unit ssBaseWBDocDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseDlg, ActnList, ssFormStorage, ImgList, xButton, ssPanel,
  ssGradientPanel, ssSpeedButton, ExtCtrls, cxCalc, ssCalcEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ssDBComboBox, ssLabel,
  ssDBLookupCombo, cxDropDownEdit, cxSpinEdit, cxTimeEdit, cxMaskEdit,
  cxCalendar, cxCheckBox, dxDBGrid6, dxTL6, dxDBCtrl6, dxDBTLCl6, dxGrClms6,
  dxCntner6, ssDBGrid, cxContainer, cxEdit, cxTextEdit, ssBevel, StdCtrls,
  cxControls, cxGroupBox, ssGroupBox, DB, dxmdaset, DBClient,
  ssClientDataSet;

type
  TfrmBaseWBDocDlg = class(TBaseDlg)
    aSvcInfo: TAction;
    aMatInfo: TAction;
    aBallance: TAction;
    aPrint: TAction;
    panData: TPanel;
    panPos: TPanel;
    panHeader: TPanel;
    gbPos: TssGroupBox;
    dbgWaybillDet: TssDBGrid;
    colPosType: TdxDBGridImageColumn;
    colStatus: TdxDBGridImageColumn;
    colPosId: TdxDBGridColumn;
    colRecNo: TdxDBGridColumn;
    colMatName: TdxDBGridColumn;
    colNorm: TdxDBGridColumn;
    colWHouseName: TdxDBGridColumn;
    colAmount: TdxDBGridColumn;
    colMeasureName: TdxDBGridColumn;
    colPrice: TdxDBGridColumn;
    colSummCurr: TdxDBGridColumn;
    colSummDef: TdxDBGridColumn;
    colMatId: TdxDBGridColumn;
    colWId: TdxDBGridColumn;
    colArtikul: TdxDBGridColumn;
    colPType: TdxDBGridColumn;
    aShowGridOptions: TAction;
    colNDSRate: TdxDBGridColumn;
    colPriceWONDS: TdxDBGridColumn;
    colPriceInCurr: TdxDBGridColumn;
    lTotalCurr: TLabel;
    lSummCurr: TssBevel;
    lTotal: TLabel;
    lTotNDSOut: TLabel;
    lSummDefNoNDS: TssBevel;
    lTotNDS: TLabel;
    lSummDefNDS: TssBevel;
    lTot: TLabel;
    lSummDef: TssBevel;
    colNDS: TdxDBGridColumn;
    colSummWONDS: TdxDBGridColumn;
    aShowRealPrice: TAction;
    colOnValue: TdxDBGridColumn;
    colDiscount: TdxDBGridColumn;
    gbHeader: TssGroupBox;
    dsDet: TDataSource;
    mdDet: TdxMemData;
    mdDetposid: TIntegerField;
    mdDetwbillid: TIntegerField;
    mdDetmatid: TIntegerField;
    mdDetwid: TIntegerField;
    mdDetamount: TFloatField;
    mdDetprice: TFloatField;
    mdDetdiscount: TFloatField;
    mdDetnds: TFloatField;
    mdDetondate: TDateTimeField;
    mdDetcurrid: TIntegerField;
    mdDetptypeid: TIntegerField;
    mdDetnum: TIntegerField;
    mdDetmatname: TStringField;
    mdDetmsrname: TStringField;
    mdDetartikul: TStringField;
    mdDetwhname: TStringField;
    mdDetcurrname: TStringField;
    mdDetonvalue: TFloatField;
    mdDetpostype: TIntegerField;
    mdDetpersonid: TIntegerField;
    mdDetnorm: TFloatField;
    colSerial: TdxDBGridColumn;
    mdDetsn: TStringField;
    colProducer: TdxDBGridColumn;
    srcCashDesks: TDataSource;
    cdsCashDesks: TssClientDataSet;
    srcEntAcc: TDataSource;
    cdsEntAcc: TssClientDataSet;
    cdsEntAccACCID: TIntegerField;
    cdsEntAccBANKID: TIntegerField;
    cdsEntAccTYPEID: TIntegerField;
    cdsEntAccMFO: TStringField;
    cdsEntAccNAME: TStringField;
    cdsEntAccTYPENAME: TStringField;
    cdsEntAccfullname: TStringField;
    mdDetproducer: TStringField;
    mdDetgtd: TStringField;
    mdDetcertnum: TStringField;
    mdDetcertdate: TDateTimeField;
    colGTD: TdxDBGridColumn;
    colCertNum: TdxDBGridColumn;
    colCertDate: TdxDBGridColumn;
    aFinance: TAction;
    mdDetnotes: TStringField;
    colNotes: TdxDBGridColumn;
    cdsEntAccACCNUM: TStringField;
    cdsEntAccDEF: TIntegerField;
    mdDetbarcode: TStringField;
    colBarCode: TdxDBGridColumn;
    edRate: TssCalcEdit;
    lRate: TLabel;
    lCurr: TLabel;
    cbCurr: TssDBLookupCombo;
    lOndate: TLabel;
    edDate: TcxDateEdit;
    edTime: TcxTimeEdit;
    btnSetTime: TssSpeedButton;
    aSetRate: TAction;
    cdsCurr: TssClientDataSet;
    cdsCurrCURRID: TIntegerField;
    cdsCurrNAME: TStringField;
    cdsCurrSHORTNAME: TStringField;
    cdsCurrDEF: TIntegerField;
    cdsCurrDELETED: TIntegerField;
    cdsCurrREPSHORTNAME: TStringField;
    cdsCurrREPFRACNAME: TStringField;
    cdsCurrCURTYPE: TIntegerField;
    dsCurr: TDataSource;
    mdDetfullprice: TFloatField;
    mdDetcardid: TIntegerField;
    mdDetholder: TStringField;
    mdDetcardnum: TStringField;
    colCardNum: TdxDBGridColumn;
    colCardHolder: TdxDBGridColumn;
    mdDettotal: TFloatField;
    aSetCurrentDateTime: TAction;
    mdDetsumwonds: TFloatField;
    mdDetsumnds: TFloatField;
    mdDetsumwithnds: TFloatField;
    mdDetsumcurr: TFloatField;
    mdDetpricewithnds: TFloatField;
    mdDetpricewonds: TFloatField;
    btnBallance: TssSpeedButton;
    btnPrint: TssSpeedButton;
    btnMatInfo: TssSpeedButton;
    btnSvcInfo: TssSpeedButton;
    btnFinance: TssSpeedButton;

    procedure aSvcInfoExecute(Sender: TObject);
    procedure aMatInfoExecute(Sender: TObject);
    procedure aBallanceExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aShowGridOptionsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgWaybillDetNeedAdjust(Sender: TObject);
    procedure colNDSRateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceWONDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure aShowRealPriceExecute(Sender: TObject);
    procedure colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure mdDetAfterDelete(DataSet: TDataSet);
    procedure mdDetAfterPost(DataSet: TDataSet);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aFinanceExecute(Sender: TObject);
    procedure edDatePropertiesChange(Sender: TObject);
    procedure edDateKeyPress(Sender: TObject; var Key: Char);
    procedure edTimePropertiesChange(Sender: TObject);
    procedure cbCurrPropertiesChange(Sender: TObject);
    procedure cbCurrPropertiesEditValueChanged(Sender: TObject);
    procedure aSetRateExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure edRatePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aSetCurrentDateTimeExecute(Sender: TObject);
    procedure btnTBCloseClick(Sender: TObject);

  protected
    NullPricePresent: Boolean;
    FShowRsvMsgs: Boolean;
    FRateChanged: Boolean;
    FGridRefresh: Boolean;
    FPosModified: Boolean;
    CanSelect: Boolean;
    AllSumm, AllSummCurr: Extended;
    CurrID: Integer;
    FRateID: integer;
    FRateDate: TDateTime;

    procedure NoAccess(Sender: TObject);
    procedure RealignGrid;
    procedure GetSummAll; virtual;
    procedure SelectFocusedNode;
    procedure RecalcDoc(FromCurr, ToCurr: Integer; FOnDate: TDateTime);
    procedure SetRate;
    procedure RateChanged;
    procedure UpdatePos; virtual;
    procedure LocateAfterDel; virtual;
    procedure CheckDocumentsCountLimit(Doctype: Integer);

  public
    WBType: Integer;
    CurKurs: Extended;

    procedure SetCaptions; override;

  end;

var
  frmBaseWBDocDlg: TfrmBaseWBDocDlg;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, prFun, ssBaseConst, ssFun, ssBaseIntfDlg, ClientData, ssStrUtil,
  fMessageDlg, CurrencyEdit, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmBaseWBDocDlg.CheckDocumentsCountLimit(Doctype: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.CheckDocumentsCountLimit') else _udebug := nil;{$ENDIF}

  // checking for the limit of free version
  {$IFDEF LIMITED}
  with newDataSet do try
    ProviderName := 'pWaybill_GetDocCount';
    FetchParams;
    Params.ParamByName('wtype').AsInteger := Doctype;
    Open;
    if Fields[0].AsInteger >= limitDocumentsCount then begin
      ssMessageDlg(Format(rs('fmWaybill', 'DocsLimit'), [limitDocumentsCount]), ssmtError, [ssmbOk]);
      //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      ModalResult := mrCancel;
      Exit;
    end;

  finally
    Close;
    Free;
  end;
  {$ENDIF}

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.RecalcDoc(FromCurr, ToCurr: Integer; FOnDate: TDateTime);
  var
    BM: TBookmark;
    FRate: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.RecalcDoc') else _udebug := nil;{$ENDIF}

  if mdDet.IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if mrYes <> ssMessageDlg(LangMan.GetRS('fmWaybill', 'RecalcDoc'), ssmtConfirmation, [ssmbYes, ssmbNo])
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with mdDet do begin
    DisableControls;
    BM := nil;

    try
      BM := GetBookmark;
      FRate := CurrToCurr(dmData.SConnection, FromCurr, ToCurr, FOnDate);
      First;
      while not Eof do begin
        Edit;
        FieldByName('price').AsFloat := FieldByName('price').AsFloat * FRate;
        Post;
        UpdatePos;
        Next;
      end;

    finally
      if BM <> nil then begin
        GotoBookmark(BM);
        FreeBookmark(BM);
      end;
      
      EnableControls;
    end;

    GetSummAll;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.aSvcInfoExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.aSvcInfoExecute') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.aMatInfoExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.aMatInfoExecute') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.aBallanceExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.aBallanceExecute') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.aPrintExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.aPrintExecute') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    btnMatInfo.Hint := GetRS('fmWaybill', 'MatInfo');
    aMatInfo.Caption := GetRS('fmWaybill', 'MatInfo');

    btnBallance.Hint := GetRS('fmWaybill', 'KABallance');
    btnPrint.Hint := GetRS('fmWaybill', 'PrintWB');
    btnSvcInfo.Hint := GetRS('fmWaybill', 'SvcInfo');
    btnFinance.Hint := GetRS('fmFinance', 'Finance');

    aSvcInfo.Caption := GetRS('fmWaybill', 'SvcInfo');
    aShowGridOptions.Caption := GetRS('Common', 'ColOptions') + '...';
    aShowRealPrice.Caption := GetRS('fmWaybill', 'ShowRealPrice');
    gbPos.Caption := ' ' + GetRS('fmWaybill', 'Positions') + ' ';
    lRate.Caption := GetRS('fmWaybill', 'Kurs') + ':';
    lCurr.Caption := GetRS('fmWaybill', 'Curr') + ':';
    lOndate.Caption := GetRS('fmWaybill', 'OnDate') + ':';
    aSetCurrentDateTime.Hint := GetRS('fmWaybill', 'EditTime');

    colArtikul.Caption := GetRS('fmWaybill', 'Artikul');
    colBarCode.Caption := GetRS('fmMaterials', 'BarCode');
    colNDSRate.Caption := GetRS('fmMaterials', 'NDSRate');
    colNDS.Caption := GetRS('fmWaybill', 'NDS');
    colOnValue.Caption := GetRS('fmWaybill', 'Kurs');
    colPriceWONDS.Caption := GetRS('fmWaybill', 'PriceWONDS');
    colPrice.Caption := GetRS('fmWaybill', 'Price') + ' ' + GetRS('fmWaybill', 'withNDS');
    colSummWONDS.Caption := GetRS('fmWaybill', 'Summ') + ' ' + GetRS('fmWaybill', 'outNDS');
    colSummDef.Caption := GetRS('fmWaybill', 'Summ') + ' ' + GetRS('fmWaybill', 'withNDS');
    colDiscount.Caption := GetRS('fmWaybill', 'Discount');
    colSerial.Caption := GetRS('fmWaybill', 'Serial');

    colMatName.Caption := GetRS('fmWaybill', 'MatNameFull');
    colMeasureName.Caption := GetRS('fmWaybill', 'Measure');
    colAmount.Caption := GetRS('fmWaybill', 'Amount');
    colWHouseName.Caption := GetRS('fmWaybill', 'WHouse');

    colProducer.Caption := GetRS('fmWaybill', 'Producer');
    colCertNum.Caption := GetRS('fmWaybill', 'CertNum');
    colGTD.Caption := GetRS('fmWaybill', 'GTD');
    colCertDate.Caption := GetRS('fmWaybill', 'CertDate');
    colNotes.Caption := GetRS('fmWaybill', 'Notes');

    colCardNum.Caption := GetRS('fmWaybill', 'DiscCard');
    colCardHolder.Caption := GetRS('fmDiscCards', 'Holder');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.aShowGridOptionsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.aShowGridOptionsExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.ShowColOptions;
  FGridRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.FormCreate') else _udebug := nil;{$ENDIF}

  FShowRsvMsgs := True;

  inherited;

  dbgWaybillDet.LoadFromRegistry(MainRegKey + '\' + Self.Name);

  cdsCurr.Open;
  if cdsCurr.Locate('def', 1, []) then cbCurr.KeyValue := cdsCurr.FieldByName('currid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.FormDestroy') else _udebug := nil;{$ENDIF}

  inherited;

  dbgWaybillDet.SaveToRegistry(MainRegKey + '\' + Self.Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.RealignGrid;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.RealignGrid') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.Adjust(nil, [colPosType, colPosId, colStatus, colRecNo]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.dbgWaybillDetNeedAdjust(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.dbgWaybillDetNeedAdjust') else _udebug := nil;{$ENDIF}

  RealignGrid;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.colNDSRateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.colNDSRateGetText') else _udebug := nil;{$ENDIF}

  AText := AText + ' %';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.GetSummAll;
  var
    i: Integer;
    PriceCurrOutNDS, SummCurrOutNDS, SummCurrNDS, SummCurr, FAmount, FNorm,
    PriceDefOutNDS, SummDefOutNDS, SummDefNDS, SummDef,
    AllSummDefOutNDS, AllSummDefNDS, AllSummDef, FNDS :Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.GetSummAll') else _udebug := nil;{$ENDIF}

  FAmount := 0;
  AllSummCurr := 0;
  AllSummDefOutNDS := 0;
  AllSummDefNDS := 0;
  AllSummDef := 0;
  NullPricePresent := False;

  with dbgWaybillDet do begin
    for i := 0 to Count - 1 do begin
      try
        if not VarIsNull(Items[i].Values[colNorm.Index])
          then FNorm := ssStrToFloat(Items[i].Values[colNorm.Index])
          else FNorm := 0;

        FAmount := ssStrToFloat(Items[i].Values[colAmount.Index]);

        if (Items[i].Values[colPType.Index] = 1) and (FNorm > 0)
          then FAmount := FAmount * FNorm;

        SummCurr := RoundToA(FAmount * ssStrToFloat(Items[i].Values[colPriceInCurr.Index]), -2);
        AllSummCurr := AllSummCurr + SummCurr;

      except
        NullPricePresent := True;
      end;

      try
        try
          FNDS := ssStrToFloat(Items[i].Values[colNDSRate.Index]);
        except
          FNDS := NDS;
        end;

        {Öåíû ñ ÍÄÑ è áåç ÍÄÑ}
        NDSCalc(1, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * CurKurs, FNDS, 1,
                SummDefOutNDS, SummDefNDS);

        NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * CurKurs, FNDS, 1,
                SummDefOutNDS, SummDefNDS);

        SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
        AllSummDefOutNDS := AllSummDefOutNDS + SummDefOutNDS;
        AllSummDefNDS := AllSummDefNDS + RoundToA(SummDefNDS, -2);

        //Ñóììà â íàö. âàëþòå ñ ÍÄÑ;
        AllSummDef := AllSummDef + SummDef;

      except
        NullPricePresent := True;
      end;
    end;

    AllSummDef := RoundToA(AllSummDef, -2);
    AllSummDefOutNDS := AllSummDef - AllSummDefNDS;

    lSummCurr.Caption := FormatFloat(MoneyDisplayFormat, AllSummCurr);
    lSummCurr.Hint := lSummCurr.Caption;
    lSummDefNoNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefOutNDS);
    lSummDefNoNDS.Hint := lSummDefNoNDS.Caption;
    lSummDefNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefNDS);
    lSummDefNDS.Hint := lSummDefNDS.Caption;
    lSummDef.Caption := FormatFloat(MoneyDisplayFormat, AllSummDef);
    lSummDef.Hint := lSummDef.Caption;
    AllSumm := AllSummDef;
  end;
  FGridRefresh := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.colNDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.colNDSGetText') else _udebug := nil;{$ENDIF}

  if AText <> ''
    then AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.colPriceWONDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.colPriceWONDSGetText') else _udebug := nil;{$ENDIF}

  if AText <> '' then begin
    if not aShowRealPrice.Checked
      then AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText))
      else AText := FormatFloat(',0.######', StrToFloat(AText));
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.aShowRealPriceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.aShowRealPriceExecute') else _udebug := nil;{$ENDIF}

  aShowRealPrice.Checked := not aShowRealPrice.Checked;
  dbgWaybillDet.Repaint;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.colRecNoGetText') else _udebug := nil;{$ENDIF}

  AText := IntToStr(ANode.Index + 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.mdDetAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.mdDetAfterDelete') else _udebug := nil;{$ENDIF}

  FPosModified := True;
  FGridRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.mdDetAfterPost(DataSet: TDataSet);
  var
    AStyle: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.mdDetAfterPost') else _udebug := nil;{$ENDIF}

  FPosModified := True;
  //FGridRefresh := True;
  {AStyle := GetWindowLong(dbgWaybillDet.Handle, GWL_STYLE);
  if AStyle and WS_VSCROLL = WS_VSCROLL then} RealignGrid;
  if Self.Visible and CanSelect then SelectFocusedNode;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.aFinanceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.aFinanceExecute') else _udebug := nil;{$ENDIF}

  ShowFinance(Self, Date);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.NoAccess(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.NoAccess') else _udebug := nil;{$ENDIF}

  showNotAvailable;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.SetRate;
 var
   BM: TBookmark;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  if not edRate.Visible then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.SetRate') else _udebug := nil;{$ENDIF}

  try
    CurKurs := GetCurrencyRate(dmData.SConnection, cbCurr.KeyValue, StrToDate(edDate.Text), FRateDate, FRateID);
    if CurKurs = -1 then CurKurs := 1;

  except
    CurKurs := 1;
  end;

  edRate.Value := CurKurs;
  FRateChanged := False;

  if Self.Visible and CheckCurrency and (FRateDate <> edDate.Date) and (cbCurr.KeyValue <> BaseCurrID) and (cbCurr.Text <> '')
    then aSetRate.Execute;

  RateChanged;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.edDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.edDatePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := True;
  FPosModified := True;
  if edRate.Visible and not FRateChanged and (FID = 0) then begin
    FRateChanged := True;
    SetRate;
    FRateChanged := False;
  end;
  FGridRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.edDateKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.edDateKeyPress') else _udebug := nil;{$ENDIF}

  if key = #32
    then edDate.DroppedDown := True
    else GoNext(Sender, Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.edTimePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.edTimePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.cbCurrPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.cbCurrPropertiesChange') else _udebug := nil;{$ENDIF}

  try
    FModified := True;
    SetRate;
    FGridRefresh := true;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.cbCurrPropertiesEditValueChanged(
  Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.cbCurrPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  FormResize(Self);

  colPriceInCurr.Caption := LangMan.GetRS('fmWaybill', 'PriceInCurr') + ', ' + cbCurr.EditText;
  colSummCurr.Caption := LangMan.GetRS('fmWaybill', 'SummCurr') + ', ' + cbCurr.EditText;

  edRate.Enabled := cbCurr.KeyValue <> BaseCurrID;

  if (CurrID <> 0) and Self.Visible then RecalcDoc(CurrID, cbCurr.KeyValue, Int(edDate.Date));

  CurrID := cbCurr.KeyValue;
  FPosModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.aSetRateExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.aSetRateExecute') else _udebug := nil;{$ENDIF}

  with TfrmCurrencyEdit.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmCurrency';
    OnDate := Self.edDate.Date;
    ID := Self.cbCurr.KeyValue;

    if Self.FRateDate = Self.edDate.Date then SubID := Self.FRateID;

    SetFocusToRate := True;
    SetInactive;

    if ShowModal = mrOk then begin
      SetRate;
      FGridRefresh := true;
    end;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.FormResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.FormResize') else _udebug := nil;{$ENDIF}

  RealignGrid;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.RateChanged;
 var
   BM: TBookmark;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.RateChanged') else _udebug := nil;{$ENDIF}

  if not mdDet.Active then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  BM := mdDet.GetBookmark;
  mdDet.DisableControls;

  try
    mdDet.First;

    while not mdDet.Eof do begin
      mdDet.Edit;
      mdDet.FieldByName('onvalue').AsFloat := CurKurs;
      mdDet.Post;
      UpdatePos;
      mdDet.Next;
    end;

  finally
    mdDet.GotoBookmark(BM);
    mdDet.FreeBookmark(BM);
    mdDet.EnableControls;
  end;

  GetSummAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.edRatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.edRatePropertiesChange') else _udebug := nil;{$ENDIF}

  try
    CurKurs := StrToFloat(edRate.EditingText);
  except
    CurKurs := 1;
  end;

  FRateChanged := True;
  RateChanged;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  FRateChanged := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.aSetCurrentDateTimeExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.aSetCurrentDateTimeExecute') else _udebug := nil;{$ENDIF}

  edDate.Date := Date;
  edTime.Time := Time;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.SelectFocusedNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.SelectFocusedNode') else _udebug := nil;{$ENDIF}

  with dbgWaybillDet do begin
    ClearSelection;
    if FocusedNode <> nil then FocusedNode.Selected := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.UpdatePos;
 var
   FAmount, FNorm, FSummCurr, FPriceCurr, FNDS, FCurrRate: Extended;
   FPriceWithNDS, FPriceWONDS, FSummWONDS, FSummNDS, FSummWithNDS: Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.UpdatePos') else _udebug := nil;{$ENDIF}

  with mdDet do begin
    if IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    FNorm := FieldByName('norm').AsFloat;
    FAmount := FieldByName('amount').AsFloat;
    FPriceCurr := FieldByName('price').AsFloat;
    FNDS := FieldByName('nds').AsFloat;
    FCurrRate := FieldByName('onvalue').AsFloat;

    NDSCalc(1, FPriceCurr * FCurrRate, FNDS, 1, FSummWONDS, FSummNDS);
    FPriceWithNDS := RoundToA(FSummWONDS + FSummNDS, -2);
    FPriceWONDS := RoundToA(FSummWONDS + FSummNDS, -2) - RoundToA(FSummNDS, -2);

    NDSCalc(FAmount, FPriceCurr * FCurrRate, FNDS, 1, FSummWONDS, FSummNDS);
    FSummWithNDS := RoundToA(FSummWONDS + FSummNDS, -2);
    FSummNDS := RoundToA(FSummNDS, -2);
    FSummWONDS := FSummWithNDS - FSummNDS;

    if FNorm > 0 then FAmount := FAmount * FNorm;

    FSummCurr := RoundToA(FAmount * FPriceCurr, -2);
    Edit;
    FieldByName('sumcurr').AsFloat := FSummCurr;
    FieldByName('pricewithnds').AsFloat := FPriceWithNDS;
    FieldByName('pricewonds').AsFloat := FPriceWONDS;
    FieldByName('sumwithnds').AsFloat := FSummWithNDS;
    FieldByName('sumnds').AsFloat := FSummNDS;
    FieldByName('sumwonds').AsFloat := FSummWONDS;
    Post;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.LocateAfterDel;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocDlg.LocateAfterDel') else _udebug := nil;{$ENDIF}

  if dbgWaybillDet.SelectedCount = 1 then begin
    if dbgWaybillDet.FocusedNode.AbsoluteIndex < dbgWaybillDet.Count - 1
      then mdDet.Locate('posid', dbgWaybillDet.FocusedNode.GetNext.Values[colPosId.Index], [])
      else if dbgWaybillDet.FocusedNode.AbsoluteIndex > 0
           then mdDet.Locate('posid', dbgWaybillDet.FocusedNode.GetPrev.Values[colPosId.Index], [])
  end
  else begin
    mdDet.First;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocDlg.btnTBCloseClick(Sender: TObject);
begin
  inherited;
  modalResult := mrCancel;
end;

//==============================================================================================
initialization
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ssBaseWBDocDlg', @Debugging, DEBUG_group_ID);

//==============================================================================================
finalization
  //debugUnregisterUnit(DEBUG_unit_ID);

end.
