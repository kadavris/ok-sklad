{$I ok_sklad.inc}
unit EditInvoice; // Memorandum/Счета-фактуры

interface

uses
  cxButtonEdit, cxButtons, cxCalc, cxCalendar, cxCheckBox, cxContainer, cxControls, cxCustomData, cxDBEdit,
  cxDBLookupComboBox, cxDBLookupEdit, cxDropDownEdit, cxEdit, cxGraphics, cxGroupBox, cxInplaceContainer, cxListView,
  cxLookAndFeelPainters, cxLookupEdit, cxMaskEdit, cxMemo, cxPC, cxSpinEdit, cxStyles, cxTextEdit, cxTimeEdit, cxTL, cxTreeView,

  dxCntner6, dxDBCtrl6, dxDBGrid6, dxDBTLCl6, dxEditor6, dxExEdtr6, dxGrClms6, dxmdaset, dxTL6,

  okSearchEdit, ssBaseConst, ssBaseDlg, ssBaseTypes, ssBaseWBDocDlg, ssBaseWBDocDlgWithPayment, ssBevel, ssCalcEdit, ssClientDataSet,
  ssDBComboBox, ssDBGrid, ssDBLookupCombo, ssFormStorage, ssGradientPanel, ssGroupBox, ssImagePanel, ssLabel, ssMemDS,
  ssPageControl, ssPanel, ssSpeedButton,

  ActnList, Buttons, Classes, ComCtrls, Controls, ExtCtrls, Forms, FR_Class, FR_DBSet, FR_Desgn, FR_DSet,
  Graphics, Grids, ImgList, Menus, Messages, DB, DBClient, DBCtrls, DBGrids, dialogs,
  StdCtrls, SysUtils, TB2Item, Variants, Windows, xButton, xCtrls, xLngDefs;

type
  TfrmEditInvoice = class(TfrmBaseWBDocDlgWithPayment)
    aActivateFind: TAction;
    aAddKA: TAction;
    aAddMat: TAction;
    aAddSvc: TAction;
    aCDel: TAction;
    aChangeEnt: TAction;
    aCIns: TAction;
    aCUpd: TAction;
    aNextAddr: TAction;
    aPayMPersons: TAction;
    aPersons: TAction;
    aSelectAll: TAction;
    aSetKurs: TAction;
    btnAdd: TssSpeedButton;
    btnDel: TssSpeedButton;
    btnEntAddr: TssSpeedButton;
    btnKAAddr: TssSpeedButton;
    btnProps: TssSpeedButton;
    btnShipEntAddr: TssSpeedButton;
    btnShipKAAddr: TssSpeedButton;
    cbSelectPay: TcxComboBox;
    cdsFind: TssClientDataSet;
    cdsPersonName: TssClientDataSet;
    cdsShippers: TssClientDataSet;
    colCountry: TdxDBGridColumn;
    colExsize: TdxDBGridColumn;
    edEnt: TokKASearchEdit;
    edEntAddr: TcxTextEdit;
    edFind: TokGridSearchEdit;
    edKAAddr: TcxTextEdit;
    edKAgent: TokKASearchEdit;
    edNum1: TcxTextEdit;
    edShipEnt: TokKASearchEdit;
    edShipEntAddr: TcxTextEdit;
    edShipKA: TokKASearchEdit;
    edShipKAAddr: TcxTextEdit;
    frDoc: TfrReport;
    fsrcDoc: TfrDBDataSet;
    FsrcTaxes: TfrDBDataSet;
    lEmployeeTitle: TLabel;
    lcbShipper: TssDBLookupCombo;
    lEntAddr: TLabel;
    lEntEx: TxLabelEx;
    lKAAddr: TLabel;
    lNum: TLabel;
    lShipEntAddr: TLabel;
    lShipKAAddr: TLabel;
    lShipper: TcxTextEdit;
    lTitle: TLabel;
    mdDetcountry: TStringField;
    mdDettaxsum: TFloatField;
    mdReport: TdxMemData;
    mdTaxes: TdxMemData;
    mdTaxesname: TStringField;
    mdTaxesonvalue: TFloatField;
    mdTaxestaxid: TIntegerField;
    mdTaxestaxsumm: TFloatField;
    panPosBar: TPanel;
    pmMain: TTBPopupMenu;
    pmMatSvc: TTBPopupMenu;
    lEmployee: TLabel;
    srcEnt: TDataSource;
    srcPersonName: TDataSource;
    srcShippers: TDataSource;
    ssBevel12: TssBevel;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem19: TTBItem;
    TBItem1: TTBItem;
    TBItem20: TTBItem;
    TBItem2: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;

    function AddToWMat(WBILLID:integer):boolean;
    function DelFromWMat(WBILLID:integer):boolean;
    function NextIdMat:integer;
    procedure aActivateFindExecute(Sender: TObject);
    procedure aAddKAExecute(Sender: TObject);
    procedure aAddMatExecute(Sender: TObject);
    procedure aAddSvcExecute(Sender: TObject);
    procedure aBallanceExecute(Sender: TObject);
    procedure aCDelExecute(Sender: TObject);
    procedure aChangeEntExecute(Sender: TObject);
    procedure aCInsExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCUpdExecute(Sender: TObject);
    procedure aMatInfoExecute(Sender: TObject);
    procedure aNextAddrExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aShowRealPriceExecute(Sender: TObject);
    procedure btnCashDesksMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCashDesksMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnEntAddrMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPayMPersonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cbCurrPropertiesChange(Sender: TObject);
    procedure cbCurrPropertiesEditValueChanged(Sender: TObject);
    procedure cbPayCurrKeyPress(Sender: TObject; var Key: Char);
    procedure cbSelectPayPropertiesEditValueChanged(Sender: TObject);
    procedure cdsDetailCalcFields(DataSet: TDataSet);
    procedure chbPayClick(Sender: TObject);
    procedure chbPayKeyPress(Sender: TObject; var Key: Char);
    procedure chbPayPropertiesChange(Sender: TObject);
    procedure chbPostingPropertiesChange(Sender: TObject);
    procedure colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure cxDateEdit1PropertiesChange(Sender: TObject);
    procedure DataModified(Sender: TObject);
    procedure dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgWaybillDetCustomDrawColumnHeader(Sender: TObject; AColumn: TdxTreeListColumn; ACanvas: TCanvas; ARect: TRect; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ASorted: TdxTreeListColumnSort; var ADone: Boolean);
    procedure dbgWaybillDetDblClick(Sender: TObject);
    procedure dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
    procedure dsDetDataChange(Sender: TObject; Field: TField);
    procedure edDateKeyPress(Sender: TObject; var Key: Char);
    procedure edEntAddrEnter(Sender: TObject);
    procedure edEntAddrExit(Sender: TObject);
    procedure edEntAddrPropertiesChange(Sender: TObject);
    procedure edEntChange(Sender: TObject);
    procedure edKAAddrEnter(Sender: TObject);
    procedure edKAAddrExit(Sender: TObject);
    procedure edKAgentChange(Sender: TObject);
    procedure edKAgentKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edNum1PropertiesChange(Sender: TObject);
    procedure edPayNumChange(Sender: TObject);
    procedure edPaySummPropertiesChange(Sender: TObject);
    procedure edRatePropertiesChange(Sender: TObject);
    procedure edShipEntAddrEnter(Sender: TObject);
    procedure edShipEntAddrExit(Sender: TObject);
    procedure edShipEntChange(Sender: TObject);
    procedure edShipEntKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edShipKAAddrEnter(Sender: TObject);
    procedure edShipKAAddrExit(Sender: TObject);
    procedure edShipKAChange(Sender: TObject);
    procedure edTimePropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure lcbCashDesksEnter(Sender: TObject);
    procedure lcbPayMPersonEnter(Sender: TObject);
    procedure lcbPayMPersonExit(Sender: TObject);
    procedure lcbPersonNameKeyPress(Sender: TObject; var Key: Char);
    procedure lcbPersonNamePropertiesEditValueChanged(Sender: TObject);
    procedure lEntExItemClick(Sender: TObject; Index: Integer);
    procedure mdDetAfterDelete(DataSet: TDataSet);
    procedure mdDetAfterPost(DataSet: TDataSet);
    procedure mdMatsAfterDelete(DataSet: TDataSet);
    procedure mdMatsAfterEdit(DataSet: TDataSet);
    procedure mdMatsAfterPost(DataSet: TDataSet);
    procedure sbAddKAgentMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SetDefCurrCtrls;
    procedure srcEntDataChange(Sender: TObject; Field: TField);
    procedure srcShippersDataChange(Sender: TObject; Field: TField);

  private
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMDelete(var M: TMessage); message WM_DELETE;
    procedure WMSetText(var M: TMessage); message WM_SETTEXT;
    //Функция подсчёта суммы с НДС
    function GetSummWithNDS(PriceNDS, Amount, aNDS: Extended):Extended;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure SetAddrType(AButton: TssSpeedButton; AType: Integer);

  protected
    AllSummDef : Extended;
    CurrentNDS: Extended;
    defCurrID:integer;
    defCurrName, defCurrShortName:string;
    FContrDocID: Integer;
    FCurrBtn: TssSpeedButton;
    FCurrNum, FCurrPayNum: integer;
    FKAID: Integer;
    FLastGen: string;
    FPaySummChange:boolean;
    FRateDate: TDateTime;
    FRateID: integer;
    FWBOutID: Integer;
    oldkaid:integer;
    OldPayDocId:integer;
    PayDocChecked:boolean;
    PayDocDate:TDateTime;
    PayDocId:integer;
    prvDet: string;
    SummTaxAll: Extended;

    procedure SetKurs;
    procedure setid(const Value: integer); override;
    procedure UpdatePos; override;
    procedure SetParentName(const Value: string); override;
    function checkNum:boolean;
    procedure GetTaxes; virtual;
    procedure SaveTaxes(APosID: Integer); virtual;

  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
    procedure GetSummAll; override;
    procedure CreateFromWBOut(AID: Integer; var IDs, Svc: string);
  end;

var
  frmEditInvoice: TfrmEditInvoice;

//=================================================================================
implementation

uses
  prConst, ClientData, Login, prFun, fKAgent, ssFun, ShellAPI, StdConvs,
  EditPosition, prTypes, CurrencyEdit, ssCallbackConst, ssRegUtils, fMessageDlg,
  EditMaterials, ssStrUtil, KATurnover, ssBaseIntfDlg, okClasses,
  ssDateUtils, EditPositionSvc, udebug, okMoneyFun;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//Функция подсчёта суммы с НДС
//==============================================================================================
function TfrmEditInvoice.GetSummWithNDS(PriceNDS,Amount,aNDS:Extended):Extended;
  var
    pricenonds,summcurnonds,summnds:Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.GetSummWithNDS') else _udebug := nil;{$ENDIF}

  pricenonds := roundtoa(PriceNDS - NDSOut(PriceNDS,aNDS), -6);
  summcurnonds := roundtoa(amount * pricenonds, -2);
  summnds := roundtoa(GetNDS(summcurnonds, CurrentNDS), -2);
  result := summcurnonds + summnds;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.WMRefresh') else _udebug := nil;{$ENDIF}

  if M.LParam = 9
    then begin
      UpdatePos;
      GetSummAll;
      SelectFocusedNode;
    end
    else case TRefType(M.LParam) of
      rtFinances:
        if (M.WParam > 0) and (M.WParam < 1000000) then begin
          lcbPayType.KeyValue := 1;
          lcbCashDesks.KeyValue := M.WParam;
        end
        else begin
          lcbPayType.KeyValue := 2;
          lcbAccount.KeyValue := M.WParam - 1000000;
        end;

      rtCashDesks:
        begin
          DSRefresh(cdsCashDesks, 'cashid', 0);
          lcbCashDesks.KeyValue := M.WParam;
          lcbCashDesks.SelStart := 0;
        end;

      rtPDIn:
        begin
          edPayNum.PayDocID := M.WParam;
        end;

      rtPersons:
        begin
          DSRefresh(cdsPayMPersons, 'KAID', M.WParam);
          lcbPayMPerson.KeyValue := M.WParam;
          lcbPayMPerson.SelStart := 0;
        end;
      end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditInvoice.DelFromWMat(WBILLID:integer):boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.DelFromWMat') else _udebug := nil;{$ENDIF}

  result := False;

  with newDataSet.Create(nil) do
  try
    TrStart;

    try
      ProviderName := 'pWMatTurn_Del';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := WBILLID;
      Execute;
      ProviderName := 'pWMat_Del';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := WBILLID;
      Execute;

      Result := TrCommit;

    finally
      Free;
    end;

  except
    on e:exception do TrRollback;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
function TfrmEditInvoice.AddToWMat(WBILLID:integer):boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.AddToWMat') else _udebug := nil;{$ENDIF}

  result := False;

  with newDataSet do
  try

    TrStart;

    try
      RemoteServer := dmData.SConnection;
      ProviderName := 'pWMatTurn_Del';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := WBILLID;
      Execute;

      ProviderName := 'pWMat_Del';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := WBILLID;
      Execute;

      ProviderName := 'pWMat_Ins2';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := WBILLID;
      Execute;

      ProviderName := 'pWMatTurn_Ins';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := WBILLID;
      Execute;

      Result := TrCommit;

    finally
      Free;
    end;

  except
    on e:exception do TrRollback;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditInvoice.NextIdMat:Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.NextIdMat') else _udebug := nil;{$ENDIF}

  try
    with newDataSet do
      try
        ProviderName := 'pWaybillDet_Max';
        Open;
        Result := Fields[0].AsInteger+1;
        Close;

      finally
        Free;
      end;

  except
    Result := -1;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditInvoice.checkNum:boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.checkNum') else _udebug := nil;{$ENDIF}

  Result := false;

  with newDataSet do
   try
     ProviderName := 'pWaybillNum_Get';
     FetchParams;
     Params.ParamByName('NUM').AsString := edNum1.Text;
     Open;
     if  Fields[0].AsInteger > 0
       then Result := false
       else Result := true;
     Close;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.setid(const Value: integer);
 var
   FItem: TcxTreeListNode;
   FTaxSumm, FPosNDS, FSumWONDS, FNDS, FPrice: Extended;
   APreffix, ASuffix: string;
   tmp: integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditInvoice.setid') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  CurrentNDS := NDS;
  if not cdsCurr.Active then begin
    cdsCurr.Open;
    if cdsCurr.Locate('def', 1, []) then cbPayCurr.KeyValue := cdsCurr.fieldbyname('currid').AsInteger;
  end;
  cdsPayType.Open;

  edDate.Date := OnDate;
  edTime.Time := Time;

  mdDet.Open;
  Fid := Value;
  edEnt.KAID := 0;
  edEnt.KAID := CurrEnt.KAID;
  cdsEnts.Locate('kaid', CurrEnt.KAID, []);
  edKAgent.KAID := 0;

  with newDataSet do
    try
      //Установка номера по умолчанию
      if ((Value = 0) or IsPattern) and InvoiceAutoNum then begin
        APreffix := InvoicePrefix;
        ASuffix := InvoiceSuffix;
        FLastGen := '';

        FCurrNum := GetDocNumEx(dmData.SConnection, dtInvoice, 1, APreffix, ASuffix,
                    FLastGen, cdsEnts.FieldByName('kaid').AsInteger);

        edNum1.Text := APreffix + IntToStr(FCurrNum) + ASuffix;
      end
      else edNum1.Text := '';

      if Value <> 0 then begin
        Self.Caption := rs('fmInvoices', 'TitleEdit');
        ProviderName := 'pInvoices_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := Value;
        Open;
        edKAgent.Tag := 1;
        edShipEnt.Tag := 1;

        if not IsEmpty then begin
          if not IsPattern then begin
            edNum1.Text := fieldbyname('num').AsString;
            eddate.Date := fieldbyname('ondate').AsDateTime;
            edTime.Time := fieldbyname('ondate').AsDateTime;
          end;

          cdsPayType.Locate('ptypeid', lcbPayType.KeyValue,[]);

          edKAgent.KAID := fieldbyname('kaid').AsInteger;
          edKAgent.Obj.AddrID := FieldByName('kaaddrid').AsInteger;

          edEnt.KAID := FieldByName('entid').AsInteger;
          edEnt.Obj.AddrID := FieldByName('entaddrid').AsInteger;

          edShipEnt.KAID := FieldByName('shipentid').AsInteger;
          edShipEnt.Obj.AddrID := FieldByName('shipentaddrid').AsInteger;

          edShipKA.KAID := FieldByName('shipkaid').AsInteger;
          edShipKA.Obj.AddrID := FieldByName('shipkaaddrid').AsInteger;

          oldkaid := fieldbyname('kaid').AsInteger;

          edEntChange(edEnt);
          edShipEntChange(edShipEnt);
          edKAgentChange(edKAgent);
          edShipKAChange(edShipKA);

          if not FieldByName('personid').IsNull
          then begin
            cdsShippers.Locate('kaid', FieldByName('personid').AsInteger, []);
            lcbShipper.KeyValue := FieldByName('personid').AsInteger;
            lShipper.Text := cdsShippers['job'];
          end
          else begin
            lcbShipper.Clear;
            lShipper.Text := '';
          end;

        end;
        Close;

        ProviderName := prvDet;// чтение позиций в mdDet
        FetchParams;
        Params.ParamByName('WBILLID').AsInteger := fid;
        Open;
        mdDet.LoadFromDataSet(Fields[0].DataSet);
        //NumMats;
        Close;

        ProviderName := 'pWaybillDet_GetTaxes';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := Value;
        Open;

        while not Eof do begin
          if mdDet.Locate('posid', FieldByName('posid').AsInteger, []) then begin
            FPrice := mdDet.FieldByName('price').AsFloat * mdDet.FieldByName('onvalue').AsFloat;
            FPosNDS := mdDet.FieldByName('nds').AsFloat;
            NDSCalc(mdDet.FieldByName('amount').AsFloat, FPrice, FPosNDS, 1, FSumWONDS, FNDS);
            FSumWONDS := RoundToA(RoundToA(FSumWONDS + FNDS, -2) - RoundToA(FNDS, -2), -2);
            FTaxSumm := RoundToA(FSumWONDS * FieldByName('onvalue').AsFloat / 100, -2);
            mdDet.Edit;
            mdDet.FieldByName('Tax' + FieldByName('taxid').AsString).AsFloat := FieldByName('onvalue').AsFloat;
            mdDet.FieldByName('TaxRate' + FieldByName('taxid').AsString).AsFloat := FTaxSumm;
            mdDet.Post;
          end;
          Next;
        end;
        Close;

        mdDet.First;
        while not mdDet.Eof do begin
          UpdatePos;
          mdDet.Next;
        end;

        if not mdDet.IsEmpty then mdDet.First;

        SelectFocusedNode;

          if not IsPattern then begin
            ProviderName := 'pWayBillPay_Get';// Чтение платежа
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := fid;
            Open;

            if not IsEmpty then begin
              chbPay.Enabled := False;
              chbPay.Checked := true;
              edPayNum.Enabled := False;
              cbSelectPay.Enabled := False;
              cbSelectPay.ItemIndex := 1;
              edPayNum.PayDocID := FieldByName('paydocid').AsInteger;

            end//if not IsEmpty
            else begin
              PayDocChecked := False;
              PayDocId := 0;
              chbPay.Enabled := False;
              chbPay.Checked := False;
              chbPay.Enabled := True;
              edPayNum.Text := '';
              edPaySumm.Tag := 1;
              edPaySumm.Value := 0;
              edPaySumm.Tag := 0;
            end;//else
            Close;
          end;
        if IsPattern then FID := 0;
      end//if Value<>0
      else Self.Caption := rs('fmInvoices', 'TitleAdd');

      FModified := False;
      FPosModified := False;
      FGridRefresh := True;
      FPayDocModified := False;

    finally
      Free;
    end;

  if Value = 0 then begin
    with cdsShippers do if Locate('userid', UserID, []) then lcbShipper.ItemIndex := FieldByName('kaid').AsInteger;
  end;

  if UserID <> 0 then begin
    lcbShipper.Enabled := False;
    if Value <> 0 then  // editing enabled only for document owner or admin
      with cdsPayMPersons do
        if Locate('userid', UserID, []) and (lcbShipper.KeyValue <> FieldByName('kaid').AsInteger)
        then EditingDisabled := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
   NewRecord: boolean;
   BM:TBookmark;
   tmpid:integer;
   FPosID, intTmp, PayDocID: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditInvoice.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if (ModalResult = mrCancel) and (FID > 0) and CheckModified then ModalResult := mrOK;

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;
    //if not CheckDocDate(edDate.Date) then Exit;

    with newDataSet do begin
      try

        TrStart;

        try
          Screen.Cursor := crSQLWait;
          NewRecord := (ID = 0);

          if NewRecord then FID := GetMaxID(dmData.SConnection, 'waybilllist', 'wbillid');

          if NewRecord
            then ProviderName := 'pWaybill_InsEx'
            else ProviderName := 'pWaybill_UpdEx';

          FetchParams;
          Params.ParamByName('WBILLID').AsInteger := FID;
          Params.ParamByName('NUM').AsString := edNum1.Text;
          Params.ParamByName('DEFNUM').AsInteger := 0;
          Params.ParamByName('ONDATE').AsDateTime := edDate.Date+edTime.Time;
          Params.ParamByName('KAID').AsInteger := edKAgent.KAID;
          Params.ParamByName('CURRID').AsInteger := BaseCurrID;
          Params.ParamByName('ATTNUM').AsString := '';
          Params.ParamByName('ATTDATE').AsDate := 0;
          Params.ParamByName('REASON').AsString := '';
          Params.ParamByName('notes').AsString := '';

          if lcbShipper.KeyValue > 0 then Params.ParamByName('PERSONID').asInteger := lcbShipper.KeyValue;

          Params.ParamByName('CHECKED').AsInteger := 0;
          Params.ParamByName('WTYPE').AsInteger := -9;
          Params.ParamByName('DELETED').AsInteger := 0;
          Params.ParamByName('SUMMALL').AsFloat := RoundToA(ALLSUMM, -2);
          Params.ParamByName('SUMMINCURR').AsFloat := AllSummCurr;
          Params.ParamByName('NDS').AsFloat := roundtoa(CurrentNDS,-2);
          Params.ParamByName('RECEIVED').AsString := '';
          Params.ParamByName('TODATE').DataType := ftDateTime;
          Params.ParamByName('TODATE').Clear;
          Params.ParamByName('entid').AsInteger := edEnt.KAID;

          Execute;//Записали в waybilllist

          if not NewRecord then begin
            ProviderName := 'pInvoiceParams_Del';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FID;
            Execute;
          end;

          ProviderName := 'pInvoiceParams_Ins';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := FID;
          Params.ParamByName('shipentid').AsInteger := edShipEnt.KAID;
          Params.ParamByName('shipkaid').AsInteger := edShipKA.KAID;

          if edEnt.Obj.AddrID = 0 then begin
            Params.ParamByName('entaddrid').DataType := ftInteger;
            Params.ParamByName('entaddrid').Clear;
          end
          else Params.ParamByName('entaddrid').AsInteger := edEnt.Obj.AddrID;

          if edKAgent.Obj.AddrID = 0 then begin
            Params.ParamByName('kaaddrid').DataType := ftInteger;
            Params.ParamByName('kaaddrid').Clear;
          end
          else Params.ParamByName('kaaddrid').AsInteger := edKAgent.Obj.AddrID;

          if edShipEnt.Obj.AddrID = 0 then begin
            Params.ParamByName('shipentaddrid').DataType := ftInteger;
            Params.ParamByName('shipentaddrid').Clear;
          end
          else Params.ParamByName('shipentaddrid').AsInteger := edShipEnt.Obj.AddrID;

          if edShipKA.Obj.AddrID = 0 then begin
            Params.ParamByName('shipkaaddrid').DataType := ftInteger;
            Params.ParamByName('shipkaaddrid').Clear;
          end
          else Params.ParamByName('shipkaaddrid').AsInteger := edShipKA.Obj.AddrID;

          Execute;

          if FPosModified then begin // Запись позиций в накладную
            ProviderName := 'pWaybillDet_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := ID;
            Execute;

            ProviderName := 'pWaybillSvc_Del';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FID;
            Execute;

            BM := mdDet.GetBookmark;
            mdDet.DisableControls;
            mdDet.First; // Запись позиций из mdDet в waybilldet
            while not mdDet.Eof do begin
              if mdDet.FieldByName('postype').AsInteger = 0 then begin
                ProviderName := 'pWaybillDet_Ins';
                FetchParams;
                FPosID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
                Params.ParamByName('POSID').AsInteger := FPosID;

                if FPosID < 0 then raise Exception.Create(rs(ParentNameEx, 'ErrorAddPos'));

                tmpid := Params.ParamByName('POSID').AsInteger;
                Params.ParamByName('WBILLID').AsInteger := FID;
                Params.ParamByName('MATID').AsInteger := mdDet.fieldbyname('MATID').AsInteger;
                Params.ParamByName('WID').AsInteger := mdDet.fieldbyname('WID').AsInteger;
                Params.ParamByName('AMOUNT').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('AMOUNT').AsString), MatDisplayDigits);
                Params.ParamByName('PRICE').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('PRICE').AsString),-6);
                Params.ParamByName('DISCOUNT').DataType := ftFloat;
                Params.ParamByName('DISCOUNT').Clear;
                Params.ParamByName('NDS').AsFloat := StrToFloat(mdDet.FieldByName('nds').AsString);
                Params.ParamByName('CurrId').AsInteger := BaseCurrID;
                Params.ParamByName('onvalue').AsFloat := 1;
                Params.ParamByName('OnDate').AsDateTime := edDate.Date+edTime.Time;
                Params.ParamByName('PTypeID').DataType := ftInteger;
                Params.ParamByName('PTypeID').Clear;
                Params.ParamByName('NUM').AsInteger := mdDet.RecNo;

                Execute;//Записываем очередную позицию
                //write s/n

                SaveTaxes(FPosID);

                if (mdDet.FieldByName('producer').AsString <> '') or (mdDet.FieldByName('certnum').AsString <> '')
                    or (mdDet.FieldByName('gtd').AsString <> '') or (mdDet.FieldByName('certdate').AsDateTime <> 0)
                then begin
                  ProviderName := 'pWaybillDetAP_Ins';
                  FetchParams;
                  Params.ParamByName('posid').AsInteger := FPosID;
                  Params.ParamByName('producer').AsString := mdDet.FieldByName('producer').AsString;
                  Params.ParamByName('certnum').AsString := mdDet.FieldByName('certnum').AsString;
                  Params.ParamByName('gtd').AsString := mdDet.FieldByName('gtd').AsString;

                  if mdDet.FieldByName('certdate').AsDateTime = 0 then begin
                    Params.ParamByName('certdate').DataType := ftDateTime;
                    Params.ParamByName('certdate').Clear;
                  end
                  else Params.ParamByName('certdate').AsDateTime := mdDet.FieldByName('certdate').AsDateTime;

                  Execute;
                end;
              end
              else begin
                ProviderName := 'pWaybillSvc_Ins';
                FetchParams;
                Params.ParamByName('posid').AsInteger := GetMaxID(dmData.SConnection, 'waybillsvc', 'posid');
                Params.ParamByName('wbillid').AsInteger := FID;
                Params.ParamByName('svcid').AsInteger := mdDet.fieldbyname('matid').AsInteger;
                Params.ParamByName('amount').AsFloat := RoundToA(StrToFloat(mdDet.fieldbyname('amount').AsString), MatDisplayDigits);
                Params.ParamByName('price').AsFloat := StrToFloat(mdDet.fieldbyname('price').AsString);
                Params.ParamByName('norm').AsFloat := 1;
                Params.ParamByName('discount').AsFloat := StrToFloat(mdDet.fieldbyname('discount').AsString);
                Params.ParamByName('nds').AsFloat := StrToFloat(mdDet.fieldbyname('NDS').AsString);
                Params.ParamByName('currid').AsInteger := BaseCurrID;
                Params.ParamByName('num').AsInteger := mdDet.RecNo;

                if not mdDet.FieldByName('personid').IsNull
                  then Params.ParamByName('personid').AsInteger := mdDet.FieldByName('personid').AsInteger
                  else begin
                    Params.ParamByName('personid').DataType := ftInteger;
                    Params.ParamByName('personid').Clear;
                  end;

                Execute;
              end;

              mdDet.Next;
            end;//while not mdDet.Eof

            mdDet.GotoBookmark(BM);
            FreeBookmark(BM);
            mdDet.EnableControls;

            FPosModified := false;//Сбрасываем флаг изменения позиций
          end;//if FPosModified

          if (FWBOutID > 0) and NewRecord then begin
            ProviderName := 'pDocsRel_Invoice_WB_Ins';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FWBOutID;
            Params.ParamByName('invid').AsInteger := FID;
            Execute;
          end;

          if FPayDocModified then begin//Если платёж изменён, то записываем его
            if chbPay.Checked then begin
              if (edPayNum.PayDocID = 0) then begin
                PayDocId := GetMaxID(dmData.SConnection, 'paydoc', 'paydocid');
                ProviderName := 'pPayDoc_Ins';
                FetchParams;
                Params.ParamByName('withnds').AsInteger := 1;
                Params.ParamByName('doctype').AsInteger := -1;
                Params.ParamByName('notes').AsString := '';
                PayDocDate := edDate.Date + Time;
                Params.ParamByName('reason').AsString := '';

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

                Params.ParamByName('ondate').AsDateTime := PayDocDate;
                Params.ParamByName('kaid').AsInteger := edKAgent.KAID;
                Params.ParamByName('paydocid').AsInteger := PayDocId;
                Params.ParamByName('docnum').AsString := edPayNum.Text;
                Params.ParamByName('ptypeid').AsInteger := lcbPayType.KeyValue;
                Params.ParamByName('currid').AsInteger := cbPayCurr.KeyValue;
                Params.ParamByName('onvalue').AsFloat := GetCurrencyRateEx(dmData.SConnection, cbPayCurr.KeyValue, edDate.Date);
                Params.ParamByName('total').AsFloat := edPaySumm.Value;
                Params.ParamByName('checked').AsInteger := 1;
                Params.ParamByName('ctypeid').AsInteger := 1;

                Execute;// Записываем изменения в paydoc
              end
              else PayDocID := edPayNum.PayDocID;

              if chbPay.Enabled or NewRecord then begin
                ProviderName := 'pWaybillPay_Ins';
                FetchParams;
                Params.ParamByName('WBILLID').AsInteger := FID;
                Params.ParamByName('paydocid').AsInteger := PayDocId;
                Execute;
              end;
            end;

            FPayDocModified := false;
          end;//if FPayDocModified}

          FModified := False;//флаг изменения документа false
          TrCommit;

          if ModalResult = mrYes then begin
            if NewRecord then begin
              edDate.Date := Date;
              edKAgent.KAID := 0;
              mdDet.Close;
              ID := 0;

              if InvoiceAutoNum
                then edKAgent.Editor.SetFocus
                else edNum1.SetFocus;

            end//if NewRecord
            else begin
              {if chbPosting.Checked
              then}
                CanClose := true
              {else begin
                if PDInAutoNum and (OldPayDocID = 0) and chbPay.Checked
                  then FCurrPayNum := GetDocNum(dmData.SConnection, dtPDIn, 1);
                OldPayDocId := PayDocID;
              end;
              }
            end//else NewRecord
          end // if ModalResult = mrYes
          else CanClose := True;

          FGridRefresh := true;

          FPaySummChange := True;
          if FWBOutID = 0
            then SendMessage(MainHandle, WM_REFRESH, ID, 0)
            else begin
              SendMessage(MainHandle, WM_REFRESH, 0, 0);
              RefreshFun('TfmInvoices', 0);
            end;

          frmMainForm.ExecRefresh('TfmPayDoc', 0);

          if RefreshAllClients then begin
          end;

        finally
          Free;
          Screen.Cursor := crDefault;
        end;

      except
        on e:exception do begin
          TrRollback;
          raise;
        end;
      end;
    end;// with TClientDataSet.Create(nil)
  end// if ModalResult in [mrOK, mrYes]
  else begin
    if FLastGen = '' then begin
      if GetDocNum(dmData.SConnection, dtInvoice, 0) = FCurrNum
        then GetDocNum(dmData.SConnection, dtInvoice, -1);
    end
    else begin
      if Gen_ID(dmData.SConnection, FLastGen, 0) = FCurrNum
        then Gen_ID(dmData.SConnection, FLastGen, -1);
    end;

    if GetDocNum(dmData.SConnection, dtPDIn, 0) = FCurrPayNum
      then GetDocNum(dmData.SConnection, dtPDIn, -1);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  var
    FPaySum: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  if (chbPay.Checked)and(not PayDocChecked) then begin
    try
      FPaySum := StrToFloat(edPaySumm.EditingText);
    except
      FPaySum := 0;
    end;
  end
  else begin
    FPaySum := 1;
    lcbPayType.Enabled := false;
    lPayMPerson.Enabled := false;
    lcbPayMPerson.Enabled := false;
    aPayMPersons.Enabled := false;
    lPaySumm.Enabled := false;
    lPayCurr.Enabled := false;
    lPayType.Enabled := false;
    btnPayMPerson.Enabled := False;
    edPaySumm.Enabled := False;
    edPayNum.Enabled := false;
    lcbCashDesks.Enabled := False;
    lcbAccount.Enabled := False;
    lAcc.Enabled := False;
    lCashDesks.Enabled := False;
    btnCashDesks.Enabled := False;
    cbPayCurr.Enabled := false;
    btnFinPay.Enabled := False;
  end;

 if FGridRefresh then
   begin
     dbgWaybillDet.BeginUpdate;

     try
       GetSummAll;
       if (not PayDocChecked)and(chbPay.Checked)and(not FPaySummChange)and(dbgWaybillDet.Tag<>0) then
       begin
         edPaySumm.Tag := 1;
         edPaySumm.Value := roundtoa(ALLSUMM,-2);
         edPaySumm.Tag := 0;
       end;

       dbgWaybillDet.Tag := dbgWaybillDet.Tag+1;

     finally
       dbgWaybillDet.EndUpdate;
     end;

   end;

  lSummCurr.Visible := False;
  lTotalCurr.Visible := False;

  aOk.Enabled := (trim(edNum1.Text)<>'')
     and (edDate.Text<>'') and (edKAgent.KAID>0) and (edEnt.KAID > 0) and (edShipEnt.KAID > 0) and (edShipKA.KAID > 0)
     and (not mdDet.IsEmpty)
     and ((chbPay.Checked and (FPaySum > 0) and (Trim(edPayNum.Editor.EditingText) <> '')) or not chbPay.Checked);

  aSelectAll.Enabled := not mdDet.IsEmpty;
  aApply.Enabled := aOk.Enabled and (FModified or FPosModified or FPayDocModified);

  aCIns.Enabled := True;
  aCDel.Enabled := not mdDet.IsEmpty;
  aCUpd.Enabled := aCDel.Enabled and (dbgWaybillDet.SelectedCount = 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.DataModified') else _udebug := nil;{$ENDIF}

  FPosModified := True;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    aAddKA.Hint := GetRS('fmWaybill', 'KAAdd');
    aAddMat.Caption := GetRS('fmWaybill', 'MatName');
    aAddSvc.Caption := GetRS('fmWaybill', 'SvcV');
    aApply.Caption := GetRS('Common', 'Apply');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aCDel.Caption := GetRS('Common', 'Del');
    aCDel.Hint := GetRS('fmWaybill', 'DelPos');
    aCIns.Caption := GetRS('Common', 'Add');
    aCIns.Hint := GetRS('fmWaybill', 'NewPos');
    aCUpd.Caption := GetRS('Common', 'Properties');
    aCUpd.Hint := GetRS('fmWaybill', 'EditPos');
    aMatInfo.Caption := GetRS('fmWaybill', 'MatInfo');
    aOK.Caption := GetRS('Common', 'OK');
    aSelectAll.Caption := GetRS('Common', 'SelectAll');
    aShowRealPrice.Caption := GetRS('fmWaybill', 'ShowRealPrice');
    btnBallance.Hint := GetRS('fmWaybill', 'KABallance');
    btnMatInfo.Hint := GetRS('fmWaybill', 'MatInfo');
    btnPrint.Hint := GetRS('fmWaybill', 'PrintWB');
    chbPay.Properties.Caption := GetRS('fmInvoices', 'Pay');

    colExSize.Caption := GetRS('fmInvoices', 'ExSize');
    colCountry.Caption := GetRS('fmInvoices', 'Country');
    colGTD.Caption := GetRS('fmInvoices', 'GTD');
    colNDS.Caption := GetRS('fmInvoices', 'NDS');
    colNDSRate.Caption := GetRS('fmInvoices', 'NDSRate');
    colPriceWONDS.Caption := GetRS('fmInvoices', 'Price');
    colSummDef.Caption := GetRS('fmInvoices', 'SummWithNDS');
    colSummWONDS.Caption := GetRS('fmInvoices', 'SummWONDS');

    edEnt.InitRes;
    edEnt.Caption.Caption := GetRS('fmInvoices', 'Saler') + ':';

    edFind.InitRes;

    edKAgent.InitRes;
    edKAgent.Caption.Caption := GetRS('fmInvoices', 'Customer') + ':';

    edShipEnt.InitRes;
    edShipEnt.Caption.Caption := GetRS('fmInvoices', 'ShipEnt') + ':';

    edShipKA.InitRes;
    edShipKA.Caption.Caption := GetRS('fmInvoices', 'ShipKA') + ':';

    gbHeader.Caption := ' ' + GetRS('fmWaybill', 'MainInfo') + ' ';
    gbPos.Caption := ' ' + GetRS('fmWaybill', 'Positions') + ' ';
    
    lAcc.Caption := GetRS('fmPayDoc', 'Account') + ':';
    lCashDesks.Caption := GetRS('fmPayDoc', 'CashDesk') + ':';
    lEmployee.Caption := GetRS('fmInvoices', 'Employee') + ':';
    lEmployeeTitle.Caption := GetRS('Common', 'EmployeeTitle') + ':';
    lEntEx.Hint := GetRS('fmWaybill', 'ChangeEnt') + ' (' + ShortCutToText(aChangeEnt.ShortCut) + ')';
    lEntAddr.Caption := GetRS('Common', 'Address') + ':';
    lKAAddr.Caption := GetRS('Common', 'Address') + ':';
    lNum.Caption := GetRS('fmWaybill', 'Num') + ':';
    lOndate.Caption := GetRS('fmWaybill', 'OnDate') + ':';
    lShipEntAddr.Caption := GetRS('Common', 'Address') + ':';
    lShipKAAddr.Caption := GetRS('Common', 'Address') + ':';
    lTot.Caption := GetRS('fmWaybill', 'withNDS') + ':';
    lTotal.Caption := GetRS('fmWaybill', 'TotalIn') + ' ' + BaseCurrName;
    lTotNDS.Caption := GetRS('fmWaybill', 'NDS') + ':';
    lTotNDSOut.Caption := GetRS('fmWaybill', 'outNDS') +':';

    with cbSelectPay.Properties do begin
      Items.Clear;
      Items.Add(GetRS('fmInvoices', 'NewPay'));
      Items.Add(GetRS('fmInvoices', 'SelectPay'));
      cbSelectPay.ItemIndex := 0;
    end;

  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.aCDelExecute(Sender: TObject);
  var
    FItem: TListItem;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.aCDelExecute') else _udebug := nil;{$ENDIF}

  if ((dbgWaybillDet.SelectedCount = 1) and (mrYes <> ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo])))
     or
     ((dbgWaybillDet.SelectedCount > 1) and (mrYes <> ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [dbgWaybillDet.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo])))
  then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  Screen.Cursor := crSQLWait;
  mdDet.DisableControls;
  try
    for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
      if mdDet.Locate('posid', dbgWaybillDet.SelectedNodes[i].Values[colPosID.Index], [])
        then mdDet.Delete;
    end;
    LocateAfterDel;
    FGridRefresh := True;

  finally
    Screen.Cursor := crDefault;
    mdDet.EnableControls;
    SelectFocusedNode;
    RealignGrid;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edNum1PropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edNum1PropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  FPayDocModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.cxDateEdit1PropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.cxDateEdit1PropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := True;
  FPosModified := True;
  SetKurs;
  FGridRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.chbPostingPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.chbPostingPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  FPayDocModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfrmEditInvoice.SetKurs;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.SetKurs') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditInvoice.mdMatsAfterPost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.mdMatsAfterPost') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.mdMatsAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.mdMatsAfterDelete') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.mdMatsAfterEdit(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.mdMatsAfterEdit') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  btnAdd.ImageIndex := 0;
  btnProps.ImageIndex := 1;
  btnDel.ImageIndex := 2;
  FormResize(Self);
  Screen.Cursor := crDefault;
  edPayNum.AdjustCtrls;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.SetDefCurrCtrls;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.SetDefCurrCtrls') else _udebug := nil;{$ENDIF}

  colSummDef.Caption := rs(ParentNameEx, 'SummIn')+' '+BaseCurrName;
  colSummCurr.Caption := rs(ParentNameEx, 'SummIn')+' '+cbCurr.EditText;
  if BaseCurrID <> cbCurr.KeyValue
    then colSummDef.Visible := true
    else colSummDef.Visible := false;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;


//==============================================================================================
procedure TfrmEditInvoice.edTimePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edTimePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.aCUpdExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.aCUpdExecute') else _udebug := nil;{$ENDIF}

  case mdDet.FieldByName('postype').AsInteger of
    0:
      with TfrmEditPosition.Create(frmEditPosition) do
      try
        ParentNameEx := 'fmWaybill';
        IsInvoice := True;
        OnDate := Self.OnDate;
        dbgWaybillDet.SetFocus;
        PosNDS := CurrentNDS;
        ParentHandle := Self.Handle;
        CurrID := BaseCurrID;
        Kurs := 1;
        parentMdDet := mdDet; //Tag := integer(mdDet);
        CurrName := cdsCurr.fieldbyname('shortname').AsString;
        CurrDefName := BaseCurrName;
        CurrShortName := defCurrShortName;
        DocType := dtInvoice;
        KAType := edKAgent.Obj.KType;
        id := mdDet.FieldByName('posid').AsInteger;
        Caption := rs(ParentNameEx, 'PosEdit');
        Screen.Cursor := crDefault;
        ShowModal;

      finally
        Free;
      end;

    1:
      with TfrmEditPositionSvc.Create(nil) do
      try
        ParentHandle := Self.Handle;
        ParentNameEx := Self.ParentNameEx;
        OnDate := Int(edDate.Date) + Frac(edTime.Time);
        FRateValue := 1;
        CurrID := BaseCurrID;
        mdDet := Self.mdDet;
        PosNDS := StrToFloat(mdDet.fieldbyname('NDS').AsString);
        ID := Self.mdDet.FieldByName('posid').AsInteger;
        ShowModal;

      finally
        Free;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfrmEditInvoice.FormClose(Sender: TObject; var Action: TCloseAction);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.FormClose') else _udebug := nil;{$ENDIF}

  mdDet.Close;
  cdsCurr.Close;
  cdsPayType.Close;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.cdsDetailCalcFields(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.cdsDetailCalcFields') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//Запись в mdDet NDS и Currid
//==============================================================================================
procedure TfrmEditInvoice.mdDetAfterPost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.mdDetAfterPost') else _udebug := nil;{$ENDIF}

  FPosModified := true;
  FGridRefresh := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.mdDetAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.mdDetAfterDelete') else _udebug := nil;{$ENDIF}

  //NumMats;
  FPosModified := true;
  FGridRefresh := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edDateKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edDateKeyPress') else _udebug := nil;{$ENDIF}

  if key = #32
    then edDate.DroppedDown := True
    else GoNext(Sender, Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.aAddKAExecute(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.aAddKAExecute') else _udebug := nil;{$ENDIF}

  if edKAgent.Editor.Focused then edKAgent.ShowRef
  else if edEnt.Editor.Focused then edEnt.ShowRef
  else if edShipKA.Editor.Focused then edShipKA.ShowRef
  else if edShipEnt.Editor.Focused then edShipEnt.ShowRef
  else if edPayNum.Editor.Focused then edPayNum.ShowRef
  else if FCurrCtrl = lcbPayType then ShowFinance(Self, Date, 1)
  else if FCurrCtrl = lcbCashDesks then begin
    try
      aid := lcbCashDesks.KeyValue;
    except
      aid := 0;
    end;
    lcbCashDesks.SetFocus;
    ShowModalRef(Self, rtCashDesks, vtCashDesks, 'TfmCashDesks', Self.OnDate, aid);
  end
  else if FCurrCtrl = lcbPayMPerson then begin
    try
      aid := lcbPayMPerson.KeyValue;
    except
      aid := 0;
    end;
    lcbPayMPerson.SetFocus;
    lcbPayMPerson.Tag := 1;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
    lcbPayMPerson.Tag := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.aShowRealPriceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.aShowRealPriceExecute') else _udebug := nil;{$ENDIF}

  try
    aShowRealPrice.Checked := not aShowRealPrice.Checked;
    dbgWaybillDet.Repaint;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.FormResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.FormResize') else _udebug := nil;{$ENDIF}

  RealignGrid;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.chbPayPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.chbPayPropertiesChange') else _udebug := nil;{$ENDIF}

  // Заполнение полей
  if chbPay.Enabled then begin
    if cbSelectPay.ItemIndex = 0 then begin
      if chbPay.Checked then begin
        if PDInAutoNum and (OldPayDocID = 0) then begin
          FCurrPayNum := GetDocNum(dmData.SConnection,dtPDIn,1);
          edPayNum.Text := PDInPrefix+IntToStr(FCurrPayNum)+PDInSuffix;
        end
        else edPayNum.Text := FPayNum;

        edPaySumm.Tag := 1;
        edPaySumm.Value := roundtoa(AllSummCurr, -2);
        edPaySumm.Tag := 0;
      end //if (chbPay.Checked)
      else begin
        if PDInAutoNum and (OldPayDocID = 0) then begin
          if GetDocNum(dmData.SConnection, dtPDIn, 0) = FCurrPayNum
            then GetDocNum(dmData.SConnection, dtPDIn, -1);
        end;
        edPayNum.Text := '';
        edPaySumm.Tag := 1;
        edPaySumm.Value := 0;
        edPaySumm.EditText := '';
        edPaySumm.Tag := 0;
        FPaySummChange := false;
      end;//else
    end;

    FPayDocModified := true;
  end;//if chbPay.Enabled

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edPaySummPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edPaySummPropertiesChange') else _udebug := nil;{$ENDIF}

  FPayDocModified := true;
  if edPaySumm.Tag = 0 then FPaySummChange := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.cbCurrPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.cbCurrPropertiesChange') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditInvoice.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.FormCreate') else _udebug := nil;{$ENDIF}
   
  GetTaxes;

  inherited;

  prvDet := 'pWaybillDet_GetOutEx';
  FCurrPayNum := -1;
  CurKurs := 1;
  cbCurr.Properties.OnChange := nil;
  btnFinPay.ImageIndex := 44;

  btnEntAddr.Tag := Integer(edEntAddr);
  edEntAddr.Tag := Integer(edEnt);

  btnShipEntAddr.Tag := Integer(edShipEntAddr);
  edShipEntAddr.Tag := Integer(edShipEnt);

  btnKAAddr.Tag := Integer(edKAAddr);
  edKAAddr.Tag := Integer(edKAgent);
  btnShipKAAddr.Tag := Integer(edShipKAAddr);
  edShipKAAddr.Tag := Integer(edShipKA);

  edKAgent.SetLng;
  edFind.SetLng;

  cbCurr.KeyValue := BaseCurrID;

  cdsPayMPersons.Open;
  lcbPayMPerson.KeyValue := -1;
  lcbPayMPerson.Text := '';

  try
    cdsShippers.Open;
  except
  end;

  lcbShipper.KeyValue := -1;
  lcbShipper.Text := '';

  edKAgent.LoadFromRegistry(MainRegKey + '\' + Self.Name + '\KAFind');
  edFind.LoadFromRegistry(MainRegKey + '\' + Self.Name + '\PosFind');


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.WMDelete(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.WMDelete') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
   rtPersons: DSRefresh(cdsPersonName, 'kaid', 0);

   //rtKAgent: DSRefresh(cdsKAgent, 'kaid', 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.lcbPersonNameKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.lcbPersonNameKeyPress') else _udebug := nil;{$ENDIF}

  if dbgWaybillDet.Enabled then begin
    if Key = #13 then begin
      Key := #0;
      dbgWaybillDet.SetFocus;
    end;
  end
  else GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.cbPayCurrKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.cbPayCurrKeyPress') else _udebug := nil;{$ENDIF}

  if Key = #13 then begin
   Key := #0;
   if btnOk.Enabled
     then btnOk.SetFocus
     else btnCancel.SetFocus;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.dsDetDataChange(Sender: TObject; Field: TField);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.dsDetDataChange') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.BeginUpdate;
  try
    FormResize(Self);
  finally
    dbgWaybillDet.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditInvoice.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.FormDestroy') else _udebug := nil;{$ENDIF}

  edKAgent.SaveToRegistry(MainRegKey + '\' + Self.Name + '\KAFind');
  edFind.SaveToRegistry(MainRegKey + '\' + Self.Name + '\PosFind');

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  edFind.SetLng;
  edKAgent.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.aPrintExecute(Sender: TObject);
  var
    FSumWONDS, FNDS, FSumWithNDS, FAmount: Extended;
    cdsT: TssClientDataSet;
    i: Integer;
    SummTax, PosSummTax: Extended;
    TaxID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.aPrintExecute') else _udebug := nil;{$ENDIF}

  if mdDet.IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  mdReport.CopyFromDataSet(mdDet);

  mdReport.Close;

  with TFloatField.Create(mdReport) do  begin
    FieldName := 'price2';
    FieldKind := fkData;
    Required := false;
    DataSet := mdReport;
    mdReport.FieldDefs.Add(FieldName,ftFloat,0,false);
  end;//with
  mdReport.LoadFromDataSet(mdDet);

  mdReport.First;
  while not mdReport.Eof do begin
    mdReport.Edit;
    mdReport.FieldByName('price2').AsFloat := mdReport.FieldByName('price').AsFloat;
    FAmount := mdReport.FieldByName('amount').AsFloat;
    if (mdReport.FieldByName('postype').AsInteger = 1)
       and (mdReport.FieldByName('norm').AsFloat > 1)
    then FAmount := FAmount * mdReport.FieldByName('norm').AsFloat;

    mdReport.FieldByName('amount').AsFloat := FAmount;

    if PrintType=0 then begin
      NDSCalc(1, mdReport.FieldByName('price').AsFloat, mdReport.FieldByName('nds').AsFloat, 1, FSumWONDS, FNDS);
      FSumWithNDS := RoundToA(FSumWONDS + FNDS, -2);
      FSumWONDS := FSumWithNDS - FNDS;
      mdReport.FieldByName('price').AsFloat := FSumWONDS;
    end;

    mdReport.Post;
    mdReport.Next;
  end;

  cdsT := newDataSet;
  try
    cdsT.ProviderName := 'pTaxes_ListP';
    cdsT.Open;
    mdTaxes.Close;
    mdTaxes.Open;

    SummTaxAll := 0;
    with mdReport do begin
      First;

      while not Eof do begin
        PosSummTax := 0;

        for i := 0 to FieldCount - 1 do begin
          if (Pos('Tax', Fields[i].FieldName) = 1) and (Pos('TaxRate', Fields[i].FieldName) = 0) and (Fields[i].AsFloat > 0)
          then begin
            TaxID := StrToInt(Copy(Fields[i].FieldName, 4, Length(Fields[i].FieldName) - 3));
            SummTax := Fields[i + 1].AsCurrency;

            if cdsT.Locate('taxid', TaxID, []) then begin
              if not mdTaxes.Locate('taxid', TaxID, []) then begin
                mdTaxes.Append;
                mdTaxes.FieldByName('taxid').AsInteger := TaxID;
                mdTaxes.FieldByName('onvalue').AsFloat := Fields[i].AsFloat;
                mdTaxes.FieldByName('name').AsString := cdsT.FieldByName('name').AsString;
              end
              else mdTaxes.Edit;

              mdTaxes.FieldByName('taxsum').AsCurrency := mdTaxes.FieldByName('taxsum').AsCurrency + SummTax;
              mdTaxes.Post;
            end;
            PosSummTax := PosSummTax + SummTax;
            SummTaxAll := SummTaxAll + SummTax;
          end;
        end;

        Edit;
        FieldByName('taxsum').AsCurrency := PosSummTax;
        Post;
        Next;
      end;
    end;

  finally
    cdsT.Free;
  end;

  mdReport.First;
  while not mdReport.Eof do begin
    mdReport.Edit;
    FAmount := mdReport.FieldByName('amount').AsFloat;

    if (mdReport.FieldByName('postype').AsInteger = 1) and (mdReport.FieldByName('norm').AsFloat > 1)
      then FAmount := FAmount * mdReport.FieldByName('norm').AsFloat;

    mdReport.FieldByName('amount').AsFloat := FAmount;
    mdReport.Post;
    mdReport.Next;
  end;

  FGridRefresh := True;
  SmartShowRep(frDoc, 'Waybill_Invoice.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.aBallanceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.aBallanceExecute') else _udebug := nil;{$ENDIF}

  try // finally
    if not ShowBallance then begin
      AccessDenied;
      Exit;
    end;

    if edKAgent.KAID <= 0 then Exit;

    with TfrmKATurnover.Create(nil) do
      try
        ParentNameEx := 'fmKAgent';
        OnDate := Self.OnDate;
        ID := edKAgent.KAID;
        ShowModal;

      finally
        Free;
      end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfrmEditInvoice.aMatInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.aMatInfoExecute') else _udebug := nil;{$ENDIF}

  if (dbgWaybillDet.SelectedCount <> 1) or (mdDet.FieldByName('postype').AsInteger <> 0)
    then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := dbgWaybillDet.FocusedNode.Values[colMatID.Index];
      CanModify := False;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.frDocGetValue(const ParName: String; var ParValue: Variant);
  var
    FSumm, FWONDS, FNDS, FAmount: Extended;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.frDocGetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := edNum1.Text
  else if 0 = AnsiCompareText(ParName, 'director') then ParValue := edEnt.Obj.Director
  else if 0 = AnsiCompareText(ParName, 'buh') then ParValue := edEnt.Obj.Buh
  else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := edDate.Text
  else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := edEnt.Obj.NameEx
  else if 0 = AnsiCompareText(ParName, 'entaddr') then ParValue := edEnt.Obj.GetAddr
  else if 0 = AnsiCompareText(ParName, 'shipent') then ParValue := edShipEnt.Obj.NameEx
  else if 0 = AnsiCompareText(ParName, 'shipentaddr') then ParValue := edShipEnt.Obj.GetAddr
  else if 0 = AnsiCompareText(ParName, 'shipka') then ParValue := edShipKA.Obj.NameEx
  else if 0 = AnsiCompareText(ParName, 'shipkaaddr') then ParValue := edShipKA.Obj.GetAddr
  else if 0 = AnsiCompareText(ParName, 'shipper') then ParValue := lcbShipper.Text
  else if 0 = AnsiCompareText(ParName, 'shipperjob') then ParValue := lShipper.Text
  else if 0 = AnsiCompareText(ParName, 'rate') then ParValue := CurKurs
  else if 0 = AnsiCompareText(ParName, 'kafullname') then ParValue := edKAgent.Obj.NameEx
  else if 0 = AnsiCompareText(ParName, 'kaaddr') then ParValue := edKAgent.Obj.GetAddr
  else if 0 = AnsiCompareText(ParName, 'entinn') then ParValue := edEnt.Obj.INN
  else if 0 = AnsiCompareText(ParName, 'entkpp') then ParValue := edEnt.Obj.KPP
  else if 0 = AnsiCompareText(ParName, 'kakpp') then ParValue := edKAgent.Obj.KPP
  else if 0 = AnsiCompareText(ParName, 'kaphone') then ParValue := edKAgent.Obj.Phone
  else if 0 = AnsiCompareText(ParName, 'kainn') then ParValue := edKAgent.Obj.INN
  else if 0 = AnsiCompareText(ParName, 'paydocnum') then begin
    if edPayNum.Text <> ''
      then ParValue := edPayNum.Text
      else ParValue := '__________';
  end
  else if 0 = AnsiCompareText(ParName, 'paydocdate') then begin
    if edPayNum.Text <> ''
      then ParValue := DateToStr(edDate.Date)
      else ParValue := '__________';
  end
  //else if 0 = AnsiCompareText(ParName, 'reason') then ParValue := edReason.Text else
  else if 0 = AnsiCompareText(ParName, 'printtype') then ParValue := PrintType
  else if 0 = AnsiCompareText(ParName, 'PriceDisplayFormatEx') then ParValue := PriceDisplayFormatEx
  else if 0 = AnsiCompareText(ParName, 'postaxsum') then ParValue := mdReport.FieldByName('taxsum').AsCurrency
  else if 0 = AnsiCompareText(ParName, 'posnds') then begin
    NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
            mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);
    ParValue := RoundToA(FNDS, -2);
  end
  else if 0 = AnsiCompareText(ParName, 'possum') then begin
    FAmount := mdReport.FieldByName('amount').AsFloat;

    if PrintType=0 then begin
      NDSCalc(FAmount, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
              mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);

      FSumm := RoundToA(FWONDS+FNDS, -2);
      FWONDS := FSumm - FNDS;
      ParValue := mdReport.FieldByName('sumwonds').AsFloat;
    end
    else begin
      NDSCalc(FAmount, mdReport.FieldByName('price').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
              mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);
      ParValue := mdReport.FieldByName('sumwonds').AsFloat;
    end;
  end
  else if 0 = AnsiCompareText(ParName, 'posprice') then begin
    if mdReport.FieldByName('amount').AsFloat = 1
      then begin
        NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);

        FSumm := RoundToA(FWONDS + FNDS, -2);
        ParValue := FSumm - RoundToA(FNDS, -2);
      end
      else ParValue := mdReport.FieldByName('price').AsFloat * mdReport.FieldByName('onvalue').AsFloat;
  end
  else if 0 = AnsiCompareText(ParName, 'possumnds') then begin
    NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
            mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);
    ParValue := RoundToA(FNDS + FWONDS, -2);
  end
  else if 0 = AnsiCompareText(ParName, 'possumwonds') then begin
    NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
            mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);

    ParValue := RoundToA(FWONDS + FNDS, -2);
    FNDS := RoundToA(FNDS, -2);
    ParValue := ParValue - FNDS;
  end
  else if 0 = AnsiCompareText(ParName, 'postaxrate') then begin
    for i := 0 to mdReport.FieldCount - 1 do
      if (Pos('Tax', mdReport.Fields[i].FieldName) = 1)
         and (Pos('TaxRate', mdReport.Fields[i].FieldName) = 0)
         and (Pos('TaxSum', mdReport.Fields[i].FieldName) = 0)
      then ParValue := mdReport.Fields[i].AsFloat;
  end
  else if 0 = AnsiCompareText(ParName, 'propis') then begin
    FSumm := StrToFloat(DelChars(lSummDef.Caption, [ThousandSeparator]));
    ParValue := MoneyToStr(FSumm);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.sbAddKAgentMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.sbAddKAgentMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil; 

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.chbPayKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.chbPayKeyPress') else _udebug := nil;{$ENDIF}

  if NextCtrlOnEnter and (Key = #13) and not chbPay.Checked then begin
    Key := #0;
    if aOK.Enabled then btnOK.SetFocus
      else btnCancel.SetFocus;
  end
  else GoNext(Sender, Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.lcbPersonNamePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.lcbPersonNamePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  with Sender as TcxComboBox do begin
    SelStart := 0;
    SelLength := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.dbgWaybillDetCustomDrawCell') else _udebug := nil;{$ENDIF}

  if Odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.dbgWaybillDetDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.dbgWaybillDetDblClick') else _udebug := nil;{$ENDIF}

  if aCUpd.Enabled then aCUpd.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.dbgWaybillDetKeyPress') else _udebug := nil;{$ENDIF}

  if chbPay.Enabled then begin
    if Key = #13 then begin
      Key := #0;
      chbPay.SetFocus;
    end;
  end
  else GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.dbgWaybillDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'DocWBIn');
  ImgList := dmData.Images;
  AIndex := II_WBIN;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.btnPayMPersonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.btnPayMPersonMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPayMPerson;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.lcbPayMPersonEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.lcbPayMPersonEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPayMPerson;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.lcbPayMPersonExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.lcbPayMPersonExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.colAmountGetText') else _udebug := nil;{$ENDIF}

  try AText := FormatFloat(MatDisplayFormat, StrToFloat(AText)); except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.btnCashDesksMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.btnCashDesksMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbCashDesks;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.btnCashDesksMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.btnCashDesksMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.lcbCashDesksEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.lcbCashDesksEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edShipEntKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edShipEntKeyDown') else _udebug := nil;{$ENDIF}

  edShipEnt.Tag := 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edKAgentChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edKAgentChange') else _udebug := nil;{$ENDIF}

  DataModified(Self);

  with edKAgent do begin
    if Obj.AddrID = 0
    then edKAAddr.Clear
    else begin
      Obj.Addr.Locate('addrtype', 1, []);
      edKAAddr.Text := Obj.GetAddr;
      SetAddrType(btnKAAddr, Obj.Addr.FieldByName('addrtype').AsInteger)
    end;
  end;
  edPayNum.KAID := edKAgent.KAID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edEntChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edEntChange') else _udebug := nil;{$ENDIF}

  DataModified(Self);
  lEntEx.Captions.Clear;
  lEntEx.Captions.Add('(' + edEnt.Obj.Name_ + ')');

  if edShipEnt.Tag <> 1 then edShipEnt.KAID := edEnt.KAID;

  if edEnt.Obj.NDSPayer
    then CurrentNDS := NDS
    else CurrentNDS := 0;

  with edEnt do begin
    if Obj.AddrID = 0
    then edEntAddr.Clear
    else begin
      edEntAddr.Text := Obj.GetAddr;
      SetAddrType(btnEntAddr, Obj.Addr.FieldByName('addrtype').AsInteger)
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.SetAddrType(AButton: TssSpeedButton; AType: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.SetAddrType') else _udebug := nil;{$ENDIF}

  case AType of
    0: begin
         AButton.Caption := RS('fmInvoices', 'SetFactAddrCap');
         AButton.Hint := RS('fmInvoices', 'SetFactAddrHint');
       end;

    1: begin
         AButton.Caption := RS('fmInvoices', 'SetLegalAddrCap');
         AButton.Hint := RS('fmInvoices', 'SetLegalAddrHint');
       end;
  end;
  AButton.Invalidate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edEntAddrPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edEntAddrPropertiesChange') else _udebug := nil;{$ENDIF}

  (Sender as TcxTextEdit).Hint := (Sender as TcxTextEdit).Text;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.aNextAddrExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.aNextAddrExecute') else _udebug := nil;{$ENDIF}

  if FCurrBtn = nil then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TokKASearchEdit(TcxTextEdit(FCurrBtn.Tag).Tag).Obj do begin
    NextAddr;
    TcxTextEdit(FCurrBtn.Tag).Text := GetAddr;

    if Addr.Active then SetAddrType(FCurrBtn, Addr.FieldByName('addrtype').AsInteger);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edEntAddrEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edEntAddrEnter') else _udebug := nil;{$ENDIF}

  FCurrBtn := btnEntAddr;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edEntAddrExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edEntAddrExit') else _udebug := nil;{$ENDIF}

  FCurrBtn := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edShipEntAddrExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edShipEntAddrExit') else _udebug := nil;{$ENDIF}

  FCurrBtn := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edShipEntAddrEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edShipEntAddrEnter') else _udebug := nil;{$ENDIF}

  FCurrBtn := btnShipEntAddr;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edShipKAAddrExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edShipKAAddrExit') else _udebug := nil;{$ENDIF}

  FCurrBtn := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edShipKAAddrEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edShipKAAddrEnter') else _udebug := nil;{$ENDIF}

  FCurrBtn := btnShipKAAddr;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edKAAddrEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edKAAddrEnter') else _udebug := nil;{$ENDIF}

  FCurrBtn := btnKAAddr;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edKAAddrExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edKAAddrExit') else _udebug := nil;{$ENDIF}

  FCurrBtn := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.btnEntAddrMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.btnEntAddrMouseDown') else _udebug := nil;{$ENDIF}

  TcxTextEdit(TssSpeedButton(Sender).Tag).SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edShipEntChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edShipEntChange') else _udebug := nil;{$ENDIF}

  DataModified(Self);

  with edShipEnt do begin
    if Obj.AddrID = 0
    then edShipEntAddr.Clear
    else begin
      Obj.Addr.Locate('addrtype', 1, []);
      edShipEntAddr.Text := Obj.GetAddr;
      SetAddrType(btnShipEntAddr, Obj.Addr.FieldByName('addrtype').AsInteger)
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edShipKAChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edShipKAChange') else _udebug := nil;{$ENDIF}

  DataModified(Self);

  if edKAgent.Tag <> 1 then edKAgent.KAID := edShipKA.KAID;

  with edShipKA do begin
    if Obj.AddrID = 0
    then edShipKAAddr.Clear
    else begin
      edShipKAAddr.Text := Obj.GetAddr;
      SetAddrType(btnShipKAAddr, Obj.Addr.FieldByName('addrtype').AsInteger)
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edKAgentKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edKAgentKeyDown') else _udebug := nil;{$ENDIF}

  (Sender as TComponent).Tag := 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.dbgWaybillDetCustomDrawColumnHeader( Sender: TObject; AColumn: TdxTreeListColumn; ACanvas: TCanvas; ARect: TRect; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ASorted: TdxTreeListColumnSort; var ADone: Boolean);
  var
    H: Integer;
    R: TRect;
    Flags: Longint;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.dbgWaybillDetCustomDrawColumnHeader') else _udebug := nil;{$ENDIF}

  with ACanvas do begin
    Brush.Color := AColor;
    FillRect(ARect);

    R := ARect;
    Flags := DT_CALCRECT or DT_EXPANDTABS or DT_CENTER or DT_WORDBREAK;
    Flags := DrawTextBiDiModeFlags(Flags);
    DrawText(Handle, PChar(AText), -1, R, Flags);
    H := R.Bottom - R.Top;
    R.Top := ARect.Top + (ARect.Bottom - ARect.Top - H) div 2;
    R.Bottom := R.Top + H;

    Flags := DT_EXPANDTABS or DT_CENTER or DT_WORDBREAK;
    Flags := DrawTextBiDiModeFlags(Flags);
    DrawText(Handle, PChar(AText), -1, R, Flags);

    ARect := R;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.CreateFromWBOut(AID: Integer; var IDs, Svc: string);
  var
    FTaxSumm, FPosNDS, FSumWONDS, FNDS, FPrice: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.CreateFromWBOut') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    mdDet.Close;
    mdDet.Open;

    ProviderName := 'pWaybill_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AID;
    Open;
    edEnt.KAID := FieldByName('entid').AsInteger;
    edShipEnt.KAID := FieldByName('entid').AsInteger;
    edKAgent.KAID := FieldByName('kaid').AsInteger;
    edShipKA.KAID := FieldByName('kaid').AsInteger;
    Close;
    edKAgent.Tag := 1;

    ProviderName := 'pWayBillPay_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AID;
    Open;
    if not IsEmpty then begin
      chbPay.Checked := True;
      cbSelectPay.ItemIndex := 1;
      edPayNum.PayDocID := FieldByName('paydocid').AsInteger;
      chbPay.Enabled := False;
      cbSelectPay.Enabled := False;
      edPayNum.Enabled := False;
    end;
    Close;

    FWBOutID := AID;

    ProviderName := 'pInvoicesDet_GetByWB';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AID;
    Params.ParamByName('ondate').AsDateTime := LastSecondInDay(edDate.Date);
    Params.ParamByName('ids').AsString := IDs;
    Params.ParamByName('svc').AsString := Svc;
    Open;

    mdDet.LoadFromDataSet(Fields[0].DataSet);
    Close;

    ProviderName := 'pWaybillDet_GetTaxes';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AID;
    Open;
    while not Eof do begin
      mdDet.First;
      while not mdDet.Eof do begin
        if (mdDet.FieldByName('posid').AsInteger = FieldByName('posid').AsInteger)
           and (mdDet.FieldByName('postype').AsInteger = 0)
        then begin
          FPrice := mdDet.FieldByName('price').AsFloat * mdDet.FieldByName('onvalue').AsFloat;
          FPosNDS := mdDet.FieldByName('nds').AsFloat;
          NDSCalc(mdDet.FieldByName('amount').AsFloat, FPrice, FPosNDS, 1, FSumWONDS, FNDS);
          FSumWONDS := RoundToA(RoundToA(FSumWONDS + FNDS, -2) - RoundToA(FNDS, -2), -2);
          FTaxSumm := RoundToA(FSumWONDS * FieldByName('onvalue').AsFloat / 100, -2);
          mdDet.Edit;
          mdDet.FieldByName('Tax' + FieldByName('taxid').AsString).AsFloat := FieldByName('onvalue').AsFloat;
          mdDet.FieldByName('TaxRate' + FieldByName('taxid').AsString).AsFloat := FTaxSumm;
          mdDet.Post;
        end;
        mdDet.Next;
      end;
      Next;
    end;
    Close;

    mdDet.First;
    while not mdDet.Eof do begin
      mdDet.Edit;
      mdDet.FieldByName('price').AsFloat := mdDet.FieldByName('price').AsFloat * mdDet.FieldByName('onvalue').AsFloat;
      mdDet.FieldByName('onvalue').AsFloat := 1;
      mdDet.FieldByName('posid').AsInteger := mdDet.RecNo + 1;
      mdDet.Post;
      UpdatePos;
      mdDet.Next;
    end;

    mdDet.First;
    SelectFocusedNode;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.aAddSvcExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.aAddSvcExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditPositionSvc.Create(nil) do
  try
    ParentHandle := Self.Handle;
    ParentNameEx := Self.ParentNameEx;
    OnDate := Int(edDate.Date) + Frac(edTime.Time);
    FRateValue := 1;
    CurrID := BaseCurrID;
    mdDet := Self.mdDet;
    PosNDS := NDS;
    ShowModal;
    dbgWaybillDet.SetFocus;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.aAddMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.aAddMatExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  with TfrmEditPosition.Create(frmEditPosition) do
  try
    ParentNameEx := 'fmWaybill';
    IsInvoice := True;
    OnDate := edDate.Date + edTime.Time;
    NDSPayer := edEnt.Obj.NDSPayer;
    PosNDS := CurrentNDS;
    ParentHandle := Self.Handle;
    CurrID := BaseCurrID;
    Kurs := 1;
    parentMdDet := mdDet; //Tag := integer(mdDet);
    DocType := dtInvoice;
    KAType := edKAgent.Obj.KType;
    id := 0;
    CurrDefName := BaseCurrName;
    CurrShortName := defCurrShortName;
    CurrName := cdsCurr.fieldbyname('shortname').AsString;
    Caption := rs(ParentNameEx, 'PosAdd');
    Screen.Cursor := crDefault;
    ShowModal;

  finally
    if not mdDet.IsEmpty then begin
      dbgWaybillDet.SetFocus;
    end;
    Free;
    Screen.Cursor := crDefault;
  end;//try

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.aCInsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.aCInsExecute') else _udebug := nil;{$ENDIF}

  aAddMat.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.GetTaxes;
  var
    ACol: TdxDBTreeListColumn;
    FField: TFloatField;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.GetTaxes') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pTaxes_List';
    Open;
    while not Eof do begin
      FField := TFloatField.Create(mdDet);
      FField.Name := 'fldTax' + FieldByName('taxid').AsString;
      FField.FieldKind := fkData;
      FField.FieldName := 'Tax' + FieldByName('taxid').AsString;
      FField.DataSet := mdDet;

      ACol := dbgWaybillDet.CreateColumnEx(TdxDBGridColumn, dbgWaybillDet);
      ACol.Name := 'colTax' + FieldByName('taxid').AsString;
      ACol.FieldName := 'Tax' + FieldByName('taxid').AsString;
      ACol.Visible := False;
      ACol.Tag := 1;
      ACol.HeaderAlignment := taCenter;
      ACol.Caption := FieldByName('name').AsString + ', %';
      ACol.Width := 60;

      FField := TFloatField.Create(mdDet);
      FField.Name := 'fldTaxRate' + FieldByName('taxid').AsString;
      FField.FieldKind := fkData;
      FField.FieldName := 'TaxRate' + FieldByName('taxid').AsString;
      FField.DataSet := mdDet;

      ACol := dbgWaybillDet.CreateColumnEx(TdxDBGridColumn, dbgWaybillDet);
      ACol.Name := 'colTaxRate' + FieldByName('taxid').AsString;
      ACol.FieldName := 'TaxRate' + FieldByName('taxid').AsString;
      ACol.Visible := False;
      ACol.Tag := 1;
      ACol.HeaderAlignment := taCenter;
      ACol.Caption := FieldByName('name').AsString;
      ACol.Width := 60;

      Next;
    end;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.GetSummAll;
  var
    i, j: Integer;
    BM: TBookmark;
    PriceCurrOutNDS, SummCurrOutNDS, SummCurrNDS, SummCurr, FAmount, FNorm,
    PriceDefOutNDS, SummDefOutNDS, SummDefNDS, SummDef, SummTax, PosSummTax,
    AllSummDefOutNDS, AllSummDefNDS, AllSummDef, FNDS :Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.GetSummAll') else _udebug := nil;{$ENDIF}


  with dbgWaybillDet do begin
    AllSummCurr := 0;
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;
    FAmount := 0;

    for i := 0 to Count - 1 do begin
      try
        if not VarIsNull(Items[i].Values[colNorm.Index])
          then FNorm := ssStrToFloat(Items[i].Values[colNorm.Index])
          else FNorm := 0;

        FAmount := Items[i].Values[colAmount.Index];

        if (Items[i].Values[colPType.Index] = 1) and (FNorm > 0)
          then FAmount := FAmount * FNorm;

        SummCurr := RoundToA(FAmount * ssStrToFloat(Items[i].Values[colPriceInCurr.Index]), -2);

        NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]),
                ssStrToFloat(Items[i].Values[colNDSRate.Index]), 1, SummDefOutNDS, SummDefNDS);

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

        AllSummCurr := AllSummCurr + SummCurr + PosSummTax;
      except
      end;

      try
        try
          FNDS := ssStrToFloat(Items[i].Values[colNDSRate.Index]);
        except
          FNDS := NDS;
        end;

        {Цены с НДС и без НДС}
        NDSCalc(1, Items[i].Values[colPriceInCurr.Index] * ssStrToFloat(Items[i].Values[colOnValue.Index]),
                FNDS, 1, SummDefOutNDS, SummDefNDS);

        NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * ssStrToFloat(Items[i].Values[colOnValue.Index]),
                FNDS, 1, SummDefOutNDS, SummDefNDS);

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

        SummDef := SummDef + PosSummTax;
        AllSummDefOutNDS := AllSummDefOutNDS + SummDefOutNDS;
        AllSummDefNDS := AllSummDefNDS + RoundToA(SummDefNDS, -2);
        //Сумма в нац. валюте с НДС;
        AllSummDef := AllSummDef + SummDef;

      except
      end;
    end;

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
procedure TfrmEditInvoice.SaveTaxes(APosID: Integer);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.SaveTaxes') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pWaybillDetTaxes_Ins';
    FetchParams;
    Params.ParamByName('posid').AsInteger := APosID;

    for i := 0 to mdDet.FieldCount - 1 do begin
      if (Pos('Tax', mdDet.Fields[i].FieldName) = 1) and (Pos('TaxRate', mdDet.Fields[i].FieldName) = 0) and (mdDet.Fields[i].AsFloat > 0) then begin
        Params.ParamByName('taxid').AsInteger := StrToInt(Copy(mdDet.Fields[i].FieldName, 4, Length(mdDet.Fields[i].FieldName) - 3));
        Params.ParamByName('onvalue').AsFloat := mdDet.Fields[i].AsFloat;
        Execute;
      end;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.chbPayClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.chbPayClick') else _udebug := nil;{$ENDIF}

  inherited;

  cbSelectPay.Enabled := chbPay.Checked;
  SelectPay(cbSelectPay.ItemIndex = 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.cbSelectPayPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.cbSelectPayPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  FPayDocModified := True;

  if cbSelectPay.ItemIndex = 0 then begin
    SelectPay(True);
    edPayNum.EditMode := True;
    edPayNum.ShowButtons := sbtHide;
  end
  else begin
    SelectPay(False);
    edPayNum.EditMode := False;
    edPayNum.PayDocID := 0;
    edPayNum.ShowButtons := sbtOnlyRef;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.edPayNumChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edPayNumChange') else _udebug := nil;{$ENDIF}

  inherited;

  if edShipKA.KAID = 0 then edShipKA.KAID := edPayNum.Obj.KAID;
  if edKAgent.KAID = 0 then edKAgent.KAID := edPayNum.Obj.KAID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.WMSetText(var M: TMessage);
  var
    S: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.WMSetText') else _udebug := nil;{$ENDIF}

  inherited;

  S := panTitleBar.Caption;
  if Assigned(lTitle) then begin
    panTitleBar.Caption := '';
    lTitle.Caption := S;
    lEntEx.Left := lTitle.Left + lTitle.Width + 8;
    panTitleButtons.Invalidate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.aChangeEntExecute(Sender: TObject);
 var
   APreffix, ASuffix: string;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.aChangeEntExecute') else _udebug := nil;{$ENDIF}

  if cdsEnts.RecordCount > 1 then begin
    cdsEnts.Next;
    if cdsEnts.Eof then cdsEnts.First;

    if (FID = 0) and InvoiceAutoNum then begin
      if FLastGen <> '' then begin
        if Gen_ID(dmData.SConnection, FLastGen, 0) = FCurrNum
        then Gen_ID(dmData.SConnection, FLastGen, -1);
      end
      else if GetDocNum(dmData.SConnection, dtInvoice, 0) = FCurrNum
           then GetDocNum(dmData.SConnection, dtInvoice, -1);

      APreffix := InvoicePrefix;
      ASuffix := InvoiceSuffix;
      FLastGen := '';
      FCurrNum := GetDocNumEx(dmData.SConnection, dtInvoice, 1, APreffix, ASuffix, FLastGen, cdsEnts.FieldByName('kaid').AsInteger);
      edNum1.Text := APreffix + IntToStr(FCurrNum) + ASuffix;
    end;

  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.srcEntDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.srcEntDataChange') else _udebug := nil;{$ENDIF}

  edEnt.KAID := cdsEnts.FieldByName('kaid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.lEntExItemClick(Sender: TObject; Index: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.lEntExItemClick') else _udebug := nil;{$ENDIF}

  aChangeEnt.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.aActivateFindExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.aActivateFindExecute') else _udebug := nil;{$ENDIF}

  edFind.Editor.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.UpdatePos;
  var
    FAmount, FNorm, FSummCurr, FPriceCurr, FNDS, FCurrRate: Extended;
    FPriceWithNDS, FPriceWONDS, FSummWONDS, FSummNDS, FSummWithNDS: Extended;
    FSummTax, FPosSummTax: Extended;
    j: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.UpdatePos') else _udebug := nil;{$ENDIF}

  with mdDet do begin
    if IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    FAmount := FieldByName('amount').AsFloat;
    FNorm := FieldByName('norm').AsFloat;

    if FNorm > 0 then FAmount := FAmount * FNorm;

    FPriceCurr := FieldByName('price').AsFloat;
    FNDS := FieldByName('nds').AsFloat;
    FCurrRate := FieldByName('onvalue').AsFloat;

    NDSCalc(FAmount, FPriceCurr, FNDS, 1, FSummWONDS, FSummNDS);
    FSummWithNDS := RoundToA(FSummWONDS + FSummNDS, -2);
    FSummWONDS := FSummWithNDS - RoundToA(FSummNDS, -2);
    FPosSummTax := 0;

    for j := 0 to FieldCount - 1 do begin
      if (Pos('fldTax', Fields[j].Name) > 0) and (Pos('fldTaxRate', Fields[j].Name) = 0)
      then begin
        FSummTax := RoundToA(FSummWONDS * Fields[j].AsFloat / 100, -2);
        FPosSummTax := FPosSummTax + FSummTax;
      end;
    end;
    FSummCurr := RoundToA(FAmount * FPriceCurr, -2) + FPosSummTax;

    NDSCalc(1, FPriceCurr * FCurrRate, FNDS, 1, FSummWONDS, FSummNDS);
    FPriceWithNDS := RoundToA(FSummWONDS + FSummNDS, -2);
    FPriceWONDS := RoundToA(FSummWONDS + FSummNDS, -2) - RoundToA(FSummNDS, -2);

    NDSCalc(FAmount, FPriceCurr * FCurrRate, FNDS, 1, FSummWONDS, FSummNDS);
    FSummWithNDS := RoundToA(FSummWONDS + FSummNDS, -2);
    FSummNDS := RoundToA(FSummNDS, -2);
    FSummWONDS := FSummWithNDS - FSummNDS;

    FPosSummTax := 0;
    for j := 0 to FieldCount - 1 do begin
      if (Pos('fldTax', Fields[j].Name) > 0) and (Pos('fldTaxRate', Fields[j].Name) = 0)
      then begin
        FSummTax := RoundToA(FSummWONDS * Fields[j].AsFloat / 100, -2);
        FPosSummTax := FPosSummTax + FSummTax;
      end;
    end;
    FSummWithNDS := FSummWithNDS + FPosSummTax;

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
procedure TfrmEditInvoice.cbCurrPropertiesEditValueChanged(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.cbCurrPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditInvoice.edRatePropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.edRatePropertiesChange') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditInvoice.srcShippersDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvoice.srcShippersDataChange') else _udebug := nil;{$ENDIF}

  inherited;
  lShipper.Text := cdsShippers['job'];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvoice.FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
begin
  inherited;

  MinWidth := 700;
  MinHeight := 520;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditInvoice', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
