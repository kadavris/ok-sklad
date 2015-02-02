{$I ok_sklad.inc}
unit EditPosition; // used in: EditWayBill, EditContr, EditInvoice, EditOrderIn, EditWBRest

interface

uses
  ActnList, Buttons, Classes, Controls,
  DB, DBClient, DBGrids, Dialogs,
  ExtCtrls, Forms, Graphics, Grids, ImgList, Mask, Menus, Messages,
  StdCtrls, SysUtils, TB2Item, Variants, Windows, xButton, xLngDefs,

  dxCntner6, dxDBCtrl6, dxDBGrid6, dxDBTLCl6, dxEditor6, dxGrClms6, dxmdaset, dxTL6,

  cxButtonEdit, cxButtons, cxCalc, cxCalendar, cxCheckBox, cxContainer, cxControls, cxDBEdit, cxDBLookupComboBox, cxDBLookupEdit,
  cxDropDownEdit, cxEdit, cxListView, cxLookAndFeelPainters, cxLookupEdit, cxMaskEdit, cxMemo, cxRadioGroup, cxTextEdit,

  ssBaseDlg, ssBaseTypes, ssBevel, ssCalcEdit, ssCheckBox, ssClientDataSet, ssDBComboBox, ssDBLookupCombo,
  ssFormStorage, ssGradientPanel,ssBaseConst, ssLabel, ssPanel, ssSpeedButton,
  okSearchEdit, prTypes;

type
  TfrmEditPosition = class(TBaseDlg)
    aAddMat: TAction;
    aAddWHouse: TAction;
    aMC: TAction;
    aOrder: TAction;
    aSetPanels: TAction;
    aShowNDS: TAction;
    aSN: TAction;
    btnInfo: TssSpeedButton;
    btnMC: TssSpeedButton;
    btnMove: TssSpeedButton;
    btnOrder: TssSpeedButton;
    btnRsv: TssSpeedButton;
    btnSetPanels: TssSpeedButton;
    btnShowNDS: TssSpeedButton;
    bvlAddPrps: TssBevel;
    bvlMat: TssBevel;
    bvlPrice: TssBevel;
    bvlPriceInterval: TssBevel;
    bvlSN: TssBevel;
    bvlSummary: TssBevel;
    cbProducer: TcxComboBox;
    cbReuseModal: TssCheckBox;
    cbWHouse: TssDBLookupCombo;
    cdsFind: TssClientDataSet;
    cdsMeasure: TssClientDataSet;
    cdsWhouse: TssClientDataSet;
    cdsWhouseADDR: TStringField;
    cdsWhouseDEF: TIntegerField;
    cdsWhouseDELETED: TIntegerField;
    cdsWhouseNAME: TStringField;
    cdsWhouseNOTES: TStringField;
    cdsWhouseWID: TIntegerField;
    dsMeasure: TDataSource;
    dsWhouse: TDataSource;
    edAmount: TssCalcEdit;
    edCertDate: TcxDateEdit;
    edCertNum: TcxTextEdit;
    edGTD: TcxTextEdit;
    edMat: TokMatSearchEdit;
    edMatRB: TcxRadioGroup;
    edNDS: TssCalcEdit;
    edPrice: TssCalcEdit;
    edPriceNoNDS: TssCalcEdit;
    edSN: TcxButtonEdit;
    lAmount: TssLabel;
    lAmountEx: TLabel;
    lAvgPrice: TLabel;
    lCertDate: TssLabel;
    lCertNum: TssLabel;
    lGTD: TssLabel;
    lMatEx: TLabel;
    lMaxPrice: TLabel;
    lMinPrice: TLabel;
    lNDS: TssLabel;
    lNDSRate: TssLabel;
    lPrice: TLabel;
    lPriceInterval: TssLabel;
    lPriceNoNDS: TssLabel;
    lProducer: TssLabel;
    lRemain: TLabel;
    lRemainAll: TLabel;
    lRsv: TLabel;
    lSN: TLabel;
    lSummary: TLabel;
    lSummWithNDS: TssLabel;
    lSummWONDS: TLabel;
    lTitle: TLabel;
    lWHouse: TssLabel;
    PanAddProps: TPanel;
    panMat: TPanel;
    panPrice: TPanel;
    panPriceIn: TPanel;
    panPriceInterval: TPanel;
    panSN: TPanel;
    panSummary: TPanel;
    sbAddWHouse: TssSpeedButton;
    sbShowPriceIn: TssSpeedButton;
    ssBevel8: TssBevel;
    stAmountEx: TssBevel;
    stAvgPrice: TssBevel;
    stCurrShortName: TssBevel;
    stCurrShortNameOutNDS: TssBevel;
    stMaxPrice: TssBevel;
    stMeasureName: TssBevel;
    stMinPrice: TssBevel;
    stRemain: TssBevel;
    stRemainAll: TssBevel;
    stRsv: TssBevel;
    stSumm: TssBevel;
    stSummNDS: TssBevel;
    stSummWithNDS: TssBevel;
    txtSummAmount: TssBevel;
    txtSummNDS: TssBevel;
    txtSummWithNDS: TssBevel;
    txtSummWONDS: TssBevel;

    procedure aAddMatExecute(Sender: TObject);
    procedure aAddWHouseExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aMCExecute(Sender: TObject);
    procedure aOrderExecute(Sender: TObject);
    procedure aSetPanelsExecute(Sender: TObject);
    procedure aShowNDSExecute(Sender: TObject);
    procedure aSNExecute(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure btnMoveClick(Sender: TObject);
    procedure btnRsvClick(Sender: TObject);
    procedure cbProducerPropertiesInitPopup(Sender: TObject);
    procedure cbReuseModalClick(Sender: TObject);
    procedure cbWHouseKeyPress(Sender: TObject; var Key: Char);
    procedure cbWhousePropertiesChange(Sender: TObject);
    procedure cbWHousePropertiesEditValueChanged(Sender: TObject);
    procedure cdsWhouseAfterOpen(DataSet: TDataSet);
    procedure cdsWhouseBeforeOpen(DataSet: TDataSet);
    procedure DataModified(Sender: TObject);
    procedure edAmountKeyPress(Sender: TObject; var Key: Char);
    procedure edAmountPropertiesChange(Sender: TObject);
    procedure edMatChange(Sender: TObject);
    procedure edMatKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edMatOnTypeChange(Sender: TObject);
    procedure edMatRBClick(Sender: TObject);
    procedure edMatRefButtonClick(Sender: TObject);
    procedure edMatWeightChanged(Sender: TObject);
    procedure edNamePropertiesChange(Sender: TObject);
    procedure edNDSPropertiesChange(Sender: TObject);
    procedure edPriceKeyPress(Sender: TObject; var Key: Char);
    procedure edPriceNondsPropertiesChange(Sender: TObject);
    procedure edPriceNoNDSPropertiesEditValueChanged(Sender: TObject);
    procedure edPricePropertiesChange(Sender: TObject);
    procedure edPricePropertiesEditValueChanged(Sender: TObject);
    procedure edShortNamePropertiesChange(Sender: TObject);
    procedure edSNPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edSNPropertiesChange(Sender: TObject);
    procedure edSNPropertiesEditValueChanged(Sender: TObject);
    procedure edSummCurrNoNdsPropertiesChange(Sender: TObject);
    procedure edSummCurrPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbShowPriceInClick(Sender: TObject);

  private
    FByOrder: Boolean;
    FCurrName: string;
    FCurrShortName: string;
    FDocType: TDocType;
    FLocked: Boolean;
    FMode: Integer;
    FPanSummaryVis, FPanSNVis, FPanPriceIntervalVis, FPanAddPropsVis: Boolean;
    FRealigned: Boolean;
    FWID: Integer;

    function AllowTax(const ATaxType, AKType: Integer): Boolean;
    function GetUDocCount(DS: TDataSet; WType: Integer): Integer;
    function SummCurr:Extended;
    procedure cbReuseModalShow;
    procedure GetProducers;
    procedure LoadPanVisibility;
    procedure RealignPanels;
    procedure SavePanVisibility;
    procedure SetByOrder(const Value: Boolean);
    procedure SetCurrID(const Value: integer);
    procedure SetCurrName(const Value: string);
    procedure SetCurrShortName(const Value: string);
    procedure SetDocType(const Value: TDocType);
    procedure SetLocked(const Value: Boolean);
    procedure SetMode(const Value: Integer);
    procedure SetWID(const Value: Integer);
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRealignPanels(var M: TMessage); message WM_REALIGNPANELS;
    procedure WMRecordChanged(var M: TMessage); message WM_RECORDCHANGED;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMSetText(var M: TMessage); message WM_SETTEXT;

  protected
    EdCanChange: Boolean;
    FCanRefresh: boolean;
    FCurrID: integer;
    FKAID: Integer;
    FKeyPressed: Boolean;
    FOldAmount: Extended;
    FOldSum, FOldSumCurr: Extended;
    FSumWONDS: Extended;
    FWBillID: Integer;
    LastInPrice: Extended;
    SNForEachUnit: Boolean;

    procedure CalcSummary;
    procedure GetPrice(APrice: Extended); virtual;
    procedure setid(const Value: integer); override;

  public
    CurrDefName: string;
    FNoNDS: Boolean;
    IsInvoice: Boolean;
    KAType: Integer;
    Kurs: Extended;
    NDSPayer: Boolean;
    ParentHandle: HWND;
    PosNDS: Extended;
    WbillType:Integer;
    parentMdDet: TdxMemData;

    property CurrID: integer read FCurrID write SetCurrID;
    property CurrName: string read FCurrName write SetCurrName;
    property Mode: Integer read FMode write SetMode;
    property DocType: TDocType read FDocType write SetDocType;
    procedure SetCaptions; override;
    procedure LoadSkin; override;
    property CurrShortName: string read FCurrShortName write SetCurrShortName;
    property WID: Integer read FWID write SetWID;
    property ByOrder: Boolean read FByOrder write SetByOrder;
    property Locked: Boolean read FLocked write SetLocked;
  end;

var
  frmEditPosition: TfrmEditPosition;

implementation

uses
  prConst, ClientData, Login, prFun, ssFun,
  fMaterials,fWHouse, ssRegUtils, fMessageDlg, EditMaterials,
  MatMove, MatRsv, ssBaseIntfDlg, MCList, ssStrUtil, Serials, SetPanels,
  ssBaseSkinForm, EditOrderTmp, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmEditPosition.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtMat: edMat.MatID := M.WParam;

    rtMC: edMat.MatID := M.WParam;

    rtWHouse:
      begin
        DSRefresh(cdsWhouse, 'wid', M.WParam);
        cbWhouse.KeyValue := M.WParam;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//Функция суммы в валюте
//==============================================================================================
function TfrmEditPosition.SummCurr: Extended;
  //var res:Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SummCurr') else _udebug := nil;{$ENDIF}

  {res := edAmount.Value * edPrice.Value;
  stSumm.Caption := FormatFloat('0.00',res)+;
  }
  Result := 0.0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.setid(const Value: integer);
  var
    FSumWONDS, FNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditPosition.setid') else _udebug := nil;{$ENDIF}

  if Mode = 1 then begin // called standalone (from waybills list)
    FID := Value;

    with newDataSet do
    try
      ProviderName := 'pWaybillDet_GetPos';
      FetchParams;
      Params.ParamByName('posid').AsInteger := Value;
      Open;
      CurrID := FieldByName('currid').AsInteger;
      Kurs := FieldByName('onvalue').AsFloat;

      if Kurs = 0 then Kurs := 1;

      edMat.MatID := FieldByName('matid').AsInteger;
      cbWHouse.KeyValue := FieldByName('wid').AsInteger;
      PosNDS := FieldByName('nds').AsFloat;

      if FieldByName('amount').IsNull
        then edAmount.Clear
        else edAmount.Value := FieldByName('amount').AsFloat;

      FOldAmount := FieldByName('amount').AsFloat;
      edNDS.Value := FieldByName('nds').AsFloat;
      cbProducer.Text := FieldByName('producer').AsString;
      edGTD.Text := FieldByName('gtd').AsString;
      edCertNum.Text := FieldByName('certnum').AsString;
      edCertDate.Date := FieldByName('certdate').AsDateTime;

      if edCertDate.Date = 0 then edCertDate.EditText := '';

      Self.OnDate := FieldByName('ondate').AsDateTime;
      FWBillID := FieldByName('wbillid').AsInteger;
      FKAID := FieldByName('kaid').AsInteger;
      EdCanChange := True;
      edSN.Properties.LookupItems.Add(FieldByName('serialno').AsString);
      edSN.Text := FieldByName('serialno').AsString;

      if FieldByName('price').IsNull
        then edPrice.Clear
        else edPrice.Value := FieldByName('price').AsFloat;

      edPricePropertiesChange(edPrice);
      CurrShortName := FieldByName('shortname').AsString;
      CurrName := FieldByName('shortname').AsString;
      NDSCalc(FieldByName('amount').AsFloat, FieldByName('price').AsFloat * Kurs, PosNDS, 1, FSumWONDS, FNDS);
      FOldSum := RoundToA(FSumWONDS + FNDS, -2);
      FOldSumCurr := RoundToA(FieldByName('amount').AsFloat * FieldByName('price').AsFloat, -2);
      Close;

      CalcSummary;

      FModified := False;
      edMat.Enabled := False;
      cbWHouse.Enabled := False;
      lWHouse.Enabled := False;
      aAddWHouse.Enabled := False;
      edSN.Enabled := False;

    finally
      Free;
    end;
  end // Mode = 1

  else begin // called from edited document
    if EntNDSPayer = 1
      then PosNDS := NDS
      else PosNDS := 0;

    if Value <> 0 then begin
      Fid := Value;

      with parentMdDet do begin
        edMat.MatID := FieldByName('matid').AsInteger;
        cbWhouse.KeyValue := FieldByName('wid').AsInteger;
        PosNDS := FieldByName('nds').AsFloat;

        if FieldByName('amount').IsNull
          then edAmount.Clear
          else edAmount.Value := FieldByName('amount').AsFloat;

        if FieldByName('price').IsNull
          then edPrice.Clear
          else begin
            if (FindField('svctoprice') <> nil) and (FieldByName('onvalue').AsFloat > 1)
              then edPrice.Value := FieldByName('fullprice').AsFloat
              else edPrice.Value := FieldByName('price').AsFloat;
          end;

        cbProducer.Text := FieldByName('producer').AsString;
        edGTD.Text := FieldByName('gtd').AsString;
        edCertNum.Text := FieldByName('certnum').AsString;
        edCertDate.Date := FieldByName('certdate').AsDateTime;

        if edCertDate.Date = 0 then edCertDate.EditText := '';

        if edMat.IsSerial and (not FieldByName('SN').IsNull) then begin
          edSN.Properties.LookupItems.Add(FieldByName('SN').AsString);
          edSN.Text := FieldByName('SN').AsString;
        end;
      end;
    end //if Value <> 0

    else begin
      edMat.MatID := 0;
      edAmount.Value := WBInDefAmount;
      edPrice.Value := 0;
    end;

    edNDS.Value := PosNDS;
    edPricePropertiesChange(edPrice);
    EdCanChange := True;
    FModified := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: Boolean;
    NextId: Integer;
    i, FWBMID: Integer;
    FAmount, FSumWONDS_, FNDS, FPrice, FSum, FCurrAmount, FDiff, FDiffSum: Extended;
    FNDS_Old, FSumWONDS_Old, FSumCurr: Extended;
    cdsDocs: TssClientDataSet;
    FWBMCount, FRetOutCount, FWriteOffCount, FRetInCount, FWType: Integer;
    WBMRefresh: Boolean;
    strDocs: string;
    FCertDate: TDateTime;
    FTaxSumm: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.FormCloseQuery') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  try
    if ModalResult in [mrOK, mrYes] then begin
      CanClose := False;

      if Mode = 0 then begin // called from edited main document
        (*
        if (DocType = dtOrderIn) and edMat.IsSerial then begin
          ssMessageDlg(rs('fmOrders', 'SNNotSupported'), ssmtError, [ssmbOk]);
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;
        *)

        with parentMdDet do begin
          if not edMat.IsSerial or not SNForEachUnit or (FDocType in [dtDogIn, dtDogOut, dtOrderIn]) or (FID <> 0)
          then begin
            if ID = 0 then begin
              NextID := dsNextPosID(Fields[0].DataSet);
              Append;
              FieldByName('posid').AsInteger := NextID;
            end
            else Edit;

            FieldByName('matid').AsInteger := edMat.MatID;
            FieldByName('matname').AsString := edMat.MatName;
            FieldByName('producer').AsString := edMat.Producer;
            FieldByName('wid').AsInteger := cbWhouse.KeyValue;
            FieldByName('whname').AsString := cbWhouse.EditText;

            if FindField('country') <> nil then FieldByName('country').AsString := edMat.Country;

            if FindField('postype') <> nil then FieldByName('postype').AsInteger := 0;

            if edAmount.EditingText = ''
              then FieldByName('amount').Clear
              else FieldByName('amount').AsFloat := StrToFloat(edAmount.EditingText);

            if edPrice.EditingText = ''
              then FieldByName('price').Clear
              else begin
                if FindField('svctoprice') <> nil
                  then begin
                    FieldByName('fullprice').AsFloat := StrToFloat(edPrice.EditingText);
                    FieldByName('price').AsFloat := StrToFloat(edPrice.EditingText);
                  end
                  else FieldByName('price').AsFloat := StrToFloat(edPrice.EditingText);
              end;

            FieldByName('msrname').AsString := stMeasureName.Caption;
            FieldByName('currid').AsInteger := CurrID;
            FieldByName('NDS').AsFloat := PosNDS;
            FieldByName('onvalue').AsFloat := Kurs;
            FieldByName('artikul').AsString := edMat.Artikul;
            FieldByName('barcode').AsString := edMat.BarCode;
            FieldByName('gtd').AsString := edGTD.EditingText;
            FieldByName('certnum').AsString := edCertNum.EditingText;
            FieldByName('producer').AsString := cbProducer.EditingText;

            try
              FCertDate := StrToDate(edCertDate.EditingText);

            except
              FCertDate := 0;
            end;

            if FCertDate = 0
              then FieldByName('certdate').Clear
              else FieldByName('certdate').AsDateTime := FCertDate;

            if edMat.IsSerial
              then FieldByName('SN').AsString := edSN.EditingText //edSN.Properties.LookupItems[0]
              else FieldByName('SN').Clear;

            if IsInvoice and not edMat.Taxes.IsEmpty then begin
              edMat.Taxes.First;
              
              while not edMat.Taxes.Eof do begin
                if AllowTax(edMat.Taxes.FieldByName('taxtype').AsInteger, KAType) then begin
                  FTaxSumm := RoundToA(FSumWONDS * edMat.Taxes.FieldByName('onvalue').AsFloat / 100, -2);

                  FieldByName('Tax' + edMat.Taxes.FieldByName('taxid').AsString).AsFloat :=
                       edMat.Taxes.FieldByName('onvalue').AsFloat;

                  FieldByName('TaxRate' + edMat.Taxes.FieldByName('taxid').AsString).AsFloat := FTaxSumm;
                end;
                edMat.Taxes.Next;
              end;
            end;

            Post;
          end //if not edMat.IsSerial or not SNForEachUnit or (FDocType in [dtDogIn, dtDogOut, dtOrderIn])or(FID<>0)
          else begin
            if ( ID > 0 ) and Locate('posid',ID,[]) then Delete;

            for i := 0 to Round(StrToFloat(edAmount.EditingText)) - 1 do begin
              NextID := dsNextPosID(Fields[0].DataSet);

              if ID > 0
                then Insert
                else Append;

              FieldByName('posid').AsInteger := NextID;
              FieldByName('matid').AsInteger := edMat.MatID;
              FieldByName('matname').AsString := edMat.MatName;
              FieldByName('wid').AsInteger := cbWhouse.KeyValue;
              FieldByName('whname').AsString := cbWhouse.EditText;
              FieldByName('amount').AsFloat := 1;

              if FindField('postype') <> nil
                then FieldByName('postype').AsInteger := 0;

              if FindField('svctoprice') <> nil
                then FieldByName('fullprice').AsFloat := StrToFloat(edPrice.EditingText)
                else FieldByName('price').AsFloat := StrToFloat(edPrice.EditingText);

              FieldByName('msrname').AsString := stMeasureName.Caption;
              FieldByName('currid').AsInteger := CurrID;
              FieldByName('NDS').AsFloat := PosNDS;
              FieldByName('onvalue').AsFloat := Kurs;
              FieldByName('artikul').AsString := edMat.Artikul;
              FieldByName('barcode').AsString := edMat.BarCode;

              if (DocType in [dtdogin, dtdogout, dtInvoice])
                then FieldByName('SN').Clear
                else FieldByName('SN').AsString := edSN.Properties.LookupItems[i];

              FieldByName('gtd').AsString := edGTD.EditingText;
              FieldByName('certnum').AsString := edCertNum.EditingText;
              FieldByName('producer').AsString := cbProducer.EditingText;

              try
                FCertDate := StrToDate(edCertDate.EditingText);
              except
                FCertDate := 0;
              end;

              if FCertDate = 0
                then FieldByName('certdate').Clear
                else FieldByName('certdate').AsDateTime := FCertDate;

              Post;
              SendMessage(ParentHandle, WM_REFRESH, 0, 9);
            end;//for
          end;//else

          SendMessage(ParentHandle, WM_REFRESH, 0, 9);
        end;//with parentMdDet

        if ID = 0 then begin
          if ModalResult = mrYes then begin
            edMat.MatID := 0;
            edMat.Editor.SetFocus;
            stMinPrice.Caption := '';
            stMaxPrice.Caption := '';
            stAvgPrice.Caption := '';
            stRemain.Caption := '';
            
            if cbProducer.Properties.Items.IndexOf(cbProducer.EditingText) = -1
              then cbProducer.Properties.Items.Add(cbProducer.EditingText);

            ID := 0;
          end
          else CanClose := True;

        end//if ID=0
        else begin
          if ModalResult = mrOK then CanClose := True;
        end;

      end // if Mode = 0 (called from edited document)

      else begin // called standalone (from waybills list)
        try
          FAmount := StrToFloat(edAmount.EditingText);
        except
          FAmount := 0;
        end;

        try
          FPrice := StrToFloat(edPrice.EditingText);
        except
          FPrice := 0;
        end;

        NDSCalc(FAmount, FPrice * Kurs, PosNDS, 1, FSumWONDS_, FNDS);
        FSum := RoundToA(FNDS + FSumWONDS_, -2);
        FSumCurr := RoundToA(FAmount * FPrice, -2);

        cdsDocs := nil;

        FWBMCount := 0;
        FRetOutCount := 0;
        FRetInCount := 0;
        FWriteOffCount := 0;

        with newDataSet do
        try
          ProviderName := 'pWMat_PosRemainGet';
          FetchParams;
          Params.ParamByName('posid').AsInteger := FID;
          Params.ParamByName('ondate').AsDateTime := MaxDateTime;
          Open;
          FCurrAmount := FieldByName('remain').AsFloat - FieldByName('rsv').AsFloat;
          Close;

          if (FOldAmount > FAmount) and ((FOldAmount - FAmount) > FCurrAmount) then begin
            ssMessageDlg(Format(rs('fmWaybill', 'WrongAmount'), [FOldAmount - FCurrAmount]), ssmtError, [ssmbOk]);
            Exit;
          end;

          cdsDocs := newDataSet;
          cdsDocs.ProviderName := 'pWaybill_GetRelDocs';
          cdsDocs.FetchParams;
          cdsDocs.Params.ParamByName('posid').AsInteger := FID;
          cdsDocs.Open;
          if not cdsDocs.IsEmpty then begin
            FWBMCount := GetUDocCount(cdsDocs, 4);
            FRetOutCount := GetUDocCount(cdsDocs, -6);
            FRetInCount := GetUDocCount(cdsDocs, 6);
            FWriteOffCount := GetUDocCount(cdsDocs, -5);
            strDocs := '';

            if FWBMCount > 0
              then strDocs := strDocs + IntToStr(FWBMCount) + ' ' + rs('fmWaybill', 'DocsWBM') + ', ';

            if FWriteOffCount > 0
              then strDocs := strDocs + IntToStr(FWriteOffCount) + ' ' + rs('fmWaybill', 'DocsWriteOff') + ', ';

            if FRetOutCount > 0
              then strDocs := strDocs + IntToStr(FRetOutCount) + ' ' + rs('fmWaybill', 'DocsRetOut') + ', ';

            if FRetInCount > 0
              then strDocs := strDocs + IntToStr(FRetInCount) + ' ' + rs('fmWaybill', 'DocsRetIn') + ', ';

            if strDocs <> '' then System.Delete(strDocs, Length(strDocs) - 1, 2);

            if ssMessageDlg(Format(rs('fmWaybill', 'DocsToRecalc'), [strDocs]), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes
            then Exit;
          end; // if not cdsDocs.IsEmpty

          TrStart;

          try
            cdsDocs.First;
            FDiffSum := 0;

            while not cdsDocs.Eof do begin
              NDSCalc(cdsDocs.FieldByName('amount').AsFloat,
                cdsDocs.FieldByName('price').AsFloat * cdsDocs.FieldByName('onvalue').AsFloat,
                cdsDocs.FieldByName('nds').AsFloat, 1, FSumWONDS_Old, FNDS_Old);

              FDiff := RoundToA(FSumWONDS_Old + FNDS_Old, -2);

              NDSCalc(cdsDocs.FieldByName('amount').AsFloat,
                FPrice * cdsDocs.FieldByName('onvalue').AsFloat, cdsDocs.FieldByName('nds').AsFloat, 1, FSumWONDS_Old, FNDS_Old);

              FDiff := RoundToA(FSumWONDS_Old + FNDS_Old, -2) - FDiff;
              FDiffSum := FDiffSum + FDiff;
              FWBMID := cdsDocs.FieldByName('wbillid').AsInteger;
              FWType := cdsDocs.FieldByName('wtype').AsInteger;

              ProviderName := 'pWaybillDet_UpdPrice';
              FetchParams;
              Params.ParamByName('posid').AsInteger := cdsDocs.FieldByName('posid').AsInteger;
              Params.ParamByName('price').AsFloat := FPrice;
              Params.ParamByName('nds').AsFloat := PosNDS;
              Execute;

              cdsDocs.Next;
              if cdsDocs.Eof or (cdsDocs.FieldByName('wbillid').AsInteger <> FWBMID)
              then
                if (FDiffSum <> 0) and (FWType <> 6) then begin
                  ProviderName := 'pWaybill_UpdSum';
                  FetchParams;
                  Params.ParamByName('wbillid').AsInteger := FWBMID;
                  Params.ParamByName('summpos').AsFloat := FDiffSum;
                  Params.ParamByName('summposcurr').AsFloat := 0;
                  Execute;
                  WBMRefresh := True;
                end;
            end; // while not cdsDocs.Eof

            ProviderName := 'pWaybillDet_Upd';
            FetchParams;
            Params.ParamByName('posid').AsInteger := FID;
            Params.ParamByName('price').AsFloat := FPrice;
            Params.ParamByName('amount').AsFloat := FAmount;
            Params.ParamByName('nds').AsFloat := PosNDS;
            Execute;

            ProviderName := 'pWaybillDetAP_Del';
            FetchParams;
            Params.ParamByName('posid').AsInteger := FID;
            Execute;

            ProviderName := 'pWaybillDetAP_Ins';
            FetchParams;
            Params.ParamByName('posid').AsInteger := FID;
            Params.ParamByName('producer').AsString := cbProducer.EditingText;
            Params.ParamByName('certnum').AsString := edCertNum.EditingText;;
            Params.ParamByName('gtd').AsString := edGTD.EditingText;

            if Trim(edCertDate.EditingText) = '' then begin
              Params.ParamByName('certdate').DataType := ftDateTime;
              Params.ParamByName('certdate').Clear;
            end
            else Params.ParamByName('certdate').AsDateTime := edCertDate.Date;

            Execute;

            ProviderName := 'pWaybill_UpdSum';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FWBillID;
            Params.ParamByName('summpos').AsFloat := FSum - FOldSum;
            Params.ParamByName('summposcurr').AsFloat := FSumCurr - FOldSumCurr;
            Execute;

            ProviderName := 'pWMatTurn_UpdPos';
            FetchParams;
            Params.ParamByName('posid').AsInteger := FID;
            Params.ParamByName('amount').AsFloat := FAmount;
            Execute;

            TrCommit;

            DoRecalcKASaldo(dmData.SConnection, FKAID, Self.OnDate, rs('fmKAgent', 'RecalcBallance'));
            SendMessage(ParentHandle, WM_REFRESH, 0, 0);
            frmMainForm.ExecRefresh('TfmWMat', 0);

            if FWBMCount > 0 then frmMainForm.ExecRefresh('TfmWaybillMov', 0);

            if FRetOutCount > 0 then frmMainForm.ExecRefresh('TfmWBReturnOut', 0);

            if FWriteOffCount > 0 then frmMainForm.ExecRefresh('TfmWriteOff', 0);

          except
            TrRollback;
            raise;
          end;

        finally
          Free;

          if cdsDocs <> nil then begin
            cdsDocs.Close;
            cdsDocs.Free;
          end;
        end;

        if ModalResult = mrOk
          then CanClose := True
          else FModified := False;

      end; // if Mode = 0 else (called standalone)
    end
    else CanClose := true;

    FModified := false;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Screen.Cursor := crDefault;
  end;
end;

//==============================================================================================
procedure TfrmEditPosition.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.ActionListUpdate') else _udebug := nil;{$ENDIF}

  if FID <> 0 then begin
    if edMat.IsSerial then begin
      edMat.Enabled := False;
      edAmount.Enabled := False;
      cbReuseModalShow;
    end;
    
    //panSN.Visible := edMat.IsSerial;
  end;

  edSN.Enabled := (edMat.IsSerial and (edMat.MatID > 0) and (Mode = 0));

  lNDSRate.Visible := btnShowNDS.Checked;
  edNDS.Visible := btnShowNDS.Checked;

  if edMat.Focused
    then aAddMat.ShortCut := TextToShortCut('Ctrl+Ins')
    else aAddMat.ShortCut := TextToShortCut('');

  if cbWhouse.Focused
    then aAddWHouse.ShortCut := TextToShortCut('Ctrl+Ins')
    else aAddWHouse.ShortCut := TextToShortCut('');

  try
    aOk.Enabled :=
      (edMat.MatID > 0)
      and ((DocType in [dtDogIn, dtDogOut, dtOrderIn]) or (StrToFloat(edAmount.EditingText) > 0))
      and
      (
        (DocType in [dtDogIn, dtDogOut, dtOrderIn])
        or ((StrToFloat(edPrice.EditingText) > 0) and (not WBInAllowZero)) 
        or (WBInAllowZero or not edPrice.Enabled)
      )
      and ((DocType in [dtDogIn, dtDogOut, dtInvoice, dtOrderIn]) or not edMat.IsSerial or (edMat.IsSerial and (DocType <> dtOrderIn)))
      and (PosNDS >= 0) and FModified;

    aApply.Enabled := aOk.Enabled and FModified;

  except
    aOk.Enabled := False;
    aApply.Enabled := False;
  end;

  // check for required fields
  try // just in case
    if edMat.MatID > 0
      then edMat.StyleController := dmData.scMainOK
      else edMat.StyleController := dmData.scMainErr;

    if ((DocType in [dtDogIn, dtDogOut, dtOrderIn]) or (StrToFloat(edAmount.EditingText) > 0))
      then edAmount.Style.StyleController := dmData.scMainOK
      else edAmount.Style.StyleController := dmData.scMainErr;

    if (DocType in [dtDogIn, dtDogOut, dtOrderIn])
        or ((StrToFloat(edPrice.EditingText) > 0) and (not WBInAllowZero))
        or (WBInAllowZero or not edPrice.Enabled)
      then edPrice.Style.StyleController := dmData.scMainOK
      else edPrice.Style.StyleController := dmData.scMainErr;

    if (DocType in [dtDogIn, dtDogOut, dtInvoice, dtOrderIn]) or not edMat.IsSerial or (edMat.IsSerial and (DocType <> dtOrderIn))
      then edSN.Style.StyleController := dmData.scMainOK
      else edSN.Style.StyleController := dmData.scMainErr;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.DataModified') else _udebug := nil;{$ENDIF}
    
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.SetCaptions;
 var
   i: integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aApply.Caption := GetRS('Common', 'Apply');
    lWhouse.Caption := GetRS('fmWaybill', 'WHouse') + ':';
    lAmount.Caption := GetRS('fmWaybill', 'Amount') + ':';
    lAmountEx.Caption := GetRS('fmWaybill', 'Amount') + ':';
    lSummary.Caption := GetRS('fmWaybill', 'Total') + ':';
    lSummWithNDS.Caption := GetRS('fmWaybill', 'Summ') + ' ' + GetRS(ParentNameEx, 'withNDS') + ':';
    btnSetPanels.Hint := GetRS('fmWaybill', 'SetPanels');
    btnOrder.Hint := GetRS('fmOrders', 'ToOrder');

    sbShowPriceIn.Hint := GetRS('fmWaybill','ShowPriceIn');

    lMinPrice.Caption := GetRS('fmWaybill','MinPrice') + ':';
    lMaxPrice.Caption := GetRS('fmWaybill','MaxPrice') + ':';
    lAvgPrice.Caption := GetRS('fmWaybill','AvgPrice') + ':';
    lPriceInterval.Caption := GetRS('fmWaybill', 'InPriceInterval') + ':';

    aAddMat.Hint := GetRS('fmWaybill', 'MatAdd');
    aAddWHouse.Hint := GetRS('fmWaybill', 'WHouseRef');
    btnShowNDS.Hint := GetRS('fmWaybill', 'ShowNDS');

    lPrice.Caption := GetRS('fmWaybill', 'PriceWithNDS') + ':';
    lPriceNoNDS.Caption := GetRS('fmWaybill', 'PriceWONDS') + ':';
    lRsv.Caption := GetRS('fmWaybill', 'Rsv') + ':';
    lRemainAll.Caption := GetRS('fmWaybill', 'RemainAll') + ':';
    lRemain.Caption := GetRS('fmWaybill', 'WBInRemain') + ':';

    edMat.OnTypeChanged := edMatOnTypeChange;
    edMat.InitRes;
    edMat.SearchNames[0] := GetRS('fmInventory', 'NameShort') + ';name';

    if edMat.CurrentSearchIndex = 0
      then edMat.Caption.Caption := GetRS('fmInventory', 'NameShort') + ':';

    edMatRB.Caption := GetRS('Common', 'FindParams');
    edMatRB.Properties.Items.Clear;

    for i := 0 to EdMat.SearchNames.Count - 1 do
      with edMatRB.Properties.Items do begin
        Add;
        Items[i].Caption := ExtractWord(1, edMat.SearchNames[i], [';']);
        Items[i].Value := i;
      end;

    edMatRB.ItemIndex := edMat.CurrentSearchIndex;

    btnRsv.Hint := GetRS('fmWaybill','RsvInfo');
    btnMove.Hint := GetRS('fmWaybill','MoveInfo');
    btnInfo.Hint := GetRS('fmWaybill','MatInfo');
    btnMC.Hint := GetRS('fmWaybill','MCList');
    lSN.Caption := GetRS('fmWaybill', 'SNs') + ':';
    lNDSRate.Caption := GetRS('fmMaterials', 'NDSRate') + ':';
    lGTD.Caption := GetRS('fmWaybill', 'GTD') + ':';
    lCertNum.Caption := GetRS('fmWaybill', 'CertNum') + ':';
    lCertDate.Caption := GetRS('fmWaybill', 'CertDate') + ':';
    lProducer.Caption := GetRS('fmWaybill', 'Producer') + ':';

    cbReuseModal.Properties.Caption := GetRS('fmWaybill', 'ReuseModalCap');
    cbReuseModal.Hint := GetRS('fmWaybill', 'ReuseModalHint');
  end;//with

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
procedure TfrmEditPosition.edNamePropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edNamePropertiesChange') else _udebug := nil;{$ENDIF}

  lWName.Visible := Trim(edName.Text)='';
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPosition.edShortNamePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edShortNamePropertiesChange') else _udebug := nil;{$ENDIF}

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.cbReuseModalShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.cbReuseModalShow') else _udebug := nil;{$ENDIF}

  if BarcodesEnabled then begin
    if edMat.Enabled and (edMat.CurrentSearchIndex = 2) // reuse modal for packet barcode entering
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
procedure TfrmEditPosition.FormCreate(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;
  sbShowPriceIn.Checked := True;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'PriceVis', Temp) then begin
    sbShowPriceIn.Checked := (Temp = 1);
    panPriceIn.Visible := (Temp = 1);
  end;
  edMat.SetLng;

  SetCaptions;

  btnShowNDS.ImageIndex := 104;
  sbAddWHouse.ImageIndex := 26;
  panSummary.Align := alTop;
  edAmount.DecimalPlaces := Trunc(Abs(MatDisplayDigits));

  cdsWhouse.Open;
  cdsWHouse.Locate('def', 1, []);
  cbWHouse.KeyValue := cdsWHouse.FieldByName('wid').AsInteger;
  cdsMeasure.Open;

  FCanRefresh := True;

  edMat.LoadFromRegistry(MainRegKey + '\' + Self.Name + '\Find');
  edAmount.Value := WBInDefAmount;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'ReuseModal', Temp)
    then cbReuseModal.Checked := Temp = 1;

  cbReuseModalShow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.cbWhousePropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.cbWhousePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edAmountPropertiesChange(Sender: TObject);
  var
    i:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edAmountPropertiesChange') else _udebug := nil;{$ENDIF}

  cbReuseModalShow;
  CalcSummary;
  FModified := true;

  if edMat.IsSerial then
  try
    while Round(StrToFloat(edAmount.EditingText)) < edSN.Properties.LookupItems.Count do begin
      edSN.Properties.LookupItems.Delete(edSN.Properties.LookupItems.Count - 1);
    end;//while

    edSN.Text := '';
    for i := 0 to edSN.Properties.LookupItems.Count - 1 do begin
      edSN.Text := edSN.Text + edSN.Properties.LookupItems[i] + '; ';
    end;//for

    if edSN.Text <> '' then edSN.Text := System.Copy(edSN.Text, 1, Length(edSN.Text) - 2);

  except
    edSN.Properties.LookupItems.Clear;
    edSN.Text := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edSummCurrPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edSummCurrPropertiesChange') else _udebug := nil;{$ENDIF}
  edsummdef.Value := edSummCurr.Value * Kurs;
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPosition.edPriceNondsPropertiesChange(Sender: TObject);
  var
    v: extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edPriceNondsPropertiesChange') else _udebug := nil;{$ENDIF}

  if edPriceNoNDS.Tag = 0 then begin
    try
      edPrice.Tag := 1;

      if edPriceNoNDS.EditingText = ''
        then v := 0
        else v := NDSIn(StrToFloat(edPriceNoNDS.EditingText), PosNDS);

      if (DocType = dtOrderIn) and (edPriceNoNDS.EditingText = '')
        then edPrice.EditText := ''
        else edPrice.Value := RoundToA(v, -6);

      edPrice.Tag := 0;

    except
      edPrice.Tag := 0;
      edPrice.Text := '';
   end;

   CalcSummary;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edSummCurrNoNdsPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edSummCurrNoNdsPropertiesChange') else _udebug := nil;{$ENDIF}
  edSummDefNoNds.Value := edSummCurrNoNds.Value * Kurs;
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPosition.aAddMatExecute(Sender: TObject);
  (*var
    aid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.aAddMatExecute') else _udebug := nil;{$ENDIF}

  try  aid := FMatID; except  aid := 0; end;
  edMat.SetFocus;
  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPosition.aAddWHouseExecute(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.aAddWHouseExecute') else _udebug := nil;{$ENDIF}

  try
    aid := cbWHouse.KeyValue;
  except
    aid := 0;
  end;

  cbWhouse.SetFocus;
  ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.CalcSummary;
  var
    FNDS, FSumWithNDS, FTaxSumm: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.CalcSummary') else _udebug := nil;{$ENDIF}

  stAmountEx.Caption := edAmount.Text;

  try
    NDSCalc(StrToFloat(edAmount.EditText), StrToFloat(edPrice.EditText), PosNDS, 1, FSumWONDS, FNDS);
    FSumWithNDS := FSumWONDS + FNDS;

    FTaxSumm := 0;

    if IsInvoice then
      if not edMat.Taxes.IsEmpty then
        with edMat.Taxes do begin
          First;
          while not Eof do begin
            if AllowTax(FieldByName('taxtype').AsInteger, KAType) then
              FTaxSumm := FTaxSumm + RoundToA(FSumWONDS * FieldByName('onvalue').AsFloat / 100, -2);
            Next;
          end;
        end;

    if CurrID = BaseCurrID then begin
      FNDS := RoundToA(FNDS, -2);
      FSumWithNDS := RoundToA(FSumWithNDS, -2);
      FSumWONDS := FSumWithNDS - FNDS;
      stSummNDS.Caption := FormatFloat(MoneyDisplayFormat, FNDS);
      stSumm.Caption := FormatFloat(MoneyDisplayFormat, FSumWONDS);
      stSummWithNDS.Caption := FormatFloat(MoneyDisplayFormat, FSumWithNDS);
    end
    else begin
      stSumm.Caption := FormatFloat(MoneyDisplayFormat, RoundToA(StrToFloat(edPrice.EditText) * StrToFloat(edAmount.EditText), RoundSumm));
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
procedure TfrmEditPosition.SetCurrID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SetCurrID') else _udebug := nil;{$ENDIF}

  FCurrID := Value;

  if Value = BaseCurrID then begin
    lPrice.Caption := rs('fmWaybill', 'PriceWithNDS') + ':';
    lSummWONDS.Caption := rs('fmWaybill', 'Summ') + ' ' + rs(ParentNameEx, 'outNDS') + ':';
  end
  else begin
    lPrice.Caption := rs('fmWaybill', 'Price') + ':';
    lSummWONDS.Caption := rs('fmWaybill', 'Summ') + ':';
    lPriceNoNDS.Enabled := False;
    edPriceNoNDS.Enabled := False;
    lNDS.Enabled := False;
    stSummNDS.Enabled := False;
    lSummWithNDS.Enabled := False;
    stSummWithNDS.Enabled := False;
    stSummWithNDS.Caption := '';
    stSummNDS.Caption := '';
    stCurrShortNameOutNDS.Font.Color := clBtnShadow;
    lNDSRate.Enabled := False;
    edNDS.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edPricePropertiesChange(Sender: TObject);
  var
    v: extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edPricePropertiesChange') else _udebug := nil;{$ENDIF}

  if (edPrice.Tag = 0) and edPriceNoNDS.Enabled then begin
    try
      edPriceNoNDS.Tag := 1;

      if edPrice.EditingText = ''
        then v := 0
        else v := NDSOut(StrToFloat(edPrice.EditingText), PosNDS);

      if (DocType = dtOrderIn) and (edPrice.EditingText = '')
        then edPriceNoNDS.EditText := ''
        else edPriceNoNDS.EditText := FloatToStr(RoundToA(v, -6));

      edPriceNoNDS.Tag := 0;

    except
      edPriceNoNDS.Tag := 0;
      edPriceNoNDS.Text := '';
    end;//try
  end;

  CalcSummary;
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  if CurrID <> BaseCurrID
    then lNDS.Caption := rs('fmWaybill', 'NDS')
    else lNDS.Caption := rs('fmWaybill', 'NDS') + ' ' + FloatToStr(PosNDS) + '%';

  if edMat.Enabled
    then edMat.Editor.SetFocus
    else if edAmount.Enabled
      then edAmount.SetFocus
      else edPrice.SetFocus;

  if not FRealigned then begin
    RealignPanels;
    FRealigned := True;
  end
  else LoadPanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.cbWHouseKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.cbWHouseKeyPress') else _udebug := nil;{$ENDIF}

  if (lWhouse.Font.Color <> clRed) and (key = #13)
    then edAmount.setFocus
    else GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edAmountKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edAmountKeyPress') else _udebug := nil;{$ENDIF}

  if (lAmount.Font.Color <> clRed) and (key = #13)
    then edPrice.setFocus
    else GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edPriceKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edPriceKeyPress') else _udebug := nil;{$ENDIF}

  if Key = '-' then Key := #0;
  GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.WMRecordChanged(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.WMRecordChanged') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtMat:
      begin
        FMatID := PNewRecordInfo(M.WParam).ID;
        txtMat.Caption := PNewRecordInfo(M.WParam).Name;
        edMat.Text := PNewRecordInfo(M.WParam).Notes;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPosition.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.FormDestroy') else _udebug := nil;{$ENDIF}

  edMat.SaveToRegistry(MainRegKey + '\' + Self.Name + '\Find');
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'PriceVis', Integer(sbShowPriceIn.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'ReuseModal', Integer(cbReuseModal.Checked));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.btnInfoClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.btnInfoClick') else _udebug := nil;{$ENDIF}

  if edMat.MatID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := edMat.MatID;
      CanModify := False;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.btnMoveClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.btnMoveClick') else _udebug := nil;{$ENDIF}

  if edMat.MatID = 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatMove.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Self.OnDate;
      WID := 0; //cbWHouse.KeyValue;
      ID := edMat.MatID;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.btnRsvClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.btnRsvClick') else _udebug := nil;{$ENDIF}

  if edMat.MatID = 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatRsv.Create(nil) do
    try
     ParentNameEx := 'fmWMat';
     OnDate := Self.OnDate;
     WID := 0;
     ID := edMat.MatID;
     ShowModal;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  edMat.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edPricePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edPricePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if edPrice.Value < 0 then edPrice.Value := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edPriceNoNDSPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edPriceNoNDSPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if edPriceNoNDS.Value < 0 then edPriceNoNDS.Value := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.sbShowPriceInClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.sbShowPriceInClick') else _udebug := nil;{$ENDIF}

  //sbShowPriceIn.Checked := not sbShowPriceIn.Checked;
  panPriceIn.Visible := not sbShowPriceIn.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.GetPrice(APrice: Extended);
  var
    FPrice: Extended;
    WithNDS: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.GetPrice') else _udebug := nil;{$ENDIF}

  FPrice := 0;

  if WBInAutoPrice then begin
    with newDataSet do
    try
      if WBInAutoPriceType <> 0 then begin
        ProviderName := 'pWayBill_GetDefPrice';
        FetchParams;
        Params.ParamByName('matid').AsInteger := edMat.MatID;
        Params.ParamByName('ptypeid').AsInteger := WBInPriceType;
        Params.ParamByName('ondate').AsDateTime := Self.OnDate;
        Params.ParamByName('price').AsFloat := APrice;
        Params.ParamByName('currid').AsInteger := CurrID;
        Params.ParamByName('onvalue').AsFloat := Kurs;
        Open;
        if not IsEmpty then begin
          FPrice := RoundToA(FieldByName('extra').AsFloat, -6);
          WithNDS := FieldByName('withnds').AsInteger = 1;
          if not WithNDS then FPrice := NDSIn(FPrice, PosNDS);
          FPrice := FPrice / Kurs;
        end
        else FPrice := 0;

        Close;
      end
      else begin
        ProviderName := 'pWaybill_GetLastPrice';
        FetchParams;
        Params.ParamByName('matid').AsInteger := edMat.MatID;
        Params.ParamByName('ondate').AsDateTime := Self.OnDate;
        Open;
        FPrice := FieldByName('price').AsFloat * CurrToCurr(dmData.SConnection, FieldByName('currid').AsInteger, CurrID, Self.OnDate);
        Close;
      end;

    finally
      Free;
    end;

    edPrice.Value := FPrice;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.aSNExecute(Sender: TObject);
  var
    i, amount: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.aSNExecute') else _udebug := nil;{$ENDIF}

  if not SNForEachUnit and (mrYes <> ssMessageDlg(rs('fmWaybill', 'SNForEachUnit'), ssmtWarning, [ssmbYes, ssmbNo], 'PosSNWarning', True))
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmSerials.Create(nil) do
  try
    amount := Round(StrToFloat(edAmount.EditingText));

    mdSN.Open;
    while mdSN.RecordCount < Amount do begin
      mdSN.Append;
      mdSN.FieldByName('num').AsInteger := mdSN.RecordCount + 1;

      if mdSN.RecNo <= edSN.Properties.LookupItems.Count // if some SN already fiiled - adding it. empty place otherwise
        then mdSN.FieldByName('sn').AsString := edSN.Properties.LookupItems[mdSN.RecNo - 1];

      mdSN.Post;
    end;

    mdSN.First;

    if ShowModal = mrOK then begin
      edSN.Text := '';
      edSN.Properties.LookupItems.Clear;

      mdSN.First;

      // filling edSN items 
      while not mdSN.Eof do begin
        if not mdSN.FieldByName('sn').IsNull then begin
          edSN.Properties.LookupItems.Add(mdSN.FieldByName('sn').AsString);
          edSN.Text := edSN.Text + mdSN.FieldByName('sn').AsString + '; ';
        end;

        mdSN.Next;
      end;

      if edSN.Text <> '' then edSN.Text := System.Copy(edSN.Text, 1, Length(edSN.Text) - 2);

      edAmount.Value := edSN.Properties.LookupItems.Count;
      SNForEachUnit := True;
      DataModified(Self);
    end;//if

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edSNPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edSNPropertiesButtonClick') else _udebug := nil;{$ENDIF}

  aSN.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edNDSPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edNDSPropertiesChange') else _udebug := nil;{$ENDIF}

  if EdCanChange then begin
    try
      PosNDS := StrToFloat(edNDS.EditText);

      if CurrID <> BaseCurrID
        then lNDS.Caption := rs('fmWaybill', 'NDS')
        else lNDS.Caption := rs('fmWaybill', 'NDS') + ' ' + FloatToStr(PosNDS) + '%';

    except
      PosNDS := 0;
    end;
  end;
  FModified := True;
  CalcSummary;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.aShowNDSExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.aShowNDSExecute') else _udebug := nil;{$ENDIF}

  aShowNDS.Checked := not aShowNDS.Checked;
  btnShowNDS.Checked := not aShowNDS.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.SetMode(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SetMode') else _udebug := nil;{$ENDIF}

  FMode := Value;
  Self.Caption := rs('fmWaybill', 'PosEdit');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edMatOnTypeChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edMatOnTypeChange') else _udebug := nil;{$ENDIF}

  edMatRB.ItemIndex := edMat.CurrentSearchIndex;
  cbReuseModalShow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edMatChange(Sender: TObject);
  var
    MinPrice, MaxPrice, AvgPrice, Remain, Rsv: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edMatChange') else _udebug := nil;{$ENDIF}

  if edMat.MatID = 0
    then lMatEx.Caption := ''
    else begin
      lMatEx.Left := lTitle.Left + lTitle.Width;
      lMatEx.Width := panTitleButtons.Left - 2 - lMatEx.Left;
      lMatEx.Caption := ': ' + edMat.MatName;
    end;

  if edMat.IsSerial then begin
    edAmount.DecimalPlaces := 0;

    if Mode = 1 then begin
      edAmount.Enabled := False;
      lAmount.Enabled := False;
      stMeasureName.Font.Color := clBtnShadow;
    end;
  end
  else begin
    edAmount.DecimalPlaces := Trunc(Abs(MatDisplayDigits));
    edSN.Text := '';
    edSN.Properties.LookupItems.Clear;
  end;

  if ShowPrices then begin
    GetMatPrices(dmData.SConnection, edMat.MatID, MinPrice, MaxPrice, AvgPrice, LastInPrice, Remain, Rsv);
    stMinPrice.Caption := FormatFloat(PriceDisplayFormatEx, MinPrice / Kurs);
    stMaxPrice.Caption := FormatFloat(PriceDisplayFormatEx, MaxPrice / Kurs);
    stAvgPrice.Caption := FormatFloat(PriceDisplayFormatEx, AvgPrice / Kurs);
    stRemain.Caption := FormatFloat(MatDisplayFormat, RoundToA(Remain - Rsv, MatDisplayDigits));
    stRemainAll.Caption := FormatFloat(MatDisplayFormat, RoundToA(Remain - Rsv, MatDisplayDigits));
  end
  else begin
    stMinPrice.Caption := rs('Common', 'NA');
    stMaxPrice.Caption := rs('Common', 'NA');
    stAvgPrice.Caption := rs('Common', 'NA');
  end;

  if NDSPayer
    then edNDS.Value := edMat.NDS
    else edNDS.Value := 0;

  GetPrice(AvgPrice);

  stMeasureName.Caption := edMat.Measure;
  txtSummAmount.Caption := edMat.Measure;
  cbProducer.Text := edMat.Producer;
  if WID > 0 then cbWHouse.KeyValue := WID else
    if ID = 0 then begin
      if (edMat.WID > 0) and (cbWHouse.Tag = 0) then begin
        if not cdsWhouse.Locate('wid', edMat.WID, [])
          then DSRefresh(cdsWhouse, 'wid', 0);
        cbWHouse.KeyValue := edMat.WID;
      end
      else cbWhouse.KeyValue := cdsWHouse.fieldbyname('wid').AsInteger;
    end;

  FModified := True;

  if Self.Visible then
    if cbReuseModal.Visible and cbReuseModal.Checked and (edMat.searchState = oseFound)
      then ModalResult := mrYes;
      //else edAmount.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edMatRefButtonClick(Sender: TObject);
  var
    AID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edMatRefButtonClick') else _udebug := nil;{$ENDIF}

  try
    AID := edMat.MatID;
  except
    AID := 0;
  end;

  edMat.Editor.SetFocus;
  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.SetCurrShortName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SetCurrShortName') else _udebug := nil;{$ENDIF}

  FCurrShortName := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditPosition.GetUDocCount(DS: TDataSet; WType: Integer): Integer;
  var
    FID: Integer;
    DoExec: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.GetUDocCount') else _udebug := nil;{$ENDIF}

  Result := 0;
  with DS do begin
    Filter := 'wtype=' + IntToStr(WType);
    Filtered := True;
    First;
    FID := -1;
    while not Eof do begin
      FID := DS.FieldByName('wbillid').AsInteger;
      Next;

      if (DS.FieldByName('wbillid').AsInteger <> FID) or Eof then Inc(Result);
    end;
    Filtered := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.aSetPanelsExecute(Sender: TObject); // настройка отображаемых панелей
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.aSetPanelsExecute') else _udebug := nil;{$ENDIF}

  with TfrmSetPanels.Create(nil) do
  try
    MainHandle := Self.Handle;
    FList.AddObject(rs('fmWaybill', 'PanMat'), panMat);
    FList.AddObject(rs('fmWaybill', 'PanPrice'), panPrice);
    FList.AddObject(rs('fmWaybill', 'PanSN'), panSN);
    FList.AddObject(rs('fmWaybill', 'PanPriceInterval'), panPriceInterval);
    FList.AddObject(rs('fmWaybill', 'PanAddProps'), panAddProps);
    FList.AddObject(rs('fmWaybill', 'PanSummary'), panSummary);
    SetPanels;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.LoadPanVisibility;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.LoadPanVisibility') else _udebug := nil;{$ENDIF}

  panSN.Visible := FPanSNVis;
  panPriceInterval.Visible := FPanPriceIntervalVis;
  PanAddProps.Visible := FPanAddPropsVis;
  panSummary.Visible := FPanSummaryVis;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.SavePanVisibility;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SavePanVisibility') else _udebug := nil;{$ENDIF}

  FPanSNVis := panSN.Visible;
  FPanPriceIntervalVis := panPriceInterval.Visible;
  FPanAddPropsVis := PanAddProps.Visible;
  FPanSummaryVis := panSummary.Visible;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.RealignPanels;
  var
    FOffs: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.RealignPanels') else _udebug := nil;{$ENDIF}

  FOffs := 0;

  if not panSN.Visible then FOffs := FOffs - panSN.Height;

  if not panSummary.Visible then FOffs := FOffs - panSummary.Height;

  if not panPriceInterval.Visible then FOffs := FOffs - panPriceInterval.Height;

  if not panAddProps.Visible then FOffs := FOffs - panAddProps.Height;

  panSummary.Align := alClient;

  if not panSummary.Visible then FOffs := FOffs + 7;

  if FOffs <> 0 then Self.Height := Self.Height + FOffs;

  SavePanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.WMRealignPanels(var M: TMessage);
  var
    FList: TStringList;
    i: Integer;
    FVis: Boolean;
    FPan: TPanel;
    FOffs: Integer;
    Y: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.WMRealignPanels') else _udebug := nil;{$ENDIF}

  FList := TStringList(Pointer(M.WParam));
  FOffs := 0;
  panSummary.Align := alNone;

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
  panSummary.Align := alClient;
  if FOffs <> 0 then Self.Height := Self.Height + FOffs;

  Y := panPrice.Top + panPrice.Height - 1;
  if panSN.Visible then begin
    panSN.Top := Y;
    Y := Y + panSN.Height;
  end;

  if panPriceInterval.Visible then begin
    panPriceInterval.Top := Y;
    Y := Y + panPriceInterval.Height;
  end;

  if panAddProps.Visible then begin
    PanAddProps.Top := Y;
    Y := Y + PanAddProps.Height;
  end;

  SavePanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.SetCurrName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SetCurrName') else _udebug := nil;{$ENDIF}

  FCurrName := Value;

  stCurrShortName.Caption := Value;
  stCurrShortNameOutNDS.Caption := Value;
  txtSummNDS.Caption := Value;
  txtSummWithNDS.Caption := Value;
  txtSummWONDS.Caption := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.GetProducers;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.GetProducers') else _udebug := nil;{$ENDIF}

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
procedure TfrmEditPosition.cbProducerPropertiesInitPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.cbProducerPropertiesInitPopup') else _udebug := nil;{$ENDIF}

  if cbProducer.Properties.Items.Count = 0 then GetProducers;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.LoadSkin;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.LoadSkin') else _udebug := nil;{$ENDIF}

  inherited;

  bvlMat.Color := clokDlgBk;
  bvlPrice.Color := clokDlgBk;
  bvlAddPrps.Color := clokDlgBk;
  bvlSN.Color := clokDlgBk;
  bvlSummary.Color := clokDlgBk;
  bvlPriceInterval.Color := clokDlgBk;
  edMat.Color := clokDlgBk;
  panPriceIn.Color := clokDlgBk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.cbWHousePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.cbWHousePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if Visible then cbWHouse.Tag := 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.SetDocType(const Value: TDocType);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SetDocType') else _udebug := nil;{$ENDIF}

  FDocType := Value;

  case Value of
    dtDogIn, dtDogOut, dtOrderIn:
      begin
        panSN.Visible := False;
        PanAddProps.Visible := False;
        FormStorage.StoredProps.Delete(FormStorage.StoredProps.IndexOf('panSN.Visible'));
        FormStorage.StoredProps.Delete(FormStorage.StoredProps.IndexOf('PanAddProps.Visible'));
      end;

    dtInvoice:
      begin
        panSN.Tag := 1;
        panSN.Visible := False;
        FormStorage.StoredProps.Delete(FormStorage.StoredProps.IndexOf('panSN.Visible'));
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.aMCExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.aMCExecute') else _udebug := nil;{$ENDIF}

  if edMat.MatID <= 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMCList.Create(nil) do
  try
    OnDate := Self.OnDate;
    MainHandle := Self.Handle;
    ID := Self.edMat.MatID;
    CheckRemain := False;
    CanModify := False;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.WMSetText(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.WMSetText') else _udebug := nil;{$ENDIF}

  inherited;

  lTitle.Caption := panTitleBar.Caption;

  if not Assigned(edMat) then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if (edMat.MatID = 0)
    then lMatEx.Caption := ''
    else begin
      lMatEx.Left := lTitle.Left + lTitle.Width;
      lMatEx.Width := panTitleButtons.Left - 2 - lMatEx.Left;
      lMatEx.Caption := ': ' + edMat.MatName;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditPosition.AllowTax(const ATaxType, AKType: Integer): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.AllowTax') else _udebug := nil;{$ENDIF}

  Result := ((ATaxType in [0, 1]) and (AKType in [1, 2]))
               or
            ((ATaxType in [0, 2]) and (AKType in [0]));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.SetWID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SetWID') else _udebug := nil;{$ENDIF}

  FWID := Value;
  cbWHouse.KeyValue := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edMatWeightChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edMatWeightChanged') else _udebug := nil;{$ENDIF}

  edAmount.Value := edMat.Weight;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.cdsWhouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.cdsWhouseBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWhouse.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.SetByOrder(const Value: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SetByOrder') else _udebug := nil;{$ENDIF}

  FByOrder := Value;

  if Value then begin
    edMat.Enabled := False;
    edAmount.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.SetLocked(const Value: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SetLocked') else _udebug := nil;{$ENDIF}

  FLocked := Value;

  if Value then begin
    edMat.Enabled := False;
    edAmount.Enabled := False;
    cbWHouse.Enabled := False;
    sbAddWHouse.Enabled := False;
    lWHouse.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.aOrderExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.aOrderExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditOrderTmp.Create(nil) do
    try
      ID := 0;
      if Self.edMat.MatID > 0 then edMat.MatID := Self.edMat.MatID;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.cdsWhouseAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.cdsWhouseAfterOpen') else _udebug := nil;{$ENDIF}

  if cdsWhouse.Locate('def', 1, [])
    then cbWHouse.KeyValue := cdsWhouse.FieldByName('wid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edSNPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edSNPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  SNForEachUnit := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edSNPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edSNPropertiesChange') else _udebug := nil;{$ENDIF}

  SNForEachUnit := False;
  DataModified(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.cbReuseModalClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.cbReuseModalClick') else _udebug := nil;{$ENDIF}

  if Self.Visible then edMat.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edMatRBClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edMatRBClick') else _udebug := nil;{$ENDIF}

  edMat.CurrentSearchIndex := edMatRB.ItemIndex;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosition.edMatKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  //var  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edMatKeyDown') else _udebug := nil;{$ENDIF}

  if Key = 13 then begin
    Key := 0;
    edAmount.setFocus;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditPosition', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
