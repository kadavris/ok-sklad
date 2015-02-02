{$I ok_sklad.inc}
unit EditWBReturnIn; // Return from customer

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ExtCtrls, StdCtrls, ActnList,
  DB, Menus, ComCtrls, Buttons, DBClient, Grids, DBGrids, DBCtrls, ImgList, dialogs,

  dxCntner6, dxEditor6, dxDBTLCl6, dxGrClms6, dxExEdtr6, dxTL6, dxDBCtrl6, dxDBGrid6, dxmdaset,

  cxMemo, cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, cxPC,
  cxTreeView, cxListView, cxDBEdit, cxGraphics, cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxMaskEdit,
  cxButtonEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox,
  cxCalendar, cxSpinEdit, cxCalc,
  cxTimeEdit,

  ssBaseTypes, ssFormStorage, ssBaseDlg, ssMemDS, ssImagePanel, ssBevel, ssSpeedButton, ssPanel, ssGradientPanel, ssDBGrid,
  ssCalcEdit, ssDBLookupCombo, ssLabel, ssBaseWBDocDlgWithPayment, okSearchEdit, ssPageControl,
  ssClientDataSet, ssGroupBox, ssDBComboBox, ssBaseConst,

  FR_DSet, FR_DBSet, FR_Class, FR_Desgn, TB2Item, xButton, xLngDefs;

type
  TfrmEditWBReturnIn = class(TfrmBaseWBDocDlgWithPayment)
    aActivateFind: TAction;
    aAddKA: TAction;
    aAddMat: TAction;
    aAddMatList: TAction;
    aCDel: TAction;
    aCIns: TAction;
    aCUpd: TAction;
    aOrdersInfo: TAction;
    aPayMPersons: TAction;
    aSelectAll: TAction;
    btnAdd: TssSpeedButton;
    btnDel: TssSpeedButton;
    btnOrdersInfo: TssSpeedButton;
    btnPersonName: TssSpeedButton;
    btnProps: TssSpeedButton;
    cdsPersonName: TssClientDataSet;
    chbPosting: TcxCheckBox;
    colRate: TdxDBGridColumn;
    dsPayType: TDataSource;
    edFind: TokGridSearchEdit;
    edKAgent: TokKASearchEdit;
    edNotes: TcxTextEdit;
    edNum1: TcxTextEdit;
    edReason: TcxTextEdit;
    frDoc: TfrReport;
    fsrcDoc: TfrDBDataSet;
    itmAddMatList: TTBItem;
    lcbPersonName: TssDBLookupCombo;
    lNotes: TLabel;
    lNum: TLabel;
    lPersonname: TLabel;
    lReason: TLabel;
    mdDetpposid: TIntegerField;
    mdDetsourceid: TIntegerField;
    mdReport: TdxMemData;
    panPosBar: TPanel;
    pmMain: TTBPopupMenu;
    pmMatSvc: TTBPopupMenu;
    srcPersonName: TDataSource;
    TBItem14: TTBItem;
    TBItem19: TTBItem;
    TBItem1: TTBItem;
    TBItem20: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;

    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure aCDelExecute(Sender: TObject);
    procedure edNum1PropertiesChange(Sender: TObject);
    procedure cxDateEdit1PropertiesChange(Sender: TObject);
    procedure chbPostingPropertiesChange(Sender: TObject);

    procedure dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure mdMatsAfterPost(DataSet: TDataSet);
    procedure mdMatsAfterDelete(DataSet: TDataSet);
    procedure mdMatsAfterEdit(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure edTimePropertiesChange(Sender: TObject);
    procedure aCUpdExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mdDetAfterPost(DataSet: TDataSet);
    procedure mdDetAfterDelete(DataSet: TDataSet);
    procedure aSetTimeExecute(Sender: TObject);
    procedure aAddKAExecute(Sender: TObject);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure aShowRealPriceExecute(Sender: TObject);
    procedure colSummDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure dbgWaybillDetDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure chbPayPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lcbPersonNameKeyPress(Sender: TObject; var Key: Char);
    procedure dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
    procedure cbPayCurrKeyPress(Sender: TObject; var Key: Char);
    procedure lcbPersonNameExit(Sender: TObject);
    procedure edKAgentPropertiesChange(Sender: TObject);
    procedure dsDetDataChange(Sender: TObject; Field: TField);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aPayMPersonsExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aBallanceExecute(Sender: TObject);
    procedure aMatInfoExecute(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure lcbPersonNameEnter(Sender: TObject);
    procedure btnPersonNameMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPersonNameMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mdDetCalcFields(DataSet: TDataSet);
    procedure cbCurrPropertiesEditValueChanged(Sender: TObject);
    procedure cbCurrPropertiesChange(Sender: TObject);
    procedure aOrdersInfoExecute(Sender: TObject);
    procedure aAddMatExecute(Sender: TObject);
    procedure aCInsExecute(Sender: TObject);
    procedure aActivateFindExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);

  private
    FPosModified: boolean;
    FGridRefresh: boolean;
    FPayDocModified:boolean;
    FPaySummChange:boolean;
    ALLSUMM : Extended;
    FCurrNum, FCurrPayNum: integer;
    PayDocId:integer;
    OldPayDocId:integer;
    PayDocChecked:boolean;
    PayDocDate:TDateTime;
    oldkaid:integer;
    FPayNum: string;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMDelete(var M: TMessage); message WM_DELETE;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    function CheckDatesOut:boolean;

  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
    procedure GetSummAll; override;

  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
    procedure DoHelp; override;
    { Public declarations }
  end;

var
  frmEditWBReturnIn: TfrmEditWBReturnIn;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ClientData, Login, prFun,
  fKAgent, ssFun, ShellAPI, StdConvs, EditPosReturnIn, prTypes, CurrencyEdit,
  ssCallbackConst, ssRegUtils, fMessageDlg, EditMaterials, ssStrUtil,
  KATurnover, ssBaseIntfDlg, okMoneyFun, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
function TfrmEditWBReturnIn.CheckDatesOut: boolean;
 var
   eStr, eStr2, m :String;
   i: integer;
   tmpMaxDate: TDateTime;
   BM: TBookmark;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.CheckDatesOut') else _udebug := nil;{$ENDIF}

  try
    m := '';
    eStr := '';
    eStr2 := '';

    BM := mdDet.GetBookmark;
    mdDet.DisableControls;

    if not mdDet.IsEmpty then begin
      mdDet.First;
      while not mdDet.Eof do begin
        if m = ''
          then m := m + IntToStr(mdDet.fieldbyname('sourceid').AsInteger)
          else m := m + ',' + IntToStr(mdDet.fieldbyname('sourceid').AsInteger);
        mdDet.Next;
      end;//while not mdDet.Eof

      mdDet.GotoBookmark(BM);
      mdDet.FreeBookmark(BM);
      mdDet.EnableControls;

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
          BM := mdDet.GetBookmark;
          mdDet.DisableControls;
          mdDet.First;

          while not mdDet.Eof do begin
            eStr2 := '';

            if Locate('posid', mdDet.fieldbyname('sourceid').AsInteger,[]) then begin
              if eStr2 = ''
                then eStr2 := eStr2 + Fields[1].AsString
                else eStr2 := eStr2 + ', ' + Fields[1].AsString;

              if tmpMaxDate < Fields[1].AsDateTime then tmpMaxDate := Fields[1].AsDateTime;
            end;//if

// TODO  -cстранная хуйня. м.б. не нужно: i is undefined!!!
            {if eStr2 <> ''
              then eStr := eStr + amountPrefix + inttostr(dbgWaybillDet.Items[i].Values[colRecNo.Index])
                      + ' ' + dbgWaybillDet.Items[i].Values[colMatName.Index]
                      + ' ' + rs('fmWaybill','Erroutpartydate') + ' : ' + eStr2 + #13#10;
            }
            mdDet.Next;
          end;//while not mdDet.Eof
          mdDet.GotoBookmark(BM);
          mdDet.FreeBookmark(BM);
          mdDet.EnableControls;

          eStr := rs('fmWaybill','DocDate') + ' (' + DateTimeToStr(edDate.Date+edTime.Time)
                + ') ' + rs('fmWaybill','Errkonf') + ':' + #13#10
                + eStr + #13#10 + rs('fmWaybill','Errkonfq') + ' (' + DateTimeToStr(tmpMaxDate) + ') ?';

          FGridRefresh := true;
          Application.ProcessMessages;
          UpdateActions;

          if ssMessageDlg(eStr, ssmtWarning, [ssmbYes, ssmbCancel]) = mrYes then begin
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

//==============================================================================================
procedure TfrmEditWBReturnIn.WMRefresh(var M: TMessage);
  var
    tmpInt: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.WMRefresh') else _udebug := nil;{$ENDIF}

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

        rtKAgent:
           begin
            edKAgent.KAID := M.WParam;
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
procedure TfrmEditWBReturnIn.setid(const Value: integer);
  var
    FItem: TcxTreeListNode;
    tmpInt: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWBReturnIn.setid') else _udebug := nil;{$ENDIF}

  {$IFDEF LIMITED}CheckDocumentsCountLimit(wbtReturnIn);{$ENDIF}

  Screen.Cursor := crSQLWait;
  if not cdsCurr.Active then cdsCurr.Open;
  cbPayCurr.KeyValue := BaseCurrID;

  cdsPayType.Open;
  cdsPersonName.Open;
  lcbPersonName.KeyValue := 0;
  lcbPersonName.Text := '';
  edDate.Date := OnDate; edTime.Time := Time;
  Fid := Value;
  edKAgent.Text := '';

  with newDataSet do
  try
    chbPosting.Checked := ReturnInChecked;

    if (Value = 0) and WBInAutoNum
    then begin
      FCurrNum := GetDocNum(dmData.SConnection, dtReturnIn, 1);
      edNum1.Text := ReturnInPrefix + IntToStr(FCurrNum) + ReturnInSuffix;
    end
    else edNum1.Text := '';

    if Value <> 0 then begin
      Self.Caption := rs(ParentNameEx, 'ReturnInTitleEdit');
      ProviderName := 'pWaybill_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := Value;
      Open;
      if not IsEmpty then begin
        edNum1.Text := fieldbyname('num').AsString;
        edNum1.Tag := fieldbyname('defnum').AsInteger;
        eddate.Date := fieldbyname('ondate').AsDateTime;
        edTime.Time := fieldbyname('ondate').AsDateTime;
        edKAgent.KAID := fieldbyname('kaid').AsInteger;
        if not fieldbyname('personid').IsNull then lcbPersonName.KeyValue := fieldbyname('personid').AsInteger;
        oldkaid := fieldbyname('kaid').AsInteger;
        edReason.Text := fieldbyname('REASON').asstring;
        edNotes.Text := fieldbyname('notes').asstring;
        chbPosting.Checked := (fieldbyname('CHECKED').AsInteger=1);
      end;

      Close;
    end//if Value<>0
    else Self.Caption := rs(ParentNameEx,'ReturnInTitleAdd');

    mdDet.Close;
    mdDet.Open;
    if Value <> 0 then begin
      ProviderName := 'pRetOutDet_Get';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := fid;
      Open;
      mdDet.LoadFromDataSet(Fields[0].DataSet);
    end;// чтение позиций в mdDet
    Close;

    mdDet.First;
    while not mdDet.Eof do begin
      UpdatePos;
      mdDet.Next;
    end;
    SelectFocusedNode;

    // Чтение платежа
    ProviderName := 'pWayBillPay_Get';
    FetchParams;
    Params.ParamByName('WBILLID').AsInteger := fid;
    Open;
    if not IsEmpty then begin
      chbPay.Enabled := false;
      chbPay.Checked := true;
      chbPay.Enabled := true;
      PayDocChecked := (fieldbyname('Checked').AsInteger = 1);

      if not FieldByName('mpersonid').IsNull then lcbPayMPerson.KeyValue := FieldByName('mpersonid').AsInteger;

      chbPay.Enabled := PayDocChecked;
      PayDocId := fieldbyname('PayDocId').AsInteger;
      OldPayDocID := PayDocID;
      PayDocDate := fieldbyname('OnDate').AsDateTime;
      edPayNum.Text := fieldbyname('DocNum').AsString;
      lcbPayType.KeyValue := fieldbyname('PTypeId').AsInteger;
      edPaySumm.Tag := 1;
      edPaySumm.Value := fieldbyname('Total').AsFloat;
      edPaySumm.Tag := 0;

      if cdsPayType.Locate('PTypeId',fieldbyname('CurrId').AsInteger,[])
        then cbPayCurr.KeyValue := fieldbyname('CurrId').AsInteger;
    end//if not IsEmpty
    else begin
      PayDocChecked := false;
      PayDocId := 0;
      chbPay.Enabled := false;
      chbPay.Checked := false;
      chbPay.Enabled := true;
      edPayNum.Text := '';
      edPaySumm.Tag := 1;
      edPaySumm.Value := 0;
      edPaySumm.Tag := 0;
    end;//else
    Close;

    if Value = 0 then begin
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
    FPosModified := false;
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
procedure TfrmEditWBReturnIn.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
   NewRecord: boolean;
   BM:TBookmark;
   tmpid:integer;
   cdsWBDet:TssClientDataSet;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWBReturnIn.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    if CheckDatesOut then begin
      with newDataSet do
      try
        TrStart;

        try
          Screen.Cursor := crSQLWait;
          NewRecord := (ID = 0);

          if NewRecord then FID := GetMaxID(dmData.SConnection, 'waybilllist', 'wbillid');

          if NewRecord
            then ProviderName := 'pWaybill_Ins'
            else ProviderName := 'pWaybill_Upd';

          FetchParams;
          Params.ParamByName('WBILLID').AsInteger := FID;
          Params.ParamByName('NUM').AsString := edNum1.Text;
          Params.ParamByName('ONDATE').AsDateTime := edDate.Date+edTime.Time;
          Params.ParamByName('KAID').AsInteger := edKAgent.KAID;
          Params.ParamByName('REASON').AsString := edReason.Text;
          Params.ParamByName('NOTES').AsString := edNotes.Text;

          if lcbPersonName.EditText = '' then begin
            Params.ParamByName('PERSONID').DataType := ftInteger;
            Params.ParamByName('PERSONID').Clear;
          end
          else Params.ParamByName('PERSONID').AsInteger := lcbPersonName.KeyValue;

          Params.ParamByName('CHECKED').AsInteger := integer(chbPosting.Checked);
          Params.ParamByName('WTYPE').AsInteger := 6;//тип накладной 6-возврат от клиента
          Params.ParamByName('DELETED').AsInteger := 0;
          Params.ParamByName('SUMMALL').AsFloat := RoundToA(ALLSUMM, -2);
          Params.ParamByName('DEFNUM').AsInteger := 0;
          Params.ParamByName('CURRID').DataType := ftInteger;
          Params.ParamByName('CURRID').Clear;
          Params.ParamByName('ATTNUM').DataType := ftString;
          Params.ParamByName('ATTDATE').Clear;
          Params.ParamByName('RECEIVED').DataType := ftString;
          Params.ParamByName('RECEIVED').Clear;
          Params.ParamByName('NDS').DataType := ftFloat;
          Params.ParamByName('NDS').Clear;
          Params.ParamByName('TODATE').DataType := ftDateTime;
          Params.ParamByName('TODATE').Clear;
          Execute;//Записали в waybilllist

          if FPosModified then begin // Запись позиций в накладную
            //Удаляем из returnrel
            ProviderName := 'pRetRel_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := ID;
            Execute;
            //Удаляем из waybilldet
            ProviderName := 'pWaybillDet_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := ID;
            Execute;
            // Запись позиций из mdDet в waybilldet
            BM := mdDet.GetBookmark;
            mdDet.DisableControls;
            mdDet.First;

            while not mdDet.Eof do begin
              ProviderName := 'pWaybillDet_Ins';
              FetchParams;
              tmpid := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');

              if tmpid < 0 then raise Exception.Create(rs(ParentNameEx, 'ErrorAddPos'));

              mdDet.Edit;
              mdDet.FieldByName('posid').AsInteger := tmpid;
              mdDet.Post;
              Params.ParamByName('POSID').AsInteger := mdDet.FieldByName('posid').AsInteger;
              Params.ParamByName('WBILLID').AsInteger := FID;
              Params.ParamByName('MATID').AsInteger := mdDet.fieldbyname('MATID').AsInteger;
              Params.ParamByName('WID').AsInteger := mdDet.fieldbyname('WID').AsInteger;
              Params.ParamByName('AMOUNT').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('AMOUNT').AsString),MatDisplayDigits);
              Params.ParamByName('PRICE').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('PRICE').AsString),-6);
              Params.ParamByName('DISCOUNT').DataType := ftFloat;
              Params.ParamByName('DISCOUNT').Clear;
              Params.ParamByName('NDS').AsFloat := mdDet.fieldbyname('NDS').AsFloat;//CurrentNDS;
              Params.ParamByName('CurrId').AsInteger := mdDet.fieldbyname('currid').AsInteger;
              Params.ParamByName('onvalue').AsFloat := mdDet.fieldbyname('onvalue').AsFloat;
              Params.ParamByName('OnDate').AsDateTime := mdDet.fieldbyname('ondate').AsDateTime; //edDate.Date+edTime.Time;
              Params.ParamByName('PTypeID').DataType := ftInteger;
              Params.ParamByName('PTypeID').Clear;
              Params.ParamByName('NUM').AsInteger := mdDet.RecNo;
              Params.ParamByName('total').AsFloat := mdDet.fieldbyname('total').AsFloat;
              Execute;//Записываем очередную позицию

              if not mdDet.fieldbyname('sn').IsNull then begin
                ProviderName := 'rSN_Ins';
                FetchParams;
                Params.ParamByName('sid').AsInteger := GetMaxID(dmData.SConnection, 'serials', 'sid');
                Params.ParamByName('posid').AsInteger := tmpid;
                Params.ParamByName('serialno').AsString := mdDet.fieldbyname('sn').AsString;
                Execute;
              end;//if

              if mdDet.FieldByName('cardid').AsInteger > 0 then begin
                ProviderName := 'pWaybillDetAP_Ins';
                FetchParams;
                Params.ParamByName('posid').AsInteger := mdDet.FieldByName('posid').AsInteger;
                Params.ParamByName('producer').AsString := '';
                Params.ParamByName('certnum').AsString := '';
                Params.ParamByName('gtd').AsString := '';
                Params.ParamByName('certdate').DataType := ftDateTime;
                Params.ParamByName('certdate').Clear;
                Params.ParamByName('warrantyperiod').DataType := ftInteger;
                Params.ParamByName('warrantyperiod').Clear;
                Params.ParamByName('warrantyperiodtype').DataType := ftInteger;
                Params.ParamByName('warrantyperiodtype').Clear;
                Params.ParamByName('cardid').AsInteger := mdDet.FieldByName('cardid').AsInteger;
                Execute;
              end;

              //Записываем в returnrel
              ProviderName := 'pRetRel_Ins';
              FetchParams;
              Params.ParamByName('posid').AsInteger := tmpid;
              Params.ParamByName('pposid').AsInteger := mdDet.fieldbyname('pposid').AsInteger;
              Params.ParamByName('outposid').AsInteger := mdDet.fieldbyname('sourceid').AsInteger;
              Params.ParamByName('dposid').DataType := ftInteger;
              Params.ParamByName('dposid').Clear;
              Execute;
              mdDet.Next;
            end;//while not mdDet.Eof do begin

            mdDet.GotoBookmark(BM);
            FreeBookmark(BM);
            mdDet.EnableControls;
            FPosModified := False;//Сбрасываем флаг изменения позиций
          end;//if FPosModified

          if chbPosting.Checked then begin  //Если документ проведён то
            //1)Дублируем позиции из waybilldet
            cdsWBDet := newDataSet;
            try
              cdsWBDet.ProviderName := 'pRetInDet_GetEx';
              cdsWBDet.FetchParams;
              cdsWBDet.Params.ParamByName('WBILLID').AsInteger := FID;
              cdsWBDet.Open;
              cdsWBDet.First;

              while not cdsWBDet.Eof do begin
                ProviderName := 'pWaybillDet_Ins';
                FetchParams;
                tmpid := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');

                if tmpid < 0 then raise Exception.Create(rs('fmWaybill', 'ErrorAddPos'));

                Params.ParamByName('POSID').AsInteger := tmpid;
                Params.ParamByName('WBILLID').AsInteger := cdsWBDet.fieldbyname('WBILLID').AsInteger;
                Params.ParamByName('MATID').AsInteger := cdsWBDet.fieldbyname('MATID').AsInteger;
                Params.ParamByName('WID').AsInteger := cdsWBDet.fieldbyname('WID').AsInteger;
                Params.ParamByName('AMOUNT').AsFloat := cdsWBDet.fieldbyname('AMOUNT').AsFloat;
                Params.ParamByName('PRICE').AsFloat := cdsWBDet.fieldbyname('PRICE').AsFloat;
                Params.ParamByName('NDS').AsFloat := cdsWBDet.fieldbyname('NDS').AsFloat;
                Params.ParamByName('CurrId').AsInteger := cdsWBDet.fieldbyname('currid').AsInteger;
                Params.ParamByName('OnDate').AsDateTime := cdsWBDet.fieldbyname('ondate').AsDateTime;
                Params.ParamByName('OnValue').AsFloat := cdsWBDet.fieldbyname('onvalue').AsFloat;
                Params.ParamByName('DISCOUNT').DataType := ftFloat;
                Params.ParamByName('DISCOUNT').Clear;
                Params.ParamByName('PTypeID').DataType := ftInteger;
                Params.ParamByName('PTypeID').Clear;
                Params.ParamByName('NUM').AsInteger := cdsWBDet.fieldbyname('num').AsInteger;
                Execute;//Записываем очередную позицию

                //2)Обновляем returnrel
                ProviderName := 'pRetRel_Upd';
                FetchParams;
                Params.ParamByName('posid').AsInteger := cdsWBDet.fieldbyname('posid').AsInteger;
                Params.ParamByName('dposid').AsInteger := tmpid;
                Execute;

                cdsWBDet.Next;
              end;//while not mdDet.Eof do begin
            finally
              cdsWBDet.Free;
            end;
            //3)Запись в обороты
            ProviderName := 'pRetWMT_Ins';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Execute;
          end//if chbPosting.Checked
          else begin //Если документ не проведён, то удаляем позиции со склада
            //1)Удаление из оборотов
            ProviderName := 'pWMatTurn_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Execute;
          end;//else if chbPosting.Checked

          if FPayDocModified then begin//Если платёж изменён, то записываем его
            if OldPayDocId > 0 then begin
              PayDocId := OldPayDocId;
              PayDocDate := edDate.Date;
            end;

            if chbPay.Checked then begin //
              if (PayDocId>0) then begin //если платёж существует, то обновляем
                ProviderName := 'pWaybillPayDoc_Upd';
                FetchParams;
              end//if PayDocId>0
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

              Params.ParamByName('reason').AsString := RS(ParentNameEx, 'ReturnOutTitle') + amountPrefix+edNum1.Text;

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
                else Params.ParamByName('onvalue').AsFloat := 
                  GetCurrencyRateEx(dmData.SConnection, cbPayCurr.KeyValue, edDate.Date);

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
            else begin                  //Удаление платежа
              if PayDocId > 0 then begin // если он существует
                {ProviderName := 'pWayBillPay_Del';
                FetchParams;
                Params.ParamByName('WBillID').AsInteger := FID;
                Execute; // Удаление из WaybillPay
                }
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

          FModified := False;//флаг изменения документа false

          TrCommit;

          DoRecalcKASaldo(dmData.SConnection, edKAgent.KAID, edDate.Date, rs(ParentNameEx, 'RecalcBallance'));

          if chbPosting.Checked then DoRecalcDCByWB(dmData.SConnection, FID);

          if ModalResult = mrYes then//Если применить
            if NewRecord then begin
              edDate.Date := Date;
              edKAgent.KAID := 0;
              edReason.Text := '';
              chbPosting.Checked := false;
              mdDet.Close;
              edKAgent.Enabled := true;

              if ReturnInAutoNum then edKAgent.SetFocus else edNum1.SetFocus;

              SendMessage(MainHandle, WM_REFRESH, ID, 0);{???}
              Application.ProcessMessages;

              ID := 0;
            end//if NewRecord
            else begin
              if chbPosting.Checked then CanClose := true
              else begin
                if PDOutAutoNum and (OldPayDocID = 0) and chbPay.Checked
                  then FCurrPayNum := GetDocNum(dmData.SConnection, dtPDOut, 1);

                OldPayDocId := PayDocID;

                ID := ID;
              end;//if chbPosting.Checked
            end//else NewRecord
            else CanClose := True;

            FGridRefresh := true;
            FPaySummChange := true;
            SendMessage(MainHandle, WM_REFRESH, ID, 0);{?????}
            RefreshFun('TfmDiscCards', 0);

            if RefreshAllClients then begin
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
            end;//if RefreshAllClients

        finally
          Free;
          Screen.Cursor := crDefault;
        end;

      except
        on e:exception do begin
         TrRollback; raise;
        end;
      end;//try
    end;//if CheckDatesIn then begin
  end// if ModalResult in [mrOK, mrYes]
  else begin
    if GetDocNum(dmData.SConnection, dtReturnIn, 0) = FCurrNum
      then GetDocNum(dmData.SConnection, dtReturnIn, -1);
    if GetDocNum(dmData.SConnection, dtPDOut, 0) = FCurrPayNum
      then GetDocNum(dmData.SConnection, dtPDOut, -1);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;//FormCloseQuery

//==============================================================================================
procedure TfrmEditWBReturnIn.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  var
    FPaySum: Extended;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.ActionListUpdate') else _udebug := nil;{$ENDIF}

  lTotal.Caption := rs(ParentNameEx, 'TotalIn')+' '+BaseCurrName;
  chbPay.Enabled := not PayDocChecked;
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
    edPaySumm.Enabled := false;
    edPayNum.Enabled := false;
    cbPayCurr.Enabled := false;
  end;

  if FGridRefresh then begin
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

  aOk.Enabled := (trim(edNum1.Text)<>'') and
    (edDate.Text <> '') and (edKAgent.KAID > 0) and (not mdDet.IsEmpty)
    and ((chbPay.Checked and (FPaySum > 0) and (Trim(edPayNum.Text) <> '')) or not chbPay.Checked);

  aSelectAll.Enabled := not mdDet.IsEmpty;
  aApply.Enabled := aOk.Enabled and (FModified or FPosModified or FPayDocModified);

  aCIns.Enabled := (edKAgent.KAID > 0);
  aCDel.Enabled := not mdDet.IsEmpty;
  aCUpd.Enabled := aCDel.Enabled and(dbgWaybillDet.SelectedCount = 1);

  edKAgent.Enabled := mdDet.IsEmpty;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.DataModified') else _udebug := nil;{$ENDIF}

  FPosModified := true;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    colSummDef.Caption := GetRS('fmWaybill','SummIn')+' '+BaseCurrName;
    colSummCurr.Caption := GetRS('fmWaybill','SummCurr');

    btnPrint.Hint := GetRS(ParentNameEx, 'PrintWB');
    btnBallance.Hint := GetRS(ParentNameEx, 'KABallance');
    aOrdersInfo.Caption := GetRS('fmOrders', 'OrderedIn');
    btnOrdersInfo.Hint := GetRS('fmOrders', 'OrderedIn');
    btnMatInfo.Hint := GetRS(ParentNameEx, 'MatInfo');
    aMatInfo.Caption := GetRS(ParentNameEx, 'MatInfo');
    aSelectAll.Caption := GetRS('Common', 'SelectAll');
    aPayMPersons.Hint := GetRS(ParentNameEx, 'aPersons');

    edFind.InitRes;

    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aApply.Caption := GetRS('Common', 'Apply');
    aCIns.Caption := GetRS('Common', 'Add');
    aCIns.Hint := GetRS(ParentNameEx, 'NewPos');
    aCUpd.Caption := GetRS('Common', 'Properties');
    aCUpd.Hint := GetRS(ParentNameEx, 'EditPos');
    aCDel.Caption := GetRS('Common', 'Del');
    aCDel.Hint := GetRS(ParentNameEx, 'DelPos');
    aShowRealPrice.Caption := GetRS(ParentNameEx, 'ShowRealPrice');
    aAddKA.Hint := GetRS(ParentNameEx, 'KAAdd');
    btnPersonName.Hint := GetRS(ParentNameEx, 'aPersons');
    edPayNum.InitRes;
    lNum.Caption := GetRS(ParentNameEx, 'Num') + ':';
    gbHeader.Caption := ' ' + GetRS(ParentNameEx, 'MainInfo') + ' ';
    gbPos.Caption := ' ' + GetRS(ParentNameEx, 'Positions') + ' ';
    lTot.Caption := GetRS(ParentNameEx, 'withNDS') + ':';
    lTotNDSOut.Caption := GetRS(ParentNameEx, 'outNDS') + ':';
    lTotNDS.Caption := GetRS(ParentNameEx, 'NDS') + ':';
    lPaySumm.Caption := GetRS(ParentNameEx, 'Summ') + ':';
    lReason.Caption := GetRS(ParentNameEx, 'Reason') + ':';
    lPersonname.Caption := GetRS(ParentNameEx, 'PersonnameIn') + ':';
    chbPosting.Properties.Caption := GetRS(ParentNameEx, 'Posting');
    colRecNo.Caption := GetRS(ParentNameEx, 'NumEx');
    colMatName.Caption := GetRS(ParentNameEx, 'MatNameFull');
    colMeasureName.Caption := GetRS(ParentNameEx, 'Measure');
    colAmount.Caption := GetRS(ParentNameEx, 'Amount');
    colWHouseName.Caption := GetRS(ParentNameEx, 'WHouse');
    colSummCurr.SummaryFooterFormat := GetRS(ParentNameEx, 'Summ')+': '+'0.00';
    colSummDef.SummaryFooterFormat := GetRS(ParentNameEx, 'Summ')+': '+'0.00';
    chbPay.Properties.Caption := GetRS(ParentNameEx, 'ExecPayment');
    edKAgent.InitRes;
    edKAgent.Caption.Caption := GetRS('fmWaybill', 'KANameOut') + ':';
    lNotes.Caption := GetRS('fmWaybill', 'Notes') + ':';
    //colPriceTXT.Caption := GetRS('fmWaybill','Price');
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := 'fmWaybill';
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.aCDelExecute(Sender: TObject);
  var
    FItem: TListItem;
    i: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.aCDelExecute') else _udebug := nil;{$ENDIF}

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
procedure TfrmEditWBReturnIn.edNum1PropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.edNum1PropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  FPayDocModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.cxDateEdit1PropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.cxDateEdit1PropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  FPosModified := true;
  FGridRefresh := true;
  FPayDocModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.chbPostingPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.chbPostingPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  FPayDocModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.dbgWaybillDetCustomDrawCell') else _udebug := nil;{$ENDIF}

 if odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.mdMatsAfterPost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.mdMatsAfterPost') else _udebug := nil;{$ENDIF}

  FPosModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.mdMatsAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.mdMatsAfterDelete') else _udebug := nil;{$ENDIF}

  FPosModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.mdMatsAfterEdit(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.mdMatsAfterEdit') else _udebug := nil;{$ENDIF}

  FPosModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  btnAdd.ImageIndex := 0;
  btnProps.ImageIndex := 1;
  btnDel.ImageIndex := 2;
  FormResize(Self);
  Screen.Cursor := crDefault;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.edTimePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.edTimePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.aCUpdExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.aCUpdExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  with TfrmEditPosReturnIn.Create(nil) do
  try
    ParentNameEx := Self.ParentNameEx;
    FKAID := edKAgent.KAID;
    OnDate := Self.OnDate;
    dbgWaybillDet.SetFocus;
    ParentHandle := Self.Handle;
    Tag := integer(mdDet);
    id := mdDet.FieldByName('posid').AsInteger;
    Caption := rs(ParentNameEx, 'PosEdit');
    Screen.Cursor := crDefault;
    ShowModal;

  finally
    Free;
    Screen.Cursor := crDefault;
  end;//try

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.FormClose(Sender: TObject; var Action: TCloseAction);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.FormClose') else _udebug := nil;{$ENDIF}

  mdDet.Close;
  cdsCurr.Close;
  cdsPayType.Close;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.mdDetAfterPost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.mdDetAfterPost') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.mdDetAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.mdDetAfterDelete') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.aSetTimeExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.aSetTimeExecute') else _udebug := nil;{$ENDIF}

  edTime.Time := Time;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.aAddKAExecute(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.aAddKAExecute') else _udebug := nil;{$ENDIF}

  if FCurrCtrl = lcbPayType then begin
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
procedure TfrmEditWBReturnIn.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.colPriceGetText') else _udebug := nil;{$ENDIF}

  try
   if not aShowRealPrice.Checked
    then AText := formatfloat(MoneyDisplayFormat, strtofloat(atext));

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.aShowRealPriceExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.aShowRealPriceExecute') else _udebug := nil;{$ENDIF}

  try
    aShowRealPrice.Checked := not aShowRealPrice.Checked;
    GetSummAll;
    dbgWaybillDet.Repaint;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.colSummDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.colSummDefGetText') else _udebug := nil;{$ENDIF}

  try
    if not aShowRealPrice.Checked then AText := formatfloat(MoneyDisplayFormat, strtofloat(atext));

  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.colSummCurrGetText') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.colRecNoGetText') else _udebug := nil;{$ENDIF}

  try
    AText := IntToStr(ANode.Index+1);

  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.dbgWaybillDetDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.dbgWaybillDetDblClick') else _udebug := nil;{$ENDIF}

  if aCUpd.Enabled then aCUpd.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.FormResize(Sender: TObject);
  var
    AStyle: integer;
    Offset, i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.FormResize') else _udebug := nil;{$ENDIF}

  inherited;
  AdjustGrid(dbgWaybillDet, colMatName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.chbPayPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.chbPayPropertiesChange') else _udebug := nil;{$ENDIF}

  // Заполнение полей
  if chbPay.Enabled then begin
    if (chbPay.Checked) then begin
      if PDOutAutoNum and (OldPayDocID = 0) then begin
        FCurrPayNum := GetDocNum(dmData.SConnection,dtPDOut,1);
        edPayNum.Text := PDOutPrefix+IntToStr(FCurrPayNum)+PDOutSuffix;
      end
      else edPayNum.Text := FPayNum;

      edPaySumm.Tag := 1;
      edPaySumm.Value := roundtoa(ALLSUMM,-2);
      edPaySumm.Tag := 0;
      cbPayCurr.KeyValue := BaseCurrID;
    end//if (chbPay.Checked)
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
      cbPayCurr.KeyValue := BaseCurrID;
      FPaySummChange := false;
    end;//else

    FPayDocModified := true;
  end;//if chbPay.Enabled

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.FormCreate(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.FormCreate') else _udebug := nil;{$ENDIF}

  FormStorage.IniFileName := MainRegKey;
  FormStorage.IniSection := Self.Name;
  FormStorage.Active := True;

  inherited;

  FCurrPayNum := -1;
  btnPayMPerson.ImageIndex := 32;
  btnPersonName.ImageIndex := 67;

  edKAgent.SetLng;
  edFind.SetLng;

  chbPosting.Checked := DefCheckWB;
  cdsPayMPersons.Open;
  lcbPayMPerson.KeyValue := -1;
  lcbPayMPerson.Text := '';

  edFind.LoadFromRegistry(MainRegKey + '\' + Self.Name + '\PosFind');
  edKAgent.LoadFromRegistry(MainRegKey + '\' + Self.Name + '\KAFind');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.WMDelete(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.WMDelete') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtPersons:  DSRefresh(cdsPersonName, 'kaid', 0);
    //rtKAgent:   DSRefresh(cdsKAgent, 'kaid', 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.lcbPersonNameKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.lcbPersonNameKeyPress') else _udebug := nil;{$ENDIF}

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
procedure TfrmEditWBReturnIn.dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.dbgWaybillDetKeyPress') else _udebug := nil;{$ENDIF}

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
procedure TfrmEditWBReturnIn.cbPayCurrKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.cbPayCurrKeyPress') else _udebug := nil;{$ENDIF}

  if Key = #13 then begin
    Key := #0;
    if btnOk.Enabled
      then btnOk.SetFocus
      else btnCancel.SetFocus;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.lcbPersonNameExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.lcbPersonNameExit') else _udebug := nil;{$ENDIF}

  lcbPersonName.SelStart := 0;
  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.edKAgentPropertiesChange(Sender: TObject);
  var
    tmpInt: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.edKAgentPropertiesChange') else _udebug := nil;{$ENDIF}

  DataModified(Sender);

   if (PayDocId > 0) and (edKAgent.KAID <> oldkaid) and chbPay.Checked
     then
     if mrYes = ssMessageDlg(rs('fmWaybill','KAChangeError') + edPayNum.Text + '?', ssmtWarning, [ssmbYes, ssmbNo]) then begin
       PayDocChecked := false;
       chbPay.Enabled := true;
       chbPay.Checked := false;
       OldPayDocId := PayDocId;
       PayDocId := 0;
       oldkaid := edKAgent.KAID;
       FModified := true;
     end
     else edKAgent.KAID := oldkaid;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.dsDetDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.dsDetDataChange') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.BeginUpdate;
  try
    FormResize(Self);
  finally
    dbgWaybillDet.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  edFind.SetLng;
  edKAgent.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.aPayMPersonsExecute(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.aPayMPersonsExecute') else _udebug := nil;{$ENDIF}

  try
    aid := lcbPayMPerson.KeyValue;
  except
    aid := 0;
  end;

  lcbPayMPerson.SetFocus;
  lcbPayMPerson.Tag := 1;
  ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
  lcbPayMPerson.Tag := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.aPrintExecute(Sender: TObject);
  var
    FSumWONDS, FNDS, FSumWithNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.aPrintExecute') else _udebug := nil;{$ENDIF}

  if mdDet.IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  mdReport.CopyFromDataSet(mdDet);

  if PrintType = 0 then begin
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

      NDSCalc(1, mdReport.FieldByName('price').AsFloat, mdReport.FieldByName('nds').AsFloat, 1, FSumWONDS, FNDS);
      FSumWithNDS := RoundToA(FSumWONDS + FNDS, -2);
      FSumWONDS := RoundToA(FSumWithNDS - FNDS, -2);
      mdReport.FieldByName('price').AsFloat := FSumWONDS;//NDSOut(mdReport.FieldByName('price').AsFloat,mdReport.FieldByName('nds').AsFloat);
      mdReport.Post;
      mdReport.Next;
    end;//while
  end;//if PrintType=0

  FGridRefresh := True;
  SmartShowRep(frDoc, 'Return_In.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.aBallanceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.aBallanceExecute') else _udebug := nil;{$ENDIF}

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
procedure TfrmEditWBReturnIn.aMatInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.aMatInfoExecute') else _udebug := nil;{$ENDIF}

  if dbgWaybillDet.SelectedCount <> 1 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

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
procedure TfrmEditWBReturnIn.frDocGetValue(const ParName: String; var ParValue: Variant);
  var
    FSumWithoutNDSPos, FSumNDSPos, FSummPos, FSumm: Extended;
    tmpInt: Integer;
    FWONDS, FNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.frDocGetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'printtype') then ParValue := PrintType
  else if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := edNum1.Text
  else if 0 = AnsiCompareText(ParName, 'PriceDisplayFormatEx') then ParValue := PriceDisplayFormatEx
  else if 0 = AnsiCompareText(ParName, 'possumwonds')
  then begin
    NDSCalc(mdReport.FieldByName('amount').AsFloat,
      mdReport.FieldByName('price').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
      mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);

    ParValue := RoundToA(FWONDS + FNDS, -2);
    FNDS := RoundToA(FNDS, -2);
    ParValue := ParValue - FNDS;
  end
  else if 0 = AnsiCompareText(ParName, 'curnds') then ParValue := NDS
  else if 0 = AnsiCompareText(ParName, 'possumnds')
  then begin
    NDSCalc(mdReport.FieldByName('amount').AsFloat,
      mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
      mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

    ParValue := RoundToA(FSumNDSPos + FSumWithoutNDSPos, -2);
  end
  else if 0 = AnsiCompareText(ParName, 'posnds') then begin
    NDSCalc(mdReport.FieldByName('amount').AsFloat,
      mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
      mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

    ParValue := RoundToA(FSumNDSPos, -2);
  end
  else if 0 = AnsiCompareText(ParName, 'posprice') then begin
    if mdReport.FieldByName('amount').AsFloat = 1 then begin
      NDSCalc(mdReport.FieldByName('amount').AsFloat,
        mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
        mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);
        FSummPos := RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);

      ParValue := FSummPos - RoundToA(FSumNDSPos, -2);
    end
    else ParValue := mdReport.FieldByName('price').AsFloat;
  end
  else if 0 = AnsiCompareText(ParName, 'possum') then begin
    if (PrintType = 0) then begin
      NDSCalc(mdReport.FieldByName('amount').AsFloat,
        mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
        mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

      FSummPos := RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
      FSumWithoutNDSPos := FSummPos - RoundToA(FSumNDSPos, -2);
      ParValue := FSumWithoutNDSPos;
    end// if =0
    else begin
      NDSCalc(mdReport.FieldByName('amount').AsFloat,
        mdReport.FieldByName('price').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
        mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

        ParValue := RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
    end;
  end
  else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := edDate.Text
  else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
  else if 0 = AnsiCompareText(ParName, 'kafullname') then ParValue := edKAgent.Obj.NameEx
  else if 0 = AnsiCompareText(ParName, 'reason') then ParValue := edReason.Text
  else if 0 = AnsiCompareText(ParName, 'propis') then begin
    FSumm := StrToFloat(DelChars(lSummDef.Caption, [ThousandSeparator]));
    ParValue := MoneyToStr(FSumm);
  end
  else if 0 = AnsiCompareText(ParName, 'personname') then ParValue := lcbPersonName.Text
  else if 0 = AnsiCompareText(ParName, 'sumnds') then ParValue := StrToFloat(DelChars(lSummDefNDS.Caption, [ThousandSeparator]))
  else if 0 = AnsiCompareText(ParName, 'sumall') then ParValue := StrToFloat(DelChars(lSummDef.Caption, [ThousandSeparator]));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.lcbPersonNameEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.lcbPersonNameEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPersonName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.btnPersonNameMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.btnPersonNameMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.btnPersonNameMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.btnPersonNameMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPersonName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.mdDetCalcFields(DataSet: TDataSet);
 var
   FNDS, FSummWONDS, FSumm, FSummNDS: Extended;
   FPrice, FOnValue, FAmount: Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.mdDetCalcFields') else _udebug := nil;{$ENDIF}

  with DataSet do begin
    FNDS := FieldByName('nds').AsFloat;
    FPrice := FieldByName('price').AsFloat;
    FOnValue := FieldByName('onvalue').AsFloat;
    FAmount := FieldByName('amount').AsFloat;

    NDSCalc(FAmount, FPrice * FOnValue, FNDS, 1, FSummWONDS, FSummNDS);
    FSumm := RoundToA(FSummWONDS + FSummNDS, -2);
    FSummWONDS := FSumm - RoundToA(FSummNDS, -2);

    FieldByName('total').AsFloat := FSumm;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.DoHelp;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.DoHelp') else _udebug := nil;{$ENDIF}

  ShowHelpTopic('fmWBReturnIn');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.GetSummAll;
  var
    i: Integer;
    PriceCurrOutNDS, SummCurrOutNDS, SummCurrNDS, SummCurr, FAmount, FNorm,
    PriceDefOutNDS, SummDefOutNDS, SummDefNDS, SummDef,
    AllSummDefOutNDS, AllSummDefNDS, AllSummDef, FNDS :Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.GetSummAll') else _udebug := nil;{$ENDIF}

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

        FAmount := ssStrToFloat(Items[i].Values[colAmount.Index]);

        if (Items[i].Values[colPType.Index] = 1) and (FNorm > 0)
          then FAmount := FAmount * FNorm;

        SummCurr := RoundToA(FAmount * ssStrToFloat(Items[i].Values[colPriceInCurr.Index]), -2);
        Items[i].Values[colSummCurr.Index] := SummCurr;
        AllSummCurr := AllSummCurr + SummCurr;

      except
        Items[i].Values[colSummCurr.Index] := -1;
      end;

      try
        try
          FNDS := ssStrToFloat(Items[i].Values[colNDSRate.Index]);
        except
          FNDS := NDS;
        end;

        {Цены с НДС и без НДС}
        NDSCalc(1, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * ssStrToFloat(Items[i].Values[colOnValue.Index]),
          ssStrToFloat(Items[i].Values[colNDSRate.Index]), 1, SummDefOutNDS, SummDefNDS);

        Items[i].Values[colPrice.Index] := RoundToA(SummDefOutNDS + SummDefNDS, -2);
        Items[i].Values[colPriceWONDS.Index] := RoundToA(SummDefOutNDS + SummDefNDS, -2) - RoundToA(SummDefNDS, -2);

        NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * ssStrToFloat(Items[i].Values[colOnValue.Index]),
          ssStrToFloat(Items[i].Values[colNDSRate.Index]), 1, SummDefOutNDS, SummDefNDS);

        SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
        AllSummDefOutNDS := AllSummDefOutNDS + SummDefOutNDS;
        AllSummDefNDS := AllSummDefNDS + RoundToA(SummDefNDS, -2);
        //Сумма в нац. валюте с НДС;
        AllSummDef := AllSummDef + SummDef;
        Items[i].Values[colSummDef.Index] := SummDef;
        Items[i].Values[colNDS.Index] := RoundToA(SummDefNDS, -2);
        Items[i].Values[colSummWONDS.Index] := SummDef - RoundToA(SummDefNDS, -2);

      except
        Items[i].Values[colSummDef.Index] := 0;
      end;
    end;

    AllSummDef := RoundToA(AllSummDef, -2);
    //AllSummDefNDS := RoundToA(GetNDSOutEx(AllSummDef, CurrentNDS), -2);
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
procedure TfrmEditWBReturnIn.cbCurrPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.cbCurrPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.cbCurrPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.cbCurrPropertiesChange') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.aOrdersInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.aOrdersInfoExecute') else _udebug := nil;{$ENDIF}

  ShowOrdersInfo(edKAgent.KAID, -16, OnDate);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.aAddMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.aAddMatExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditPosReturnIn.Create(nil) do
  try
    ParentNameEx := Self.ParentNameEx;
    FKAID := edKAgent.KAID;
    OnDate := Self.OnDate;
    ParentHandle := Self.Handle;
    Tag := Integer(mdDet);
    ID := 0;

    Caption := rs(ParentNameEx, 'PosAdd');
    Screen.Cursor := crDefault;
    ShowModal;

  finally
    if not mdDet.IsEmpty then dbgWaybillDet.SetFocus;
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.aCInsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.aCInsExecute') else _udebug := nil;{$ENDIF}

  aAddMat.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.aActivateFindExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.aActivateFindExecute') else _udebug := nil;{$ENDIF}

  edFind.Editor.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.FormDestroy') else _udebug := nil;{$ENDIF}

  inherited;

  edFind.SaveToRegistry(MainRegKey + '\' + Self.Name + '\PosFind');
  edKAgent.SaveToRegistry(MainRegKey + '\' + Self.Name + '\KAFind');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnIn.dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnIn.dbgWaybillDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  ImgList := dmData.Images;
  AText := rs('fmWaybill', 'DocWBRetIn');
  AIndex := II_WBRETIN;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditWBReturnIn', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
