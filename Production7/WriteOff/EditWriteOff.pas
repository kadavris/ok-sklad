{$I ok_sklad.inc}
unit EditWriteOff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls, DBClient, Grids, DBGrids,

  FR_DSet, FR_DBSet, FR_Class, TB2Item, xButton,

  ssFormStorage, ssMemDS, ssBaseWBDocOut, ssPanel, ssGradientPanel, ssDBGrid, ssBevel,
  ssGroupBox, ssSpeedButton, ssDBLookupCombo, ssLabel, ssClientDataSet, ssBaseConst, ssPageControl,
  ssCalcEdit, okSearchEdit,

  cxSpinEdit, cxTimeEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox, cxContainer, cxEdit, cxTextEdit,
  cxControls, cxGroupBox, cxPC, cxCalc,

  dxmdaset, dxDBTLCl6, dxGrClms6, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,

  prTypes;

type
  TfrmEditWriteOff = class(TfrmBaseWBDocOut)
    aAddMat: TAction;
    aAddMatList: TAction;
    btnChairman: TssSpeedButton;
    btnPerson1: TssSpeedButton;
    btnPerson2: TssSpeedButton;
    btnPerson3: TssSpeedButton;
    btnWHouseOut: TssSpeedButton;
    cdsWhouse: TssClientDataSet;
    cdsWhouseADDR: TStringField;
    cdsWhouseDEF: TIntegerField;
    cdsWhouseDELETED: TIntegerField;
    cdsWhouseNAME: TStringField;
    cdsWhouseNOTES: TStringField;
    cdsWhouseWID: TIntegerField;
    chbLosses: TcxCheckBox;
    dsPersonName: TDataSource;
    dsWhouse: TDataSource;
    gbComm: TssGroupBox;
    itmAddMatList: TTBItem;
    lcbChairman: TssDBLookupCombo;
    lcbPerson1: TssDBLookupCombo;
    lcbPerson2: TssDBLookupCombo;
    lcbPerson3: TssDBLookupCombo;
    lcbWHouseOut: TssDBLookupCombo;
    lChairman: TLabel;
    lCommission: TssLabel;
    lPerson1: TLabel;
    lPerson2: TLabel;
    lPerson3: TLabel;
    lWhouseOut: TssLabel;
    mnuAdd: TTBSubmenuItem;
    pmMatSvc: TTBPopupMenu;
    TBItem19: TTBItem;
    TBItem1: TTBItem;
    TBItem6: TTBItem;

    procedure aAddMatExecute(Sender: TObject);
    procedure aAddMatListExecute(Sender: TObject);
    procedure aCInsExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCurActionExecute(Sender: TObject);
    procedure btnChairmanClick(Sender: TObject);
    procedure btnPerson1Click(Sender: TObject);
    procedure btnPerson2Click(Sender: TObject);
    procedure btnPerson3Click(Sender: TObject);
    procedure btnWHouseOutClick(Sender: TObject);
    procedure cdsWhouseBeforeOpen(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure lcbWHouseOutPropertiesEditValueChanged(Sender: TObject);
    procedure mdDetAfterDelete(DataSet: TDataSet);

  private
    DisExec: Boolean;
    DocInfo: TokAddDocInfo;
    FInvID: Integer;

    procedure FillMatsFromWMat(DS: TDataSet);
    procedure WMDelete(var M: TMessage); message WM_DELETE;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  protected
    procedure SetID(const Value: integer);override;

  public
    ShowWarning: Boolean;

    procedure SetCaptions; override;
    procedure GetFromInv(const AID: Integer; const ANum: string);
    procedure AddMats(const IDs: string); override;
  end;

var
  frmEditWriteOff: TfrmEditWriteOff;

//=============================================================
//=============================================================
//=============================================================
implementation

uses
  ssFun, prConst, ClientData, prFun, ssCallbackConst,
  fMessageDlg, ssBaseWBDocDlgWithPayment, EditPositionMov, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//=============================================================
procedure TfrmEditWriteOff.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.WMRefresh') else _udebug := nil;{$ENDIF}

  inherited;

  if M.LParam = 9 then begin
    GetSummAll;
    dbgWaybillDet.ClearSelection;
    dbgWaybillDet.FocusedNode.Selected := True;
    DataModified(Self);
  end
  else case TRefType(M.LParam) of
    rtWMat:
      begin
        FillMatsFromWMat(TDataSet(M.WParam));
      end;

    rtPersons:begin
      cdsPersonName.DisableControls;
      DSRefresh(cdsPersonName,'kaid',M.WParam);
      cdsPersonName.EnableControls;

      with lcbChairman do begin
        Tag := KeyValue; ReloadData; KeyValue := Tag;
        if Tag=0 then Text := '' else Tag := 0;
      end;

      with lcbPerson1 do begin
        Tag := KeyValue; ReloadData; KeyValue := Tag;
        if Tag=0 then Text := '' else Tag := 0;
      end;

      with lcbPerson2 do begin
        Tag := KeyValue; ReloadData; KeyValue := Tag;
        if Tag=0 then Text := '' else Tag := 0;
      end;

      with lcbPerson3 do begin
        Tag := KeyValue; ReloadData; KeyValue := Tag;
        if Tag=0 then Text := '' else Tag := 0;
      end;

      if (FCurrCtrl=lcbChairman)or(FCurrCtrl=lcbPerson1) or (FCurrCtrl=lcbPerson2)or(FCurrCtrl=lcbPerson3)
      then with (FCurrCtrl as TssDBLookupCombo) do begin
        Tag := 1; KeyValue := M.WParam; Tag := 0;
      end;
    end;//rtPersons:begin

    rtWHouse:begin
      cdsWhouse.DisableControls;
      DSRefresh(cdsWhouse,'wid',M.WParam);
      cdsWhouse.EnableControls;
      with lcbWHouseOut do begin
        Tag := KeyValue; ReloadData; KeyValue := Tag;
        if Tag=0 then Text := '' else Tag := 0;
      end;

      if FCurrCtrl = lcbWHouseOut then begin
        with (FCurrCtrl as TssDBLookupCombo) do begin
          Tag := 1; KeyValue := M.WParam; Tag := 0;
        end;

        lcbWHouseOutPropertiesEditValueChanged(FCurrCtrl);
      end;
    end;//rtWHouse
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.WMDelete(var M: TMessage);
  var
    FtmpCtrl:TControl;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.WMDelete') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtWHouse, rtPersons: begin
      FtmpCtrl := FCurrCtrl;
      FCurrCtrl := nil;
      SendMessage(Self.Handle,WM_REFRESH,0,integer(TRefType(M.LParam)));
      FCurrCtrl := FtmpCtrl;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  FDocType := dtWriteOff;
  gbPayment.Hide;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.btnWHouseOutClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.btnWHouseOutClick') else _udebug := nil;{$ENDIF}

  inherited;
  lcbWHouseOut.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.aCurActionExecute(Sender: TObject);
  var
    aid : integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.aCurActionExecute') else _udebug := nil;{$ENDIF}

  inherited;

  if FCurrCtrl=lcbWHouseOut then begin
    try aid := lcbWHouseOut.KeyValue; except aid := 0; end;
    ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate, aid);
  end
  else if FCurrCtrl=lcbChairman then begin
    try aid := lcbChairman.KeyValue; except aid := 0; end;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
  end
  else if FCurrCtrl=lcbPerson1 then begin
    try aid := lcbPerson1.KeyValue; except aid := 0; end;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
  end
  else if FCurrCtrl = lcbPerson2 then begin
    try aid := lcbPerson2.KeyValue; except aid := 0; end;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
  end
  else if FCurrCtrl = lcbPerson3 then begin
    try aid := lcbPerson3.KeyValue; except aid := 0; end;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.lcbWHouseOutPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.lcbWHouseOutPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  with Sender as TssDBLookupCombo do
    if (Tag = 0) and (Sender = lcbWHouseOut) then FWID := KeyValue;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.SetID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWriteOff.SetID') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  inherited; // lots of inherited code here. look at ssBaseWBDocOut

  with lcbWHouseOut do begin Tag := 1; cdsWhouse.Open; KeyValue := 0; Text := ''; Tag := 0; end;

  with lcbChairman do begin Tag := 1; cdsPersonName.Open; KeyValue := 0; Text := ''; Tag := 0; end;

  with lcbPerson1 do begin Tag := 1; KeyValue := 0; Text := ''; Tag := 0; end;

  with lcbPerson2 do begin Tag := 1; KeyValue := 0; Text := ''; Tag := 0; end;

  with lcbPerson3 do begin Tag := 1; KeyValue := 0; Text := ''; Tag := 0; end;

  if Value > 0 then begin
    chbLosses.Checked := (FDefNum <> 0);
    Self.Caption := rs(ParentNameEx, 'TitleEdit');

    with newDataSet do
    try
      //чтение списка членов комиссии
      ProviderName := 'pWOCom_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := Value;
      Open;
      if not IsEmpty then begin
        if Locate('num',0,[]) then lcbChairman.KeyValue := fieldbyname('kaid').AsInteger;
        if Locate('num',1,[]) then lcbPerson1.KeyValue := fieldbyname('kaid').AsInteger;
        if Locate('num',2,[]) then lcbPerson2.KeyValue := fieldbyname('kaid').AsInteger;
        if Locate('num',3,[]) then lcbPerson3.KeyValue := fieldbyname('kaid').AsInteger;
      end;//if not IsEmpty
      Close;

    finally
      Free;
    end;

    if not mdDet.IsEmpty then begin
      mdDet.First;
      lcbWHouseOut.KeyValue := mdDet.fieldbyname('wid').AsInteger;
    end;//if not mdDet.IsEmpty

    if IsPattern then begin
      FID := 0;
      mdWMatTurn.Close;
      mdWMatTurn.Open;
      mdWMatTurnOld.Close;
      mdWMatTurnOld.CopyFromDataSet(mdWMatTurn);
      FShowRsvMsgs := False;
      aSetRsvAll.Execute;
      FShowRsvMsgs := True;
      dbgWaybillDet.ClearSelection;
      mdDet.First;

      with dbgWaybillDet do if FocusedNode <> nil then FocusedNode.Selected := True;

      FPosModified := True;
    end;
  end
  else Self.Caption := rs(ParentNameEx,'TitleAdd');

  UpdateActions;
  FModified := False;
  if not IsPattern then FPosModified := False;
  Screen.Cursor := crDefault;

  if not GetUserAccessByClass(Self.ParentNameEx, uaPost) then begin
    chbPosting.Hint := rs('Common', 'noRights');
    chbPosting.Checked := False;
    chbPosting.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    lWhouseOut.Caption := GetRS('fmWaybill','WHouse')+':';
    btnWHouseOut.Hint := GetRS('fmWaybill','WHouseRef');
    gbComm.Caption := ' '+GetRS('fmInventory','CommissionEx')+' ';
    lChairman.Caption := GetRS(ParentNameEx,'Chairman') + ':';
    lPerson1.Caption := GetRS(ParentNameEx,'Person1') + ':';
    lPerson2.Caption := GetRS(ParentNameEx,'Person2') + ':';
    lPerson3.Caption := GetRS(ParentNameEx,'Person3') + ':';
    btnChairman.Hint := GetRS('fmWaybill', 'aPersons');
    btnPerson1.Hint := btnChairman.Hint;
    btnPerson2.Hint := btnChairman.Hint;
    btnPerson3.Hint := btnChairman.Hint;
    lCommission.Caption := GetRS('fmInventory', 'CommissionEx') + ':';
    chbLosses.Properties.Caption := GetRS('fmWriteOff', 'Losses');
    aAddMat.Caption := GetRS('fmWaybill', 'MatName');
    aAddMatList.Caption := GetRS('fmWaybill', 'AddMatList');
    mnuAdd.Caption := GetRS('Common', 'Add');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  lcbWHouseOut.Enabled := mdDet.IsEmpty;
  btnWHouseOut.Enabled := lcbWHouseOut.Enabled;

  aOk.Enabled := (trim(edNum1.Text) <> '') and (edDate.Text <> '')
     and (lcbWHouseOut.Text <> '')
     and (not mdDet.IsEmpty) and ((chbPosting.Checked and not FNotRsvPresent) or not chbPosting.Checked);

  aApply.Enabled := aOk.Enabled and (FModified or FPosModified);
  aCIns.Enabled := (lcbWHouseOut.Text <> '');
  aCDel.Enabled := (not mdDet.IsEmpty);
  aCUpd.Enabled := aCDel.Enabled;// and (dbgWaybillDet.SelectedCount = 1);
  aSetRsv.Enabled := (not mdDet.IsEmpty);
  aSetRsvAll.Enabled := (not mdDet.IsEmpty);
  aRemoveRsv.Enabled := (not mdDet.IsEmpty);
  aRemoveRsvAll.Enabled := (not mdDet.IsEmpty);
  aSelectAll.Enabled := (not mdDet.IsEmpty);
  mnuAdd.Enabled := aCIns.Enabled;
  //dbgWaybillDet.Enabled := (not mdDet.IsEmpty);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.btnChairmanClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.btnChairmanClick') else _udebug := nil;{$ENDIF}

  inherited;
  lcbChairman.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.btnPerson1Click(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.btnPerson1Click') else _udebug := nil;{$ENDIF}

  inherited;
  lcbPerson1.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.btnPerson2Click(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.btnPerson2Click') else _udebug := nil;{$ENDIF}

  inherited;
  lcbPerson2.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.btnPerson3Click(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.btnPerson3Click') else _udebug := nil;{$ENDIF}

  inherited;
  lcbPerson3.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: boolean;
    BM:TBookmark;
    tmpPosId:Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;
    if not CheckDocDate(edDate.Date) then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    if CheckDatesIn then begin

      with newDataSet do begin
        try
          TrStart;

          try
            Screen.Cursor := crSQLWait;
            NewRecord := (ID = 0);

            if NewRecord then FID := GetMaxID(dmData.SConnection,'waybilllist','wbillid');

            if NewRecord
              then ProviderName := 'pWaybill_Ins'
              else ProviderName := 'pWaybill_Upd';

            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Params.ParamByName('NUM').AsString := edNum1.Text;
            Params.ParamByName('DEFNUM').AsInteger := Integer(chbLosses.Checked);
            Params.ParamByName('ONDATE').AsDateTime := edDate.Date+edTime.Time;
            Params.ParamByName('KAID').DataType := ftInteger;
            Params.ParamByName('KAID').Clear;
            Params.ParamByName('CURRID').DataType := ftInteger;
            Params.ParamByName('CURRID').Clear;
            Params.ParamByName('ATTNUM').DataType := ftString;
            Params.ParamByName('ATTNUM').Clear;
            Params.ParamByName('ATTDATE').DataType := ftDateTime;
            Params.ParamByName('ATTDATE').Clear;

            if trim(edReason.Text) = '' then begin
              Params.ParamByName('REASON').DataType := ftString;
              Params.ParamByName('REASON').Clear;
            end
            else Params.ParamByName('REASON').AsString := edReason.Text;

            Params.ParamByName('notes').AsString := edNotes.Text;
            Params.ParamByName('PERSONID').DataType := ftInteger;
            Params.ParamByName('PERSONID').Clear;
            Params.ParamByName('CHECKED').AsInteger := integer(chbPosting.Checked);
            Params.ParamByName('WTYPE').AsInteger := -5;//тип накладной -5-списание
            Params.ParamByName('DELETED').AsInteger := 0;
            Params.ParamByName('SUMMALL').AsFloat := RoundToA(ALLSUMM,-2);
            Params.ParamByName('NDS').DataType := ftFloat;
            Params.ParamByName('NDS').Clear;
            Params.ParamByName('RECEIVED').DataType := ftString;
            Params.ParamByName('RECEIVED').Clear;
            Params.ParamByName('TODATE').DataType := ftDateTime;
            Params.ParamByName('TODATE').Clear;
            Execute;//Записали в waybilllist

            ProviderName := 'pWayBillMove_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Execute; //Удалили из WAYBILLMOVE

            ProviderName := 'pWayBillMove_Ins';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Params.ParamByName('sourcewid').AsInteger := lcbWHouseOut.KeyValue;
            Params.ParamByName('destwid').DataType := ftInteger;
            Params.ParamByName('destwid').Clear;
            Params.ParamByName('personid').DataType := ftInteger;
            Params.ParamByName('personid').Clear;
            Execute;// Записали в WAYBILLMOVE

            ProviderName := 'pWOCom_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Execute; //Удалили из comission

            //Запись председателя
            if lcbChairman.Text <> '' then begin
              ProviderName := 'pWOCom_Ins';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := FID;
              Params.ParamByName('KAID').AsInteger := lcbChairman.KeyValue;
              Params.ParamByName('NUM').AsInteger := 0;
              Execute;// Записали в WAYBILLMOVE
            end;
            //Запись 1-го
            if lcbPerson1.Text <> '' then begin
              ProviderName := 'pWOCom_Ins';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := FID;
              Params.ParamByName('KAID').AsInteger := lcbPerson1.KeyValue;
              Params.ParamByName('NUM').AsInteger := 1;
              Execute;// Записали в WAYBILLMOVE
            end;
            //Запись 2-го
            if lcbPerson2.Text <> '' then begin
              ProviderName := 'pWOCom_Ins';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := FID;
              Params.ParamByName('KAID').AsInteger := lcbPerson2.KeyValue;
              Params.ParamByName('NUM').AsInteger := 2;
              Execute;// Записали в WAYBILLMOVE
            end;
            //Запись 3-го
            if lcbPerson3.Text <> '' then begin
              ProviderName := 'pWOCom_Ins';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := FID;
              Params.ParamByName('KAID').AsInteger := lcbPerson3.KeyValue;
              Params.ParamByName('NUM').AsInteger := 3;
              Execute;// Записали в WAYBILLMOVE
            end;

            // 1 )Удаляем из оборотов
            ProviderName := 'pWMatTurn_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := ID;
            Execute;  //Удалили из wmatturn

            if FPosModified then begin // Запись позиций в накладную
              // 2 Удаляем позиции
              ProviderName := 'pWaybillDet_Del';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := ID;
              Execute;

              // 3 Запись позиций из mdDet в waybilldet
              BM := mdDet.GetBookmark;
              mdDet.DisableControls;
              mdDet.First;
              while not mdDet.Eof do begin
                ProviderName := 'pWaybillDet_Ins';
                FetchParams;
                tmpPosId := GetMaxID(dmData.SConnection,'waybilldet','posid');

                if  tmpPosId < 0 then raise Exception.Create(rs('fmWaybill','ErrorAddPos'));

                Params.ParamByName('POSID').AsInteger := tmpPosId;

                //3.1 Ставим реальные Sourceid для оборотов
                mdWMatTurn.First;
                while not mdWMatTurn.Eof do begin
                  if mdWMatTurn.FieldByName('sourceid').AsInteger=mdDet.fieldbyname('posid').AsInteger then begin
                    mdWMatTurn.Edit;
                    mdWMatTurn.FieldByName('sourceid').AsInteger := Params.ParamByName('POSID').AsInteger;
                    mdWMatTurn.Post;
                  end;//if
                  mdWMatTurn.Next;
                end;//while

                Params.ParamByName('WBILLID').AsInteger := FID;
                Params.ParamByName('MATID').AsInteger := mdDet.fieldbyname('MATID').AsInteger;
                Params.ParamByName('WID').AsInteger := mdDet.fieldbyname('WID').AsInteger;
                Params.ParamByName('AMOUNT').AsFloat := RoundToA(StrToFloat(mdDet.fieldbyname('AMOUNT').AsString),MatDisplayDigits);
                if mdDet.fieldbyname('PRICE').IsNull then begin
                  Params.ParamByName('PRICE').DataType := ftFloat;
                  Params.ParamByName('PRICE').Clear;
                end
                else Params.ParamByName('PRICE').AsFloat := StrToFloat(mdDet.fieldbyname('PRICE').AsString);

                if mdDet.fieldbyname('DISCOUNT').IsNull then begin
                  Params.ParamByName('DISCOUNT').DataType := ftFloat;
                  Params.ParamByName('DISCOUNT').Clear;
                end
                else Params.ParamByName('DISCOUNT').AsFloat := StrToFloat(mdDet.fieldbyname('DISCOUNT').AsString);

                if mdDet.fieldbyname('NDS').IsNull then begin
                  Params.ParamByName('NDS').DataType := ftFloat;
                  Params.ParamByName('NDS').Clear;
                end
                else Params.ParamByName('NDS').AsFloat := StrToFloat(mdDet.fieldbyname('NDS').AsString);

                if mdDet.fieldbyname('CurrId').IsNull then begin
                  Params.ParamByName('CurrId').DataType := ftInteger;
                  Params.ParamByName('CurrId').Clear;
                end
                else Params.ParamByName('CurrId').AsInteger := mdDet.fieldbyname('CurrId').AsInteger;

                if mdDet.FieldByName('onvalue').IsNull then begin
                  Params.ParamByName('onvalue').DataType := ftDateTime;
                  Params.ParamByName('onvalue').Clear;
                end
                else Params.ParamByName('onvalue').AsFloat := mdDet.fieldbyname('onvalue').AsFloat;

                if mdDet.fieldbyname('OnDate').IsNull then begin
                  Params.ParamByName('OnDate').DataType := ftDateTime;
                  Params.ParamByName('OnDate').Clear;
                end
                else Params.ParamByName('OnDate').AsDateTime := mdDet.fieldbyname('OnDate').AsDateTime;

                if mdDet.fieldbyname('PTypeID').IsNull then begin
                  Params.ParamByName('PTypeID').DataType := ftInteger;
                  Params.ParamByName('PTypeID').Clear;
                end
                else Params.ParamByName('PTypeID').AsInteger := mdDet.fieldbyname('PTypeID').AsInteger;

                Params.ParamByName('NUM').AsInteger := mdDet.RecNo;
                Execute;//Записываем очередную позицию
                SaveSerial(tmpPosID);

                if (mdDet.FieldByName('producer').AsString <> '') or (mdDet.FieldByName('certnum').AsString <> '')
                   or (mdDet.FieldByName('gtd').AsString <> '') or (mdDet.FieldByName('certdate').AsDateTime <> 0)
                then begin
                  ProviderName := 'pWaybillDetAP_Ins';
                  FetchParams;
                  Params.ParamByName('posid').AsInteger := tmpPosId;
                  if mdDet.FieldByName('producer').IsNull then begin
                    Params.ParamByName('producer').DataType := ftString;
                    Params.ParamByName('producer').Clear;
                  end
                  else Params.ParamByName('producer').AsString := mdDet.FieldByName('producer').AsString;

                  if mdDet.FieldByName('certnum').IsNull then begin
                    Params.ParamByName('certnum').DataType := ftString;
                    Params.ParamByName('certnum').Clear;
                  end
                  else Params.ParamByName('certnum').AsString := mdDet.FieldByName('certnum').AsString;

                  if mdDet.FieldByName('gtd').IsNull then begin
                    Params.ParamByName('gtd').DataType := ftString;
                    Params.ParamByName('gtd').Clear;
                  end
                  else Params.ParamByName('gtd').AsString := mdDet.FieldByName('gtd').AsString;

                  if mdDet.FieldByName('certdate').IsNull then begin
                    Params.ParamByName('certdate').DataType := ftDateTime;
                    Params.ParamByName('certdate').Clear;
                  end
                  else Params.ParamByName('certdate').AsDateTime := mdDet.FieldByName('certdate').AsDateTime;

                  Execute;
                end;

                mdDet.Next;
              end;//while not mdDet.Eof

              mdDet.GotoBookmark(BM);
              FreeBookmark(BM);
              mdDet.EnableControls;
              FPosModified := false;//Сбрасываем флаг изменения позиций
            end;//if FPosModified

            //2)Запись в обороты
            ProviderName := 'pWMatTurnOut_Ins';
            mdWMatTurn.First;
            while not mdWMatTurn.Eof do begin
              FetchParams;
              Params.ParamByName('PosID').AsInteger := mdWMatTurn.fieldbyname('posid').AsInteger;
              Params.ParamByName('SOURCEID').AsInteger := mdWMatTurn.fieldbyname('SOURCEID').AsInteger;
              Params.ParamByName('MatID').AsInteger := mdWMatTurn.fieldbyname('matid').AsInteger;
              Params.ParamByName('WID').AsInteger := mdWMatTurn.fieldbyname('wid').AsInteger;

              if chbPosting.Checked
                then Params.ParamByName('TurnType').AsInteger := -1
                else Params.ParamByName('TurnType').AsInteger := 2;

              Params.ParamByName('OnDate').AsDateTime := edDate.Date+edTime.Time;
              Params.ParamByName('Amount').AsFloat := RoundToA(strtofloat(mdWMatTurn.fieldbyname('amount').AsString),MatDisplayDigits);
              Execute;
              mdWMatTurn.Next;
            end;

          if FInvID > 0 then begin
            ProviderName := 'pDocsRel_Inv_WBRest_Ins';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FID;
            Params.ParamByName('invid').AsInteger := FInvID;
            Execute;
          end;

           FModified := False;//флаг изменения документа false
           TrCommit;
           dmData.SConnection.AppServer.Rsv_Delete(-1);

            if ModalResult = mrYes then begin
              if NewRecord then begin
                mdDet.Close;
                mdTmpIds.Close;
                dmData.SConnection.AppServer.Rsv_Delete(-1);
                ID := 0;
              end//if NewRecord
              else begin
                  if chbPosting.Checked
                  then CanClose := true
                  else begin
                    mdDet.Close;
                    mdTmpIds.Close;
                    dmData.SConnection.AppServer.Rsv_Delete(-1);
                    ID := ID;
                  end;
              end//else NewRecord
            end //if ModalResult = mrYes
            else CanClose := True;

            FGridRefresh := true;

            if Logging then RefreshLog;

            if not WHMode then begin
              SendMessage(MainHandle, WM_REFRESH, ID, 0);
              RefreshFun('TfmWMat', 0);
            end
            else begin
              SendMessage(MainHandle, WM_REFRESH, 0, 0);
              RefreshFun('TfmWriteOff', 0);
            end;

            {if RefreshAllClients then begin
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
            end;
            }

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
    end;
  end
  else begin
    if GetDocNum(dmData.SConnection,FDocType,0)=FCurrNum
      then GetDocNum(dmData.SConnection, FDocType, -1);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.GetFromInv(const AID: Integer; const ANum: string);
  var
    FAmount, FDisc: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.GetFromInv') else _udebug := nil;{$ENDIF}

  Application.ProcessMessages;
  edReason.Text := rs('fmWaybill', 'DocInv') + ' №' + ANum;
  DisExec := True;

  with newDataSet do
  try
    mdDet.DisableControls;
    ProviderName := 'pWaybillDet_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AID;

    Open;
    mdDet.LoadFromDataSet(Fields[0].DataSet);

    mdDet.First;
    while not mdDet.Eof do begin
      try
        FAmount := mdDet.FieldByName('amount').AsFloat;
      except
        FAmount := 0;
      end;

      try
        FDisc := mdDet.FieldByName('discount').AsFloat;
      except
        FDisc := 0;
      end;

      if RoundToA(FDisc - FAmount, MatDisplayDigits) >= 0
        then mdDet.Delete
        else mdDet.Next;
    end;

    mdDet.First;

    while not mdDet.Eof do begin
      try
        FAmount := mdDet.FieldByName('amount').AsFloat;
      except
        FAmount := 0;
      end;

      try
        FDisc := mdDet.FieldByName('discount').AsFloat;
      except
        FDisc := 0;
      end;

      mdDet.Edit;
      mdDet.FieldByName('amount').AsFloat := FAmount - FDisc;
      mdDet.Post;
      mdDet.Next;
    end;

    mdDet.EnableControls;
    aSetRsvAll.Execute;
    GetSummAll;
    Close;

    if FNotRsvPresent then ShowWarning := True;

    mdDet.First;
    dbgWaybillDet.ClearSelection;

    if dbgWaybillDet.FocusedNode <> nil then dbgWaybillDet.FocusedNode.Selected := True;

    FPosModified := True;
    //GetSummAll;

  finally
    mdDet.EnableControls;
    Free;
    DisExec := False;
  end;

  FInvID := AID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.mdDetAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.mdDetAfterDelete') else _udebug := nil;{$ENDIF}

  if DisExec then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.FormActivate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.FormActivate') else _udebug := nil;{$ENDIF}

  if ShowWarning then begin
    Application.ProcessMessages;
    ssMessageDlg(rs('fmWaybill', 'NotRsvForWriteOff'), ssmtWarning, [ssmbOk]);
    ShowWarning := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.frDocGetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.frDocGetValue') else _udebug := nil;{$ENDIF}

  inherited;

  if 0 = AnsiCompareText(ParName, 'chairman') then ParValue := lcbChairman.EditingText
  else if 0 = AnsiCompareText(ParName, 'person1') then ParValue := lcbPerson1.EditingText
  else if 0 = AnsiCompareText(ParName, 'person2') then ParValue := lcbPerson2.EditingText
  else if 0 = AnsiCompareText(ParName, 'person3') then ParValue := lcbPerson3.EditingText
  else if 0 = AnsiCompareText(ParName, 'whouseout') then ParValue := lcbWHouseOut.Text;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.AddMats(const IDs: string);
  var
    FRsv, FMinPrice, FMaxPrice, FAvgPrice, FLastInPrice, FRemain, FRsv2, FPrice: Extended;
    i, FPTypeID: Integer;
    FWithNDS: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.AddMats') else _udebug := nil;{$ENDIF}

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
      FieldByName('amount').AsFloat := RoundToA(FieldByName('remain').AsFloat - FRsv, MatDisplayDigits);
      FieldByName('discount').AsFloat := 0;
      Post;

      Next;
    end;

    mdDet.LoadFromDataSet(Fields[0].DataSet);
    Close;
    lcbWHouseOut.KeyValue := mdDet.FieldByName('wid').AsInteger;

    mdDet.First;
    for i := 0 to mdDet.RecordCount - 1 do begin
      {mdRsv.Open;
      mdRsv.Append;
      mdRsv.FieldByName('posid').AsInteger := -mdDet.FieldByName('posid').AsInteger;
      mdRsv.FieldByName('pricein').AsFloat := StrToFloat(mdDet.FieldByName('price').AsString);
      mdRsv.FieldByName('amount').AsFloat := StrToFloat(mdDet.FieldByName('amount').AsString);
      mdRsv.Post;}

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
        mdDet.FieldByName('matid').AsInteger, mdDet.FieldByName('wid').AsInteger, 0,
        StrToFloat(mdTmpIds.FieldByName('amount').AsString));

      mdTmpIds.FieldByName('free').AsInteger := 0;
      mdTmpIds.FieldByName('forall').AsInteger := 0;
      mdTmpIds.Post;

      mdDet.Next;
    end;

    if dbgWaybillDet.FocusedNode <> nil
      then dbgWaybillDet.FocusedNode.Selected := True;

    //NoRsvConfirm := True;

  finally
    //NoRsvConfirm := False;
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.cdsWhouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.cdsWhouseBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWHouse.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.aCInsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.aCInsExecute') else _udebug := nil;{$ENDIF}

  case WBOutDefAction of
    aaMatList: aAddMatList.Execute;
    else aAddMat.Execute;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.aAddMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.aAddMatExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditPositionMov.Create(nil) do
  try
    ParentNameEx := Self.ParentNameEx;
    ParentHandle := Self.Handle;
    Tag := Integer(mdDet);
    OnDate := Self.OnDate;
    panMain.Tag := Integer(mdWMatTurn);
    stMeasureName.Tag := Integer(mdWMatTurnOld);
    stRemain.Tag := Integer(mdTmpIds);
    FWID := Self.FWID;
    FKAID := Self.FKAID;
    FDocType := Self.FDocType;
    ID := 0;
    Screen.Cursor := crDefault;

  finally
    if not mdDet.IsEmpty then begin
      dbgWaybillDet.Enabled := True;
      dbgWaybillDet.SetFocus;
    end;

    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.aAddMatListExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.aAddMatListExecute') else _udebug := nil;{$ENDIF}

  DocInfo.CurrName := BaseCurrShortName;
  DocInfo.CurrID := BaseCurrID;
  DocInfo.CurrRate := 1;
  DocInfo.KAID := 0;
  DocInfo.OnDate := edDate.Date;
  DocInfo.NDSPayer := cdsEnts.FieldByName('ndspayer').AsInteger = 1;

  if CurrEnt.NDSPayer
    then DocInfo.NDS := NDS
    else DocInfo.NDS := 0;

  DocInfo.PTypeID := GetDefPriceType;
  ShowModalWH(Self, MaxDateTime, 0, 4, lcbWHouseOut.KeyValue, Integer(@DocInfo));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditWriteOff.FillMatsFromWMat(DS: TDataSet);
  var
    FPosID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWriteOff.FillMatsFromWMat') else _udebug := nil;{$ENDIF}

  FShowRsvMsgs := False;

  try
    with mdDet do begin
      if not mdDet.Active then mdDet.Open;

      DS.DisableControls;
      DS.First;

      while not DS.Eof do begin
        FPosID := dsNextPosID(mdDet);
        Append;
        FieldByName('posid').AsInteger := FPosID;
        FieldByName('matid').AsInteger := DS.FieldByName('matid').AsInteger;
        FieldByName('postype').AsInteger := 0;
        FieldByName('status').AsInteger := 0;
        FieldByName('matname').AsString := DS.FieldByName('name').AsString;
        FieldByName('msrname').AsString := DS.FieldByName('msrname').AsString;
        FieldByName('artikul').AsString := DS.FieldByName('artikul').AsString;
        FieldByName('amount').AsFloat := DS.FieldByName('amount').AsFloat;

        {FieldByName('price').AsFloat := DS.FieldByName('price').AsFloat;
        FieldByName('fullprice').AsFloat := DS.FieldByName('fullprice').AsFloat;
        FieldByName('discount').AsFloat := DS.FieldByName('discount').AsFloat;
        if CurrEnt.NDSPayer
          then FieldByName('nds').AsFloat := NDS
          else FieldByName('nds').AsFloat := 0;
        }

        FieldByName('currid').AsInteger := BaseCurrID;
        FieldByName('wid').AsInteger := DS.FieldByName('wid').AsInteger;
        FieldByName('whname').AsString := DS.FieldByName('whname').AsString;
        FieldByName('currname').AsString := BaseCurrName;
        FieldByName('onvalue').AsFloat := 1;
        FieldByName('producer').AsString := DS.FieldByName('producer').AsString;
        FieldByName('barcode').AsString := DS.FieldByName('barcode').AsString;

        if DS.FieldByName('ptypeid').AsInteger > 0
          then FieldByName('ptypeid').AsInteger := DS.FieldByName('ptypeid').AsInteger;

        Post;

        DoSetRsv(FieldByName('posid').AsInteger, FieldByName('matid').AsInteger, FieldByName('wid').AsInteger, FieldByName('amount').AsFloat);

        DS.Next;
      end;
    end;

    DS.EnableControls;
    mdDet.EnableControls;
    dbgWaybillDet.Adjust(nil, [colPosType, colRecNo]);

    dbgWaybillDet.ClearSelection;

    if dbgWaybillDet.FocusedNode <> nil then dbgWaybillDet.FocusedNode.Selected := True;

  finally
    FShowRsvMsgs := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditWriteOff', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//=============================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
