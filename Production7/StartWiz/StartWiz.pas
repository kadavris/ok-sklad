{$I ok_sklad.inc}
unit StartWiz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ImgList, StdCtrls, ExtCtrls, DB, DBClient,
  cxContainer, cxEdit, cxLabel, cxTextEdit, cxButtons, cxControls, cxPC, cxLookAndFeelPainters,
  cxMemo, cxMaskEdit, cxDropDownEdit, cxButtonEdit, cxCheckBox, cxCalendar, cxRadioGroup,
  ssClientDataSet, ssBaseConst, ssSocketConnection, ssCheckBox, ssBaseWizard,
  ssDBLookupCombo, ssBevel, ssSpeedButton, ssPanel, ssGradientPanel,
  xButton, ComCtrls, MConnect, SConnect;

type
  TWizardType = (wtDB, wtNewDB, wtNewDBSimple, wtRegisterDB, wtCopyDB, wtStartSettings);

  TfrmStartWiz = class(TfrmBaseWizard)
    btnHelpEx2: TssSpeedButton;
    btnHelpEx: TssSpeedButton;
    btnLockEx2: TssSpeedButton;
    btnLockEx: TssSpeedButton;
    btnNewBank: TssSpeedButton;
    btnSendErrMessageEx2: TssSpeedButton;
    btnSendErrMessageEx: TssSpeedButton;
    cdsBank: TssClientDataSet;
    cdsBankBANKID: TIntegerField;
    cdsBankfullname: TStringField;
    cdsBankMFO: TStringField;
    cdsBankNAME: TStringField;
    chbCopy: TssCheckBox;
    chbDBDef: TcxCheckBox;
    chbMAccTypes: TssCheckBox;
    chbMBanks: TssCheckBox;
    chbMCashDesks: TssCheckBox;
    chbMChargeTypes: TssCheckBox;
    chbMCountries: TssCheckBox;
    chbMCurr: TssCheckBox;
    chbMKA: TssCheckBox;
    chbMKABal: TssCheckBox;
    chbMMat: TssCheckBox;
    chbMMeasures: TssCheckBox;
    chbMMoneyBal: TssCheckBox;
    chbMPTypes: TssCheckBox;
    chbMRemains: TssCheckBox;
    chbMServices: TssCheckBox;
    chbMTaxes: TssCheckBox;
    chbMWH: TssCheckBox;
    secondaryConn: TssSocketConnection;
    edBuh: TcxTextEdit;
    edCity: TcxTextEdit;
    edCountry: TcxTextEdit;
    edDBName: TcxTextEdit;
    edDBPath: TcxButtonEdit;
    edDir: TcxTextEdit;
    edDistrict: TcxTextEdit;
    edEMail: TcxTextEdit;
    edEntAccount: TcxTextEdit;
    edEntCertNum: TcxTextEdit;
    edEntINN: TcxTextEdit;
    edEntName: TcxTextEdit;
    edEntOKPO: TcxTextEdit;
    edEntPhone: TcxTextEdit;
    edFax: TcxTextEdit;
    edFullName: TcxTextEdit;
    edIndex: TcxTextEdit;
    edKPP: TcxTextEdit;
    edMDateRemains: TcxDateEdit;
    edMKABal: TcxDateEdit;
    edMMoneyBal: TcxDateEdit;
    edWWW: TcxTextEdit;
    imgHeader: TImage;
    imgLast: TImage;
    imgMain: TImage;
    lBuh: TLabel;
    lcbBank: TssDBLookupCombo;
    LCity: TLabel;
    lContactText: TLabel;
    lCountry: TLabel;
    lDBDefText: TcxLabel;
    lDBFinishText: TcxLabel;
    lDBFinishTextEx: TcxLabel;
    lDBName: TLabel;
    lDBPath: TLabel;
    lDBText: TcxLabel;
    lDir: TLabel;
    lDistrict: TLabel;
    lEMail: TLabel;
    lEnt: TLabel;
    lEntAccount: TLabel;
    lEntAddr: TLabel;
    lEntBank: TLabel;
    lEntCertNum: TLabel;
    lEntINN: TLabel;
    lEntOKPO: TLabel;
    lEntPhone: TLabel;
    lFax: TLabel;
    lFinishText: TcxLabel;
    lFinishWork: TLabel;
    lFullName: TLabel;
    lHeaderBold: TLabel;
    lHeaderNormal: TLabel;
    lIndex: TLabel;
    lKPP: TLabel;
    lMainInfo: TcxLabel;
    lMainNext: TLabel;
    lMaster: TLabel;
    lMasterR: TLabel;
    lPressFinish: TLabel;
    lProgressName: TcxLabel;
    lWelcome: TLabel;
    lWWW: TLabel;
    memEntAddr: TcxMemo;
    panFinish: TPanel;
    panMainInfo: TPanel;
    pbMain: TProgressBar;
    rbtMWBIn: TcxRadioButton;
    rbtMWBRest: TcxRadioButton;
    rbtnNDSNotPayer: TcxRadioButton;
    rbtnNDSPayer: TcxRadioButton;
    sbAddToFull: TssSpeedButton;
    srcBank: TDataSource;
    tsAddr: TcxTabSheet;
    tsContacts: TcxTabSheet;
    tsDB: TcxTabSheet;
    tsDBFinish: TcxTabSheet;
    tsEnt: TcxTabSheet;
    tsLast: TcxTabSheet;
    tsMoveData: TcxTabSheet;
    tsMoveDataExec: TcxTabSheet;
    tsNDSPayer: TcxTabSheet;
    tsRekv: TcxTabSheet;
    chbWebStores: TssCheckBox;
    rgDB: TRadioGroup;
    cbDB: TcxComboBox;
    lMoveDBTo: TLabel;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aNextExecute(Sender: TObject);
    procedure aPriorExecute(Sender: TObject);
    procedure btnNewBankClick(Sender: TObject);
    procedure cbDBPropertiesInitPopup(Sender: TObject);
    procedure cdsBankBeforeOpen(DataSet: TDataSet);
    procedure cdsBankCalcFields(DataSet: TDataSet);
    procedure chbCopyClick(Sender: TObject);
    procedure edDBPathPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edDBPathPropertiesEditValueChanged(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure GoNext(Sender: TObject; var Key: Char);
    procedure pcMainChange(Sender: TObject);
    procedure rbtnNDSPayerClick(Sender: TObject);
    procedure sbAddToFullClick(Sender: TObject);
    procedure tsMoveDataShow(Sender: TObject);
    procedure rgDBClick(Sender: TObject);

  private
    FWizType: TWizardType;
    FSConn: TssSocketConnection;
    FDBPathChanged: boolean;
    DBExists: Boolean;
    CurrDBName: string;

    function  CreateDB: boolean;
    function  DatesAreCorrect: Boolean;
    function  SaveParams: boolean;
    procedure DoMoveData;
    procedure SetCaptions; override;
    procedure SetSConn(const Value: TssSocketConnection);
    procedure SetWizType(const Value: TWizardType);
    procedure UpdateMoveState;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  public
    NeedClose: Boolean;
    NeedReconnect: Boolean;
    FnewDBID: Integer;

    property WizType: TWizardType read FWizType write SetWizType;
    property defaultConn: TssSocketConnection read FSConn write SetSConn;
  end;

var
  frmStartWiz: TfrmStartWiz;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ClientData, EditBank, prTypes, prFun, ssFun, ssDateUtils, fMessageDlg, Udebug, Protection, xLngDefs;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmStartWiz.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    lFinishWork.Caption := GetRS(Self.Name, 'FinishWork');
    lFinishText.Caption := GetRS(Self.Name, 'FinishText');

    case FWizType of
      wtDB: // used in cases where user should choose to create new DB or to register existing one
        begin
          Self.Caption := GetRS(Self.Name, 'DBTitleCommon');
          lMaster.Caption := GetRS(Self.Name, 'DBTitleCommon');
          lMainInfo.Caption := GetRS(Self.Name, 'DBMainInfoCommon');
        end;

      wtNewDB:
        begin
          Self.Caption := GetRS(Self.Name, 'DBTitle');
          lMaster.Caption := GetRS(Self.Name, 'DBTitle');
          lMainInfo.Caption := GetRS(Self.Name, 'DBMainInfo');
          lMasterR.Caption := GetRS(Self.Name, 'DbMasterR');
        end;

      wtNewDBSimple:
        begin
          Self.Caption := GetRS(Self.Name, 'DBTitle');
          lMaster.Caption := GetRS(Self.Name, 'DBTitle');
          lMainInfo.Caption := GetRS(Self.Name, 'DBMainInfoSimple');
          lMasterR.Caption := GetRS(Self.Name, 'DBMasterR');
          lFinishText.Caption := GetRS(Self.Name, 'DBFinishText');
        end;

      wtRegisterDB:
        begin
          Self.Caption := GetRS(Self.Name, 'DBTitleReg');
          lMaster.Caption := GetRS(Self.Name, 'DBTitleReg');
          lMainInfo.Caption := GetRS(Self.Name, 'DBMainInfoReg');
          lMasterR.Caption := GetRS(Self.Name, 'DBTitleReg');
          lFinishText.Caption := GetRS(Self.Name, 'DBFinishTextReg');
        end;

      wtCopyDB:
        begin
          Self.Caption := GetRS(Self.Name, 'DBTitle');
          lMaster.Caption := GetRS(Self.Name, 'DBTitle');
          lMainInfo.Caption := GetRS(Self.Name, 'DBMainInfoCopy');
          lMainNext.Top := lMainNext.Top + 50;
          lMainInfo.Height := lMainInfo.Height + 50;
          lMasterR.Caption := GetRS(Self.Name, 'DBMasterR');
          lFinishText.Caption := GetRS(Self.Name, 'DBFinishText');
        end;

      wtStartSettings:
        begin
          Self.Caption := GetRS(Self.Name, 'Title');
          lMaster.Caption := GetRS(Self.Name, 'Title');
          lMainInfo.Caption := GetRS(Self.Name, 'MainInfo');
          lMasterR.Caption := GetRS(Self.Name, 'MasterR');
        end;
    end;

    btnLockEx.Hint := rs('Common', 'Lock');
    btnHelpEx.Hint := rs('Common', 'Help');
    btnSendErrMessageEx.Hint := rs('Common', 'SendErrMessage');
    btnLockEx2.Hint := rs('Common', 'Lock');
    btnHelpEx2.Hint := rs('Common', 'Help');
    btnSendErrMessageEx2.Hint := rs('Common', 'SendErrMessage');

    aPrior.Caption := '< ' + GetRS('Common', 'Prior');
    aNext.Caption := GetRS('Common', 'Next') + ' >';
    aCancel.Caption := GetRS('Common', 'Cancel');

    lWelcome.Caption := GetRS(Self.Name, 'Welcome');
    lMainNext.Caption := GetRS(Self.Name, 'MainNext');

    lPressFinish.Caption := GetRS(Self.Name, 'PressFinish');

    lEnt.Caption := GetRS(Self.Name, 'Name') + ':';
    lEntAddr.Caption := GetRS(Self.Name, 'Addr') + ':';
    lEntPhone.Caption := GetRS(Self.Name, 'Phone') + ':';

    lContactText.Caption := GetRS(Self.Name, 'ContactText');
    lDir.Caption := GetRS(Self.Name, 'Dir') + ':';
    lBuh.Caption := GetRS(Self.Name, 'Buh') + ':';

    lEmail.Caption := GetRS('fmKAgent', 'EMail') + ':';
    lWWW.Caption := GetRS('fmKAgent', 'WWW') + ':';
    lFax.Caption := GetRS('fmKAgent', 'Fax') + ':';
    lCity.Caption := GetRS('fmKAgent', 'City') + ':';
    lDistrict.Caption := GetRS('fmKAgent', 'District') + ':';
    lCountry.Caption := GetRS('fmKAgent', 'Country') + ':';
    lIndex.Caption := GetRS('fmKAgent', 'PostIndex') + ':';
    lFullName.Caption := GetRS('fmKAgent', 'FullName') + ':';

    lEntAccount.Caption := GetRS(Self.Name, 'Account') + ':';
    lEntBank.Caption := GetRS(Self.Name, 'Bank') + ':';
    lEntOKPO.Caption := GetRS(Self.Name, 'OKPO') + ':';
    lKPP.Caption := GetRS(Self.Name, 'KPP') + ':';

    rbtnNDSPayer.Caption := GetRS(Self.Name, 'EntNDSPayer');
    rbtnNDSNotPayer.Caption := GetRS(Self.Name, 'EntNDSNotPayer');
    lEntINN.Caption := GetRS(Self.Name, 'INN') + ':';
    lEntCertNum.Caption := GetRS(Self.Name, 'CertNum') + ':';

    lDBText.Caption := GetRS(Self.Name, 'DBText');
    lDBName.Caption := GetRS(Self.Name, 'DBName') + ':';
    lDBPath.Caption := GetRS(Self.Name, 'DBPath') + ':';
    lDBDefText.Caption := GetRS(Self.Name, 'DBDefText');

    lDBFinishText.Caption := GetRS(Self.Name, 'DBFinishText');
    lDBFinishTextEx.Caption := GetRS(Self.Name, 'DBFinishTextEx');

    chbMMat.Properties.Caption := GetRS('frmStartWiz', 'Materials');
    chbMCurr.Properties.Caption := GetRS('frmStartWiz', 'Currencies');
    chbMTaxes.Properties.Caption := GetRS('frmStartWiz', 'Taxes');
    chbMMeasures.Properties.Caption := GetRS('frmStartWiz', 'Measures');
    chbMCountries.Properties.Caption := GetRS('frmStartWiz', 'Countries');
    chbMPTypes.Properties.Caption := GetRS('frmStartWiz', 'PriceTypes');
    chbMChargeTypes.Properties.Caption := GetRS('frmStartWiz', 'ChargeTypes');
    chbMKA.Properties.Caption := GetRS('frmStartWiz', 'KA');
    chbMWH.Properties.Caption := GetRS('frmStartWiz', 'WH');
    chbMServices.Properties.Caption := GetRS('frmStartWiz', 'Services');
    chbMBanks.Properties.Caption := GetRS('frmStartWiz', 'Banks');
    chbMCashDesks.Properties.Caption := GetRS('frmStartWiz', 'CashDesks');
    chbMAccTypes.Properties.Caption := GetRS('frmStartWiz', 'AccTypes');
    chbMRemains.Properties.Caption := GetRS('frmStartWiz', 'RemainsOn');
    chbMMoneyBal.Properties.Caption := GetRS('frmStartWiz', 'RemainsOn');
    chbMKABal.Properties.Caption := GetRS('frmStartWiz', 'BalancesOn');
    chbWebStores.Properties.Caption := GetRS('Common', 'WebShops');

    rbtMWBIn.Caption := GetRS('frmStartWiz', 'CreateWBIn');
    rbtMWBRest.Caption := GetRS('frmStartWiz', 'CreateWBRest');

    rgDB.Items[0] := GetRS('frmStartWiz', 'DBrg0');
    rgDB.Items[1] := GetRS('frmStartWiz', 'DBrg1');
    rgDB.Repaint;
  end;

  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  lMaster.Font.Name := Font_Main.Name;
  lMaster.Font.Charset := Font_Main.Charset;
  lWelcome.Font.Name := Font_Main.Name;
  lWelcome.Font.Charset := Font_Main.Charset;
  lHeaderBold.Font.Name := Font_Main.Name;
  lHeaderBold.Font.Color := clWhite;
  lHeaderBold.Font.Charset := Font_Main.Charset;
  lHeaderNormal.Font.Name := Font_Main.Name;
  lHeaderNormal.Font.Color := clWhite;
  lHeaderNormal.Font.Charset := Font_Main.Charset;
  lMasterR.Font.Name := Font_Main.Name;
  lMasterR.Font.Charset := Font_Main.Charset;
  lFinishWork.Font.Name := Font_Main.Name;
  lFinishWork.Font.Charset := Font_Main.Charset;

  pcMain.ActivePageIndex := 0;
  edMKABal.Date := Date;
  edMDateRemains.Date := Date;
  edMMoneyBal.Date := Date;

  rgDB.Visible := False;
  imgLast.Picture.Assign(imgMain.Picture);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.rbtnNDSPayerClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.rbtnNDSPayerClick') else _udebug := nil;{$ENDIF}

  lEntINN.Enabled := rbtnNDSPayer.Checked;
  lEntCertNum.Enabled := rbtnNDSPayer.Checked;
  edEntINN.Enabled := rbtnNDSPayer.Checked;
  edEntCertNum.Enabled := rbtnNDSPayer.Checked;

  if rbtnNDSPayer.Checked then begin
    edEntINN.Style.BorderColor := clBtnFace;
    edEntCertNum.Style.BorderColor := clBtnFace;
  end
  else begin
    edEntINN.Style.BorderColor := clBtnShadow;
    edEntCertNum.Style.BorderColor := clBtnShadow;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.btnNewBankClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.btnNewBankClick') else _udebug := nil;{$ENDIF}

  ShowModalRef(Self, rtBank, vtBank, 'TfmBank', Date, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.WMRefresh') else _udebug := nil;{$ENDIF}

  if M.LParam = Integer(rtBank) then begin
    DSRefresh(cdsBank, 'bankid', M.WParam);
    lcbBank.KeyValue := M.WParam;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.cdsBankCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.cdsBankCalcFields') else _udebug := nil;{$ENDIF}

  cdsBank.fieldbyname('fullname').AsString := '[' + cdsBank.fieldbyname('mfo').AsString + '] ' + cdsBank.fieldbyname('name').AsString;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmStartWiz.SaveParams: boolean;
  var
    FID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.SaveParams') else _udebug := nil;{$ENDIF}

  Result := False;
  Screen.Cursor := crSQLWait;

  with newDataSet(defaultConn) do
   try
     TrStart;

     try
       FID := GetMaxID(defaultConn, 'kagent', 'kaid');

       ProviderName := 'pKAgent_Ins';
       FetchParams;
       Params.ParamByName('KAID').AsInteger := FID;
       Params.ParamByName('ktype').AsInteger := 3;
       Params.ParamByName('kakind').AsInteger := 0;
       Params.ParamByName('Name').AsString := edEntName.Text;
       Params.ParamByName('birthdate').DataType := ftDateTime;
       Params.ParamByName('birthdate').Clear;
       Params.ParamByName('FullName').AsString := edFullName.Text;
       Params.ParamByName('INN').AsString := edEntINN.Text;
       Params.ParamByName('OKPO').AsString := edEntOKPO.Text;
       Params.ParamByName('kpp').AsString := edKPP.Text;
       Params.ParamByName('CertNum').AsString := edEntCertNum.Text;
       Params.ParamByName('Phone').AsString := edEntPhone.Text;
       Params.ParamByName('EMail').AsString := edEMail.Text;
       Params.ParamByName('WWW').AsString := Trim(edWWW.Text);
       Params.ParamByName('Fax').AsString := Trim(edFax.Text);
       Params.ParamByName('Address').AsString := memEntAddr.Text;
       Params.ParamByName('Country').AsString := Trim(edCountry.Text);
       Params.ParamByName('District').AsString := Trim(edDistrict.Text);
       Params.ParamByName('City').AsString := Trim(edCity.Text);
       Params.ParamByName('PostIndex').AsString := Trim(edIndex.Text);
       Params.ParamByName('Notes').AsString := '';
       Params.ParamByName('deleted').AsInteger := 0;
       Params.ParamByName('ndspayer').AsInteger := Integer(rbtnNDSPayer.Checked);
       Params.ParamByName('ptypeid').DataType := ftInteger;
       Params.ParamByName('ptypeid').Clear;
       Params.ParamByName('job').AsString := '';
       Params.ParamByName('jobtype').DataType := ftInteger;
       Params.ParamByName('jobtype').Clear;
       Execute;

       ProviderName := 'pKAAddr_Ins';
       FetchParams;
       Params.ParamByName('kaid').AsInteger := FID;
       Params.ParamByName('addrid').AsInteger := GetMaxID(defaultConn, 'kaaddr', 'addrid');
       Params.ParamByName('addrtype').AsInteger := 0;
       Params.ParamByName('Address').AsString := memEntAddr.Text;
       Params.ParamByName('Country').AsString := Trim(edCountry.Text);
       Params.ParamByName('District').AsString := Trim(edDistrict.Text);
       Params.ParamByName('City').AsString := Trim(edCity.Text);
       Params.ParamByName('PostIndex').AsString := Trim(edIndex.Text);
       Execute;

       ProviderName := 'pAgentPersons_Ins';
       FetchParams;
       Params.ParamByName('KAID').AsInteger := FID;

       if Trim(edDir.Name) <> '' then begin
         Params.ParamByName('PersonId').AsInteger := GetMaxID(defaultConn, 'agentpersons', 'personid');
         Params.ParamByName('Name').AsString := Trim(edDir.Text);
         Params.ParamByName('Phone').AsString := '';
         Params.ParamByName('Email').AsString := '';
         Params.ParamByName('Notes').AsString := '';
         Params.ParamByName('jobtype').AsInteger := 0;
         Params.ParamByName('Post').AsString := '';
         Execute;
       end;

       if Trim(edBuh.Name) <> '' then begin
         Params.ParamByName('PersonId').AsInteger := GetMaxID(defaultConn, 'agentpersons', 'personid');
         Params.ParamByName('Name').AsString := Trim(edBuh.Text);
         Params.ParamByName('Phone').AsString := '';
         Params.ParamByName('Email').AsString := '';
         Params.ParamByName('Notes').AsString := '';
         Params.ParamByName('jobtype').AsInteger := 1;
         Params.ParamByName('Post').AsString := '';
         Execute;
       end;

       if (Trim(edEntAccount.Text) <> '') and (lcbBank.KeyValue > 0) then begin
         ProviderName := 'pAgentAccount_Ins';
         FetchParams;
         Params.ParamByName('accid').AsInteger := GetMaxID(defaultConn, 'agentaccount', 'accid');
         Params.ParamByName('kaid').AsInteger := FID;
         Params.ParamByName('bankid').AsInteger := lcbBank.KeyValue;
         Params.ParamByName('typeid').AsInteger := 1;
         Params.ParamByName('accnum').AsString := Trim(edEntAccount.Text);
         Execute;
       end;

       if not TrCommit then Exit;

       MakeDefaultEnt(defaultConn, FID);
       DSRefresh(dmData.cdsEnt, 'kaid', 0);

       CurrEnt.KAID := FID;

       EntParamsLoaded := True;
       Result := True;

     except
       TrRollback;
     end;

   finally
     Free;
     Screen.Cursor := crDefault;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.pcMainChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.pcMainChange') else _udebug := nil;{$ENDIF}

  inherited;

  panHeader.Visible := (pcMain.ActivePageIndex > 0) and (pcMain.ActivePageIndex < pcMain.PageCount - 1);

  if pcMain.ActivePage = tsEnt then begin
    lHeaderBold.Caption := rs(Self.Name, 'EntNameAddr');
    lHeaderNormal.Caption := rs(Self.Name, 'EntNameCont');

  end
  else if pcMain.ActivePage = tsAddr then begin
    lHeaderBold.Caption := rs(Self.Name, 'EntAddr');
    lHeaderNormal.Caption := rs(Self.Name, 'EntAddrR');

  end
  else if pcMain.ActivePage = tsContacts then begin
    lHeaderBold.Caption := rs(Self.Name, 'EntContacts');
    lHeaderNormal.Caption := rs(Self.Name, 'EntContactsR');

  end
  else if pcMain.ActivePage = tsRekv then begin
    lHeaderBold.Caption := rs(Self.Name, 'Rekv');
    lHeaderNormal.Caption := rs(Self.Name, 'RekvEx');

    case CountryRules.AR of
      accRul_RU,
      accRul_UA: ;

      else begin
        lEntOKPO.Visible := False;
        edEntOKPO.Visible := False;
        lKPP.Visible := False;
        edKPP.Visible := False;
      end;
    end;

    if not defaultConn.Connected then begin
      Application.ProcessMessages;
      defaultConn.DBConnectAtOnce := True;
      sleep(1000);
      defaultConn.Open;
      cdsBank.RemoteServer := defaultConn;
    end;
    
    if not cdsBank.Active then cdsBank.Open;

  end
  else if pcMain.ActivePage = tsDB then begin
    lHeaderBold.Caption := rs(Self.Name, 'DBNamePath');
    lHeaderNormal.Caption := rs(Self.Name, 'DBNamePathEx');

    if not FDBPathChanged then begin
      edDBPath.Text := defaultConn.AppServer.GetDBFileName;
      FDBPathChanged := True;
    end;

  end
  else if pcMain.ActivePage = tsMoveDataExec then begin
    lHeaderBold.Caption := rs(Self.Name, 'ExecMoving');
    lHeaderNormal.Caption := '';

  end
  else if pcMain.ActivePage = tsDBFinish then begin
    lHeaderBold.Caption := rs(Self.Name, 'DBCreateSuccess');
    lHeaderNormal.Caption := rs(Self.Name, 'OkToSettings');

  end
  else if pcMain.ActivePage = tsMoveData then begin
    lHeaderBold.Caption := rs(Self.Name, 'DBMoveData');
    lHeaderNormal.Caption := rs(Self.Name, 'DBMoveDataEx');// + #10#13 + rs(Self.Name, 'DBMoveSkip');
    chbCopy.Properties.Caption := rs(Self.Name, 'DBMoveFrom');
    lMoveDBTo.Caption := rs(Self.Name, 'DBMoveTo', 1) + edDBName.Text;

  end
  else if pcMain.ActivePage = tsNDSPayer then begin
   lHeaderBold.Caption := rs(Self.Name, 'NDSPayer');
   lHeaderNormal.Caption := rs(Self.Name, 'IsNDSPayer');

  end;

  if (pcMain.ActivePage = tsNDSPayer) or (pcMain.ActivePage = tsDB)
    then aNext.Caption := rs('Common', 'Save')
    else if (pcMain.ActivePage = tsLast)
         then btnNext.Caption := rs('Common', 'Finish')
         else aNext.Caption := rs('Common', 'Next') + ' >';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.aPriorExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.aPriorExecute from ' + pcMain.ActivePage.Name) else _udebug := nil;{$ENDIF}

  try // finally
    if pcMain.ActivePage = tsEnt then begin
      tsMoveData.Show;
    end
    else inherited;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfrmStartWiz.aNextExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.aNextExecute from ' + pcMain.ActivePage.Name) else _udebug := nil;{$ENDIF}

  try // finally
    if pcMain.ActivePage = tsNDSPayer then begin
      {$IFDEF UDEBUG}_udebug.CheckPoint('tsNDSPayer');{$ENDIF}

      if SaveParams
        then tsLast.Show
        else ssMessageDlg(rs(Self.Name, 'SettingsError'), ssmtError, [ssmbOk])

    end

    else if pcMain.ActivePage = tsDB then begin // register/create DB
      if (trim(edDBName.EditingText) = '') or (trim(edDBPath.EditingText) = '') then begin
        ssMessageDlg(rs(Self.Name, 'error_DBFieldsEmpty'), ssmtError, [ssmbOK]);
        Exit;
      end;

      with newDataSet(defaultConn) do
      try
        // setting current/default DB
        ProviderName := 'pSysDB_List';
        Open;

        CurrDBName := '';
        if defaultConn.DBID <> -1
          then if Locate('dbid', defaultConn.DBID, []) then CurrDBName := FieldByName('desc').AsString;

        if CurrDBName = '' then if Locate('def', 1, []) then CurrDBName := FieldByName('desc').AsString;

        if CurrDBName = '' then begin
          ssMessageDlg(rs(Self.Name, 'error_noDefDB'), ssmtError, [ssmbOK]);
          debugInstantLog('! ERROR: TfrmStartWiz.aNextExecute: no default DB!');
          Exit;
        end;

        {$IFDEF UDEBUG}_udebug.CheckPoint('defDB');{$ENDIF}

        if Locate('desc', AnsiLowerCase(edDBName.Text), [loCaseInsensitive])
           and (mrYes <> ssMessageDlg(rs(Self.Name, 'error_DBNameAlreadyExists'), ssmtWarning, [ssmbYes, ssmbNo]))
        then Exit;

        Close;

        if CreateDB then begin
          {$IFDEF UDEBUG}_udebug.CheckPoint('createdb');{$ENDIF}

          case WizType of
            //wtCopyDB: tsMoveData.Show;
            wtNewDB, wtNewDBSimple: tsMoveData.Show;
            wtRegisterDB: tsLast.Show;
            else inherited;
          end; // case
        end
        else begin
          if DBExists then begin
            lDBFinishTextEx.Visible := False;
            ssMessageDlg(rs(Self.Name, 'error_DBNameAlreadyExists'), ssmtError, [ssmbOk]);
          end
          else if FWizType <> wtRegisterDB then ssMessageDlg(rs(Self.Name, 'error_CreateDBError'), ssmtError, [ssmbOk]);
        end;

      finally
        Free;
      end;
    end //if pcMain.ActivePage = tsDB

    else if pcMain.ActivePage = tsMoveData then begin
      if not chbCopy.Checked
        then tsEnt.Show
      else begin
        if not DatesAreCorrect then begin
          ssMessageDlg(rs('frmStartWiz', 'error_IncorrectDate'), ssmtError, [ssmbOk]);
          Exit;
        end;

        inherited;

        DoMoveData;
      end; // if not chbCopy.Checked
    end

    else if pcMain.ActivePage = tsDBFinish then begin
      if DBExists or (WizType = wtNewDBSimple)
        then tsLast.Show
        else inherited;
    end
    else inherited;

  finally
    {$IFDEF UDEBUG}
      _udebug.CheckPoint('transit to: ' + pcMain.ActivePage.Name);
      if _udebug <> nil then _udebug.Destroy;
    {$ENDIF}
  end;
end;

//==============================================================================================
procedure TfrmStartWiz.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if not allowALUpdate(200) then Exit;
  
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.ActionListUpdate') else _udebug := nil;{$ENDIF}

  try
    aCancel.Enabled := (pcMain.ActivePageIndex <> pcMain.PageCount - 1)
      and (pcMain.ActivePage <> tsMoveDataExec);

    aPrior.Enabled := aCancel.Enabled and (pcMain.ActivePageIndex <> 0)
      and (
        ((WizType in [wtNewDB, wtRegisterDB, wtCopyDB])
         and ((pcMain.ActivePage <> tsDBFinish) or (pcMain.ActivePage <> tsMoveData))
        )
        or not (WizType in [wtNewDB, wtRegisterDB, wtNewDBSimple, wtCopyDB])
      );

    aNext.Enabled := ((pcMain.ActivePage = tsDB) and (Trim(edDBName.Text) <> '') or (pcMain.ActivePage <> tsDB))
       and (pcMain.ActivePage <> tsMoveDataExec);

  except
    on e: exception do debugInstantLog('! ERROR: TfrmStartWiz.ActionListUpdate' + e.Message);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if (ModalResult = mrCancel) and not CancelPressed then begin
    CanClose := False;
  end
  else if (WizType in [wtNewDB, wtRegisterDB, wtNewDBSimple, wtCopyDB]) and NeedClose
       then if defaultConn.Connected then begin
         defaultConn.Close;
         sleep(1000);
       end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.SetWizType(const Value: TWizardType);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.SetWizType') else _udebug := nil;{$ENDIF}

  FWizType := Value;

  if FWizType = wtDB then begin
    btnNext.Enabled := False;
    lMainNext.Visible := False;
    rgDB.Visible := True;
    rgDB.Repaint;
    Application.ProcessMessages;
  end;

  SetCaptions;

  if FWizType in [wtDB, wtCopyDB, wtNewDB, wtNewDBSimple, wtRegisterDB] then begin
    tsDB.Tag := 0;  // clear skipping on "next" button
    tsDBFinish.Tag := 0;
  end
  else begin
    tsDB.Tag := 1;
    tsDBFinish.Tag := 1;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.edDBPathPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.edDBPathPropertiesButtonClick') else _udebug := nil;{$ENDIF}

  with TSaveDialog.Create(nil) do
  try
    DefaultExt := 'gdb';
    Filter := 'Firebird/Interbase Database|*.gdb;*.fdb' + rs('Common', 'AllFiles') + '|*.*';
    if Execute then edDBPath.Text := FileName;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmStartWiz.CreateDB: boolean;
  var
    Res: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.CreateDB') else _udebug := nil;{$ENDIF}

  Result := False;
  Screen.Cursor := crHourGlass;

  try
    if FWizType = wtRegisterDB
      then Res := 1
      else Res := defaultConn.AppServer.NewDB(trim(edDBPath.Text), '');

    if Res > 0 then begin
      DBExists := (Res = 2);

      if DBExists then begin
        ssMessageDlg(rs(Self.Name, 'error_DBFNF'), ssmtError, [ssmbOK]);
        Exit;
      end;

      FnewDBID := defaultConn.AppServer.AddDB(0, trim(edDBName.Text), Integer(chbDBDef.Checked), 1);

      if FnewDBID > 0 then begin
        if 0 = defaultConn.AppServer.AddDBParams(FnewDBID, 'PROVIDER=LCPI.IBProvider.1;User ID=SYSDBA;Password=masterkey;Persist Security Info=True;ctype=WIN1251;auto_commit=True;Data Source=' + trim(edDBPath.Text), 0)
        then begin
          Result := True;

          if NeedReconnect then begin
            defaultConn.DBID := FnewDBID;
            defaultConn.Open;
            defaultConn.DBConnected := True;
          end;

          SendMessage(ParentHandle, WM_Refresh, FnewDBID, 0);
        end;
      end;
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Screen.Cursor := crDefault;
  end;
end;

//==============================================================================================
procedure TfrmStartWiz.SetSConn(const Value: TssSocketConnection);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.SetSConn') else _udebug := nil;{$ENDIF}

  FSConn := Value;
  secondaryConn.Host := Value.Host;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.edDBPathPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.edDBPathPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  FDBPathChanged := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.GoNext(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.GoNext') else _udebug := nil;{$ENDIF}

  if NextCtrlOnEnter and (Key = #13) then begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.UpdateMoveState;
  var
    copyProds, doCopy, copyBusPartn, copyServices, copyCashDesks: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.UpdateMoveState') else _udebug := nil;{$ENDIF}

  doCopy := chbCopy.Checked;
  copyProds := chbMMat.Checked;
  copyBusPartn := chbMKA.Checked;
  copyServices := chbMServices.Checked;
  copyCashDesks := chbMCashDesks.Checked;

  chbMRemains.Enabled := copyProds and doCopy;
  chbMMat.Enabled := doCopy;
  chbMServices.Enabled := doCopy;
  chbMChargeTypes.Enabled := doCopy;
  chbMKA.Enabled := (not rbtMWBIn.Checked or not chbMRemains.Checked) and doCopy;
  chbMCashDesks.Enabled := doCopy;

  cbDB.Enabled := doCopy;
  if doCopy then cbDBPropertiesInitPopup(cbDB); // load DB list

  try
    chbWebStores.Enabled := doCopy and (0 < StrToInt(RegInfo.Values['webshops']));
  except
    chbWebStores.Enabled := False;
  end;

  if copyProds or copyServices then chbMMeasures.Checked := True;

  if copyProds or copyServices or copyCashDesks then chbMCurr.Checked := True;

  if copyProds then begin
    chbMWH.Checked := doCopy;
    chbMCountries.Checked := doCopy;
    chbMPTypes.Checked := doCopy;
    chbMTaxes.Checked := doCopy;
  end
  else begin
    chbMRemains.Checked := False;
  end;

  edMDateRemains.Enabled := doCopy and copyProds and chbMRemains.Checked;
  edMMoneyBal.Enabled := copyCashDesks and chbMMoneyBal.Checked and doCopy;
  chbMWH.Enabled := not copyProds and doCopy;
  chbMCurr.Enabled := (not copyProds and not copyServices and not copyCashDesks) and doCopy;
  chbMPTypes.Enabled := not copyProds and doCopy;
  chbMMeasures.Enabled := (not copyProds and not copyServices) and doCopy;
  chbMCountries.Enabled := not copyProds and doCopy;
  chbMTaxes.Enabled := not copyProds and doCopy;
  chbMMoneyBal.Enabled := copyCashDesks and doCopy;

  chbMAccTypes.Checked := doCopy;
  chbMAccTypes.Enabled := False;
  chbMBanks.Checked := doCopy;
  chbMBanks.Enabled := False;
  chbMKABal.Enabled := copyBusPartn and doCopy;

  if copyBusPartn
    then chbMBanks.Checked := doCopy
    else chbMKABal.Checked := False;

  edMKABal.Enabled := copyBusPartn and doCopy and chbMKABal.Checked;

  rbtMWBIn.Enabled := chbMRemains.Checked and doCopy;
  rbtMWBRest.Enabled := chbMRemains.Checked and doCopy;
  
  if rbtMWBIn.Checked and rbtMWBIn.Enabled then chbMKA.Checked := True;

  //chbMAccTypes.Enabled := not copyBusPartn and doCopy;
  //chbMBanks.Enabled := not copyBusPartn and doCopy;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.chbCopyClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.chbCopyClick') else _udebug := nil;{$ENDIF}

  UpdateMoveState;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.DoMoveData;
  var
    FMax: Integer;
    FDBFrom: Integer;
    FUser, FPass: string;
    Fsrc, FIns: TssClientDataSet;
    FOldOnValue, FSum, FPosSum, FPosNDS, FCurrSum: Extended;
    FOldKAID, FOldCurrID, FWBillID, FPosID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  //-------------------------------------------------------------------------------
  function DoProcessMove(ATables: string; AStepIt: Boolean = True; AType: Integer = 0; ADate: TDateTime = 0): Boolean;
    var FRes: string;
  begin
    Result := True;
    Application.ProcessMessages;

    FRes := defaultConn.AppServer.db_Copy(FDBFrom, FnewDBID, ATables, 1, AType, ADate);

    if FRes <> '' then begin
      ssMessageDlg(rs('frmStartWiz', 'MoveDataErr') + FRes, ssmtError, [ssmbOk]);
      Result := False;
    end;

    if AStepIt then pbMain.StepIt;
  end;

  //-------------------------------------------------------------------------------
begin
  if not chbCopy.Checked then begin
    tsLast.Show;
    Exit;
  end;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.DoMoveData') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  try // finally
    FDBFrom := Integer(cbDB.Properties.Items.Objects[cbDB.ItemIndex]);
    try
      defaultConn.DBID := FDBFrom;
      defaultConn.DBConnected := True;

      secondaryConn.DBID := FnewDBID;

    except
      on e: Exception do begin
        ssMessageDlg(rs('frmStartWiz', 'error_SrcDBConn') + e.Message, ssmtError, [ssmbOk]);
        Exit;
      end;
    end;
    Fsrc := newDataSet(defaultConn);

    FMax := 2 + Integer(chbMWH.Checked) + Integer(chbMMat.Checked)
      + Integer(chbMCurr.Checked) + Integer(chbMCountries.Checked)
      + Integer(chbMKA.Checked) + Integer(chbMMeasures.Checked)
      + Integer(chbMPTypes.Checked) + Integer(chbMTaxes.Checked)
      + Integer(chbMBanks.Checked) + Integer(chbMAccTypes.Checked)
      + Integer(chbMChargeTypes.Checked) + Integer(chbMServices.Checked)
      + Integer(chbMCashDesks.Checked) + Integer(chbMRemains.Checked)
      + Integer(chbWebStores.Checked);

    pbMain.Max := FMax;
    pbMain.Position := 0;

    if chbMWH.Checked then begin
      lProgressName.Caption := chbMWH.Properties.Caption;
      if not DoProcessMove('warehouse') then Exit;
    end;

    if chbMCountries.Checked then begin
      lProgressName.Caption := chbMCountries.Properties.Caption;
      if not DoProcessMove('countries') then Exit;
    end;

    if chbMMeasures.Checked then begin
      lProgressName.Caption := chbMMeasures.Properties.Caption;
      if not DoProcessMove('measures') then Exit;
    end;

    if chbMPTypes.Checked then begin
      lProgressName.Caption := chbMPTypes.Properties.Caption;
      if not DoProcessMove('pricetypes') then Exit;
    end;

    if chbMCurr.Checked then begin
      lProgressName.Caption := chbMCurr.Properties.Caption;
      if not DoProcessMove('currency,currencyrate') then Exit;
    end;

    if chbMTaxes.Checked then begin
      lProgressName.Caption := chbMTaxes.Properties.Caption;
      if not DoProcessMove('taxes') then Exit;
    end;

    if chbMMat.Checked then begin
      lProgressName.Caption := chbMMat.Properties.Caption;
      if not DoProcessMove('matgroup,materials,matchange,matprices,matgroupprices,matgrouptaxes') then Exit;
    end;

    if chbMBanks.Checked then begin
      lProgressName.Caption := chbMBanks.Properties.Caption;
      if not DoProcessMove('banks,bankspersons') then Exit;
    end;

    if chbMAccTypes.Checked then begin
      lProgressName.Caption := chbMAccTypes.Properties.Caption;
      if not DoProcessMove('accounttype') then Exit;
    end;

    if chbMKA.Checked then begin
      lProgressName.Caption := chbMKA.Properties.Caption;

      if chbMKABal.Checked then begin
        if not DoProcessMove('kagent', True, 1, edMKABal.Date) then Exit;
      end
      else if not DoProcessMove('kagent') then Exit;

      if not DoProcessMove('kaaddr,agentpersons,agentaccount,agentdoc,kadiscount', False) then Exit;

      if chbMMat.Checked then if not DoProcessMove('kamatdiscount,kamatgroupdiscount', False) then Exit;
    end;

    if chbMChargeTypes.Checked then begin
      lProgressName.Caption := chbMChargeTypes.Properties.Caption;
      if not DoProcessMove('chargetype') then Exit;
    end;

    if chbMServices.Checked then begin
      lProgressName.Caption := chbMServices.Properties.Caption;
      if not DoProcessMove('services') then Exit;
    end;

    //**********************************************************
    if chbMCashDesks.Checked then begin
      lProgressName.Caption := chbMCashDesks.Properties.Caption;

      if not DoProcessMove('cashdesks') then Exit;

      if chbMMoneyBal.Checked then begin
        with FSrc do
        try // finally
          ProviderName := 'pMoneySaldo_Get';
          FetchParams;
          Params.ParamByName('ondate').AsDateTime := edMMoneyBal.Date;
          Open;

          secondaryConn.Open;

          sleep(1000);

          FIns := newDataSet(secondaryConn);
          FIns.ProviderName := 'pPayDoc_MM_Ins';
          FIns.FetchParams;

          while not Eof do begin
            if (not FieldByName('cashid').IsNull or not FieldByName('accid').IsNull)
               and (FieldByName('saldo').AsCurrency <> 0)
            then begin
              FIns.Params.ParamByName('paydocid').AsInteger := GetMaxID(secondaryConn, 'paydoc', 'paydocid');
              FIns.Params.ParamByName('operid').AsInteger := GetMaxID(secondaryConn, 'paydoc', 'operid');
              FIns.Params.ParamByName('ondate').AsDateTime := edMMoneyBal.Date;
              FIns.Params.ParamByName('docnum').AsString := FIns.Params.ParamByName('paydocid').AsString;
              FIns.Params.ParamByName('kaid').DataType := ftInteger;
              FIns.Params.ParamByName('kaid').Clear;
              FIns.Params.ParamByName('checked').AsInteger := 1;
              FIns.Params.ParamByName('withnds').AsInteger := 1;
              FIns.Params.ParamByName('mpersonid').DataType := ftInteger;
              FIns.Params.ParamByName('mpersonid').Clear;
              FIns.Params.ParamByName('ctypeid').AsInteger := 1;
              FIns.Params.ParamByName('notes').AsString := '';
              FIns.Params.ParamByName('reason').AsString := '';
              FIns.Params.ParamByName('doctype').AsInteger := 6;
              FIns.Params.ParamByName('total').AsCurrency := FieldByName('saldo').AsCurrency;
              FIns.Params.ParamByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
              FIns.Params.ParamByName('ptypeid').AsInteger := FieldByName('saldotype').AsInteger + 1;
              FIns.Params.ParamByName('currid').AsInteger := FieldByName('currid').AsInteger;

              if FieldByName('saldotype').AsInteger = 0 then begin
                FIns.Params.ParamByName('accid').DataType := ftInteger;
                FIns.Params.ParamByName('accid').Clear;
                FIns.Params.ParamByName('cashid').AsInteger := FieldByName('cashid').AsInteger;
              end
              else begin
                FIns.Params.ParamByName('cashid').DataType := ftInteger;
                FIns.Params.ParamByName('cashid').Clear;
                FIns.Params.ParamByName('accid').AsInteger := FieldByName('accid').AsInteger;
              end;

              FIns.Execute;
            end;

            Next;
          end;
          Close;

        finally
          FIns.Free;
        end;
      end;
    end;

    //**********************************************************
    if chbMRemains.Checked then begin
      with Fsrc do
      try // finally
        ProviderName := 'pWMat_Get_All';
        FetchParams;
        Params.ParamByName('ondate').AsDateTime := lastSecondInDay(edMDateRemains.Date);
        Open;

        secondaryConn.Open;

        FIns := newDataSet(secondaryConn);

        FOldKAID := -1;
        FOldCurrID := -1;
        FOldOnValue := -1;
        FWBillID := 0;

        lProgressName.Caption := rs('frmStartWiz', 'MatRemains');

        Application.ProcessMessages;

        while not Eof do begin
          // adding new waybill if some attributes changed from last time
          if ((FieldByName('kaid').AsInteger <> FOldKAID) and rbtMWBIn.Checked)
             or (FieldByName('currid').AsInteger <> FOldCurrID) or (FieldByName('onvalue').AsFloat <> FOldOnValue)
          then begin
            FSum := 0;
            FCurrSum := 0;
            
            FIns.ProviderName := 'pWaybill_InsEx';
            FIns.FetchParams;

            FWBillID := GetMaxID(secondaryConn, 'waybilllist', 'wbillid');

            FIns.Params.ParamByName('wbillid').AsInteger := FWBillID;
            FIns.Params.ParamByName('num').AsString := IntToStr(FWBillID);
            FIns.Params.ParamByName('defnum').AsInteger := 0;
            FIns.Params.ParamByName('ondate').AsDateTime := edMDateRemains.Date;

            if not FieldByName('kaid').IsNull and rbtMWBIn.Checked then begin
              FIns.Params.ParamByName('kaid').AsInteger := FieldByName('kaid').AsInteger;
              FIns.Params.ParamByName('wtype').AsInteger := wbtWaybillIn;
            end
            else begin
              FIns.Params.ParamByName('kaid').DataType := ftInteger;
              FIns.Params.ParamByName('kaid').Clear;
              FIns.Params.ParamByName('wtype').AsInteger := wbtRest;
            end;

            FIns.Params.ParamByName('attnum').AsString := '';
            FIns.Params.ParamByName('attdate').DataType := ftDateTime;
            FIns.Params.ParamByName('attdate').Clear;
            FIns.Params.ParamByName('reason').AsString := '';
            FIns.Params.ParamByName('notes').AsString := rs(Self.Name, 'new_wb_note',1) + cbDB.EditText;
            FIns.Params.ParamByName('personid').DataType := ftInteger;
            FIns.Params.ParamByName('personid').Clear;
            FIns.Params.ParamByName('currid').AsInteger := FieldByName('currid').AsInteger;
            FIns.Params.ParamByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
            FIns.Params.ParamByName('checked').AsInteger := 1;
            FIns.Params.ParamByName('deleted').AsInteger := 0;
            FIns.Params.ParamByName('summall').AsCurrency := 0;
            FIns.Params.ParamByName('summincurr').AsCurrency := 0;
            FIns.Params.ParamByName('nds').AsFloat := NDS;
            FIns.Params.ParamByName('received').AsString := '';
            FIns.Params.ParamByName('todate').DataType := ftDateTime;
            FIns.Params.ParamByName('todate').Clear;
            FIns.Params.ParamByName('entid').DataType := ftInteger;
            FIns.Params.ParamByName('entid').Clear;
            FIns.Execute;

            FOldCurrID := FieldByName('currid').AsInteger;
            FOldKAID := FieldByName('kaid').AsInteger;
            FOldOnValue := FieldByName('onvalue').AsFloat;
          end; // need new WB?

          FIns.ProviderName := 'pWaybillDet_Ins';
          FIns.FetchParams;
          FPosID := GetMaxID(secondaryConn, 'waybilldet', 'posid');
          FIns.Params.ParamByName('posid').AsInteger := FPosID;
          FIns.Params.ParamByName('wbillid').AsInteger := FWBillID;
          FIns.Params.ParamByName('matid').AsInteger := FieldByName('matid').AsInteger;
          FIns.Params.ParamByName('wid').AsInteger := FieldByName('wid').AsInteger;
          FIns.Params.ParamByName('amount').AsFloat := FieldByName('remain').AsFloat;
          FIns.Params.ParamByName('onvalue').AsFloat := FOldOnValue;
          FIns.Params.ParamByName('price').AsFloat := FieldByName('price').AsFloat;
          FIns.Params.ParamByName('discount').DataType := ftFloat;
          FIns.Params.ParamByName('discount').Clear;
          FIns.Params.ParamByName('nds').AsFloat := FieldByName('nds').AsFloat;
          FIns.Params.ParamByName('currid').AsInteger := FOldCurrID;
          FIns.Params.ParamByName('ondate').AsDateTime := edMDateRemains.Date;
          FIns.Params.ParamByName('ptypeid').DataType := ftInteger;
          FIns.Params.ParamByName('ptypeid').Clear;
          FIns.Params.ParamByName('num').AsInteger := FPosID;

          NDSCalc(FieldByName('remain').AsFloat, FieldByName('price').AsFloat, FieldByName('nds').AsFloat, 1, FPosSum, FPosNDS);

          FPosSum := RoundToA(FPosSum + FPosNDS, -2);

          FIns.Params.ParamByName('total').AsFloat := FPosSum;
          FIns.Execute;

          FSum := FSum + RoundToA(FPosSum * FOldOnValue, -2);
          FCurrSum := FCurrSum + FPosSum;

          if not FieldByName('sn').IsNull then begin
            FIns.ProviderName := 'rSN_Ins';
            FIns.FetchParams;
            FIns.Params.ParamByName('sid').AsInteger := GetMaxID(secondaryConn, 'serials', 'sid');
            FIns.Params.ParamByName('posid').AsInteger := FPosID;
            FIns.Params.ParamByName('serialno').AsString := FieldByName('sn').AsString;
            FIns.Execute;
          end;

          FIns.ProviderName := 'pWaybillDetAP_Ins';
          FIns.FetchParams;
          FIns.Params.ParamByName('posid').AsInteger := FPosID;
          FIns.Params.ParamByName('producer').AsString := FieldByName('producer').AsString;
          FIns.Params.ParamByName('certnum').AsString := FieldByName('certnum').AsString;
          FIns.Params.ParamByName('gtd').AsString := FieldByName('gtd').AsString;

          if FieldByName('certdate').AsDateTime = 0 then begin
            FIns.Params.ParamByName('certdate').DataType := ftDateTime;
            FIns.Params.ParamByName('certdate').Clear;
          end
          else FIns.Params.ParamByName('certdate').AsDateTime := FieldByName('certdate').AsDateTime;

          FIns.Params.ParamByName('cardid').DataType := ftInteger;
          FIns.Params.ParamByName('cardid').Clear;
          FIns.Execute;

          Next;

          if Eof or (FOldCurrID <> FieldByName('currid').AsInteger)
            or ((FieldByName('kaid').AsInteger <> FOldKAID) and rbtMWBIn.Checked)
            or (FieldByName('onvalue').AsFloat <> FOldOnValue)
          then begin
            if (FOldKAID = 0) or rbtMWBRest.Checked
              then FIns.ProviderName := 'pWMatTurn_InsEx'
              else FIns.ProviderName := 'pWMatTurn_Ins';

            FIns.FetchParams;
            FIns.Params.ParamByName('wbillid').AsInteger := FWBillID;
            FIns.Execute;

            FIns.ProviderName := 'pWaybill_UpdSumEx';
            FIns.FetchParams;
            FIns.Params.ParamByName('wbillid').AsInteger := FWBillID;
            FIns.Params.ParamByName('summall').AsCurrency := FSum;
            FIns.Params.ParamByName('summincurr').AsCurrency := FCurrSum;
            FIns.Execute;
          end;
        end; // while not eof

        Close;

      finally
        FIns.Free;
      end;

      pbMain.StepIt;
      Application.ProcessMessages;
    end;

    //***************************************************************
    if not DoProcessMove('commonparams,profcommon,profdocparams,prgparams,users,useraccess')
      then Exit;

    if chbMWH.Checked
      then if not DoProcessMove('useraccesswh', False)
           then Exit;

    if not chbMKA.Checked
      then if not DoProcessMove('kagent,kaaddr,agentpersons,agentaccount,agentdoc,kadiscount', True, 2)
           then Exit;

    if not DoProcessMove('customtree,ctint,ctnumeric,ctdouble,cttext') then Exit;

    if chbWebStores.Checked then begin
      lProgressName.Caption := chbMServices.Properties.Caption;
      if not DoProcessMove('webshops') then Exit;
    end;

  finally
    Screen.Cursor := crDefault;
    tsLast.Show;
    Fsrc.Free;
    secondaryConn.Close;
    sleep(1000);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfrmStartWiz.tsMoveDataShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.tsMoveDataShow') else _udebug := nil;{$ENDIF}

  rbtMWBIn.Enabled := not rbtMWBIn.Enabled;
  rbtMWBIn.Enabled := not rbtMWBIn.Enabled;
  rbtMWBRest.Enabled := not rbtMWBRest.Enabled;
  rbtMWBRest.Enabled := not rbtMWBRest.Enabled;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmStartWiz.DatesAreCorrect: Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.DatesAreCorrect') else _udebug := nil;{$ENDIF}

  Result := True;

  try
    if chbMRemains.Checked then StrToDate(edMDateRemains.EditText);
    if chbMKABal.Checked then StrToDate(edMKABal.EditText);
    if chbMMoneyBal.Checked then StrToDate(edMMoneyBal.EditText);

  except
    Result := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.sbAddToFullClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.sbAddToFullClick') else _udebug := nil;{$ENDIF}
  edFullName.Text := edEntName.Text;
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.rgDBClick(Sender: TObject);
begin
  case rgDB.ItemIndex of
    0: if WizType <> wtNewDB then WizType := wtNewDB;
    1: if WizType <> wtRegisterDB then WizType := wtRegisterDB;
  end;

  btnNext.Enabled := True;
  lMainNext.Visible := True;
end;

//==============================================================================================
procedure TfrmStartWiz.cbDBPropertiesInitPopup(Sender: TObject);
  var
    FCurrDBID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  if cbDB.Properties.Items.Count > 0 then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmStartWiz.cbDBPropertiesInitPopup') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crHourGlass;

  try
    defaultConn.Open;
    if not defaultConn.Connected then Exception.Create('');

  except
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  try
    with newDataSet(defaultConn) do
    try
      ProviderName := 'pSysDB_List';
      Open;

      cbDB.Properties.Items.Clear;

      if not IsEmpty then begin
        cbDB.Properties.Items.AddObject(rs('Common', 'DefaultDB'), TObject(-1));

        while not Eof do begin
          cbDB.Properties.Items.AddObject(fieldbyname('desc').AsString, TObject(fieldbyname('dbid').AsInteger));
          Next;
        end;
      end;
      Close;

    finally
      Free;
    end;

    cbDB.ItemIndex := cbDB.Properties.Items.IndexOfObject(TObject(-1));

  except
    on e:Exception do ssMessageDlg(rs('frmLogin', 'Err_ConnError', 1) + e.Message, ssmtError, [ssmbOk] {$IFDEF DEBUG}, '', False, True{$ENDIF});
  end;

  Screen.Cursor := crDefault;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmStartWiz.cdsBankBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if defaultConn.Connected then TssClientDataSet(DataSet).RemoteServer := defaultConn;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('StartWiz', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
