{$I ok_sklad.inc}
unit EditWaybillMov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseWBDocOut, TB2Item, Menus, DB, dxmdaset, ActnList, prTypes,
  ssFormStorage, ImgList, xButton, ssPanel, ssGradientPanel, cxSpinEdit,
  cxTimeEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxContainer, cxEdit, cxCheckBox, dxDBGrid6, dxTL6, dxDBCtrl6, dxDBTLCl6,
  dxGrClms6, dxCntner6, ssDBGrid, ssBevel, StdCtrls, cxControls, cxGroupBox,
  ssGroupBox, ssSpeedButton, ExtCtrls, ssLabel, ssDBLookupCombo, DBClient,
  ssClientDataSet, Grids, DBGrids, ssBaseConst, ssMemDS, FR_DSet, FR_DBSet,
  FR_Class, cxPC, ssPageControl, cxCalc, ssCalcEdit, okSearchEdit;

type
  TfrmEditWaybillMov = class(TfrmBaseWBDocOut)
    //cdsPersonName: TssClientDataSet;
    //dsPersonName: TDataSource;
    aAddMat: TAction;
    aAddMatList: TAction;
    btnMiddlePerson: TssSpeedButton;
    btnPersonIn: TssSpeedButton;
    btnPersonOut: TssSpeedButton;
    btnWHouseIn: TssSpeedButton;
    btnWHouseOut: TssSpeedButton;
    cdsWhouse: TssClientDataSet;
    cdsWhouseADDR: TStringField;
    cdsWhouseDEF: TIntegerField;
    cdsWhouseDELETED: TIntegerField;
    cdsWhouseNAME: TStringField;
    cdsWhouseNOTES: TStringField;
    cdsWhouseWID: TIntegerField;
    dsWhouse: TDataSource;
    itmAddMatList: TTBItem;
    lcbMiddlePerson: TssDBLookupCombo;
    lcbPersonNameIn: TssDBLookupCombo;
    lcbPersonNameOut: TssDBLookupCombo;
    lcbWHouseIn: TssDBLookupCombo;
    lcbWHouseOut: TssDBLookupCombo;
    lMiddlePerson: TLabel;
    lPersonIn: TLabel;
    lPersonOut: TLabel;
    lWhouseIn: TssLabel;
    lWhouseOut: TssLabel;
    mnuAdd: TTBSubmenuItem;
    pmMatSvc: TTBPopupMenu;
    srcPersonNameIn: TDataSource;
    ssBevel1: TssBevel;
    TBItem19: TTBItem;
    TBItem1: TTBItem;
    TBItem6: TTBItem;

    procedure aAddMatExecute(Sender: TObject);
    procedure aAddMatListExecute(Sender: TObject);
    procedure aCInsExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCurActionExecute(Sender: TObject);
    procedure btnMiddlePersonClick(Sender: TObject);
    procedure btnPersonInClick(Sender: TObject);
    procedure btnPersonOutClick(Sender: TObject);
    procedure btnWHouseInClick(Sender: TObject);
    procedure btnWHouseOutClick(Sender: TObject);
    procedure cdsWhouseBeforeOpen(DataSet: TDataSet);
    procedure dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
    procedure FormCreate(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure lcbWHouseOutPropertiesChange(Sender: TObject);
    procedure lcbWHouseOutPropertiesEditValueChanged(Sender: TObject);

  private
    DocInfo: TokAddDocInfo;

    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure FillMatsFromWMat(DS: TDataSet);
    procedure WMDelete(var M: TMessage); message WM_DELETE;

  protected
    procedure SetID(const Value: integer); override;
    procedure UpdatePos; override;

  public
    procedure SetCaptions; override;
    procedure AddMats(const IDs: string); override;
  end;

var
  frmEditWaybillMov: TfrmEditWaybillMov;

implementation

uses 
  prConst, fMessageDlg, ssFun, ClientData, prFun,
  ssCallbackConst, ssBaseWBDocDlg, ssBaseWBDocDlgWithPayment, ssBaseDlg,
  EditPositionMov, udebug;

  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmEditWaybillMov.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.FormCreate') else _udebug := nil;{$ENDIF}


  inherited;
  FormStorage.IniFileName := MainRegKey;
  FormStorage.IniSection := Self.Name;
  FormStorage.Active := True;

  FDocType := dtWBMove;
  gbPayment.Hide;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.SetCaptions') else _udebug := nil;{$ENDIF}


  inherited;
  with LangMan do begin
    lWhouseOut.Caption := GetRS('fmWaybill','WHouseOut')+':';
    lWhouseIn.Caption := GetRS('fmWaybill','WHouseIn')+':';
    btnWHouseOut.Hint := GetRS('fmWaybill','WHouseRef');
    btnWHouseIn.Hint := GetRS('fmWaybill','WHouseRef');
    lMiddlePerson.Caption := GetRS('fmWaybill','RecvName')+':';
    btnMiddlePerson.Hint := GetRS('fmWaybill','aPersons');
    lPersonOut.Caption := GetRS('fmWaybill','PersonnameOut')+':';
    btnPersonOut.Hint := btnMiddlePerson.Hint;
    lPersonIn.Caption := GetRS('fmWaybill','PersonnameIn')+':';
    btnPersonIn.Hint := btnPersonOut.Hint;
    aAddMat.Caption := GetRS('fmWaybill', 'MatName');
    aAddMatList.Caption := GetRS('fmWaybill', 'AddMatList');
    mnuAdd.Caption := GetRS('Common', 'Add');
  end;//with

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.SetID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWaybillMov.SetID') else _udebug := nil;{$ENDIF}


  Screen.Cursor := crSQLWait;

  inherited;

  with lcbWHouseOut do begin
    Tag := 1;cdsWhouse.Open;KeyValue := 0;Text := '';Tag := 0;
  end;

  with lcbWHouseIn do begin
    Tag := 1;{cdsWHouseIn.Open;}KeyValue := 0;Text := '';Tag := 0;
  end;

  with lcbPersonNameOut do begin
    Tag := 1;cdsPersonName.Open;KeyValue := 0;Text := '';Tag := 0;
  end;

  with lcbMiddlePerson do begin
    Tag := 1;KeyValue := 0;Text := '';Tag := 0;
  end;

  with lcbPersonNameIn do begin
    Tag := 1;KeyValue := 0;Text := '';Tag := 0;
  end;

  //if IsPattern then ShowMessage('pattern');

  if Value > 0 then begin
    if not IsPattern
      then Self.Caption := rs('fmWaybill','TitleEditMov')
      else Self.Caption := rs('fmWaybill','TitleAddMov');

    if FKAID > 0 then begin
      lcbPersonNameOut.Tag := 1;
      lcbPersonNameOut.KeyValue := FKAID;
      FKAID := 0;
      lcbPersonNameOut.Tag := 0;
    end;

    if FPersonId > 0 then begin
      lcbPersonNameIn.Tag := 1;
      lcbPersonNameIn.KeyValue := FPersonId;
      lcbPersonNameIn.Tag := 0;
    end;

    with newDataSet do
    try
      //чтение складов из waybillmove
      ProviderName := 'pWayBillMove_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := Value;
      Open;
      if not IsEmpty then begin
        with lcbWHouseOut do begin
          Tag := 1; KeyValue := FieldByName('sourcewid').AsInteger; Tag := 0;
          FWID := KeyValue;
        end;

        with lcbWHouseIn do begin
          Tag := 1;KeyValue := FieldByName('destwid').AsInteger;Tag := 0;
        end;

        if not FieldByName('personid').IsNull then
          with lcbMiddlePerson do begin
           Tag := 1;KeyValue := FieldByName('personid').AsInteger;Tag := 0;
          end;
      end;//if not IsEmpty then begin
      Close;
    finally
      Free;
    end;
  end
  else Self.Caption := rs('fmWaybill','TitleAddMov');

  UpdateActions;
  FModified := False;
  FPosModified := False;
  Screen.Cursor := crDefault;

  if not GetUserAccessByClass(Self.ParentNameEx, uaPost) then begin
    chbPosting.Hint := rs('Common', 'noRights');
    chbPosting.Checked := False;
    chbPosting.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.lcbWHouseOutPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.lcbWHouseOutPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}


  with Sender as TssDBLookupCombo do
  if Tag=0 then begin
    if (Text <> '') and (lcbWHouseOut.KeyValue = lcbWHouseIn.KeyValue)
    then begin
      ssMessageDlg(rs('fmWaybill', 'SameWHErr'), ssmtError, [ssmbOK]);
      KeyValue := 0;
      Text := '';
    end
    else begin
      SelStart := 0;
      if Text = '' then KeyValue := 0;
    end;
    if (Sender = lcbWHouseOut) then FWID := KeyValue;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.aCurActionExecute(Sender: TObject);
  var
    aid:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.aCurActionExecute') else _udebug := nil;{$ENDIF}


  inherited;
  if FCurrCtrl = lcbWHouseIn then begin
    try aid := lcbWHouseIn.KeyValue; except aid := 0; end;
    ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate, aid);
  end else
  if FCurrCtrl = lcbWHouseOut then begin
    try aid := lcbWHouseOut.KeyValue; except aid := 0; end;
    ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate, aid);
  end else

  if FCurrCtrl = lcbMiddlePerson then begin
    try aid := lcbMiddlePerson.KeyValue; except aid := 0; end;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
  end else
  if FCurrCtrl = lcbPersonNameOut then begin
    try aid := lcbPersonNameOut.KeyValue; except aid := 0; end;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
  end else
  if FCurrCtrl = lcbPersonNameIn then begin
    try aid := lcbPersonNameIn.KeyValue; except aid := 0; end;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.btnWHouseOutClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.btnWHouseOutClick') else _udebug := nil;{$ENDIF}


  inherited;
  lcbWHouseOut.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.btnWHouseInClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.btnWHouseInClick') else _udebug := nil;{$ENDIF}


  inherited;
  lcbWHouseIn.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.WMRefresh') else _udebug := nil;{$ENDIF}


  inherited;
  if M.LParam = 9 then begin
    GetSummAll;
    dbgWaybillDet.ClearSelection;
    dbgWaybillDet.FocusedNode.Selected := True;
    DataModified(Self);
  end
  else
  case TRefType(M.LParam) of
    rtWMat:
      begin
        FillMatsFromWMat(TDataSet(M.WParam));
      end;

    rtPersons: begin
      cdsPersonName.DisableControls;
      DSRefresh(cdsPersonName, 'kaid', M.WParam);
      cdsPersonName.EnableControls;

      with lcbMiddlePerson do begin
        Tag := KeyValue; ReloadData; KeyValue := Tag;
        if Tag=0 then Text := '' else Tag := 0;
      end;
      with lcbPersonNameIn do begin
        Tag := KeyValue; ReloadData; KeyValue := Tag;
        if Tag=0 then Text := '' else Tag := 0;
      end;
      with lcbPersonNameOut do begin
        Tag := KeyValue; ReloadData; KeyValue := Tag;
        if Tag=0 then Text := '' else Tag := 0;
      end;


      if (FCurrCtrl = lcbMiddlePerson)
         or (FCurrCtrl = lcbPersonNameIn)
         or (FCurrCtrl = lcbPersonNameOut)
      then begin
        with (FCurrCtrl as TssDBLookupCombo) do begin
          Tag := 1; KeyValue := M.WParam; Tag := 0;
        end;
      end;
    end;//rtPersons:begin

    rtWHouse: begin
      cdsWhouse.DisableControls;
      DSRefresh(cdsWhouse,'wid',M.WParam);
      cdsWhouse.EnableControls;

      with lcbWHouseOut do begin
        Tag := KeyValue; ReloadData; KeyValue := Tag;
        if Tag=0 then Text := '' else Tag := 0;
      end;

      with lcbWHouseIn do begin
        Tag := KeyValue; ReloadData; KeyValue := Tag;
        if Tag=0 then Text := '' else Tag := 0;
      end;
      if (FCurrCtrl=lcbWHouseIn)or(FCurrCtrl=lcbWHouseOut) then begin
        with (FCurrCtrl as TssDBLookupCombo) do begin
          Tag := 1; KeyValue := M.WParam; Tag := 0;
        end;
        lcbWHouseOutPropertiesEditValueChanged(FCurrCtrl);
      end;
    end;//rtWHouse
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.btnMiddlePersonClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.btnMiddlePersonClick') else _udebug := nil;{$ENDIF}


  inherited;
  lcbMiddlePerson.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.btnPersonOutClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.btnPersonOutClick') else _udebug := nil;{$ENDIF}


  inherited;
  lcbPersonNameOut.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.btnPersonInClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.btnPersonInClick') else _udebug := nil;{$ENDIF}


  inherited;
  lcbPersonNameIn.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.lcbWHouseOutPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.lcbWHouseOutPropertiesChange') else _udebug := nil;{$ENDIF}


  inherited;
  if (Sender as TssDBLookupCombo).Text='' then (Sender as TssDBLookupCombo).KeyValue := -1;
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.WMDelete(var M: TMessage);
  var
    FtmpCtrl:TControl;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.WMDelete') else _udebug := nil;{$ENDIF}


  case TRefType(M.LParam) of
    rtWHouse,rtPersons:begin
      FtmpCtrl := FCurrCtrl;
      FCurrCtrl := nil;
      SendMessage(Self.Handle,WM_REFRESH,0,integer(TRefType(M.LParam)));
      FCurrCtrl := FtmpCtrl;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.ActionListUpdate') else _udebug := nil;{$ENDIF}


  inherited;
  lcbWHouseOut.Enabled := mdDet.IsEmpty;
  btnWHouseOut.Enabled := lcbWHouseOut.Enabled;

  aOk.Enabled := (trim(edNum1.Text) <> '') and(edDate.Text<>'')
     and(lcbWHouseOut.Text<>'')and(lcbWHouseIn.Text<>'')
     and(lcbWHouseOut.KeyValue<>lcbWHouseIn.KeyValue)
     and(not mdDet.IsEmpty) and ((chbPosting.Checked and not FNotRsvPresent)
     or not chbPosting.Checked);

  aApply.Enabled := aOk.Enabled and (FModified or FPosModified);
  aCIns.Enabled := (lcbWHouseOut.Text<>'');
  aCDel.Enabled := (not mdDet.IsEmpty);
  aCUpd.Enabled := aCDel.Enabled;// and (dbgWaybillDet.SelectedCount = 1);
  mnuAdd.Enabled := aCIns.Enabled;
  //dbgWaybillDet.Enabled := (not mdDet.IsEmpty);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
    NewRecord: boolean;
    BM:TBookmark;
    tmpPosId:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.FormCloseQuery') else _udebug := nil;{$ENDIF}

  //inherited;

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;
    if not CheckDocDate(edDate.Date) then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    if (lcbWHouseOut.KeyValue = lcbWHouseIn.KeyValue) or
       (lcbWHouseOut.EditText = lcbWHouseIn.EditText)
    then begin
      ssMessageDlg(rs('fmWaybill', 'SameWHErr'), ssmtError,[ssmbOK]);
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if CheckDatesIn then begin
      with newDataSet do begin
        try
          TrStart;
          try
            Screen.Cursor := crSQLWait;
            NewRecord := (ID=0) or (IsPattern);

            if NewRecord then begin
              FID := GetMaxID(dmData.SConnection,'waybilllist','wbillid');
              ProviderName := 'pWaybill_Ins'
            end
            else ProviderName := 'pWaybill_Upd';

            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Params.ParamByName('NUM').AsString := edNum1.Text;

            if edNum1.Tag > 0
              then Params.ParamByName('DEFNUM').AsInteger := edNum1.Tag
              else Params.ParamByName('DEFNUM').AsInteger := GetNextDefNum(dmData.SConnection,4);

            Params.ParamByName('ONDATE').AsDateTime := edDate.Date+edTime.Time;

            if lcbPersonNameOut.EditText='' then begin
              Params.ParamByName('KAID').DataType := ftInteger;
              Params.ParamByName('KAID').Clear;
            end
            else Params.ParamByName('KAID').AsInteger := lcbPersonNameOut.KeyValue;

            Params.ParamByName('CURRID').DataType := ftInteger;
            Params.ParamByName('CURRID').Clear;
            Params.ParamByName('ATTNUM').DataType := ftString;
            Params.ParamByName('ATTNUM').Clear;
            Params.ParamByName('ATTDATE').DataType := ftDateTime;
            Params.ParamByName('ATTDATE').Clear;

            if trim(edReason.Text)='' then begin
              Params.ParamByName('REASON').DataType := ftString;
              Params.ParamByName('REASON').Clear;
            end else Params.ParamByName('REASON').AsString := edReason.Text;

            if Trim(edNotes.Text)='' then begin
              Params.ParamByName('notes').DataType := ftString;
              Params.ParamByName('notes').Clear;
            end else Params.ParamByName('notes').AsString := edNotes.Text;

            if lcbPersonNameIn.EditText='' then begin
              Params.ParamByName('PERSONID').DataType := ftInteger;
              Params.ParamByName('PERSONID').Clear;
            end else Params.ParamByName('PERSONID').AsInteger := lcbPersonNameIn.KeyValue;

            Params.ParamByName('CHECKED').AsInteger := Integer(chbPosting.Checked);
            Params.ParamByName('WTYPE').AsInteger := 4;//тип накладной 4-перемещение
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
            Params.ParamByName('destwid').AsInteger := lcbWHouseIn.KeyValue;

            if lcbMiddlePerson.EditText = '' then begin
              Params.ParamByName('personid').DataType := ftInteger;
              Params.ParamByName('personid').Clear;
            end else Params.ParamByName('personid').AsInteger := lcbMiddlePerson.KeyValue;

            Execute;// Записали в WAYBILLMOVE
            // 1 )Удаляем из оборотов
            ProviderName := 'pWMatTurn_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Execute;  //Удалили из wmatturn

            if FPosModified then begin // Запись позиций в накладную
              // 2 Удаляем позиции
              ProviderName := 'pWaybillDet_Del';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := FID;
              Execute;

              // 3 Запись позиций из mdDet в waybilldet
              BM := mdDet.GetBookmark;
              mdDet.DisableControls;
              mdDet.First;
              while not mdDet.Eof do begin
                ProviderName := 'pWaybillDet_Ins';
                FetchParams;
                tmpPosId := GetMaxID(dmData.SConnection,'waybilldet','posid');

                if tmpPosId < 0 then raise Exception.Create(rs('fmWaybill','ErrorAddPos'));

                Params.ParamByName('POSID').AsInteger := tmpPosId;

                //3.1 Ставим реальные Sourceid для оборотов
                mdWMatTurn.First;
                while not mdWMatTurn.Eof do begin
                  if mdWMatTurn.FieldByName('sourceid').AsInteger = mdDet.fieldbyname('posid').AsInteger then begin
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

                Params.ParamByName('onvalue').AsFloat := mdDet.FieldByName('onvalue').AsFloat;

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
                Execute; //Записываем очередную позицию
                SaveSerial(tmpPosID);

                if (mdDet.FieldByName('producer').AsString <> '') or
                   (mdDet.FieldByName('certnum').AsString <> '') or
                   (mdDet.FieldByName('gtd').AsString <> '') or
                   (mdDet.FieldByName('certdate').AsDateTime <> 0)
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
              FPosModified := false; //Сбрасываем флаг изменения позиций
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
            end;//while

            if chbPosting.Checked then begin//Если документ проведён дублируем позиции для склада получателя
              //2)Запись в обороты
              ProviderName := 'pWMatTurnOut_Ins';
              mdWMatTurn.First;
              while not mdWMatTurn.Eof do begin
                FetchParams;
                Params.ParamByName('PosID').AsInteger := mdWMatTurn.fieldbyname('SOURCEID').AsInteger;//mdWMatTurn.fieldbyname('posid').AsInteger;
                Params.ParamByName('SOURCEID').AsInteger := mdWMatTurn.fieldbyname('SOURCEID').AsInteger;
                Params.ParamByName('MatID').AsInteger := mdWMatTurn.fieldbyname('matid').AsInteger;
                Params.ParamByName('WID').AsInteger := lcbWHouseIn.KeyValue;//mdWMatTurn.fieldbyname('wid').AsInteger;
                Params.ParamByName('TurnType').AsInteger := 1;
                Params.ParamByName('OnDate').AsDateTime := edDate.Date+edTime.Time;
                Params.ParamByName('Amount').AsFloat := RoundToA(strtofloat(mdWMatTurn.fieldbyname('amount').AsString),MatDisplayDigits);
                Execute;
                mdWMatTurn.Next;
              end;//while
            end;//if

           FModified := False;//флаг изменения документа false
           TrCommit;
           dmData.SConnection.AppServer.Rsv_Delete(-1);
            if (ModalResult=mrYes) then//Если применить
              if NewRecord then begin
                mdDet.Close;
                mdTmpIds.Close;
                mdWMatTurn.Close;
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
            else CanClose := True;

            FGridRefresh := true;
            if not WHMode then begin
              SendMessage(MainHandle, WM_REFRESH, ID, 0);
              RefreshFun('TfmWMat', 0);
            end
            else begin
              SendMessage(MainHandle, WM_REFRESH, 0, 0);
              RefreshFun('TfmWaybillMov', 0);
            end;

            if Logging then RefreshLog;

            if RefreshAllClients then begin
  //dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBOUT);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
  //dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
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
    end;//if CheckDatesIn then begin
  end
  else begin
    if GetDocNum(dmData.SConnection, FDocType, 0) = FCurrNum
      then GetDocNum(dmData.SConnection, FDocType, -1);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.frDocGetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.frDocGetValue') else _udebug := nil;{$ENDIF}


  inherited;
  if 0 = AnsiCompareText(ParName, 'whousein') then ParValue := lcbWHouseIn.Text
  else if 0 = AnsiCompareText(ParName, 'whouseout') then ParValue := lcbWHouseOut.Text
  else if 0 = AnsiCompareText(ParName, 'personin') then ParValue := lcbPersonNameIn.Text
  else if 0 = AnsiCompareText(ParName, 'personout') then ParValue := lcbPersonNameOut.Text;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.AddMats(const IDs: string);
  var
    FRsv, FMinPrice, FMaxPrice, FAvgPrice, FLastInPrice, FRemain, FRsv2, FPrice: Extended;
    i, FPTypeID: Integer;
    FWithNDS: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.AddMats') else _udebug := nil;{$ENDIF}
   
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

//==============================================================================================
procedure TfrmEditWaybillMov.dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.dbgWaybillDetKeyPress') else _udebug := nil;{$ENDIF}

  if (Key = #13) then
    if btnOk.Enabled
      then btnOk.SetFocus
      else btnCancel.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.cdsWhouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.cdsWhouseBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWhouse.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.aCInsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.aCInsExecute') else _udebug := nil;{$ENDIF}

  case WBOutDefAction of
    aaMatList: aAddMatList.Execute;
    else aAddMat.Execute;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.aAddMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.aAddMatExecute') else _udebug := nil;{$ENDIF}

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

//==============================================================================================
procedure TfrmEditWaybillMov.aAddMatListExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.aAddMatListExecute') else _udebug := nil;{$ENDIF}

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
  ShowModalWH(Self, MaxDateTime, 0, 5, lcbWHouseOut.KeyValue, Integer(@DocInfo));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.FillMatsFromWMat(DS: TDataSet);
 var
   FPosID: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.FillMatsFromWMat') else _udebug := nil;{$ENDIF}

  FShowRsvMsgs := False;

  try
    with mdDet do begin
      if not mdDet.Active then mdDet.Open;
      DS.DisableControls;
      //mdDet.DisableControls;
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

        {
        FieldByName('price').AsFloat := DS.FieldByName('price').AsFloat;
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

        DoSetRsv(FieldByName('posid').AsInteger, FieldByName('matid').AsInteger,
          FieldByName('wid').AsInteger, FieldByName('amount').AsFloat);
        DS.Next;
      end;
    end;

    DS.EnableControls;
    mdDet.EnableControls;
    dbgWaybillDet.Adjust(nil, [colPosType, colRecNo]);

    dbgWaybillDet.ClearSelection;

    if dbgWaybillDet.FocusedNode <> nil
      then dbgWaybillDet.FocusedNode.Selected := True;

  finally
    FShowRsvMsgs := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillMov.UpdatePos;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWaybillMov.UpdatePos') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditWaybillMov.FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
begin
  inherited;
  MinHeight := 400;
  MinWidth := 700;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditWaybillMov', @Debugging, DEBUG_group_ID);{$ENDIF}
    
//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
