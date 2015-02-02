{$I ok_sklad.inc}
unit EditKAAccount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, StdCtrls, cxButtons,
  ssFormStorage, ActnList, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMemo, ssMemDS, ssBaseIntfDlg, ssBevel, ImgList, ssSpeedButton, ssPanel,
  ssGradientPanel, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxDBEdit, ssDBLookupCombo, DB,
  DBClient, ssClientDataSet, ssDBComboBox, xButton, ssBaseConst;

type
  TfrmEditKAAccount = class(TfrmBaseIntfDlg)
    FormStorage: TssFormStorage;
    panMain: TPanel;
    bvlMain: TssBevel;
    lAccount: TLabel;
    lType: TLabel;
    lBank: TLabel;
    txtBankName: TssBevel;
    lBankName: TLabel;
    edAccount: TcxTextEdit;
    lcbAccType: TssDBLookupCombo;
    cdsBanks: TssClientDataSet;
    srcBanks: TDataSource;
    lcbBank: TssDBComboBox;
    cdsAccType: TssClientDataSet;
    srcAccType: TDataSource;
    ssBevel4: TssBevel;
    lKAName: TLabel;
    imgKAgent: TImage;
    btnHelp: TssSpeedButton;
    btnLock: TssSpeedButton;
    btnBankRef: TssSpeedButton;
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cdsBanksAfterOpen(DataSet: TDataSet);
    procedure cdsAccTypeAfterOpen(DataSet: TDataSet);
    procedure btnLockClick(Sender: TObject);
    procedure btnBankRefClick(Sender: TObject);
    procedure lcbBankPropertiesEditValueChanged(Sender: TObject);
  private
    FOnDate: TDateTime;
    FModified: boolean;
    FSelfMode: Boolean;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure SetSelfMode(const Value: Boolean);
  protected
    FParentName: string;
    FID: integer;
    procedure SetID(const Value: integer); 
    procedure SetParentName(const Value: string);
    procedure SetOnDate(const Value: TDateTime);
    procedure DoCreate; override;
  public
    MainHandle: HWND;
    mdC: TssMemoryData;
    UseMemDS: boolean;
    PID: integer;
    property ParentNameEx: string read FParentName write SetParentName;
    property ID: integer read FID write SetID;
    property OnDate: TDateTime read FOnDate write SetOnDate;
    property SelfMode: Boolean read FSelfMode write SetSelfMode;
    procedure SetCaptions;
  end;

var
  frmEditKAAccount: TfrmEditKAAccount;

implementation

uses
  prConst, prFun, ClientData, prTypes, ssFun, udebug, xLngDefs;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmEditKAAccount.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAAccount.SetOnDate') else _udebug := nil;{$ENDIF}


  FOnDate := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAAccount.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAAccount.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAAccount.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAAccount.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    btnLock.Hint := rs('Common', 'Lock');
    btnHelp.Hint := rs('Common', 'Help');

    aOk.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aApply.Caption := GetRS('Common', 'Apply');

    lAccount.Caption := GetRS(ParentNameEx, 'Account') + ':';

    case CountryRules.AR of
      accRul_RU: lBank.Caption := rs(ParentNameEx, 'BIC');
      accRul_UA: lBank.Caption := rs(ParentNameEx, 'MFO');
      else lBank.Caption := rs(ParentNameEx, 'ABA');
    end;

    lBankName.Caption := GetRS(ParentNameEx, 'AccountBank') + ':';
    lType.Caption := GetRS(ParentNameEx, 'AccountType') + ':';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAAccount.DoCreate;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAAccount.DoCreate') else _udebug := nil;{$ENDIF}

  inherited;

  FormStorage.IniFileName := PrRegKey;
  FormStorage.IniSection := Self.Name;
  FormStorage.Active := True;

  SetCaptions;

  //SetStyle(Self, IStyle);

  dmData.Images.GetBitmap(18, imgKAgent.Picture.Bitmap);

  cdsBanks.Open;
  cdsAccType.Open;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAAccount.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAAccount.ActionListUpdate') else _udebug := nil;{$ENDIF}


     aOk.Enabled := (Trim(edAccount.Text)<>EmptyStr) and (lcbBank.EditText<>'') and (lcbAccType.KeyValue>0) and FModified;
     aApply.Enabled := aOk.Enabled and FModified and (ID=0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAAccount.SetID(const Value: integer);
  var
    tmpid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditKAAccount.SetID') else _udebug := nil;{$ENDIF}

  FID := Value;

  if Value <> 0 then begin
    panTitleBar.Caption := rs(ParentNameEx, 'AccountEdit');
    aApply.Enabled := False;
  end
  else panTitleBar.Caption := rs(ParentNameEx, 'AccountAdd');

  if Value <> 0 then begin
    with newDataSet do
    try
      if SelfMode
        then ProviderName := 'pEntAccounts_GetEx'
        else ProviderName := 'pAgentAccount_GetEx';

      FetchParams;
      Params.ParamByName('accid').AsInteger := Value;
      Open;

      edAccount.Text := fieldbyname('accnum').AsString;
      lcbAccType.KeyValue := fieldbyname('typeid').AsInteger;
      tmpid := fieldbyname('bankid').AsInteger;
      lcbBank.EditValue := tmpid;
      txtBankName.Caption := FieldByName('name').AsString;

      Close;

      FModified := False;

    finally
      Free;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAAccount.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAAccount.DataModified') else _udebug := nil;{$ENDIF}


     FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAAccount.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
 Maxx: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAAccount.FormCloseQuery') else _udebug := nil;{$ENDIF}


  if ModalResult in [mrYes, mrOK] then begin
    CanClose := False;

    with newDataSet do
    try
      if ID = 0
      then if SelfMode
        then Maxx := GetMaxID(dmData.SConnection, 'entaccounts', 'accid')
        else Maxx := GetMaxID(dmData.SConnection, 'agentaccount', 'accid')
      else Maxx := ID;

      if SelfMode
        then if ID = 0
          then ProviderName := 'pEntAccounts_Ins'
          else ProviderName := 'pEntAccounts_Upd'
        else if ID = 0
          then ProviderName := 'pAgentAccount_Ins'
          else ProviderName := 'pAgentAccount_Upd';

      FetchParams;
      Params.ParamByName('accid').AsInteger := Maxx;
      Params.ParamByName('bankid').AsInteger := lcbBank.EditValue;

      if not SelfMode then Params.ParamByName('kaid').AsInteger := PID;

      Params.ParamByName('typeid').AsInteger := lcbAccType.KeyValue;

      if SelfMode
        then Params.ParamByName('num').AsString := edAccount.Text
        else Params.ParamByName('accnum').AsString := edAccount.Text;

      Execute;

      if SelfMode
        then SendMessage(MainHandle, WM_REFRESH, Maxx, 3)
        else SendMessage(MainHandle, WM_REFRESH, Maxx, 2);

    finally
      Free;
    end;

    if ModalResult = mrOk
    then CanClose := True
    else begin
      edAccount.Clear;
      edAccount.SetFocus;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAAccount.cdsBanksAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAAccount.cdsBanksAfterOpen') else _udebug := nil;{$ENDIF}

  cdsBanks.Locate('def', 1, []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAAccount.cdsAccTypeAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAAccount.cdsAccTypeAfterOpen') else _udebug := nil;{$ENDIF}

  cdsAccType.Locate('def', 1, []);
  lcbAccType.KeyValue := cdsAccType.fieldbyname('typeid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAAccount.btnLockClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAAccount.btnLockClick') else _udebug := nil;{$ENDIF}

  LockScreen;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAAccount.btnBankRefClick(Sender: TObject);
  var
    aid: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAAccount.btnBankRefClick') else _udebug := nil;{$ENDIF}

  try aid := cdsBanks.fieldbyname('bankid').AsInteger; except aid := 0; end;
  lcbBank.SetFocus;
  ShowModalRef(Self, rtBank, vtBank, 'TfmBank', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAAccount.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAAccount.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtBank:
      begin
        DSRefresh(cdsBanks, 'BankID', M.WParam);
        lcbBank.EditValue := M.WParam;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAAccount.SetSelfMode(const Value: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAAccount.SetSelfMode') else _udebug := nil;{$ENDIF}

  FSelfMode := Value;

  if Value then lKAName.Caption := EntName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAAccount.lcbBankPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAAccount.lcbBankPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if lcbBank.EditText<>''
  then begin
    if cdsBanks.Locate('bankid', lcbBank.EditValue, [])
      then txtBankName.Caption := ' ' + cdsBanks.fieldbyname('name').AsString;
  end
  else txtBankName.Caption := '';
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditKAAccount', @Debugging, DEBUG_group_ID);
  {$ENDIF}

finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
