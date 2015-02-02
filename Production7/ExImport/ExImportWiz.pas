{$I ok_sklad.inc}
unit ExImportWiz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseWizard, ActnList, ImgList, cxPC, cxControls, xButton, cxTL,
  ssBevel, ssSpeedButton, ExtCtrls, ssGradientPanel, StdCtrls,
  cxContainer, cxEdit, cxLabel, cxTextEdit, cxMaskEdit, cxButtonEdit, DB,
  cxDropDownEdit, ssExcel, cxCheckBox, ssLabel, ComCtrls, cxMemo, ssClientDataSet,
  OleServer, cxSpinEdit, ssDBLookupCombo, ssPopupTreeEdit, DBClient, ssBaseConst,
  XLSFile, cxCalendar, ssPanel;

type
  TfrmExImportWiz = class(TfrmBaseWizard)
    btnGrpParent: TssSpeedButton;
    btnHelpEx2: TssSpeedButton;
    btnHelpEx: TssSpeedButton;
    btnLockEx2: TssSpeedButton;
    btnLockEx: TssSpeedButton;
    btnMRWH1: TssSpeedButton;
    btnMRWH2: TssSpeedButton;
    btnMRWH3: TssSpeedButton;
    btnMRWH4: TssSpeedButton;
    btnSendErrMessageEx2: TssSpeedButton;
    btnSendErrMessageEx: TssSpeedButton;
    btnView: TssSpeedButton;
    cbBanksColAddr: TcxComboBox;
    cbBanksColCA: TcxComboBox;
    cbBanksColMFO: TcxComboBox;
    cbBanksColName: TcxComboBox;
    cbBanksColWWW: TcxComboBox;
    cbCheckMFO: TcxComboBox;
    cbDataType: TcxComboBox;
    cbKACheckName: TcxComboBox;
    cbKAColAddr: TcxComboBox;
    cbKAColBirthDate: TcxComboBox;
    cbKAColCertNum: TcxComboBox;
    cbKAColEMail: TcxComboBox;
    cbKAColFullName: TcxComboBox;
    cbKAColINN: TcxComboBox;
    cbKAColKPP: TcxComboBox;
    cbKAColName: TcxComboBox;
    cbKAColOKPO: TcxComboBox;
    cbKAColPhone: TcxComboBox;
    cbKAColPostIndex: TcxComboBox;
    cbKAColStartSaldo: TcxComboBox;
    cbKAColWWW: TcxComboBox;
    cbKAKind: TcxComboBox;
    cbKAType: TcxComboBox;
    cbMatCheckName: TcxComboBox;
    cbMatColArtikul: TcxComboBox;
    cbMatColBarCode: TcxComboBox;
    cbMatColMeasure: TcxComboBox;
    cbMatColName: TcxComboBox;
    cbMatColProducer: TcxComboBox;
    cbMatColPT1: TcxComboBox;
    cbMatColPT2: TcxComboBox;
    cbMatColPT3: TcxComboBox;
    cbMatColPT4: TcxComboBox;
    cbMRPrice1: TcxComboBox;
    cbMRPrice2: TcxComboBox;
    cbMRPrice3: TcxComboBox;
    cbMRPrice4: TcxComboBox;
    cbMRRest1: TcxComboBox;
    cbMRRest2: TcxComboBox;
    cbMRRest3: TcxComboBox;
    cbMRRest4: TcxComboBox;
    cdsCurr: TssClientDataSet;
    cdsParent: TssClientDataSet;
    cdsPriceType1: TssClientDataSet;
    cdsWH: TssClientDataSet;
    chbBanksColAddr: TcxCheckBox;
    chbBanksColCA: TcxCheckBox;
    chbBanksColMFO: TcxCheckBox;
    chbBanksColName: TcxCheckBox;
    chbBanksColWWW: TcxCheckBox;
    chbKAColAddr: TcxCheckBox;
    chbKAColBirthDate: TcxCheckBox;
    chbKAColCertNum: TcxCheckBox;
    chbKAColEMail: TcxCheckBox;
    chbKAColFullName: TcxCheckBox;
    chbKAColINN: TcxCheckBox;
    chbKAColKPP: TcxCheckBox;
    chbKAColName: TcxCheckBox;
    chbKAColOKPO: TcxCheckBox;
    chbKAColPhone: TcxCheckBox;
    chbKAColPostIndex: TcxCheckBox;
    chbKAColWWW: TcxCheckBox;
    chbKAStartSaldo: TcxCheckBox;
    chbMatColArtikul: TcxCheckBox;
    chbMatColBarCode: TcxCheckBox;
    chbMatColMeasure: TcxCheckBox;
    chbMatColProducer: TcxCheckBox;
    chbMatColPT1: TcxCheckBox;
    chbMatColPT2: TcxCheckBox;
    chbMatColPT3: TcxCheckBox;
    chbMatColPT4: TcxCheckBox;
    chbMRNDS1: TcxCheckBox;
    chbMRNDS2: TcxCheckBox;
    chbMRNDS3: TcxCheckBox;
    chbMRNDS4: TcxCheckBox;
    chbMRWH1: TcxCheckBox;
    chbMRWH2: TcxCheckBox;
    chbMRWH3: TcxCheckBox;
    chbMRWH4: TcxCheckBox;
    chbPT1NDS: TcxCheckBox;
    chbPT2NDS: TcxCheckBox;
    chbPT3NDS: TcxCheckBox;
    chbPT4NDS: TcxCheckBox;
    cxCheckBox1: TcxCheckBox;
    edEndRow: TcxSpinEdit;
    edFileName: TcxButtonEdit;
    edMRDate: TcxDateEdit;
    edStartRow: TcxSpinEdit;
    exlMain: TssExcel;
    Image1: TImage;
    imgLast: TImage;
    imgMain: TImage;
    lBanksAddr: TssLabel;
    lBanksCA: TssLabel;
    lBanksCol: TLabel;
    lBanksFieldName: TLabel;
    lBanksMFO: TssBevel;
    lBanksName: TssBevel;
    lBanksWWW: TssLabel;
    lcbMatGrp: TssPopupTreeEdit;
    lcbMRCurr: TssDBLookupCombo;
    lcbMRWH1: TssDBLookupCombo;
    lcbMRWH2: TssDBLookupCombo;
    lcbMRWH3: TssDBLookupCombo;
    lcbMRWH4: TssDBLookupCombo;
    lcbPriceType1: TssDBLookupCombo;
    lcbPriceType2: TssDBLookupCombo;
    lcbPriceType3: TssDBLookupCombo;
    lcbPriceType4: TssDBLookupCombo;
    lcbPT1Curr: TssDBLookupCombo;
    lcbPT2Curr: TssDBLookupCombo;
    lcbPT3Curr: TssDBLookupCombo;
    lcbPT4Curr: TssDBLookupCombo;
    lCheckMFO: TLabel;
    lColCurr: TLabel;
    lCurrBankName: TLabel;
    lDataReady: TcxLabel;
    lDataType: TLabel;
    lFileName: TLabel;
    lFinishText: TcxLabel;
    lFinishWork: TLabel;
    lHeaderBold: TLabel;
    lHeaderNormal: TLabel;
    lImportRange: TLabel;
    lImportRangeIncluding: TLabel;
    lImportRangeText: TLabel;
    lImportRangeTo: TLabel;
    lKACheckName: TLabel;
    lKACol2: TLabel;
    lKACol: TLabel;
    lKAColAddr: TssLabel;
    lKAColBirthDate: TssLabel;
    lKAColCertNum: TssLabel;
    lKAColEMail: TssLabel;
    lKAColFullName: TssLabel;
    lKAColINN: TssLabel;
    lKAColKPP: TssLabel;
    lKAColName: TssBevel;
    lKAColOKPO: TssLabel;
    lKAColPhone: TssLabel;
    lKAColPostIndex: TssLabel;
    lKAColWWW: TssLabel;
    lKAFieldName2: TLabel;
    lKAFieldName: TLabel;
    lKAKind: TLabel;
    lKAStartSaldo: TssLabel;
    lKAType: TLabel;
    lLog: TLabel;
    lMainInfo: TcxLabel;
    lMainNext: TLabel;
    lMaster: TLabel;
    lMasterR: TLabel;
    lMatCheckName: TLabel;
    lMatCol2: TLabel;
    lMatCol: TLabel;
    lMatColArtikul: TssLabel;
    lMatColBarCode: TssLabel;
    lMatColMeasure: TssLabel;
    lMatColName: TssBevel;
    lMatColProducer: TssLabel;
    lMatFieldName: TLabel;
    lMatGrp: TLabel;
    lMatOutPrice: TLabel;
    lMRCurr: TssLabel;
    lMRDate: TssLabel;
    lMRNDS: TLabel;
    lMRPrice: TLabel;
    lMRRest: TLabel;
    lMRText: TcxLabel;
    lMRWHName: TLabel;
    lPressFinish: TLabel;
    lProgressCount: TLabel;
    lProgressName: TcxLabel;
    lStartImportText: TLabel;
    lTypeText: TcxLabel;
    lWarning: TLabel;
    lWarningText: TcxLabel;
    lWelcome: TLabel;
    lWithNDS2: TLabel;
    memLog: TcxMemo;
    Panel1: TPanel;
    panMainInfo: TPanel;
    pbMain: TProgressBar;
    pcData: TcxPageControl;
    srcCurr: TDataSource;
    srcParent: TDataSource;
    srcPriceType1: TDataSource;
    srcWH: TDataSource;
    ssBevel3: TssBevel;
    ssBevel4: TssBevel;
    ssBevel5: TssBevel;
    ssBevel6: TssBevel;
    ssBevel7: TssBevel;
    ssBevel8: TssBevel;
    tsData: TcxTabSheet;
    tsDataBanks: TcxTabSheet;
    tsDataKAgents: TcxTabSheet;
    tsDataMatRests: TcxTabSheet;
    tsDataMats: TcxTabSheet;
    tsFinish: TcxTabSheet;
    tsLog: TcxTabSheet;
    tsProgress: TcxTabSheet;
    tsStartImport: TcxTabSheet;
    tsType: TcxTabSheet;

    procedure pcMainChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edFileNamePropertiesChange(Sender: TObject);
    procedure aNextExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure edFileNamePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure chbBanksColAddrClick(Sender: TObject);
    procedure chbBanksColWWWClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure chbKAColFullNameClick(Sender: TObject);
    procedure chbKAColINNClick(Sender: TObject);
    procedure chbKAColCertNumClick(Sender: TObject);
    procedure chbKAColOKPOClick(Sender: TObject);
    procedure chbKAColKPPClick(Sender: TObject);
    procedure chbKAColBirthDateClick(Sender: TObject);
    procedure chbKAColAddrClick(Sender: TObject);
    procedure chbKAColPostIndexClick(Sender: TObject);
    procedure chbKAColPhoneClick(Sender: TObject);
    procedure chbKAColEMailClick(Sender: TObject);
    procedure chbKAColWWWClick(Sender: TObject);
    procedure chbMatColPT1Click(Sender: TObject);
    procedure chbMatColPT2Click(Sender: TObject);
    procedure chbMatColPT3Click(Sender: TObject);
    procedure chbMatColPT4Click(Sender: TObject);
    procedure chbMatColArtikulClick(Sender: TObject);
    procedure chbMatColMeasureClick(Sender: TObject);
    procedure chbMatColBarCodeClick(Sender: TObject);
    procedure chbMatColProducerClick(Sender: TObject);
    procedure btnGrpParentClick(Sender: TObject);
    procedure lcbMatGrpGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure tsProgressShow(Sender: TObject);
    procedure aPriorExecute(Sender: TObject);
    procedure chbMRWH1Click(Sender: TObject);
    procedure chbMRWH2Click(Sender: TObject);
    procedure chbMRWH3Click(Sender: TObject);
    procedure chbMRWH4Click(Sender: TObject);
    procedure cdsCurrAfterOpen(DataSet: TDataSet);
    procedure pcDataChange(Sender: TObject);
    procedure chbKAStartSaldoClick(Sender: TObject);
    procedure chbBanksColCAClick(Sender: TObject);
    procedure cdsWHBeforeOpen(DataSet: TDataSet);

  private
    FFileModified: Boolean;
    FRowCount: Integer;
    FCols: TList;
    FLog: TStringList;
    FCancel, InProgress: Boolean;
    FStartRow, FEndRow: Integer;
    FxlsMain: TXLSFile;

    procedure SetImportRange;
    function GetRowCount(ACols: TList): Integer;
    procedure ImportBanks;
    procedure ImportKA;
    procedure ImportMats;
    procedure MakeCol(Sender: TcxComboBox; AIndex: Integer);

  private
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  protected
    procedure SetCaptions; override;
  end;

var
  frmExImportWiz: TfrmExImportWiz;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, fMessageDlg, ClientData, ssFun, prFun, prTypes, Math,
  ssStrUtil, XLSWorkbook, ShellAPI, ActiveX, Udebug, xLngDefs;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmExImportWiz.pcMainChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.pcMainChange') else _udebug := nil;{$ENDIF}

  inherited;

  panHeader.Visible := (pcMain.ActivePageIndex > 0) and (pcMain.ActivePageIndex < pcMain.PageCount - 1);

  if pcMain.ActivePage = tsType then begin
    lHeaderBold.Caption := rs(Self.Name, 'TypeHBold');
    lHeaderNormal.Caption := rs(Self.Name, 'TypeHNormal');
  end

  else if pcMain.ActivePage = tsLog then begin
    lHeaderBold.Caption := rs(Self.Name, 'LogHBold');
    lHeaderNormal.Caption := '';
    lLog.Caption := cbDataType.Text + ', ' + rs(Self.Name, 'LogText') + ':';
  end

  else if pcMain.ActivePage = tsData then begin
    case cbDataType.ItemIndex of
      0: lHeaderBold.Caption := rs(Self.Name, 'ImportKAgents');
      1: begin
           if pcData.ActivePage = tsDataMatRests
             then lHeaderBold.Caption := rs(Self.Name, 'ImportMatRests')
             else lHeaderBold.Caption := rs(Self.Name, 'ImportMats');
         end;
      2: lHeaderBold.Caption := rs(Self.Name, 'ImportBanks');
    end;
    lHeaderNormal.Caption := rs(Self.Name, 'DataHNormal');
  end

  else if pcMain.ActivePage = tsStartImport then begin
    lHeaderBold.Caption := rs(Self.Name, 'StartImport');
    lHeaderNormal.Caption := '';
    aNext.Caption := rs(Self.Name, 'Import');
    lDataReady.Caption := Format(rs(Self.Name, 'DataReady'), [cbDataType.Text, edFileName.Text]);
  end

  else if pcMain.ActivePage = tsProgress then begin
    lHeaderBold.Caption := rs(Self.Name, 'DataImport');
    lHeaderNormal.Caption := '';
  end 

  else if pcMain.ActivePage = tsFinish then begin
    if FCancel
      then lFinishText.Caption := rs(Self.Name, 'ImportCanceled')
      else if FLog.Count > 0
        then lFinishText.Caption := rs(Self.Name, 'ImportErrors')
        else lFinishText.Caption := rs(Self.Name, 'ImportSuccess');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.SetCaptions;
  var
    i: Char;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    panTitleBar.Caption := GetRS(Self.Name, 'Master') + ' ' + GetRS(Self.Name, 'Title');
    btnLockEx.Hint := rs('Common', 'Lock');
    btnHelpEx.Hint := rs('Common', 'Help');
    btnSendErrMessageEx.Hint := rs('Common', 'SendErrMessage');
    btnLockEx2.Hint := rs('Common', 'Lock');
    btnHelpEx2.Hint := rs('Common', 'Help');
    btnSendErrMessageEx2.Hint := rs('Common', 'SendErrMessage');

    lMaster.Caption := GetRS(Self.Name, 'Title');
    lWelcome.Caption := GetRS(Self.Name, 'Welcome');
    lMainInfo.Caption := GetRS(Self.Name, 'MainText');
    lMainNext.Caption := GetRS(Self.Name, 'MainNext');
    lColCurr.Caption := GetRS(Self.Name, 'Curr');

    lDataType.Caption := GetRS(Self.Name, 'DataType') + ':';
    lFileName.Caption := GetRS(Self.Name, 'FileName') + ':';
    lWithNDS2.Caption := GetRS(Self.Name, 'WithNDS');

    lMRText.Caption := GetRS(Self.Name, 'MRText');
    lMRWHName.Caption := GetRS(Self.Name, 'WHName');
    lMRRest.Caption := GetRS(Self.Name, 'Rest');
    lMRPrice.Caption := GetRS(Self.Name, 'Price');
    lMRNDS.Caption := GetRS(Self.Name, 'WithNDS');
    lMRDate.Caption := GetRS(Self.Name, 'DateOfWBIN') + ':';
    lMRCurr.Caption := GetRS(Self.Name, 'PricesDefinedIn') + ':';

    with cbDataType do begin
      Properties.Items.Add(GetRS(Self.Name, 'KAgents'));
      Properties.Items.Add(GetRS(Self.Name, 'Mats'));
      Properties.Items.Add(GetRS(Self.Name, 'Banks'));
      ItemIndex := 0;
    end;

    lBanksFieldName.Caption := GetRS(Self.Name, 'FieldName');
    lBanksCol.Caption := GetRS(Self.Name, 'Col');
    lBanksCA.Caption := GetRS(Self.Name, 'CorAcc');
    lBanksName.Caption := GetRS(Self.Name, 'BanksName') + ':';

    case CountryRules.AR of
      accRul_RU: begin
        lBanksMFO.Caption := rs(Self.Name, 'BIC') + ':';
        lCheckMFO.Caption := GetRS(Self.Name, 'CheckMFORus');
      end;

      accRul_UA: begin
        lBanksMFO.Caption := rs(Self.Name, 'MFO') + ':';
        lCheckMFO.Caption := GetRS(Self.Name, 'CheckMFO');
      end;

      else begin
        lBanksMFO.Caption := rs(Self.Name, 'ABA') + ':';
        lCheckMFO.Caption := GetRS(Self.Name, 'CheckABA');
      end;
    end;
    lBanksAddr.Caption := GetRS(Self.Name, 'Addr') + ':';
    lBanksWWW.Caption := GetRS(Self.Name, 'WWW') + ':';
    lTypeText.Caption := GetRS(Self.Name, 'TypeText');

    lWarning.Caption := GetRS(Self.Name, 'Warning') + ':';
    lWarningText.Caption := GetRS(Self.Name, 'WarningText');
    lStartImportText.Caption := GetRS(Self.Name, 'StartImportText');

    lFinishWork.Caption := GetRS(Self.Name, 'FinishWork');
    lMasterR.Caption := GetRS(Self.Name, 'MasterR');
    lPressFinish.Caption := GetRS(Self.Name, 'PressFinish');

    btnView.Hint := GetRS(Self.Name, 'ViewFile');
    with cbCheckMFO do begin
      Properties.Items.Add(GetRS(Self.Name, 'Skip'));
      Properties.Items.Add(GetRS(Self.Name, 'Replace'));
      ItemIndex := 0;
    end;

    lKAFieldName.Caption := GetRS(Self.Name, 'FieldName');
    lKAFieldName2.Caption := GetRS(Self.Name, 'FieldName');
    lKACol.Caption := GetRS(Self.Name, 'Col');
    lKACol2.Caption := GetRS(Self.Name, 'Col');

    lKAColName.Caption := GetRS(Self.Name, 'KAName');
    lKAColFullName.Caption := GetRS(Self.Name, 'KAFullName');
    lKAColINN.Caption := GetRS(Self.Name, 'KAINN');
    lKAColCertNum.Caption := GetRS(Self.Name, 'KACertNum');
    lKAColOKPO.Caption := GetRS(Self.Name, 'KAOKPO');
    lKAColKPP.Caption := GetRS(Self.Name, 'KAKPP');
    lKAColBirthDate.Caption := GetRS(Self.Name, 'Fax');
    lKAColAddr.Caption := GetRS(Self.Name, 'KAAddr');
    lKAColPhone.Caption := GetRS(Self.Name, 'KAPhone');
    lKAColPostIndex.Caption := GetRS(Self.Name, 'KAPostIndex');
    lKAColEMail.Caption := GetRS(Self.Name, 'KAEMail');
    lKAColWWW.Caption := GetRS(Self.Name, 'KAWWW');
    lKAStartSaldo.Caption := GetRS(Self.Name, 'StartSaldo') + ', ' + BaseCurrName;

    lKAType.Caption := GetRS(Self.Name, 'KAType') + ':';
    lKAKind.Caption := GetRS(Self.Name, 'KAKind') + ':';
    lKACheckName.Caption := GetRS(Self.Name, 'KACheckName');

    lImportRange.Caption := GetRS(Self.Name, 'ImportRange');
    lImportRangeText.Caption := GetRS(Self.Name, 'ImportRangeText');
    lImportRangeTo.Caption := GetRS(Self.Name, 'To');
    lImportRangeIncluding.Caption := GetRS(Self.Name, 'Including');

    with cbKAType do begin
      Properties.Items.Add(GetRS(Self.Name, 'KAFirms'));
      Properties.Items.Add(GetRS(Self.Name, 'KAPersons'));
      Properties.Items.Add(GetRS(Self.Name, 'KAWorkers'));
      ItemIndex := 0;
    end;

    with cbKAKind do begin
      Properties.Items.Add(GetRS(Self.Name, 'KASuppliers'));
      Properties.Items.Add(GetRS(Self.Name, 'KAClients'));
      Properties.Items.Add(GetRS(Self.Name, 'KASuppClients'));
      ItemIndex := 0;
    end;

    with cbKACheckName do begin
      Properties.Items.Add(GetRS(Self.Name, 'Skip'));
      Properties.Items.Add(GetRS(Self.Name, 'Replace'));
      Properties.Items.Add(GetRS(Self.Name, 'Duplicate'));
      ItemIndex := 2;
    end;

    lMatColName.Caption := GetRS(Self.Name, 'MatName');
    lMatFieldName.Caption := GetRS(Self.Name, 'FieldName');
    lMatCol.Caption := GetRS(Self.Name, 'Col');
    lMatCol2.Caption := GetRS(Self.Name, 'Col');
    lMatOutPrice.Caption := GetRS(Self.Name, 'OutPriceFor');
    lMatColArtikul.Caption := GetRS(Self.Name, 'Artikul');
    lMatColMeasure.Caption := GetRS(Self.Name, 'Measure');
    lMatColBarCode.Caption := GetRS(Self.Name, 'BarCode');
    lMatColProducer.Caption := GetRS(Self.Name, 'Producer');
    lMatColArtikul.Caption := GetRS(Self.Name, 'Artikul');
    lMatGrp.Caption := GetRS(Self.Name, 'MatGrp') + ':';
    lMatCheckName.Caption := GetRS(Self.Name, 'MatCheckName');
    btnGrpParent.Hint := GetRS(Self.Name, 'MatGrpRef');

    with cbMatCheckName do begin
      Properties.Items.Add(GetRS(Self.Name, 'Skip'));
      Properties.Items.Add(GetRS(Self.Name, 'Replace'));
      Properties.Items.Add(GetRS(Self.Name, 'Duplicate'));
      ItemIndex := 2;
    end;
  end;

  MakeCol(cbBanksColName, 0);
  MakeCol(cbBanksColMFO, 1);
  MakeCol(cbBanksColCA, 2);
  MakeCol(cbBanksColAddr, 3);
  MakeCol(cbBanksColWWW, 4);

  MakeCol(cbKAColName, 0);
  MakeCol(cbKAColFullName, 1);
  MakeCol(cbKAColINN, 2);
  MakeCol(cbKAColCertNum, 3);
  MakeCol(cbKAColOKPO, 4);
  MakeCol(cbKAColKPP, 5);
  MakeCol(cbKAColBirthDate, 6);
  MakeCol(cbKAColAddr, 7);
  MakeCol(cbKAColPostIndex, 8);
  MakeCol(cbKAColPhone, 9);
  MakeCol(cbKAColEMail, 10);
  MakeCol(cbKAColWWW, 11);
  MakeCol(cbKAColStartSaldo, 12);

  MakeCol(cbMatColName, 0);
  MakeCol(cbMatColArtikul, 1);
  MakeCol(cbMatColMeasure, 2);
  MakeCol(cbMatColBarCode, 3);
  MakeCol(cbMatColProducer, 4);
  MakeCol(cbMatColPT1, 5);
  MakeCol(cbMatColPT2, 6);
  MakeCol(cbMatColPT3, 7);
  MakeCol(cbMatColPT4, 8);

  MakeCol(cbMRRest1, 9);
  MakeCol(cbMRPrice1, 10);
  MakeCol(cbMRRest2, 11);
  MakeCol(cbMRPrice2, 12);
  MakeCol(cbMRRest3, 13);
  MakeCol(cbMRPrice3, 14);
  MakeCol(cbMRRest4, 15);
  MakeCol(cbMRPrice4, 16);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  setFontStyle(lMaster.Font);
  setFontStyle(lWelcome.Font);
  setFontStyle(lHeaderBold.Font);

  edMRDate.Date := Date;
  FxlsMain := TXLSFile.Create;
  pcMain.ActivePageIndex := 0;
  FCols := TList.Create;
  FLog := TStringList.Create;

  edStartRow.Text := '';
  edEndRow.Text := '';

  cdsParent.Open;
  cdsCurr.Open;
  with cdsWH do begin
    Open;
    Next; lcbMRWH2.KeyValue := FieldByName('wid').AsInteger;
    Next; lcbMRWH3.KeyValue := FieldByName('wid').AsInteger;
    Next; lcbMRWH4.KeyValue := FieldByName('wid').AsInteger;
  end;
  with cdsPriceType1 do begin
    Open;
    Next; lcbPriceType2.KeyValue := FieldByName('ptypeid').AsInteger;
    Next; lcbPriceType3.KeyValue := FieldByName('ptypeid').AsInteger;
    Next; lcbPriceType4.KeyValue := FieldByName('ptypeid').AsInteger;
  end;

  lCheckMFO.Visible := False;
  cbCheckMFO.Visible := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.edFileNamePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.edFileNamePropertiesChange') else _udebug := nil;{$ENDIF}

  FFileModified := True;
  btnView.Enabled := Trim(edFileName.Text) <> '';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.aNextExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.aNextExecute') else _udebug := nil;{$ENDIF}

  if pcMain.ActivePage = tsType then begin
    if FFileModified then begin
      if exlMain.Connected then exlMain.Connected := False;

      exlMain.FileName := edFileName.Text;

      try
        Screen.Cursor := crHourGlass;

        try
          FxlsMain.Clear;
          //if {cbDataType.ItemIndex = 1}True
          //  then exlMain.OpenWorkBook(exlMain.FileName)
          //  else FxlsMain.OpenFile(edFileName.Text);

        finally
          Screen.Cursor := crDefault;
        end;

        FFileModified := False;

        inherited;

      except
        on e:exception do begin
          if exlMain.Connected then exlMain.Connected := False;
          ssMessageDlg(rs(Self.Name, 'IncorrectFile') + #10#13 + e.Message, ssmtError, [ssmbOK]);
        end;
      end;
    end
    else inherited;

    pcData.ActivePageIndex := cbDataType.ItemIndex;
  end
  else if pcMain.ActivePage = tsData then begin
    if (cbDataType.ItemIndex = 1) then begin
      if pcData.ActivePage = tsDataMats then begin
        if lcbMatGrp.Text = '' then begin
          ssMessageDlg(rs(Self.Name, 'MatGrpNotDefined'), ssmtError, [ssmbOk]);
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;

        pcData.ActivePage := tsDataMatRests;
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;
    end;

    FCols.Clear;
    FLog.Clear;

    case cbDataType.ItemIndex of
      0: begin
           FCols.Add(Pointer(cbKAColName.ItemIndex + 1));
           if chbKAColFullName.Checked then FCols.Add(Pointer(cbKAColFullName.ItemIndex + 1));
           if chbKAColINN.Checked then FCols.Add(Pointer(cbKAColINN.ItemIndex + 1));
           if chbKAColCertNum.Checked then FCols.Add(Pointer(cbKAColCertNum.ItemIndex + 1));
           if chbKAColOKPO.Checked then FCols.Add(Pointer(cbKAColOKPO.ItemIndex + 1));
           if chbKAColKPP.Checked then FCols.Add(Pointer(cbKAColKPP.ItemIndex + 1));
           if chbKAColAddr.Checked then FCols.Add(Pointer(cbKAColAddr.ItemIndex + 1));
           if chbKAColBirthDate.Checked then FCols.Add(Pointer(cbKAColBirthDate.ItemIndex + 1));
           if chbKAColPostIndex.Checked then FCols.Add(Pointer(cbKAColPostIndex.ItemIndex + 1));
           if chbKAColPhone.Checked then FCols.Add(Pointer(cbKAColPhone.ItemIndex + 1));
           if chbKAColEMail.Checked then FCols.Add(Pointer(cbKAColEMail.ItemIndex + 1));
           if chbKAColWWW.Checked then FCols.Add(Pointer(cbKAColWWW.ItemIndex + 1));
           if chbKAStartSaldo.Checked then FCols.Add(Pointer(cbKAColStartSaldo.ItemIndex + 1));
         end;

      1: begin
           FCols.Add(Pointer(cbMatColName.ItemIndex + 1));
           if chbMatColArtikul.Checked then FCols.Add(Pointer(cbMatColArtikul.ItemIndex + 1));
           if chbMatColMeasure.Checked then FCols.Add(Pointer(cbMatColMeasure.ItemIndex + 1));
           if chbMatColBarCode.Checked then FCols.Add(Pointer(cbMatColBarCode.ItemIndex + 1));
           if chbMatColProducer.Checked then FCols.Add(Pointer(cbMatColProducer.ItemIndex + 1));
           if chbMatColPT1.Checked then FCols.Add(Pointer(cbMatColPT1.ItemIndex + 1));
           if chbMatColPT2.Checked then FCols.Add(Pointer(cbMatColPT2.ItemIndex + 1));
           if chbMatColPT3.Checked then FCols.Add(Pointer(cbMatColPT3.ItemIndex + 1));
           if chbMatColPT4.Checked then FCols.Add(Pointer(cbMatColPT4.ItemIndex + 1));
         end;

      2: begin
           FCols.Add(Pointer(cbBanksColName.ItemIndex + 1));
           FCols.Add(Pointer(cbBanksColMFO.ItemIndex + 1));

           if chbBanksColAddr.Checked then FCols.Add(Pointer(cbBanksColMFO.ItemIndex + 1));
           if chbBanksColWWW.Checked then FCols.Add(Pointer(cbBanksColWWW.ItemIndex + 1));
         end;
    end;
    inherited;
  end

  else if pcMain.ActivePage = tsFinish then begin
    if exlMain.Connected then exlMain.Connected := False;
    Close;
  end

  else if pcMain.ActivePage = tsStartImport then begin
    FRowCount := GetRowCount(FCols);
    inherited;
    aNext.Enabled := False;
    btnNext.FOver := False;
    aPrior.Enabled := False;
    SetImportRange;
    case cbDataType.ItemIndex of
      0: ImportKA;
      2: ImportBanks;
      1: ImportMats;
    end;

    if (FLog.Count = 0) or FCancel
      then pcMain.ActivePage := tsFinish
      else begin
        memLog.Lines.Assign(FLog);
        pcMain.ActivePage := tsLog;
      end;
  end

  else inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.ActionListUpdate') else _udebug := nil;{$ENDIF}

  btnLock.Visible := pcMain.ActivePage <> tsProgress;
  btnSendErrMessage.Visible := btnLock.Visible;
  btnHelp.Visible := btnLock.Visible;
  lMRDate.Enabled := chbMRWH1.Checked or chbMRWH2.Checked or chbMRWH3.Checked or chbMRWH4.Checked;
  edMRDate.Enabled := lMRDate.Enabled;
  lMRCurr.Enabled := lMRDate.Enabled;
  lcbMRCurr.Enabled := lMRDate.Enabled;

  aPrior.Enabled := (pcMain.ActivePageIndex > 0)
    and (pcMain.ActivePage <> tsProgress)
    and (pcMain.ActivePage <> tsLog)
    and (((pcMain.ActivePage = tsFinish) and (FLog.Count > 0) and not FCancel)
         or
        (pcMain.ActivePage <> tsFinish));

  aNext.Enabled :=
    (
     ((pcMain.ActivePage = tsType) and (edFileName.Text <> ''))
       or
     ((pcMain.ActivePage <> tsType) and (pcMain.ActivePage <> tsProgress))
    );

  aCancel.Enabled := pcMain.ActivePage <> tsFinish;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.edFileNamePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.edFileNamePropertiesButtonClick') else _udebug := nil;{$ENDIF}

  with TOpenDialog.Create(nil) do
   try
     DefaultExt := 'xls';
     Filter := 'Excel Documents (*.xls)|*.xls';
     if Execute then edFileName.Text := FileName;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbBanksColAddrClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbBanksColAddrClick') else _udebug := nil;{$ENDIF}

  lBanksAddr.Enabled := chbBanksColAddr.Checked;
  cbBanksColAddr.Enabled := chbBanksColAddr.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbBanksColWWWClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbBanksColWWWClick') else _udebug := nil;{$ENDIF}

  lBanksWWW.Enabled := chbBanksColWWW.Checked;
  cbBanksColWWW.Enabled := chbBanksColWWW.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmExImportWiz.GetRowCount(ACols: TList): Integer;
  var
    i: Integer;
    FDataExists: Boolean;
    FromRow, ToRow, FCount: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.GetRowCount') else _udebug := nil;{$ENDIF}

  {FxlsMain.OpenFile(edFileName.Text);
  FCount := FxlsMain.Workbook.Sheets[0].Rows.Count;
  if edStartRow.Text <> ''
    then FromRow := edStartRow.Value
    else FromRow := -1;

  if edEndRow.Text <> ''
    then ToRow := edEndRow.Value
    else ToRow := -1;

  if FromRow <> -1 then
    if ToRow <> -1
      then Result := ToRow - FromRow + 1
      else Result := FCount - FromRow + 1
    else if ToRow <> -1
      then Result := ToRow
      else Result := FCount;
  }

  if edStartRow.Text <> ''
    then Result := edStartRow.Value - 1
    else Result := 0;

  if True{cbDataType.ItemIndex = 1} then begin
    if not VarIsEmpty(exlMain.ExcelApp) then begin
      exlMain.ExcelApp.Visible := True;
    end

    else begin
      exlMain.FileName := edFileName.Text;

      try
        Screen.Cursor := crHourGlass;
        try
          exlMain.OpenWorkBook(exlMain.FileName);
          exlMain.ExcelApp.Visible := False;

        finally
          Screen.Cursor := crDefault;
        end;

        FFileModified := False;

      except
        on e:exception do begin
          if exlMain.Connected then exlMain.Connected := False;
          ssMessageDlg(rs(Self.Name, 'IncorrectFile') + #10#13 + e.Message, ssmtError, [ssmbOK]);
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;
      end;
    end;

    with exlMain do begin
      while True do begin
        FDataExists := False;
        for i := 0 to ACols.Count - 1 do begin
          if VarToStr(WorkSheet.Cells[Result + 1, Integer(ACols[i])].Value) <> '' then begin
            FDataExists := True;
            Break;
          end;
        end;
        if not FDataExists then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

        Inc(Result);
      end;
    end;
    if edStartRow.Text <> ''
      then Result := Result - edStartRow.Value;
  end;
  {else begin
    with FxlsMain do begin
      while True do begin
        FDataExists := False;
        for i := 0 to ACols.Count - 1 do begin
          if VarToStr(Workbook.Sheets.Item[0].Cells[Result, Integer(ACols[i]) - 1].Value) <> '' then begin
            FDataExists := True;
            Break;
          end;
        end;
        if not FDataExists then Exit;
        Inc(Result);
      end;
    end;
    if edStartRow.Text <> ''
      then Result := Result - edStartRow.Value;
  end;
  }

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.FormDestroy') else _udebug := nil;{$ENDIF}

  FxlsMain.Free;
  FCols.Free;
  FLog.Free;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.ImportBanks;
  var
    i, maxx, fid: Integer;
    strSep, strBankName, strBankMFO, strBankAddr, strBankWWW, strBankCorAcc: string;
    FCount: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.ImportBanks') else _udebug := nil;{$ENDIF}

  pbMain.Position := 0;
  strSep := rs(Self.Name, 'From');
  i := 0;
  FCount := FEndRow - FStartRow + 1;

  if FCount < 0 then FCount := 0;

  pbMain.Max := FCount;
  lProgressCount.Caption := IntToStr(i - FStartRow + 1) + ' ' + strSep + ' ' + IntToStr(FCount);

  with newDataSet do
    try
      maxx := GetMaxID(dmData.SConnection, 'banks', 'bankid');
      TrStart;
      InProgress := True;
      for i := FStartRow to FEndRow do begin
        if FCancel then begin
          if ssMessageDlg(rs(Self.Name, 'OkToCancel'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes
            then begin
              TrRollback;
              {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
              Exit;
            end
            else FCancel := False;
        end;
        strBankName := VarToStr(exlMain.WorkSheet.Cells[i, cbBanksColName.ItemIndex + 1].Value);
        strBankMFO := VarToStr(exlMain.WorkSheet.Cells[i, cbBanksColMFO.ItemIndex + 1].Value);
        strBankAddr := VarToStr(exlMain.WorkSheet.Cells[i, cbBanksColAddr.ItemIndex + 1].Value);
        strBankCorAcc := VarToStr(exlMain.WorkSheet.Cells[i, cbBanksColCA.ItemIndex + 1].Value);
        strBankWWW := VarToStr(exlMain.WorkSheet.Cells[i, cbBanksColWWW.ItemIndex + 1].Value);
        lCurrBankName.Caption := strBankName;

        pbMain.StepIt;
        lProgressCount.Caption := IntToStr(i) + ' ' + strSep + ' ' + IntToStr(FCount);
        Application.ProcessMessages;

        {ProviderName := 'pBanks_GetMFO';
        FetchParams;
        Params.ParamByName('mfo').AsString := strBankMFO;
        Open;
        if not IsEmpty then begin
          fid := FieldByName('bankid').AsInteger;
        end
        else fid := -1;
        Close;
        if (fid <> -1) and (cbCheckMFO.ItemIndex = 1)
          then ProviderName := 'pBanks_Upd'
          else if (fid <> -1) and (cbCheckMFO.ItemIndex = 0) then begin
            Continue;
          end
          else begin
            ProviderName := 'pBanks_Ins';
            fid := maxx;
          end;
        }

        ProviderName := 'pBanks_Ins';
        fid := maxx;
        FetchParams;
        Params.ParamByName('def').AsInteger := 0;
        Params.ParamByName('bankid').AsInteger := fid;
        Params.ParamByName('mfo').AsString := strBankMFO;
        Params.ParamByName('name').AsString := strBankName;
        Params.ParamByName('coracc').AsString := strBankCorAcc;

        if chbBanksColAddr.Checked
          then Params.ParamByName('address').AsString := strBankAddr
          else begin
            Params.ParamByName('address').DataType := ftString;
            Params.ParamByName('address').Clear;
          end;

        if chbBanksColWWW.Checked
          then Params.ParamByName('www').AsString := strBankWWW
          else begin
            Params.ParamByName('www').DataType := ftString;
            Params.ParamByName('www').Clear;
          end;

        try
          Execute;
          maxx := GetMaxID(dmData.SConnection, 'banks', 'bankid');;
        except
          FLog.Add(strBankName + ';' + strBankMFO + ';' + strBankAddr + ';' + strBankWWW);
        end;

        Application.ProcessMessages;
      end;

      TrCommit;

      exlMain.Connected := False;

    finally
      Free;
      InProgress := False;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.aCancelExecute') else _udebug := nil;{$ENDIF}

  if InProgress
    then FCancel := True
    else inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.btnViewClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.btnViewClick') else _udebug := nil;{$ENDIF}

  try
    ShellExecute(Application.Handle, nil, PChar(edFileName.Text), nil, nil, SW_SHOWNORMAL);

    FFileModified := False;

  except
    on e: exception do ssMessageDlg(rs(Self.Name, 'IncorrectFile') + #10#13 + e.Message, ssmtError, [ssmbOK]);
  end;

  {if not VarIsEmpty(exlMain.ExcelApp) then begin
    exlMain.ExcelApp.Visible := True;
  end
  else begin
    exlMain.FileName := edFileName.Text;
    try
      Screen.Cursor := crHourGlass;
      try
        exlMain.OpenWorkBook(exlMain.FileName);
        exlMain.ExcelApp.Visible := True;
      finally
        Screen.Cursor := crDefault;
      end;
      FFileModified := False;
    except
      on e:exception do begin
        if exlMain.Connected then exlMain.Connected := False;
        ssMessageDlg(rs(Self.Name, 'IncorrectFile') + #10#13 +
          e.Message, ssmtError, [ssmbOK]);
      end;
    end;
  end;}
  //ShellExecute(Application.Handle, nil, PChar(AFName), nil, nil, SW_SHOWNORMAL)

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.MakeCol(Sender: TcxComboBox; AIndex: Integer);
 var
   i: Char;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.MakeCol') else _udebug := nil;{$ENDIF}

  with Sender do begin
    for i := 'A' to 'Z' do Properties.Items.Add(i);
    ItemIndex := AIndex;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbKAColFullNameClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbKAColFullNameClick') else _udebug := nil;{$ENDIF}

  lKAColFullName.Enabled := (Sender as TcxCheckBox).Checked;
  cbKAColFullName.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbKAColINNClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbKAColINNClick') else _udebug := nil;{$ENDIF}

  lKAColINN.Enabled := (Sender as TcxCheckBox).Checked;
  cbKAColINN.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbKAColCertNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbKAColCertNumClick') else _udebug := nil;{$ENDIF}

  lKAColCertNum.Enabled := (Sender as TcxCheckBox).Checked;
  cbKAColCertNum.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbKAColOKPOClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbKAColOKPOClick') else _udebug := nil;{$ENDIF}

  lKAColOKPO.Enabled := (Sender as TcxCheckBox).Checked;
  cbKAColOKPO.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbKAColKPPClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbKAColKPPClick') else _udebug := nil;{$ENDIF}

  lKAColKPP.Enabled := (Sender as TcxCheckBox).Checked;
  cbKAColKPP.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbKAColBirthDateClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbKAColBirthDateClick') else _udebug := nil;{$ENDIF}

  lKAColBirthDate.Enabled := (Sender as TcxCheckBox).Checked;
  cbKAColBirthDate.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbKAColAddrClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbKAColAddrClick') else _udebug := nil;{$ENDIF}

  lKAColAddr.Enabled := (Sender as TcxCheckBox).Checked;
  cbKAColAddr.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbKAColPostIndexClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbKAColPostIndexClick') else _udebug := nil;{$ENDIF}

  lKAColPostIndex.Enabled := (Sender as TcxCheckBox).Checked;
  cbKAColPostIndex.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbKAColPhoneClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbKAColPhoneClick') else _udebug := nil;{$ENDIF}

  lKAColPhone.Enabled := (Sender as TcxCheckBox).Checked;
  cbKAColPhone.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbKAColEMailClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbKAColEMailClick') else _udebug := nil;{$ENDIF}

  lKAColEMail.Enabled := (Sender as TcxCheckBox).Checked;
  cbKAColEMail.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbKAColWWWClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbKAColWWWClick') else _udebug := nil;{$ENDIF}

  lKAColWWW.Enabled := (Sender as TcxCheckBox).Checked;
  cbKAColWWW.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.ImportKA;
  var
    i, maxx, fid: Integer;
    strSep, strName, strFullName, strAddr, strINN, strCertNum, strOKPO,
    strKPP, strPostIndex, strPhone, strEMail, strWWW, strFax: string;
    FStartSaldo: Extended;
    FCount: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.ImportKA') else _udebug := nil;{$ENDIF}

  pbMain.Position := 0;
  strSep := rs(Self.Name, 'From');
  i := 0;
  FCount := FEndRow - FStartRow + 1;
  if FCount < 0 then FCount := 0;
  pbMain.Max := FCount;
  lProgressCount.Caption := IntToStr(i) + ' ' + strSep + ' ' + IntToStr(FCount);

  with newDataSet do
    try
      maxx := GetMaxID(dmData.SConnection, 'kagent', 'kaid');

      TrStart;

      InProgress := True;
      for i := FStartRow to FEndRow do begin
        if FCancel then begin
          if ssMessageDlg(rs(Self.Name, 'OkToCancel'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes
            then begin
              TrRollback;

              {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
              Exit;
            end
            else FCancel := False;
        end;

        strName := VarToStr(exlMain.WorkSheet.Cells[i, cbKAColName.ItemIndex + 1].Value);

        if chbKAColFullName.Checked
          then strFullName := VarToStr(exlMain.WorkSheet.Cells[i, cbKAColFullName.ItemIndex + 1].Value)
          else strFullName := '';

        if chbKAColINN.Checked
          then strINN := VarToStr(exlMain.WorkSheet.Cells[i, cbKAColINN.ItemIndex + 1].Value)
          else strINN := '';

        if chbKAColCertNum.Checked
          then strCertNum := VarToStr(exlMain.WorkSheet.Cells[i, cbKAColCertNum.ItemIndex + 1].Value)
          else strCertNum := '';

        if chbKAColOKPO.Checked
          then strOKPO := VarToStr(exlMain.WorkSheet.Cells[i, cbKAColOKPO.ItemIndex + 1].Value)
          else strOKPO := '';

        if chbKAColKPP.Checked
          then strKPP := VarToStr(exlMain.WorkSheet.Cells[i, cbKAColKPP.ItemIndex + 1].Value)
          else strKPP := '';

        if chbKAColAddr.Checked
          then strAddr := VarToStr(exlMain.WorkSheet.Cells[i, cbKAColAddr.ItemIndex + 1].Value)
          else strAddr := '';

        if chbKAColPostIndex.Checked
          then strPostIndex := VarToStr(exlMain.WorkSheet.Cells[i, cbKAColPostIndex.ItemIndex + 1].Value)
          else strPostIndex := '';

        if chbKAColWWW.Checked
          then strWWW := VarToStr(exlMain.WorkSheet.Cells[i, cbKAColWWW.ItemIndex + 1].Value)
          else strWWW := '';

        if chbKAColEMail.Checked
          then strEMail := VarToStr(exlMain.WorkSheet.Cells[i, cbKAColEMail.ItemIndex + 1].Value)
          else strEMail := '';

        if chbKAColPhone.Checked
          then strPhone := VarToStr(exlMain.WorkSheet.Cells[i, cbKAColPhone.ItemIndex + 1].Value)
          else strPhone := '';

        if chbKAColBirthDate.Checked
          then strFax := VarToStr(exlMain.WorkSheet.Cells[i, cbKAColBirthDate.ItemIndex + 1].Value)
          else strFax := '';

        if chbKAStartSaldo.Checked
          then FStartSaldo := VarToFloat(exlMain.WorkSheet.Cells[i, cbKAColStartSaldo.ItemIndex + 1].Value)
          else FStartSaldo := 0;

        lCurrBankName.Caption := strName;

        pbMain.StepIt;
        lProgressCount.Caption := IntToStr(i - FStartRow + 1) + ' ' + strSep + ' ' + IntToStr(FCount);
        Application.ProcessMessages;
        ProviderName := 'pKAgents_GetName';
        FetchParams;
        Params.ParamByName('name').AsString := strName;
        Open;

        if not IsEmpty
          then fid := FieldByName('kaid').AsInteger
          else fid := -1;

        Close;

        if (fid <> -1) and (cbKACheckName.ItemIndex = 1)
          then ProviderName := 'pKAgent_UpdEx'
          else if (fid <> -1) and (cbKACheckName.ItemIndex = 0) then Continue
          else begin
            ProviderName := 'pKAgent_InsEx';
            fid := maxx;
          end;

        FetchParams;
        Params.ParamByName('deleted').AsInteger := 0;
        Params.ParamByName('kaid').AsInteger := FID;
        Params.ParamByName('fullname').AsString := strFullName;
        Params.ParamByName('name').AsString := strName;
        Params.ParamByName('address').AsString := strAddr;
        Params.ParamByName('inn').AsString := strINN;
        Params.ParamByName('certnum').AsString := strCertNum;
        Params.ParamByName('okpo').AsString := strOKPO;
        Params.ParamByName('kpp').AsString := strKPP;
        Params.ParamByName('phone').AsString := strPhone;
        Params.ParamByName('email').AsString := strEMail;
        Params.ParamByName('www').AsString := strWWW;
        Params.ParamByName('fax').AsString := strFax;
        Params.ParamByName('city').AsString := '';
        Params.ParamByName('district').AsString := '';
        Params.ParamByName('country').AsString := '';
        Params.ParamByName('postindex').AsString := strPostIndex;
        Params.ParamByName('notes').AsString := '';

        if (strINN <> '') or (strCertNum <> '')
          then Params.ParamByName('ndspayer').AsInteger := 1
          else Params.ParamByName('ndspayer').AsInteger := 0;

        Params.ParamByName('birthdate').DataType := ftDateTime;
        Params.ParamByName('birthdate').Clear;
        Params.ParamByName('job').DataType := ftString;
        Params.ParamByName('job').Clear;
        Params.ParamByName('ktype').AsInteger := cbKAType.ItemIndex;
        Params.ParamByName('kakind').AsInteger := cbKAKind.ItemIndex;

        if FStartSaldo <> 0 then begin
          Params.ParamByName('startsaldo').AsFloat := FStartSaldo;
          Params.ParamByName('startsaldodate').AsDateTime := Now;
        end
        else begin
          Params.ParamByName('startsaldo').DataType := ftFloat;
          Params.ParamByName('startsaldo').Clear;
          Params.ParamByName('startsaldodate').DataType := ftDateTime;
          Params.ParamByName('startsaldodate').Clear;
        end;
        try
          Execute;
          maxx := GetMaxID(dmData.SConnection, 'kagent', 'kaid');

          if FStartSaldo <> 0 then begin
            ProviderName := 'pKA_InsSaldo';
            FetchParams;
            Params.ParamByName('kaid').AsInteger := fid;
            Params.ParamByName('ondate').AsDateTime := Now;
            Params.ParamByName('saldo').AsFloat := FStartSaldo;
            Execute;
          end;

          if strAddr <> '' then begin
            ProviderName := 'pKAAddr_Ins';
            FetchParams;
            Params.ParamByName('kaid').AsInteger := FID;
            Params.ParamByName('addrid').AsInteger := GetMaxID(dmData.SConnection, 'kaaddr', 'addrid');;
            Params.ParamByName('addrtype').AsInteger := 0;
            Params.ParamByName('Address').AsString := strAddr;
            Params.ParamByName('Country').AsString := '';
            Params.ParamByName('District').AsString := '';
            Params.ParamByName('City').AsString := '';
            Params.ParamByName('PostIndex').AsString := '';
            Execute;
          end;

        except
          FLog.Add(strName + ';' + strFullName);
        end;

        Application.ProcessMessages;
      end;

      TrCommit;

      exlMain.Connected := False;

    finally
      Free;
      InProgress := False;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.SetImportRange;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.SetImportRange') else _udebug := nil;{$ENDIF}

  if edStartRow.EditText = ''
    then FStartRow := 1
    else FStartRow := edStartRow.Value;

  if edEndRow.EditText = ''
    then FEndRow := FRowCount
    else FEndRow := edEndRow.Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbMatColPT1Click(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbMatColPT1Click') else _udebug := nil;{$ENDIF}

  lcbPriceType1.Enabled := (Sender as TcxCheckBox).Checked;
  cbMatColPT1.Enabled := (Sender as TcxCheckBox).Checked;
  lcbPT1Curr.Enabled := (Sender as TcxCheckBox).Checked;
  chbPT1NDS.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbMatColPT2Click(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbMatColPT2Click') else _udebug := nil;{$ENDIF}

  lcbPriceType2.Enabled := (Sender as TcxCheckBox).Checked;
  cbMatColPT2.Enabled := (Sender as TcxCheckBox).Checked;
  lcbPT2Curr.Enabled := (Sender as TcxCheckBox).Checked;
  chbPT2NDS.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbMatColPT3Click(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbMatColPT3Click') else _udebug := nil;{$ENDIF}

  lcbPriceType3.Enabled := (Sender as TcxCheckBox).Checked;
  cbMatColPT3.Enabled := (Sender as TcxCheckBox).Checked;
  lcbPT3Curr.Enabled := (Sender as TcxCheckBox).Checked;
  chbPT3NDS.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbMatColPT4Click(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbMatColPT4Click') else _udebug := nil;{$ENDIF}

  lcbPriceType4.Enabled := (Sender as TcxCheckBox).Checked;
  cbMatColPT4.Enabled := (Sender as TcxCheckBox).Checked;
  lcbPT4Curr.Enabled := (Sender as TcxCheckBox).Checked;
  chbPT4NDS.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbMatColArtikulClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbMatColArtikulClick') else _udebug := nil;{$ENDIF}

  lMatColArtikul.Enabled := (Sender as TcxCheckBox).Checked;
  cbMatColArtikul.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbMatColMeasureClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbMatColMeasureClick') else _udebug := nil;{$ENDIF}

  lMatColMeasure.Enabled := (Sender as TcxCheckBox).Checked;
  cbMatColMeasure.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbMatColBarCodeClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbMatColBarCodeClick') else _udebug := nil;{$ENDIF}

  lMatColBarCode.Enabled := (Sender as TcxCheckBox).Checked;
  cbMatColBarCode.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbMatColProducerClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbMatColProducerClick') else _udebug := nil;{$ENDIF}

  lMatColProducer.Enabled := (Sender as TcxCheckBox).Checked;
  cbMatColProducer.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.btnGrpParentClick(Sender: TObject);
  var
    aid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.btnGrpParentClick') else _udebug := nil;{$ENDIF}

  try
    aid := lcbMatGrp.Value;

  except
    aid := 0;
  end;

  ShowModalRef(Self, rtMatGroup, vtMatGroup, 'TfmMatGroup', Date, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.lcbMatGrpGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.lcbMatGrpGetNodeImageIndex') else _udebug := nil;{$ENDIF}

  if ANode.Expanded
    then AIndex := 49
    else AIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtMatGroup:
      begin
        DSRefresh(cdsParent, 'grpid', M.WParam);
        lcbMatGrp.Value := M.WParam;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.ImportMats;
  var
    i, maxx, fid, FNum: Integer;
    strSep, strBarCode, strProducer,
    strPT1, strPT2, strPT3, strPT4: string;
    strMeasure: string[6];
    strName: string[128];
    strArtikul: string[80];
    FCount, FDefMID, FMID, FWBillID, FWBNum, FDetID, FtmpRateID: Integer;
    cdsM: TssClientDataSet;
    FAmount, FPrice, FNDS, FSum, FPosSum, FPosNDS: Extended;
    FtmpDate: TDateTime;
    FCurrRate: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.ImportMats') else _udebug := nil;{$ENDIF}

  FCurrRate := 0;
  pbMain.Position := 0;
  FWBNum := 0;
  FSum := 0; FPosNDS := 0; FPosSum := 0;
  FWBillID := 0;
  strSep := rs(Self.Name, 'From');
  i := 0;

  FCount := FEndRow - FStartRow + 1;
  if FCount < 0 then FCount := 0;

  pbMain.Max := FCount;
  lProgressCount.Caption := IntToStr(i) + ' ' + strSep + ' ' + IntToStr(FCount);

  cdsM := newDataSet;

  with newDataSet do
    try
      maxx := GetMaxID(dmData.SConnection, 'materials', 'matid');
      TrStart;

      cdsM.ProviderName := 'pMeasures_List';
      cdsM.Open;
      if not cdsM.IsEmpty then begin
        cdsM.Locate('def', 1, []);
        FDefMID := cdsM.FieldByName('mid').AsInteger;
      end

      else begin
        ProviderName := 'pSQL';
        FetchMacros;
        Macros.ParamByName('sql').AsString := 
          'insert into measures (mid, name, shortname, def, deleted) values '
          + '(100, ''' + rs(Self.Name,'msrdeflong') + ''', ''' + rs(Self.Name,'msrdefshort') + ''', 1, 0)';
        Execute;
        cdsM.Close;
        cdsM.Open;
        FDefMID := 100;
      end;

      if chbMRWH1.Checked or chbMRWH2.Checked or chbMRWH3.Checked or chbMRWH4.Checked
         and (FStartRow <= FEndRow)
      then begin
          FWBillID := GetMaxID(dmData.SConnection, 'waybilllist', 'wbillid');
          FWBNum := Gen_ID(dmData.SConnection, 'gen_wbrest', 1);
          FDetID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
          FNum := 1;

          ProviderName := 'pWaybill_Ins';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := FWBillID;
          Params.ParamByName('num').AsString := IntToStr(FWBNum);
          Params.ParamByName('ondate').AsDateTime := edMRDate.Date;
          Params.ParamByName('kaid').DataType := ftInteger;
          Params.ParamByName('kaid').Clear;
          Params.ParamByName('currid').AsInteger := lcbMRCurr.KeyValue;
          Params.ParamByName('attnum').DataType := ftString;
          Params.ParamByName('attnum').Clear;
          Params.ParamByName('attdate').DataType := ftDateTime;
          Params.ParamByName('attdate').Clear;
          Params.ParamByName('reason').DataType := ftString;
          Params.ParamByName('reason').Clear;
          Params.ParamByName('notes').DataType := ftString;
          Params.ParamByName('notes').Clear;
          Params.ParamByName('personid').DataType := ftInteger;
          Params.ParamByName('personid').Clear;
          Params.ParamByName('checked').AsInteger := 1;
          Params.ParamByName('deleted').AsInteger := 0;
          Params.ParamByName('wtype').AsInteger := 5;

          if EntNDSPayer = 1
            then FNDS := NDS
            else FNDS := 0;

          Params.ParamByName('nds').AsFloat := FNDS;
          Params.ParamByName('received').DataType := ftString;
          Params.ParamByName('received').Clear;
          Params.ParamByName('todate').DataType := ftDateTime;
          Params.ParamByName('todate').Clear;
          Params.ParamByName('defnum').AsInteger := FWBNum;
          Execute;

          FCurrRate := GetCurrencyRate(dmData.SConnection, lcbMRCurr.KeyValue, edMRDate.Date, FtmpDate, FtmpRateID);
        end;

      InProgress := True;

      for i := FStartRow to FEndRow do begin
        if FCancel then begin
          if ssMessageDlg(rs(Self.Name, 'OkToCancel'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes
            then begin
              TrRollback;

              if FWBNum <> 0 then Gen_ID(dmData.SConnection, 'gen_wbrest', -1);
              {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
              Exit;
            end
            else FCancel := False;
        end;
 
        strName := Trim(VarToStr(exlMain.WorkSheet.Cells[i, cbMatColName.ItemIndex + 1].Value));

        if chbMatColArtikul.Checked
          then strArtikul := Trim(VarToStr(exlMain.WorkSheet.Cells[i, cbMatColArtikul.ItemIndex + 1].Value))
          else strArtikul := '';

        if chbMatColMeasure.Checked
          then strMeasure := VarToStr(exlMain.WorkSheet.Cells[i, cbMatColMeasure.ItemIndex + 1].Value)
          else strMeasure := '';

        if chbMatColBarCode.Checked
          then strBarCode := VarToStr(exlMain.WorkSheet.Cells[i, cbMatColBarCode.ItemIndex + 1].Value)
          else strBarCode := '';

        if chbMatColProducer.Checked
          then strProducer := VarToStr(exlMain.WorkSheet.Cells[i, cbMatColProducer.ItemIndex + 1].Value)
          else strProducer := '';

        if chbMatColPT1.Checked
          then strPT1 := VarToStr(exlMain.WorkSheet.Cells[i, cbMatColPT1.ItemIndex + 1].Value)
          else strPT1 := '';

        if chbMatColPT2.Checked
          then strPT2 := VarToStr(exlMain.WorkSheet.Cells[i, cbMatColPT2.ItemIndex + 1].Value)
          else strPT2 := '';

        if chbMatColPT3.Checked
          then strPT3 := VarToStr(exlMain.WorkSheet.Cells[i, cbMatColPT3.ItemIndex + 1].Value)
          else strPT3 := '';

        if chbMatColPT4.Checked
          then strPT4 := VarToStr(exlMain.WorkSheet.Cells[i, cbMatColPT4.ItemIndex + 1].Value)
          else strPT4 := '';

        lCurrBankName.Caption := strName;

        pbMain.StepIt;
        lProgressCount.Caption := IntToStr(i - FStartRow + 1) + ' ' + strSep + ' ' + IntToStr(FCount);
        Application.ProcessMessages;

        ProviderName := 'pMat_GetName';
        FetchParams;
        Params.ParamByName('name').AsString := strName;
        Open;
        if not IsEmpty
          then fid := FieldByName('matid').AsInteger
          else fid := -1;
        Close;

        if Trim(strMeasure) = '' 
          then FMID := FDefMID
          else begin
            if cdsM.Locate('shortname', strMeasure, [])
              then FMID := cdsM.FieldByName('mid').AsInteger
              else begin
                FMID := GetMaxID(dmData.SConnection, 'measures', 'mid');
                ProviderName := 'pMeasures_Ins';
                FetchParams;
                Params.ParamByName('mid').AsInteger := FMID;
                Params.ParamByName('name').AsString := strMeasure;
                Params.ParamByName('shortname').AsString := strMeasure;
                Params.ParamByName('def').AsInteger := 0;
                Execute;
                cdsM.Close;
                cdsM.Open;
              end;
          end;

        if (fid <> -1) and (cbMatCheckName.ItemIndex = 1)
          then ProviderName := 'pMaterials_Upd'
          else if (fid <> -1) and (cbMatCheckName.ItemIndex = 0)
            then Continue
            else begin
              ProviderName := 'pMaterials_Ins';
              fid := maxx;
            end;

        FetchParams;
        Params.ParamByName('def').AsInteger := 0;
        Params.ParamByName('matid').AsInteger := fid;
        Params.ParamByName('artikul').AsString := strArtikul;
        Params.ParamByName('name').AsString := strName;
        Params.ParamByName('notes').AsString := '';
        Params.ParamByName('deleted').AsInteger := 0;
        Params.ParamByName('grpid').AsInteger := lcbMatGrp.Value;
        Params.ParamByName('wid').DataType := ftInteger;
        Params.ParamByName('wid').Clear;
        Params.ParamByName('num').AsInteger := i;
        Params.ParamByName('producer').AsString := strProducer;
        Params.ParamByName('cid').DataType := ftInteger;
        Params.ParamByName('cid').Clear;
        Params.ParamByName('weight').AsFloat := 0;
        Params.ParamByName('msize').AsFloat := 0;
        Params.ParamByName('barcode').AsString := strBarCode;
        Params.ParamByName('demandcat').DataType := ftInteger;
        Params.ParamByName('demandcat').Clear;
        Params.ParamByName('minreserv').DataType := ftFloat;
        Params.ParamByName('minreserv').Clear;
        Params.ParamByName('mid').AsInteger := FMID;
        Params.ParamByName('nds').DataType := ftFloat;
        Params.ParamByName('nds').Clear;

        try
          Execute;
          maxx := GetMaxID(dmData.SConnection, 'materials', 'matid');

          if ProviderName = 'pMaterials_Upd' then begin
            ProviderName := 'pMatPrices_Del';
            FetchParams;
            Params.ParamByName('matid').AsInteger := fid;
            Execute;
          end;

          ProviderName := 'pMatPrices_Ins';
          FetchParams;
          Params.ParamByName('dis').AsInteger := 0;

          if chbMatColPT1.Checked then begin
            Params.ParamByName('matid').AsInteger := fid;
            Params.ParamByName('ptypeid').AsInteger := lcbPriceType1.KeyValue;
            Params.ParamByName('currid').AsInteger := lcbPT1Curr.KeyValue;
            Params.ParamByName('extratype').AsInteger := 1;
            Params.ParamByName('withnds').AsInteger := Integer(chbPT1NDS.Checked);

            try
              Params.ParamByName('onvalue').AsFloat := 
                StrToFloat(DelChars(ReplaceStr(ReplaceStr(strPT1, '.', DecimalSeparator), ',', DecimalSeparator), [' ', ThousandSeparator]));

            except
              strPT1 := '';
            end;

            if strPT1 <> '' then Execute;
          end;

          if chbMatColPT2.Checked then begin
            Params.ParamByName('matid').AsInteger := fid;
            Params.ParamByName('ptypeid').AsInteger := lcbPriceType2.KeyValue;
            Params.ParamByName('currid').AsInteger := lcbPT2Curr.KeyValue;
            Params.ParamByName('extratype').AsInteger := 1;
            Params.ParamByName('withnds').AsInteger := Integer(chbPT2NDS.Checked);

            try
              Params.ParamByName('onvalue').AsFloat := 
                StrToFloat(DelChars(ReplaceStr(ReplaceStr(strPT2, '.', DecimalSeparator), ',', DecimalSeparator), [' ', ThousandSeparator]));

            except
              strPT2 := '';
            end;

            if strPT2 <> '' then Execute;
          end;

          if chbMatColPT3.Checked then begin
            Params.ParamByName('matid').AsInteger := fid;
            Params.ParamByName('ptypeid').AsInteger := lcbPriceType3.KeyValue;
            Params.ParamByName('currid').AsInteger := lcbPT3Curr.KeyValue;
            Params.ParamByName('extratype').AsInteger := 1;
            Params.ParamByName('withnds').AsInteger := Integer(chbPT3NDS.Checked);

            try
              Params.ParamByName('onvalue').AsFloat := 
                StrToFloat(DelChars(ReplaceStr(ReplaceStr(strPT3, '.', DecimalSeparator), ',', DecimalSeparator), [' ', ThousandSeparator]));

            except
              strPT3 := '';
            end;

            if strPT3 <> '' then Execute;
          end;

          if chbMatColPT4.Checked then begin
            Params.ParamByName('matid').AsInteger := fid;
            Params.ParamByName('ptypeid').AsInteger := lcbPriceType4.KeyValue;
            Params.ParamByName('currid').AsInteger := lcbPT4Curr.KeyValue;
            Params.ParamByName('extratype').AsInteger := 1;
            Params.ParamByName('withnds').AsInteger := Integer(chbPT4NDS.Checked);

            try
              Params.ParamByName('onvalue').AsFloat := 
                StrToFloat(DelChars(ReplaceStr(ReplaceStr(strPT4, '.', DecimalSeparator), ',', DecimalSeparator), [' ', ThousandSeparator]));

            except
              strPT4 := '';
            end;

            if strPT4 <> '' then Execute;
          end;

          if FWBillID > 0 then begin
            ProviderName := 'pWaybillDet_Ins';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FWBillID;
            Params.ParamByName('matid').AsInteger := fid;
            Params.ParamByName('ondate').AsDateTime := edMRDate.Date;
            Params.ParamByName('ptypeid').DataType := ftInteger;
            Params.ParamByName('ptypeid').Clear;
            Params.ParamByName('currid').AsInteger := lcbMRCurr.KeyValue;

            if FCurrRate = 0 then FCurrRate := 1;

            Params.ParamByName('onvalue').AsFloat := FCurrRate;
            Params.ParamByName('discount').AsFloat := 0;

            if chbMRWH1.Checked then begin
              Params.ParamByName('posid').AsInteger := FDetID;
              Params.ParamByName('wid').AsInteger := lcbMRWH1.KeyValue;

              try
                FAmount := exlMain.WorkSheet.Cells[i, cbMRRest1.ItemIndex + 1].Value;
                //if FAmount < 0 then FAmount := 0;
              except
                FAmount := 0;
              end;

              try
                FPrice := exlMain.WorkSheet.Cells[i, cbMRPrice1.ItemIndex + 1].Value;
              except
                FPrice := 0;
              end;

              if FAmount <> 0 then begin
                Params.ParamByName('amount').AsFloat := FAmount;

                if chbMRNDS1.Checked
                  then Params.ParamByName('price').AsFloat := FPrice
                  else Params.ParamByName('price').AsFloat := NDSIn(FPrice, FNDS);

                Params.ParamByName('nds').AsFloat := FNDS;
                Params.ParamByName('num').AsInteger := FNum;
                NDSCalc(FAmount, FPrice, FNDS, 1, FPosSum, FPosNDS);
                FPosSum := FPosSum + FPosNDS;
                Params.ParamByName('total').AsFloat := FPosSum;
                Execute;

                FSum := FSum + RoundToA(FPosSum * FCurrRate, -2);
                Inc(FNum);
                FDetID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
              end;
            end;

            if chbMRWH2.Checked then begin
              Params.ParamByName('posid').AsInteger := FDetID;
              Params.ParamByName('wid').AsInteger := lcbMRWH2.KeyValue;

              try
                FAmount := exlMain.WorkSheet.Cells[i, cbMRRest2.ItemIndex + 1].Value;
              except
                FAmount := 0;
              end;

              try
                FPrice := exlMain.WorkSheet.Cells[i, cbMRPrice2.ItemIndex + 1].Value;
              except
                FPrice := 0;
              end;

              if FAmount <> 0 then begin
                Params.ParamByName('amount').AsFloat := FAmount;

                if chbMRNDS2.Checked
                  then Params.ParamByName('price').AsFloat := FPrice
                  else Params.ParamByName('price').AsFloat := NDSIn(FPrice, FNDS);

                Params.ParamByName('nds').AsFloat := FNDS;
                Params.ParamByName('num').AsInteger := FNum;
                NDSCalc(FAmount, FPrice, FNDS, 1, FPosSum, FPosNDS);
                FPosSum := FPosSum + FPosNDS;
                Params.ParamByName('total').AsFloat := FPosSum;
                Execute;
                FSum := FSum + RoundToA(FPosSum*FCurrRate, -2);
                Inc(FNum);
                FDetID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
              end;
            end;

            if chbMRWH3.Checked then begin
              Params.ParamByName('posid').AsInteger := FDetID;
              Params.ParamByName('wid').AsInteger := lcbMRWH3.KeyValue;

              try
                FAmount := exlMain.WorkSheet.Cells[i, cbMRRest3.ItemIndex + 1].Value;
              except
                FAmount := 0;
              end;

              try
                FPrice := exlMain.WorkSheet.Cells[i, cbMRPrice3.ItemIndex + 1].Value;
              except
                FPrice := 0;
              end;

              if FAmount <> 0 then begin
                Params.ParamByName('amount').AsFloat := FAmount;

                if chbMRNDS3.Checked
                  then Params.ParamByName('price').AsFloat := FPrice
                  else Params.ParamByName('price').AsFloat := NDSIn(FPrice, FNDS);

                Params.ParamByName('nds').AsFloat := FNDS;
                Params.ParamByName('num').AsInteger := FNum;
                NDSCalc(FAmount, FPrice, FNDS, 1, FPosSum, FPosNDS);
                FPosSum := FPosSum + FPosNDS;
                Params.ParamByName('total').AsFloat := FPosSum;
                Execute;
                FSum := FSum + RoundToA(FPosSum*FCurrRate, -2);
                Inc(FNum);
                FDetID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
              end;
            end;

            if chbMRWH4.Checked then begin
              Params.ParamByName('posid').AsInteger := FDetID;
              Params.ParamByName('wid').AsInteger := lcbMRWH4.KeyValue;

              try
                FAmount := exlMain.WorkSheet.Cells[i, cbMRRest4.ItemIndex + 1].Value;
              except
                FAmount := 0;
              end;

              try
                FPrice := exlMain.WorkSheet.Cells[i, cbMRPrice4.ItemIndex + 1].Value;
              except
                FPrice := 0;
              end;

              if FAmount <> 0 then begin
                Params.ParamByName('amount').AsFloat := FAmount;

                if chbMRNDS4.Checked
                  then Params.ParamByName('price').AsFloat := FPrice
                  else Params.ParamByName('price').AsFloat := NDSIn(FPrice, FNDS);

                Params.ParamByName('nds').AsFloat := FNDS;
                Params.ParamByName('num').AsInteger := FNum;
                NDSCalc(FAmount, FPrice, FNDS, 1, FPosSum, FPosNDS);
                FPosSum := FPosSum + FPosNDS;
                Params.ParamByName('total').AsFloat := FPosSum;
                Execute;
                FSum := FSum + RoundToA(FPosSum*FCurrRate, -2);
                Inc(FNum);
                FDetID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
              end;
            end;
          end;

        except
          on e: exception do
            FLog.Add(strName + ';' + strArtikul + '  ' + e.message);
        end;

        Application.ProcessMessages;
      end;

      if FWBillID > 0 then begin
        ProviderName := 'pWMatTurn_InsEx';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := FWBillID;
        Execute;

        ProviderName := 'pWB_UpdSum';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := FWBillID;
        Params.ParamByName('summall').AsCurrency := FSum;
        Execute;
      end;

      TrCommit;

      if FWBillID > 0 then frmMainForm.ExecRefresh('TfmWBRest', 0);

      frmMainForm.ExecRefresh('TfmMaterials', 0);
      exlMain.Connected := False;

    finally
      Free;
      cdsM.Free;
      InProgress := False;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.tsProgressShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.tsProgressShow') else _udebug := nil;{$ENDIF}
                                 
  lProgressName.Caption := cbDataType.Text + ':';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.aPriorExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.aPriorExecute') else _udebug := nil;{$ENDIF}

  if (pcMain.ActivePage = tsData) and (pcData.ActivePage = tsDataMatRests)
    then pcData.ActivePage := tsDataMats
    else inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbMRWH1Click(Sender: TObject);
  var
    FEn: Boolean;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbMRWH1Click') else _udebug := nil;{$ENDIF}

  FEn := chbMRWH1.Checked;
  lcbMRWH1.Enabled := FEn;
  btnMRWH1.Enabled := FEn;
  cbMRRest1.Enabled := FEn;
  chbMRNDS1.Enabled := FEn;
  cbMRPrice1.Enabled := FEn;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbMRWH2Click(Sender: TObject);
  var
    FEn: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbMRWH2Click') else _udebug := nil;{$ENDIF}

  FEn := chbMRWH2.Checked;
  lcbMRWH2.Enabled := FEn;
  btnMRWH2.Enabled := FEn;
  cbMRRest2.Enabled := FEn;
  chbMRNDS2.Enabled := FEn;
  cbMRPrice2.Enabled := FEn;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbMRWH3Click(Sender: TObject);
  var
    FEn: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbMRWH3Click') else _udebug := nil;{$ENDIF}

  FEn := chbMRWH3.Checked;
  lcbMRWH3.Enabled := FEn;
  btnMRWH3.Enabled := FEn;
  cbMRRest3.Enabled := FEn;
  cbMRPrice3.Enabled := FEn;
  chbMRNDS3.Enabled := FEn;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbMRWH4Click(Sender: TObject);
  var
    FEn: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbMRWH4Click') else _udebug := nil;{$ENDIF}

  FEn := chbMRWH4.Checked;
  lcbMRWH4.Enabled := FEn;
  btnMRWH4.Enabled := FEn;
  cbMRRest4.Enabled := FEn;
  cbMRPrice4.Enabled := FEn;
  chbMRNDS4.Enabled := FEn;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.cdsCurrAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.cdsCurrAfterOpen') else _udebug := nil;{$ENDIF}

  cdsCurr.Locate('def', 1, []);
  lcbPT1Curr.KeyValue := cdsCurr.fieldbyname('currid').AsInteger;
  lcbPT2Curr.KeyValue := cdsCurr.fieldbyname('currid').AsInteger;
  lcbPT3Curr.KeyValue := cdsCurr.fieldbyname('currid').AsInteger;
  lcbPT4Curr.KeyValue := cdsCurr.fieldbyname('currid').AsInteger;
  lcbMRCurr.KeyValue := cdsCurr.fieldbyname('currid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.pcDataChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.pcDataChange') else _udebug := nil;{$ENDIF}

  pcMainChange(pcMain);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbKAStartSaldoClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbKAStartSaldoClick') else _udebug := nil;{$ENDIF}

  lKAStartSaldo.Enabled := (Sender as TcxCheckBox).Checked;
  cbKAColStartSaldo.Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.chbBanksColCAClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.chbBanksColCAClick') else _udebug := nil;{$ENDIF}

  lBanksCA.Enabled := chbBanksColCA.Checked;
  cbBanksColCA.Enabled := chbBanksColCA.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExImportWiz.cdsWHBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExImportWiz.cdsWHBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWH.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ExImportWiz', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
