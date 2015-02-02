{$I ok_sklad.inc}
unit EditWaybillOut;

interface

uses
  dxCntner6, dxEditor6, dxExEdtr6, dxTL6, dxDBCtrl6, dxDBGrid6, dxGrClms6, dxDBTLCl6, dxmdaset,
  cxMemo, cxCheckBox, cxControls, cxContainer, cxPC, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, cxDropDownEdit,
  cxTreeView, cxListView, cxDBEdit, cxGraphics, cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxMaskEdit, cxButtonEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox, cxCalendar, cxSpinEdit, cxCalc, cxTimeEdit,
  ssBaseTypes, ssFormStorage, ssBaseDlg, ssMemDS, ssImagePanel, ssGroupBox,
  ssBevel, ssSpeedButton, ssPanel, ssGradientPanel, ssCalcEdit, ssDBLookupCombo, ssLabel,
  ssDBGrid, ssBaseWBDocDlg, ssBaseWBDocDlgWithPayment, ssPageControl, okSearchEdit,
  ssDBComboBox, ssBaseConst, ssClientDataSet,
  xLngDefs, FR_DSet, FR_DBSet, FR_Class, FR_Desgn, prTypes,
  DBCtrls, Buttons, DBClient, DB, Menus,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ActnList,
  ImgList, xButton, TB2Item, TB2Dock, TB2Toolbar, xCtrls, Grids, ComCtrls, DBGrids;

type
  TfrmEditWaybillOut = class(TfrmBaseWBDocDlgWithPayment)
    aActivateFind: TAction;
    aAddKA: TAction;
    aAddMat: TAction;
    aAddMatList: TAction;
    aAddSvc: TAction;
    aAddSvcList: TAction;
    aAtt: TAction;
    aCDel: TAction;
    aChangeEnt: TAction;
    aCIns: TAction;
    aCUpd: TAction;
    aOrdersInfo: TAction;
    aPayMPersons: TAction;
    aPersons: TAction;
    aRemoveRsv: TAction;
    aRemoveRsvAll: TAction;
    aSelectAll: TAction;
    aSetDiscount: TAction;
    aSetKurs: TAction;
    aSetRsv: TAction;
    aSetRsvAll: TAction;
    aShowSN: TAction;
    btnAtt: TxButton;
    btnOrdersInfo: TssSpeedButton;
    btnPersonName: TssSpeedButton;
    btnPosAdd: TssSpeedButton;
    btnPosDel: TssSpeedButton;
    btnPosProps: TssSpeedButton;
    cdsFind: TssClientDataSet;
    cdsPersonName: TssClientDataSet;
    cdsRsv_Temp: TssClientDataSet;
    chbPosting: TcxCheckBox;
    chbRetNDS: TcxCheckBox;
    colWarrantyPeriod: TdxDBGridColumn;
    colWarrantyPeriodType: TdxDBGridColumn;
    DataSource1: TDataSource;
    DateTimeField1: TDateTimeField;
    dsmdTmpIds: TDataSource;
    dsmdWMatTurn: TDataSource;
    dsmdWMatTurnOld: TDataSource;
    dsPayType: TDataSource;
    edContr: TokContractSearchEdit;
    edFind: TokGridSearchEdit;
    edKAgent: TokKASearchEdit;
    edNotes: TcxTextEdit;
    edNum1: TcxTextEdit;
    edReason: TcxTextEdit;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    frDBDataSet1: TfrDBDataSet;
    frDoc: TfrReport;
    FsrcTaxes: TfrDBDataSet;
    imnuAdd: TTBSubmenuItem;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    itmAddMatList: TTBItem;
    itmColOptions: TTBItem;
    lcbPersonName: TssDBLookupCombo;
    lEntEx: TxLabelEx;
    lNotes: TLabel;
    lNum: TLabel;
    lPersonname: TLabel;
    lReason: TLabel;
    lTitle: TLabel;
    mdAcc: TdxMemData;
    mdDC: TdxMemData;
    mdDCcardid: TIntegerField;
    mdDCposid: TIntegerField;
    mdDCT: TssMemoryData;
    mdDCTcardid: TIntegerField;
    mdDCTonvalue: TFloatField;
    mdDCtotal: TFloatField;
    mdDCTtreshold: TFloatField;
    mdDetbySN: TIntegerField;
    mdDetrealposid: TIntegerField;
    mdDetstatus: TIntegerField;
    mdDettaxsum: TFloatField;
    mdDetwarrantyperiod: TIntegerField;
    mdDetwarrantyperiodtype: TIntegerField;
    mdPosition: TssMemoryData;
    mdPositionamount: TFloatField;
    mdPositioncertdate: TDateTimeField;
    mdPositioncertnum: TStringField;
    mdPositioncurrid: TIntegerField;
    mdPositioncurrname: TStringField;
    mdPositionDiscount: TFloatField;
    mdPositiondocdate: TDateTimeField;
    mdPositiondocnum: TStringField;
    mdPositiongtd: TStringField;
    mdPositionmatid: TIntegerField;
    mdPositionNDS: TFloatField;
    mdPositionondate: TDateTimeField;
    mdPositiononvalue: TFloatField;
    mdPositionposid: TIntegerField;
    mdPositionpostype: TIntegerField;
    mdPositionprice: TCurrencyField;
    mdPositionproducer: TStringField;
    mdPositionSN: TStringField;
    mdPositionwhname: TStringField;
    mdPositionwid: TIntegerField;
    mdReport: TdxMemData;
    mdRsv: TssMemoryData;
    mdRsvcurrname: TStringField;
    mdRsvpricein: TFloatField;
    mdRsvSN: TStringField;
    mdTaxes: TdxMemData;
    mdTaxesname: TStringField;
    mdTaxesonvalue: TFloatField;
    mdTaxestaxid: TIntegerField;
    mdTaxestaxsumm: TFloatField;
    mdTmpIds: TdxMemData;
    mdTmpIdsamount: TFloatField;
    mdTmpIdsforall: TIntegerField;
    mdTmpIdsfree: TIntegerField;
    mdTmpIdsposid: TIntegerField;
    mdTmpIdsSourceID: TIntegerField;
    mdTmpIdsTmpId: TIntegerField;
    mdWMatTurn: TdxMemData;
    mdWMatTurnamount: TFloatField;
    mdWMatTurnflag: TIntegerField;
    mdWMatTurnmatid: TIntegerField;
    mdWMatTurnOld: TdxMemData;
    mdWMatTurnondate: TDateTimeField;
    mdWMatTurnposid: TIntegerField;
    mdWMatTurnSN: TStringField;
    mdWMatTurnsourceid: TIntegerField;
    mdWMatTurnturntype: TIntegerField;
    mdWMatTurnwid: TIntegerField;
    panPosBar: TPanel;
    pmMain: TTBPopupMenu;
    pmMatSvc: TTBPopupMenu;
    srcEnt: TDataSource;
    srcPersonName: TDataSource;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    TBItem1: TTBItem;
    TBItem20: TTBItem;
    TBItem21: TTBItem;
    TBItem22: TTBItem;
    TBItem23: TTBItem;
    TBItem24: TTBItem;
    TBItem25: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBSeparatorItem11: TTBSeparatorItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBSeparatorItem9: TTBSeparatorItem;

    procedure aActivateFindExecute(Sender: TObject);
    procedure aAddMatExecute(Sender: TObject);
    procedure aAddMatListExecute(Sender: TObject);
    procedure aAddSvcExecute(Sender: TObject);
    procedure aAddSvcListExecute(Sender: TObject);
    procedure aAttExecute(Sender: TObject);
    procedure aBallanceExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aCDelExecute(Sender: TObject);
    procedure aChangeEntExecute(Sender: TObject);
    procedure aCInsExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCUpdExecute(Sender: TObject);
    procedure aMatInfoExecute(Sender: TObject);
    procedure aOrdersInfoExecute(Sender: TObject);
    procedure aPersonsExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aRemoveRsvAllExecute(Sender: TObject);
    procedure aRemoveRsvExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aSetDiscountExecute(Sender: TObject);
    procedure aSetRsvAllExecute(Sender: TObject);
    procedure aSetRsvExecute(Sender: TObject);
    procedure aSetTimeExecute(Sender: TObject);
    procedure aShowSNExecute(Sender: TObject);
    procedure aSvcInfoExecute(Sender: TObject);
    procedure btnAttClick(Sender: TObject);
    procedure btnAttKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure btnAttMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPayMPersonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPayMPersonMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure btnPersonNameMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPersonNameMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cbCurrPropertiesEditValueChanged(Sender: TObject);
    procedure ChangeMatsCur;
    procedure chbPayPropertiesChange(Sender: TObject);
    procedure chbPostingClick(Sender: TObject);
    procedure chbPostingPropertiesChange(Sender: TObject);
    procedure colAmountGetText(Sender: TObject; ANode: TdxTreeListNode;var AText: String);
    procedure colNormGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceInCurrGetText(Sender: TObject;ANode: TdxTreeListNode; var AText: String);
    procedure colStatusGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colWarrantyPeriodGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure DataModified(Sender: TObject);
    procedure dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgWaybillDetDblClick(Sender: TObject);
    procedure dbgWaybillDetGetOptionsTitle(Sender: TObject;var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
    procedure edContrChange(Sender: TObject);
    procedure edDatePropertiesChange(Sender: TObject);
    procedure edKAgentChange(Sender: TObject);
    procedure edKAgentEnter(Sender: TObject);
    procedure edKAgentExit(Sender: TObject);
    procedure edNum1KeyPress(Sender: TObject; var Key: Char);
    procedure edNum1PropertiesChange(Sender: TObject);
    procedure edPaySummPropertiesChange(Sender: TObject);
    procedure edReasonPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frDocBeginDoc;
    procedure frDocEndDoc;
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure frDocUserFunction(const Name: String; p1, p2, p3: Variant; var Val: Variant);
    procedure GetKAPersons(KAID:integer);
    procedure imnuAddClick(Sender: TObject);
    procedure lcbPayMPersonEnter(Sender: TObject);
    procedure lcbPayMPersonExit(Sender: TObject);
    procedure lcbPersonNameEnter(Sender: TObject);
    procedure lcbPersonNameExit(Sender: TObject);
    procedure lcbPersonNameKeyPress(Sender: TObject; var Key: Char);
    procedure lcbPersonNamePropertiesChange(Sender: TObject);
    procedure lcbPersonNamePropertiesEditValueChanged(Sender: TObject);
    procedure lEntExItemClick(Sender: TObject; Index: Integer);
    procedure mdDetAfterPost(DataSet: TDataSet);
    procedure mdDetBeforeDelete(DataSet: TDataSet);
    procedure mdDetCalcFields(DataSet: TDataSet);
    procedure mdMatsAfterDelete(DataSet: TDataSet);
    procedure mdMatsAfterEdit(DataSet: TDataSet);
    procedure mdMatsAfterPost(DataSet: TDataSet);
    procedure mdWMatTurnAfterDelete(DataSet: TDataSet);
    procedure mdWMatTurnBeforeDelete(DataSet: TDataSet);
    procedure sbAddKAgentMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbAddKAgentMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure srcEntDataChange(Sender: TObject; Field: TField);

  private
    DocInfo: TokAddDocInfo;
    FDelPosID: Integer;

    //function GetSummWithNDS(PriceNDS,Amount,aNDS:Extended): Extended; //Ooieoey iian??oa noiiu n IAN
    function  CheckDatesIn:Boolean;
    function  CheckOrdered(var posList: String): Boolean;
    procedure CheckSvcPresence;
    procedure colTaxGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTaxRateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure DelPos;
    procedure GetNewDC(ACardID: Integer);
    procedure RemoveRsv;
    procedure SetFInAccOut(const Value: Integer);
    procedure SetSvcPresent(const Value: Boolean);
    procedure WMDCRefresh(var M: TMessage); message WM_DC_REFRESH;
    procedure WMDelete(var M: TMessage); message WM_DELETE;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMSetText(var M: TMessage); message WM_SETTEXT;

  protected
    //CurrentNDS:Extended;
    CloseMode: boolean;
    defCurrID: integer;
    FAccountID: Integer;
    FAttDate: TDate;
    FAttNum: string;
    FAttRcv: string;
    FContrDocID: Integer;
    FCurrNum, FCurrPayNum: Integer;
    FFInAccOut: Integer;
    FKAID: Integer;
    FKAModified: Boolean;
    FKAPersons: TStringList;
    FLastGen: string;
    FOrderID: Integer;
    FOrdID: Integer;
    FPaySummChange: boolean;
    FPosError: boolean;
    FRateDate: TDateTime;
    FRateID: integer;
    FREForAll: Boolean;
    FShippedPosExist: Boolean;
    FSvcPresent: Boolean;
    NoReservePresent: Boolean;
    oldkaid: integer;
    OldPayDocId: integer;
    PayDocChecked: boolean;
    PayDocDate: TDateTime;
    PayDocId: integer;
    SummTaxAll: Extended;
    WHMode, FPrevChecked: Boolean;

    function  CheckModified: Boolean; override;
    function  CheckNum:boolean;
    function  DoRemoveRsv(APosID: Integer): Boolean;
    function  DoSetRsv(APosID, AMatID, AWID: Integer; AAmount: Extended; AResetToExisting: Boolean = False; ASkipClearing: Boolean = False): Boolean;
    function  WarrantyExist: Boolean;
    procedure FillMatsFromWMat(DS: TDataSet);
    procedure GetSummAll; override;
    procedure GetTaxes; virtual;
    procedure SaveAddProps(APosID: Integer); virtual;
    procedure SaveSerial(APosID: Integer); virtual;
    procedure SaveTaxes(APosID: Integer); virtual;
    procedure SetAtt;
    procedure SetAttDate(const Value: TDate);
    procedure SetAttNum(const Value: string);
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
    procedure UpdatePos; override;
    property  AttDate: TDate read FAttDate write SetAttDate;
    property  AttNum: string read FAttNum write SetAttNum;
    property  SvcPresent: Boolean read FSvcPresent write SetSvcPresent;

  public
    AccPayDocID: Integer;
    ParentHandle: HWND;

    function  CreateByAccOut(AAccID: Integer; IDs, Svcs: string): Integer; virtual;
    function  CreateByOrderOut(AOrderID: Integer; IDs, Svcs: string): Integer; virtual;
    procedure AddMats(var IDs: string); virtual;
    procedure SetCaptions; override;

    property  FInAccOut: Integer read FFInAccOut write SetFInAccOut;
  end;

var
  frmEditWaybillOut: TfrmEditWaybillOut;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, fMessageDlg, ClientData, Login, prFun, fKAgent, ssFun, ShellAPI,
  StdConvs, EditPositionAcc, CurrencyEdit, EditAtt, ssCallbackConst, DateUtils,
  ssRegUtils, EditMaterials, KATurnover, ssStrUtil, ssBaseIntfDlg,
  EditPositionSvc, EditServices, Serials, ssBaseSkinForm, SetDiscount,
  okClasses, OrdersInfo, okMoneyFun, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmEditWaybillOut.colStatusGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.colStatusGetText') else _udebug := nil;{$ENDIF}

  if AText = '' then AText := '-1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.SetAttDate(const Value: TDate);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.SetAttDate') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditWaybillOut.SetAttNum(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.SetAttNum') else _udebug := nil;{$ENDIF}

  if FAttNum <> Value then begin
    FAttNum := Value;
    FModified := true;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.WMRefresh(var M: TMessage);
 var
   tmpKAID:integer;
   intTmp: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.WMRefresh') else _udebug := nil;{$ENDIF}


  if M.LParam = 9 then begin
    UpdatePos;
    GetSummAll;
    SelectFocusedNode;

    if dbgWaybillDet.FocusedNode.Values[colPType.Index] = 1
      then SvcPresent := True;

    DataModified(Self);
  end
  else
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

      rtWMat:
        begin
          FillMatsFromWMat(TDataSet(M.WParam));
        end;

      rtServices:
        begin
          FillMatsFromWMat(TDataSet(M.WParam));
        end;

      rtKAgent:
        begin
          edKAgent.KAID := M.WParam;
          GetKAPersons(M.WParam);
        end;

      rtCashDesks:
        begin
          DSRefresh(cdsCashDesks, 'cashid', M.WParam);
          lcbCashDesks.KeyValue := M.WParam;
          lcbCashDesks.SelStart := 0;
        end;

      rtPersons:
        begin
          if lcbPersonName.Tag = 1 then begin // tag set when user selection modal were invoked
            DSRefresh(cdsPersonName, 'KAID', M.WParam);
            lcbPersonName.KeyValue := M.WParam;
            lcbPersonName.SelStart := 0;

            if lcbPayMPerson.Text <> ''
              then tmpKAID := lcbPayMPerson.KeyValue
              else tmpKAID := 0;

            DSRefresh(cdsPayMPersons, 'kaid', lcbPayMPerson.KeyValue);

            if cdsPayMPersons.Locate('kaid',tmpKAID,[])
              then lcbPayMPerson.KeyValue := tmpKAID
              else begin
                lcbPayMPerson.KeyValue := 0;
                lcbPayMPerson.Text := '';
             end;
          end //if lcbPersonName.Tag = 1
          else begin
            DSRefresh(cdsPayMPersons, 'kaid', M.WParam);
            lcbPayMPerson.KeyValue := M.WParam;
            lcbPayMPerson.SelStart := 0;

            if lcbPersonName.Text <> ''
              then tmpKAID := lcbPersonName.KeyValue
              else tmpKAID := 0;

            //DSRefresh(cdsPersonName, 'KAID', lcbPersonName.KeyValue);
            DSRefresh(cdsPersonName, 'kaid', lcbPersonName.KeyValue);

            if cdsPersonName.Locate('kaid',tmpKAID,[])
              then lcbPersonName.KeyValue := tmpKAID
              else begin
                lcbPersonName.KeyValue := 0;
                lcbPersonName.Text := '';
              end;
          end;
        end;//rtPersons

      rtSetPosting:
          chbPosting.Checked := (M.WParam = 1);

    end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  var
    FPaySum: Extended;
    FEnPay: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  function byOrder: Boolean;
  begin
    Result := False{((FOrderID = 0) or ((FOrderID <> 0) and not chbPosting.Checked))};
  end;

begin
  { TODO -oKadavris -c : we definitely should heavy optimize this global actionlistupdate shit 03.07.2010 11:37:57 }
  if not allowALUpdate(800) then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.ActionListUpdate') else _udebug := nil;{$ENDIF}

  lTotal.Caption := rs('fmWaybill','TotalIn') + ' ' + BaseCurrName;
  lTotalCurr.Caption := rs('fmWaybill','TotalIn') + ' ' + cbCurr.EditingText;
  aSetDiscount.Enabled := dbgWaybillDet.SelectedCount > 0;
  aSetKurs.Enabled := (defCurrID <> cbCurr.KeyValue);
  chbPay.Enabled := not PayDocChecked and (AccPayDocID = 0);

  if (chbPay.Checked) and chbPay.Enabled then begin
    try
      FPaySum := StrToFloat(edPaySumm.EditingText);
      FEnPay := (FPaySum > 0) and (Trim(edPayNum.Text) <> '')

    except
      FPaySum := 0;
      FEnPay := False;
    end;

    lPayCurr.Font.Color := clWindowText;
  end
  else begin
    lcbPayType.Enabled := false;
    FEnPay := True;
  end;

  if edContr.Obj.DocID > 0 then cbPayCurr.Enabled := false;

  if FGridRefresh then begin
    GetSummAll;

    if (not PayDocChecked) and (chbPay.Checked) and (not FPaySummChange) and (dbgWaybillDet.Tag<>0)
    then begin
      edPaySumm.Tag := 1;
      edPaySumm.Value := roundtoa(ALLSUMMCurr,-2);
      edPaySumm.Tag := 0;
    end;

    dbgWaybillDet.Tag := dbgWaybillDet.Tag + 1;
  end;

  //********************
  lSummCurr.Visible := cbCurr.KeyValue <> BaseCurrID;
  lTotalCurr.Visible := cbCurr.KeyValue <> BaseCurrID;
  //********************

  if dbgWaybillDet.SelectedCount = 1 then begin
    try
      aSetRsv.Enabled := (VarToInt(dbgWaybillDet.FocusedNode.Values[colStatus.Index])=0);// and (FInAccOut = 0);
      aRemoveRsv.Enabled := not aSetRsv.Enabled{ and (FInAccOut = 0) and byOrder};
      aSetRsvAll.Enabled := True;//(FInAccOut = 0);
      aRemoveRsvAll.Enabled := True{(FInAccOut = 0) and byOrder};

    except
      aSetRsv.Enabled := False;
      aRemoveRsv.Enabled := False;
    end;
  end
  else begin
    aSetRsv.Enabled := not mdDet.IsEmpty;// and (FInAccOut = 0);
    aRemoveRsv.Enabled := not mdDet.IsEmpty{ and (FInAccOut = 0) and byOrder};
    aSetRsvAll.Enabled := not mdDet.IsEmpty;// and (FInAccOut = 0);
    aRemoveRsvAll.Enabled := not mdDet.IsEmpty{ and (FInAccOut = 0) and byOrder};
  end;
  aSelectAll.Enabled := not mdDet.IsEmpty;

  aOk.Enabled := (trim(edNum1.Text) <> '') and
     ((chbPosting.Checked and not NoReservePresent) or not chbPosting.Checked) and
     (edDate.Text <> '') and (edKAgent.KAID > 0)and(cbCurr.KeyValue > 0)
     and (not mdDet.IsEmpty) and (not FPosError) and FEnPay;

  aApply.Enabled := aOk.Enabled and (FModified or FPosModified or FPayDocModified)
    {and (FInAccOut = 0) and byOrder};

  aCIns.Enabled := True{(FInAccOut = 0) and byOrder};
  aAddMat.Enabled := aCIns.Enabled;
  aAddMatList.Enabled := aCIns.Enabled;
  aAddSvc.Enabled := aCIns.Enabled;
  aCDel.Enabled := not mdDet.IsEmpty{ and (FInAccOut = 0) and byOrder};

  aCUpd.Enabled := (not mdDet.IsEmpty) {and(FInAccOut=0)} and (dbgWaybillDet.SelectedCount = 1);

  if not mdDet.IsEmpty
    then aRemoveRsv.Enabled := (dbgWaybillDet.FocusedNode.Values[colStatus.Index]=1) {and (FInAccOut = 0) and byOrder}
    else aRemoveRsv.Enabled := false;

  // marking required fields
  if edNum1.Text <> ''
    then edNum1.Style.StyleController := dmData.scMainOK
    else edNum1.Style.StyleController := dmData.scMainErr;

  if edKAgent.KAID > 0
    then edKAgent.StyleController := dmData.scMainOK
    else edKAgent.StyleController := dmData.scMainErr;

  if mdDet.IsEmpty then begin
    btnPosAdd.ParentColorEx := False;
    btnPosAdd.Color := clLime;
  end
  else btnPosAdd.ParentColorEx := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.SetCaptions;
  //var FItem: TcxTreeListNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.SetCaptions') else _udebug := nil;{$ENDIF}

  lEntEx.Hint := rs('fmWaybill', 'ChangeEnt') + ' (' + ShortCutToText(aChangeEnt.ShortCut) + ')';

  imnuAdd.Caption := rs('Common', 'Add');

  aAddSvc.Caption := rs('fmWaybill', 'SvcV');
  aAddMat.Caption := rs('fmWaybill', 'MatName');
  aAddMatList.Caption := rs('fmWaybill', 'AddMatList');
  aAddSvcList.Caption := rs('fmWaybill', 'AddSvcList');

  aSetDiscount.Caption := rs('fmWaybill', 'SetDiscount');
  aOrdersInfo.Caption := rs('fmOrders', 'OrderedIn');
  btnOrdersInfo.Hint := rs('fmOrders', 'OrderedIn');

  aSelectAll.Caption := rs('Common', 'SelectAll');
  aRemoveRsv.Caption := rs('fmWaybill','DelRsv');
  aRemoveRsvAll.Caption := rs('fmWaybill', 'RemoveRsvAll');
  aSetRsv.Caption := rs('fmWaybill', 'SetRsv');
  aSetRsvAll.Caption := rs('fmWaybill', 'SetRsvAll');

  edFind.InitRes;

  gbHeader.Caption := ' ' + rs('fmWaybill', 'MainInfo') + ' ';

  aCIns.Caption := rs('Common', 'Add');
  aCIns.Hint := rs('fmWaybill', 'NewPos');
  aCUpd.Caption := rs('Common', 'Properties');
  aCUpd.Hint := rs('fmWaybill','EditPos');
  aCDel.Caption := rs('Common', 'Del');
  aCDel.Hint := rs('fmWaybill','PosDel');

  aPersons.Hint := rs('fmWaybill','aPersons');
  aPayMPersons.Hint := rs('fmWaybill','aPersons');
  aSetKurs.Hint := rs('fmWaybill','SetKurs');
  //chbAtt.Properties.Caption := rs('fmWaybill','AttNum');

  //sbAddKAgent.Hint := rs_KAAdd;

  lNum.Caption := rs('fmWaybill','Num') + ':';
  edKAgent.InitRes;
  edKAgent.Caption.Caption := rs('fmWaybill', 'KANameOut') + ':';
  lTot.Caption := rs('fmWaybill','withNDS') + ':';
  lTotNDSOut.Caption := rs('fmWaybill','outNDS') + ':';
  lTotNDS.Caption := rs('fmWaybill','NDS') + ':';
  lCurr.Caption := rs('fmWaybill','Curr') + ':';
  lPayCurr.Caption := rs('fmWaybill','Curr') + ':';
  lPaySumm.Caption := rs('fmWaybill','Summ') + ':';
  lPayMPerson.Caption := rs('fmWaybill','MPerson') + ':';
  //lReceived.Caption := rs('fmWaybill','MPerson') + ':';
  lReason.Caption := rs('fmWaybill','Reason') + ':';
  lPersonname.Caption := rs('fmWaybill','PersonnameOut') + ':';
  lPayType.Caption := rs('fmWaybill','PayType') + ':';
  chbPosting.Properties.Caption := rs('fmWaybill','Posting');
  chbRetNDS.Properties.Caption := rs('fmWaybill', 'RetNDS');
  colRecNo.Caption := rs('fmWaybill','NumEx');
  colMatName.Caption := rs('fmWaybill','MatSvc');
  colMeasureName.Caption := rs('fmWaybill','Measure');
  colAmount.Caption := rs('fmWaybill','Amount');
  colWHouseName.Caption := rs('fmWaybill','WHouse');
  colNorm.Caption := rs('fmWaybill', 'Norm');
  colProducer.Caption := rs('fmWaybill', 'Producer');
  colCertNum.Caption := rs('fmWaybill', 'CertNum');
  colCertDate.Caption := rs('fmWaybill', 'CertDate');
  colWarrantyPeriod.Caption := rs('fmWaybill', 'WarrantyPeriod');
  colStatus.Caption := rs('fmWMat', 'Reserved');

  chbPay.Properties.Caption := rs('fmWaybill','ExecPayment');
  aShowSN.Caption := rs('fmWaybill','SNs');
  lNotes.Caption := rs('fmWaybill', 'Notes') + ':';

  edContr.InitRes;

  SetAtt;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.edNum1PropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.edNum1PropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  FPayDocModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.chbPostingPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.chbPostingPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := True;
  FGridRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.dbgWaybillDetCustomDrawCell') else _udebug := nil;{$ENDIF}

  if Odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

  if (not CloseMode) and (ANode.Values[colPType.Index] = 0) and chbPosting.Checked
     and not mdWMatTurn.Locate('sourceid', ANode.Values[colPosId.Index], [])
  then begin
    AFont.Color := clRed;
    FPosError := True;
  end
  else FPosError := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.mdMatsAfterPost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.mdMatsAfterPost') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.mdMatsAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.mdMatsAfterDelete') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.mdMatsAfterEdit(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.mdMatsAfterEdit') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.FormShow') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crDefault;
  FormResize(frmEditWaybillOut);

  inherited;

  if FShippedPosExist and (FInAccOut > 0)
    then ssMessageDlg(rs('fmWaybill', 'ShippedPosExist'), ssmtWarning, [ssmbOk], 'ShowShippedPosMess', True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.FormClose(Sender: TObject; var Action: TCloseAction);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.FormClose') else _udebug := nil;{$ENDIF}

  mdDet.Close;
  cdsCurr.Close;
  cdsPayType.Close;
  mdTmpIds.Close;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aSetTimeExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aSetTimeExecute') else _udebug := nil;{$ENDIF}

  edTime.Time := Time;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.dbgWaybillDetDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.dbgWaybillDetDblClick') else _udebug := nil;{$ENDIF}

  if aCUpd.Enabled then aCUpd.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.FormResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.FormResize') else _udebug := nil;{$ENDIF}

  RealignGrid;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.chbPayPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.chbPayPropertiesChange') else _udebug := nil;{$ENDIF}

  // Заполнение полей
  if chbPay.Enabled then begin
    if (chbPay.Checked) then begin
      if PDInAutoNum and (OldPayDocID = 0) then begin
        FCurrPayNum := GetDocNum(dmData.SConnection, dtPDIn, 1);
        edPayNum.Text := PDInPrefix + IntToStr(FCurrPayNum) + PDInSuffix;
      end
      else edPayNum.Text := FPayNum;

      edPaySumm.Tag := 1;
      edPaySumm.Value := roundtoa(AllSummCurr, -2);
      edPaySumm.Tag := 0;
  //cbPayCurr.KeyValue := defCurrID;
    end//if (chbPay.Checked)
    else begin
      if PDInAutoNum and (OldPayDocID = 0) then begin
        if GetDocNum(dmData.SConnection, dtPDIn, 0) = FCurrPayNum then GetDocNum(dmData.SConnection, dtPDIn, -1);
      end;

      edPayNum.Text := '';
      edPaySumm.Tag := 1;
      edPaySumm.Value := 0;
      edPaySumm.EditText := '';
      edPaySumm.Tag := 0;
      //cbPayCurr.KeyValue := defCurrID;
      FPaySummChange := false;
    end;//else

    FPayDocModified := true;
  end;//if chbPay.Enabled

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.edPaySummPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.edPaySummPropertiesChange') else _udebug := nil;{$ENDIF}

  FPayDocModified := true;
  if edPaySumm.Tag = 0 then FPaySummChange := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.cbCurrPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.cbCurrPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  inherited;

  ChangeMatsCur;
  cbPayCurr.KeyValue := CurrID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.FormCreate(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.FormCreate') else _udebug := nil;{$ENDIF}

  FormStorage.IniFileName := MainRegKey;
  FormStorage.IniSection := Self.Name;
  FormStorage.Active := True;

  FKAPersons := TStringList.Create;

  GetTaxes;

  inherited;

  cdsEnts.Locate('kaid', CurrEnt.KAID, []);

  imnuAdd.OnClick := nil;
  FCurrPayNum := -1;
  //btnContr.ImageIndex := II_CONTROUT;
  btnPosAdd.ImageIndex := 0;
  btnPosProps.ImageIndex := 1;
  btnPosDel.ImageIndex := 2;
  btnPayMPerson.ImageIndex := 32;
  btnFinPay.ImageIndex := 44;
  colPosType.Caption := '';

  chbRetNDS.Visible := ShowRetNDS;

  cdsPayMPersons.Open;
  lcbPayMPerson.KeyValue := -1;
  lcbPayMPerson.Text := '';

  chbPosting.Checked := DefCheckWB;
  FInAccOut := 0;
  FPosError := false;

  edKAgent.LoadFromRegistry(MainRegKey + '\' + Self.ClassName);
  edFind.LoadFromRegistry(MainRegKey + '\' + Self.ClassName + '\PosFind');
  edFind.SetLng;
  edKAgent.SetLng;

  (*
  {$IFDEF LITE}
  edContr.OnRefButtonClick := NoAccess;
  {$ENDIF}
  *)

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aPersonsExecute(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aPersonsExecute') else _udebug := nil;{$ENDIF}

  if edContr.Editor.Focused
  then edContr.ShowRef
  else if FCurrCtrl = lcbPayMPerson then begin
    try aid := lcbPayMPerson.KeyValue; except aid := 0; end;

    lcbPayMPerson.SetFocus;
    lcbPayMPerson.Tag := 1;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
    lcbPayMPerson.Tag := 0;
  end
  else if FCurrCtrl = lcbPayType then begin
    ShowFinance(Self, Date, 1);
  end
  else if FCurrCtrl = lcbCashDesks then begin
    try aid := lcbCashDesks.KeyValue; except aid := 0; end;

    lcbCashDesks.SetFocus;
    ShowModalRef(Self, rtCashDesks, vtCashDesks, 'TfmCashDesks', Self.OnDate, aid);
  end
  else if FCurrCtrl = lcbPersonName then begin
    try aid := lcbPersonName.KeyValue; except aid := 0; end;

    lcbPersonName.SetFocus;
    lcbPersonName.Tag := 1;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
    lcbPersonName.Tag := 0;
  end
  else if edKAgent.Editor.Focused then edKAgent.ShowRef;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.WMDelete(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.WMDelete') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtPersons: DSRefresh(cdsPersonName, 'kaid', 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{Процедура получения списка контактных лиц для контрагента}
//==============================================================================================
procedure  TfrmEditWaybillOut.GetKAPersons(kaid:integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.GetKAPersons') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    Screen.Cursor := crSQLWait;
    FKAPersons.Clear;
    ProviderName := 'pWayBillKAPersons_Get';
    FetchParams;
    Params.ParamByName('kaid').AsInteger := KAID;
    Open;
    if not IsEmpty then begin
      First;
      while not eof do begin
        if Fields.fieldbyname('name').AsString <> '' then FKAPersons.Add(Fields.fieldbyname('name').AsString);
        Next;
      end;//while not eof
    end;//if not IsEmpty then
    Close;

  finally
    Screen.Cursor := crDefault;
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.dbgWaybillDetKeyPress') else _udebug := nil;{$ENDIF}

  if chbPay.Enabled and (Key = #13)
    then chbPay.SetFocus
    else if btnOk.Enabled then btnOk.SetFocus
      else btnCancel.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.lcbPersonNamePropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.lcbPersonNamePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.edReasonPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.edReasonPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.lcbPersonNameExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.lcbPersonNameExit') else _udebug := nil;{$ENDIF}

  lcbPersonName.SelStart := 0;
  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.edNum1KeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.edNum1KeyPress') else _udebug := nil;{$ENDIF}

  if lNum.Font.Color<>clRed then GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.FormDestroy(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.FormDestroy') else _udebug := nil;{$ENDIF}

  edKAgent.SaveToRegistry(MainRegKey + '\' + Self.ClassName);
  edFind.SaveToRegistry(MainRegKey + '\' + Self.ClassName + '\PosFind');

  dmData.SConnection.AppServer.Rsv_Delete(-1);
  //if WHMode then SendMessage(MainHandle, WM_REFRESH, 0, 0);

  FKAPersons.Free;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  edFind.SetLng;
  edKAgent.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aCancelExecute') else _udebug := nil;{$ENDIF}

  if not cbCurr.DroppedDown then inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aMatInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aMatInfoExecute') else _udebug := nil;{$ENDIF}

  if (dbgWaybillDet.SelectedCount <> 1) or (dbgWaybillDet.SelectedNodes[0].Values[colPType.Index] <> 0)
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := dbgWaybillDet.SelectedNodes[0].Values[colMatID.Index];
      CanModify := False;
      ShowModal;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aBallanceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aBallanceExecute') else _udebug := nil;{$ENDIF}

  if not ShowBallance then begin
    AccessDenied;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if edKAgent.KAID <= 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

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
procedure TfrmEditWaybillOut.aPrintExecute(Sender: TObject);
  var
    FSumWONDS, FNDS, FSumWithNDS, FAmount: Extended;
    cdsT: TssClientDataSet;
    i: Integer;
    SummTax, PosSummTax: Extended;
    TaxID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aPrintExecute') else _udebug := nil;{$ENDIF}

  if mdDet.IsEmpty then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

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

    if (mdReport.FieldByName('postype').AsInteger = 1) and (mdReport.FieldByName('norm').AsFloat > 1)
    then FAmount := FAmount * mdReport.FieldByName('norm').AsFloat;

    mdReport.FieldByName('amount').AsFloat := FAmount;
    if PrintType = 0 then begin
      NDSCalc(1, mdReport.FieldByName('price').AsFloat, mdReport.FieldByName('nds').AsFloat, 1, FSumWONDS, FNDS);
      FSumWithNDS := RoundToA(FSumWONDS + FNDS, -2);
      FSumWONDS := FSumWithNDS - FNDS;
      mdReport.FieldByName('price').AsFloat := FSumWONDS;//NDSOut(mdReport.FieldByName('price').AsFloat,mdReport.FieldByName('nds').AsFloat);
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

  if optWBOutRepSortDesc
    then mdReport.SortOptions := [soDesc,soCaseInsensitive]
    else mdReport.SortOptions := [soCaseInsensitive];

  mdReport.SortedField := WBRepSortFieldNames[optWBOutRepSortField];

  FGridRefresh := True;

  SmartShowRep(frDoc, 'Waybill_Out.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.frDocGetValue(const ParName: String; var ParValue: Variant);
  var
    FSumm, FNDS, FWONDS, FAmount: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.frDocGetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'att') then begin
    if FAttNum <> ''
      then ParValue := btnAtt.Caption
      else ParValue := '';
  end
  else if 0 = AnsiCompareText(ParName, 'barcode') then ParValue := genBarCodeFromStr('WBO' + edNum1.EditingText)
  else if 0 = AnsiCompareText(ParName, 'curnds') then ParValue := NDS
  else if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := edNum1.Text
  else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := edDate.Text
  else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := cdsEnts.FieldByName('name').AsString
  else if 0 = AnsiCompareText(ParName, 'item') then begin
    case OptWBOutShowModel of
      1: ParValue := mdReport.FieldByName('artikul').AsString;
      2: ParValue := mdReport.FieldByName('matname').AsString + #13#10'(' + mdReport.FieldByName('artikul').AsString + ')';
      else ParValue := mdReport.FieldByName('matname').AsString;
    end;
  end
  else if 0 = AnsiCompareText(ParName, 'kafullname') then ParValue := edKAgent.Obj.Name_
  else if 0 = AnsiCompareText(ParName, 'reason') then ParValue := edReason.Text
  else if 0 = AnsiCompareText(ParName, 'printtype') then ParValue := PrintType
  else if 0 = AnsiCompareText(ParName, 'PriceDisplayFormatEx') then ParValue := PriceDisplayFormatEx
  else if 0 = AnsiCompareText(ParName, 'postaxsum') then ParValue := mdReport.FieldByName('taxsum').AsCurrency
  else if 0 = AnsiCompareText(ParName, 'possum') then begin
    FAmount := mdReport.FieldByName('amount').AsFloat;
//if (mdReport.FieldByName('postype').AsInteger = 1) and
//  (mdReport.FieldByName('norm').AsFloat > 1) then
//      FAmount := FAmount * mdReport.FieldByName('norm').AsFloat;

    if PrintType = 0 then begin
      NDSCalc(FAmount, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
              mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);

      FSumm := RoundToA(FWONDS+FNDS, -2);
      FWONDS := FSumm - FNDS;
      ParValue := RoundToA(FWONDS, -2);
    end
    else begin
      NDSCalc(FAmount, mdReport.FieldByName('price').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
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
  else if 0 = AnsiCompareText(ParName, 'propis') then begin
    FSumm := StrToFloat(DelChars(lSummDef.Caption, [ThousandSeparator]));
    ParValue := MoneyToStr(FSumm);
  end
  else if 0 = AnsiCompareText(ParName, 'personname') then ParValue := lcbPersonName.Text
  else if 0 = AnsiCompareText(ParName, 'received') then ParValue := FAttRcv
  else if 0 = AnsiCompareText(ParName, 'sumnds') then ParValue := lSummDefNDS.Caption
  else if 0 = AnsiCompareText(ParName, 'sumall') then ParValue := lSummDef.Caption;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.lcbPersonNameKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.lcbPersonNameKeyPress') else _udebug := nil;{$ENDIF}

  if NextCtrlOnEnter and (Key = #13) then begin
    Key := #0;
    dbgWaybillDet.SetFocus;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.edKAgentEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.edKAgentEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.edKAgentExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.edKAgentExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.sbAddKAgentMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.sbAddKAgentMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := edKAgent;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.sbAddKAgentMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.sbAddKAgentMouseUp') else _udebug := nil;{$ENDIF}

  if not edKAgent.Focused then FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.lcbPersonNameEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.lcbPersonNameEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.btnPersonNameMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.btnPersonNameMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPersonName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.btnPersonNameMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.btnPersonNameMouseUp') else _udebug := nil;{$ENDIF}

  if not lcbPersonName.Focused then FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.lcbPayMPersonEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.lcbPayMPersonEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.lcbPayMPersonExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.lcbPayMPersonExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.btnPayMPersonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.btnPayMPersonMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPayMPerson;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.btnPayMPersonMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.btnPayMPersonMouseUp') else _udebug := nil;{$ENDIF}

  if not lcbPayMPerson.Focused then FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.frDocEndDoc;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.frDocEndDoc') else _udebug := nil;{$ENDIF}

  GetSummAll;
  dbgWaybillDet.Invalidate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.SetFInAccOut(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.SetFInAccOut') else _udebug := nil;{$ENDIF}

  FFInAccOut := Value;

  if Value > 0 then begin
    chbPay.Enabled := False;
    edPayNum.Enabled := False;
    lPayType.Enabled := False;
    lcbPayType.Enabled := False;
    lPayMPerson.Enabled := False;
    lcbPayMPerson.Enabled := False;
    lPaySumm.Enabled := False;
    edPaySumm.Enabled := False;
    lPayCurr.Enabled := False;
    cbPayCurr.Enabled := False;
    lCashDesks.Enabled := False;
    lcbCashDesks.Enabled := False;
    lcbAccount.Enabled := False;
    lAcc.Enabled := False;
    btnCashDesks.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aSetRsvAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aSetRsvAllExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.SelectAll;
  aSetRsv.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.SetSvcPresent(const Value: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.SetSvcPresent') else _udebug := nil;{$ENDIF}

  FSvcPresent := Value;
  AdjustGrid(dbgWaybillDet, colMatName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.CheckSvcPresence;
  var
    i: Integer;
    FSvc: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.CheckSvcPresence') else _udebug := nil;{$ENDIF}

  FSvc := False;

  with dbgWaybillDet do
    for i := 0 to Count - 1 do
      if Items[i].Values[colPType.Index] = 1 then begin
        FSvc := True;
        Break;
      end;

  if FSvc <> SvcPresent then SvcPresent := FSvc;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.colNormGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.colNormGetText') else _udebug := nil;{$ENDIF}

  if AText = '0' then AText := '';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.imnuAddClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.imnuAddClick') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aSvcInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aSvcInfoExecute') else _udebug := nil;{$ENDIF}

  if (dbgWaybillDet.SelectedCount <> 1) or (dbgWaybillDet.SelectedNodes[0].Values[colPType.Index] <> 1)
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmEditServices.Create(nil) do
    try
      ParentNameEx := 'fmServices';
      OnDate := Self.OnDate;
      ID := dbgWaybillDet.SelectedNodes[0].Values[colMatID.Index];
      CanModify := False;
      ShowModal;
      dbgWaybillDet.SetFocus;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.lcbPersonNamePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.lcbPersonNamePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  with Sender as TcxComboBox do begin
    SelStart := 0;
    SelLength := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.colPriceInCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.colPriceInCurrGetText') else _udebug := nil;{$ENDIF}

  try
    if not aShowRealPrice.Checked then AText := formatfloat(MoneyDisplayFormat, strtofloat(atext));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.mdDetAfterPost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.mdDetAfterPost') else _udebug := nil;{$ENDIF}

  inherited;

  FPosModified := True;
  FGridRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aShowSNExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aShowSNExecute') else _udebug := nil;{$ENDIF}

  with TfrmSerials.Create(nil) do
  try
    colSN.DisableEditor := true;
    mdSN.Open;

    with mdWMatTurn do begin
      First;

      while not Eof do begin
        if (mdWMatTurn.FieldByName('sourceid').AsInteger=mdDet.FieldByName('posid').AsInteger) and not mdWMatTurn.FieldByName('SN').IsNull
        then begin
          mdSN.Append;
          mdSN.FieldByName('num').AsInteger := mdSN.RecNo;
          mdSN.FieldByName('sn').AsString := mdWMatTurn.FieldByName('SN').AsString;
          mdSN.Post;
        end;

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
procedure TfrmEditWaybillOut.dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.dbgWaybillDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'DocWBOut');
  ImgList := dmData.Images;
  AIndex := II_WBOUT;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.colAmountGetText') else _udebug := nil;{$ENDIF}

  try AText := FormatFloat(MatDisplayFormat, StrToFloat(AText)); except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.colTaxGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.colTaxGetText') else _udebug := nil;{$ENDIF}

  if AText <> '' then AText := AText + '%';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.colTaxRateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.colTaxRateGetText') else _udebug := nil;{$ENDIF}

  if AText <> ''
    then AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.frDocBeginDoc;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.frDocBeginDoc') else _udebug := nil;{$ENDIF}

  if frDoc.FindObject('MasterData2') <> nil then TfrBandView(frDoc.FindObject('MasterData2')).DataSet := 'FsrcTaxes';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.WMSetText(var M: TMessage);
  var
    S: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.WMSetText') else _udebug := nil;{$ENDIF}

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
procedure TfrmEditWaybillOut.srcEntDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.srcEntDataChange') else _udebug := nil;{$ENDIF}

  lEntEx.Captions.Clear;
  lEntEx.Captions.Add('(' + cdsEnts.FieldByName('name').AsString + ')');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.lEntExItemClick(Sender: TObject; Index: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.lEntExItemClick') else _udebug := nil;{$ENDIF}

  aChangeEnt.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.SetAtt;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.SetAtt') else _udebug := nil;{$ENDIF}

  if FAttNum = ''
    then btnAtt.Caption := rs('fmWaybill', 'FillAtt')
    else btnAtt.Caption := rs('fmWaybill', 'Att') + amountPrefix + FAttNum + rs('fmWaybill', 'AttDate', 2) + DateToStr(FAttDate);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.btnAttKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.btnAttKeyDown') else _udebug := nil;{$ENDIF}

  if (Key = VK_RETURN) then begin
    if NextCtrlOnEnter then Perform(WM_NEXTDLGCTL, 0, 0);
    Key := 0;
  end
  else if (Key = VK_SPACE) then aAtt.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.btnAttMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.btnAttMouseUp') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditWaybillOut.edContrChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.edContrChange') else _udebug := nil;{$ENDIF}

  if edContr.Obj.DocID > 0 then begin
    if cbCurr.KeyValue <> edContr.Obj.CurrID then cbCurr.KeyValue := edContr.Obj.CurrID;
    if cbPayCurr.KeyValue <> edContr.Obj.CurrID then cbPayCurr.KeyValue := edContr.Obj.CurrID;
  end;

  cbCurr.Enabled := not (edContr.Obj.DocID>0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.edKAgentChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.edKAgentChange') else _udebug := nil;{$ENDIF}

  DataModified(Self);

  if (PayDocId > 0) and (edKAgent.KAID <> oldkaid) and chbPay.Checked then begin
    if mrYes = ssMessageDlg(rs('fmWaybill', 'KAChangeError') + edPayNum.Text + '?', ssmtWarning, [ssmbYes, ssmbNo])
    then begin
      PayDocChecked := False;
      chbPay.Enabled := True;
      chbPay.Checked := False;
      OldPayDocId := PayDocId;
      PayDocId := 0;
      oldkaid := edKAgent.KAID;
      FModified := True;
    end
    else begin
      edKAgent.KAID := oldkaid;
   //edKAgent.Text := KANameEx(dmData.SConnection,edKAgent.Tag, FPTypeID, KType);
    end;//else
  end;

  if not edContr.Editor.Focused and not edContr.Locked then begin
    FCurrCtrl := edKAgent;

    if not edKAgent.Obj.Contracts.IsEmpty and edKAgent.Obj.Contracts.Locate('doctype', -8, [])
      then edContr.DocID := edKAgent.Obj.Contracts.FieldByName('docid').AsInteger
      else edContr.DocID := 0;

    //edContr.KAID := edKAgent.KAID;
    FCurrCtrl := nil;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.colWarrantyPeriodGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  var
    D1, D2: Char;
    FText: string;
    FType: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  if AText = '' then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.colWarrantyPeriodGetText') else _udebug := nil;{$ENDIF}

  FText := AText;

  D1 := FText[Length(FText)];
  FType := ANode.Values[colWarrantyPeriodType.Index];

  if Length(FText) > 1
    then D2 := FText[Length(FText) - 1]
    else D2 := #0;

  if D1 = '1' then begin
    case FType of
      0: AText := AText + ' ' + AnsiLowerCase(rs('Period', 'Year'));
      1: AText := AText + ' ' + AnsiLowerCase(rs('Period', 'Month'));
    end;
  end
  else if (D1 in ['2'..'4']) and (D2 <> '1') then begin
    case FType of
      0: AText := AText + ' ' + AnsiLowerCase(rs('Period', 'Year_R'));
      1: AText := AText + ' ' + AnsiLowerCase(rs('Period', 'Month_R'));
    end;
  end
  else begin
    case FType of
      0: AText := AText + ' ' + AnsiLowerCase(rs('Period', 'Year_RM'));
      1: AText := AText + ' ' + AnsiLowerCase(rs('Period', 'Month_RM'));
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditWaybillOut.WarrantyExist: Boolean;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.WarrantyExist') else _udebug := nil;{$ENDIF}

  Result := False;

  for i := 0 to dbgWaybillDet.Count - 1 do
    if VarToStr(dbgWaybillDet.Items[i].Values[colWarrantyPeriod.Index]) <> ''
      then begin
        Result := True;
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.mdWMatTurnBeforeDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.mdWMatTurnBeforeDelete') else _udebug := nil;{$ENDIF}

  FDelPosID := DataSet.FieldByName('sourceid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.mdWMatTurnAfterDelete(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.mdWMatTurnAfterDelete') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditWaybillOut.mdDetBeforeDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.mdDetBeforeDelete') else _udebug := nil;{$ENDIF}

  if WBOutCheckDC then
    if mdDC.Locate('posid', mdDet.FieldByName('posid').AsInteger, [])
      then mdDC.Delete;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.edDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.edDatePropertiesChange') else _udebug := nil;{$ENDIF}

  if FInAccOut > 0
    then DataModified(Sender)
    else inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aOrdersInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aOrdersInfoExecute') else _udebug := nil;{$ENDIF}

  ShowOrdersInfo(edKAgent.KAID, -16, OnDate);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.btnAttClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.btnAttClick') else _udebug := nil;{$ENDIF}

  aAtt.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aActivateFindExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aActivateFindExecute') else _udebug := nil;{$ENDIF}

  edFind.Editor.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.chbPostingClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.chbPostingClick') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.Invalidate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.frDocUserFunction(const Name: String; p1, p2, p3: Variant; var Val: Variant);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.frDocUserFunction') else _udebug := nil;{$ENDIF}

  showmessage(name);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
//==============================================================================================
//= Interesting stuff begins here ==============================================================
//==============================================================================================
//==============================================================================================
function TfrmEditWaybillOut.CheckDatesIn: boolean;
  var
    eStr, eStr2, m: String;
    i: integer;
    tmpMaxDate: TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.CheckDatesIn') else _udebug := nil;{$ENDIF}

  try
    m := '';
    eStr := '';
    eStr2 := '';
    
    if not mdWMatTurn.IsEmpty then begin
      with mdWMatTurn do begin
        First;
        while not Eof do begin
          if m = ''
            then m := m + IntToStr(fieldbyname('posid').AsInteger)
            else m := m + ',' + IntToStr(fieldbyname('posid').AsInteger);
          Next;
        end;
      end;

      with newDataSet do
      try
        ProviderName := 'pWaybill_TurnDateMin';
        FetchMacros;
        Macros.ParamByName('m').AsString := m;
        FetchParams;
        Params.ParamByName('ondate').AsDateTime := edDate.Date+edTime.Time;
        Open;
        if not IsEmpty then begin
          tmpMaxDate := MinDateTime;

          //Формирование сообщения
          for i := 0 to dbgWaybillDet.Count - 1  do begin
            eStr2 := '';

            mdWMatTurn.First;
            while not mdWMatTurn.Eof do begin
              if mdWMatTurn.FieldByName('sourceid').AsInteger = dbgWaybillDet.Items[i].Values[colPosid.Index]
                   and Locate('posid',mdWMatTurn.fieldbyname('posid').AsInteger,[])
              then begin
                if eStr2 = ''
                  then eStr2 := Fields[1].AsString
                  else eStr2 := eStr2 + ', ' + Fields[1].AsString;

                if tmpMaxDate < Fields[1].AsDateTime then tmpMaxDate := Fields[1].AsDateTime;
              end;

              mdWMatTurn.Next;
            end;
            if eStr2 <> '' then
              eStr := eStr + amountPrefix + inttostr(dbgWaybillDet.Items[i].Values[colRecNo.Index]) + ' ' +
                      dbgWaybillDet.Items[i].Values[colMatName.Index] + rs('fmWaybill', 'AccErr1') + eStr2 + #13;
          end;//for

          eStr := Format(rs('fmWaybill', 'AccErr2'),[DateTimeToStr(edDate.Date+edTime.Time),
              #13,eStr,#13,DateTimeToStr(tmpMaxDate)]);
          {eStr := 'Дата документа ('+DateTimeToStr(edDate.Date+edTime.Time)+') конфликтует со следующими позициями:'+#13+
          eStr+#13+'Поставить в документ дату последнего поступления ('+DateTimeToStr(tmpMaxDate)+') ?';
          }
          if ssMessageDlg(eStr, ssmtWarning, [ssmbYes, ssmbCancel]) = mrYes
          then begin
            edDate.Date := tmpMaxDate;
            edTime.Time := frac(tmpMaxDate);
            Result := true;
          end
          else Result := false;
        end//if not IsEmpty
        else Result := true;

        Close;

      finally
        Free;
      end;
    end//if not mdWMatTurn.IsEmpty then begin
    else Result := true;
  except
    Result := false;
    raise;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//Функция подсчёта итоговых сумм
//==============================================================================================
procedure TfrmEditWaybillOut.GetSummAll;
 var
   i, j: Integer;
   BM: TBookmark;
   PriceCurrOutNDS, SummCurrOutNDS, SummCurrNDS, SummCurr, FAmount, FNorm,
   PriceDefOutNDS, SummDefOutNDS, SummDefNDS, SummDef, SummTax, PosSummTax,
   AllSummDefOutNDS, AllSummDefNDS, AllSummDef, FNDS :Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.GetSummAll') else _udebug := nil;{$ENDIF}

  with dbgWaybillDet do begin
    AllSummCurr := 0;
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;

    for i := 0 to Count - 1 do begin
      FAmount := 0;

      try
        if not VarIsNull(Items[i].Values[colNorm.Index])
          then FNorm := ssStrToFloat(Items[i].Values[colNorm.Index])
          else FNorm := 0;

        FAmount := ssStrToFloat(Items[i].Values[colAmount.Index]);

        if (Items[i].Values[colPType.Index] = 1) and (FNorm > 0)
          then FAmount := FAmount * FNorm;

        SummCurr := RoundToA(FAmount * ssStrToFloat(Items[i].Values[colPriceInCurr.Index]), -2);

        NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]), ssStrToFloat(Items[i].Values[colNDSRate.Index]), 1,
                SummDefOutNDS, SummDefNDS);

        SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
        SummDefOutNDS := SummDef - RoundToA(SummDefNDS, -2);
        PosSummTax := 0;

        for j := 0 to ColumnCount - 1 do begin
          if (Pos('colTax', Columns[j].Name) > 0) and
             (Pos('colTaxRate', Columns[j].Name) = 0) and
             (not VarIsNull(Items[i].Values[j]))
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
        NDSCalc(1, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * CurKurs, FNDS, 1, SummDefOutNDS, SummDefNDS);

        NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * CurKurs, FNDS, 1, SummDefOutNDS, SummDefNDS);

        SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
        SummDefOutNDS := SummDef - RoundToA(SummDefNDS, -2);

        PosSummTax := 0;
        for j := 0 to ColumnCount - 1 do begin
          if (Pos('colTax', Columns[j].Name) > 0) and
             (Pos('colTaxRate', Columns[j].Name) = 0) and
             (not VarIsNull(Items[i].Values[j]))
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
    AllSummDef := RoundToA(AllSummDef, -2);

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

  with dbgWaybillDet do begin
    NoReservePresent := False;

    for i := 0 to Count - 1 do begin
      try
        if (Items[i].Values[colPType.Index] = 0) and not mdWMatTurn.Locate('sourceid', Items[i].Values[colPosId.Index],[])
        then begin
          NoReservePresent := True;
          Break;
        end;

      except
      end;
    end;
  end;

  CheckSvcPresence;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditWaybillOut.checkNum: boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.checkNum') else _udebug := nil;{$ENDIF}

  Result := false;

  with newDataSet do
   try
     ProviderName := 'pWaybillNum_Get';
     FetchParams;
     Params.ParamByName('NUM').AsString := edNum1.Text;
     Open;
     Result := Fields[0].AsInteger <= 0;
     Close;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.setid(const Value: integer);
  var
    intTmp: Integer;
    FTaxSumm, FPosNDS, FSumWONDS, FNDS, FPrice: Extended;
    APreffix, ASuffix: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWaybillOut.setid') else _udebug := nil;{$ENDIF}

  {$IFDEF LIMITED}if Value = 0 then CheckDocumentsCountLimit(wbtWaybillOut);{$ENDIF}

  CloseMode := false;
  Screen.Cursor := crSQLWait;
  mdTmpIds.Close;
  mdTmpIds.Open;
  mdWMatTurn.Close;
  mdWMatTurn.Open;
  mdWMatTurnOld.Close;
  mdWMatTurnOld.Open;
  mdDet.Close;
  mdDet.Open;

  if not cdsCurr.Active then begin
    cdsCurr.Open;
    if cdsCurr.Locate('def', 1, []) then begin
      cbCurr.KeyValue := cdsCurr.fieldbyname('currid').AsInteger;
      cbPayCurr.KeyValue := cbCurr.KeyValue;
      defCurrID := cbCurr.KeyValue;
      colSummDef.Visible := false;
    end;
  end;

  cdsPayType.Open;

  cdsEnts.Locate('kaid', CurrEnt.KAID, []);

  cdsPersonName.Open;
  lcbPersonName.KeyValue := 0;
  lcbPersonName.Text := '';
  
  //Установка валюты по умолчанию
  edDate.Date := OnDate;
  edTime.Time := Time;
  edReason.Text := '';
  SetRate;
  Fid := Value;

  //********** Чтение оборотов ***********************
  if (Value > 0) and not IsPattern then begin
    with newDataSet do
    try
      ProviderName := 'pWMatTurnOut_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FID;
      Open;
      mdWMatTurn.CopyFromDataSet(Fields[0].DataSet);
      Close;
      mdWMatTurnOld.CopyFromDataSet(mdWMatTurn.Fields[0].DataSet);

    finally
      Free;
    end;
  end;//  if Value>0 then begin
  //*****************************

  edKAgent.KAID := 0;

  with newDataSet do
  try
    chbPosting.Checked := WBOutChecked;
    if ((Value = 0) or IsPattern or ((Value > 0) and ((FInAccOut > 0) or (FOrderID > 0)))) and WBOutAutoNum
    then begin
      APreffix := WBOutPrefix;
      ASuffix := WBOutSuffix;
      FLastGen := '';

      FCurrNum := GetDocNumEx(dmData.SConnection, dtWBOut, 1, APreffix, ASuffix,
          FLastGen, cdsEnts.FieldByName('kaid').AsInteger);

      edNum1.Text := APreffix + IntToStr(FCurrNum) + ASuffix;
    end
    else edNum1.Text := '';

    if Value > 0 then begin
      ProviderName := 'pDocsRel_WB_WB_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FID;
      Params.ParamByName('doctype').AsInteger := -16;
      Open;
      if not IsEmpty
        then FOrderID := FieldByName('wbillid').AsInteger
        else FOrderID := 0;
      Close;

      Self.Caption := rs('fmWaybill', 'TitleEditOut');
      ProviderName := 'pWaybill_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := Value;
      Open;
      if not IsEmpty then begin
        if (FInAccOut = 0) and not IsPattern then begin
          edNum1.Text := fieldbyname('num').AsString;
          edNum1.Tag := fieldbyname('defnum').AsInteger;
        end
        {else begin
          edNum1.Text := IntToStr(GetDocNum(dmData.SConnection,-1));
        end};

        chbRetNDS.Checked := fieldbyname('defnum').AsInteger = 1;
        if not IsPattern then begin
          edDate.Date := fieldbyname('ondate').AsDateTime;
          edTime.Time := fieldbyname('ondate').AsDateTime;
        end;

        cdsPayType.Locate('ptypeid', lcbPayType.KeyValue, []);
        edKAgent.KAID := fieldbyname('kaid').AsInteger;

        if not fieldbyname('personid').IsNull
          then lcbPersonName.KeyValue := fieldbyname('personid').AsInteger;

        oldkaid := fieldbyname('kaid').AsInteger;
        FAttRcv := fieldbyname('received').asstring;
        FAttNum := fieldbyname('attnum').asstring;
        FAttDate := fieldbyname('attdate').AsDateTime;
        //chbAtt.Checked := (trim(AttNum)<>'');
        edReason.Text := fieldbyname('reason').asstring;

        if not FieldByName('entid').IsNull then cdsEnts.Locate('kaid', FieldByName('entid').AsInteger, []);

        if not IsPattern then FInAccOut := Trunc(FieldByName('todate').AsDateTime);

        if FInAccOut > 0 then begin
          edKAgent.Enabled := False;
          edContr.Enabled := False;
        end;

        edNotes.Text := FieldByName('notes').AsString;

        if cdsCurr.Locate('CURRID',fieldbyname('CURRID').AsInteger,[])
          then cbCurr.KeyValue := Fieldbyname('CURRID').AsInteger;

        edRate.Value := FieldByName('onvalue').AsFloat;
        chbPosting.Checked := Fieldbyname('CHECKED').AsInteger = 1;
        FPrevChecked := chbPosting.Checked;

      end;
      Close;
    end //if Value<>0
    else Self.Caption := RS('fmWaybill','TitleAddOut');

    if Value > 0 then begin
      if (FOrderID > 0) or (FInAccOut > 0) then begin
        ProviderName := 'pWaybillDet_GetWBAcc';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := Value;
        Open;
        mdAcc.CopyFromDataSet(Fields[0].DataSet);
      end
      else begin
        ProviderName := 'pWaybillDet_GetOut';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := FID;
        Open;
      end;

      mdDet.LoadFromDataSet(Fields[0].DataSet);
      if not mdDet.IsEmpty then mdDet.First;
      Close;

      if (FOrderID > 0) or (FInAccOut > 0) then begin
        ProviderName := 'pWaybillSvc_GetWBAcc';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := Value;
        Open;
        mdAcc.LoadFromDataSet(Fields[0].DataSet);
      end
      else begin
        ProviderName := 'pWaybillSvc_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := FID;
        Open;
      end;
      mdDet.LoadFromDataSet(Fields[0].DataSet);
      Close;

      if mdAcc.Active then begin
        mdAcc.First;
        while not mdAcc.Eof do begin
          mdAcc.Edit;
          if mdAcc.FieldByName('posid').AsInteger < 0 then begin
            mdAcc.FieldByName('accposid').AsInteger := -mdAcc.FieldByName('accposid').AsInteger;
            mdAcc.FieldByName('realposid').AsInteger := -mdAcc.FieldByName('realposid').AsInteger;
          end;
          mdAcc.FieldByName('posid').AsInteger := mdAcc.FieldByName('accposid').AsInteger;
          mdAcc.Post;
          mdAcc.Next;
        end;
      end;

      if not mdDet.IsEmpty then begin
        mdDet.First;
        while not mdDet.Eof do begin
          if (mdDet.FieldByName('bySN').AsInteger = 1) and (mdDet.FieldByName('sn').AsString = '')
              and mdWMatTurn.Locate('sourceid', mdDet.FieldByName('posid').AsInteger,[])
          then begin
            mdDet.Edit;
            mdWMatTurn.First;

            while not mdWMatTurn.Eof do begin
              if (mdWMatTurn.FieldByName('sourceid').AsInteger = mdDet.FieldByName('posid').AsInteger)
                 and (not mdWMatTurn.FieldByName('SN').IsNull)
              then begin
                mdDet.FieldByName('SN').AsString := mdDet.FieldByName('SN').AsString + mdWMatTurn.FieldByName('SN').AsString + '; ';
              end;
              mdWMatTurn.Next;
            end;

            if mdDet.FieldByName('SN').IsNull
            then mdDet.Cancel
            else begin
              mdDet.FieldByName('SN').AsString := System.Copy(mdDet.FieldByName('SN').AsString,1,Length(mdDet.FieldByName('SN').AsString)-2);
              mdDet.Post;
            end;
          end;//if
          mdDet.Next;
        end;//while
      end;//if Value > 0

      ProviderName := 'pDocsRel_WB_Contr_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FID;
      Params.ParamByName('doctype').AsInteger := -8;
      Open;

      if not IsEmpty then begin
        edContr.DocID := FieldByName('rdocid').AsInteger;
        FContrDocID := edContr.DocID;
      end
      else edContr.DocID := 0;

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

      with dbgWaybillDet do if FocusedNode <> nil then FocusedNode.Selected := True;

      if not IsPattern then begin
        ProviderName := 'pWayBillPay_Get';// Чтение платежа
        FetchParams;
        Params.ParamByName('WBILLID').AsInteger := FID;
        Open;

        if not IsEmpty then begin
          chbPay.Enabled := false;
          chbPay.Checked := true;
          chbPay.Enabled := true;
          PayDocChecked := (fieldbyname('Checked').AsInteger = 1);
          chbPay.Enabled := not PayDocChecked;

          if not chbPay.Enabled then begin
            lPaySumm.Enabled := False;
            lPayCurr.Enabled := False;
            lPayType.Enabled := False;
            edPaySumm.Enabled := False;
            edPayNum.Enabled := False;
            cbPayCurr.Enabled := False;
            lPayMPerson.Enabled := False;
            lcbPayMPerson.Enabled := False;
            aPayMPersons.Enabled := False;
            btnPayMPerson.Enabled := False;
            lcbCashDesks.Enabled := False;
            lcbAccount.Enabled := False;
            lAcc.Enabled := False;
            lCashDesks.Enabled := False;
            btnCashDesks.Enabled := False;
            btnFinPay.Enabled := False;
          end;

          PayDocId := fieldbyname('PayDocId').AsInteger;
          OldPayDocID := PayDocID;

          if FInAccOut > 0 then AccPayDocID := OldPayDocID;

          PayDocDate := fieldbyname('OnDate').AsDateTime;
   //lPayOnDate.Caption := rs_AttDate+' '+DateToStr(OldPayDocDate);

          edPayNum.Text := fieldbyname('DocNum').AsString;
          FPayNum := fieldbyname('DocNum').AsString;
          lcbPayType.KeyValue := fieldbyname('PTypeId').AsInteger;

          edPaySumm.Tag := 1;
          edPaySumm.Value := fieldbyname('Total').AsFloat;
          edPaySumm.Tag := 0;

          if not FieldByName('mpersonid').IsNull
            then lcbPayMPerson.KeyValue := FieldByName('mpersonid').AsInteger;

          if not FieldByName('accid').IsNull
            then lcbAccount.KeyValue := FieldByName('accid').AsInteger
            else lcbAccount.Clear;

          if not FieldByName('cashid').IsNull
            then lcbCashDesks.KeyValue := FieldByName('cashid').AsInteger
            else lcbCashDesks.Clear;

          if cdsPayType.Locate('PTypeId',fieldbyname('CurrId').AsInteger,[])
            then cbPayCurr.KeyValue := fieldbyname('CurrId').AsInteger;
        end;//if not IsEmpty
        Close;
      end; //if not IsPattern then begin
    end // if Value > 0
    else begin
      mdDet.Open;
      mdWMatTurn.Open;
      mdWMatTurnOld.CopyFromDataSet(mdWMatTurn);
      PayDocChecked := false;
      PayDocId := 0;
      chbPay.Enabled := false;
      chbPay.Checked := false;
      chbPay.Enabled := true;
      edPayNum.Text := '';
      edPaySumm.Tag := 1;
      edPaySumm.Value := 0;
      edPaySumm.Tag := 0;

    end;

    with cdsPersonName do begin
      if UserID <> 0 then begin
        Open;
        if Value <> 0 then begin // editing enabled only for document owner or admin
            if Locate('userid', UserID, []) and (lcbPersonName.KeyValue <> FieldByName('kaid').AsInteger)
            then EditingDisabled := True;
        end
        else if Locate('userid', UserID, []) then lcbPersonName.KeyValue := FieldByName('kaid').AsInteger;

        lcbPersonName.Enabled := False;
        btnPersonName.Enabled := False;
      end;
    end;

    FModified := False;
    if IsPattern then begin
      FPosModified := True;
      FID := 0;
      mdWMatTurn.Open;
      mdWMatTurnOld.CopyFromDataSet(mdWMatTurn);
      FShowRsvMsgs := False;
      aSetRsvAll.Execute;
      FShowRsvMsgs := True;
      dbgWaybillDet.ClearSelection;
      mdDet.First;
      with dbgWaybillDet do
        if FocusedNode <> nil then FocusedNode.Selected := True;
    end
    else FPosModified := False;

    //FPaySummChange := true;
    if Value > 0 then begin
      mdDet.AfterPost := nil;
      mdDet.OnCalcFields := nil;
      mdDet.DisableControls;
      mdDet.First;
      while not mdDet.Eof do begin
        mdDet.Edit;
        mdDet.FieldByName('fullprice').AsFloat :=
            mdDet.FieldByName('price').AsFloat / (100 - mdDet.FieldByName('discount').AsFloat) * 100;

        if mdWMatTurn.Locate('sourceid', mdDet.FieldByName('posid').AsInteger, [])
          then mdDet.FieldByName('status').AsInteger := 1;

        mdDet.Post;
        UpdatePos;

        if mdDet.FieldByName('cardid').AsInteger > 0 then begin
          if not mdDC.Active then mdDC.Open;

          if not mdDCT.Active then mdDCT.Open;

          if not mdDC.Locate('cardid', mdDet.FieldByName('cardid').AsInteger, [])
            then GetNewDC(mdDet.FieldByName('cardid').AsInteger);

          if not mdDC.Locate('posid', mdDet.FieldByName('posid').AsInteger, [])
            then mdDC.Append
            else mdDC.Edit;

          mdDC.FieldByName('cardid').AsInteger := mdDet.FieldByName('cardid').AsInteger;
          mdDC.FieldByName('posid').AsInteger := mdDet.FieldByName('posid').AsInteger;
          mdDC.FieldByName('total').AsCurrency := mdDet.FieldByName('total').AsCurrency;
          mdDC.Post;
        end;

        mdDet.Next;
      end; //while not mdDet.Eof
      mdDet.First;
      mdDet.AfterPost := mdDetAfterPost;
      mdDet.OnCalcFields := mdDetCalcFields;
      mdDet.EnableControls;
      FGridRefresh := True;
      FPosModified := True;
    end; // if Value > 0

    //FPaySummChange := false;
    FPayDocModified := False;

  finally
    Free;
  end;

  SetAtt;

  if not GetUserAccessByClass(Self.ParentNameEx, uaPost) then begin
    chbPosting.Hint := rs('Common', 'noRights');
    chbPosting.Checked := False;
    chbPosting.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord, res: boolean;
    posList: String;
    BM: TBookmark;
    cdsTemp: TssClientDataSet;
    FPosID, FWDocID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWaybillOut.FormCloseQuery') else _udebug := nil;{$ENDIF}

  try // finally
    CanClose := False;

    {if (ModalResult = mrCancel) and (FID > 0) and CheckModified // WTF???!!!!
      then ModalResult := mrOK;
    }
    if ModalResult = mrCancel then begin
      CanClose := True;
      Exit;
    end;

    if ModalResult in [mrOK, mrYes] then begin
      CloseMode := True;

      if chbPosting.Checked and not CheckOrdered(posList) then begin
        ssMessageDlg(Format(RS('fmWaybill', 'CantShipOrderedPos'), [posList]), ssmtError, [ssmbOk]);
        Exit;
      end;

      if (edContr.DocID > 0) and not CheckByContr(edContr,cbCurr.KeyValue,(edDate.Date + edTime.Time))
        then Exit;

      if (edContr.DocID > 0) and chbPay.Checked and (edPaySumm.Value > (edContr.Obj.Summ - Abs(edContr.Obj.PaidSumm)))
      then begin
        ssMessageDlg(Format(RS('fmContr','CheckErr8'), [edContr.Obj.Num, FormatFloat(MoneyDisplayFormat,edContr.Obj.Summ - abs(edContr.Obj.PaidSumm))]), ssmtError, [ssmbOk]);
        Exit;
      end;

      if not CheckDocDate(edDate.Date) then Exit;

      if CheckDatesIn then begin
        cdsTemp := newDataSet;

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
              Params.ParamByName('DEFNUM').AsInteger := Integer(chbRetNDS.Checked);
              Params.ParamByName('ONDATE').AsDateTime := edDate.Date + edTime.Time;
              Params.ParamByName('KAID').AsInteger := edKAgent.KAID;
              Params.ParamByName('CURRID').AsInteger := cbCurr.KeyValue;
              Params.ParamByName('ONVALUE').AsFloat := edRate.Value;
              Params.ParamByName('ATTNUM').AsString := FAttNum;
              Params.ParamByName('ATTDATE').AsDate := FAttDate;
              Params.ParamByName('REASON').AsString := edReason.Text;
              Params.ParamByName('notes').AsString := edNotes.Text;

              if (lcbPersonName.EditText = '') or (lcbPersonName.KeyValue <= 0) then begin
                Params.ParamByName('PERSONID').DataType := ftInteger;
                Params.ParamByName('PERSONID').Clear;
              end
              else Params.ParamByName('PERSONID').AsInteger := lcbPersonName.KeyValue;

              Params.ParamByName('CHECKED').AsInteger := integer(chbPosting.Checked);
              Params.ParamByName('WTYPE').AsInteger := wbtWaybillOut;
              Params.ParamByName('DELETED').AsInteger := 0;
              Params.ParamByName('SUMMALL').AsFloat := RoundToA(ALLSUMM, -2);
              Params.ParamByName('SUMMINCURR').AsFloat := AllSummCurr;

              Params.ParamByName('NDS').DataType := ftFloat;
              Params.ParamByName('NDS').Clear;

              Params.ParamByName('RECEIVED').AsString := FAttRcv;

              Params.ParamByName('TODATE').DataType := ftDateTime;
              Params.ParamByName('TODATE').Clear;

              if FInAccOut <> 0
                then Params.ParamByName('TODATE').AsDateTime := FInAccOut
                else if FOrderID <> 0 then Params.ParamByName('todate').AsDateTime := FOrderID;

              if cdsEnts.IsEmpty then begin
                Params.ParamByName('entid').DataType := ftInteger;
                Params.ParamByName('entid').Clear;
              end
              else Params.ParamByName('entid').AsInteger := cdsEnts.FieldByName('kaid').AsInteger;

              Execute;//Записали в waybilllist

              if (FInAccOut <> 0) and NewRecord then begin
                ProviderName := 'pDocsRel_WB_Acc_Ins';
                FetchParams;
                Params.ParamByName('wbillid').AsInteger := FID;
                Params.ParamByName('accid').AsInteger := FInAccOut;
                Execute;
              end;

              if (FOrderID <> 0) and NewRecord then begin
                ProviderName := 'pDocsRel_WB_Acc_Ins';
                FetchParams;
                Params.ParamByName('wbillid').AsInteger := FID;
                Params.ParamByName('accid').AsInteger := FOrderID;
                Execute;
              end;

              if FPosModified then begin // Запись позиций в накладную
                if ((FInAccOut > 0) or (FOrderID > 0)) and not NewRecord then begin
                  ProviderName := 'pAccOutDet_Fix';
                  FetchParams;
                  Params.ParamByName('wbillid').AsInteger := FID;
                  Execute;
                end;

                // 2 Удаляем позиции
                ProviderName := 'pWaybillDet_Del';
                FetchParams;
                Params.ParamByName('WBILLID').AsInteger := FID;
                Execute;

                ProviderName := 'pWaybillSvc_Del';
                FetchParams;
                Params.ParamByName('wbillid').AsInteger := FID;
                Execute;

                // 3 Запись позиций из mdDet в waybilldet
                BM := mdDet.GetBookmark;
                mdDet.DisableControls;
                mdDet.First;
                while not mdDet.Eof do begin
                  if mdDet.FieldByName('postype').AsInteger = 0 then begin
                    ProviderName := 'pWaybillDet_Ins';
                    FetchParams;
                    FPosID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
                    Params.ParamByName('POSID').AsInteger := FPosID;

                    //3.1 Ставим реальные Sourceid для оборотов
                    mdWMatTurn.First;
                    while not mdWMatTurn.Eof do begin
                      if mdWMatTurn.FieldByName('sourceid').AsInteger = mdDet.fieldbyname('posid').AsInteger then begin
                        mdWMatTurn.Edit;
                        mdWMatTurn.FieldByName('sourceid').AsInteger := Params.ParamByName('POSID').AsInteger;
                        mdWMatTurn.Post;
                      end;
                      mdWMatTurn.Next;
                    end;
                    mdDet.Edit;
                    mdDet.FieldByName('realposid').AsInteger := FPosID;
                    mdDet.Post;
                    //**************************

                    if Params.ParamByName('POSID').AsInteger < 0
                      then raise Exception.Create(rs('fmWaybill','ErrorAddPos'));

                    Params.ParamByName('WBILLID').AsInteger := FID;
                    Params.ParamByName('MATID').AsInteger := mdDet.fieldbyname('MATID').AsInteger;
                    Params.ParamByName('WID').AsInteger := mdDet.fieldbyname('WID').AsInteger;
                    Params.ParamByName('AMOUNT').AsFloat := RoundToA(StrToFloat(mdDet.fieldbyname('AMOUNT').AsString), MatDisplayDigits);
                    Params.ParamByName('PRICE').AsFloat := StrToFloat(mdDet.fieldbyname('PRICE').AsString);
                    Params.ParamByName('onvalue').AsFloat := StrToFloat(mdDet.fieldbyname('onvalue').AsString);
                    Params.ParamByName('DISCOUNT').AsFloat := StrToFloat(mdDet.fieldbyname('DISCOUNT').AsString);
                    Params.ParamByName('NDS').AsFloat := StrToFloat(mdDet.fieldbyname('NDS').AsString);
                    Params.ParamByName('CurrId').AsInteger := cbCurr.KeyValue;
                    Params.ParamByName('OnDate').AsDateTime := edDate.Date+edTime.Time;

                    if mdDet.fieldbyname('PTypeID').IsNull then begin
                      Params.ParamByName('PTypeID').DataType := ftInteger;
                      Params.ParamByName('PTypeID').Clear;
                    end
                    else Params.ParamByName('PTypeID').AsInteger := mdDet.fieldbyname('PTypeID').AsInteger;

                    Params.ParamByName('NUM').AsInteger := mdDet.RecNo;
                    Params.ParamByName('total').AsFloat := mdDet.fieldbyname('total').AsFloat;
                    Execute; //Записываем очередную позицию

                    SaveAddProps(FPosID);
                    SaveTaxes(FPosID);
                    SaveSerial(FPosID);
                  end
                  else begin
                    ProviderName := 'pWaybillSvc_Ins';
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

                    if not mdDet.FieldByName('personid').IsNull
                      then Params.ParamByName('personid').AsInteger := mdDet.FieldByName('personid').AsInteger
                      else begin
                        Params.ParamByName('personid').DataType := ftInteger;
                        Params.ParamByName('personid').Clear;
                      end;

                    Execute;

                    mdDet.Edit;
                    mdDet.FieldByName('realposid').AsInteger := FPosID;
                    mdDet.Post;
                  end;

                  mdDet.Next;
                end;//while not mdDet.Eof

                mdDet.GotoBookmark(BM);
                FreeBookmark(BM);
                mdDet.EnableControls;

                //2)Запись в обороты
                mdWMatTurn.First;
                while not mdWMatTurn.Eof do begin
                  ProviderName := 'pWMatTurnOut_Ins';
                  FetchParams;
                  Params.ParamByName('PosID').AsInteger := mdWMatTurn.fieldbyname('posid').AsInteger;
                  Params.ParamByName('MatID').AsInteger := mdWMatTurn.fieldbyname('matid').AsInteger;
                  Params.ParamByName('WID').AsInteger := mdWMatTurn.fieldbyname('wid').AsInteger;
                  Params.ParamByName('SOURCEID').AsInteger := mdWMatTurn.fieldbyname('SOURCEID').AsInteger;

                  if chbPosting.Checked
                    then Params.ParamByName('TurnType').AsInteger := -1
                    else Params.ParamByName('TurnType').AsInteger := 2;

                  Params.ParamByName('OnDate').AsDateTime := edDate.Date+edTime.Time;
                  Params.ParamByName('Amount').AsFloat := RoundToA(strtofloat(mdWMatTurn.fieldbyname('amount').AsString), MatDisplayDigits);
                  Execute;

                  if ((FInAccOut > 0) or (FOrderID > 0)) and NewRecord then begin
                    if mdDet.Locate('realposid', mdWMatTurn.FieldByName('sourceid').AsInteger, [])
                       and mdWMatTurnOld.Locate('posid;sourceid', VarArrayOf([mdWMatTurn.FieldByName('posid').AsInteger, mdDet.FieldByName('posid').AsInteger]), [])
                    then begin
                      ProviderName := 'pWMatTurn_UpdRsv';
                      FetchParams;
                      Params.ParamByName('posid').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
                      Params.ParamByName('sourceid').AsInteger := mdWMatTurnOld.FieldByName('sourceid').AsInteger;
                      Params.ParamByName('amount').AsFloat := -mdWMatTurn.FieldByName('amount').AsFloat;
                      Execute;
                    end;
                  end;

                  mdWMatTurn.Next;
                end;

              end;//if FPosModified

              // если накладная по счёту - корректируем инфу для позиций из счёта
              if ((FInAccOut > 0) or (FOrderID > 0)) and FPosModified then begin
                mdDet.First;

                while not mdDet.Eof do begin
                  if mdDet.FieldByName('postype').AsInteger = 0 then begin // tangible
                    if NewRecord
                      then res := mdAcc.Locate('posid', mdDet.FieldByName('posid').AsInteger, [])
                      else res := mdAcc.Locate('realposid', mdDet.FieldByName('posid').AsInteger, []);

                    if res then begin
                      ProviderName := 'pAccOutPosRel_Ins';
                      FetchParams;
                      Params.ParamByName('posid').AsInteger := mdDet.FieldByName('realposid').AsInteger;

                      if NewRecord
                        then Params.ParamByName('accposid').AsInteger := mdAcc.FieldByName('posid').AsInteger
                        else Params.ParamByName('accposid').AsInteger := mdAcc.FieldByName('accposid').AsInteger;

                      if Params.ParamByName('accposid').AsInteger <> 0 then Execute; // isnull weirdness in memoryDS
                    end;
                  end // if mdDet.FieldByName('postype').AsInteger = 0 (tangible)

                  else if mdDet.FieldByName('postype').AsInteger = 1 then begin // svc
                    if NewRecord
                      then res := mdAcc.Locate('posid', mdDet.FieldByName('posid').AsInteger, [])
                      else res := mdAcc.Locate('realposid', mdDet.FieldByName('posid').AsInteger, []);

                    if res then begin
                      ProviderName := 'pAccOutSvcRel_Ins';
                      FetchParams;
                      Params.ParamByName('posid').AsInteger := mdDet.FieldByName('realposid').AsInteger;

                      if NewRecord
                        then Params.ParamByName('accposid').AsInteger := -mdAcc.FieldByName('posid').AsInteger
                        else Params.ParamByName('accposid').AsInteger := -mdAcc.FieldByName('accposid').AsInteger;

                      if Params.ParamByName('accposid').AsInteger <> 0 then Execute; // isnull weirdness in memoryDS
                    end;
                  end;

                  mdDet.Next;
                end;
              end;

              if FPayDocModified then begin //Если платёж изменён, то записываем его
                if OldPayDocId > 0 then begin
                  PayDocId := OldPayDocId;
                  PayDocDate := edDate.Date;
                end;

                if chbPay.Checked then begin //
                  if PayDocId > 0 then begin //если платёж существует, то обновляем
                    ProviderName := 'pWaybillPayDoc_Upd';
                    FetchParams;
                  end//if PayDocId>0
                  else begin // если платёж не существует
                    //Получить ID нового платежа
                    PayDocId := GetMaxID(dmData.SConnection, 'paydoc', 'paydocid');
                    ProviderName := 'pPayDoc_Ins';
                    FetchParams;
                    Params.ParamByName('withnds').AsInteger := 1;
                    Params.ParamByName('doctype').AsInteger := 1;
                    Params.ParamByName('notes').AsString := '';
                    PayDocDate := edDate.Date + Time;
                  end;// если платёж не существует

                  Params.ParamByName('reason').AsString := rs('fmWaybill', 'TitleWaybillOut') + amountPrefix + edNum1.Text;
                  Params.ParamByName('ondate').AsDateTime := PayDocDate;
                  Params.ParamByName('kaid').AsInteger := edKAgent.KAID;
                  Params.ParamByName('paydocid').AsInteger := PayDocId;
                  Params.ParamByName('docnum').AsString := edPayNum.Text;
                  Params.ParamByName('ptypeid').AsInteger := lcbPayType.KeyValue;

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

                  Params.ParamByName('currid').AsInteger := cbPayCurr.KeyValue;

                  if cbCurr.KeyValue = cbPayCurr.KeyValue
                    then Params.ParamByName('onvalue').AsFloat := StrToFloat(edRate.EditingText)
                    else Params.ParamByName('onvalue').AsFloat := GetCurrencyRateEx(dmData.SConnection, cbPayCurr.KeyValue, edDate.Date);

                  Params.ParamByName('total').AsFloat := RoundToA(StrToFloat(edPaySumm.EditingText), -2);
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
                else begin                  //Удаление платежа
                  if PayDocId > 0 then begin // если он существует
                    ProviderName := 'pPayDoc_Del';
                    FetchParams;
                    Params.ParamByName('PayDocId').AsInteger := PayDocId;
                    Execute; //Удаление из PayDoc
                    PayDocId := 0;
                    OldPayDocId := 0;
                  end;//if PayDocId>0
                end;//else chbPay.Checked
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

              if WarrantyExist then begin
                ProviderName := 'pWarrantyDocs_Get';
                FetchParams;
                Params.ParamByName('wbillid').AsInteger := FID;
                Open;
                if not IsEmpty then begin
                  FWDocID := FieldByName('wdocid').AsInteger;
                  Close;
                end
                else begin
                  Close;
                  FWDocID := GetMaxID(dmData.SConnection, 'warrantydocs', 'wdocid');
                  ProviderName := 'pWarrantyDocs_Ins';
                  FetchParams;
                  Params.ParamByName('wdocid').AsInteger := FWDocID;
                  Params.ParamByName('wbillid').AsInteger := FID;
                  Params.ParamByName('num').AsString := IntToStr(GetDocNum(dmData.SConnection, dtWarrantyDoc, 1));
                  Execute;
                end;

                ProviderName := 'pWarrantyDet_Ins';
                FetchParams;
                Params.ParamByName('wdocid').AsInteger := FWDocID;
                Params.ParamByName('wbillid').AsInteger := FID;
                Execute;
              end;

              if FOrderID > 0 then begin
                ProviderName := 'pOrder_UpdStatus';
                FetchParams;
                Params.ParamByName('wbillid').AsInteger := FOrderID;

                if chbPosting.Checked
                  then Params.ParamByName('checked').AsInteger := 1
                  else Params.ParamByName('checked').AsInteger := 2;

                Execute;
              end;

              if not TrCommit then Exit;
              //------------------------------------------------------------------------------

              FPosModified := False; //Сбрасываем флаг изменения позиций
              FPayDocModified := False;
              FModified := False;//флаг изменения документа false

              if chbPosting.Checked then begin
                if edContr.DocID > 0 then DoRecalcContract(dmData.SConnection, edContr.DocID);
                DoRecalcDCByWB(dmData.SConnection, FID);
                DoRecalcKASaldo(dmData.SConnection, edKAgent.KAID, edDate.Date, RS('fmWaybill', 'RecalcBallance'));
              end;

              if ModalResult = mrYes then begin
                if NewRecord then begin
                  PayDocId := 0;
                  mdDet.Close;
                  mdWMatTurn.Close;
                  mdTmpIds.Close;
                  FPayNum := '';
                  dmData.SConnection.AppServer.Rsv_Delete(-1);

                  ID := 0;

                  if WBOutAutoNum
                    then edKAgent.SetFocus
                    else edNum1.SetFocus;
                end//if NewRecord
                else begin
                    if chbPosting.Checked
                    then CanClose := true
                    else begin
                      if PDInAutoNum and (OldPayDocID = 0) and chbPay.Checked
                        then FCurrPayNum := GetDocNum(dmData.SConnection, dtPDIn, 1);

                      OldPayDocId := PayDocID;

                      dmData.SConnection.AppServer.Rsv_Delete(-1);
                    end;
                end//else NewRecord
              end
              else begin
                dmData.SConnection.AppServer.Rsv_Delete(-1);
                CanClose := True;
              end;

              FGridRefresh := true;
              FPaySummChange := true;

              if ((FInAccOut > 0) or (FOrderID > 0) or WHMode)
                then SendMessage(MainHandle, WM_REFRESH, 0, 0)
                else SendMessage(MainHandle, WM_REFRESH, ID, 0);

              if (FInAccOut > 0) then RefreshFun('TfmAccOut', 0);
              if (FOrderID > 0) then RefreshFun('TfmOrders', -16);

              RefreshFun('TfmPayDoc', 0);

              if (FInAccOut > 0) or (FOrderID > 0) or WHMode
                then RefreshFun('TfmWaybillOut', 0)
                else RefreshFun('TfmWMat', 0);

              RefreshFun('TfmFinance', 0);
              RefreshFun('TfmDiscCards', 0);

              case CountryRules.AR of
                accRul_UA: RefreshFun('TfmTaxWB', 0);
              end;

            finally
              Free;
              cdsTemp.Free;
              Screen.Cursor := crDefault;
            end;

          except
            on e:exception do begin
              TrRollback;
              raise;
            end;
          end;
        end;// with newDataSet
      end;//if CheckDatesIn then begin
    end // modalresult ok,yes

    else begin
      if FLastGen = '' then begin
        if GetDocNum(dmData.SConnection, dtWBOut, 0) = FCurrNum
          then GetDocNum(dmData.SConnection, dtWBOut, -1);
      end
      else begin
        if Gen_ID(dmData.SConnection, FLastGen, 0) = FCurrNum
          then Gen_ID(dmData.SConnection, FLastGen, -1);
      end;

      if GetDocNum(dmData.SConnection, dtPDIn, 0) = FCurrPayNum
        then GetDocNum(dmData.SConnection, dtPDIn, -1);
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;//FormCloseQuery

//==============================================================================================
procedure TfrmEditWaybillOut.aCDelExecute(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aCDelExecute') else _udebug := nil;{$ENDIF}

  if ((dbgWaybillDet.SelectedCount = 1) and (mrYes <> ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo])))
     or
     ((dbgWaybillDet.SelectedCount > 1) and (mrYes <> ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [dbgWaybillDet.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo])))
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  Screen.Cursor := crSQLWait;
  fProgress.Caption := rs('Common', 'Deleting');
  fProgress.Show;
  fProgress.pbMain.Max := dbgWaybillDet.SelectedCount;
  CanSelect := False;

  try
    mdDet.DisableControls;
    for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
      Application.ProcessMessages;

      if mdDet.Locate('posid', dbgWaybillDet.SelectedNodes[i].Values[colPosId.Index], [])
        then DelPos;

      fProgress.pbMain.StepIt;
      Application.ProcessMessages;
    end;

    LocateAfterDel;
    FGridRefresh := True;

  finally
    Screen.Cursor := crDefault;
    fProgress.Hide;
    mdDet.EnableControls;
    CanSelect := True;
    SelectFocusedNode;
    RealignGrid;
  end;//if

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aCUpdExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aCUpdExecute') else _udebug := nil;{$ENDIF}

  try
    Screen.Cursor := crSQLWait;

    case mdDet.FieldByName('postype').AsInteger of
      0:
        with TfrmEditPositionAcc.Create(nil) do
        try
          WBType := wbtWaybillOut;
          FmdDC := mdDC;
          FmdDCT := mdDCT;
          FByAcc := (FInAccOut > 0) and (FOrderID = 0); // AP: added orderid check
          FByOrder := (FOrderID > 0){ and chbPosting.Checked}; // AP: needed to unlock warehouses list for order
          Self.FOrdID := FAccOutID;
          FAccOutID := Self.FOrdID;
          ParentNameEx := Self.ParentNameEx;
          dbgWaybillDet.SetFocus;
          Application.ProcessMessages;

          edDiscount.Tag := edKAgent.KAID;
          FKAID := edKAgent.KAID;
          NDSPayer := (cdsEnts.FieldByName('ndspayer').AsInteger = 1);
          OnDate := Self.OnDate;
          ParentHandle := Self.Handle;
          ParentHandle2 := Self.Handle;
          KAType := edKAgent.Obj.KType;
          PTypeID := edKAgent.Obj.PTypeID;
          CurrID := Self.cbCurr.KeyValue;
          OnDate := StrToDate(edDate.Text);
          FRateDate := Self.FRateDate;
          FRateID := Self.FRateID;
          FExchangeRate := CurKurs;
          aSetKurs.Caption := FloatToStr(CurKurs);

          parentMDDet := mdDet;
          parentmdWMatTurn := mdWMatTurn;
          parentMDWMatTurnOld := mdWMatTurnOld;
          parentMDTmpIDs := mdTmpIds;

          CurrName := cdsCurr.fieldbyname('shortname').AsString;
          Caption := rs('fmWaybill', 'PosEdit');
          aShowPriceIn.Hint := rs('fmWaybill', 'ShowPriceIn');
          chbRsv.Tag := VarToInt(dbgWaybillDet.FocusedNode.Values[colStatus.Index]);
          chbRsv.Checked := (VarToInt(dbgWaybillDet.FocusedNode.Values[colStatus.Index]) = 1);

          if FInAccOut > 0
            then FMaxAmount := Self.mdAcc.FieldByName('amount').AsFloat
            - Self.mdAcc.FieldByName('shippedamount').AsFloat
            - Self.mdAcc.FieldByName('rsvamount').AsFloat;

          FInAcc := (Self.FInAccOut > 0);
          AOMode := False;
          ID := mdDet.FieldByName('posid').AsInteger;
          Screen.Cursor := crDefault;

        finally
          Free;
        end;

      1:
        with TfrmEditPositionSvc.Create(nil) do
        try
          ParentHandle := Self.Handle;
          ParentNameEx := Self.ParentNameEx;
          OnDate := Int(edDate.Date) + Frac(edTime.Time);
          FRateValue := Self.edRate.Value;
          CurrID := Self.cbCurr.KeyValue;
          mdDet := Self.mdDet;
          PosNDS := StrToFloat(mdDet.fieldbyname('NDS').AsString);
          ID := Self.mdDet.FieldByName('posid').AsInteger;
          ShowModal;

        finally
          Free;
        end;
    end; //case

  finally
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.ChangeMatsCur;
  var
    BM:TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.ChangeMatsCur') else _udebug := nil;{$ENDIF}

  with mdDet do begin
    BM := GetBookmark;
    DisableControls;
    
    try
      try
        First;
        while not Eof do begin
          Edit;
          FieldByName('CurrId').AsFloat := cbCurr.KeyValue;
          Post;
          Next;
        end;

      except
      end;

    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
      EnableControls;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aRemoveRsvExecute(Sender: TObject);
  var
    i, FPosID: Integer;
    BM:TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aRemoveRsvExecute') else _udebug := nil;{$ENDIF}

  if ssMessageDlg(rs('fmWaybill', 'DelRsvConfirm'), ssmtWarning,[ssmbYes,ssmbNo]) = mrYes then begin
    Application.ProcessMessages;

    if dbgWaybillDet.SelectedCount > 1 then fProgress.Show;

    fProgress.Caption := rs('fmWaybill','DelRsvPr');
    fProgress.Refresh;
    fProgress.pbMain.Max := dbgWaybillDet.SelectedCount;
    mdDet.DisableControls;

    try
      for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
        if VarToInt(dbgWaybillDet.SelectedNodes[i].Values[colStatus.Index]) <> 0 then begin
          fProgress.lText.Caption := dbgWaybillDet.SelectedNodes[i].Values[colMatName.Index];
          Application.ProcessMessages;
          FPosID := dbgWaybillDet.SelectedNodes[i].Values[colPosID.Index];
          DoRemoveRsv(FPosID);
          fProgress.pbMain.StepIt;
          Application.ProcessMessages;
        end;
      end;

    finally
      fProgress.Hide;
      mdDet.EnableControls;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aRemoveRsvAllExecute(Sender: TObject);
  var
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aRemoveRsvAllExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.SelectAll;
  aRemoveRsvExecute(aRemoveRsv);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.RemoveRsv;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.RemoveRsv') else _udebug := nil;{$ENDIF}

  while mdWMatTurn.Locate('sourceid', mdDet.fieldbyname('posid').AsInteger,[] ) do mdWMatTurn.Delete;

  //Удаление из mdTmpIds и освобождение резерва для текущего sourceid
  with mdTmpIds do begin
    First;
    while not Eof do begin
      if FieldByName('sourceid').AsInteger = mdDet.fieldbyname('posid').AsInteger then begin
        dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
        Delete;
      end//if
      else Next;
    end;//while not eof
  end;//with mdTmpIds

  //Освобождение редактируемых позиций (старых)
  mdWMatTurnOld.First;
  while not mdWMatTurnOld.Eof do begin
    if mdWMatTurnOld.FieldByName('sourceid').AsInteger = mdDet.fieldbyname('posid').AsInteger
    then begin
      with newDataSet do
      try
        ProviderName := 'pWayBill_GetMatID_WID';
        FetchParams;
        Params.ParamByName('posId').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
        Open;
        if not IsEmpty then begin
          mdTmpIds.Append;
          mdTmpIds.FieldByName('sourceid').AsInteger := mdWMatTurnOld.FieldByName('sourceid').AsInteger;
          mdTmpIds.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString)*-1,MatDisplayDigits);
          mdTmpIds.FieldByName('posid').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
          mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdWMatTurnOld.FieldByName('posid').AsInteger,Fields[0].AsInteger,Fields[1].AsInteger,0,RoundToA(strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString)*-1, MatDisplayDigits));
          mdTmpIds.FieldByName('free').AsInteger := 0;
          mdTmpIds.FieldByName('forall').AsInteger := 0;
          mdTmpIds.Post;
        end;//if not IsEmpty
        Close;

      finally
        Free;
      end;
    end;//if

    mdWMatTurnOld.Next;
  end;//while not mdWMatTurnOld.Eof

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.DelPos;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.DelPos') else _udebug := nil;{$ENDIF}

  //Удаление из mdWMatTurn
  while mdWMatTurn.Locate('sourceid', mdDet.fieldbyname('posid').AsInteger, [] )
     do mdWMatTurn.Delete;

  //Удаление из mdTmpIds и освобождение резерва для текущего sourceid
  with mdTmpIds do begin
    First;

    while not Eof do begin
      if (FieldByName('sourceid').AsInteger = mdDet.fieldbyname('posid').AsInteger) then begin
        dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
        Delete;
      end
      else Next;
    end;//while not eof
  end;//with mdTmpIds

  //Освобождение редактируемых позиций (старых)
  mdWMatTurnOld.First;
  while not mdWMatTurnOld.Eof do begin
    if mdWMatTurnOld.FieldByName('sourceid').AsInteger = mdDet.fieldbyname('posid').AsInteger
    then begin
      with newDataSet do
      try
        RemoteServer := dmData.SConnection;
        ProviderName := 'pWayBill_GetMatID_WID';
        FetchParams;
        Params.ParamByName('posId').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
        Open;
        if not IsEmpty then begin
          mdTmpIds.Append;
          mdTmpIds.FieldByName('sourceid').AsInteger := mdWMatTurnOld.FieldByName('sourceid').AsInteger;
          mdTmpIds.FieldByName('amount').AsFloat := RoundToA(-strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits);
          mdTmpIds.FieldByName('posid').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
          mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdWMatTurnOld.FieldByName('posid').AsInteger, Fields[0].AsInteger,Fields[1].AsInteger,0,RoundToA(strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString)*-1, MatDisplayDigits));
          mdTmpIds.FieldByName('free').AsInteger := 0;
          mdTmpIds.FieldByName('forall').AsInteger := 0;
          mdTmpIds.Post;
        end;//if not IsEmpty
        Close;

      finally
        Free;
      end;
    end;//if

    mdWMatTurnOld.Next;
  end;//while not mdWMatTurnOld.Eof

  mdDet.Delete;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aSetRsvExecute(Sender: TObject);
  var
    i: Integer;
    eStr: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aSetRsvExecute') else _udebug := nil;{$ENDIF}

  if not FShowRsvMsgs or (ssMessageDlg(rs('fmWaybill', 'SetRsvConfirm'), ssmtWarning, [ssmbYes,ssmbNo]) = mrYes)
  then begin
    Application.ProcessMessages;

    if dbgWaybillDet.SelectedCount > 1 then fProgress.Show;

    fProgress.Caption := rs('fmWaybill','SetRsvPr');
    fProgress.pbMain.Max := dbgWaybillDet.SelectedCount;
    mdDet.DisableControls;
    try
      for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
        if (dbgWaybillDet.SelectedNodes[i].Values[colPType.Index] = 0)
           and (VarToInt(dbgWaybillDet.SelectedNodes[i].Values[colStatus.Index]) <> 1)
        then begin
          fProgress.lText.Caption := dbgWaybillDet.SelectedNodes[i].Values[colMatName.Index];
          Application.ProcessMessages;

          if not DoSetRsv(dbgWaybillDet.SelectedNodes[i].Values[colPosId.Index],
             dbgWaybillDet.SelectedNodes[i].Values[colMatId.Index],
             dbgWaybillDet.SelectedNodes[i].Values[colWId.Index],
             dbgWaybillDet.SelectedNodes[i].Values[colAmount.Index])
          then begin
            if dbgWaybillDet.SelectedCount > 1 then begin
              eStr := rs('fmWaybill', 'RsvErrorPr1') + ': <'
                  + dbgWaybillDet.SelectedNodes[i].Values[colMatName.Index] + '>. ' + rs('fmWaybill', 'RsvErrorPr2');

              if FShowRsvMsgs and (ssMessageDlg(eStr, ssmtError, [ssmbYes, ssmbNo]) <> mrYes) then begin
                mdPosition.Close;
                fProgress.Hide;
                Break;
              end;

            end
            else if FShowRsvMsgs
                 then ssMessageDlg(rs('fmWaybill', 'RsvErrorPr1') + ' <' + dbgWaybillDet.SelectedNodes[i].Values[colMatName.Index] + '>. ', ssmtError, [ssmbOK]);
          end;

          fProgress.pbMain.StepIt;
          Application.ProcessMessages;
        end;//if dbgWaybillDet...
      end;//for

    finally
      fProgress.Hide;
      mdDet.EnableControls;
    end;

    FPosModified := True;
    GetSummAll;
  end;//if  ssMessageDlg...

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aAddSvcExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aAddSvcExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditPositionSvc.Create(nil) do
  try
    ParentHandle := Self.Handle;
    ParentNameEx := Self.ParentNameEx;
    OnDate := Int(edDate.Date) + Frac(edTime.Time);
    FRateValue := Self.edRate.Value;
    CurrID := Self.cbCurr.KeyValue;
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
procedure TfrmEditWaybillOut.aAddMatListExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aAddMatListExecute') else _udebug := nil;{$ENDIF}

  DocInfo.CurrName := cbCurr.Text;
  DocInfo.CurrID := cbCurr.KeyValue;
  DocInfo.CurrRate := edRate.Value;
  DocInfo.KAID := edKAgent.KAID;
  DocInfo.OnDate := edDate.Date;
  DocInfo.NDSPayer := (cdsEnts.FieldByName('ndspayer').AsInteger = 1);

  if CurrEnt.NDSPayer
    then DocInfo.NDS := NDS
    else DocInfo.NDS := 0;

  if (edKAgent.KAID <> 0) and (edKAgent.Obj.PTypeID > 0)
    then DocInfo.PTypeID := edKAgent.Obj.PTypeID
    else DocInfo.PTypeID := GetDefPriceType;

  ShowModalWH(Self, MaxDateTime, 0, 2, 0, Integer(@DocInfo));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aAddMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aAddMatExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  with TfrmEditPositionAcc.Create(nil) do
  try
    WBType := wbtWaybillOut;
    ParentNameEx := Self.ParentNameEx;
    FmdDC := mdDC;
    FmdDCT := mdDCT;
    OnDate := Self.OnDate;
    FKAID := edKAgent.KAID;
    NDSPayer := (cdsEnts.FieldByName('ndspayer').AsInteger = 1);
    ParentHandle := Self.Handle;
    ParentHandle2 := Self.Handle;
    PTypeID := edKAgent.Obj.PTypeID;
    KAType := edKAgent.Obj.KType;
    CurrID := Self.cbCurr.KeyValue;
    OnDate := StrToDate(edDate.Text);
    FRateDate := Self.FRateDate;
    FRateID := Self.FRateID;
    FExchangeRate := CurKurs;
    FAccOutID := FOrdID;
    aSetKurs.Caption := FloatToStr(CurKurs);

    parentMDDet := mdDet;
    parentmdWMatTurn := mdWMatTurn;
    parentMDWMatTurnOld := mdWMatTurnOld;
    parentMDTmpIDs := mdTmpIds;

    CurrName := cdsCurr.fieldbyname('shortname').AsString;
    Caption := rs('fmWaybill', 'PosAdd');
    aShowPriceIn.Hint := rs('fmWaybill','ShowPriceIn');

    if cdsEnts.FieldByName('ndspayer').AsInteger = 1
      then FPosNDS := NDS
      else FPosNDS := 0;

    Self.Enabled := False;

    ID := 0;
    Self.FOrdID := FAccOutID;
    Screen.Cursor := crDefault;

  finally
    Self.Enabled := True;

    if not mdDet.IsEmpty then begin
      dbgWaybillDet.Enabled := True;
      dbgWaybillDet.SetFocus;
    end;

    Free;

    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aCInsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aCInsExecute') else _udebug := nil;{$ENDIF}

  case WBOutDefAction of
    aaMat:     aAddMat.Execute;
    aaSvc:     aAddSvc.Execute;
    aaMatList: aAddMatList.Execute;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditWaybillOut.CreateByAccOut(AAccID: Integer; IDs, Svcs: string): Integer;
 var
   FRsv, FMinPrice, FMaxPrice, FAvgPrice, FLastInPrice, FRemain, FRsv2, FPrice: Extended;
   i, FPTypeID: Integer;
   FWithNDS: Boolean;
   FTaxSumm, FPosNDS, FSumWONDS, FNDS: Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.CreateByAccOut') else _udebug := nil;{$ENDIF}

  Result := 0;
  FInAccOut := AAccID;

  with NewDataSet do
  try
    mdDet.Close;
    mdDet.Open;

    ProviderName := 'pWaybill_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AAccID;
    Open;
    edKAgent.KAID := FieldByName('kaid').AsInteger;
    edKAgent.Enabled := False;
    edContr.Enabled := False;
    FAccountID := FieldByName('defnum').AsInteger;
    edReason.Text := rs('fmWaybill', 'ByAcc') + amountPrefix + FieldByName('num').AsString;

    if not FieldByName('entid').IsNull
      then cdsEnts.Locate('kaid', FieldByName('entid').AsInteger, []);

    edDate.Date := Self.OnDate;
    cbCurr.KeyValue := FieldByName('currid').AsInteger;
    edRate.Value := FieldByName('onvalue').AsFloat;
    Close;

    ProviderName := 'pDocsRel_WB_Contr_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AAccID;
    Params.ParamByName('doctype').AsInteger := -8;
    Open;
    if not IsEmpty then begin
      edContr.DocID := FieldByName('rdocid').AsInteger;
    end;
    Close;

    if IDs <> '' then begin
      ProviderName := 'pWaybillDet_GetAccPos';
      FetchParams;
      FetchMacros;
      Macros.ParamByName('ids').AsString := IDs;
      Open;
      mdDet.LoadFromDataSet(Fields[0].DataSet);
      mdAcc.CopyFromDataSet(Fields[0].DataSet);
      Close;
    end;

    if Svcs <> '' then begin
      ProviderName := 'pWaybillDet_GetSvc';
      FetchParams;
      FetchMacros;
      Params.ParamByName('wbillid').AsInteger := FInAccOut;
      Macros.ParamByName('ids').AsString := Svcs;
      Open;
      mdDet.LoadFromDataSet(Fields[0].DataSet);
      mdAcc.LoadFromDataSet(Fields[0].DataSet);
      Close;
    end;

    ProviderName := 'pWMatTurnOut_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := FInAccOut;
    Open;
    mdWMatTurn.CopyFromDataSet(Fields[0].DataSet);
    Close;

    mdWMatTurn.First;
    while not mdWMatTurn.Eof do begin
      if not mdAcc.Locate('posid', mdWMatTurn.FieldByName('sourceid').AsInteger, [])
        then mdWMatTurn.Delete
        else mdWMatTurn.Next;
    end;
    mdWMatTurnOld.CopyFromDataSet(mdWMatTurn);

    FShippedPosExist := False;

    mdDet.First;
    while not mdDet.Eof do begin
      if (mdDet.FieldByName('postype').AsInteger = 0) and mdAcc.Locate('posid', mdDet.FieldByName('posid').AsInteger, [])
      then begin
        mdDet.Edit;
        mdDet.FieldByName('amount').AsFloat := RoundToA(mdDet.FieldByName('amount').AsFloat -
          mdAcc.FieldByName('shippedamount').AsFloat -
          mdAcc.FieldByName('rsvamount').AsFloat, MatDisplayDigits);
        mdDet.Post;
      end;

      if mdDet.FieldByName('postype').AsInteger = 0 then begin
        if not mdWMatTurn.Locate('sourceid', mdDet.FieldByName('posid').AsInteger, [])
          then DoSetRsv(mdDet.FieldByName('posid').AsInteger,
                 mdDet.FieldByName('matid').AsInteger,
                 mdDet.FieldByName('wid').AsInteger,
                 mdDet.FieldByName('amount').AsFloat, True);

          if mdDet.FieldByName('amount').AsFloat <= 0 then begin
            mdDet.Delete;
            Continue;
          end;
        mdDet.Edit;

        if mdWMatTurn.Locate('sourceid', mdDet.FieldByName('posid').AsInteger, [])
          then mdDet.FieldByName('status').AsInteger := 1
          else mdDet.FieldByName('status').AsInteger := 0;

        mdDet.Post;
      end;

      if mdDet.FieldByName('Amount').AsFloat = 0
        then begin
          mdDet.Delete;
          FShippedPosExist := True;
        end
        else mdDet.Next;
    end;

    ProviderName := 'pWaybillDet_GetTaxes';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := FInAccOut;
    Open;
    while not Eof do begin
      if (mdDet.FieldByName('postype').AsInteger = 0) and mdDet.Locate('posid', FieldByName('posid').AsInteger, [])
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

      Next;
    end;
    Close;

    mdDet.First;
    for i := 0 to mdDet.RecordCount - 1 do begin
      mdDet.Edit;
      mdDet.FieldByName('fullprice').AsFloat := mdDet.FieldByName('price').AsFloat / (100 - mdDet.FieldByName('discount').AsFloat) * 100;
      mdDet.Post;

      UpdatePos;

      mdDet.Next;
    end;

    if dbgWaybillDet.FocusedNode <> nil
      then dbgWaybillDet.FocusedNode.Selected := True;

  finally
    Free;
  end;

  FRateChanged := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.SaveAddProps(APosID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.SaveAddProps') else _udebug := nil;{$ENDIF}

  if (mdDet.FieldByName('producer').AsString <> '')
     or (mdDet.FieldByName('certnum').AsString <> '')
     or (mdDet.FieldByName('gtd').AsString <> '')
     or (mdDet.FieldByName('certdate').AsDateTime <> 0)
     or (mdDet.FieldByName('cardid').AsInteger > 0)
     or (not mdDet.FieldByName('warrantyperiod').IsNull)
  then begin
    with newDataSet do
    try
      ProviderName := 'pWaybillDetAP_Ins';
      FetchParams;
      Params.ParamByName('posid').AsInteger := APosID;
      Params.ParamByName('producer').AsString := mdDet.FieldByName('producer').AsString;
      Params.ParamByName('certnum').AsString := mdDet.FieldByName('certnum').AsString;
      Params.ParamByName('gtd').AsString := mdDet.FieldByName('gtd').AsString;

      if mdDet.FieldByName('certdate').AsDateTime = 0 then begin
        Params.ParamByName('certdate').DataType := ftDateTime;
        Params.ParamByName('certdate').Clear;
      end
      else Params.ParamByName('certdate').AsDateTime := mdDet.FieldByName('certdate').AsDateTime;

      if not mdDet.FieldByName('warrantyperiod').IsNull then begin
        Params.ParamByName('warrantyperiod').AsInteger := mdDet.FieldByName('warrantyperiod').AsInteger;
        Params.ParamByName('warrantyperiodtype').AsInteger := mdDet.FieldByName('warrantyperiodtype').AsInteger;
      end
      else begin
        Params.ParamByName('warrantyperiod').DataType := ftInteger;
        Params.ParamByName('warrantyperiod').Clear;
        Params.ParamByName('warrantyperiodtype').DataType := ftInteger;
        Params.ParamByName('warrantyperiodtype').Clear;
      end;

      if mdDet.FieldByName('cardid').IsNull then begin
        Params.ParamByName('cardid').DataType := ftInteger;
        Params.ParamByName('cardid').Clear;
      end
      else Params.ParamByName('cardid').AsInteger := mdDet.FieldByName('cardid').AsInteger;

      Execute;

    finally
      Free;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.AddMats(var IDs: string);
 var
   FRsv, FMinPrice, FMaxPrice, FAvgPrice, FLastInPrice, FRemain, FRsv2, FPrice: Extended;
   i, FPTypeID: Integer;
   FWithNDS: Boolean;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.AddMats') else _udebug := nil;{$ENDIF}

  WHMode := True;

  with newDataSet do
  try
    cdsRsv_Temp.Close;
    cdsRsv_Temp.Open;
    mdDet.Close;
    mdDet.Open;

    ProviderName := 'pWaybillDet_GetPosEx';
    FetchParams;
    FetchMacros;
    Params.ParamByName('ondate').AsDateTime := MaxDateTime;
    Macros.ParamByName('ids').AsString := IDs;

    Open;
    while not Eof do begin
      FRsv := FieldByName('rsv').AsFloat;

      if cdsRsv_Temp.Locate('posid', FieldByName('posid').AsInteger, [])
        then FRsv := FRsv + cdsRsv_Temp.FieldByName('amount').AsFloat;

      Edit;
      FieldByName('posid').AsInteger := -FieldByName('posid').AsInteger;

      if FieldByName('remain').IsNull
        then FieldByName('amount').AsFloat := RoundToA(FieldByName('amount').AsFloat - FRsv, MatDisplayDigits)
        else FieldByName('amount').AsFloat := RoundToA(FieldByName('remain').AsFloat - FRsv, MatDisplayDigits);

      FieldByName('discount').AsFloat := 0;
      Post;
      Next;
    end;

    mdDet.LoadFromDataSet(Fields[0].DataSet);
    Close;

    ProviderName := 'pSQL';
    FetchMacros;
    Params.Clear;
    Macros.ParamByName('sql').AsString := 'select ptypeid from pricetypes where def=1';
    Open;
    FPTypeID := Fields[0].AsInteger;
    Close;

    mdDet.First;
    for i := 0 to mdDet.RecordCount - 1 do begin
      GetMatPrices(dmData.SConnection, mdDet.fieldbyname('matid').AsInteger, FMinPrice, FMaxPrice, FAvgPrice, FLastInPrice, FRemain, FRsv2);

      if POType = poAvg
        then FPrice := FAvgPrice
        else FPrice := FLastInPrice;

      FPrice := GetDefPriceOut(dmData.SConnection, mdDet.fieldbyname('matid').AsInteger, FPTypeID, FPrice, OnDate, CurKurs, FWithNDS);

      case WBOutPriceType of
        0: if not FWithNDS then FPrice := NDSIn(FPrice, mdDet.fieldbyname('nds').AsFloat);
        1: if FWithNDS then FPrice := NDSOut(FPrice, mdDet.fieldbyname('nds').AsFloat);
      end;
      FPrice := RoundToA(FPrice{ / CurKurs}, -6);

      mdRsv.Open;
      mdRsv.Append;
      mdRsv.FieldByName('posid').AsInteger := -mdDet.FieldByName('posid').AsInteger;
      mdRsv.FieldByName('pricein').AsFloat := StrToFloat(mdDet.FieldByName('price').AsString);
      mdRsv.FieldByName('amount').AsFloat := StrToFloat(mdDet.FieldByName('amount').AsString);
      mdRsv.Post;

      mdWMatTurn.Open;
      mdWMatTurn.Append;
      mdWMatTurn.FieldByName('posid').AsInteger := -mdDet.fieldbyname('posid').AsInteger;
      mdWMatTurn.FieldByName('matid').AsInteger := mdDet.fieldbyname('matid').AsInteger;
      mdWMatTurn.FieldByName('wid').AsInteger := mdDet.fieldbyname('wid').AsInteger;
      mdWMatTurn.FieldByName('sourceid').AsInteger := mdDet.fieldbyname('posid').AsInteger;
      mdWMatTurn.FieldByName('amount').AsFloat := RoundToA(StrToFloat(mdDet.FieldByName('amount').AsString), MatDisplayDigits);
      mdWMatTurn.FieldByName('ondate').AsDateTime := 0;
      mdWMatTurn.Post;

      mdTmpIds.Open;
      mdTmpIds.Append;
      mdTmpIds.FieldByName('sourceid').AsInteger := mdDet.FieldByName('posid').AsInteger;
      mdTmpIds.FieldByName('posid').AsInteger := -mdDet.FieldByName('posid').AsInteger;
      mdTmpIds.FieldByName('amount').AsFloat := RoundToA(StrToFloat(mdDet.FieldByName('amount').AsString), MatDisplayDigits);

      mdTmpIds.FieldByName('tmpid').AsInteger :=
        dmData.SConnection.AppServer.Rsv_Add(-mdDet.FieldByName('posid').AsInteger,
          mdDet.FieldByName('matid').AsInteger,
          mdDet.FieldByName('wid').AsInteger, 0,
          StrToFloat(mdTmpIds.FieldByName('amount').AsString));

      mdTmpIds.FieldByName('free').AsInteger := 0;
      mdTmpIds.FieldByName('forall').AsInteger := 0;
      mdTmpIds.Post;

      mdDet.Edit;
      mdDet.FieldByName('status').AsInteger := 1;
      mdDet.FieldByName('price').AsFloat := FPrice;
      mdDet.FieldByName('fullprice').AsFloat := FPrice;
      mdDet.FieldByName('ptypeid').AsInteger := FPTypeID;
      mdDet.Post;
      UpdatePos;

      mdDet.Next;
    end;

    if dbgWaybillDet.FocusedNode <> nil then dbgWaybillDet.FocusedNode.Selected := True;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.GetTaxes;
  var
    ACol: TdxDBTreeListColumn;
    FField: TFloatField;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.GetTaxes') else _udebug := nil;{$ENDIF}

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
      ACol.OnGetText := colTaxGetText;

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
      ACol.OnGetText := colTaxRateGetText;

      Next;
    end;

    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.SaveTaxes(APosID: Integer);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.SaveTaxes') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pWaybillDetTaxes_Ins';
    FetchParams;
    Params.ParamByName('posid').AsInteger := APosID;

    for i := 0 to mdDet.FieldCount - 1 do begin
      if (Pos('Tax', mdDet.Fields[i].FieldName) = 1)
         and (Pos('TaxRate', mdDet.Fields[i].FieldName) = 0)
         and (mdDet.Fields[i].AsFloat > 0)
      then begin
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
procedure TfrmEditWaybillOut.aChangeEntExecute(Sender: TObject);
  var
    APreffix, ASuffix: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aChangeEntExecute') else _udebug := nil;{$ENDIF}

  if cdsEnts.RecordCount > 1 then begin
    cdsEnts.Next;

    if cdsEnts.Eof then cdsEnts.First;

    if (FID = 0) and WBOutAutoNum then begin
      if FLastGen <> '' then begin
        if Gen_ID(dmData.SConnection, FLastGen, 0) = FCurrNum then Gen_ID(dmData.SConnection, FLastGen, -1);
      end
      else if GetDocNum(dmData.SConnection, dtWBOut, 0) = FCurrNum then GetDocNum(dmData.SConnection, dtWBOut, -1);

      APreffix := WBOutPrefix;
      ASuffix := WBOutSuffix;
      FLastGen := '';
      FCurrNum := GetDocNumEx(dmData.SConnection, dtWBOut, 1, APreffix, ASuffix, FLastGen, cdsEnts.FieldByName('kaid').AsInteger);
      edNum1.Text := APreffix + IntToStr(FCurrNum) + ASuffix;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aAttExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aAttExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditAtt.Create(nil) do
  try
    Caption := rs('fmWaybill', 'Att');
    cbReceived.Properties.Items.Assign(FKAPersons);

    if FAttDate = 0
      then edAttDate.Date := edDate.Date
      else edAttDate.Date := FAttDate;

    cbReceived.Text := FAttRcv;
    edAttNum.Text := FAttNum;
    btnAtt.Invalidate;

    if ShowModal in [mrOK, mrYes] then begin
      FAttNum := edAttNum.Text;
      FAttDate := edAttDate.Date;
      FAttRcv := cbReceived.Text;
      SetAtt;
      Self.Perform(WM_NEXTDLGCTL, 0, 0);
    end;

    btnAtt.Invalidate;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.FillMatsFromWMat(DS: TDataSet);
  var
    FPosID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.FillMatsFromWMat') else _udebug := nil;{$ENDIF}

  fProgress.Caption := rs('Common', 'Reserving');
  fProgress.pbMain.Max := DS.RecordCount;
  fProgress.Show;
  FShowRsvMsgs := False;

  try
    with mdDet do begin
      if not mdDet.Active then mdDet.Open;

      DS.DisableControls;
      mdDet.DisableControls;
      mdDet.AfterPost := nil;
      DS.First;
      FPosID := dsNextPosID(mdDet);

      while not DS.Eof do begin
        fProgress.lText.Caption := DS.FieldByName('name').AsString;
        fProgress.Update;
        Dec(FPosID);
        Append;
        FieldByName('posid').AsInteger := FPosID;
        FieldByName('matid').AsInteger := DS.FieldByName('matid').AsInteger;
        FieldByName('postype').AsInteger := DS.Tag;

        if DS.Tag = 0 then FieldByName('status').AsInteger := 0;

        FieldByName('norm').AsFloat := 0;
        FieldByName('matname').AsString := DS.FieldByName('name').AsString;
        FieldByName('msrname').AsString := DS.FieldByName('msrname').AsString;
        FieldByName('artikul').AsString := DS.FieldByName('artikul').AsString;
        FieldByName('amount').AsFloat := DS.FieldByName('amount').AsFloat;
        FieldByName('price').AsFloat := DS.FieldByName('price').AsFloat;

        if DS.Tag = 0 then begin
          FieldByName('fullprice').AsFloat := DS.FieldByName('fullprice').AsFloat;
          FieldByName('discount').AsFloat := DS.FieldByName('discount').AsFloat;
        end
        else begin
          FieldByName('discount').AsFloat := 0;
          FieldByName('fullprice').AsFloat := FieldByName('price').AsFloat / (100 - FieldByName('discount').AsFloat) * 100;
        end;

        if CurrEnt.NDSPayer
          then FieldByName('nds').AsFloat := NDS
          else FieldByName('nds').AsFloat := 0;

        if DS.Tag = 0 then begin
          FieldByName('wid').AsInteger := DS.FieldByName('wid').AsInteger;
          FieldByName('whname').AsString := DS.FieldByName('whname').AsString;
          FieldByName('currname').AsString := cbCurr.Text;
          FieldByName('currid').AsInteger := cbCurr.KeyValue;
        end
        else FieldByName('wid').AsInteger := 0;

        FieldByName('onvalue').AsFloat := edRate.Value;
        FieldByName('producer').AsString := DS.FieldByName('producer').AsString;
        FieldByName('barcode').AsString := DS.FieldByName('barcode').AsString;

        if (DS.FindField('ptypeid') <> nil) and (DS.FieldByName('ptypeid').AsInteger > 0)
          then FieldByName('ptypeid').AsInteger := DS.FieldByName('ptypeid').AsInteger;

        Post;
        UpdatePos;

        if DS.Tag = 0
          then DoSetRsv(FieldByName('posid').AsInteger, FieldByName('matid').AsInteger,
                        FieldByName('wid').AsInteger, FieldByName('amount').AsFloat, False, True);

        DS.Next;
        fProgress.pbMain.StepIt;
        fProgress.Update;
      end;
    end;

    DS.EnableControls;
    FPosModified := True;
    mdDet.EnableControls;
    mdDet.AfterPost := mdDetAfterPost;
    FGridRefresh := True;
    dbgWaybillDet.Adjust(nil, [colPosType, colRecNo, colStatus]);

    dbgWaybillDet.ClearSelection;

    if dbgWaybillDet.FocusedNode <> nil then dbgWaybillDet.FocusedNode.Selected := True;

  finally
    FShowRsvMsgs := True;
    fProgress.Hide;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditWaybillOut.DoSetRsv(APosID, AMatID, AWID: Integer;
  AAmount: Extended; AResetToExisting: Boolean = False;
  ASkipClearing: Boolean = False): Boolean;

 var
   ASourceId,FPosId,ATmpId, i: integer;
   FAmount, AAAmount, FRemain, tmpremain, TmpAmount: Extended;
   SNs: string;
   BM: TBookmark;
   FMR: TModalResult;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.DoSetRsv') else _udebug := nil;{$ENDIF}

  SNs := '';
  AAAmount := AAmount;

  //Освобождение редактируемых позиций (старых)
  if not ASkipClearing then begin
    mdWMatTurnOld.First;

    while not mdWMatTurnOld.Eof do begin
      if mdWMatTurnOld.FieldByName('sourceid').AsInteger = APosID then begin
        with newDataSet do
        try
          ProviderName := 'pWayBill_GetMatID_WID';
          FetchParams;
          Params.ParamByName('posId').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
          Open;
          if not IsEmpty then begin
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := mdWMatTurnOld.FieldByName('sourceid').AsInteger;
            mdTmpIds.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString)*-1,MatDisplayDigits);
            mdTmpIds.FieldByName('posid').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdWMatTurnOld.FieldByName('posid').AsInteger,Fields[0].AsInteger,Fields[1].AsInteger,0,strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString)*-1);
            mdTmpIds.FieldByName('free').AsInteger := 1;
            mdTmpIds.FieldByName('forall').AsInteger := 0;
            mdTmpIds.Post;
          end;//if not IsEmpty

          Close;

        finally
          Free;
        end;
      end;//if

      mdWMatTurnOld.Next;
    end;//while not mdWMatTurnOld.Eof

    //Освобождение редактируемых позиций (новых)
    mdTmpIds.First;
    while not mdTmpIds.Eof do begin
      if (mdTmpIds.FieldByName('sourceid').AsInteger = APosID) and (mdTmpIds.FieldByName('free').AsInteger<>1)
      then begin
        with newDataSet do
        try
          ProviderName := 'pWayBill_GetMatID_WID';
          FetchParams;
          Params.ParamByName('posId').AsInteger := mdTmpIds.FieldByName('posid').AsInteger;
          Open;
          if not IsEmpty then begin
            BM := mdTmpIds.GetBookmark;  //Сохранение текщей позиции
            ASourceId := mdTmpIds.FieldByName('sourceid').AsInteger;
            FAmount := mdTmpIds.FieldByName('amount').AsFloat;
            FPosId := mdTmpIds.FieldByName('posid').AsInteger;
            ATmpId := mdTmpIds.FieldByName('tmpid').AsInteger;

            try
              mdTmpIds.Append;
              mdTmpIds.FieldByName('sourceid').AsInteger := ASourceId;
              mdTmpIds.FieldByName('amount').AsFloat := FAmount*-1;
              mdTmpIds.FieldByName('posid').AsInteger := FPosId;
              mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(FPosId,Fields[0].AsInteger,Fields[1].AsInteger,0,FAmount*-1);
              mdTmpIds.FieldByName('free').AsInteger := 1;
              mdTmpIds.FieldByName('forall').AsInteger := 0;
              mdTmpIds.Post;

            finally
              mdTmpIds.GotoBookmark(BM);
              mdTmpIds.FreeBookmark(BM);
            end;
          end;//if not IsEmpty

          Close;

        finally
          Free;
        end;
      end;//if

      mdTmpIds.Next;
    end;//while not mdTmpIds.Eof
  end;

  //2.
  //*******************************************************************
  //*******************************************************************
  //Получение остатков на складе
  GetMatRestsByKAorWID(dmData.SConnection, AMatID, 0, AWID, MaxDateTime, Integer(mdPosition));
  mdPosition.First;
  FRemain := 0;

  while not mdPosition.Eof do begin
    mdPosition.Edit;
    mdPosition.fieldbyname('amount').AsFloat := RoundToA(mdPosition.fieldbyname('amount').AsFloat, MatDisplayDigits);
    mdPosition.Post;
    FRemain := FRemain+strtofloat(mdPosition.fieldbyname('amount').AsString);
    mdPosition.Next;
  end;//while not Eof

  //3.
  //*******************************************************************
  //*******************************************************************
  //    Резерв позиций
  try
    if AResetToExisting and (FRemain < AAAmount) then begin
      if not FREForAll
        then FMR := ssMessageDlg(Format(rs('fmWaybill', 'ResetToExisting'),
          [mdDet.FieldByName('matname').AsString, FormatFloat(MatDisplayFormat, FRemain), FormatFloat(MatDisplayFormat, AAAmount)]),
          ssmtWarning, [ssmbYes, ssmbYesForAll, ssmbNo])
        else FMR := mrYes;

      case FMR of
        mrYesToAll: begin
          FREForAll := True;
          FMR := mrYes;
        end;

        mrYes: begin
          AAAmount := FRemain;
          mdDet.Edit;
          mdDet.FieldByName('amount').AsFloat := FRemain;
          mdDet.Post;
        end;
      end; // case FMR
    end;

    tmpremain := AAAmount;
    mdRsv.Close;
    mdRsv.Open;

    with mdPosition do begin
      First;

      while not Eof and (tmpremain>0) do begin
        if (tmpremain <= strtofloat(fieldbyname('amount').AsString)) and (strtofloat(fieldbyname('amount').AsString) > 0)
        then begin
          mdRsv.Append;
          mdRsv.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
          mdRsv.FieldByName('pricein').AsFloat := strtofloat(FieldByName('price').AsString);
          mdRsv.FieldByName('amount').AsFloat := tmpremain;

          if not FieldByName('SN').IsNull then begin
            mdRsv.FieldByName('SN').AsString := FieldByName('SN').AsString;
          end;

          mdRsv.Post;
        end//if
        else
          if strtofloat(fieldbyname('amount').AsString)>0 then begin
            mdRsv.Append;
            mdRsv.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
            mdRsv.FieldByName('pricein').AsFloat := strtofloat(FieldByName('price').AsString);
            mdRsv.FieldByName('amount').AsFloat := strtofloat(FieldByName('amount').AsString);

            if not FieldByName('SN').IsNull then begin
              mdRsv.FieldByName('SN').AsString := FieldByName('SN').AsString;
            end;

            mdRsv.Post;
          end;

        tmpremain := tmpremain-fieldbyname('amount').AsFloat;
        Next;
      end;//while
    end;//with

  Except
    mdRsv.Close;
    raise;
  end;

  //4.
  //*******************************************************************
  //*******************************************************************
  //Удаление освобождённых позиций
  if not ASkipClearing then begin
    with mdTmpIds do begin
      First;
      while not Eof do begin
        if (FieldByName('sourceid').AsInteger=APosID) and (FieldByName('free').AsInteger=1) then begin
          dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
          Delete;
        end//if
        else Next;
      end;//while not eof
    end;//with
  end;

  //4.
  //*******************************************************************
  //*******************************************************************
  //Проверка наличия
  if FRemain >= AAAmount then begin

    //Удаление всего резерва для текущего sourceid
    if not ASkipClearing then begin
      with mdTmpIds do begin
        First;
        while not Eof do begin
          if (FieldByName('sourceid').AsInteger = APosID) then begin
            dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
            Delete;
          end//if
          else Next;
        end;//while not eof
      end;//with mdTmpIds

      //Удаление всех записей из mdWMatTurn для текущего sourceid
      with mdWMatTurn do begin
        First;
        while not Eof do begin
          if (fieldbyname('sourceid').AsInteger=APosID) then Delete
            else Next;
        end;//while
      end;//with TdxMemData(pointer(panMain.Tag))
    end;

    //************* Запись в mdWMatturn новых позиций
    mdRsv.First;
    while not mdRsv.Eof do begin
      //Запись в mdWMatTurn
      mdWMatTurn.Append;
      mdWMatTurn.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
      mdWMatTurn.FieldByName('matid').AsInteger := AMatID;
      mdWMatTurn.FieldByName('wid').AsInteger := AWID;
      mdWMatTurn.FieldByName('sourceid').AsInteger := APosID;
      mdWMatTurn.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits);
      mdWMatTurn.FieldByName('ondate').AsDateTime := 0;

      if not mdRsv.fieldbyname('SN').IsNull then begin
        mdWMatTurn.FieldByName('SN').AsString := mdRsv.fieldbyname('SN').AsString;
        SNs := SNs + mdWMatTurn.FieldByName('SN').AsString + '; ';
      end;

      mdWMatTurn.Post;

      if mdWMatTurnOld.Locate('posid;sourceid', VarArrayOf([mdRsv.fieldbyname('posid').AsInteger, APosID]),[])
      then begin
        mdWMatTurnOld.Edit;
        mdWMatTurnOld.FieldByName('flag').AsInteger := 1;
        mdWMatTurnOld.Post;

        if RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits)
           > RoundToA(strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits)
        then begin
          {Получить сумму для текущего posid в mdTmpIds}
          with mdTmpIds do begin
            First;
            TmpAmount := 0;
              while not Eof do begin
                if (FieldByName('posid').AsInteger = mdRsv.fieldbyname('posid').AsInteger)
                  then TmpAmount := RoundToA(TmpAmount + RoundToA(strtofloat(FieldByName('amount').AsString), MatDisplayDigits), MatDisplayDigits);

                Next;
              end;//while not Eof
          end;//with TdxMemData(pointer(stRemain.Tag))

          if TmpAmount < 0 then begin
            if RoundToA(-TmpAmount, MatDisplayDigits)
               > RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString)
                          - strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits)
            then begin
              mdTmpIds.Append;
              mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
              mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
              //Разница для себя
              mdTmpIds.FieldByName('amount').AsFloat := RoundToA(StrToFloat(mdRsv.fieldbyname('amount').AsString) - strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits);
              mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 0,strtofloat(mdTmpIds.FieldByName('amount').AsString));
              mdTmpIds.FieldByName('free').AsInteger := 0;
              mdTmpIds.FieldByName('forall').AsInteger := 0;
              mdTmpIds.Post;
            end
            else begin
              mdTmpIds.Append;
              mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
              mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
              //Доступное кол-во для себя TmpAmount*-1
              mdTmpIds.FieldByName('amount').AsFloat := RoundToA(TmpAmount*-1, MatDisplayDigits);
              mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 0,strtofloat(mdTmpIds.FieldByName('amount').AsString));
              mdTmpIds.FieldByName('free').AsInteger := 0;
              mdTmpIds.FieldByName('forall').AsInteger := 0;
              mdTmpIds.Post;

              if 0 <> RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString) - strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString) + TmpAmount, MatDisplayDigits)
              then begin
                mdTmpIds.Append;
                mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
                mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
                //Разницу для всех strtofloat(mdRsv.fieldbyname('amount').AsString)-TmpAmount*-1
                mdTmpIds.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString)-strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString)-(TmpAmount*-1), MatDisplayDigits);
                mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 1, strtofloat(mdTmpIds.FieldByName('amount').AsString));
                mdTmpIds.FieldByName('free').AsInteger := 0;
                mdTmpIds.Post;
              end;//if 0 <> RoundToA...
            end;//else
          end//if TmpAmount<0
          else begin
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
            mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
            //Разница для всех
            mdTmpIds.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString)-strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits);
            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 1,strtofloat(mdTmpIds.FieldByName('amount').AsString));
            mdTmpIds.FieldByName('free').AsInteger := 0;
            mdTmpIds.FieldByName('forall').AsInteger := 1;
            mdTmpIds.Post;
          end;//else
        end//if
        else begin
          if RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString)-strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits)<>0 then begin
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
            mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
            //Разница для себя
            mdTmpIds.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString)-strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits);
            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 0, strtofloat(mdTmpIds.FieldByName('amount').AsString));
            mdTmpIds.FieldByName('free').AsInteger := 0;
            mdTmpIds.FieldByName('forall').AsInteger := 0;
            mdTmpIds.Post;
          end;//if
        end;//else
      end//if mdWMatTurnOld.Locate
      else begin
        //Проверка
        //Получить сумму для текущего posid в mdTmpIds
        with mdTmpIds do begin
          First;
          TmpAmount := 0;
          while not Eof do begin
            if (FieldByName('posid').AsInteger = mdRsv.fieldbyname('posid').AsInteger)
              then TmpAmount := RoundToA(TmpAmount + FieldByName('amount').AsFloat, MatDisplayDigits);
            Next;
          end;//while
        end;//with TdxMemData(pointer(stRemain.Tag))

        if TmpAmount < 0 then begin
          if RoundToA(-TmpAmount, MatDisplayDigits) > RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits)
          then begin
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
            mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
            //Всё кол-во для себя
            mdTmpIds.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits);
            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger,AMatID, AWID,0,strtofloat(mdTmpIds.FieldByName('amount').AsString));
            mdTmpIds.FieldByName('free').AsInteger := 0;
            mdTmpIds.FieldByName('forall').AsInteger := 0;
            mdTmpIds.Post;
          end//if
          else begin
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
            mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
            //Доступное кол-во для себя TmpAmount*-1
            mdTmpIds.FieldByName('amount').AsFloat := RoundToA(TmpAmount*-1, MatDisplayDigits);
            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 0,strtofloat(mdTmpIds.FieldByName('amount').AsString));
            mdTmpIds.FieldByName('free').AsInteger := 0;
            mdTmpIds.FieldByName('forall').AsInteger := 0;
            mdTmpIds.Post;

            if 0 <> RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString) + TmpAmount, MatDisplayDigits) then begin
              mdTmpIds.Append;
              mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
              mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
              //Разницу для всех strtofloat(mdRsv.fieldbyname('amount').AsString)-TmpAmount*-1
              mdTmpIds.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString)-(TmpAmount*-1), MatDisplayDigits);
              mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 1,strtofloat(mdTmpIds.FieldByName('amount').AsString));
              mdTmpIds.FieldByName('free').AsInteger := 0;
              mdTmpIds.FieldByName('forall').AsInteger := 1;
              mdTmpIds.Post;
            end;//if
          end;//else
        end//if TmpAmount<0 then begin
        else begin
          mdTmpIds.Append;
          mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
          mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
          //Всё кол-во для всех
          mdTmpIds.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits);
          mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 1, strtofloat(mdTmpIds.FieldByName('amount').AsString));
  //mdTmpIds.FieldByName('tmpid').AsInteger := 0;//dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 1, strtofloat(mdTmpIds.FieldByName('amount').AsString));
          mdTmpIds.FieldByName('free').AsInteger := 0;
          mdTmpIds.FieldByName('forall').AsInteger := 1;
          mdTmpIds.Post;
        end;//else
      end;//else

      mdRsv.Next;
    end;//while not mdRsv.Eof

    if not ASkipClearing then begin
      //Освобождение оставшихся позиций, старых
      with mdWMatTurnOld do begin
        First;

        while not Eof do begin
          if (FieldByName('sourceid').AsInteger = APosID) and (FieldByName('flag').AsInteger <> 1)
          then begin
            Edit;
            FieldByName('flag').AsInteger := 1;
            Post;
            //Освобождение для себя
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := FieldByName('sourceid').AsInteger;
            mdTmpIds.FieldByName('posid').AsInteger := fieldbyname('posid').AsInteger;
            mdTmpIds.FieldByName('amount').AsFloat := -RoundToA(strtofloat(fieldbyname('amount').AsString), MatDisplayDigits);
            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(fieldbyname('posid').AsInteger, AMatID, AWID, 0, RoundToA(strtofloat(fieldbyname('amount').AsString), MatDisplayDigits)*-1);
            mdTmpIds.FieldByName('free').AsInteger := 0;
            mdTmpIds.FieldByName('forall').AsInteger := 0;
            mdTmpIds.Post;
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
      end;//with TdxMemData(pointer(stMeasureName.Tag))
    end;
//?????????????????????????????????????????????????????????????????????????
  end//if FRemain>=dbgWaybillDet.SelectedNodes[i].Values[colAmount.Index] then begin
  else begin
    Result := False;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  //Запись в SN для WMat
  SNs := System.Copy(SNs, 1, Length(SNs) - 2);

  with mdDet do begin
    BM := GetBookmark;
    try
      if Locate('posid', APosID, []) then begin
        Edit;
        FieldByName('status').AsInteger := 1;
        if SNs <> '' then FieldByName('sn').AsString := SNs;
        Post;
      end;

    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
    end;
  end;

  Result := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditWaybillOut.DoRemoveRsv(APosID: Integer): Boolean;
  var
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.DoRemoveRsv') else _udebug := nil;{$ENDIF}

  Result := True; // why is it func?

  while mdWMatTurn.Locate('sourceid', APosID, [])
    do mdWMatTurn.Delete;

  with mdTmpIds do begin
    First;
    while not Eof do begin
      if FieldByName('sourceid').AsInteger = APosID then begin
        dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
        Delete;
      end
      else Next;
     end;
  end;

  //Освобождение редактируемых позиций (старых)
  mdWMatTurnOld.First;
  while not mdWMatTurnOld.Eof do begin
    if mdWMatTurnOld.FieldByName('sourceid').AsInteger = APosID then begin
      with newDataSet do
      try
        ProviderName := 'pWayBill_GetMatID_WID';
        FetchParams;
        Params.ParamByName('posId').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
        Open;
        if not IsEmpty then begin
          mdTmpIds.Append;
          mdTmpIds.FieldByName('sourceid').AsInteger := mdWMatTurnOld.FieldByName('sourceid').AsInteger;
          mdTmpIds.FieldByName('amount').AsFloat := RoundToA(StrToFloat(mdWMatTurnOld.FieldByName('amount').AsString) * -1, MatDisplayDigits);
          mdTmpIds.FieldByName('posid').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
          mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdWMatTurnOld.FieldByName('posid').AsInteger, Fields[0].AsInteger, Fields[1].AsInteger, 0, RoundToA(StrToFloat(mdWMatTurnOld.FieldByName('amount').AsString) * -1, MatDisplayDigits));
          mdTmpIds.FieldByName('free').AsInteger := 0;
          mdTmpIds.FieldByName('forall').AsInteger := 0;
          mdTmpIds.Post;
        end;
        Close;

      finally
        Free;
      end;
    end;

    mdWMatTurnOld.Next;
  end;

  //Затирание в mdDet SN
  with mdDet do begin
    BM := GetBookmark;

    try
      if Locate('posid', APosID, []) then begin
        Edit;
        FieldByName('SN').Clear;
        FieldByName('status').AsInteger := 0;
        Post;
      end;

    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aSetDiscountExecute(Sender: TObject);
  var
    BM: TBookmark;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aSetDiscountExecute') else _udebug := nil;{$ENDIF}


  with TfrmSetDiscount.Create(nil) do
  try
    if ShowModal in [mrOk] then begin
      mdDet.DisableControls;
      BM := mdDet.GetBookmark;

      try
        for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
          if mdDet.Locate('posid', dbgWaybillDet.SelectedNodes[i].Values[colPosId.Index], []) then begin
            mdDet.Edit;
            mdDet.FieldByName('price').AsFloat := mdDet.FieldByName('fullprice').AsFloat * (100 - edDisc.Value) / 100;
            mdDet.FieldByName('discount').AsFloat := edDisc.Value;
            mdDet.Post;
            UpdatePos;
          end;
        end;

      finally
        mdDet.GotoBookmark(BM);
        mdDet.FreeBookmark(BM);
        mdDet.EnableControls;
      end;
      //UpdateActionList;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.mdDetCalcFields(DataSet: TDataSet);
  var
    FNDS, FSummWONDS, FSumm, FSummNDS, FSummTax: Extended;
    FPrice, FOnValue, FAmount: Extended;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.mdDetCalcFields') else _udebug := nil;{$ENDIF}

  with DataSet do begin
    FNDS := FieldByName('nds').AsFloat;
    FPrice := FieldByName('price').AsFloat;
    FOnValue := FieldByName('onvalue').AsFloat;
    FAmount := FieldByName('amount').AsFloat;

    NDSCalc(FAmount, FPrice * FOnValue, FNDS, 1, FSummWONDS, FSummNDS);
    FSumm := RoundToA(FSummWONDS + FSummNDS, -2);
    FSummWONDS := FSumm - RoundToA(FSummNDS, -2);

    FSummTax := 0;
    for i := 0 to FieldCount - 1 do begin
      if (Pos('Tax', Fields[i].FieldName) > 0) and (Pos('TaxRate', Fields[i].FieldName) = 0)
        then FSummTax := FSummTax + RoundToA(FSummWONDS * VarToFloat(Fields[i].AsFloat) / 100, -2);
    end;

    FSumm := FSumm + FSummTax;
    FieldByName('total').AsFloat := FSumm;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.GetNewDC(ACardID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.GetNewDC') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pDiscCards_Get';
    FetchParams;
    Params.ParamByName('cardid').AsInteger := ACardID;
    Open;

    if not mdDC.Active then mdDC.Open;

    if not IsEmpty then begin
      mdDC.Append;
      mdDC.FieldByName('cardid').AsInteger := ACardID;
      mdDC.FieldByName('total').AsFloat := FieldByName('total').AsFloat;
      mdDC.FieldByName('posid').AsInteger := 0;
      mdDC.Post;
    end;
    Close;

    ProviderName := 'pDiscCards_AccumGet';
    FetchParams;
    Params.ParamByName('cardid').AsInteger := ACardID;
    Open;

    if not mdDCT.Active then mdDCT.Open;

    mdDCT.LoadFromDataSet(Fields[0].DataSet, RecordCount, lmAppend);
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.WMDCRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.WMDCRefresh') else _udebug := nil;{$ENDIF}

  if not mdDC.Active then mdDC.Open;
  if not mdDCT.Active then mdDCT.Open;

  with TokDCInfo(Pointer(M.WParam)^) do begin
    if (CardID > 0) and not mdDC.Locate('cardid', CardID, [])
      then GetNewDC(CardID);

    if not mdDC.Locate('posid', PosID, [])
      then mdDC.Append
      else mdDC.Edit;

    mdDC.FieldByName('cardid').AsInteger := CardID;
    mdDC.FieldByName('posid').AsInteger := PosID;
    mdDC.FieldByName('total').AsFloat := Total;
    mdDC.Post;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditWaybillOut.CreateByOrderOut(AOrderID: Integer; IDs, Svcs: string): Integer;
  var
    FRsv, FMinPrice, FMaxPrice, FAvgPrice, FLastInPrice, FRemain, FRsv2, FPrice: Extended;
    i, FPTypeID: Integer;
    FWithNDS: Boolean;
    FTaxSumm, FPosNDS, FSumWONDS, FNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.CreateByOrderOut') else _udebug := nil;{$ENDIF}

  Result := 0;
  FOrderID := AOrderID;

  with newDataSet do
  try
    mdDet.Close;
    mdDet.Open;

    RemoteServer := dmData.SConnection;
    ProviderName := 'pWaybill_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AOrderID;
    Open;

    edKAgent.KAID := FieldByName('kaid').AsInteger;
    edKAgent.Enabled := False;
    edContr.Enabled := False;
    cbCurr.Enabled := False;
    edRate.Enabled := False;
    edReason.Text := rs('fmWaybill', 'ByOrder') + amountPrefix + FieldByName('num').AsString;

    if not FieldByName('entid').IsNull
      then cdsEnts.Locate('kaid', FieldByName('entid').AsInteger, []);

    edDate.Date := Self.OnDate;
    cbCurr.KeyValue := FieldByName('currid').AsInteger;
    edRate.Value := FieldByName('onvalue').AsFloat;
    Close;

    ProviderName := 'pDocsRel_WB_Contr_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AOrderID;
    Params.ParamByName('doctype').AsInteger := -8;
    Open;
    if not IsEmpty then begin
      edContr.DocID := FieldByName('rdocid').AsInteger;
    end;
    Close;

    if IDs <> '' then begin
      ProviderName := 'pWaybillDet_GetAccPos';
      FetchParams;
      FetchMacros;
      Macros.ParamByName('ids').AsString := IDs;
      Open;
      mdDet.LoadFromDataSet(Fields[0].DataSet);
      mdAcc.CopyFromDataSet(Fields[0].DataSet);
      Close;
    end;

    if Svcs <> '' then begin
      ProviderName := 'pWaybillDet_GetSvc';
      FetchParams;
      FetchMacros;
      Params.ParamByName('wbillid').AsInteger := FOrderID;
      Macros.ParamByName('ids').AsString := Svcs;
      Open;
      mdDet.LoadFromDataSet(Fields[0].DataSet);
      mdAcc.LoadFromDataSet(Fields[0].DataSet);
      Close;
    end;

    ProviderName := 'pWMatTurnOut_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := FOrderID;
    Open;
    mdWMatTurn.CopyFromDataSet(Fields[0].DataSet);
    Close;

    mdWMatTurn.First;
    while not mdWMatTurn.Eof do begin
      if not mdAcc.Locate('posid', mdWMatTurn.FieldByName('sourceid').AsInteger, [])
        then mdWMatTurn.Delete
        else mdWMatTurn.Next;
    end;
    mdWMatTurnOld.CopyFromDataSet(mdWMatTurn);

    FShippedPosExist := False;
    mdDet.First;

    for i := 0 to mdDet.RecordCount - 1 do begin
      if mdDet.FieldByName('postype').AsInteger = 0 then begin
        mdDet.Edit;

        if mdWMatTurn.Locate('sourceid', mdDet.FieldByName('posid').AsInteger, [])
          then mdDet.FieldByName('status').AsInteger := 1
          else mdDet.FieldByName('status').AsInteger := 0;

        mdDet.Post;
      end;

      if (mdDet.FieldByName('postype').AsInteger = 0) and mdAcc.Locate('posid', mdDet.FieldByName('posid').AsInteger, [])
      then begin
        mdDet.Edit;
        mdDet.FieldByName('amount').AsFloat := RoundToA(mdDet.FieldByName('amount').AsFloat
               - mdAcc.FieldByName('shippedamount').AsFloat
               - mdAcc.FieldByName('rsvamount').AsFloat, MatDisplayDigits);
        mdDet.Post;
      end;

      if mdDet.FieldByName('Amount').AsFloat = 0
        then begin
          mdDet.Delete;
          FShippedPosExist := True;
        end
        else mdDet.Next;
    end;

    ProviderName := 'pWaybillDet_GetTaxes';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := FOrderID;
    Open;
    while not Eof do begin
      if (mdDet.FieldByName('postype').AsInteger = 0) and mdDet.Locate('posid', FieldByName('posid').AsInteger, [])
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

      Next;
    end;

    Close;

    mdDet.First;
    for i := 0 to mdDet.RecordCount - 1 do begin
      mdDet.Edit;
      mdDet.FieldByName('fullprice').AsFloat := mdDet.FieldByName('price').AsFloat / (100 - mdDet.FieldByName('discount').AsFloat) * 100;
      mdDet.Post;

      UpdatePos;
      mdDet.Next;
    end;

    if dbgWaybillDet.FocusedNode <> nil then dbgWaybillDet.FocusedNode.Selected := True;

  finally
    Free;
  end;

  FRateChanged := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditWaybillOut.CheckOrdered(var posList: String): Boolean;
  var
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    BM: TBookmark;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.CheckOrdered') else _udebug := nil;{$ENDIF}

  Result := True;
  posList := '';
  BM := mdDet.GetBookmark;

  with newDataSet do
  try
    ProviderName := 'pWMat_GetPosStatus';
    FetchParams;
    mdWMatTurn.First;

    while not mdWMatTurn.Eof do begin
      Params.ParamByName('posid').AsInteger := mdWMatTurn.FieldByName('posid').AsInteger;
      Open;
      if FieldByName('turntype').AsInteger <> 1 then begin
        Result := False;

        if length(posList) > 255 then begin // too much products unavailable
          Close;
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;

        if mdDet.Locate('posid', mdWMatTurn.FieldByName('sourceid').AsInteger, [])
          then posList := posList + mdDet.fieldByName('matname').asString
               + ' (' + mdDet.fieldByName('amount').asString + ' ' + mdDet.fieldByName('msrname').asString + ') ';
      end;

      Close;
      mdWMatTurn.Next;
    end;

  finally
    Free;
    mdDet.GotoBookmark(BM);
    mdDet.FreeBookmark(BM);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.UpdatePos;
  var
    FAmount, FNorm, FSummCurr, FPriceCurr, FNDS, FCurrRate: Extended;
    FPriceWithNDS, FPriceWONDS, FSummWONDS, FSummNDS, FSummWithNDS: Extended;
    FSummTax, FPosSummTax: Extended;
    j: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.UpdatePos') else _udebug := nil;{$ENDIF}

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
function TfrmEditWaybillOut.CheckModified: Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.CheckModified') else _udebug := nil;{$ENDIF}

  Result := False;

  if EditingDisabled then Exit;

  if (FModified or FPosModified) and (ssMessageDlg(rs('Common', 'DataChangedSave'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes)
    then Result := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.aAddSvcListExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.aAddSvcListExecute') else _udebug := nil;{$ENDIF}

  DocInfo.CurrName := cbCurr.Text;
  DocInfo.CurrID := cbCurr.KeyValue;
  DocInfo.CurrRate := edRate.Value;
  DocInfo.Tag := 1;
  DocInfo.OnDate := edDate.Date;

  if CurrEnt.NDSPayer
    then DocInfo.NDS := NDS
    else DocInfo.NDS := 0;

  if (edKAgent.KAID <> 0) and (edKAgent.Obj.PTypeID > 0)
    then DocInfo.PTypeID := edKAgent.Obj.PTypeID
    else DocInfo.PTypeID := GetDefPriceType;

  ShowModalRef(Self, rtServices, vtServices, 'TfmServices', Self.OnDate, 0, Integer(@DocInfo));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.SaveSerial(APosID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillOut.SaveSerial') else _udebug := nil;{$ENDIF}

  if mdDet.FieldByName('sn').AsString = '' then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with newDataSet do
  try
    ProviderName := 'rSN_Ins';
    FetchParams;
    Params.ParamByName('sid').AsInteger := GetMaxID(dmData.SConnection, 'serials', 'sid');
    Params.ParamByName('posid').AsInteger := APosID;
    Params.ParamByName('serialno').AsString := mdDet.fieldbyname('sn').AsString;
    Execute;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditWaybillOut', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
