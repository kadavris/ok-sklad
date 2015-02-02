{$I ok_sklad.inc}
unit EditWaybill;

interface

uses
  dxCntner6, dxEditor6, dxExEdtr6, dxTL6, dxDBCtrl6, dxDBGrid6, dxDBTLCl6, dxGrClms6, dxmdaset,
  cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxMaskEdit, cxButtonEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox, cxTreeView, cxListView, cxDBEdit, cxGraphics,
  cxMemo, cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, cxPC, cxCalc,
  cxCalendar, cxSpinEdit, cxTimeEdit,
  ssBaseTypes, ssFormStorage, ssBaseDlg, ssMemDS, ssImagePanel, ssDBComboBox, ssBaseConst, ssPageControl, ssClientDataSet, ssGroupBox,
  ssBevel, ssSpeedButton, ssPanel, ssGradientPanel, ssDBGrid, ssCalcEdit, ssDBLookupCombo, ssLabel, ssBaseWBDocDlg,
  okSearchEdit, ssBaseWBDocDlgWithPayment,
  FR_DSet, FR_DBSet, FR_Class, FR_Desgn,
  xLngDefs, prTypes, TB2Item, xButton, dialogs,
  ExtCtrls, StdCtrls, ActnList, Grids, DBGrids, ImgList, DBCtrls,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Buttons, DBClient, DB, Menus, ComCtrls;

type
  TfrmEditWaybill = class(TfrmBaseWBDocDlgWithPayment)
    aActivateFind: TAction;
    aAddKA: TAction;
    aAddMat: TAction;
    aAddMatList: TAction;
    aAddSvc: TAction;
    aAddSvcList: TAction;
    aCDel: TAction;
    aCIns: TAction;
    aCUpd: TAction;
    aOrdersInfo: TAction;
    aPayMPersons: TAction;
    aPersons: TAction;
    aSelectAll: TAction;
    aSetKurs: TAction;
    btnAdd: TssSpeedButton;
    btnDel: TssSpeedButton;
    btnOrdersInfo: TssSpeedButton;
    btnPersonName: TssSpeedButton;
    btnProps: TssSpeedButton;
    cdsFind: TssClientDataSet;
    cdsPersonName: TssClientDataSet;
    chbCheckNDS: TcxCheckBox;
    chbPosting: TcxCheckBox;
    colSvcToPrice: TdxDBGridColumn;
    DataSource1: TDataSource;
    edContr: TokContractSearchEdit;
    edFind: TokGridSearchEdit;
    edKAgent: TokKASearchEdit;
    edNotes: TcxTextEdit;
    edNum1: TcxTextEdit;
    edReason: TcxTextEdit;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField4: TFloatField;
    FloatField6: TFloatField;
    frDoc: TfrReport;
    fsrcDoc: TfrDBDataSet;
    IntegerField11: TIntegerField;
    IntegerField1: TIntegerField;
    itmAdd: TTBSubmenuItem;
    lcbPersonName: TssDBLookupCombo;
    lcbWH: TokWHouseSearchEdit;
    lNotes: TLabel;
    lNum: TLabel;
    lPersonname: TLabel;
    lReason: TLabel;
    mdDetsvctoprice: TIntegerField;
    mdReport: TdxMemData;
    mdSvc: TdxMemData;
    mdSvctotal: TFloatField;
    mdSvctotalwithnds: TStringField;
    panPosBar: TPanel;
    pmMain: TTBPopupMenu;
    pmMatSvc: TTBPopupMenu;
    srcPersonName: TDataSource;
    TBItem10: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem19: TTBItem;
    TBItem1: TTBItem;
    TBItem20: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    colUF1: TdxDBGridColumn;
    mdDetuf1: TIntegerField;
    mdDetuf2: TIntegerField;
    mdDetuf3: TIntegerField;
    mdDetuf4: TIntegerField;
    mdDetuf5: TIntegerField;
    colUF2: TdxDBGridColumn;
    colUF3: TdxDBGridColumn;
    colUF4: TdxDBGridColumn;
    colUF5: TdxDBGridColumn;


    function AddToWMat(WBILLID:integer):boolean;
    function ChangeMats:boolean;
    function DelFromWMat(WBILLID:integer):boolean;
    procedure aActivateFindExecute(Sender: TObject);
    procedure aAddKAExecute(Sender: TObject);
    procedure aAddMatExecute(Sender: TObject);
    procedure aAddMatListExecute(Sender: TObject);
    procedure aAddSvcExecute(Sender: TObject);
    procedure aAddSvcListExecute(Sender: TObject);
    procedure aBallanceExecute(Sender: TObject);
    procedure aCDelExecute(Sender: TObject);
    procedure aCInsExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCUpdExecute(Sender: TObject);
    procedure aKAFindParamsExecute(Sender: TObject);
    procedure aMatInfoExecute(Sender: TObject);
    procedure aOrdersInfoExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aSetTimeExecute(Sender: TObject);
    procedure aShowRealPriceExecute(Sender: TObject);
    procedure btnCashDesksMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCashDesksMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPayMPersonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPersonNameMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPersonNameMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cbCurrPropertiesEditValueChanged(Sender: TObject);
    procedure cbPayCurrKeyPress(Sender: TObject; var Key: Char);
    procedure cdsDetailCalcFields(DataSet: TDataSet);
    procedure chbCheckNDSPropertiesChange(Sender: TObject);
    procedure chbPayKeyPress(Sender: TObject; var Key: Char);
    procedure chbPayPropertiesChange(Sender: TObject);
    procedure chbPostingPropertiesChange(Sender: TObject);
    procedure colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure DataModified(Sender: TObject);
    procedure dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgWaybillDetDblClick(Sender: TObject);
    procedure dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
    procedure edContrChange(Sender: TObject);
    procedure edKAgentChange(Sender: TObject);
    procedure edKAgentEnter(Sender: TObject);
    procedure edKAgentExit(Sender: TObject);
    procedure edNum1PropertiesChange(Sender: TObject);
    procedure edPaySummKeyPress(Sender: TObject; var Key: Char);
    procedure edPaySummPropertiesChange(Sender: TObject);
    procedure edRatePropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure lcbCashDesksEnter(Sender: TObject);
    procedure lcbPayMPersonEnter(Sender: TObject);
    procedure lcbPayMPersonExit(Sender: TObject);
    procedure lcbPersonNameEnter(Sender: TObject);
    procedure lcbPersonNameExit(Sender: TObject);
    procedure lcbPersonNameKeyPress(Sender: TObject; var Key: Char);
    procedure lcbPersonNamePropertiesEditValueChanged(Sender: TObject);
    procedure lcbWHChange(Sender: TObject);
    procedure mdDetAfterDelete(DataSet: TDataSet);
    procedure mdDetAfterPost(DataSet: TDataSet);
    procedure mdDetBeforeDelete(DataSet: TDataSet);
    procedure mdMatsAfterDelete(DataSet: TDataSet);
    procedure mdMatsAfterEdit(DataSet: TDataSet);
    procedure mdMatsAfterPost(DataSet: TDataSet);
    procedure sbAddKAgentMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbAddKAgentMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TBSubmenuItem1Click(Sender: TObject);

  private
    DocInfo: TokAddDocInfo;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMDelete(var M: TMessage); message WM_DELETE;

    //Функция подсчёта суммы с НДС
    function GetSummWithNDS(PriceNDS, Amount, aNDS: Extended):Extended;
    procedure FillMatsFromRef(DS: TssMemoryData);
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;

  protected
    AllSummDef : Extended;
    defCurrName, defCurrShortName: string;
    defCurrID: Integer;
    oldkaid: Integer;
    LockFind: Boolean;
    FKAModified, FBSPressed: Boolean;
    FKAID: Integer;
    FFindStr: string;

    prvDet: string;
    FPaySummChange:boolean;
    FindStr: string;
    FindIndex: Integer;
    CurrentNDS: Extended;
    PayDocId:integer;
    OldPayDocId:integer;
    PayDocChecked:boolean;
    PayDocDate:TDateTime;
    FCurrNum, FCurrPayNum: integer;
    FContrDocID: Integer;
    FOrderID: Integer;        

    procedure UpdatePos; override;
    procedure RecalcSvc;
    procedure GetSummAll; override;
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;

  public
    ParentHandle: HWND;

    procedure SetCaptions; override;
    function CreateByOrder(AID: Integer): Integer; virtual;
  end;

var
  frmEditWaybill: TfrmEditWaybill;
  
//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ClientData, Login, prFun, fKAgent, ssFun, ShellAPI, StdConvs, DateUtils,
  EditPosition, CurrencyEdit, ssCallbackConst, ssRegUtils, fMessageDlg,
  EditMaterials, ssStrUtil, KATurnover, ssBaseIntfDlg, EditPositionSvc,
  okMoneyFun, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//Функция подсчёта суммы с НДС
//==============================================================================================
function TfrmEditWaybill.GetSummWithNDS(PriceNDS,Amount,aNDS:Extended):Extended;
  var
    pricenonds,summcurnonds,summnds:Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.GetSummWithNDS') else _udebug := nil;{$ENDIF}

  pricenonds := roundtoa(PriceNDS - NDSOut(PriceNDS,aNDS), -6);
  summcurnonds := roundtoa(amount * pricenonds, -2);
  summnds := roundtoa(GetNDS(summcurnonds, CurrentNDS), -2);
  result := summcurnonds + summnds;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.WMRefresh') else _udebug := nil;{$ENDIF}

  if M.LParam = 9
    then begin
      UpdatePos;
      if mdDet.FieldByName('postype').AsInteger = 0 then RecalcSvc;
      GetSummAll;
      SelectFocusedNode;
    end

    else case TRefType(M.LParam) of
      rtMat:
         begin
           FillMatsFromRef(TssMemoryData(M.WParam));
         end;

      rtServices:
         begin
           FillMatsFromRef(TssMemoryData(M.WParam));
         end;

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

      rtPersons:
         begin
           if lcbPersonName.Tag = 1 then begin
             DSRefresh(cdsPersonName, 'KAID', M.WParam);
             lcbPersonName.KeyValue := M.WParam;
             lcbPersonName.SelStart := 0;
           end
           else begin
             DSRefresh(cdsPayMPersons, 'KAID', M.WParam);
             lcbPayMPerson.KeyValue := M.WParam;
             lcbPayMPerson.SelStart := 0;
           end;
         end;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditWaybill.DelFromWMat(WBILLID:integer):boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.DelFromWMat') else _udebug := nil;{$ENDIF}

  result := False;

  with TClientDataSet.Create(nil) do
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
      result := True;

      TrCommit;

    finally
      Free;
    end;

  except
    on e:exception do begin
      TrRollback;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditWaybill.AddToWMat(WBILLID:integer):boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.AddToWMat') else _udebug := nil;{$ENDIF}

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

      result := True;

      TrCommit;

    finally
      Free;
    end;

  except
    on e:exception do begin
      TrRollback;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.setid(const Value: integer);
  var
    FItem: TcxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWaybill.setid') else _udebug := nil;{$ENDIF}

  {$IFDEF LIMITED}if Value = 0 then CheckDocumentsCountLimit(wbtWaybillIn);{$ENDIF}

  Screen.Cursor := crSQLWait;
  CurrentNDS := NDS;
  chbCheckNDS.Tag := 1;
  chbCheckNDS.Properties.Caption := rs('fmWaybill', 'GetNDS');
  chbCheckNDS.Checked := true;
  chbCheckNDS.Tag := 0;

  if not cdsCurr.Active then begin  // currency
    cdsCurr.Open;
    if cdsCurr.Locate('def', 1, []) then begin
      cbCurr.KeyValue := cdsCurr.fieldbyname('currid').AsInteger;
      cbPayCurr.KeyValue := cbCurr.KeyValue;
      colSummDef.Visible := false;
    end;
  end;

  cdsPayType.Open;
  cdsPersonName.Open;
  lcbPersonName.KeyValue := 0;
  lcbPersonName.Text := '';

  //Установка валюты по умолчанию
  edDate.Date := OnDate;
  edTime.Time := Time;

  mdDet.Open;
  SetRate;
  Fid := Value;
  edKAgent.KAID := 0;

  with newDataSet do
    try
      //Установка номера по умолчанию
      chbPosting.Checked := WBInChecked;

      if ((Value = 0) or IsPattern) and WBInAutoNum then begin
        FCurrNum := GetDocNum(dmData.SConnection, dtWBIn, 1);
        edNum1.Text := WBInPrefix + IntToStr(FCurrNum) + WBInSuffix;
      end
      else edNum1.Text := '';

      if Value <> 0 then begin // existing record

         if IsPattern
           then Self.Caption := rs('fmWaybill', 'TitleAdd')
           else Self.Caption := rs('fmWaybill', 'TitleEdit');

          ProviderName := 'pWaybill_Get';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := Value;
          Open;

          if not IsEmpty then begin
            if not IsPattern then edNum1.Text := fieldbyname('num').AsString;

            edNum1.Tag := fieldbyname('defnum').AsInteger;

            if not IsPattern then begin
              eddate.Date := fieldbyname('ondate').AsDateTime;
              edTime.Time := fieldbyname('ondate').AsDateTime;
            end;

            cdsPayType.Locate('ptypeid', lcbPayType.KeyValue,[]);
            edKAgent.OnChange := nil;
            edKAgent.KAID := fieldbyname('kaid').AsInteger;
            edKAgent.OnChange := edKAgentEnter;

            if not fieldbyname('personid').IsNull
             then lcbPersonName.KeyValue := fieldbyname('personid').AsInteger;

            oldkaid := fieldbyname('kaid').AsInteger;
            edReason.Text := fieldbyname('REASON').asstring;
            edNotes.Text := FieldByName('notes').AsString;

            if cdsCurr.Locate('CURRID',fieldbyname('CURRID').AsInteger,[])
              then cbCurr.KeyValue := fieldbyname('CURRID').AsInteger;

            edRate.Value := FieldByName('onvalue').AsFloat;
            chbPosting.Checked := fieldbyname('CHECKED').AsInteger = 1;
            CurrentNDS := fieldbyname('NDS').AsFloat;
            chbCheckNDS.Tag := 1;

            if CurrentNDS <> 0 then begin
              chbCheckNDS.Properties.Caption := rs('fmWaybill', 'GetNDS');
              chbCheckNDS.Checked := true;
            end
            else begin
              chbCheckNDS.Properties.Caption := rs('fmWaybill', 'GetNDS');
              chbCheckNDS.Checked := false;
            end;

            chbCheckNDS.Tag := 0;

            if FieldByName('attnum').AsString = ''
              then lcbWH.WID := 0
              else
                try
                  lcbWH.WID := StrToInt(FieldByName('attnum').AsString);
                except
                end;
          end; // if not IsEmpty
          Close;

          // getting linked order if any
          ProviderName := 'pDocsRel_WB_WB_Get';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := FID;
          Params.ParamByName('doctype').AsInteger := wbtOrderIn;
          Open;

          if not IsEmpty
            then FOrderID := FieldByName('wbillid').AsInteger
            else FOrderID := 0;

          Close;

          ProviderName := 'pDocsRel_WB_Contr_Get';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := FID;
          Params.ParamByName('doctype').AsInteger := 8;
          Open;

          if not IsEmpty then begin
            edContr.DocID := FieldByName('rdocid').AsInteger;
            FContrDocID := edContr.DocID;
          end
          else edContr.DocID := 0;

          Close;

          edKAgent.Enabled := (FOrderID = 0); // disble changes if based on order
          cbCurr.Enabled := (FOrderID = 0);

          ProviderName := prvDet; // pWaybillDet_GetIn (1.4.9)
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := FID;
          Open;
          mdDet.LoadFromDataSet(Fields[0].DataSet);
          mdDet.First;

          while not mdDet.Eof do begin
            mdDet.Edit;

            if mdDet.FieldByName('fullprice').IsNull
              then mdDet.FieldByName('fullprice').AsFloat := mdDet.FieldByName('price').AsFloat;

            mdDet.Post;
            UpdatePos; // update service-positions list in mdSvc
            mdDet.Next;
          end;

          if not mdDet.IsEmpty then mdDet.First;

          if not mdDet.IsEmpty then begin
            if dbgWaybillDet.FocusedNode = nil then dbgWaybillDet.FocusedAbsoluteIndex := 0;
            dbgWaybillDet.FocusedNode.Selected := True;
          end;
          Close;

          if not IsPattern then begin
            ProviderName := 'pWayBillPay_Get';// Чтение платежа
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Open;
            if not IsEmpty then begin
              chbPay.Enabled := False;
              chbPay.Checked := True;
              chbPay.Enabled := True;
              PayDocChecked := FieldByName('Checked').AsInteger = 1;

              if not FieldByName('mpersonid').IsNull
                then lcbPayMPerson.KeyValue := FieldByName('mpersonid').AsInteger;

              chbPay.Enabled := not PayDocChecked;

              if not chbPay.Enabled then begin
                lcbPayType.Enabled := False;
                lPayMPerson.Enabled := False;
                lcbPayMPerson.Enabled := False;
                aPayMPersons.Enabled := False;
                lPaySumm.Enabled := False;
                lPayCurr.Enabled := False;
                lPayType.Enabled := False;
                btnPayMPerson.Enabled := False;
                edPaySumm.Enabled := False;
                edPayNum.Enabled := False;
                lcbCashDesks.Enabled := False;
                lcbAccount.Enabled := False;
                lAcc.Enabled := False;
                lCashDesks.Enabled := False;
                btnCashDesks.Enabled := False;
                cbPayCurr.Enabled := False;
                btnFinPay.Enabled := False;
              end;
              PayDocId := FieldByName('PayDocId').AsInteger;
              OldPayDocID := PayDocID;

              PayDocDate := fieldbyname('OnDate').AsDateTime;
              //lPayOnDate.Caption := rs_AttDate+' '+DateToStr(OldPayDocDate);

              edPayNum.Text := fieldbyname('DocNum').AsString;
              lcbPayType.KeyValue := fieldbyname('PTypeId').AsInteger;
              cbPayCurr.KeyValue := FieldByName('CurrId').AsInteger;
              edPaySumm.Tag := 1;
              edPaySumm.Properties.OnChange := nil;
              edPaySumm.Value := FieldByName('Total').AsFloat;
              edPaySumm.Tag := 0;
              edPaySumm.Properties.OnChange := edPaySummPropertiesChange;

              if cdsPayType.Locate('PTypeId',fieldbyname('CurrId').AsInteger,[]) then

              if not FieldByName('accid').IsNull
                then lcbAccount.KeyValue := FieldByName('accid').AsInteger
                else lcbAccount.Clear;

              if not FieldByName('cashid').IsNull
                then lcbCashDesks.KeyValue := FieldByName('cashid').AsInteger
                else lcbCashDesks.Clear;
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

        if IsPattern then begin
          FID := 0;
          FPosModified := True;
        end;
      end //if Value<>0
      else begin
        Self.Caption := rs('fmWaybill', 'TitleAdd');
        
        with cdsPayMPersons do begin
          if Locate('userid', UserID, []) then lcbPersonName.KeyValue := FieldByName('kaid').AsInteger;
        end;
      end;

      if UserID <> 0 then begin
        lcbPersonName.Enabled := False;
        btnPersonName.Enabled := False;
        if Value <> 0 then  // editing enabled only for document owner or admin
          with cdsPayMPersons do
            if Locate('userid', UserID, []) and (lcbPersonName.KeyValue <> FieldByName('kaid').AsInteger)
            then EditingDisabled := True;
      end;

      FModified := false;

      if IsPattern
        then FPosModified := True
        else FPosModified := False;

      FGridRefresh := true;
      FPayDocModified := false;

    finally
      Free;
    end;

  if not GetUserAccessByClass(Self.ParentNameEx, uaPost) then begin
    chbPosting.Hint := rs('Common', 'noRights');
    chbPosting.Checked := False;
    chbPosting.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: boolean;
    BM: TBookmark;
    tmpid:integer;
    FPosID, intTmp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  if ModalResult = mrCancel then begin
    CanClose := True;
    Exit;
  end;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWaybill.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    if NullPricePresent then begin
      ssMessageDlg(rs('fmWaybill', 'NullPricePresent'), ssmtError, [ssmbOK]);
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if (edContr.DocID > 0) and not CheckByContr(edContr, cbCurr.KeyValue, (edDate.Date + edTime.Time))
    then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if (edContr.DocID > 0) and chbPay.Checked and (edPaySumm.Value > (edContr.Obj.Summ - Abs(edContr.Obj.PaidSumm)))
    then begin
      ssMessageDlg(Format(rs('fmContr', 'CheckErr8'), [edContr.Obj.Num, FormatFloat(MoneyDisplayFormat,edContr.Obj.Summ - Abs(edContr.Obj.PaidSumm))]), ssmtError, [ssmbOk]);
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if not CheckDocDate(edDate.Date) then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if chbPay.Checked and chbPay.Enabled and FPayDocModified and chbPosting.Checked 
    then begin
      if ssMessageDlg(rs('fmPayDoc', 'CheckMoneyMode'), ssmtWarning, [ssmbYes, ssmbNo], 'CheckMoneyMode', True) = mrYes
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

          if ReadFromRegInt(MainRegKey, 'CheckMoneyMode', intTmp) then WriteToRegInt(MainRegKey, 'CheckMoneyModeEx', 1);
        end;
      end;
    end;

    if chbPay.Checked and chbPay.Enabled and chbPosting.Checked
      and not CheckMoneyDlg(dmData.SConnection, edDate.Date, lcbPayType.KeyValue - 1,
                            lcbAccount.KeyValue, lcbCashDesks.KeyValue, cbPayCurr.KeyValue, edPaySumm.EditValue)
    then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    with newDataSet do begin
      try
        Screen.Cursor := crSQLWait;
        NewRecord := (ID = 0);

        if NewRecord then FID := GetMaxID(dmData.SConnection, 'waybilllist', 'wbillid');

        TrStart;

        try
          if NewRecord
            then ProviderName := 'pWaybill_InsEx'
            else ProviderName := 'pWaybill_UpdEx';

          FetchParams;
          Params.ParamByName('WBILLID').AsInteger := FID;
          Params.ParamByName('NUM').AsString := edNum1.Text;

          if edNum1.Tag > 0
            then Params.ParamByName('DEFNUM').AsInteger := edNum1.Tag
            else Params.ParamByName('DEFNUM').AsInteger := GetNextDefNum(dmData.SConnection,1);

          Params.ParamByName('ONDATE').AsDateTime := edDate.Date+edTime.Time;
          Params.ParamByName('KAID').AsInteger := edKAgent.KAID;
          Params.ParamByName('CURRID').AsInteger := cbCurr.KeyValue;
          Params.ParamByName('ONVALUE').AsFloat := edRate.Value;

          if lcbWH.Combo.EditingText = ''
            then Params.ParamByName('ATTNUM').AsString := ''
            else Params.ParamByName('ATTNUM').AsString := IntToStr(lcbWH.WID);

          Params.ParamByName('ATTDATE').AsDate := 0;
          Params.ParamByName('REASON').AsString := edReason.EditingText;
          Params.ParamByName('notes').AsString := edNotes.EditingText;

          if (lcbPersonName.EditText = '') or (lcbPersonName.KeyValue = 0) then begin
            Params.ParamByName('PERSONID').DataType := ftInteger;
            Params.ParamByName('PERSONID').Clear;
          end
          else Params.ParamByName('PERSONID').AsInteger := lcbPersonName.KeyValue;

          Params.ParamByName('CHECKED').AsInteger := integer(chbPosting.Checked);
          Params.ParamByName('WTYPE').AsInteger := 1;//тип накладной 0-приходная; 1-расходная;
          Params.ParamByName('DELETED').AsInteger := 0;
          Params.ParamByName('SUMMALL').AsFloat := RoundToA(ALLSUMM, -2);
          Params.ParamByName('SUMMINCURR').AsFloat := AllSummCurr;
          Params.ParamByName('NDS').AsFloat := roundtoa(CurrentNDS, -2);
          Params.ParamByName('RECEIVED').AsString := '';
          Params.ParamByName('TODATE').DataType := ftDateTime;
          Params.ParamByName('TODATE').Clear;
          Params.ParamByName('entid').DataType := ftInteger;
          Params.ParamByName('entid').Clear;
          Execute;//Записали в waybilllist

          if FPosModified then begin // Запись позиций в накладную
            ProviderName := 'pWaybillDet_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := ID;
            Execute;  //Удалили позиции

            ProviderName := 'pWaybillSvc_Del';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FID;
            Execute;

            BM := mdDet.GetBookmark;
            mdDet.DisableControls;
            mdDet.First; // Запись позиций из mdDet в waybilldet

            while not mdDet.Eof do begin
              if mdDet.FieldByName('postype').AsInteger = 0 then begin
                if (FOrderID > 0) and NewRecord then begin
                  FPosID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
                  ProviderName := 'pWaybillDet_CopyPos';
                  FetchParams;
                  Params.ParamByName('posid').AsInteger := FPosID;
                  Params.ParamByName('oldposid').AsInteger := mdDet.FieldByName('posid').AsInteger;
                  Execute;

                  ProviderName := 'pPosRel_Ins';
                  FetchParams;
                  Params.ParamByName('posid').AsInteger := FPosID;
                  Params.ParamByName('cposid').AsInteger := mdDet.FieldByName('posid').AsInteger;
                  Execute;

                  ProviderName := 'pWaybillDet_UpdExIn';
                end
                else ProviderName := 'pWaybillDet_InsIn';

                FetchParams;
                if (FOrderID > 0) and NewRecord
                  then FPosID := mdDet.FieldByName('posid').AsInteger
                  else FPosID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');

                Params.ParamByName('posid').AsInteger := FPosID;

                if FPosID < 0 then raise Exception.Create(rs('fmWaybill', 'ErrorAddPos'));

                tmpid := Params.ParamByName('POSID').AsInteger;

                Params.ParamByName('wbillid').AsInteger := FID;
                Params.ParamByName('MATID').AsInteger := mdDet.fieldbyname('MATID').AsInteger;
                Params.ParamByName('WID').AsInteger := mdDet.fieldbyname('WID').AsInteger;
                Params.ParamByName('AMOUNT').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('AMOUNT').AsString), MatDisplayDigits);
                Params.ParamByName('onvalue').AsFloat := StrToFloat(mdDet.fieldbyname('onvalue').AsString);
                Params.ParamByName('PRICE').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('PRICE').AsString), -6);
                Params.ParamByName('baseprice').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('fullprice').AsString), -6);
                Params.ParamByName('DISCOUNT').DataType := ftFloat;
                Params.ParamByName('DISCOUNT').Clear;
                Params.ParamByName('NDS').AsFloat := StrToFloat(mdDet.FieldByName('nds').AsString);
                Params.ParamByName('CurrId').AsInteger := cbCurr.KeyValue;
                Params.ParamByName('OnDate').AsDateTime := edDate.Date + edTime.Time;
                Params.ParamByName('PTypeID').DataType := ftInteger;
                Params.ParamByName('PTypeID').Clear;
                Params.ParamByName('NUM').AsInteger := mdDet.RecNo;
                Params.ParamByName('total').AsFloat := 0;
                Execute;//Записываем очередную позицию

                //write s/n
                if not mdDet.fieldbyname('sn').IsNull then begin
                  ProviderName := 'rSN_Ins';
                  FetchParams;
                  Params.ParamByName('sid').AsInteger := GetMaxID(dmData.SConnection, 'serials', 'sid');
                  Params.ParamByName('posid').AsInteger := FPosID;
                  Params.ParamByName('serialno').AsString := mdDet.fieldbyname('sn').AsString;
                  Execute;
                end;//if

                ProviderName := 'pWaybillDetAP_Del'; // clear old positions in waybilldetaddprops
                FetchParams;
                Params.ParamByName('posid').AsInteger := FPosID;
                Execute;

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

                  Params.ParamByName('cardid').DataType := ftInteger;
                  Params.ParamByName('cardid').Clear;
                  Execute;
                end;
              end // if mdDet.FieldByName('postype').AsInteger = 0

              else begin
                ProviderName := 'pWaybillSvc_InsIn';
                FetchParams;
                FPosID := GetMaxID(dmData.SConnection, 'waybillsvc', 'posid');
                Params.ParamByName('posid').AsInteger := FPosID;
                Params.ParamByName('wbillid').AsInteger := FID;
                Params.ParamByName('svcid').AsInteger := mdDet.fieldbyname('matid').AsInteger;
                Params.ParamByName('amount').AsFloat := RoundToA(StrToFloat(mdDet.fieldbyname('amount').AsString), MatDisplayDigits);
                Params.ParamByName('price').AsFloat := StrToFloat(mdDet.fieldbyname('price').AsString);
                Params.ParamByName('norm').AsFloat := StrToFloat(mdDet.fieldbyname('norm').AsString);
                Params.ParamByName('discount').AsFloat := StrToFloat(mdDet.fieldbyname('discount').AsString);
                Params.ParamByName('nds').AsFloat := StrToFloat(mdDet.fieldbyname('NDS').AsString);
                Params.ParamByName('currid').AsInteger := cbCurr.KeyValue;
                Params.ParamByName('num').AsInteger := mdDet.RecNo;
                Params.ParamByName('svctoprice').AsInteger := mdDet.FieldByName('svctoprice').AsInteger;

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

            FPosModified := False;
          end; //if FPosModified

          if (FOrderID > 0) and NewRecord then begin
            ProviderName := 'pDocsRel_WB_Acc_Ins';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FID;
            Params.ParamByName('accid').AsInteger := FOrderID;
            Execute;

            ProviderName := 'pOrder_UpdStatus';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FOrderID;

            if chbPosting.Checked
              then Params.ParamByName('checked').AsInteger := 1
              else Params.ParamByName('checked').AsInteger := 2;

            Execute;
          end;

          if FOrderID = 0 then begin
            if chbPosting.Checked then begin  //Если документ проведён то
              //1)Удаление из оборотов        //записываем позиции на склад
              ProviderName := 'pWMatTurn_Del';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := FID;
              Execute;

              //4)Запись в обороты
              ProviderName := 'pWMatTurn_Ins';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := FID;
              Execute;
            end // if chbPosting.Checked
            else begin //Если документ не проведён, то удаляем позиции со склада
              //1)Удаление из оборотов
              ProviderName := 'pWMatTurn_Del';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := FID;
              Execute;
            end;//else if chbPosting.Checked
          end // if FOrderID = 0 (no related order)

          else begin  // have related order
            ProviderName := 'pWMatTurn_Upd';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FID;

            if chbPosting.Checked
              then Params.ParamByName('turntype').AsInteger := matTurnIn
              else Params.ParamByName('turntype').AsInteger := matTurnOrdered;

            Execute;
          end;

          if FPayDocModified then begin//Если платёж изменён, то записываем его
            if OldPayDocId > 0 then begin
              PayDocId := OldPayDocId;
              PayDocDate := edDate.Date;
            end;

            if chbPay.Checked then begin //
              if (PayDocId > 0) then begin //если платёж существует, то обновляем
                ProviderName := 'pWaybillPayDoc_Upd';
                FetchParams;
              end 
              else begin // если платёж не существует
                //Получить ID нового платежа
                PayDocId := GetMaxID(dmData.SConnection, 'paydoc', 'paydocid');
                ProviderName := 'pPayDoc_Ins';
                FetchParams;
                Params.ParamByName('withnds').AsInteger := 1;
                Params.ParamByName('doctype').AsInteger := -1;
                Params.ParamByName('notes').AsString := '';
                PayDocDate := edDate.Date + Time;
              end;// если платёж не существует

              Params.ParamByName('reason').AsString := RS('fmWaybill', 'TitleWaybill') + amountPrefix+edNum1.Text;

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

              if cbCurr.KeyValue = cbPayCurr.KeyValue
                then Params.ParamByName('onvalue').AsFloat := StrToFloat(edRate.EditingText)
                else Params.ParamByName('onvalue').AsFloat := GetCurrencyRateEx(dmData.SConnection, cbPayCurr.KeyValue, edDate.Date);

              Params.ParamByName('total').AsFloat := edPaySumm.Value;
              Params.ParamByName('checked').AsInteger := Integer(chbPosting.Checked);
              Params.ParamByName('ctypeid').AsInteger := 1;
              Execute;// Записываем изменения в paydoc

              if ProviderName = 'pPayDoc_Ins' then begin // Если плётёж новый
                ProviderName := 'pWaybillPay_Ins';       // то записываем его в WaybillPay
                FetchParams;
                Params.ParamByName('WBILLID').AsInteger := FID;
                Params.ParamByName('paydocid').AsInteger := PayDocId;
                Execute;
              end;//if ProviderName='pPayDoc_Ins'
            end // if chbPay.Checked

            else begin //Удаление платежа
              if PayDocId > 0 then begin // если он существует
                ProviderName := 'pPayDoc_Del';
                FetchParams;
                Params.ParamByName('PayDocId').AsInteger := PayDocId;
                Execute; //Удаление из PayDoc
                PayDocId := 0;
                OldPayDocId := 0;
              end;//if PayDocId>0
            end;//else chbPay.Checked

            FPayDocModified := false;
          end;//if FPayDocModified

          if not NewRecord and (FContrDocID > 0) then begin
            ProviderName := 'pDocsRel_WB_Contr_Del';
            FetchParams;
            Params.ParamByName('docid').AsInteger := FContrDocID;
            Params.ParamByName('wbillid').AsInteger := FID;
            Execute;
          end;

          if edContr.DocID > 0 then begin
            ProviderName := 'pDocsRel_WB_Contr_Ins';
            FetchParams;
            Params.ParamByName('docid').AsInteger := edContr.DocID;
            Params.ParamByName('wbillid').AsInteger := FID;
            Execute;
          end;

          FModified := False;

          TrCommit;

        except
          on e:exception do begin
            TrRollback;
            raise;
          end;
        end;

        if chbPosting.Checked and (edContr.DocID > 0)
            then DoRecalcContract(dmData.SConnection, edContr.DocID);

        DoRecalcKASaldo(dmData.SConnection, edKAgent.KAID, edDate.Date, rs('fmWaybill', 'RecalcBallance'));

        if ModalResult = mrYes then begin
          if NewRecord then begin
            edDate.Date := Date;
            edKAgent.KAID := 0;
            edReason.Text := '';
            chbPosting.Checked := false;
            mdDet.Close;

            ID := 0;

            if WBInAutoNum
              then edKAgent.Editor.SetFocus
              else edNum1.SetFocus;
          end // if NewRecord
          else begin
            if chbPosting.Checked
            then CanClose := true
            else begin
              if PDOutAutoNum and (OldPayDocID = 0) and chbPay.Checked
                then FCurrPayNum := GetDocNum(dmData.SConnection, dtPDOut, 1);

              OldPayDocId := PayDocID;
            end;
          end // else NewRecord
        end // if ModalResult = mrYes
        else CanClose := True;

        FGridRefresh := true;

        FPaySummChange := True;

        if (FOrderID > 0) and NewRecord then begin
          SendMessage(MainHandle, WM_REFRESH, FOrderID, 0);
          RefreshFun('TfmWaybill', 0);
        end
        else SendMessage(MainHandle, WM_REFRESH, ID, 0);

        RefreshFun('TfmWMat', 0);
        RefreshFun('TfmPayDoc', 0);
        RefreshFun('TfmFinance', 0);

        if RefreshAllClients then begin
          {dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
          dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
          dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
          }
        end;

      finally
        Free;
        Screen.Cursor := crDefault;
      end;
    end;// with TClientDataSet.Create(nil)
  end// if ModalResult in [mrOK, mrYes]
  else begin
    if GetDocNum(dmData.SConnection, dtWBIn, 0) = FCurrNum
      then GetDocNum(dmData.SConnection, dtWBIn, -1);

     if GetDocNum(dmData.SConnection, dtPDOut, 0) = FCurrPayNum
      then GetDocNum(dmData.SConnection, dtPDOut, -1);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end; //FormCloseQuery

//==============================================================================================
procedure TfrmEditWaybill.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  var
    FPaySum: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  if not allowALUpdate(200) then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  aAddKA.Enabled := True;

  lTotal.Caption := rs('fmWaybill', 'TotalIn', 1) + BaseCurrName;
  lTotalCurr.Caption := rs('fmWaybill', 'TotalIn', 1) + cbCurr.EditingText + ':';

  aSetRate.Enabled := (defCurrID <> cbCurr.KeyValue);

  if (chbPay.Checked) and (not PayDocChecked) then begin
    try
      FPaySum := StrToFloat(edPaySumm.EditingText);
    except
      FPaySum := 0;
    end;
  end
  else FPaySum := 1;

  if edContr.Obj.DocID > 0 then cbPayCurr.Enabled := false;

  if FGridRefresh then begin
    dbgWaybillDet.BeginUpdate;
    try
      GetSummAll;

      if (not PayDocChecked) and chbPay.Checked and not FPaySummChange and (dbgWaybillDet.Tag <> 0)
      then begin
        edPaySumm.Tag := 1;
        edPaySumm.Value := roundtoa(ALLSUMM,-2);
        edPaySumm.Tag := 0;
      end;

      dbgWaybillDet.Tag := dbgWaybillDet.Tag+1;

    finally
      dbgWaybillDet.EndUpdate;
    end;
  end;

  lSummCurr.Visible := cbCurr.KeyValue <> BaseCurrID;
  lTotalCurr.Visible := cbCurr.KeyValue <> BaseCurrID;

  aOk.Enabled := (Trim(edNum1.Text) <> '')
    and (edDate.Text <> '')
    and (edKAgent.KAID > 0)
    and (cbCurr.KeyValue > 0)
    and (not mdDet.IsEmpty)
    and (not chbPay.Checked or (chbPay.Checked and (FPaySum > 0) and (Trim(edPayNum.Editor.EditingText) <> '')));

  // marking required fields
  if edKAgent.KAID > 0
    then edKAgent.StyleController := dmData.scMainOK
    else edKAgent.StyleController := dmData.scMainErr;

  if edNum1.Text <> ''
    then edNum1.Style.StyleController := dmData.scMainOK
    else edNum1.Style.StyleController := dmData.scMainErr;

  if mdDet.IsEmpty then begin
    btnAdd.ParentColorEx := False;
    btnAdd.Color := clLime;
  end
  else btnAdd.ParentColorEx := True;

  aSelectAll.Enabled := not mdDet.IsEmpty;
  aApply.Enabled := aOk.Enabled and (FModified or FPosModified or FPayDocModified) and (FOrderID = 0);

  aCIns.Enabled := FOrderID = 0;
  itmAdd.Enabled := FOrderID = 0;
  aCDel.Enabled := not mdDet.IsEmpty and (FOrderID = 0);
  aCUpd.Enabled := not mdDet.IsEmpty and (dbgWaybillDet.SelectedCount = 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.DataModified') else _udebug := nil;{$ENDIF}

  //FPosModified := True;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    btnPrint.Hint := GetRS('fmWaybill', 'PrintWB');
    btnBallance.Hint := GetRS('fmWaybill', 'KABallance');
    btnMatInfo.Hint := GetRS('fmWaybill', 'MatInfo');
    aMatInfo.Caption := GetRS('fmWaybill', 'MatInfo');

    aAddSvc.Caption := GetRS('fmWaybill', 'SvcV');
    aAddMat.Caption := GetRS('fmWaybill', 'MatName');
    aAddMatList.Caption := GetRS('fmWaybill', 'AddMatList');
    aAddSvcList.Caption := GetRS('fmWaybill', 'AddSvcList');
    aOrdersInfo.Caption := GetRS('fmOrders', 'OrderedOut');
    btnOrdersInfo.Hint := GetRS('fmOrders', 'OrderedOut');

    aSelectAll.Caption := GetRS('Common', 'SelectAll');

    lcbWH.InitRes;
    //lcbWH.Caption := GetRS('fmWaybill', 'WHouse');
    edFind.InitRes;

    lCashDesks.Caption := GetRS('fmPayDoc', 'CashDesk') + ':';
    lNotes.Caption := GetRS('fmWaybill', 'Notes') + ':';
    lAcc.Caption := GetRS('fmPayDoc', 'Account') + ':';

    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aApply.Caption := GetRS('Common', 'Apply');
    aCIns.Caption := GetRS('Common', 'Add');
    itmAdd.Caption := GetRS('Common', 'Add');
    aCIns.Hint := GetRS('fmWaybill', 'NewPos');
    aCUpd.Caption := GetRS('Common', 'Properties');
    aCUpd.Hint := GetRS('fmWaybill', 'EditPos');
    aCDel.Caption := GetRS('Common', 'Del');
    aCDel.Hint := GetRS('fmWaybill', 'DelPos');
    aShowRealPrice.Caption := GetRS('fmWaybill', 'ShowRealPrice');
    aAddKA.Hint := GetRS('fmWaybill', 'KAAdd');
    btnPersonName.Hint := GetRS('fmWaybill', 'aPersons');
    //aSetKurs.Hint := GetRS(ParentNameEx, 'SetKurs');

    lNum.Caption := GetRS('fmWaybill', 'Num') + ':';

    edKAgent.InitRes;
    edKAgent.Caption.Caption := GetRS('fmWaybill', 'KANameIn') + ':';
    gbHeader.Caption := ' ' + GetRS('fmWaybill', 'MainInfo') + ' ';
    gbPos.Caption := ' ' + GetRS('fmWaybill', 'Positions') + ' ';

    lTot.Caption := GetRS('fmWaybill', 'withNDS') + ':';
    lTotNDSOut.Caption := GetRS('fmWaybill', 'outNDS') + ':';
    lTotNDS.Caption := GetRS('fmWaybill', 'NDS') + ':';

    lReason.Caption := GetRS('fmWaybill', 'Reason') + ':';
    lPersonname.Caption := GetRS('fmWaybill', 'PersonnameIn') + ':';

    chbPosting.Properties.Caption := GetRS('fmWaybill', 'Posting');

    colRecNo.Caption := GetRS('fmWaybill', 'NumEx');
    colPosType.Caption := '';
    colMatName.Caption := GetRS('fmWaybill', 'MatNameFull');
    colMeasureName.Caption := GetRS('fmWaybill', 'Measure');
    colAmount.Caption := GetRS('fmWaybill', 'Amount');

    colWHouseName.Caption := GetRS('fmWaybill', 'WHouse');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aCDelExecute(Sender: TObject);
  var
    FItem: TListItem;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aCDelExecute') else _udebug := nil;{$ENDIF}

  if ((dbgWaybillDet.SelectedCount = 1) and (mrYes <> ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo])))
     or ((dbgWaybillDet.SelectedCount > 1)
      and (mrYes <> ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [dbgWaybillDet.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo])))
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  Screen.Cursor := crSQLWait;
  mdDet.DisableControls;
  try
    for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
      if mdDet.Locate('posid', dbgWaybillDet.SelectedNodes[i].Values[colPosID.Index], [])
      then
        if ((mdDet.FindField('locked') <> nil) and (mdDet.FieldByName('locked').AsInteger <> 1))
            or (mdDet.FindField('locked') = nil)
        then mdDet.Delete;
    end;
    LocateAfterDel;
    RecalcSvc;
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
procedure TfrmEditWaybill.edNum1PropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.edNum1PropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  FPayDocModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.chbPostingPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.chbPostingPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  FPayDocModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfrmEditWaybill.mdMatsAfterPost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.mdMatsAfterPost') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.mdMatsAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.mdMatsAfterDelete') else _udebug := nil;{$ENDIF}

  FPosModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.mdMatsAfterEdit(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.mdMatsAfterEdit') else _udebug := nil;{$ENDIF}

  FPosModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.FormShow') else _udebug := nil;{$ENDIF}

  inherited;
  btnAdd.ImageIndex := 0;
  btnProps.ImageIndex := 1;
  btnDel.ImageIndex := 2;
  FormResize(Self);
  Screen.Cursor := crDefault;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aCUpdExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aCUpdExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  case mdDet.FieldByName('postype').AsInteger of
    0:
      with TfrmEditPosition.Create(frmEditPosition) do
      try
        ParentNameEx := Self.ParentNameEx;
        OnDate := Self.OnDate;
        WID := lcbWH.WID;
        dbgWaybillDet.SetFocus;
        PosNDS := CurrentNDS;
        NDSPayer := CurrEnt.NDSPayer;
        ParentHandle := Self.Handle;
        CurrID := cbCurr.KeyValue;
        Kurs := CurKurs;
        parentMdDet := mdDet; //Tag := integer(mdDet);
        CurrName := cdsCurr.fieldbyname('shortname').AsString;
        CurrDefName := BaseCurrName;
        CurrShortName := defCurrShortName;
        ByOrder := FOrderID > 0;
        id := mdDet.FieldByName('posid').AsInteger;
        Caption := rs('fmWaybill', 'PosEdit');
        Screen.Cursor := crDefault;
        ShowModal;

      finally
        Free;
        Screen.Cursor := crDefault;
      end;//try

    1:
      with TfrmEditPositionSvc.Create(nil) do
      try
        ParentHandle := Self.Handle;
        ParentNameEx := Self.ParentNameEx;
        OnDate := Int(edDate.Date) + Frac(edTime.Time);
        FRateValue := Self.edRate.Value;
        CurrID := Self.cbCurr.KeyValue;
        mdDet := Self.mdDet;
        chbSvcToPrice.Enabled := True;
        PosNDS := StrToFloat(mdDet.fieldbyname('NDS').AsString);
        ID := Self.mdDet.FieldByName('posid').AsInteger;
        ShowModal;
      finally
        Free;
        Screen.Cursor := crDefault;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfrmEditWaybill.FormClose(Sender: TObject; var Action: TCloseAction);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.FormClose') else _udebug := nil;{$ENDIF}

  mdDet.Close;
  cdsCurr.Close;
  cdsPayType.Close;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.cdsDetailCalcFields(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.cdsDetailCalcFields') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//Запись в mdDet NDS и Currid
//==============================================================================================
function TfrmEditWaybill.ChangeMats: boolean;
  var
    BM:TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.ChangeMats') else _udebug := nil;{$ENDIF}

  Result := True;
  with mdDet do begin
    BM := GetBookmark;
    DisableControls;

    try
      try
        First;
        while not Eof do begin
          Edit;
          FieldByName('NDS').AsFloat := CurrentNDS;
          FieldByName('CurrId').AsFloat := cbCurr.KeyValue;
          Post;
          Next;
        end;//while

      except
        Result := False;
      end;

    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
      EnableControls;
    end;
  end;//while

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.mdDetAfterPost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.mdDetAfterPost') else _udebug := nil;{$ENDIF}

  FPosModified := True;
  //FGridRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.mdDetAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.mdDetAfterDelete') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aSetTimeExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aSetTimeExecute') else _udebug := nil;{$ENDIF}

  edTime.Time := Time;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aAddKAExecute(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aAddKAExecute') else _udebug := nil;{$ENDIF}

  if edContr.Editor.Focused
    then edContr.ShowRef
    else if lcbWH.Combo.Focused
      then lcbWH.ShowRef
      else if FCurrCtrl = lcbPersonName then begin
        try
          aid := lcbPersonName.KeyValue;
        except
          aid := 0;
        end;

        lcbPersonName.SetFocus;
        lcbPersonName.Tag := 1;
        ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
        lcbPersonName.Tag := 0;
      end
      else if FCurrCtrl = lcbPayType then begin
        ShowFinance(Self, Date, 1);
      end
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
      end
      else if edKAgent.Editor.Focused then edKAgent.ShowRef;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aShowRealPriceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aShowRealPriceExecute') else _udebug := nil;{$ENDIF}

  try
    aShowRealPrice.Checked := not aShowRealPrice.Checked;
    dbgWaybillDet.Repaint;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.chbPayPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.chbPayPropertiesChange') else _udebug := nil;{$ENDIF}

  // Заполнение полей
  if chbPay.Enabled then begin
    if (chbPay.Checked)then begin
      if PDOutAutoNum and (OldPayDocID = 0) then begin
        FCurrPayNum := GetDocNum(dmData.SConnection,dtPDOut,1);
        edPayNum.Text := PDOutPrefix+IntToStr(FCurrPayNum)+PDOutSuffix;
      end
      else edPayNum.Text := FPayNum;
      edPaySumm.Tag := 1;
      edPaySumm.Value := roundtoa(AllSummCurr, -2);
      edPaySumm.Tag := 0;
  //cbPayCurr.KeyValue := BaseCurrID;
    end //if (chbPay.Checked)
    else begin
      if PDOutAutoNum and (OldPayDocID = 0) then begin
        if GetDocNum(dmData.SConnection, dtPDOut, 0) = FCurrPayNum
          then GetDocNum(dmData.SConnection, dtPDOut, -1);
      end;
      edPayNum.Text := '';
      edPaySumm.Tag := 1;
      edPaySumm.Value := 0;
      edPaySumm.EditText := '';
      edPaySumm.Tag := 0;
  //cbPayCurr.KeyValue := BaseCurrID;
      FPaySummChange := false;
    end; // else

    FPayDocModified := true;
  end;//if chbPay.Enabled

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.edPaySummPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.edPaySummPropertiesChange') else _udebug := nil;{$ENDIF}

  FPayDocModified := true;
  if edPaySumm.Tag = 0 then FPaySummChange := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.chbCheckNDSPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.chbCheckNDSPropertiesChange') else _udebug := nil;{$ENDIF}

  if chbCheckNDS.Tag <> 1 then begin
    if chbCheckNDS.Checked
      then CurrentNDS := NDS
      else CurrentNDS := 0;

    ChangeMats;
    FGridRefresh := true;
    FModified := true;
    FPosModified := true;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.FormCreate(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  FormStorage.IniFileName := MainRegKey;
  FormStorage.IniSection := Self.Name;
  FormStorage.Active := True;

  prvDet := 'pWaybillDet_GetIn'; // select * from sp_wbd_get_in(:wbillid) (1.4.9)
  FCurrPayNum := -1;
  btnPersonName.ImageIndex := 67;
  btnFinPay.ImageIndex := 44;
  mdSvc.Open;

  edKAgent.SetLng;
  edFind.SetLng;

  lcbWH.RefreshItemsDS;

  chbPosting.Checked := DefCheckWB;
  cdsPayMPersons.Open;
  lcbPayMPerson.KeyValue := -1;
  lcbPayMPerson.Text := '';

  edKAgent.LoadFromRegistry(MainRegKey + '\' + Self.Name + '\KAFind');
  edFind.LoadFromRegistry(MainRegKey + '\' + Self.Name + '\PosFind');
  (*
  {$IFDEF LITE}
  edContr.OnRefButtonClick := NoAccess;
  {$ENDIF}
  *)

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.WMDelete(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.WMDelete') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtPersons: DSRefresh(cdsPersonName, 'kaid', 0);
    //rtKAgent: DSRefresh(cdsKAgent, 'kaid', 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.lcbPersonNameKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.lcbPersonNameKeyPress') else _udebug := nil;{$ENDIF}

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
procedure TfrmEditWaybill.cbPayCurrKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.cbPayCurrKeyPress') else _udebug := nil;{$ENDIF}

  if Key = #13 then begin
    Key := #0;
    if btnOk.Enabled
      then btnOk.SetFocus
      else btnCancel.SetFocus;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.lcbPersonNameExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.lcbPersonNameExit') else _udebug := nil;{$ENDIF}

  lcbPersonName.SelStart := 0;
  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.edPaySummKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.edPaySummKeyPress') else _udebug := nil;{$ENDIF}

  GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.FormDestroy(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.FormDestroy') else _udebug := nil;{$ENDIF}

  edKAgent.SaveToRegistry(MainRegKey + '\' + Self.Name + '\KAFind');
  edFind.SaveToRegistry(MainRegKey + '\' + Self.Name + '\PosFind');

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  edFind.SetLng;
  edKAgent.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aPrintExecute(Sender: TObject);
  var
    FSumWONDS, FNDS, FSumWithNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aPrintExecute') else _udebug := nil;{$ENDIF}

  if mdDet.IsEmpty then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  mdReport.CopyFromDataSet(mdDet);

  mdReport.Close;

  with TFloatField.Create(mdReport) do  begin
    FieldName := 'price2';
    FieldKind := fkData;
    Required := False;
    DataSet := mdReport;
    mdReport.FieldDefs.Add(FieldName, ftFloat, 0, false);
  end;

  mdReport.LoadFromDataSet(mdDet);

  mdReport.First;
  while not mdReport.Eof do begin
    if mdReport.FieldByName('svctoprice').AsInteger = 1 then begin
      mdReport.Delete;
      Continue;
    end;

    mdReport.Edit;
    mdReport.FieldByName('price2').AsFloat := mdReport.FieldByName('price').AsFloat;

    if PrintType = 0 then begin
      NDSCalc(1, mdReport.FieldByName('price').AsFloat, mdReport.FieldByName('nds').AsFloat, 1, FSumWONDS, FNDS);
      FSumWithNDS := RoundToA(FSumWONDS + FNDS, -2);
      FSumWONDS := FSumWithNDS - FNDS;
      mdReport.FieldByName('price').AsFloat := FSumWONDS;
    end;

    mdReport.Post;
    mdReport.Next;
  end;

  FGridRefresh := True;

  if optWBInRepSortDesc
    then mdReport.SortOptions := [soDesc,soCaseInsensitive]
    else mdReport.SortOptions := [soCaseInsensitive];

  mdReport.SortedField := WBRepSortFieldNames[optWBInRepSortField];

  SmartShowRep(frDoc, 'Waybill_In.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aBallanceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aBallanceExecute') else _udebug := nil;{$ENDIF}

  if not ShowBallance then begin
    AccessDenied;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if edKAgent.KAID <= 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmKATurnover.Create(nil) do
    try
      ParentNameEx := 'fmKAgent';
      OnDate := Self.OnDate;
      ID := edKAgent.KAID;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aMatInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aMatInfoExecute') else _udebug := nil;{$ENDIF}

  if dbgWaybillDet.SelectedCount <> 1 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

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
procedure TfrmEditWaybill.frDocGetValue(const ParName: String; var ParValue: Variant);
  var
    FSumm, FWONDS, FNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.frDocGetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'item') then begin
    case OptWBInShowModel of
      1: ParValue := mdReport.FieldByName('artikul').AsString;
      2: ParValue := mdReport.FieldByName('matname').AsString + #13#10'(' + mdReport.FieldByName('artikul').AsString + ')';
      else ParValue := mdReport.FieldByName('matname').AsString;
    end
  end
  else if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := edNum1.Text
  else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := edDate.Text
  else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
  else if 0 = AnsiCompareText(ParName, 'rate') then ParValue := CurKurs
  else if 0 = AnsiCompareText(ParName, 'kafullname') then ParValue := edKAgent.Editor.Text
  else if 0 = AnsiCompareText(ParName, 'reason') then ParValue := edReason.Text
  else if 0 = AnsiCompareText(ParName, 'printtype') then ParValue := PrintType
  else if 0 = AnsiCompareText(ParName, 'PriceDisplayFormatEx') then ParValue := PriceDisplayFormatEx
  else if 0 = AnsiCompareText(ParName, 'possum') then begin
    if PrintType=0 then begin
      NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
              mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);

       FSumm := RoundToA(FWONDS+FNDS, -2);
       FWONDS := FSumm - FNDS;

       ParValue := FWONDS;
    end
    else begin
      NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
              mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);

      ParValue := RoundToA(FWONDS + FNDS, -2);
    end;
  end
  else if 0 = AnsiCompareText(ParName, 'possumwonds') then begin
    NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
            mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);

    ParValue := RoundToA(FWONDS + FNDS, -2);
    FNDS := RoundToA(FNDS, -2);
    ParValue := ParValue - FNDS;
  end
  else if 0 = AnsiCompareText(ParName, 'curnds') then begin
    if chbCheckNDS.Checked
      then ParValue := NDS
      else ParValue := 0;
  end
  else if 0 = AnsiCompareText(ParName, 'propis') then begin
    FSumm := StrToFloat(DelChars(lSummDef.Caption, [ThousandSeparator]));
    ParValue := MoneyToStr(FSumm);
  end
  else if 0 = AnsiCompareText(ParName, 'personname') then ParValue := lcbPersonName.Text
  else if 0 = AnsiCompareText(ParName, 'received') then ParValue := ''
  else if 0 = AnsiCompareText(ParName, 'att') then ParValue := ''
  else if 0 = AnsiCompareText(ParName, 'sumnds') then ParValue := StrToFloat(DelChars(lSummDefNDS.Caption, [ThousandSeparator]))
  else if 0 = AnsiCompareText(ParName, 'sumall') then ParValue := StrToFloat(DelChars(lSummDef.Caption, [ThousandSeparator]));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.edKAgentEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.edKAgentEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := edKAgent;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.lcbPersonNameEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.lcbPersonNameEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPersonName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.sbAddKAgentMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.sbAddKAgentMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := edKAgent;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.sbAddKAgentMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.sbAddKAgentMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.btnPersonNameMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.btnPersonNameMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.btnPersonNameMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.btnPersonNameMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPersonName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.chbPayKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.chbPayKeyPress') else _udebug := nil;{$ENDIF}

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
procedure TfrmEditWaybill.lcbPersonNamePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.lcbPersonNamePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  with Sender as TcxComboBox do begin
    SelStart := 0;
    SelLength := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.dbgWaybillDetCustomDrawCell') else _udebug := nil;{$ENDIF}

  if odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.dbgWaybillDetDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.dbgWaybillDetDblClick') else _udebug := nil;{$ENDIF}

  if aCUpd.Enabled then aCUpd.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.dbgWaybillDetKeyPress') else _udebug := nil;{$ENDIF}

  if chbPay.Enabled and (Key = #13)
    then chbPay.SetFocus
    else if btnOk.Enabled
      then btnOk.SetFocus
      else btnCancel.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aKAFindParamsExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aKAFindParamsExecute') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditWaybill.dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.dbgWaybillDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'DocWBIn');
  ImgList := dmData.Images;
  AIndex := II_WBIN;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.edKAgentChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.edKAgentChange') else _udebug := nil;{$ENDIF}

  DataModified(Sender);

  if (PayDocId > 0) and (edKAgent.KAID <> oldkaid) and chbPay.Checked then
    if mrYes = ssMessageDlg(rs('fmWaybill', 'KAChangeError') + edPayNum.Text + '?', ssmtWarning, [ssmbYes, ssmbNo])
    then begin
      PayDocChecked := false;
      chbPay.Enabled := true;
      chbPay.Checked := false;
      OldPayDocId := PayDocId;
      PayDocId := 0;
      oldkaid := edKAgent.KAID;
      FModified := true;
    end
    else edKAgent.KAID := oldkaid;

  if not edContr.Editor.Focused and not edContr.Locked
  then begin
    FCurrCtrl := edKAgent;

    if not edKAgent.Obj.Contracts.IsEmpty and edKAgent.Obj.Contracts.Locate('doctype', 8, [])
      then edContr.DocID := edKAgent.Obj.Contracts.FieldByName('docid').AsInteger
      else edContr.DocID := 0;

    //edContr.KAID := edKAgent.KAID;
    FCurrCtrl := nil;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.btnPayMPersonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.btnPayMPersonMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPayMPerson;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.lcbPayMPersonEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.lcbPayMPersonEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPayMPerson;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.lcbPayMPersonExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.lcbPayMPersonExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.colAmountGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, StrToFloat(AText));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.btnCashDesksMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.btnCashDesksMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbCashDesks;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.btnCashDesksMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.btnCashDesksMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.lcbCashDesksEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.lcbCashDesksEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.edKAgentExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.edKAgentExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.edContrChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.edContrChange') else _udebug := nil;{$ENDIF}

  //if (FCurrCtrl <> edKAgent) and Visible then edKAgent.KAID := edContr.Obj.KAID;
  if (edContr.Obj.DocID > 0) and (cbCurr.KeyValue <> edContr.Obj.CurrID) then cbCurr.KeyValue := edContr.Obj.CurrID;
  if (edContr.Obj.DocID > 0) and (cbPayCurr.KeyValue <> edContr.Obj.CurrID) then cbPayCurr.KeyValue := edContr.Obj.CurrID;

  cbCurr.Enabled := not (edContr.Obj.DocID > 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.cbCurrPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.cbCurrPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  inherited;

  cbPayCurr.KeyValue := CurrID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.edRatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.edRatePropertiesChange') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aCInsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aCInsExecute') else _udebug := nil;{$ENDIF}

  case WBInDefAction of
    aaMat:     aAddMat.Execute;
    aaSvc:     aAddSvc.Execute;
    aaMatList: aAddMatList.Execute;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aAddMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aAddMatExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  with TfrmEditPosition.Create(frmEditPosition) do
  try
    ParentNameEx := Self.ParentNameEx;
    OnDate := edDate.Date + edTime.Time;
    WID := lcbWH.WID;
    PosNDS := CurrentNDS;
    NDSPayer := CurrEnt.NDSPayer;
    ParentHandle := Self.Handle;
    CurrID := Self.cbCurr.KeyValue;
    Kurs := CurKurs;
    parentMdDet := mdDet; //Tag := integer(mdDet);
    ByOrder := FOrderID > 0;
    id := 0;
    CurrDefName := BaseCurrName;
    CurrShortName := defCurrShortName;
    CurrName := cdsCurr.fieldbyname('shortname').AsString;
    Caption := rs('fmWaybill', 'PosAdd');
    Screen.Cursor := crDefault;
    ShowModal;

  finally
    if not mdDet.IsEmpty then begin
      //dbgWaybillDet.Enabled := true;
      dbgWaybillDet.SetFocus;
    end;

    Free;
    Screen.Cursor := crDefault;
  end;//try

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aAddSvcExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aAddSvcExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditPositionSvc.Create(nil) do
  try
    ParentHandle := Self.Handle;
    ParentNameEx := Self.ParentNameEx;
    OnDate := Int(edDate.Date) + Frac(edTime.Time);
    FRateValue := Self.edRate.Value;
    CurrID := Self.cbCurr.KeyValue;
    mdDet := Self.mdDet;
    PosNDS := NDS;
    chbSvcToPrice.Enabled := True;
    ShowModal;
    dbgWaybillDet.SetFocus;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aAddMatListExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aAddMatListExecute') else _udebug := nil;{$ENDIF}

  DocInfo.CurrName := cbCurr.Text;
  DocInfo.CurrID := cbCurr.KeyValue;
  DocInfo.CurrRate := edRate.Value;
  DocInfo.OnDate := edDate.Date;

  if CurrEnt.NDSPayer
    then DocInfo.NDS := CurrentNDS
    else DocInfo.NDS := 0;

  if (edKAgent.KAID <> 0) and (edKAgent.Obj.PTypeID > 0)
    then DocInfo.PTypeID := edKAgent.Obj.PTypeID
    else DocInfo.PTypeID := GetDefPriceType;

  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, 0, Integer(@DocInfo));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.TBSubmenuItem1Click(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.TBSubmenuItem1Click') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditWaybill.FillMatsFromRef(DS: TssMemoryData);
  var
    FPosID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.FillMatsFromRef') else _udebug := nil;{$ENDIF}

  with mdDet do begin
    if not mdDet.Active then mdDet.Open;

    DS.First;
    mdDet.DisableControls;

    while not DS.Eof do begin
      FPosID := dsNextPosID(mdDet);
      Append;
      FieldByName('posid').AsInteger := FPosID;
      FieldByName('matid').AsInteger := DS.FieldByName('matid').AsInteger;
      FieldByName('postype').AsInteger := DS.Tag;

      if DS.Tag = 1 then FieldByName('norm').AsFloat := 1;

      FieldByName('discount').AsFloat := 0;
      FieldByName('matname').AsString := DS.FieldByName('name').AsString;
      FieldByName('msrname').AsString := DS.FieldByName('msrname').AsString;
      FieldByName('artikul').AsString := DS.FieldByName('artikul').AsString;
      FieldByName('amount').AsFloat := DS.FieldByName('amount').AsFloat;
      FieldByName('price').AsFloat := DS.FieldByName('price').AsFloat;
      FieldByName('fullprice').AsFloat := DS.FieldByName('price').AsFloat;

      if CurrEnt.NDSPayer
        then FieldByName('nds').AsFloat := CurrentNDS
        else FieldByName('nds').AsFloat := 0;

      FieldByName('currid').AsInteger := cbCurr.KeyValue;
      FieldByName('wid').AsInteger := lcbWH.WID;
      FieldByName('whname').AsString := lcbWH.Combo.Text;
      FieldByName('currname').AsString := cbCurr.Text;
      FieldByName('onvalue').AsFloat := edRate.Value;
      FieldByName('producer').AsString := DS.FieldByName('producer').AsString;
      FieldByName('barcode').AsString := DS.FieldByName('barcode').AsString;
      Post;
      UpdatePos;
      DS.Next;
    end;
  end;

  RecalcSvc;
  mdDet.EnableControls;
  FGridRefresh := True;
  dbgWaybillDet.Adjust(nil, [colPosType, colRecNo]);

  dbgWaybillDet.ClearSelection;
  if dbgWaybillDet.FocusedNode <> nil
    then dbgWaybillDet.FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.lcbWHChange(Sender: TObject);
  var
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.lcbWHChange') else _udebug := nil;{$ENDIF}

  if not mdDet.IsEmpty and (mrYes = ssMessageDlg(Format(rs('fmWaybill', 'WHChanged'), [lcbWH.Combo.Text]), ssmtConfirmation, [ssmbYes, ssmbNo]))
  then begin
    BM := mdDet.GetBookmark;
    mdDet.DisableControls;
    fProgress.Caption := rs('Common', 'Executing');
    fProgress.UpDate;
    fProgress.pbMain.Max := mdDet.RecordCount;
    fProgress.Show;

    try
      mdDet.First;
      while not mdDet.Eof do begin
        fProgress.lText.Caption := mdDet.FieldByName('matname').AsString;
        mdDet.Edit;
        mdDet.FieldByName('whname').AsString := lcbWH.Combo.Text;
        mdDet.FieldByName('wid').AsInteger := lcbWH.WID;
        mdDet.Post;
        mdDet.Next;
        fProgress.pbMain.StepIt;
        Application.ProcessMessages;
      end;

    finally
      mdDet.GotoBookmark(BM);
      mdDet.FreeBookmark(BM);
      mdDet.EnableControls;
      fProgress.Hide;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditWaybill.CreateByOrder(AID: Integer): Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.CreateByOrder') else _udebug := nil;{$ENDIF}

  Result := 0;

  with newDataSet do
  try
    mdDet.Close;
    mdDet.Open;

    FOrderID := AID;

    ProviderName := 'pWaybill_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AID;
    Open;
    edKAgent.OnChange := nil;
    edKAgent.KAID := FieldByName('kaid').AsInteger;
    edKAgent.OnChange := edKAgentChange;
    edKAgent.Enabled := False;
    edContr.Enabled := False;
    edReason.Text := rs('fmWaybill', 'ByOrder',1) + amountPrefix + FieldByName('num').AsString;
    edDate.Date := Self.OnDate;
    cbCurr.KeyValue := FieldByName('currid').AsInteger;

    if FieldByName('attnum').AsString <> '' then lcbWH.WID := FieldByName('attnum').AsInteger;

    edRate.Value := FieldByName('onvalue').AsFloat;
    Close;

    ProviderName := 'pDocsRel_WB_Contr_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AID;
    Params.ParamByName('doctype').AsInteger := 8;
    Open;
    if not IsEmpty then edContr.DocID := FieldByName('rdocid').AsInteger;
    Close;

    ProviderName := prvDet;
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AID;
    Open;
    mdDet.LoadFromDataSet(Fields[0].DataSet);
    mdDet.First;
    while not mdDet.Eof do begin
      mdDet.Edit;
      mdDet.FieldByName('fullprice').AsFloat := mdDet.FieldByName('price').AsFloat;
      mdDet.Post;
      UpdatePos;
      mdDet.Next;
    end;

    mdDet.First;

    if not mdDet.IsEmpty then begin
      if dbgWaybillDet.FocusedNode = nil
        then dbgWaybillDet.FocusedAbsoluteIndex := 0;

      dbgWaybillDet.FocusedNode.Selected := True;
    end;

    Close;

  finally
    Free;
  end;
  cbCurr.Enabled := False;
  FRateChanged := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aOrdersInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aOrdersInfoExecute') else _udebug := nil;{$ENDIF}

  ShowOrdersInfo(edKAgent.KAID, 16, OnDate);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aActivateFindExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aActivateFindExecute') else _udebug := nil;{$ENDIF}

  edFind.Editor.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.aAddSvcListExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.aAddSvcListExecute') else _udebug := nil;{$ENDIF}

  DocInfo.CurrName := cbCurr.Text;
  DocInfo.CurrID := cbCurr.KeyValue;
  DocInfo.CurrRate := edRate.Value;
  DocInfo.OnDate := edDate.Date;

  if CurrEnt.NDSPayer
    then DocInfo.NDS := CurrentNDS
    else DocInfo.NDS := 0;

  if (edKAgent.KAID <> 0) and (edKAgent.Obj.PTypeID > 0)
    then DocInfo.PTypeID := edKAgent.Obj.PTypeID
    else DocInfo.PTypeID := GetDefPriceType;

  ShowModalRef(Self, rtServices, vtServices, 'TfmServices', Self.OnDate, 0, Integer(@DocInfo));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.UpdatePos;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.UpdatePos') else _udebug := nil;{$ENDIF}

  inherited;

  with mdDet do begin
    if FieldByName('postype').AsInteger = 1 then begin
      if mdSvc.Locate('posid', FieldByName('posid').AsInteger, [])
        then mdSvc.Edit
        else mdSvc.Append;

      mdSvc.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
      mdSvc.FieldByName('amount').AsFloat := FieldByName('amount').AsFloat;
      mdSvc.FieldByName('norm').AsFloat := FieldByName('norm').AsFloat;
      mdSvc.FieldByName('svctoprice').AsInteger := FieldByName('svctoprice').AsInteger;
      mdSvc.FieldByName('price').AsFloat := FieldByName('price').AsFloat;
      mdSvc.FieldByName('total').AsFloat := FieldByName('sumcurr').AsFloat;
      mdSvc.FieldByName('totalwithnds').AsFloat := FieldByName('sumwithnds').AsFloat;
      mdSvc.Post;
      RecalcSvc;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.mdDetBeforeDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.mdDetBeforeDelete') else _udebug := nil;{$ENDIF}

  if (DataSet.FieldByName('postype').AsInteger = 1)
     and mdSvc.Locate('posid', DataSet.FieldByName('posid').AsInteger, [])
  then mdSvc.Delete;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.RecalcSvc;
  var
    FTotAmount, FSvcSum: Extended;
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.RecalcSvc') else _udebug := nil;{$ENDIF}

  FTotAmount := 0;
  BM := nil;

  with mdDet do
  try
    DisableControls;
    BM := mdDet.GetBookmark;

    First;
    while not Eof do begin
      if FieldByName('postype').AsInteger = 0
        then FTotAmount := FTotAmount + FieldByName('amount').AsFloat * FieldByName('fullprice').AsFloat;

      Next;
    end;

    if FTotAmount = 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    FSvcSum := GetDSSummCurr(mdSvc, 'total', 'svctoprice', 1);

    First;
    while not Eof do begin
      if FieldByName('postype').AsInteger = 0 then begin
        Edit;

        FieldByName('price').AsFloat := FieldByName('fullprice').AsFloat
          + FSvcSum * FieldByName('fullprice').AsFloat / FTotAmount;

        Post;
        UpdatePos;
      end;

      Next;
    end;

  finally
    if BM <> nil then begin
      GotoBookmark(BM);
      FreeBookmark(BM);
    end;
    
    EnableControls;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.GetSummAll;
  var
    i: Integer;
    PriceCurrOutNDS, SummCurrOutNDS, SummCurrNDS, SummCurr, FAmount, FNorm,
    PriceDefOutNDS, SummDefOutNDS, SummDefNDS, SummDef,
    AllSummDefOutNDS, AllSummDefNDS, AllSummDef, FNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.GetSummAll') else _udebug := nil;{$ENDIF}

  with dbgWaybillDet do begin
    AllSummCurr := 0;
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;
    NullPricePresent := False;

    for i := 0 to Count - 1 do begin
      if VarToInt(Items[i].Values[colSvcToPrice.Index]) = 1 then Continue;

      FAmount := 0;
      
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

        {Цены с НДС и без НДС}
        NDSCalc(1, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * CurKurs, FNDS, 1, SummDefOutNDS, SummDefNDS);

        NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * CurKurs, FNDS, 1, SummDefOutNDS, SummDefNDS);

        SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
        AllSummDefOutNDS := AllSummDefOutNDS + SummDefOutNDS;
        AllSummDefNDS := AllSummDefNDS + RoundToA(SummDefNDS, -2);
        //Сумма в нац. валюте с НДС;
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
procedure TfrmEditWaybill.colSummDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.colSummDefGetText') else _udebug := nil;{$ENDIF}

  if VarToInt(ANode.Values[colSvcToPrice.Index]) = 1
    then AText := ''
    else if AText <> ''
      then AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybill.FormConstrainedResize') else _udebug := nil;{$ENDIF}

  inherited;
  MinWidth := 750;
  MinHeight := 370;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditWaybill', @Debugging, DEBUG_group_ID);

//==============================================================================================
finalization
  //debugUnregisterUnit(DEBUG_unit_ID);

end.
