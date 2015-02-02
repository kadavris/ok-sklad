{$I ok_sklad.inc}
unit Options;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ActnList, StdCtrls, ComCtrls, DB, DBClient, ImgList,
  Buttons, TB2Item, Menus,

  dxCntner6, dxEditor6, dxTL6, dxDBCtrl6, dxDBGrid6, dxTLClms6,

  ssBaseTypes, ssFormStorage, ssImagePanel, ssDBComboBox, ssClientDataSet, ssBaseSkinForm,
  ssSpeedButton, ssPanel, ssGradientPanel, ssBevel, ssDBLookupCombo, ssBaseIntfDlg,
  ssGroupBox, ssLabel, ssMemDS, ssBaseConst, okLabel, okFontComboBox,

  cxLookAndFeelPainters, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, cxTreeView,
  cxCheckBox, cxPC, cxMaskEdit, cxDropDownEdit, cxMemo, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCurrencyEdit, cxColorComboBox, cxGroupBox, cxSpinEdit, cxDBEdit, cxTimeEdit, cxRadioGroup, cxButtonEdit,
  cxCalc, ssCalcEdit, cxListView,

  xLngDefs, xButton, FR_Combo, JvBaseDlg, JvBrowseFolder, cxImageComboBox,
  cxFontNameComboBox, cxLabel, JvExExtCtrls, JvBevel;

type
  TfrmOptions = class(TfrmBaseIntfDlg)
    aAccDel: TAction;
    aAccNew: TAction;
    aAccountRef: TAction;
    aAccProps: TAction;
    aBanksRef: TAction;
    aHelp: TAction;
    btnAccDel: TssSpeedButton;
    btnAccLevelUp: TssSpeedButton;
    btnAccNew: TssSpeedButton;
    btnAccountRef: TssSpeedButton;
    btnAccProps: TssSpeedButton;
    btnBankRef: TssSpeedButton;
    btnClear: TssSpeedButton;
    btnHelp: TssSpeedButton;
    btnLock: TssSpeedButton;
    btnLogo: TssSpeedButton;
    btnSendErrMessage: TssSpeedButton;
    btnUndo: TssSpeedButton;
    bvlAccountSep: TssBevel;
    cbBackupInterval: TcxComboBox;
    cbChargeType: TcxComboBox;
    cbLang: TcxComboBox;
    cbMultiEntsViewType: TcxComboBox;
    cbOddColor: TcxColorComboBox;
    cbPrintType: TcxComboBox;
    cbRepLang: TcxComboBox;
    cbUSInterval: TcxComboBox;
    cbWBInAddType: TcxComboBox;
    cbWBOutAddType: TcxComboBox;
    cbWBOutPriceType: TcxComboBox;
    cdsAccountType: TssClientDataSet;
    cdsBanks: TssClientDataSet;
    cdsDB: TssClientDataSet;
    cdsDBbackupdir: TStringField;
    cdsDBDBID: TIntegerField;
    cdsDBDEF: TIntegerField;
    cdsDBDESC: TStringField;
    cdsDBEnabled: TIntegerField;
    cdsDBfbackupdir: TStringField;
    cdsDBfbackuptime: TDateTimeField;
    cdsDBfintervaltype: TStringField;
    cdsDBfintervalvalue: TIntegerField;
    cdsDBfnode: TIntegerField;
    cdsDBfupdintervaltype: TStringField;
    cdsDBfupdintervalvalue: TIntegerField;
    cdsDBfupdnode: TIntegerField;
    cdsDBfupdtime: TDateTimeField;
    cdsDBIntervalType: TStringField;
    cdsDBIntervalValue: TIntegerField;
    cdsDBOnTime: TDateTimeField;
    cdsDBupdenabled: TIntegerField;
    cdsDBupdintervaltype: TStringField;
    cdsDBupdintervalvalue: TIntegerField;
    cdsDBupdtime: TDateTimeField;
    cdsPriceTypes: TssClientDataSet;
    chbAccTypes: TcxCheckBox;
    chbAOAutoNum: TcxCheckBox;
    chbAOAutoWH: TcxCheckBox;
    chbAOSelectNP: TcxCheckBox;
    chbBanks: TcxCheckBox;
    chbBC_Weight: TcxCheckBox;
    chbCheckCurrency: TcxCheckBox;
    chbCheckMoney: TcxCheckBox;
    chbCountries: TcxCheckBox;
    chbCurrency: TcxCheckBox;
    chbDelToBin: TcxCheckBox;
    chbFilterOnSearch: TcxCheckBox;
    chbHLWMatNeeded: TcxCheckBox;
    chbInvAutoNum: TcxCheckBox;
    chbInvChecked: TcxCheckBox;
    chbInvoiceAutoNum: TcxCheckBox;
    chbKA: TcxCheckBox;
    chbMat: TcxCheckBox;
    chbMatGroups: TcxCheckBox;
    chbMeasures: TcxCheckBox;
    chbNDSPayer: TcxCheckBox;
    chbNextCtrlOnEnter: TcxCheckBox;
    chbOISelectNP: TcxCheckBox;
    chbOOSelectNP: TcxCheckBox;
    chbOperLog: TcxCheckBox;
    chbOrdersInAutoNum: TcxCheckBox;
    chbOrdersOutAutoNum: TcxCheckBox;
    chbPayDoc: TcxCheckBox;
    chbPDChargeAutoNum: TcxCheckBox;
    chbPDChargeChecked: TcxCheckBox;
    chbPDInAutoNum: TcxCheckBox;
    chbPDInChecked: TcxCheckBox;
    chbPDOutAutoNum: TcxCheckBox;
    chbPDOutChecked: TcxCheckBox;
    chbPriceTypes: TcxCheckBox;
    chbRetInAutoNum: TcxCheckBox;
    chbRetInChecked: TcxCheckBox;
    chbRetOutAutoNum: TcxCheckBox;
    chbRetOutChecked: TcxCheckBox;
    chbShowAllMats: TcxCheckBox;
    chbShowCalc: TcxCheckBox;
    chbShowRetNDS: TcxCheckBox;
    chbTax: TcxCheckBox;
    chbTaxAutoNum: TcxCheckBox;
    chbWB: TcxCheckBox;
    chbWBInAllowZero: TcxCheckBox;
    chbWBInAutoNum: TcxCheckBox;
    chbWBInAutoPrice: TcxCheckBox;
    chbWBInChecked: TcxCheckBox;
    chbWBMoveAutoNum: TcxCheckBox;
    chbWBMoveChecked: TcxCheckBox;
    chbWBOutAllowZero: TcxCheckBox;
    chbWBOutAutoNum: TcxCheckBox;
    chbWBOutAutoWH: TcxCheckBox;
    chbWBOutChecked: TcxCheckBox;
    chbWBOutDCCheck: TcxCheckBox;
    chbWBRestAllowZero: TcxCheckBox;
    chbWBRestAutoNum: TcxCheckBox;
    chbWBRestChecked: TcxCheckBox;
    chbWHouses: TcxCheckBox;
    chbWriteOffAutoNum: TcxCheckBox;
    chbWriteOffChecked: TcxCheckBox;
    colAccMFO: TdxDBGridColumn;
    colAccNum: TdxDBGridColumn;
    colAccType: TdxDBGridColumn;
    colDBName: TdxDBGridColumn;
    colDBOnTime: TdxDBGridColumn;
    colDBOptions: TdxDBGridColumn;
    colEnabled: TdxDBGridColumn;
    colIntervalType: TdxDBGridColumn;
    colIntervalValue: TdxDBGridColumn;
    colJump: TdxTreeListImageColumn;
    colUSEnabled: TdxDBGridColumn;
    colUSIntervalType: TdxDBGridColumn;
    colUSIntervalValue: TdxDBGridColumn;
    colUSName: TdxDBGridColumn;
    colUSText: TdxDBGridColumn;
    colUSTime: TdxDBGridColumn;
    dlgDir: TJvBrowseForFolderDialog;
    dsAccountType: TDataSource;
    dsBanks: TDataSource;
    dsPriceTypes: TDataSource;
    edAccount: TcxDBTextEdit;
    edAOCurrNum: TcxSpinEdit;
    edAODefAmount: TcxCurrencyEdit;
    edAOPrefix: TcxTextEdit;
    edAOSelectNP: TcxColorComboBox;
    edAOSuffix: TcxTextEdit;
    edBackupDir: TcxButtonEdit;
    edBackupInterval: TcxSpinEdit;
    edBackupTime: TcxTimeEdit;
    edBCCodeFracFrom: TcxSpinEdit;
    edBCCodeFracTo: TcxSpinEdit;
    edBCCodeFrom: TcxSpinEdit;
    edBCCodeIntFrom: TcxSpinEdit;
    edBCCodeIntTo: TcxSpinEdit;
    edBCCodeTo: TcxSpinEdit;
    edBCFirstDigit: TcxSpinEdit;
    edEntCertNum: TcxTextEdit;
    edEntINN: TcxTextEdit;
    edEntName: TcxTextEdit;
    edEntOKPO: TcxTextEdit;
    edEntPhone: TcxTextEdit;
    edHLWMatNeeded: TcxColorComboBox;
    edInvCurrNum: TcxSpinEdit;
    edInvoiceCurrNum: TcxSpinEdit;
    edInvoiceDefAmount: TcxCurrencyEdit;
    edInvoicePrefix: TcxTextEdit;
    edInvoiceSuffix: TcxTextEdit;
    edInvPrefix: TcxTextEdit;
    edInvSuffix: TcxTextEdit;
    edKPP: TcxTextEdit;
    edMatPrecision: TcxSpinEdit;
    edOISelectNP: TcxColorComboBox;
    edOOSelectNP: TcxColorComboBox;
    edOrdersInCurrNum: TcxSpinEdit;
    edOrdersInDefAmount: TcxCurrencyEdit;
    edOrdersInPrefix: TcxTextEdit;
    edOrdersInSuffix: TcxTextEdit;
    edOrdersOutCurrNum: TcxSpinEdit;
    edOrdersOutDefAmount: TcxCurrencyEdit;
    edOrdersOutPrefix: TcxTextEdit;
    edOrdersOutSuffix: TcxTextEdit;
    edPDChargeCurrNum: TcxSpinEdit;
    edPDChargePrefix: TcxTextEdit;
    edPDChargeSuffix: TcxTextEdit;
    edPDInCurrNum: TcxSpinEdit;
    edPDInPrefix: TcxTextEdit;
    edPDInSuffix: TcxTextEdit;
    edPDOutCurrNum: TcxSpinEdit;
    edPDOutPrefix: TcxTextEdit;
    edPDOutSuffix: TcxTextEdit;
    edRetInCurrNum: TcxSpinEdit;
    edRetInPrefix: TcxTextEdit;
    edRetInSuffix: TcxTextEdit;
    edRetOutCurrNum: TcxSpinEdit;
    edRetOutPrefix: TcxTextEdit;
    edRetOutSuffix: TcxTextEdit;
    edShowPricePrec: TcxSpinEdit;
    edTaxCurrNum: TcxSpinEdit;
    edTaxPrefix: TcxTextEdit;
    edTaxSuffix: TcxTextEdit;
    edTaxWBDefAmount: TcxCurrencyEdit;
    edUSInterval: TcxSpinEdit;
    edUSTime: TcxTimeEdit;
    edWBInCurrNum: TcxSpinEdit;
    edWBInDefAmount: TcxCurrencyEdit;
    edWBInPrefix: TcxTextEdit;
    edWBInSuffix: TcxTextEdit;
    edWBMoveCurrNum: TcxSpinEdit;
    edWBMoveDefAmount: TcxCurrencyEdit;
    edWBMovePrefix: TcxTextEdit;
    edWBMoveSuffix: TcxTextEdit;
    edWBOutCurrNum: TcxSpinEdit;
    edWBOutDefAmount: TcxCurrencyEdit;
    edWBOutPrefix: TcxTextEdit;
    edWBOutSuffix: TcxTextEdit;
    edWBRestCurrNum: TcxSpinEdit;
    edWBRestDefAmount: TcxCurrencyEdit;
    edWBRestPrefix: TcxTextEdit;
    edWBRestSuffix: TcxTextEdit;
    edWriteOffCurrNum: TcxSpinEdit;
    edWriteOffDefAmount: TcxCurrencyEdit;
    edWriteOffPrefix: TcxTextEdit;
    edWriteOffSuffix: TcxTextEdit;
    FormStorage: TssFormStorage;
    gbAccountEdit: TssGroupBox;
    gbAccounts: TssGroupBox;
    gbAO: TssGroupBox;
    gbBackup: TssGroupBox;
    gbBackupDBs: TssGroupBox;
    gbBarCodes: TssGroupBox;
    gbCommon: TssGroupBox;
    gbCurrency: TssGroupBox;
    gbEnt: TssGroupBox;
    gbFinance: TssGroupBox;
    gbGrp: TssGroupBox;
    gbIntf: TssGroupBox;
    gbInv: TssGroupBox;
    gbInvoice: TssGroupBox;
    gbLogo: TssGroupBox;
    gbOperLog: TssGroupBox;
    gbOrdersIn: TssGroupBox;
    gbOrdersOut: TssGroupBox;
    gbPDCharge: TssGroupBox;
    gbPDIn: TssGroupBox;
    gbPDOut: TssGroupBox;
    gbTaxWB: TssGroupBox;
    gbTorg13: TssGroupBox;
    gbUS: TssGroupBox;
    gbUSDBs: TssGroupBox;
    gbWBIn: TssGroupBox;
    gbWBMove: TssGroupBox;
    gbWBOut: TssGroupBox;
    gbWBRest: TssGroupBox;
    gbWBRetIn: TssGroupBox;
    gbWBRetOut: TssGroupBox;
    gbWH: TssGroupBox;
    gbWriteOff: TssGroupBox;
    grdAccounts: TdxDBGrid;
    grdDBs: TdxDBGrid;
    grdUpdStat: TdxDBGrid;
    lAccount: TLabel;
    lAOCurrNum: TssLabel;
    lAODefAmount: TssLabel;
    lAOPrefix: TssLabel;
    lAOSuffix: TssLabel;
    lBackupDir: TssLabel;
    lBackupInterval: TssLabel;
    lBackupText: TssLabel;
    lBackupTime: TssLabel;
    lBank: TLabel;
    lBankName: TLabel;
    lBCCode: TssLabel;
    lBCCodeFrac: TssLabel;
    lBCCodeFracFrom: TssLabel;
    lBCCodeFracTo: TssLabel;
    lBCCodeFrom: TssLabel;
    lBCCodeInt: TssLabel;
    lBCCodeIntFrom: TssLabel;
    lBCCodeIntTo: TssLabel;
    lBCCodeTo: TssLabel;
    lBCFirstDigit: TssLabel;
    lBCWeight: TssLabel;
    lcbAccountType: TcxDBLookupComboBox;
    lcbBanks: TcxDBLookupComboBox;
    lcbT13PriceTypes: TssDBLookupCombo;
    lcbWBInPriceType: TssDBLookupCombo;
    lChargeType: TLabel;
    lCheckCurrency: TLabel;
    lCheckMoney: TLabel;
    lDigAfterPoint: TLabel;
    lEntAddr: TLabel;
    lEntCertNum: TLabel;
    lEntINN: TLabel;
    lEntName: TLabel;
    lEntOKPO: TLabel;
    lEntPhone: TLabel;
    lFullName: TLabel;
    lHLWMatNeeded: TssLabel;
    lInvCurrNum: TssLabel;
    lInvoiceCurrNum: TssLabel;
    lInvoiceDefAmount: TssLabel;
    lInvoicePrefix: TssLabel;
    lInvoiceSuffix: TssLabel;
    lInvPrefix: TssLabel;
    lInvSuffix: TssLabel;
    lKPP: TLabel;
    lLang: TLabel;
    lLogo: TLabel;
    lMatPrecision: TLabel;
    lMatPrecisionEx: TLabel;
    lMultiEntsViewType: TLabel;
    lOrdersInCurrNum: TssLabel;
    lOrdersInDefAmount: TssLabel;
    lOrdersInPrefix: TssLabel;
    lOrdersInSuffix: TssLabel;
    lOrdersOutCurrNum: TssLabel;
    lOrdersOutDefAmount: TssLabel;
    lOrdersOutPrefix: TssLabel;
    lOrdersOutSuffix: TssLabel;
    lPDChargeCurrNum: TssLabel;
    lPDChargePrefix: TssLabel;
    lPDChargeSuffix: TssLabel;
    lPDInCurrNum: TssLabel;
    lPDInPrefix: TssLabel;
    lPDInSuffix: TssLabel;
    lPDOutCurrNum: TssLabel;
    lPDOutPrefix: TssLabel;
    lPDOutSuffix: TssLabel;
    lPOType: TLabel;
    lPrintType: TLabel;
    lRepLang: TLabel;
    lRetInCurrNum: TssLabel;
    lRetInPrefix: TssLabel;
    lRetInSuffix: TssLabel;
    lRetOutCurrNum: TssLabel;
    lRetOutPrefix: TssLabel;
    lRetOutSuffix: TssLabel;
    lShowPricePrec: TLabel;
    lTaxCurrNum: TssLabel;
    lTaxPrefix: TssLabel;
    lTaxSuffix: TssLabel;
    lTaxWBDefAmount: TssLabel;
    lType: TLabel;
    lUpdStatText: TssLabel;
    lUSText: TssLabel;
    lUSTime: TssLabel;
    lWBInAddType: TssLabel;
    lWBInCurrNum: TssLabel;
    lWBInDefAmount: TssLabel;
    lWBInPrefix: TssLabel;
    lWBInSuffix: TssLabel;
    lWBMoveCurrNum: TssLabel;
    lWBMoveDefAmount: TssLabel;
    lWBMovePrefix: TssLabel;
    lWBMoveSuffix: TssLabel;
    lWBOutAddType: TssLabel;
    lWBOutCurrNum: TssLabel;
    lWBOutDefAmount: TssLabel;
    lWBOutPrefix: TssLabel;
    lWBOutPriceType: TssLabel;
    lWBOutSuffix: TssLabel;
    lWBRestCurrNum: TssLabel;
    lWBRestDefAmount: TssLabel;
    lWBRestPrefix: TssLabel;
    lWBRestSuffix: TssLabel;
    lWriteOffCurrNum: TssLabel;
    lWriteOffDefAmount: TssLabel;
    lWriteOffPrefix: TssLabel;
    lWriteOffSuffix: TssLabel;
    mdAccount: TssMemoryData;
    mdAccountaccid: TIntegerField;
    mdAccountbankid: TIntegerField;
    mdAccountbankname: TStringField;
    mdAccountdeleted: TIntegerField;
    mdAccountfnode: TIntegerField;
    mdAccountmfo: TStringField;
    mdAccountnum: TStringField;
    mdAccounttypeid: TIntegerField;
    mdAccounttypename: TStringField;
    memEntAddr: TcxMemo;
    memFullName: TcxMemo;
    mnuDel: TTBItem;
    mnuNew: TTBItem;
    panAccButtons: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    panLogo: TPanel;
    panMain: TssImagePanel;
    pcMain: TcxPageControl;
    pmTree: TTBPopupMenu;
    rbtBackupNo: TcxRadioButton;
    rbtBackupYes: TcxRadioButton;
    rbtPOAvg: TcxRadioButton;
    rbtPOLast: TcxRadioButton;
    rbtT13PriceIn: TcxRadioButton;
    rbtT13PriceType: TcxRadioButton;
    rbtUSNo: TcxRadioButton;
    rbtUSYes: TcxRadioButton;
    rbtWBInLastPrice: TcxRadioButton;
    rbtWBInPriceType: TcxRadioButton;
    srcAccount: TDataSource;
    srcDB: TDataSource;
    ssBevel1: TssBevel;
    ssSpeedButton1: TssSpeedButton;
    ssSpeedButton2: TssSpeedButton;
    ssSpeedButton3: TssSpeedButton;
    tlGrp: TdxTreeList;
    tlGrpColumn1: TdxTreeListColumn;
    tlGrpColumn3: TdxTreeListImageColumn;
    tsAccount: TcxTabSheet;
    tsAccounts: TcxTabSheet;
    tsAO: TcxTabSheet;
    tsBackup: TcxTabSheet;
    tsBackupDBs: TcxTabSheet;
    tsBarCodes: TcxTabSheet;
    tsCommon: TcxTabSheet;
    tsCurrency: TcxTabSheet;
    tsEntParams: TcxTabSheet;
    tsFinance: TcxTabSheet;
    tsGrp: TcxTabSheet;
    tsIntf: TcxTabSheet;
    tsInv: TcxTabSheet;
    tsInvoice: TcxTabSheet;
    tsLogo: TcxTabSheet;
    tsOperLog: TcxTabSheet;
    tsOrdersIn: TcxTabSheet;
    tsOrdersOut: TcxTabSheet;
    tsPDCharge: TcxTabSheet;
    tsPDIn: TcxTabSheet;
    tsPDOut: TcxTabSheet;
    tsTaxWB: TcxTabSheet;
    tsUpdStat: TcxTabSheet;
    tsUpdStatDBs: TcxTabSheet;
    tsWBIn: TcxTabSheet;
    tsWBMove: TcxTabSheet;
    tsWBOut: TcxTabSheet;
    tsWBRest: TcxTabSheet;
    tsWBRetIn: TcxTabSheet;
    tsWBRetOut: TcxTabSheet;
    tsWH: TcxTabSheet;
    tsWriteOff: TcxTabSheet;
    tvMain: TcxTreeView;
    txtBankName: TssBevel;
    Shape1: TShape;
    lcbWBMoveShowModel: TokComboBox;
    lWBMoveShowModel: TokLabel;
    lcbWBInShowModel: TokComboBox;
    lWBInShowModel: TokLabel;
    lcbWBOutShowModel: TokComboBox;
    lWBOutShowModel: TokLabel;
    lWbOutRepSort: TokLabel;
    cbWBOutRepSortField: TokComboBox;
    lWbInRepSort: TokLabel;
    cbWbInRepSortField: TokComboBox;
    btnWBOutRepSortDesc: TssSpeedButton;
    btnWBInRepSortDesc: TssSpeedButton;
    panAccRul: TPanel;
    LCountryOfOp: TLabel;
    cbCountryOfOp: TcxImageComboBox;
    lAccRules: TLabel;
    cbAccRules: TcxComboBox;
    chbAccRules: TcxCheckBox;
    chbMultiCurrency: TcxCheckBox;
    lNDS: TLabel;
    edNDS: TcxCurrencyEdit;
    lOddColor: TcxLabel;
    gbFonts: TGroupBox;
    lMainFont: TcxLabel;
    lGridFont: TcxLabel;
    cbMainFontColor: TcxColorComboBox;
    cbGridsFontColor: TcxColorComboBox;
    cbMainFont: TcxFontNameComboBox;
    cbGridsFont: TcxFontNameComboBox;
    seMainFont: TcxSpinEdit;
    seGridsFont: TcxSpinEdit;
    imgBevel: TJvBevel;
    imgLogo: TImage;
    panRPType: TPanel;
    lRPType: TssLabel;
    cbRPType: TcxComboBox;
    lRDigitsCount: TssLabel;
    panRound: TPanel;
    rbtRFrac: TcxRadioButton;
    rbtRInt: TcxRadioButton;
    edRInt: TcxSpinEdit;
    edRFrac: TcxSpinEdit;
    cbWBOutAutoPrice: TssDBLookupCombo;
    lWBOutAutoPrice: TssLabel;

    procedure aAccDelExecute(Sender: TObject);
    procedure aAccNewExecute(Sender: TObject);
    procedure aAccountRefExecute(Sender: TObject);
    procedure aApplyExecute(Sender: TObject);
    procedure aBanksRefExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aHelpExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure btnAccLevelUpClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnLockClick(Sender: TObject);
    procedure btnLogoClick(Sender: TObject);
    procedure btnOkGetDrawParams(Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor; AFont: TFont);
    procedure btnSendErrMessageClick(Sender: TObject);
    procedure btnUndoClick(Sender: TObject);
    procedure cbBackupIntervalPropertiesEditValueChanged(Sender: TObject);
    procedure cbRPTypePropertiesEditValueChanged(Sender: TObject);
    procedure cbWBOutAutoPricePropertiesEditValueChanged(Sender: TObject);
    procedure cdsDBAfterOpen(DataSet: TDataSet);
    procedure chbAOAutoNumClick(Sender: TObject);
    procedure chbAOSelectNPClick(Sender: TObject);
    procedure chbBC_WeightClick(Sender: TObject);
    procedure chbHLWMatNeededClick(Sender: TObject);
    procedure chbInvAutoNumClick(Sender: TObject);
    procedure chbInvoiceAutoNumClick(Sender: TObject);
    procedure chbNDSPayerClick(Sender: TObject);
    procedure chbOISelectNPClick(Sender: TObject);
    procedure chbOOSelectNPClick(Sender: TObject);
    procedure chbOperLogClick(Sender: TObject);
    procedure chbOrdersInAutoNumClick(Sender: TObject);
    procedure chbOrdersOutAutoNumClick(Sender: TObject);
    procedure chbPDChargeAutoNumClick(Sender: TObject);
    procedure chbPDInAutoNumClick(Sender: TObject);
    procedure chbPDOutAutoNumClick(Sender: TObject);
    procedure chbRetInAutoNumClick(Sender: TObject);
    procedure chbRetOutAutoNumClick(Sender: TObject);
    procedure chbTaxAutoNumClick(Sender: TObject);
    procedure chbWBInAutoNumClick(Sender: TObject);
    procedure chbWBInAutoPriceClick(Sender: TObject);
    procedure chbWBMoveAutoNumClick(Sender: TObject);
    procedure chbWBOutAutoNumClick(Sender: TObject);
    procedure chbWBRestAutoNumClick(Sender: TObject);
    procedure chbWriteOffAutoNumClick(Sender: TObject);
    procedure colDBOptionsGetText(Sender: TObject; ANode: TdxTreeListNode;var AText: String);
    procedure colUSTextGetText(Sender: TObject; ANode: TdxTreeListNode;var AText: String);
    procedure DataModified(Sender: TObject);
    procedure edAccountPropertiesChange(Sender: TObject);
    procedure edBackupDirPropertiesButtonClick(Sender: TObject;AButtonIndex: Integer);
    procedure edBackupDirPropertiesEditValueChanged(Sender: TObject);
    procedure edBackupIntervalPropertiesEditValueChanged(Sender: TObject);
    procedure edBackupTimePropertiesChange(Sender: TObject);
    procedure edRFracPropertiesChange(Sender: TObject);
    procedure edRFracPropertiesValidate(Sender: TObject;var DisplayValue: Variant; var ErrorText: TCaption;var Error: Boolean);
    procedure edRIntPropertiesChange(Sender: TObject);
    procedure edUSIntervalPropertiesEditValueChanged(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdAccountsDblClick(Sender: TObject);
    procedure grdDBsCustomDrawCell(Sender: TObject; ACanvas: TCanvas;ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;ASelected, AFocused, ANewItemRow: Boolean; var AText: String;var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;var ADone: Boolean);
    procedure grdDBsDblClick(Sender: TObject);
    procedure grdUpdStatDblClick(Sender: TObject);
    procedure lcbAccountTypePropertiesChange(Sender: TObject);
    procedure lcbBankPropertiesEditValueChanged(Sender: TObject);
    procedure lcbBanksPropertiesChange(Sender: TObject);
    procedure lcbBanksPropertiesEditValueChanged(Sender: TObject);
    procedure mdAccountFilterRecord(DataSet: TDataSet;var Accept: Boolean);
    procedure mnuDelClick(Sender: TObject);
    procedure mnuNewClick(Sender: TObject);
    procedure rbtBackupNoClick(Sender: TObject);
    procedure rbtRFracClick(Sender: TObject);
    procedure rbtT13PriceInClick(Sender: TObject);
    procedure rbtUSNoClick(Sender: TObject);
    procedure srcDBDataChange(Sender: TObject; Field: TField);
    procedure tlGrpClick(Sender: TObject);
    procedure tlGrpMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure tsWBInShow(Sender: TObject);
    procedure tvMainChange(Sender: TObject; Node: TTreeNode);
    procedure tvMainMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure btnWBOutRepSortDescClick(Sender: TObject);
    procedure chbAccRulesPropertiesChange(Sender: TObject);

  private
    AccountModified: Boolean;
    DBCanChange, DBCanPost: Boolean;
    FAccModified: Boolean;
    FAccountNode, FBackupNode, FUpdStatNode: TTreeNode;
    FDeleted: Boolean;
    FLogoModified: Boolean;
    FModified: Boolean;
    FRefsNode, FDocsNode, FWMatNode, FFinNode, FSvcNode, FRepNode: TTreeNode;
    PopupNode: TTreeNode;
    TempBmp: TBitmap;

    procedure LoadOptions;
    procedure ReloadGroup(ANode: TTreeNode);
    procedure SetLang(ALang: integer);
    procedure LoadAccounts;

    function CheckAccounts: Boolean;
    function CheckAccountsAll: Boolean;

    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  public
    ParentHandle: HWND;

    procedure SetCaptions;
    procedure PostBackupInfo;
    procedure PostUpdateInfo;
  end;

//--------------------------------------------------------
var
  frmOptions: TfrmOptions;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ClientData, prFun, Main, xLngManager, IniFiles,
  fMessageDlg, xStrUtils, prTypes, ssFun, ssRegUtils, Udebug, FR_Class;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmOptions.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.FormCreate') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  inherited;

  TempBmp := TBitmap.Create;
  FormStorage.IniFileName := MainRegKey;
  FormStorage.IniSection := Self.Name;
  FormStorage.Active := True;

  gbCommon.Font.Style := [fsBold];
  gbBackup.Font.Style := [fsBold];
  gbWBMove.Font.Style := [fsBold];
  gbWBOut.Font.Style := [fsBold];
  gbUS.Font.Style := [fsBold];
  gbWBIn.Font.Style := [fsBold];

  cdsDB.Open;
  cdsPriceTypes.Open;
  SetCaptions;

  SetStyle(Self, IStyle);

  cdsBanks.Open;
  cdsAccountType.Open;

  LoadOptions;

  FModified := False;
  DBCanChange := True;

  if CountryRules.AR <> accRul_RU then gbTorg13.Visible := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfrmOptions.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    FLogo: TMemoryStream;
    fBuffer: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  if ModalResult = mrCancel then begin
    CanClose := True;
    Exit;
  end;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.FormCloseQuery') else _udebug := nil;{$ENDIF}

  CanClose := False;

  if not CheckAccountsAll then begin
    ssMessageDlg(rs(Self.Name, 'ErrorAccounts'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  RepLangID := cbRepLang.ItemIndex;
  RepLangName := LangNames[RepLangID];

  if LangID <> cbLang.ItemIndex then begin
    switchLang(cbLang.ItemIndex);
    SetLang(cbLang.ItemIndex);
    SetCaptions;
  end;

  CountryRules.setCurrent(Integer(cbCountryOfOp.Properties.Items[cbCountryOfOp.ItemIndex].Value));
  SaveLangInfo;

  FLogo := TMemoryStream.Create;
  Screen.Cursor := crSQLWait;

  with newDataSet do
  try
    TrStart;

    try
      ProviderName := 'pProfiles_Upd';
      FetchParams;
      Params.ParamByName('profid').AsInteger := ProfID;
      Params.ParamByName('lang').AsInteger := cbLang.ItemIndex + 1;
      Params.ParamByName('runcc').AsInteger := 1;
      Execute;

      WriteToRegStr(MainRegKey, 'RepLang', LangNames[cbRepLang.ItemIndex]);

      ProviderName := 'pProfIntf_Upd';
      FetchParams;
      Params.ParamByName('profid').AsInteger := ProfID;
      Params.ParamByName('istyle').AsInteger := 1;
      Params.ParamByName('oddcolor').AsInteger := cbOddColor.ColorValue;
      Execute;

      ProviderName := 'pEntParams_Del';
      Params.Clear;
      Execute;
      ProviderName := 'pEntParams_Ins';
      FetchParams;
      Params.ParamByName('name').AsString := edEntName.Text;
      Params.ParamByName('fullname').AsString := memFullName.Text;
      Params.ParamByName('addr').AsString := memEntAddr.Text;
      Params.ParamByName('phone').AsString := edEntPhone.Text;
      //Params.ParamByName('account').AsString := edEntAccount.Text;
      Params.ParamByName('inn').AsString := edEntInn.Text;
      Params.ParamByName('okpo').AsString := edEntOKPO.Text;
      Params.ParamByName('certnum').AsString := edEntCertNum.Text;
      Params.ParamByName('ndspayer').AsInteger := Integer(chbNDSPayer.Checked);
      Params.ParamByName('kpp').AsString := edKPP.Text;
      Execute;

      // should be on per-enterprise basis
      SavePrgParam(dmData.SConnection, 'OptMultiCurrency', chbMultiCurrency.Checked);

    {FAccModified := True;
      mdAccount.Filtered := False;
      mdAccount.First;
      while not mdAccount.Eof do begin
        if mdAccount.FieldByName('deleted').AsInteger = 1 then begin
          ProviderName := 'pEntAccounts_DelByID';
          FetchParams;
          Params.ParamByName('accid').AsInteger := mdAccount.FieldByName('accid').AsInteger;
          Execute;
        end
        else begin
          if mdAccount.FieldByName('accid').AsInteger < 0
            then ProviderName := 'pEntAccounts_Ins'
            else ProviderName := 'pEntAccounts_Upd';
          FetchParams;
          if mdAccount.FieldByName('accid').AsInteger < 0
            then Params.ParamByName('accid').AsInteger :=
              GetMaxID(dmData.SConnection, 'entaccounts', 'accid')
            else Params.ParamByName('accid').AsInteger := mdAccount.FieldByName('accid').AsInteger;
          Params.ParamByName('bankid').AsInteger := mdAccount.FieldByName('bankid').AsInteger;
          Params.ParamByName('typeid').AsInteger := mdAccount.FieldByName('typeid').AsInteger;
          Params.ParamByName('num').AsString := mdAccount.FieldByName('num').AsString;
          Execute;
        end;
        mdAccount.Next;
      end;
      }

      EntLogo.Clear;

      if imgLogo.Picture.Graphic <> nil then imgLogo.Picture.Graphic.SaveToStream(EntLogo);

      EntLogo.Position := 0;
      fBuffer := StreamToHexStr(EntLogo);
//todo: multiple logo for all enterprises
      dmData.SConnection.AppServer.usr_WriteBlob(fBuffer, 0, 'entparams', 'logo', 0, '', '', '');

      if rbtPOAvg.Checked
        then POType := poAvg
        else POType := poLast;

      PrintType := cbPrintType.ItemIndex;

      ProviderName := 'pCommonParams_Upd';
      FetchParams;
      Params.ParamByName('nds').AsFloat := edNDS.Value;
      Params.ParamByName('chargetype').AsInteger := cbChargeType.ItemIndex;
      Params.ParamByName('potype').AsInteger := Integer(POType);
      Params.ParamByName('printtype').AsInteger := PrintType;
      Params.ParamByName('deltobin').AsInteger := Integer(chbDelToBin.Checked);
      Execute;

      ProviderName := 'pProfCommon_Del';
      FetchParams;
      Params.ParamByName('profid').AsInteger := ProfID;
      Execute;
      ProviderName := 'pProfCommon_Ins';
      FetchParams;
      Params.ParamByName('profid').AsInteger := ProfID;
      Params.ParamByName('checkcurrency').AsInteger := Integer(chbCheckCurrency.Checked);
      Params.ParamByName('wboutautowh').AsInteger := Integer(chbWBOutAutoWH.Checked);
      Params.ParamByName('accoutautowh').AsInteger := Integer(chbAOAutoWH.Checked);
      Params.ParamByName('rptype').AsInteger := cbRPType.ItemIndex;
      Execute;

      ProviderName := 'pProfDocParams_Del';
      FetchParams;
      Params.ParamByName('profid').AsInteger := ProfID;
      Execute;

      ProviderName := 'pProfDocParams_Ins';
      FetchParams;
      Params.ParamByName('profid').AsInteger := ProfID;

      Params.ParamByName('doctype').AsInteger := 1;
      Params.ParamByName('allowzero').AsInteger := Integer(chbWBInAllowZero.Checked);
      Params.ParamByName('defamount').AsFloat := edWBInDefAmount.Value;
      Params.ParamByName('checked').AsInteger := Integer(chbWBInChecked.Checked);
      Params.ParamByName('autonum').AsInteger := Integer(chbWBInAutoNum.Checked);
      if chbWBInAutoNum.Checked then begin
        Params.ParamByName('prefix').AsString := edWBInPrefix.Text;
        Params.ParamByName('suffix').AsString := edWBInSuffix.Text;
      end
      else begin
        Params.ParamByName('prefix').DataType := ftString;
        Params.ParamByName('prefix').Clear;
        Params.ParamByName('suffix').DataType := ftString;
        Params.ParamByName('suffix').Clear;
      end;
      Execute;

      Params.ParamByName('doctype').AsInteger := 2;
      Params.ParamByName('allowzero').AsInteger := Integer(chbWBOutAllowZero.Checked);
      Params.ParamByName('defamount').AsFloat := edWBOutDefAmount.Value;
      Params.ParamByName('checked').AsInteger := Integer(chbWBOutChecked.Checked);
      Params.ParamByName('autonum').AsInteger := Integer(chbWBOutAutoNum.Checked);
      if chbWBOutAutoNum.Checked then begin
        Params.ParamByName('prefix').AsString := edWBOutPrefix.Text;
        Params.ParamByName('suffix').AsString := edWBOutSuffix.Text;
      end
      else begin
        Params.ParamByName('prefix').DataType := ftString;
        Params.ParamByName('prefix').Clear;
        Params.ParamByName('suffix').DataType := ftString;
        Params.ParamByName('suffix').Clear;
      end;
      Execute;

      Params.ParamByName('doctype').AsInteger := 3;
      Params.ParamByName('defamount').AsFloat := edAODefAmount.Value;
      Params.ParamByName('autonum').AsInteger := Integer(chbAOAutoNum.Checked);
      Params.ParamByName('checked').DataType := ftInteger;
      Params.ParamByName('checked').Clear;

      if chbAOAutoNum.Checked then begin
        Params.ParamByName('prefix').AsString := edAOPrefix.Text;
        Params.ParamByName('suffix').AsString := edAOSuffix.Text;
      end
      else begin
        Params.ParamByName('prefix').DataType := ftString;
        Params.ParamByName('prefix').Clear;
        Params.ParamByName('suffix').DataType := ftString;
        Params.ParamByName('suffix').Clear;
      end;
      Execute;

      Params.ParamByName('doctype').AsInteger := 4;
      Params.ParamByName('defamount').AsFloat := edWBMoveDefAmount.Value;
      Params.ParamByName('checked').AsInteger := Integer(chbWBMoveChecked.Checked);
      Params.ParamByName('autonum').AsInteger := Integer(chbWBMoveAutoNum.Checked);

      if chbWBMoveAutoNum.Checked then begin
        Params.ParamByName('prefix').AsString := edWBMovePrefix.Text;
        Params.ParamByName('suffix').AsString := edWBMoveSuffix.Text;
      end
      else begin
        Params.ParamByName('prefix').DataType := ftString;
        Params.ParamByName('prefix').Clear;
        Params.ParamByName('suffix').DataType := ftString;
        Params.ParamByName('suffix').Clear;
      end;
      Execute;

      Params.ParamByName('doctype').AsInteger := 5;
      Params.ParamByName('defamount').AsFloat := edTaxWBDefAmount.Value;
      Params.ParamByName('autonum').AsInteger := Integer(chbTaxAutoNum.Checked);
      Params.ParamByName('checked').DataType := ftInteger;
      Params.ParamByName('checked').Clear;

      if chbTaxAutoNum.Checked then begin
        Params.ParamByName('prefix').AsString := edTaxPrefix.Text;
        Params.ParamByName('suffix').AsString := edTaxSuffix.Text;
      end
      else begin
        Params.ParamByName('prefix').DataType := ftString;
        Params.ParamByName('prefix').Clear;
        Params.ParamByName('suffix').DataType := ftString;
        Params.ParamByName('suffix').Clear;
      end;
      Execute;

      Params.ParamByName('doctype').AsInteger := 6;
      Params.ParamByName('defamount').AsFloat := 0;
      Params.ParamByName('autonum').AsInteger := Integer(chbPDInAutoNum.Checked);
      Params.ParamByName('checked').AsInteger := Integer(chbPDInChecked.Checked);
      if chbPDInAutoNum.Checked then begin
        Params.ParamByName('prefix').AsString := edPDInPrefix.Text;
        Params.ParamByName('suffix').AsString := edPDInSuffix.Text;
      end
      else begin
        Params.ParamByName('prefix').DataType := ftString;
        Params.ParamByName('prefix').Clear;
        Params.ParamByName('suffix').DataType := ftString;
        Params.ParamByName('suffix').Clear;
      end;
      Execute;

      Params.ParamByName('doctype').AsInteger := 7;
      Params.ParamByName('defamount').AsFloat := 0;
      Params.ParamByName('autonum').AsInteger := Integer(chbPDOutAutoNum.Checked);
      Params.ParamByName('checked').AsInteger := Integer(chbPDOutChecked.Checked);

      if chbPDOutAutoNum.Checked then begin
        Params.ParamByName('prefix').AsString := edPDOutPrefix.Text;
        Params.ParamByName('suffix').AsString := edPDOutSuffix.Text;
      end
      else begin
        Params.ParamByName('prefix').DataType := ftString;
        Params.ParamByName('prefix').Clear;
        Params.ParamByName('suffix').DataType := ftString;
        Params.ParamByName('suffix').Clear;
      end;
      Execute;

      Params.ParamByName('doctype').AsInteger := 8;
      Params.ParamByName('allowzero').AsInteger := Integer(chbWBRestAllowZero.Checked);
      Params.ParamByName('defamount').AsFloat := edWBRestDefAmount.Value;
      Params.ParamByName('checked').AsInteger := Integer(chbWBRestChecked.Checked);
      Params.ParamByName('autonum').AsInteger := Integer(chbWBRestAutoNum.Checked);

      if chbWBRestAutoNum.Checked then begin
        Params.ParamByName('prefix').AsString := edWBRestPrefix.Text;
        Params.ParamByName('suffix').AsString := edWBRestSuffix.Text;
      end
      else begin
        Params.ParamByName('prefix').DataType := ftString;
        Params.ParamByName('prefix').Clear;
        Params.ParamByName('suffix').DataType := ftString;
        Params.ParamByName('suffix').Clear;
      end;
      Execute;

      Params.ParamByName('doctype').AsInteger := 9;
      Params.ParamByName('defamount').AsFloat := edWriteOffDefAmount.Value;
      Params.ParamByName('checked').AsInteger := Integer(chbWriteOffChecked.Checked);
      Params.ParamByName('autonum').AsInteger := Integer(chbWriteOffAutoNum.Checked);

      if chbWriteOffAutoNum.Checked then begin
        Params.ParamByName('prefix').AsString := edWriteOffPrefix.Text;
        Params.ParamByName('suffix').AsString := edWriteOffSuffix.Text;
      end
      else begin
        Params.ParamByName('prefix').DataType := ftString;
        Params.ParamByName('prefix').Clear;
        Params.ParamByName('suffix').DataType := ftString;
        Params.ParamByName('suffix').Clear;
      end;
      Execute;

      Params.ParamByName('doctype').AsInteger := 10;
      Params.ParamByName('defamount').AsFloat := 0;
      Params.ParamByName('autonum').AsInteger := Integer(chbPDChargeAutoNum.Checked);
      Params.ParamByName('checked').AsInteger := Integer(chbPDChargeChecked.Checked);

      if chbPDChargeAutoNum.Checked then begin
        Params.ParamByName('prefix').AsString := edPDChargePrefix.Text;
        Params.ParamByName('suffix').AsString := edPDChargeSuffix.Text;
      end
      else begin
        Params.ParamByName('prefix').DataType := ftString;
        Params.ParamByName('prefix').Clear;
        Params.ParamByName('suffix').DataType := ftString;
        Params.ParamByName('suffix').Clear;
      end;
      Execute;

      Params.ParamByName('doctype').AsInteger := 11;
      Params.ParamByName('defamount').AsFloat := 0;
      Params.ParamByName('checked').AsInteger := Integer(chbInvChecked.Checked);
      Params.ParamByName('autonum').AsInteger := Integer(chbInvAutoNum.Checked);

      if chbWriteOffAutoNum.Checked then begin
        Params.ParamByName('prefix').AsString := edInvPrefix.Text;
        Params.ParamByName('suffix').AsString := edInvSuffix.Text;
      end
      else begin
        Params.ParamByName('prefix').DataType := ftString;
        Params.ParamByName('prefix').Clear;
        Params.ParamByName('suffix').DataType := ftString;
        Params.ParamByName('suffix').Clear;
      end;
      Execute;

      Params.ParamByName('doctype').AsInteger := 12;
      Params.ParamByName('defamount').AsFloat := 0;
      Params.ParamByName('checked').AsInteger := Integer(chbRetOutChecked.Checked);
      Params.ParamByName('autonum').AsInteger := Integer(chbRetOutAutoNum.Checked);

      if chbRetOutAutoNum.Checked then begin
        Params.ParamByName('prefix').AsString := edRetOutPrefix.Text;
        Params.ParamByName('suffix').AsString := edRetOutSuffix.Text;
      end
      else begin
        Params.ParamByName('prefix').DataType := ftString;
        Params.ParamByName('prefix').Clear;
        Params.ParamByName('suffix').DataType := ftString;
        Params.ParamByName('suffix').Clear;
      end;
      Execute;

      Params.ParamByName('doctype').AsInteger := 13;
      Params.ParamByName('defamount').AsFloat := 0;
      Params.ParamByName('checked').AsInteger := Integer(chbRetInChecked.Checked);
      Params.ParamByName('autonum').AsInteger := Integer(chbRetInAutoNum.Checked);

      if chbRetInAutoNum.Checked then begin
        Params.ParamByName('prefix').AsString := edRetInPrefix.Text;
        Params.ParamByName('suffix').AsString := edRetInSuffix.Text;
      end
      else begin
        Params.ParamByName('prefix').DataType := ftString;
        Params.ParamByName('prefix').Clear;
        Params.ParamByName('suffix').DataType := ftString;
        Params.ParamByName('suffix').Clear;
      end;
      Execute;

      Params.ParamByName('doctype').AsInteger := 14;
      Params.ParamByName('defamount').AsFloat := edInvoiceDefAmount.Value;
      Params.ParamByName('checked').AsInteger := 0;
      Params.ParamByName('autonum').AsInteger := Integer(chbInvoiceAutoNum.Checked);

      if chbInvoiceAutoNum.Checked then begin
        Params.ParamByName('prefix').AsString := edInvoicePrefix.Text;
        Params.ParamByName('suffix').AsString := edInvoiceSuffix.Text;
      end
      else begin
        Params.ParamByName('prefix').DataType := ftString;
        Params.ParamByName('prefix').Clear;
        Params.ParamByName('suffix').DataType := ftString;
        Params.ParamByName('suffix').Clear;
      end;
      Execute;

      Params.ParamByName('doctype').AsInteger := 15;
      Params.ParamByName('defamount').AsFloat := edOrdersInDefAmount.Value;
      Params.ParamByName('checked').AsInteger := 0;
      Params.ParamByName('autonum').AsInteger := Integer(chbOrdersInAutoNum.Checked);

      if chbOrdersInAutoNum.Checked then begin
        Params.ParamByName('prefix').AsString := edOrdersInPrefix.Text;
        Params.ParamByName('suffix').AsString := edOrdersInSuffix.Text;
      end
      else begin
        Params.ParamByName('prefix').DataType := ftString;
        Params.ParamByName('prefix').Clear;
        Params.ParamByName('suffix').DataType := ftString;
        Params.ParamByName('suffix').Clear;
      end;
      Execute;

      Params.ParamByName('doctype').AsInteger := 16;
      Params.ParamByName('defamount').AsFloat := edOrdersOutDefAmount.Value;
      Params.ParamByName('checked').AsInteger := 0;
      Params.ParamByName('autonum').AsInteger := Integer(chbOrdersOutAutoNum.Checked);

      if chbOrdersInAutoNum.Checked then begin
        Params.ParamByName('prefix').AsString := edOrdersOutPrefix.Text;
        Params.ParamByName('suffix').AsString := edOrdersOutSuffix.Text;
      end
      else begin
        Params.ParamByName('prefix').DataType := ftString;
        Params.ParamByName('prefix').Clear;
        Params.ParamByName('suffix').DataType := ftString;
        Params.ParamByName('suffix').Clear;
      end;
      Execute;

      SavePrgParam(dmData.SConnection, 'WBInDefAction', cbWBInAddType.ItemIndex);
      SavePrgParam(dmData.SConnection, 'WBInAutoPrice', chbWBInAutoPrice.Checked);
      SavePrgParam(dmData.SConnection, 'WBInAutoPriceType', Integer(rbtWBInPriceType.Checked));
      SavePrgParam(dmData.SConnection, 'WBInPriceType', lcbWBInPriceType.KeyValue);

      SavePrgParam(dmData.SConnection, 'WBOutDefAction', cbWBOutAddType.ItemIndex);
      SavePrgParam(dmData.SConnection, 'WBOutCheckDC', Integer(chbWBOutDCCheck.Checked));
      SavePrgParam(dmData.SConnection, 'WBOutPriceType', cbWBOutPriceType.ItemIndex);
      SavePrgParam(dmData.SConnection, 'WBOutAutoPrice', cbWBOutAutoPrice.ItemIndex);

      SavePrgParam(dmData.SConnection, 'PricePrecision', edShowPricePrec.Value);
      SavePrgParam(dmData.SConnection, 'MatPrecision', edMatPrecision.Value);

      if rbtT13PriceIn.Checked
        then SavePrgParam(dmData.SConnection, 'Torg13PriceType', -1)
        else SavePrgParam(dmData.SConnection, 'Torg13PriceType', lcbT13PriceTypes.KeyValue);
        
      SavePrgParam(dmData.SConnection, 'CheckMoney', Integer(chbCheckMoney.Checked));
      SavePrgParam(dmData.SConnection, 'WMatHLNeeded', Integer(chbHLWMatNeeded.Checked));
      SavePrgParam(dmData.SConnection, 'WMatHLColor', edHLWMatNeeded.ColorValue);

      SavePrgParam(dmData.SConnection, 'PriceRoundFrac', edRFrac.Value);
      SavePrgParam(dmData.SConnection, 'PriceRoundInt', edRInt.Value);

      SavePrgParam(dmData.SConnection, 'BC_Enabled', Integer(chbBC_Weight.Checked));
      SavePrgParam(dmData.SConnection, 'BC_CodeFrom', edBCCodeFrom.EditValue);
      SavePrgParam(dmData.SConnection, 'BC_CodeTo', edBCCodeTo.EditValue);
      SavePrgParam(dmData.SConnection, 'BC_Weight_IntFrom', edBCCodeIntFrom.EditValue);
      SavePrgParam(dmData.SConnection, 'BC_Weight_IntTo', edBCCodeIntTo.EditValue);
      SavePrgParam(dmData.SConnection, 'BC_Weight_FracFrom', edBCCodeFracFrom.EditValue);
      SavePrgParam(dmData.SConnection, 'BC_Weight_FracTo', edBCCodeFracTo.EditValue);

      SavePrgParam(dmData.SConnection, 'WMatShowAll', Integer(chbShowAllMats.Checked));
      SavePrgParam(dmData.SConnection, 'AONPColor', edAOSelectNP.ColorValue);
      SavePrgParam(dmData.SConnection, 'AOSelectNP', Integer(chbAOSelectNP.Checked));
      SavePrgParam(dmData.SConnection, 'OONPColor', edOOSelectNP.ColorValue);
      SavePrgParam(dmData.SConnection, 'OOSelectNP', Integer(chbOOSelectNP.Checked));
      SavePrgParam(dmData.SConnection, 'OINPColor', edOISelectNP.ColorValue);
      SavePrgParam(dmData.SConnection, 'OISelectNP', Integer(chbOISelectNP.Checked));
      SavePrgParam(dmData.SConnection, 'MEViewType', cbMultiEntsViewType.ItemIndex);

      SavePrgParam(dmData.SConnection, 'WBInShowModel', lcbWBInShowModel.ItemIndex);
      SavePrgParam(dmData.SConnection, 'WBOutShowModel', lcbWBOutShowModel.ItemIndex);
      SavePrgParam(dmData.SConnection, 'WBMoveShowModel', lcbWBMoveShowModel.ItemIndex);

      SavePrgParam(dmData.SConnection, 'WBInRepSortField', cbWBInRepSortField.ItemIndex);
      SavePrgParam(dmData.SConnection, 'WBInRepSortDesc',  btnWBInRepSortDesc.Checked);
      SavePrgParam(dmData.SConnection, 'WBOutRepSortField', cbWBOutRepSortField.ItemIndex);
      SavePrgParam(dmData.SConnection, 'WBOutRepSortDesc',  btnWBOutRepSortDesc.Checked);

      if GetDocNum(dmData.SConnection, dtWBIn, 0) <> edWBInCurrNum.Value
        then SetDocNum(dmData.SConnection, dtWBIn, edWBInCurrNum.Value);

      if GetDocNum(dmData.SConnection, dtWBOut, 0) <> edWBOutCurrNum.Value
        then SetDocNum(dmData.SConnection, dtWBOut, edWBOutCurrNum.Value);

      if GetDocNum(dmData.SConnection, dtWBMove, 0) <> edWBMoveCurrNum.Value
        then SetDocNum(dmData.SConnection, dtWBMove, edWBMoveCurrNum.Value);

      if GetDocNum(dmData.SConnection, dtAO, 0) <> edAOCurrNum.Value
        then SetDocNum(dmData.SConnection, dtAO, edAOCurrNum.Value);

      if GetDocNum(dmData.SConnection, dtTaxWB, 0) <> edTaxCurrNum.Value
        then SetDocNum(dmData.SConnection, dtTaxWB, edTaxCurrNum.Value);

      if GetDocNum(dmData.SConnection, dtPDIn, 0) <> edPDInCurrNum.Value
        then SetDocNum(dmData.SConnection, dtPDIn, edPDInCurrNum.Value);

      if GetDocNum(dmData.SConnection, dtPDOut, 0) <> edPDOutCurrNum.Value
        then SetDocNum(dmData.SConnection, dtPDOut, edPDOutCurrNum.Value);

      if GetDocNum(dmData.SConnection, dtPDCharge, 0) <> edPDChargeCurrNum.Value
        then SetDocNum(dmData.SConnection, dtPDCharge, edPDChargeCurrNum.Value);

      if GetDocNum(dmData.SConnection, dtWBRest, 0) <> edWBRestCurrNum.Value
        then SetDocNum(dmData.SConnection, dtWBRest, edWBRestCurrNum.Value);

      if GetDocNum(dmData.SConnection, dtWriteOff, 0) <> edWriteOffCurrNum.Value
        then SetDocNum(dmData.SConnection, dtWriteOff, edWriteOffCurrNum.Value);

      if GetDocNum(dmData.SConnection, dtInv, 0) <> edInvCurrNum.Value
        then SetDocNum(dmData.SConnection, dtInv, edInvCurrNum.Value);

      if GetDocNum(dmData.SConnection, dtReturnOut, 0) <> edRetOutCurrNum.Value
        then SetDocNum(dmData.SConnection, dtReturnOut, edRetOutCurrNum.Value);

      if GetDocNum(dmData.SConnection, dtReturnIn, 0) <> edRetInCurrNum.Value
        then SetDocNum(dmData.SConnection, dtReturnIn, edRetInCurrNum.Value);

      if GetDocNum(dmData.SConnection, dtInvoice, 0) <> edInvoiceCurrNum.Value
        then SetDocNum(dmData.SConnection, dtInvoice, edInvoiceCurrNum.Value);

      if GetDocNum(dmData.SConnection, dtOrderIn, 0) <> edOrdersInCurrNum.Value
        then SetDocNum(dmData.SConnection, dtOrderIn, edOrdersInCurrNum.Value);

      if GetDocNum(dmData.SConnection, dtOrderOut, 0) <> edOrdersOutCurrNum.Value
        then SetDocNum(dmData.SConnection, dtOrderOut, edOrdersOutCurrNum.Value);

      if not chbOperLog.Checked then begin
        ProviderName := 'pParams_SetAllTriggers';
        FetchParams;
        Params.ParamByName('ainactive').AsInteger := 1;
        Execute;
      end
      else begin
        ProviderName := 'pParams_SetTriggers';
        FetchParams;

        Params.ParamByName('atable').AsString := 'WAYBILLLIST';
        Params.ParamByName('ainactive').AsInteger := Integer(not chbWB.Checked);
        Execute;
        Params.ParamByName('atable').AsString := 'PAYDOC';
        Params.ParamByName('ainactive').AsInteger := Integer(not chbPayDoc.Checked);
        Execute;
        Params.ParamByName('atable').AsString := 'TAXWB';
        Params.ParamByName('ainactive').AsInteger := Integer(not chbTax.Checked);
        Execute;
        Params.ParamByName('atable').AsString := 'MATERIALS';
        Params.ParamByName('ainactive').AsInteger := Integer(not chbMat.Checked);
        Execute;
        Params.ParamByName('atable').AsString := 'KAGENT';
        Params.ParamByName('ainactive').AsInteger := Integer(not chbKA.Checked);
        Execute;
        Params.ParamByName('atable').AsString := 'CURRENCY';
        Params.ParamByName('ainactive').AsInteger := Integer(not chbCurrency.Checked);
        Execute;
        Params.ParamByName('atable').AsString := 'BANKS';
        Params.ParamByName('ainactive').AsInteger := Integer(not chbBanks.Checked);
        Execute;
        Params.ParamByName('atable').AsString := 'MEASURES';
        Params.ParamByName('ainactive').AsInteger := Integer(not chbMeasures.Checked);
        Execute;
        Params.ParamByName('atable').AsString := 'WAREHOUSE';
        Params.ParamByName('ainactive').AsInteger := Integer(not chbWHouses.Checked);
        Execute;
        Params.ParamByName('atable').AsString := 'ACCOUNTTYPE';
        Params.ParamByName('ainactive').AsInteger := Integer(not chbAccTypes.Checked);
        Execute;
        Params.ParamByName('atable').AsString := 'COUNTRIES';
        Params.ParamByName('ainactive').AsInteger := Integer(not chbCountries.Checked);
        Execute;
        Params.ParamByName('atable').AsString := 'MATGROUP';
        Params.ParamByName('ainactive').AsInteger := Integer(not chbMatGroups.Checked);
        Execute;
        Params.ParamByName('atable').AsString := 'PRICETYPES';
        Params.ParamByName('ainactive').AsInteger := Integer(not chbPriceTypes.Checked);
        Execute;
      end;

      cdsDB.First;
      while not cdsDB.Eof do begin
        if cdsDB.FieldByName('enabled').AsInteger = 1
          then dmData.SConnection.AppServer.db_SaveBackupInfo(
            cdsDB.FieldByName('dbid').AsInteger,
            cdsDB.FieldByName('backupdir').AsString,
            cdsDB.FieldByName('intervalvalue').AsInteger,
            cdsDB.FieldByName('intervaltype').AsString,
            cdsDB.FieldByName('ontime').AsDateTime)
          else dmData.SConnection.AppServer.db_SaveBackupInfo(
            cdsDB.FieldByName('dbid').AsInteger, '', 0, '', 0);

        if cdsDB.FieldByName('updenabled').AsInteger = 1
          then dmData.SConnection.AppServer.db_SaveUpdateStatInfo(
               cdsDB.FieldByName('dbid').AsInteger,
               cdsDB.FieldByName('updintervalvalue').AsInteger,
               cdsDB.FieldByName('updintervaltype').AsString,
               cdsDB.FieldByName('updtime').AsDateTime)
          else dmData.SConnection.AppServer.db_SaveUpdateStatInfo(cdsDB.FieldByName('dbid').AsInteger, 0, '', 0);

        cdsDB.Next;
      end;

      WriteToRegInt(MainRegKey, 'NextCtrlOnEnter', Integer(chbNextCtrlOnEnter.Checked));
      NextCtrlOnEnter := chbNextCtrlOnEnter.Checked;
      Logging := chbOperLog.Checked;

      if rbtT13PriceIn.Checked
        then Torg13PriceType := -1
        else Torg13PriceType := lcbT13PriceTypes.KeyValue;

      HighlightNeededMats := chbHLWMatNeeded.Checked;
      CL_OK_WMAT_HIGHLIGHT_NEEDED := edHLWMatNeeded.ColorValue;
      CL_OK_AO_NOT_PAID := edAOSelectNP.ColorValue;
      AOSelectNP := chbAOSelectNP.Checked;
      CL_OK_OO_NOT_PAID := edOOSelectNP.ColorValue;
      OrdersOutSelectNP := chbOOSelectNP.Checked;
      CL_OK_OI_NOT_PAID := edOISelectNP.ColorValue;
      OrdersInSelectNP := chbOISelectNP.Checked;
      NDS := edNDS.Value;
      CheckMoney := chbCheckMoney.Checked;
      ShowCalcOnKeyPress := chbShowCalc.Checked;
      RPType := TRoundPricesType(cbRPType.ItemIndex);
      DelToRecycleBin := chbDelToBin.Checked;
      PricePrecision := edShowPricePrec.Value;
      MatDisplayDigits := -edMatPrecision.Value;
      ResetMatDisplayFormat;
      CheckCurrency := chbCheckCurrency.Checked;
      WBOutAllowZero := chbWBOutAllowZero.Checked;
      WBOutDefAmount := edWBOutDefAmount.Value;
      WBOutAutoWH := chbWBOutAutoWH.Checked;
      AccOutAutoWH := chbAOAutoWH.Checked;
      WBOutAutoPrice := cbWBOutAutoPrice.ItemIndex;
      WBMoveDefAmount := edWBMoveDefAmount.Value;
      WBOutDefAction := TAddAction(cbWBOutAddType.ItemIndex);
      WBInDefAction := TAddAction(cbWBInAddType.ItemIndex);

      WBInAllowZero := chbWBInAllowZero.Checked;
      WBInDefAmount := edWBInDefAmount.Value;
      WBInChecked := chbWBInChecked.Checked;
      WBInAutoNum := chbWBInAutoNum.Checked;
      WBInPrefix := edWBInPrefix.Text;
      WBInSuffix := edWBInSuffix.Text;
      WBInAutoPrice := chbWBInAutoPrice.Checked;
      WBInAutoPriceType := Integer(rbtWBInPriceType.Checked);
      WBInPriceType := lcbWBInPriceType.KeyValue;
      OptWBInShowModel := lcbWBInShowModel.ItemIndex;
      optWBInRepSortDesc := btnWBInRepSortDesc.Checked;
      optWBInRepSortField := cbWBInRepSortField.itemIndex;

      WBOutChecked := chbWBOutChecked.Checked;
      WBOutAutoNum := chbWBOutAutoNum.Checked;
      WBOutPrefix := edWBOutPrefix.Text;
      WBOutSuffix := edWBOutSuffix.Text;
      WBOutPriceType := cbWBOutPriceType.ItemIndex;
      ShowRetNDS := chbShowRetNDS.Checked;
      WriteToRegInt(MainRegKey, 'ShowRetNDS', Integer(ShowRetNDS));
      OptWBOutShowModel := lcbWBOutShowModel.ItemIndex;
      optWBOutRepSortDesc := btnWBOutRepSortDesc.Checked;
      optWBOutRepSortField := cbWBOutRepSortField.itemIndex;

      InvoiceDefAmount := edInvoiceDefAmount.Value;
      InvoiceAutoNum := chbWBInAutoNum.Checked;
      InvoicePrefix := edInvoicePrefix.Text;
      InvoiceSuffix := edInvoiceSuffix.Text;

      ReturnInChecked := chbRetInChecked.Checked;
      ReturnInAutoNum := chbRetInAutoNum.Checked;
      ReturnInPrefix := edRetInPrefix.Text;
      ReturnInSuffix := edRetInSuffix.Text;

      ReturnOutChecked := chbRetOutChecked.Checked;
      ReturnOutAutoNum := chbRetOutAutoNum.Checked;
      ReturnOutPrefix := edRetOutPrefix.Text;
      ReturnOutSuffix := edRetOutSuffix.Text;

      WBRestAllowZero := chbWBRestAllowZero.Checked;
      WBRestDefAmount := edWBRestDefAmount.Value;
      WBRestChecked := chbWBRestChecked.Checked;
      WBRestAutoNum := chbWBRestAutoNum.Checked;
      WBRestPrefix := edWBRestPrefix.Text;
      WBRestSuffix := edWBRestSuffix.Text;

      WriteOffDefAmount := edWriteOffDefAmount.Value;
      WriteOffChecked := chbWriteOffChecked.Checked;
      WriteOffAutoNum := chbWriteOffAutoNum.Checked;
      WriteOffPrefix := edWriteOffPrefix.Text;
      WriteOffSuffix := edWriteOffSuffix.Text;

      WBMoveChecked := chbWBMoveChecked.Checked;
      WBMoveAutoNum := chbWBMoveAutoNum.Checked;
      WBMovePrefix := edWBMovePrefix.Text;
      WBMoveSuffix := edWBMoveSuffix.Text;
      OptWBMoveShowModel := lcbWBMoveShowModel.ItemIndex;

      AODefAmount := edAODefAmount.Value;
      AOAutoNum := chbAOAutoNum.Checked;
      AOPrefix := edAOPrefix.Text;
      AOSuffix := edAOSuffix.Text;

      TaxWBDefAmount := edTaxWBDefAmount.Value;
      TaxAutoNum := chbTaxAutoNum.Checked;
      TaxPrefix := edTaxPrefix.Text;
      TaxSuffix := edTaxSuffix.Text;

      PDInChecked := chbPDInChecked.Checked;
      PDInAutoNum := chbPDInAutoNum.Checked;
      PDInPrefix := edPDInPrefix.Text;
      PDInSuffix := edPDInSuffix.Text;

      PDOutChecked := chbPDOutChecked.Checked;
      PDOutAutoNum := chbPDOutAutoNum.Checked;
      PDOutPrefix := edPDOutPrefix.Text;
      PDOutSuffix := edPDOutSuffix.Text;

      PDChargeChecked := chbPDChargeChecked.Checked;
      PDChargeAutoNum := chbPDChargeAutoNum.Checked;
      PDChargePrefix := edPDChargePrefix.Text;
      PDChargeSuffix := edPDChargeSuffix.Text;

      OrdersInDefAmount := edOrdersInDefAmount.Value;
      OrdersInAutoNum := chbOrdersInAutoNum.Checked;
      OrdersInPrefix := edOrdersInPrefix.Text;
      OrdersInSuffix := edOrdersInSuffix.Text;

      OrdersOutDefAmount := edOrdersOutDefAmount.Value;
      OrdersOutAutoNum := chbOrdersOutAutoNum.Checked;
      OrdersOutPrefix := edOrdersOutPrefix.Text;
      OrdersOutSuffix := edOrdersOutSuffix.Text;
      //IStyle := cbStyle.ItemIndex;
      GridOddLinesColor := cbOddColor.ColorValue;
      ChargeType := TChargeType(cbChargeType.ItemIndex);
      //frmMainForm.ResetStyle;
      //SetStyle(Self, IStyle);
      {with dmData.scMain do
       case IStyle of
        0: Style.BorderStyle := ebs3D;
        1: Style.BorderStyle := ebsFlat;
        2: Style.BorderStyle := ebsUltraFlat;
       end;}

      TrCommit;
      //-----------------------------------------------------------------------

      BC_Enabled := chbBC_Weight.Checked;
      BC_CodeFrom := edBCCodeFrom.EditValue;
      BC_CodeTo := edBCCodeTo.EditValue;
      BC_Weight_IntFrom := edBCCodeIntFrom.EditValue;
      BC_Weight_IntTo := edBCCodeIntTo.EditValue;
      BC_Weight_FracFrom := edBCCodeFracFrom.EditValue;
      BC_Weight_FracTo := edBCCodeFracTo.EditValue;

      MultiEntsViewType := cbMultiEntsViewType.ItemIndex;
      frmMainForm.RefreshMultiEnts;

      WMatShowAll := chbShowAllMats.Checked;

      frmMainForm.ExecRefresh('TfmFinance', 0, Integer(rtEntAcc));

      FilterOnSearch := chbFilterOnSearch.Checked;
      WriteToRegInt(MainRegKey, 'FilterOnSearch', Integer(FilterOnSearch));
      WriteToRegInt(MainRegKey, 'ShowCalcOnKeyPress', Integer(ShowCalcOnKeyPress));
      SetPriceDispFormat;

      PriceRoundFrac := edRFrac.Value;
      PriceRoundInt := edRInt.Value;
      WBOutCheckDC := chbWBOutDCCheck.Checked;

      Font_Main.Name := cbMainFont.FontName;
      Font_Main.Size := seMainFont.Value;
      Font_Main.Color := cbGridsFontColor.ColorValue;
      Font_Grids.Name := cbGridsFont.FontName;
      Font_Grids.Size := seGridsFont.Value;
      Font_Grids.Color := cbMainFontColor.ColorValue;
      setFontStyle(dmData.scMain.Style.font);
      {setFontStyle(dmData.scMain4Labels.Style.font);
      setFontStyle(dmData.scMainErr.Style.font);
      setFontStyle(dmData.scMainOK.Style.font);
      }

      with TIniFile.Create(ClientPath + client_ini) do
      try
        WriteString('font',  'EditsFont', Font_Main.Name);
        WriteString('font',  'MainFont', Font_Main.Name);
        WriteInteger('font', 'MainFontSize', Font_Main.Size);
        WriteInteger('font', 'MainFontColor', Font_Main.Color);
        WriteString('font',  'GridsFont', Font_Grids.Name);
        WriteInteger('font', 'GridsFontSize', Font_Grids.Size);
        WriteInteger('font', 'GridsFontColor', Font_Grids.Color);
        WriteInteger('font', 'MainCharset', Font_Main.Charset);

      finally
        UpdateFile;
        Free;
      end;

      if (ModalResult = mrOk) then CanClose := True;

      FModified := False;

    finally
      Free;
      FLogo.Free;
      Screen.Cursor := crDefault;
    end;

  except
    on e:exception do begin
      TrRollback;
      ssMessageDlg(e.Message, ssmtError, [ssmbOk]);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if not allowALUpdate(200) then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.ActionListUpdate') else _udebug := nil;{$ENDIF}

  try // except
    aOk.Enabled := FModified;
    aApply.Enabled := aOk.Enabled;
    btnUndo.Enabled := FDeleted;
    btnClear.Enabled := (imgLogo.Picture.Height > 0);

    {if tsAccounts.Visible or tsAccount.Visible then begin
      aAccNew.Enabled := True;
      aAccProps.Enabled := not mdAccount.IsEmpty and (pcMain.ActivePage <> tsAccount);
      aAccDel.Enabled := not mdAccount.IsEmpty;
    end
    else begin
      aAccNew.Enabled := False;
      aAccProps.Enabled := False;
      aAccDel.Enabled := False;
    end;
    }
    
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.DataModified(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.aApplyExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.aApplyExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrYes;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.aOKExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.aOKExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrOK;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.aCancelExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.aCancelExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.SetCaptions;
  var
    CurrItem, li, i: integer;
    FItem, FEntItem, FRoot: TTreeNode;
    cbi: TcxImageComboboxItem;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aApply.Caption := GetRS('Common', 'Apply');
    btnSendErrMessage.Hint := GetRS('Common', 'SendErrMessage');
    btnBankRef.Hint := GetRS('fmKAgent', 'BankRef');
    btnAccountRef.Hint := GetRS('fmKAgent', 'AccountRef');

    chbNextCtrlOnEnter.Properties.Caption := GetRS(Self.Name, 'NextCtrlOnEnter');
    Self.Caption := GetRS(Self.Name, 'Title');

    lLang.Caption := GetRS(Self.Name, 'Language') + ':';
    lCountryOfOp.Caption := GetRS(Self.Name, 'CountryOfOp') + ':';
    cbCountryOfOp.Hint := GetRS(Self.Name, 'CountryOfOpHint');
    lAccRules.Caption := GetRS(Self.Name, 'AccRules') + ':';
    cbAccRules.Hint := GetRS(Self.Name, 'AccRulesHint');
    cbAccRules.Properties.Items.AddObject(GetRS('Common', 'Default'), pointer(-1));
    cbAccRules.Enabled := False;
    chbAccRules.Properties.Caption := GetRS('Common', 'Default');
    chbAccRules.Checked := True;
    chbAccRules.Enabled := False;

    {$IFNDEF DEBUG}
    if CountryRules.CID = cidUS then begin
      cbLang.Enabled := False;
      cbRepLang.Enabled := False;
    end;
    {$ENDIF}

    chbFilterOnSearch.Properties.Caption := GetRS(Self.Name, 'FilterOnSearch');

    chbWBOutDCCheck.Properties.Caption := GetRS(Self.Name, 'WBOutCheckDC');
    lWBOutPriceType.Caption := GetRS(Self.Name, 'WBOutPriceType') + ':';
    lEntName.Caption := GetRS(Self.Name, 'Name') + ':';
    lFullName.Caption := GetRS(Self.Name, 'FullName') + ':';
    lEntAddr.Caption := GetRS(Self.Name, 'Addr') + ':';
    lEntPhone.Caption := GetRS(Self.Name, 'Phone') + ':';
    lEntINN.Caption := GetRS(Self.Name, 'INN') + ':';
    lEntOKPO.Caption := GetRS(Self.Name, 'OKPO') + ':';
    lEntCertNum.Caption := GetRS(Self.Name, 'CertNum') + ':';
    lNDS.Caption := GetRS(Self.Name, 'NDS') + ':';
    lOddColor.Caption := GetRS(Self.Name, 'OddColor') + ':';
    lKPP.Caption := GetRS(Self.Name, 'KPP') + ':';
    lLogo.Caption := GetRS(Self.Name, 'LogoText');
    lWBOutAddType.Caption := GetRS(Self.Name, 'WBOutAddType') + ':';
    lWBInAddType.Caption := GetRS(Self.Name, 'WBOutAddType') + ':';
    lWBOutAddType.Caption := GetRS(Self.Name, 'WBOutAddType') + ':';
    lCheckCurrency.Caption := GetRS(Self.Name, 'CheckCurrency');
    chbDelToBin.Properties.Caption := GetRS(Self.Name, 'DelToBin');
    chbNDSPayer.Properties.Caption := GetRS(Self.Name, 'NDSPayer');
    chbWBInAutoPrice.Properties.Caption := GetRS(Self.Name, 'WBInAutoPrice');
    rbtWBInLastPrice.Caption := GetRS(Self.Name, 'WBInLastPrice');
    rbtWBInPriceType.Caption := GetRS(Self.Name, 'WBInPriceType');

    lMultiEntsViewType.Caption := GetRS('frmOptions', 'MultiEntsViewType');

    chbAOSelectNP.Properties.Caption := GetRS('frmOptions', 'AOSelectNP') + ':';
    chbOOSelectNP.Properties.Caption := GetRS('frmOptions', 'OSelectNP') + ':';
    chbOISelectNP.Properties.Caption := GetRS('frmOptions', 'OSelectNP') + ':';

    rbtRFrac.Caption := GetRS(Self.Name, 'RFrac') + ':';
    rbtRInt.Caption := GetRS(Self.Name, 'RInt') + ':';
    lRDigitsCount.Caption := GetRS(Self.Name, 'DigitCount') + ':';

    chbHLWMatNeeded.Properties.Caption := GetRS('frmOptions', 'HLWMatNeeded');
    lHLWMatNeeded.Caption := GetRS('frmOptions', 'HLMats');

    gbTorg13.Caption := ' ' + GetRS(Self.Name, 'Torg13') + ' ';
    rbtT13PriceIn.Caption := GetRS(Self.Name, 'Torg13PriceIn');
    rbtT13PriceType.Caption := GetRS(Self.Name, 'Torg13PriceType');

    gbEnt.Caption := ' ' + GetRS(Self.Name, 'Ent') + ' ';
    gbLogo.Caption := ' ' + GetRS(Self.Name, 'Logo') + ' ';
    gbCommon.Caption := ' ' + GetRS(Self.Name, 'Common') + ' ';
    gbIntf.Caption := ' ' + GetRS(Self.Name, 'Interface') + ' ';
    gbOperLog.Caption := ' ' + GetRS(Self.Name, 'OperLog') + ' ';
    gbCurrency.Caption := ' ' + GetRS(Self.Name, 'Currency') + ' ';
    gbWBIn.Caption := ' ' + GetRS(Self.Name, 'WBIn') + ' ';
    gbWBOut.Caption := ' ' + GetRS(Self.Name, 'WBOut') + ' ';
    gbInvoice.Caption := ' ' + GetRS('fmInvoices', 'TitleInvoices') + ' ';
    gbWBMove.Caption := ' ' + GetRS(Self.Name, 'WBMove') + ' ';
    gbTaxWB.Caption := ' ' + GetRS(Self.Name, 'TaxWB') + ' ';
    gbAO.Caption := ' ' + GetRS(Self.Name, 'AccOut') + ' ';
    gbPDIn.Caption := ' ' + GetRS(Self.Name, 'PDIn') + ' ';
    gbPDOut.Caption := ' ' + GetRS(Self.Name, 'PDOut') + ' ';
    gbPDCharge.Caption := ' ' + GetRS(Self.Name, 'PDCharge') + ' ';
    gbWBRetOut.Caption := ' ' + GetRS(Self.Name, 'WBRetOut') + ' ';
    gbWBRetIn.Caption := ' ' + GetRS(Self.Name, 'WBRetIn') + ' ';
    gbWBRest.Caption := ' ' + GetRS(Self.Name, 'WBRest') + ' ';
    gbWriteOff.Caption := ' ' + GetRS(Self.Name, 'WriteOff') + ' ';
    gbInv.Caption := ' ' + GetRS(Self.Name, 'Inv') + ' ';
    gbAccounts.Caption := ' ' + GetRS(Self.Name, 'Accounts') + ' ';
    gbBackupDBs.Caption := ' ' + GetRS(Self.Name, 'Backup') + ' ';
    gbUSDBs.Caption := ' ' + GetRS(Self.Name, 'UpdateStat') + ' ';
    gbFinance.Caption := ' ' + GetRS(Self.Name, 'Finance') + ' ';
    gbBarCodes.Caption := ' ' + GetRS('frmOptions', 'BarCodes') + ' ';
    gbWH.Caption := ' ' + GetRS('fmWMat', 'Title') + ' ';
    gbOrdersIn.Caption := ' ' + GetRS('frmOptions', 'OrdersIn') + ' ';
    gbOrdersOut.Caption := ' ' + GetRS('frmOptions', 'OrdersOut') + ' ';

    btnLock.Hint := GetRS('Common', 'Lock');
    btnHelp.Hint := GetRS('Common', 'Help');
    btnSendErrMessage.Hint := GetRS('Common', 'SendErrMessage');

    rbtUSYes.Caption := GetRS(Self.Name, 'UpdateStatYes');
    rbtUSNo.Caption := GetRS(Self.Name, 'UpdateStatNo');
    lUSText.Caption := GetRS(Self.Name, 'UpdateStatText') + ':';

    lPOType.Caption := GetRS(Self.Name, 'POType') + ':';
    rbtPOAvg.Caption := GetRS(Self.Name, 'POAvg');
    rbtPOLast.Caption := GetRS(Self.Name, 'POLast');

    chbShowRetNDS.Properties.Caption := GetRS(Self.Name, 'ShowRetNDS');
    chbShowAllMats.Properties.Caption := GetRS('frmOptions', 'WHShowAllMats');

    lCheckMoney.Caption := GetRS(Self.Name, 'CheckMoney');

    lWBOutAutoPrice.Caption := GetRS(Self.Name, 'WBOutAutoPrice') + ':';

    lShowPricePrec.Caption := GetRS(Self.Name, 'ShowPricePrec') + ':';
    lMatPrecision.Caption := GetRS(Self.Name, 'MatPrecision') + ':';
    lDigAfterPoint.Caption := GetRS(Self.Name, 'DigAfterPoint');
    lMatPrecisionEx.Caption := GetRS(Self.Name, 'DigAfterPoint');

    chbOperLog.Properties.Caption := GetRS(Self.Name, 'EnOperLog');
    chbWB.Properties.Caption := GetRS(Self.Name, 'WB');
    chbPayDoc.Properties.Caption := GetRS(Self.Name, 'PayDoc');
    chbTax.Properties.Caption := GetRS(Self.Name, 'Tax');
    chbMat.Properties.Caption := GetRS(Self.Name, 'Mat');
    chbKA.Properties.Caption := GetRS(Self.Name, 'KA');
    chbBanks.Properties.Caption := GetRS(Self.Name, 'Banks');
    chbCurrency.Properties.Caption := GetRS(Self.Name, 'Currency');
    chbMeasures.Properties.Caption := GetRS(Self.Name, 'Measures');
    chbWB.Properties.Caption := GetRS(Self.Name, 'WB');
    chbWHouses.Properties.Caption := GetRS(Self.Name, 'WHouses');
    chbAccTypes.Properties.Caption := GetRS(Self.Name, 'AccTypes');
    chbCountries.Properties.Caption := GetRS(Self.Name, 'Countries');
    chbMatGroups.Properties.Caption := GetRS(Self.Name, 'MatGroups');
    chbPriceTypes.Properties.Caption := GetRS(Self.Name, 'PriceTypes');
    btnAccLevelUp.Hint := GetRS('Common', 'LevelUp');

    case CountryRules.AR of
      accRul_RU: lBank.Caption := rs(Self.Name, 'BIC') + ':';
      accRul_UA: lBank.Caption := rs(Self.Name, 'MFO') + ':';
      else lBank.Caption := rs(Self.Name, 'ABA') + ':';
    end;
    colAccMFO.Caption := lBank.Caption;

    lBankName.Caption := GetRS(Self.Name, 'Bank') + ':';
    lAccount.Caption := GetRS(Self.Name, 'Account') + ':';
    lType.Caption := GetRS(Self.Name, 'AccountType') + ':';

    // прих. накл.
    chbWBInAllowZero.Properties.Caption := GetRS(Self.Name, 'WBInAllowZero');
    lWBInDefAmount.Caption := GetRS(Self.Name, 'DefAmount') + ':';
    chbWBInChecked.Properties.Caption := GetRS(Self.Name, 'DocChecked');
    chbWBInAutoNum.Properties.Caption := GetRS(Self.Name, 'AutoNum');
    lWBInPrefix.Caption := GetRS(Self.Name, 'Prefix') + ':';
    lWBInSuffix.Caption := GetRS(Self.Name, 'Suffix') + ':';
    lWBInCurrNum.Caption := GetRS(Self.Name, 'CurrNum') + ':';
    lWbInRepSort.Caption := GetRS(Self.Name, 'lWBRepSort') + ':';
    with cbWBInRepSortField do begin
      Items.Clear;
      Items.Add(GetRS(Self.Name, 'RepSortFieldNone'));
      Items.Add(GetRS(Self.Name, 'RepSortFieldName'));
      Items.Add(GetRS(Self.Name, 'RepSortFieldModel'));
      ItemIndex := 0;
    end;

    // расх. накл.
    chbWBOutAllowZero.Properties.Caption := GetRS(Self.Name, 'WBOutAllowZero');
    lWBOutDefAmount.Caption := GetRS(Self.Name, 'DefAmount') + ':';
    chbWBOutChecked.Properties.Caption := GetRS(Self.Name, 'DocChecked');
    chbWBOutAutoNum.Properties.Caption := GetRS(Self.Name, 'AutoNum');
    lWBOutPrefix.Caption := GetRS(Self.Name, 'Prefix') + ':';
    lWBOutSuffix.Caption := GetRS(Self.Name, 'Suffix') + ':';
    lWBOutCurrNum.Caption := GetRS(Self.Name, 'CurrNum') + ':';
    lWbOutRepSort.Caption := GetRS(Self.Name, 'lWBRepSort') + ':';
    with cbWBOutRepSortField do begin
      Items.Clear;
      Items.Add(GetRS(Self.Name, 'RepSortFieldNone'));
      Items.Add(GetRS(Self.Name, 'RepSortFieldName'));
      Items.Add(GetRS(Self.Name, 'RepSortFieldModel'));
      ItemIndex := 0;
    end;

    lInvoiceDefAmount.Caption := GetRS(Self.Name, 'DefAmount') + ':';
    chbInvoiceAutoNum.Properties.Caption := GetRS(Self.Name, 'AutoNum');
    lInvoicePrefix.Caption := GetRS(Self.Name, 'Prefix') + ':';
    lInvoiceSuffix.Caption := GetRS(Self.Name, 'Suffix') + ':';
    lInvoiceCurrNum.Caption := GetRS(Self.Name, 'CurrNum') + ':';

    chbRetOutChecked.Properties.Caption := GetRS(Self.Name, 'DocChecked');
    chbRetOutAutoNum.Properties.Caption := GetRS(Self.Name, 'AutoNum');
    lRetOutPrefix.Caption := GetRS(Self.Name, 'Prefix') + ':';
    lRetOutSuffix.Caption := GetRS(Self.Name, 'Suffix') + ':';
    lRetOutCurrNum.Caption := GetRS(Self.Name, 'CurrNum') + ':';

    chbRetInChecked.Properties.Caption := GetRS(Self.Name, 'DocChecked');
    chbRetInAutoNum.Properties.Caption := GetRS(Self.Name, 'AutoNum');
    lRetInPrefix.Caption := GetRS(Self.Name, 'Prefix') + ':';
    lRetInSuffix.Caption := GetRS(Self.Name, 'Suffix') + ':';
    lRetInCurrNum.Caption := GetRS(Self.Name, 'CurrNum') + ':';

    chbWBRestAllowZero.Properties.Caption := GetRS(Self.Name, 'WBInAllowZero');
    lWBRestDefAmount.Caption := GetRS(Self.Name, 'DefAmount') + ':';
    chbWBRestChecked.Properties.Caption := GetRS(Self.Name, 'DocChecked');
    chbWBRestAutoNum.Properties.Caption := GetRS(Self.Name, 'AutoNum');
    lWBRestPrefix.Caption := GetRS(Self.Name, 'Prefix') + ':';
    lWBRestSuffix.Caption := GetRS(Self.Name, 'Suffix') + ':';
    lWBRestCurrNum.Caption := GetRS(Self.Name, 'CurrNum') + ':';

    lWBMoveDefAmount.Caption := GetRS(Self.Name, 'DefAmount') + ':';
    chbWBMoveChecked.Properties.Caption := GetRS(Self.Name, 'DocChecked');
    chbWBMoveAutoNum.Properties.Caption := GetRS(Self.Name, 'AutoNum');
    lWBMovePrefix.Caption := GetRS(Self.Name, 'Prefix') + ':';
    lWBMoveSuffix.Caption := GetRS(Self.Name, 'Suffix') + ':';
    lWBMoveCurrNum.Caption := GetRS(Self.Name, 'CurrNum') + ':';

    lAODefAmount.Caption := GetRS(Self.Name, 'DefAmount') + ':';
    chbAOAutoNum.Properties.Caption := GetRS(Self.Name, 'AutoNum');
    lAOPrefix.Caption := GetRS(Self.Name, 'Prefix') + ':';
    lAOSuffix.Caption := GetRS(Self.Name, 'Suffix') + ':';
    lAOCurrNum.Caption := GetRS(Self.Name, 'CurrNum') + ':';

    chbWBOutAutoWH.Properties.Caption := GetRS('fmWaybill', 'WBOutAutoWH');
    chbAOAutoWH.Properties.Caption := GetRS('fmWaybill', 'WBOutAutoWH');

    lTaxWBDefAmount.Caption := GetRS(Self.Name, 'DefAmount') + ':';
    chbTaxAutoNum.Properties.Caption := GetRS(Self.Name, 'AutoNum');
    lTaxPrefix.Caption := GetRS(Self.Name, 'Prefix') + ':';
    lTaxSuffix.Caption := GetRS(Self.Name, 'Suffix') + ':';
    lTaxCurrNum.Caption := GetRS(Self.Name, 'CurrNum') + ':';
    lChargeType.Caption := GetRS(Self.Name, 'ChargeType') + ':';

    chbPDInAutoNum.Properties.Caption := GetRS(Self.Name, 'AutoNum');
    chbPDInChecked.Properties.Caption := GetRS(Self.Name, 'DocChecked');
    lPDInPrefix.Caption := GetRS(Self.Name, 'Prefix') + ':';
    lPDInSuffix.Caption := GetRS(Self.Name, 'Suffix') + ':';
    lPDInCurrNum.Caption := GetRS(Self.Name, 'CurrNum') + ':';

    chbPDOutAutoNum.Properties.Caption := GetRS(Self.Name, 'AutoNum');
    chbPDOutChecked.Properties.Caption := GetRS(Self.Name, 'DocChecked');
    lPDOutPrefix.Caption := GetRS(Self.Name, 'Prefix') + ':';
    lPDOutSuffix.Caption := GetRS(Self.Name, 'Suffix') + ':';
    lPDOutCurrNum.Caption := GetRS(Self.Name, 'CurrNum') + ':';

    chbPDChargeAutoNum.Properties.Caption := GetRS(Self.Name, 'AutoNum');
    chbPDChargeChecked.Properties.Caption := GetRS(Self.Name, 'DocChecked');
    lPDChargePrefix.Caption := GetRS(Self.Name, 'Prefix') + ':';
    lPDChargeSuffix.Caption := GetRS(Self.Name, 'Suffix') + ':';
    lPDChargeCurrNum.Caption := GetRS(Self.Name, 'CurrNum') + ':';

    lWriteOffDefAmount.Caption := GetRS(Self.Name, 'DefAmount') + ':';
    chbWriteOffChecked.Properties.Caption := GetRS(Self.Name, 'DocChecked');
    chbWriteOffAutoNum.Properties.Caption := GetRS(Self.Name, 'AutoNum');
    lWriteOffPrefix.Caption := GetRS(Self.Name, 'Prefix') + ':';
    lWriteOffSuffix.Caption := GetRS(Self.Name, 'Suffix') + ':';
    lWriteOffCurrNum.Caption := GetRS(Self.Name, 'CurrNum') + ':';

    chbInvChecked.Properties.Caption := GetRS(Self.Name, 'DocChecked');
    chbInvAutoNum.Properties.Caption := GetRS(Self.Name, 'AutoNum');
    lInvPrefix.Caption := GetRS(Self.Name, 'Prefix') + ':';
    lInvSuffix.Caption := GetRS(Self.Name, 'Suffix') + ':';
    lInvCurrNum.Caption := GetRS(Self.Name, 'CurrNum') + ':';

    lOrdersInDefAmount.Caption := GetRS('frmOptions', 'DefAmount') + ':';
    chbOrdersInAutoNum.Properties.Caption := GetRS(Self.Name, 'AutoNum');
    lOrdersInPrefix.Caption := GetRS(Self.Name, 'Prefix') + ':';
    lOrdersInSuffix.Caption := GetRS(Self.Name, 'Suffix') + ':';
    lOrdersInCurrNum.Caption := GetRS(Self.Name, 'CurrNum') + ':';

    lOrdersOutDefAmount.Caption := GetRS('frmOptions', 'DefAmount') + ':';
    chbOrdersOutAutoNum.Properties.Caption := GetRS(Self.Name, 'AutoNum');
    lOrdersOutPrefix.Caption := GetRS(Self.Name, 'Prefix') + ':';
    lOrdersOutSuffix.Caption := GetRS(Self.Name, 'Suffix') + ':';
    lOrdersOutCurrNum.Caption := GetRS(Self.Name, 'CurrNum') + ':';

    chbShowCalc.Properties.Caption := GetRS('frmOptions', 'ShowCalc');
    lBackupText.Caption := GetRS(Self.Name, 'BackupText');
    colDBName.Caption := GetRS(Self.Name, 'DB');
    colDBOptions.Caption := GetRS(Self.Name, 'MakeBackup');
    rbtBackupNo.Caption := GetRS(Self.Name, 'BackupNo');
    rbtBackupYes.Caption := GetRS(Self.Name, 'BackupYes');
    lBackupDir.Caption := GetRS(Self.Name, 'BackupDir') + ':';
    lBackupInterval.Caption := GetRS(Self.Name, 'BackupInterval') + ':';

    lRPType.Caption := GetRS(Self.Name, 'RPType') + ':';

    lUpdStatText.Caption := GetRS(Self.Name, 'UpdText');
    colUSName.Caption := GetRS(Self.Name, 'DB');
    colUSText.Caption := GetRS(Self.Name, 'UpdateStatText');

    aAccNew.Caption := GetRS('Common', 'Add');
    aAccProps.Caption := GetRS('Common', 'Properties');
    aAccDel.Caption := GetRS('Common', 'Del');

    mnuNew.Caption := GetRS('Common', 'Add');
    mnuDel.Caption := GetRS('Common', 'Del');

    chbBC_Weight.Properties.Caption := GetRS('frmOptions', 'BCEnabled');
    lBCFirstDigit.Caption := GetRS('frmOptions', 'BCStartDigit') + ':';
    lBCCode.Caption := GetRS('frmOptions', 'BCCode') + ':';
    lBCCodeFrom.Caption := GetRS('frmOptions', 'BCFrom');
    lBCCodeTo.Caption := GetRS('frmOptions', 'BCTo');
    lBCWeight.Caption := GetRS('frmOptions', 'BCWeight') + ':';
    lBCCodeInt.Caption := GetRS('frmOptions', 'BCWeightInt') + ':';
    lBCCodeIntFrom.Caption := GetRS('frmOptions', 'BCFrom');
    lBCCodeFracFrom.Caption := GetRS('frmOptions', 'BCFrom');
    lBCCodeFrac.Caption := GetRS('frmOptions', 'BCWeightFrac') + ':';
    lBCCodeIntTo.Caption := GetRS('frmOptions', 'BCTo');
    lBCCodeFracTo.Caption := GetRS('frmOptions', 'BCTo');

    colAccNum.Caption := GetRS(Self.Name, 'Account');
    colAccType.Caption := GetRS(Self.Name, 'AccountType');

    lRepLang.Caption := GetRS(Self.Name, 'RepLang') + ':';

    lPrintType.Caption := GetRS(Self.Name, 'PrintType') + ':';

    with cbWBOutAddType do begin
      if ItemIndex > 0 then li := ItemIndex else li := 0;
      Properties.Items.Clear;
      Properties.Items.Add(GetRS('fmWaybill', 'MatName'));
      Properties.Items.Add(GetRS('fmWaybill', 'SvcV'));
      Properties.Items.Add(GetRS('fmWaybill', 'AddMatList'));
      ItemIndex := li;
    end;

    with cbWBInAddType do begin
      if ItemIndex > 0 then li := ItemIndex else li := 0;
      Properties.Items.Clear;
      Properties.Items.Add(GetRS('fmWaybill', 'MatName'));
      Properties.Items.Add(GetRS('fmWaybill', 'SvcV'));
      Properties.Items.Add(GetRS('fmWaybill', 'AddMatList'));
      ItemIndex := li;
    end;

    with cbWBOutPriceType do begin
      if ItemIndex > 0 then li := ItemIndex else li := 0;
      Properties.Items.Clear;
      Properties.Items.Add(GetRS(Self.Name, 'WithNDS'));
      Properties.Items.Add(GetRS(Self.Name, 'WithoutNDS'));
      ItemIndex := li;
    end;

    with cbMultiEntsViewType do begin
      if ItemIndex > 0 then li := ItemIndex else li := 0;
      Properties.Items.Clear;
      Properties.Items.Add(GetRS('frmOptions', 'MEAll'));
      Properties.Items.Add(GetRS('frmOptions', 'MECurrent'));
      ItemIndex := li;
    end;

    with cbWBOutAutoPrice do begin
      if ItemIndex > 0 then li := ItemIndex else li := 0;
      Properties.Items.Clear;
      Properties.Items.Add(GetRS(Self.Name, 'ByPricing'));
      Properties.Items.Add(GetRS(Self.Name, 'LastOutPrice'));
      Properties.Items.Add(GetRS(Self.Name, 'LastOutPriceKA'));
      ItemIndex := li;
    end;

    with cbPrintType do begin
      if ItemIndex > 0 then li := ItemIndex else li := 0;
      Properties.Items.Clear;
      Properties.Items.Add(GetRS(Self.Name, 'WithoutNDS'));
      Properties.Items.Add(GetRS(Self.Name, 'WithNDS'));
      ItemIndex := li;
    end;

    with cbRPType do begin
      if ItemIndex > 0 then li := ItemIndex else li := 0;
      Properties.Items.Clear;
      Properties.Items.Add(RS(Self.Name, 'RPNone'));
      Properties.Items.Add(RS(Self.Name, 'RPHigh'));
      Properties.Items.Add(RS(Self.Name, 'RPLow'));
      ItemIndex := li;
    end;

    with cbLang do begin
      Properties.Items.Clear;
      for i := 0 to LangMan.FilesCount - 1 do
        Properties.Items.Add(LangMan.Files[i].Desc + ' - ' + LangMan.Files[i].LangName);
    end;

    with cbRepLang do begin
      Properties.Items.Clear;
      for i := 0 to LangMan.FilesCount - 1 do
        Properties.Items.Add(LangMan.Files[i].Desc + ' - ' + LangMan.Files[i].LangName);
    end;

    with cbCountryOfOp do begin
      Properties.Images := CountryRules.Images;
      Properties.Items.Clear;
      for i := 0 to CountryRules.Count - 1 do begin
        cbi := TcxImageComboboxItem(Properties.Items.Add);
        cbi.ImageIndex := CountryRules[i].FlagIndex;
        cbi.Description := CountryRules[i].Name;
        cbi.Value := CountryRules[i].cid;

        if (CountryRules.cid <> -1) and (CountryRules.cid = CountryRules[i].cid)
          then ItemIndex := cbi.Index;
      end;
    end;

    with cbChargeType do begin
      if ItemIndex > 0 then li := ItemIndex else li := 0;
      Properties.Items.Clear;
      Properties.Items.Add(GetRS(Self.Name, 'FIFO'));
      Properties.Items.Add(GetRS(Self.Name, 'LIFO'));
      ItemIndex := li;
    end;

    with cbBackupInterval do begin
      Properties.Items.Clear;
      Properties.Items.Add(GetRS(Self.Name, 'Days'));
      Properties.Items.Add(GetRS(Self.Name, 'Weeks'));
      Properties.Items.Add(GetRS(Self.Name, 'Months'));
      ItemIndex := 0;
    end;

    with cbUSInterval do begin
      Properties.Items.Clear;
      Properties.Items.Add(GetRS(Self.Name, 'Days'));
      Properties.Items.Add(GetRS(Self.Name, 'Weeks'));
      Properties.Items.Add(GetRS(Self.Name, 'Months'));
      ItemIndex := 0;
    end;

    tvMain.Items.BeginUpdate;
    try
      if tvMain.Items.Count > 0
        then CurrItem := Integer(tvMain.Selected.Data)
        else CurrItem := -1;

      with tvMain do begin
       Items.Clear;
       FItem := Items.Add(nil, GetRS(Self.Name, 'Common'));
       FItem.Data := pointer(0);
       FItem.ImageIndex := 117;
       FItem.SelectedIndex := 117;
       if (CurrItem = -1) or (CurrItem = 0) then Selected := FItem;
       FRoot := FItem;

       FItem := Items.AddChild(FRoot, GetRS(Self.Name, 'Interface'));
       FItem.Data := Pointer(2);
       FItem.ImageIndex := 22;
       FItem.SelectedIndex := 22;

       if CurrItem = 2 then Selected := FItem;

       FItem := Items.AddChild(FRoot, GetRS(Self.Name, 'Logo'));
       FItem.Data := pointer(3);
       FItem.ImageIndex := 118;
       FItem.SelectedIndex := 118;

       FItem := Items.Add(nil, GetRS('frmMain', 'Docs'));
       FItem.Data := Pointer(tsGrp.PageIndex);
       FItem.ImageIndex := 42;
       FItem.SelectedIndex := 42;
       FDocsNode := FItem;
       FItem := Items.Add(nil, GetRS('frmMain', 'WMat'));
       FItem.Data := Pointer(tsGrp.PageIndex);
       FItem.ImageIndex := 50;
       FItem.SelectedIndex := 50;
       FWMatNode := FItem;
       FItem := Items.Add(nil, GetRS(Self.Name, 'Finance'));
       FItem.Data := Pointer(25);
       FItem.ImageIndex := II_FINANCES;
       FItem.SelectedIndex := II_FINANCES;

       FItem := Items.Add(nil, GetRS('frmMain', 'Refs'));
       FItem.Data := Pointer(tsGrp.PageIndex);
       FItem.ImageIndex := 0;
       FItem.SelectedIndex := 0;
       FRefsNode := FItem;
       FItem := Items.Add(nil, GetRS('frmMain', 'Service'));
       FItem.Data := Pointer(tsGrp.PageIndex);
       FItem.ImageIndex := 27;
       FItem.SelectedIndex := 27;
       FSvcNode := FItem;

       FItem := Items.AddChild(FSvcNode, GetRS(Self.Name, 'OperLog'));
       FItem.Data := Pointer(4);
       FItem.ImageIndex := 119;
       FItem.SelectedIndex := 119;
       FItem.StateIndex := 148;

       FItem := Items.AddChild(FRefsNode, GetRS(Self.Name, 'Currency'));
       FItem.Data := Pointer(5);
       FItem.ImageIndex := 2;
       FItem.SelectedIndex := 2;
       FItem.StateIndex := 77;

       FItem := Items.AddChild(FDocsNode, GetRS(Self.Name, 'WBIn'));
       FItem.Data := Pointer(6);
       FItem.ImageIndex := II_WBIN;
       FItem.SelectedIndex := II_WBIN;
       FItem.StateIndex := II_WBINDis;
       FItem := Items.AddChild(FDocsNode, GetRS(Self.Name, 'AccOut'));
       FItem.Data := Pointer(10);
       FItem.ImageIndex := II_AccOut;
       FItem.SelectedIndex := II_AccOut;
       FItem.StateIndex := II_AccOutDis;
       FItem := Items.AddChild(FDocsNode, GetRS(Self.Name, 'WBOut'));
       FItem.Data := Pointer(7);
       FItem.ImageIndex := II_WBOUT;
       FItem.SelectedIndex := II_WBOUT;
       FItem.StateIndex := II_WBOUTDis;

       case CountryRules.AR of
         accRul_UA: begin
           FItem := Items.AddChild(FDocsNode, GetRS(Self.Name, 'TaxWB'));
           FItem.Data := Pointer(9);
           FItem.ImageIndex := II_TaxWB;
           FItem.SelectedIndex := II_TaxWB;
           FItem.StateIndex := II_TaxWBDis;
         end;

         accRul_RU: begin
           FItem := Items.AddChild(FDocsNode, GetRS('fmInvoices', 'TitleInvoices'));
           FItem.Data := Pointer(26);
           FItem.ImageIndex := II_WBINVOICE;
           FItem.SelectedIndex := II_WBINVOICE;
           FItem.StateIndex := II_WBINVOICEDis;
         end;
       end; //case CountryRules.AR

       FItem := Items.AddChild(FDocsNode, GetRS(Self.Name, 'PDIn'));
       FItem.Data := Pointer(11);
       FItem.ImageIndex := II_PDIN;
       FItem.SelectedIndex := II_PDIN;
       FItem.StateIndex := II_PDINDis;
       FItem := Items.AddChild(FDocsNode, GetRS(Self.Name, 'PDOut'));
       FItem.Data := Pointer(12);
       FItem.ImageIndex := II_PDOUT;
       FItem.SelectedIndex := II_PDOUT;
       FItem.StateIndex := II_PDOUTDis;
       FItem := Items.AddChild(FDocsNode, GetRS(Self.Name, 'PDCharge'));
       FItem.Data := Pointer(20);
       FItem.ImageIndex := II_PDCHARGE;
       FItem.SelectedIndex := II_PDCHARGE;
       FItem.StateIndex := II_PDCHARGEDis;

       FItem := Items.AddChild(FDocsNode, GetRS(Self.Name, 'WBRetOut'));
       FItem.Data := Pointer(23);
       FItem.ImageIndex := II_WBRETOUT;
       FItem.SelectedIndex := II_WBRETOUT;
       FItem.StateIndex := II_WBRETOUTDis;
       FItem := Items.AddChild(FDocsNode, GetRS(Self.Name, 'WBRetIn'));
       FItem.Data := Pointer(24);
       FItem.ImageIndex := II_WBRETIN;
       FItem.SelectedIndex := II_WBRETIN;
       FItem.StateIndex := II_WBRETINDis;

       FItem := Items.AddChild(FDocsNode, GetRS('frmOptions', 'OrdersOut'));
       FItem.Data := Pointer(tsOrdersOut.PageIndex);
       FItem.ImageIndex := II_ORDEROUT;
       FItem.SelectedIndex := II_ORDEROUT;
       FItem.StateIndex := II_ORDEROUTDis;
       FItem := Items.AddChild(FDocsNode, GetRS('frmOptions', 'OrdersIn'));
       FItem.Data := Pointer(tsOrdersIn.PageIndex);
       FItem.ImageIndex := II_ORDERIN;
       FItem.SelectedIndex := II_ORDERIN;
       FItem.StateIndex := II_ORDERINDis;

       FItem := Items.AddChild(FWMatNode, GetRS('fmWMat', 'Title'));
       FItem.Data := Pointer(28);
       FItem.ImageIndex := II_WH;
       FItem.SelectedIndex := II_WH;
       FItem.StateIndex := II_WHDis;
       FItem := Items.AddChild(FWMatNode, GetRS(Self.Name, 'WBMove'));
       FItem.Data := Pointer(8);
       FItem.ImageIndex := II_WBMove;
       FItem.SelectedIndex := II_WBMove;
       FItem.StateIndex := II_WBMoveDis;
       FItem := Items.AddChild(FWMatNode, GetRS(Self.Name, 'WBRest'));
       FItem.Data := Pointer(13);
       FItem.ImageIndex := II_WBREST;
       FItem.SelectedIndex := II_WBREST;
       FItem.StateIndex := II_WBRESTDis;

       FItem := Items.AddChild(FWMatNode, GetRS(Self.Name, 'WriteOff'));
       FItem.Data := Pointer(21);
       FItem.ImageIndex := II_WRITEOFF;
       FItem.SelectedIndex := II_WRITEOFF;
       FItem.StateIndex := II_WRITEOFFDis;

       FItem := Items.AddChild(FWMatNode, GetRS(Self.Name, 'Inv'));
       FItem.Data := Pointer(22);
       FItem.ImageIndex := II_INVENTORY;
       FItem.SelectedIndex := II_INVENTORY;
       FItem.StateIndex := II_INVENTORYDis;

       FItem := Items.AddChild(FRoot, GetRS('frmOptions', 'BarCodes'));
       FItem.Data := Pointer(tsBarCodes.PageIndex);
       FItem.ImageIndex := II_BARCODE;
       FItem.SelectedIndex := II_BARCODE;

       {FItem := Items.AddChild(FSvcNode, GetRS(Self.Name, 'Backup'));
       FItem.Data := Pointer(17);
       FItem.ImageIndex := 151;
       FItem.SelectedIndex := 151;
       FItem.StateIndex := 202;
       FBackupNode := FItem;
       cdsDB.First;

       while not cdsDB.Eof do begin
         FItem := Items.AddChild(FBackupNode, cdsDB.FieldByName('desc').AsString);
         cdsDB.Edit;
         cdsDB.FieldByName('fnode').AsInteger := Integer(FItem);
         cdsDB.FieldByName('intervalvalue').AsInteger := 1;
         cdsDB.Post;
         FItem.Data := Pointer(cdsDB.FieldByName('dbid').AsInteger);

         if cdsDB.FieldByName('enabled').AsInteger = 1 then begin
           FItem.ImageIndex := 96;
           FItem.SelectedIndex := 96;
         end
         else begin
           FItem.ImageIndex := 123;
           FItem.SelectedIndex := 123;
         end;
         cdsDB.Next;
       end;

       FItem := Items.AddChild(FSvcNode, GetRS(Self.Name, 'UpdateStat'));
       FItem.Data := Pointer(19);
       FItem.ImageIndex := 152;
       FItem.SelectedIndex := 152;
       FItem.StateIndex := 201;
       FUpdStatNode := FItem;
       cdsDB.First;

       while not cdsDB.Eof do begin
         FItem := Items.AddChild(FUpdStatNode, cdsDB.FieldByName('desc').AsString);
         cdsDB.Edit;
         cdsDB.FieldByName('fupdnode').AsInteger := Integer(FItem);
         cdsDB.FieldByName('updintervalvalue').AsInteger := 1;
         cdsDB.Post;
         FItem.Data := Pointer(cdsDB.FieldByName('dbid').AsInteger);
         if cdsDB.FieldByName('updenabled').AsInteger = 1 then begin
           FItem.ImageIndex := 96;
           FItem.SelectedIndex := 96;
         end
         else begin
           FItem.ImageIndex := 123;
           FItem.SelectedIndex := 123;
         end;
         cdsDB.Next;
       end;
       }

       FRoot.Expand(False);
      end;

    finally
      tvMain.Items.EndUpdate;
    end;

    lWBMoveShowModel.Caption := rs(Self.Name, 'showModelLabel');
    with lcbWBMoveShowModel do begin
      Items.Clear;
      for i := 0 to 2 do Items.Add(GetRS(Self.Name, 'showModel' + inttostr(i)));
    end;

    lWBInShowModel.Caption := rs(Self.Name, 'showModelLabel');
    with lcbWBInShowModel do begin
      Items.Clear;
      for i := 0 to 2 do Items.Add(GetRS(Self.Name, 'showModel' + inttostr(i)));
    end;

    lWBOutShowModel.Caption := rs(Self.Name, 'showModelLabel');
    with lcbWBOutShowModel do begin
      Items.Clear;
      for i := 0 to 2 do Items.Add(GetRS(Self.Name, 'showModel' + inttostr(i)));
    end;

   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.tvMainChange(Sender: TObject; Node: TTreeNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.tvMainChange') else _udebug := nil;{$ENDIF}


  if (Node.Parent <> nil) and (Node.Parent = FAccountNode) then begin
    {mdAccount.Locate('accid', Integer(Node.Data), []);
    pcMain.ActivePage := tsAccount;
    gbAccountEdit.Caption := ' ' + Node.Text + ' ';
    }
  end
  else if (Node.Parent <> nil) and (Node.Parent = FBackupNode) then begin
    pcMain.ActivePage := tsBackup;
    gbBackup.Caption := ' ' + Node.Text + ' ';
    cdsDB.Locate('dbid', Integer(Node.Data), []);
  end
  else if (Node.Parent <> nil) and (Node.Parent = FUpdStatNode) then begin
    pcMain.ActivePage := tsUpdStat;
    gbUS.Caption := ' ' + Node.Text + ' ';
    cdsDB.Locate('dbid', Integer(Node.Data), []);
  end
  else pcMain.ActivePageIndex := Integer(Node.Data);

  if Integer(Node.Data) = tsGrp.PageIndex then begin
    ReloadGroup(Node);
    gbGrp.Caption := ' ' + Node.Text + ' ';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.LoadOptions;
  var
    FStream: TMemoryStream;
    FLogo: TBitmap;
    i:Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.LoadOptions') else _udebug := nil;{$ENDIF}

   FLogo := TBitmap.Create;
   FStream := TMemoryStream.Create;
   Screen.Cursor := crSQLWait;

   cbLang.ItemIndex := LangID;
   cbRepLang.ItemIndex := RepLangID;

   cbMainFont.FontName := Font_Main.Name;
   seMainFont.Value := Font_Main.Size;
   cbGridsFont.FontName := Font_Grids.Name;
   seGridsFont.Value := Font_Grids.Size;
   cbMainFontColor.ColorValue := Font_Main.Color;
   cbGridsFontColor.ColorValue := Font_Grids.Color;

   with newDataSet do
     try
       ProviderName := 'pProfiles_GetByUser';
       //FetchParams;
       //Params.ParamByName('userid').AsInteger := UserID;
       Open;
       //cbStyle.ItemIndex := fieldbyname('istyle').AsInteger;

       cbOddColor.ColorValue := fieldbyname('oddcolor').AsInteger;
       cbChargeType.ItemIndex := Ord(ChargeType);
       Close;

       chbHLWMatNeeded.Checked := HighlightNeededMats;
       edHLWMatNeeded.ColorValue := CL_OK_WMAT_HIGHLIGHT_NEEDED;
       edAOSelectNP.ColorValue := CL_OK_AO_NOT_PAID;
       edOOSelectNP.ColorValue := CL_OK_OO_NOT_PAID;
       edOISelectNP.ColorValue := CL_OK_OI_NOT_PAID;

       ProviderName := 'pEntParams_Get';
       Params.Clear;
       Open;

       if not IsEmpty then begin
         edEntName.Text := FieldByName('name').AsString;
         memEntAddr.Text := fieldbyname('addr').AsString;
         memFullName.Text := FieldByName('fullname').AsString;
         edEntPhone.Text := fieldbyname('phone').AsString;
         edEntINN.Text := fieldbyname('inn').AsString;
         edKPP.Text := fieldbyname('kpp').AsString;
         edEntOKPO.Text := fieldbyname('okpo').AsString;
         edEntCertNum.Text := fieldbyname('certnum').AsString;
         chbNDSPayer.Checked := (fieldbyname('ndspayer').AsInteger = 1);
         (FieldByName('logo') as TBlobField).SaveToStream(FStream);
         FStream.Position := 0;
         FLogo.LoadFromStream(FStream);
         imgLogo.Height := FLogo.Height;
         imgLogo.Width := FLogo.Width;
         imgBevel.Height := FLogo.Height + 10;
         imgBevel.Width := FLogo.Width + 10;

         imgLogo.Picture.Assign(FLogo);
       end;
       Close;

       {ProviderName := 'pEntAccounts_Get';
       Params.Clear;
       Open;
       mdAccount.LoadFromDataSet(Fields[0].DataSet, 0, lmAppend);
       Close;
       }

       LoadAccounts;

       ProviderName := 'pCommonParams_Get';
       Open;
       if not IsEmpty then edNDS.Value := fieldbyname('nds').AsFloat;
       Close;

       case POType of
         poAvg:  rbtPOAvg.Checked := True;
         poLast: rbtPOLast.Checked := True;
       end;

       chbCheckCurrency.Checked := CheckCurrency;
       chbNextCtrlOnEnter.Checked := NextCtrlOnEnter;
       cbPrintType.ItemIndex := PrintType;
       edShowPricePrec.Value := PricePrecision;
       edMatPrecision.Value := -MatDisplayDigits;
       chbDelToBin.Checked := DelToRecycleBin;
       chbFilterOnSearch.Checked := FilterOnSearch;
       chbShowCalc.Checked := ShowCalcOnKeyPress;
       cbMultiEntsViewType.ItemIndex := MultiEntsViewType;

       chbAOAutoWH.Checked := AccOutAutoWH;
       chbShowRetNDS.Checked := ShowRetNDS;

       edInvoiceDefAmount.Value := InvoiceDefAmount;
       chbInvoiceAutoNum.Checked := InvoiceAutoNum;
       edInvoicePrefix.Text := InvoicePrefix;
       edInvoiceSuffix.Text := InvoiceSuffix;

       chbWBInAllowZero.Checked := WBInAllowZero;
       edWBInDefAmount.Value := WBInDefAmount;
       chbWBInChecked.Checked := WBInChecked;
       chbWBInAutoNum.Checked := WBInAutoNum;
       edWBInPrefix.Text := WBInPrefix;
       edWBInSuffix.Text := WBInSuffix;
       chbWBInAutoPrice.Checked := WBInAutoPrice;
       cbWBInAddType.ItemIndex := Ord(WBInDefAction);
       lcbWBInShowModel.ItemIndex := OptWBInShowModel;
       btnWBInRepSortDesc.Checked := optWBInRepSortDesc;
       btnWBOutRepSortDescClick(btnWBInRepSortDesc);
       cbWBInRepSortField.itemIndex := optWBInRepSortField;

       if WBInAutoPrice then begin
         if WBInAutoPriceType = 1 then begin
           rbtWBInPriceType.Checked := True;
           lcbWBInPriceType.KeyValue := WBInPriceType;
         end
         else rbtWBInLastPrice.Checked := True;
       end;

       chbWBOutChecked.Checked := WBOutChecked;
       chbWBOutAutoNum.Checked := WBOutAutoNum;
       edWBOutPrefix.Text := WBOutPrefix;
       edWBOutSuffix.Text := WBOutSuffix;
       cbWBOutAddType.ItemIndex := Ord(WBOutDefAction);
       cbWBOutPriceType.ItemIndex := WBOutPriceType;
       cbWBOutAutoPrice.ItemIndex := WBOutAutoPrice;
       chbWBOutAllowZero.Checked := WBOutAllowZero;
       edWBOutDefAmount.Value := WBOutDefAmount;
       chbWBOutAutoWH.Checked := WBOutAutoWH;
       lcbWBOutShowModel.ItemIndex := OptWBOutShowModel;
       btnWBOutRepSortDesc.Checked := optWBOutRepSortDesc;
       btnWBOutRepSortDescClick(btnWBOutRepSortDesc);
       cbWBOutRepSortField.itemIndex := optWBOutRepSortField;

       edRFrac.Value := PriceRoundFrac;
       edRInt.Value := PriceRoundInt;

       if PriceRoundInt > 0 then rbtRInt.Checked := True;

       chbWBOutDCCheck.Checked := WBOutCheckDC;

       if Torg13PriceType > 0 then begin
         rbtT13PriceType.Checked := True;
         lcbT13PriceTypes.KeyValue := Torg13PriceType;
       end
       else rbtT13PriceIn.Checked := True;

       chbRetOutChecked.Checked := ReturnOutChecked;
       chbRetOutAutoNum.Checked := ReturnOutAutoNum;
       edRetOutPrefix.Text := ReturnOutPrefix;
       edRetOutSuffix.Text := ReturnOutSuffix;

       chbRetInChecked.Checked := ReturnInChecked;
       chbRetInAutoNum.Checked := ReturnInAutoNum;
       edRetInPrefix.Text := ReturnInPrefix;
       edRetInSuffix.Text := ReturnInSuffix;

       chbWBRestAllowZero.Checked := WBRestAllowZero;
       edWBRestDefAmount.Value := WBRestDefAmount;
       chbWBRestChecked.Checked := WBRestChecked;
       chbWBRestAutoNum.Checked := WBRestAutoNum;
       edWBRestPrefix.Text := WBRestPrefix;
       edWBRestSuffix.Text := WBRestSuffix;

       edWriteOffDefAmount.Value := WriteOffDefAmount;
       chbWriteOffChecked.Checked := WriteOffChecked;
       chbWriteOffAutoNum.Checked := WriteOffAutoNum;
       edWriteOffPrefix.Text := WriteOffPrefix;
       edWriteOffSuffix.Text := WriteOffSuffix;

       edAODefAmount.Value := AODefAmount;
       chbAOAutoNum.Checked := AOAutoNum;
       edAOPrefix.Text := AOPrefix;
       edAOSuffix.Text := AOSuffix;
       chbAOSelectNP.Checked := AOSelectNP;

       edTaxWBDefAmount.Value := TaxWBDefAmount;
       chbTaxAutoNum.Checked := TaxAutoNum;
       edTaxPrefix.Text := TaxPrefix;
       edTaxSuffix.Text := TaxSuffix;

       chbWBMoveChecked.Checked := WBMoveChecked;
       chbWBMoveAutoNum.Checked := WBMoveAutoNum;
       edWBMovePrefix.Text := WBMovePrefix;
       edWBMoveSuffix.Text := WBMoveSuffix;
       edWBMoveDefAmount.Value := WBMoveDefAmount;
       lcbWBMoveShowModel.ItemIndex := OptWBMoveShowModel;

       chbPDInChecked.Checked := PDInChecked;
       chbPDInAutoNum.Checked := PDInAutoNum;
       edPDInPrefix.Text := PDInPrefix;
       edPDInSuffix.Text := PDInSuffix;

       chbPDOutChecked.Checked := PDOutChecked;
       chbPDOutAutoNum.Checked := PDOutAutoNum;
       edPDOutPrefix.Text := PDOutPrefix;
       edPDOutSuffix.Text := PDOutSuffix;

       chbPDChargeChecked.Checked := PDChargeChecked;
       chbPDChargeAutoNum.Checked := PDChargeAutoNum;
       edPDChargePrefix.Text := PDChargePrefix;
       edPDChargeSuffix.Text := PDChargeSuffix;

       chbInvChecked.Checked := InvChecked;
       chbInvAutoNum.Checked := InvAutoNum;
       edInvPrefix.Text := InvPrefix;
       edInvSuffix.Text := InvSuffix;

       edOrdersInDefAmount.Value := OrdersInDefAmount;
       chbOrdersInAutoNum.Checked := OrdersInAutoNum;
       edOrdersInPrefix.Text := OrdersInPrefix;
       edOrdersInSuffix.Text := OrdersInSuffix;
       edOrdersOutDefAmount.Value := OrdersOutDefAmount;
       chbOrdersOutAutoNum.Checked := OrdersOutAutoNum;
       edOrdersOutPrefix.Text := OrdersOutPrefix;
       edOrdersOutSuffix.Text := OrdersOutSuffix;
       chbOOSelectNP.Checked := OrdersOutSelectNP;
       chbOISelectNP.Checked := OrdersInSelectNP;

       cbRPType.ItemIndex := Ord(RPType);

       edWBInCurrNum.Value := GetDocNum(dmData.SConnection, dtWBIn, 0);
       edWBOutCurrNum.Value := GetDocNum(dmData.SConnection, dtWBOut, 0);
       edWBMoveCurrNum.Value := GetDocNum(dmData.SConnection, dtWBMove, 0);
       edInvoiceCurrNum.Value := GetDocNum(dmData.SConnection, dtInvoice, 0);
       edAOCurrNum.Value := GetDocNum(dmData.SConnection, dtAO, 0);
       edTaxCurrNum.Value := GetDocNum(dmData.SConnection, dtTaxWB, 0);
       edPDInCurrNum.Value := GetDocNum(dmData.SConnection, dtPDIn, 0);
       edPDOutCurrNum.Value := GetDocNum(dmData.SConnection, dtPDOut, 0);
       edPDChargeCurrNum.Value := GetDocNum(dmData.SConnection, dtPDCharge, 0);
       edWBRestCurrNum.Value := GetDocNum(dmData.SConnection, dtWBRest, 0);
       edWriteOffCurrNum.Value := GetDocNum(dmData.SConnection, dtWriteOff, 0);
       edInvCurrNum.Value := GetDocNum(dmData.SConnection, dtInv, 0);
       edRetOutCurrNum.Value := GetDocNum(dmData.SConnection, dtReturnOut, 0);
       edRetInCurrNum.Value := GetDocNum(dmData.SConnection, dtReturnIn, 0);
       edOrdersInCurrNum.Value := GetDocNum(dmData.SConnection, dtOrderIn, 0);
       edOrdersOutCurrNum.Value := GetDocNum(dmData.SConnection, dtOrderOut, 0);

       chbCheckMoney.Checked := CheckMoney;

       chbBC_Weight.Checked := BC_Enabled;
       edBCFirstDigit.Value := BC_StartDigit;
       edBCCodeFrom.Value := BC_CodeFrom;
       edBCCodeTo.Value := BC_CodeTo;
       edBCCodeIntFrom.Value := BC_Weight_IntFrom;
       edBCCodeIntTo.Value := BC_Weight_IntTo;
       edBCCodeFracFrom.Value := BC_Weight_FracFrom;
       edBCCodeFracTo.Value := BC_Weight_FracTo;

       chbShowAllMats.Checked := WMatShowAll;

       chbMultiCurrency.Checked := OptMultiCurrency;

       ProviderName := 'pParams_GetTriggers';
       Params.Clear;
       Open;

       while not Eof do begin
         if FieldByName('tablename').AsString = 'WAYBILLLIST'
           then chbWB.Checked := FieldByName('i_state').AsInteger = 0
         else if FieldByName('tablename').AsString = 'PAYDOC'
           then chbPayDoc.Checked := FieldByName('i_state').AsInteger = 0
         else if FieldByName('tablename').AsString = 'TAXWB'
           then chbTax.Checked := FieldByName('i_state').AsInteger = 0
         else if FieldByName('tablename').AsString = 'MATERIALS'
           then chbMat.Checked := FieldByName('i_state').AsInteger = 0
         else if FieldByName('tablename').AsString = 'KAGENT'
           then chbKA.Checked := FieldByName('i_state').AsInteger = 0
         else if FieldByName('tablename').AsString = 'MEASURES'
           then chbMeasures.Checked := FieldByName('i_state').AsInteger = 0
         else if FieldByName('tablename').AsString = 'CURRENCY'
           then chbCurrency.Checked := FieldByName('i_state').AsInteger = 0
         else if FieldByName('tablename').AsString = 'BANKS'
           then chbBanks.Checked := FieldByName('i_state').AsInteger = 0
         else if FieldByName('tablename').AsString = 'WAREHOUSE'
           then chbWHouses.Checked := FieldByName('i_state').AsInteger = 0
         else if FieldByName('tablename').AsString = 'ACCOUNTTYPE'
           then chbAccTypes.Checked := FieldByName('i_state').AsInteger = 0
         else if FieldByName('tablename').AsString = 'COUNTRIES'
           then chbCountries.Checked := FieldByName('i_state').AsInteger = 0
         else if FieldByName('tablename').AsString = 'MATGROUP'
           then chbMatGroups.Checked := FieldByName('i_state').AsInteger = 0
         else if FieldByName('tablename').AsString = 'PRICETYPES'
           then chbPriceTypes.Checked := FieldByName('i_state').AsInteger = 0;

         Next;
       end;

       Close;

       chbOperLog.Checked := chbWB.Checked or chbPayDoc.Checked or chbTax.Checked
         or chbMat.Checked or chbKA.Checked or chbCurrency.Checked or chbMeasures.Checked
         or chbWHouses.Checked or chbBanks.Checked or chbAccTypes.Checked
         or chbCountries.Checked or chbMatGroups.Checked or chbPriceTypes.Checked;

     finally
       Free;
       FStream.Free;
       FLogo.Free;
       Screen.Cursor := crDefault;
     end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.SetLang(ALang: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.SetLang') else _udebug := nil;{$ENDIF}

  frmMainForm.ReloadRes;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.btnOkGetDrawParams(Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor; AFont: TFont);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.btnOkGetDrawParams') else _udebug := nil;{$ENDIF}

  if AState in [cxbsHot, cxbsPressed] then begin
    AFont.Style := [fsBold];
    AColor := TcxButton(Sender).Colors.Normal;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbNDSPayerClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbNDSPayerClick') else _udebug := nil;{$ENDIF}

  edEntINN.Visible := chbNDSPayer.Checked;
  lEntINN.Visible := chbNDSPayer.Checked;
  edEntCertNum.Visible := chbNDSPayer.Checked;
  lEntCertNum.Visible := chbNDSPayer.Checked;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.lcbBankPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.lcbBankPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.btnLockClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.btnLockClick') else _udebug := nil;{$ENDIF}

  LockScreen;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.btnLogoClick(Sender: TObject);
 var
   img: TPicture;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.btnLogoClick') else _udebug := nil;{$ENDIF}

  img := TPicture.Create;
  with TOpenDialog.Create(nil) do
    try
      DefaultExt := 'bmp';
      Filter := 'Windows Bitmap (*.bmp)|*.bmp';
      if Execute then begin
        img.LoadFromFile(FileName);
        TempBmp.Assign(imgLogo.Picture.Bitmap);
        imgLogo.Height := img.Height;
        imgLogo.Width := img.Width;
        imgLogo.Picture.Assign(img);
        FModified := True;
        FLogoModified := True;
        FDeleted := True;
      end;

    finally
      img.Free;
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.btnClearClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.btnClearClick') else _udebug := nil;{$ENDIF}

  TempBmp.Assign(imgLogo.Picture.Bitmap);
  imgLogo.Picture.Bitmap.Width := 0;
  imgLogo.Picture.Bitmap.Height := 0;
  FModified := True;
  FLogoModified := True;
  FDeleted := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbOperLogClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbOperLogClick') else _udebug := nil;{$ENDIF}

  chbWB.Enabled := chbOperLog.Checked;
  chbPayDoc.Enabled := chbOperLog.Checked;
  chbTax.Enabled := chbOperLog.Checked;
  chbMat.Enabled := chbOperLog.Checked;
  chbKA.Enabled := chbOperLog.Checked;
  chbMatGroups.Enabled := chbOperLog.Checked;
  chbCurrency.Enabled := chbOperLog.Checked;
  chbBanks.Enabled := chbOperLog.Checked;
  chbMeasures.Enabled := chbOperLog.Checked;
  chbWHouses.Enabled := chbOperLog.Checked;
  chbAccTypes.Enabled := chbOperLog.Checked;
  chbCountries.Enabled := chbOperLog.Checked;
  chbPriceTypes.Enabled := chbOperLog.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.btnUndoClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.btnUndoClick') else _udebug := nil;{$ENDIF}

  if FDeleted then begin
    imgLogo.Height := TempBmp.Height;
    imgLogo.Width := TempBmp.Width;
    imgLogo.Picture.Assign(TempBmp);
    FDeleted := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.FormDestroy') else _udebug := nil;{$ENDIF}


  TempBmp.Free; 

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.btnSendErrMessageClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.btnSendErrMessageClick') else _udebug := nil;{$ENDIF}

  SendMsg;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbWBInAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbWBInAutoNumClick') else _udebug := nil;{$ENDIF}

  lWBInPrefix.Enabled := chbWBInAutoNum.Checked;
  edWBInPrefix.Enabled := chbWBInAutoNum.Checked;
  lWBInSuffix.Enabled := chbWBInAutoNum.Checked;
  edWBInSuffix.Enabled := chbWBInAutoNum.Checked;
  lWBInCurrNum.Enabled := chbWBInAutoNum.Checked;
  edWBInCurrNum.Enabled := chbWBInAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbWBOutAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbWBOutAutoNumClick') else _udebug := nil;{$ENDIF}

  lWBOutPrefix.Enabled := chbWBOutAutoNum.Checked;
  edWBOutPrefix.Enabled := chbWBOutAutoNum.Checked;
  lWBOutSuffix.Enabled := chbWBOutAutoNum.Checked;
  edWBOutSuffix.Enabled := chbWBOutAutoNum.Checked;
  lWBOutCurrNum.Enabled := chbWBOutAutoNum.Checked;
  edWBOutCurrNum.Enabled := chbWBOutAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbWBMoveAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbWBMoveAutoNumClick') else _udebug := nil;{$ENDIF}

  lWBMovePrefix.Enabled := chbWBMoveAutoNum.Checked;
  edWBMovePrefix.Enabled := chbWBMoveAutoNum.Checked;
  lWBMoveSuffix.Enabled := chbWBMoveAutoNum.Checked;
  edWBMoveSuffix.Enabled := chbWBMoveAutoNum.Checked;
  lWBMoveCurrNum.Enabled := chbWBMoveAutoNum.Checked;
  edWBMoveCurrNum.Enabled := chbWBMoveAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbAOAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbAOAutoNumClick') else _udebug := nil;{$ENDIF}

  lAOPrefix.Enabled := chbAOAutoNum.Checked;
  edAOPrefix.Enabled := chbAOAutoNum.Checked;
  lAOSuffix.Enabled := chbAOAutoNum.Checked;
  edAOSuffix.Enabled := chbAOAutoNum.Checked;
  lAOCurrNum.Enabled := chbAOAutoNum.Checked;
  edAOCurrNum.Enabled := chbAOAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbTaxAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbTaxAutoNumClick') else _udebug := nil;{$ENDIF}

  lTaxPrefix.Enabled := chbTaxAutoNum.Checked;
  edTaxPrefix.Enabled := chbTaxAutoNum.Checked;
  lTaxSuffix.Enabled := chbTaxAutoNum.Checked;
  edTaxSuffix.Enabled := chbTaxAutoNum.Checked;
  lTaxCurrNum.Enabled := chbTaxAutoNum.Checked;
  edTaxCurrNum.Enabled := chbTaxAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbPDInAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbPDInAutoNumClick') else _udebug := nil;{$ENDIF}

  lPDInPrefix.Enabled := chbPDInAutoNum.Checked;
  edPDInPrefix.Enabled := chbPDInAutoNum.Checked;
  lPDInSuffix.Enabled := chbPDInAutoNum.Checked;
  edPDInSuffix.Enabled := chbPDInAutoNum.Checked;
  lPDInCurrNum.Enabled := chbPDInAutoNum.Checked;
  edPDInCurrNum.Enabled := chbPDInAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbPDOutAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbPDOutAutoNumClick') else _udebug := nil;{$ENDIF}

  lPDOutPrefix.Enabled := chbPDOutAutoNum.Checked;
  edPDOutPrefix.Enabled := chbPDOutAutoNum.Checked;
  lPDOutSuffix.Enabled := chbPDOutAutoNum.Checked;
  edPDOutSuffix.Enabled := chbPDOutAutoNum.Checked;
  lPDOutCurrNum.Enabled := chbPDOutAutoNum.Checked;
  edPDOutCurrNum.Enabled := chbPDOutAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbWBRestAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbWBRestAutoNumClick') else _udebug := nil;{$ENDIF}

  lWBRestPrefix.Enabled := chbWBRestAutoNum.Checked;
  edWBRestPrefix.Enabled := chbWBRestAutoNum.Checked;
  lWBRestSuffix.Enabled := chbWBRestAutoNum.Checked;
  edWBRestSuffix.Enabled := chbWBRestAutoNum.Checked;
  lWBRestCurrNum.Enabled := chbWBRestAutoNum.Checked;
  edWBRestCurrNum.Enabled := chbWBRestAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.LoadAccounts;
 (*var
   FNode: TTreeNode;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
   *)
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.LoadAccounts') else _udebug := nil;{$ENDIF}

  mdAccount.First;
  while not mdAccount.Eof do begin
    FNode := tvMain.Items.AddChild(FAccountNode, '');
    FNode.Text := mdAccount.FieldByName('num').AsString;
    FNode.Data := pointer(mdAccount.FieldByName('ACCID').AsInteger);
    FNode.ImageIndex := 41;
    FNode.SelectedIndex := 41;
    mdAccount.Edit;
    mdAccount.FieldByName('fnode').AsInteger := Integer(FNode);
    mdAccount.Post;
    mdAccount.Next;
  end;
  FAccountNode.Expand(False);
  AccountModified := False;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmOptions.btnAccLevelUpClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.btnAccLevelUpClick') else _udebug := nil;{$ENDIF}

  tvMain.Selected := tvMain.Selected.Parent;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.lcbBanksPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.lcbBanksPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if cdsBanks.Locate('bankid', lcbBanks.EditValue, [])
    then txtBankName.Caption := cdsBanks.FieldByName('name').AsString
    else txtBankName.Caption := EmptyStr;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.edAccountPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.edAccountPropertiesChange') else _udebug := nil;{$ENDIF}

  if (tvMain.Selected <> nil) and (tvMain.Selected.Parent <> nil) and (tvMain.Selected.Parent = FAccountNode)
  then begin
    gbAccountEdit.Caption := ' ' + edAccount.EditingText + ' ';
    tvMain.Selected.Text := edAccount.EditingText;
  end;

  AccountModified := True;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.grdAccountsDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.grdAccountsDblClick') else _udebug := nil;{$ENDIF}

  tvMain.Selected.Expand(False);
  tvMain.Selected := Pointer(mdAccount.FieldByName('fnode').AsInteger);
  edAccount.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmOptions.CheckAccounts: boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.CheckAccounts') else _udebug := nil;{$ENDIF}

  Result := True;

  {if mdAccount.IsEmpty then Exit;
  
  if AccountModified then
  begin
    if (edAccount.EditingText = EmptyStr) or
       (lcbAccountType.EditText = EmptyStr) or
       (lcbBanks.EditText = EmptyStr) then
    begin
      Result := False;
      Exit;
    end;
  end;
  }

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.aAccNewExecute(Sender: TObject);
 var
   FNode: TTreeNode;
   Maxx: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.aAccNewExecute') else _udebug := nil;{$ENDIF}
                                    
  if (Sender as TComponent).Tag = 0 then begin
    if CheckAccounts then begin
       FNode := tvMain.Items.AddChild(FAccountNode, '');
       Maxx := -GetMaxAbs(mdAccount, 'accid') - 1;
       FNode.Data := pointer(Maxx);
       FNode.ImageIndex := 41;
       FNode.SelectedIndex := 41;

       if not FAccountNode.Expanded then FAccountNode.Expand(False);

       tvMain.Selected := FNode;
       edAccount.SetFocus;

       mdAccount.Append;
       mdAccount.FieldByName('accid').AsInteger := maxx;
       mdAccount.FieldByName('fnode').AsInteger := Integer(FNode);
       mdAccount.Post;
     end
     else ssMessageDlg(rs(Self.Name, 'ErrorAccounts'), ssmtError, [ssmbOk]);
   end
   else grdAccountsDblClick(grdAccounts);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.lcbAccountTypePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.lcbAccountTypePropertiesChange') else _udebug := nil;{$ENDIF}

  AccountModified := True;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.lcbBanksPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.lcbBanksPropertiesChange') else _udebug := nil;{$ENDIF}


  AccountModified := True;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.aAccDelExecute(Sender: TObject);
  var
    FNode: Pointer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.aAccDelExecute') else _udebug := nil;{$ENDIF}

  if mrYes <> ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo])
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FNode := Pointer(mdAccount.FieldByName('fnode').AsInteger);

  if mdAccount.FieldByName('accid').AsInteger < 0
    then mdAccount.Delete
    else begin
      with newDataSet do
      try
        ProviderName := 'pEntAccounts_DelByID';
        FetchParams;
        Params.ParamByName('accid').AsInteger := mdAccount.FieldByName('accid').AsInteger;

        TrStart;
        try
          Execute;
          TrRollback;
          mdAccount.Edit;
          mdAccount.FieldByName('deleted').AsInteger := 1;
          mdAccount.Post;
          mdAccount.Filter := 'deleted<>1';
          mdAccount.Filtered := False;
          mdAccount.Filtered := True;

        except
          TrRollback;
          ssMessageDlg(rs('frmOptions', 'AccInUse'), ssmtError, [ssmbOk]);
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;

      finally
        Free;
      end;
    end;

  tvMain.Selected := TTreeNode(FNode).GetPrev;
  TTreeNode(FNode).Free;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmOptions.CheckAccountsAll: Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.CheckAccountsAll') else _udebug := nil;{$ENDIF}

  Result := True;

  {with mdAccount do begin
    First;
    while not Eof do begin
      if (FieldByName('num').AsString = EmptyStr) or
         (FieldByName('typeid').AsString = EmptyStr) or
         (FieldByName('bankid').AsString = EmptyStr) then
      begin
        Result := False;
        Exit;
      end;
      Next;
    end;
  end;
  }

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.tvMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
    FPos: TPoint;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.tvMainMouseUp') else _udebug := nil;{$ENDIF}

  if Button = mbRight then begin
    PopupNode := tvMain.GetNodeAt(X, Y);

    if (PopupNode <> nil) and (PopupNode.Parent <> nil) and (PopupNode.Parent = FAccountNode)
    then begin
      FPos := tvMain.ClientToScreen(Point(X, Y));
      pmTree.Popup(FPos.X, FPos.Y);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.mnuNewClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.mnuNewClick') else _udebug := nil;{$ENDIF}

  if PopupNode <> nil then aAccNewExecute(aAccNew);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.mnuDelClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.mnuDelClick') else _udebug := nil;{$ENDIF}

  if PopupNode <> nil then begin
    tvMain.Selected := PopupNode;
    aAccDelExecute(aAccDel);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.rbtBackupNoClick(Sender: TObject);
  var
    FEn: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.rbtBackupNoClick') else _udebug := nil;{$ENDIF}
    
  FEn := rbtBackupYes.Checked;
  PostBackupInfo;
  lBackupDir.Enabled := FEn;
  edBackupDir.Enabled := FEn;
  lBackupInterval.Enabled := FEn;
  edBackupInterval.Enabled := FEn;
  cbBackupInterval.Enabled := FEn;
  lBackupTime.Enabled := FEn;
  edBackupTime.Enabled := FEn;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.edBackupDirPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.edBackupDirPropertiesButtonClick') else _udebug := nil;{$ENDIF}

  if dlgDir.Execute then edBackupDir.Text := dlgDir.Directory;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.colDBOptionsGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.colDBOptionsGetText') else _udebug := nil;{$ENDIF}

  if ANode.Values[colEnabled.Index] = 1 then begin
    AText := ANode.Values[colIntervalValue.Index];

    if ANode.Values[colIntervalType.Index] = 'D'
      then AText := AText + ' ' + AnsiLowerCase(rs(Self.Name, 'Days'))
    else if ANode.Values[colIntervalType.Index] = 'W'
      then AText := AText + ' ' + AnsiLowerCase(rs(Self.Name, 'Weeks'))
    else if ANode.Values[colIntervalType.Index] = 'M'
      then AText := AText + ' ' + AnsiLowerCase(rs(Self.Name, 'Months'));

    AText := AText + rs('frmOptions', 'in', 3) + TimeToStr(ANode.Values[colDBOnTime.Index]);
  end
  else AText := rs(Self.Name, 'BackupNotDefine');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.srcDBDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.srcDBDataChange') else _udebug := nil;{$ENDIF}

  if DBCanChange then begin
    DBCanPost := False;

    if cdsDB.FieldByName('enabled').AsInteger = 1
      then rbtBackupYes.Checked := True
      else rbtBackupNo.Checked := True;

    edBackupInterval.Value := cdsDB.FieldByName('intervalvalue').AsInteger;
    edBackupDir.Text := cdsDB.FieldByName('backupdir').AsString;
    edBackupTime.Time := cdsDB.FieldByName('ontime').AsDateTime;

    if cdsDB.FieldByName('intervaltype').AsString = 'D'
      then cbBackupInterval.ItemIndex := 0
    else if cdsDB.FieldByName('intervaltype').AsString = 'W'
      then cbBackupInterval.ItemIndex := 1
    else if cdsDB.FieldByName('intervaltype').AsString = 'M'
      then cbBackupInterval.ItemIndex := 2;

    if cdsDB.FieldByName('updenabled').AsInteger = 1
      then rbtUSYes.Checked := True
      else rbtUSNo.Checked := True;

    edUSInterval.Value := cdsDB.FieldByName('updintervalvalue').AsInteger;
    edUSTime.Time := cdsDB.FieldByName('updtime').AsDateTime;

    if cdsDB.FieldByName('updintervaltype').AsString = 'D'
      then cbUSInterval.ItemIndex := 0 else
    if cdsDB.FieldByName('updintervaltype').AsString = 'W'
      then cbUSInterval.ItemIndex := 1 else
    if cdsDB.FieldByName('updintervaltype').AsString = 'M'
      then cbUSInterval.ItemIndex := 2;

    DBCanPost := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.grdDBsDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.grdDBsDblClick') else _udebug := nil;{$ENDIF}


  tvMain.Selected.Expand(False);
  tvMain.Selected := Pointer(cdsDB.FieldByName('fnode').AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.grdDBsCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.grdDBsCustomDrawCell') else _udebug := nil;{$ENDIF}

  if (ANode.Values[colEnabled.Index] <> 1) and not ASelected
    then AFont.Color := clBtnShadow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.PostBackupInfo;
  var
    FEn: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.PostBackupInfo') else _udebug := nil;{$ENDIF}

  FEn := rbtBackupYes.Checked;

  if DBCanPost then begin
    DBCanChange := False;
    cdsDB.Edit;
    cdsDB.FieldByName('enabled').AsInteger := Integer(FEn);
    cdsDB.FieldByName('ontime').AsDateTime := edBackupTime.Time;
    cdsDB.FieldByName('backupdir').AsString := edBackupDir.Text;

    if FEn then begin
      case cbBackupInterval.ItemIndex of
        0: cdsDB.FieldByName('intervaltype').AsString := 'D';
        1: cdsDB.FieldByName('intervaltype').AsString := 'W';
        2: cdsDB.FieldByName('intervaltype').AsString := 'M';
      end;

      TTreeNode(cdsDB.FieldByName('fnode').AsInteger).SelectedIndex := 96;
      TTreeNode(cdsDB.FieldByName('fnode').AsInteger).ImageIndex := 96;
    end
    else begin
      TTreeNode(cdsDB.FieldByName('fnode').AsInteger).SelectedIndex := 123;
      TTreeNode(cdsDB.FieldByName('fnode').AsInteger).ImageIndex := 123;
    end;

    cdsDB.FieldByName('intervalvalue').AsInteger := StrToInt(edBackupInterval.EditingText);

    cdsDB.FieldByName('ontime').AsDateTime := edBackupTime.Time;
    cdsDB.Post;
    DBCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.edBackupIntervalPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.edBackupIntervalPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  PostBackupInfo;
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.cbBackupIntervalPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.cbBackupIntervalPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  PostBackupInfo;
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.edBackupDirPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.edBackupDirPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  PostBackupInfo;
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.edBackupTimePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.edBackupTimePropertiesChange') else _udebug := nil;{$ENDIF}

  PostBackupInfo;
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.cdsDBAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.cdsDBAfterOpen') else _udebug := nil;{$ENDIF}

  with DataSet do begin
    First;
    while not Eof do begin
      if FieldByName('fintervalvalue').AsInteger > 0 then begin
        Edit;
        FieldByName('enabled').AsInteger := 1;
        FieldByName('intervalvalue').AsInteger := FieldByName('fintervalvalue').AsInteger;

        if FieldByName('fintervalvalue').AsInteger = 0
          then FieldByName('intervalvalue').AsInteger := 1;

        FieldByName('intervaltype').AsString := FieldByName('fintervaltype').AsString;
        FieldByName('backupdir').AsString := FieldByName('fbackupdir').AsString;
        FieldByName('ontime').AsDateTime := FieldByName('fbackuptime').AsDateTime;
        Post;
      end;

      if FieldByName('fupdintervalvalue').AsInteger > 0 then begin
        Edit;
        FieldByName('updenabled').AsInteger := 1;
        FieldByName('updintervalvalue').AsInteger := FieldByName('fupdintervalvalue').AsInteger;

        if FieldByName('fupdintervalvalue').AsInteger = 0
          then FieldByName('updintervalvalue').AsInteger := 1;

        FieldByName('updintervaltype').AsString := FieldByName('fupdintervaltype').AsString;
        FieldByName('updtime').AsDateTime := FieldByName('fupdtime').AsDateTime;
        Post;
      end;

      Next;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.rbtUSNoClick(Sender: TObject);
  var
    FEn: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.rbtUSNoClick') else _udebug := nil;{$ENDIF}

  FEn := rbtUSYes.Checked;
  PostUpdateInfo;
  lUSText.Enabled := FEn;
  edUSInterval.Enabled := FEn;
  cbUSInterval.Enabled := FEn;
  lUSTime.Enabled := FEn;
  edUSTime.Enabled := FEn;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.grdUpdStatDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.grdUpdStatDblClick') else _udebug := nil;{$ENDIF}

  tvMain.Selected.Expand(False);
  tvMain.Selected := Pointer(cdsDB.FieldByName('fupdnode').AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.PostUpdateInfo;
  var
    FEn: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.PostUpdateInfo') else _udebug := nil;{$ENDIF}

  FEn := rbtUSYes.Checked;

  if DBCanPost then begin
    DBCanChange := False;
    cdsDB.Edit;
    cdsDB.FieldByName('updenabled').AsInteger := Integer(FEn);

    if FEn then begin
      case cbUSInterval.ItemIndex of
        0: cdsDB.FieldByName('updintervaltype').AsString := 'D';
        1: cdsDB.FieldByName('updintervaltype').AsString := 'W';
        2: cdsDB.FieldByName('updintervaltype').AsString := 'M';
      end;

      TTreeNode(cdsDB.FieldByName('fupdnode').AsInteger).SelectedIndex := 96;
      TTreeNode(cdsDB.FieldByName('fupdnode').AsInteger).ImageIndex := 96;
    end
    else begin
      TTreeNode(cdsDB.FieldByName('fupdnode').AsInteger).SelectedIndex := 123;
      TTreeNode(cdsDB.FieldByName('fupdnode').AsInteger).ImageIndex := 123;
    end;

    cdsDB.FieldByName('updintervalvalue').AsInteger := StrToInt(edUSInterval.EditingText);
    cdsDB.FieldByName('updtime').AsDateTime := edUSTime.Time;
    cdsDB.Post;
    DBCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.edUSIntervalPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.edUSIntervalPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  PostUpdateInfo;
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.colUSTextGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.colUSTextGetText') else _udebug := nil;{$ENDIF}

  if ANode.Values[colUSEnabled.Index] = 1 then begin
    AText := ANode.Values[colUSIntervalValue.Index];

    if ANode.Values[colUSIntervalType.Index] = 'D'
      then AText := AText + ' ' + AnsiLowerCase(rs(Self.Name, 'Days'))
    else if ANode.Values[colUSIntervalType.Index] = 'W'
      then AText := AText + ' ' + AnsiLowerCase(rs(Self.Name, 'Weeks'))
    else if ANode.Values[colUSIntervalType.Index] = 'M'
      then AText := AText + ' ' + AnsiLowerCase(rs(Self.Name, 'Months'));

    AText := AText + rs('frmOptions', 'in', 3) + TimeToStr(ANode.Values[colUSTime.Index]);
  end
  else AText := rs(Self.Name, 'UpdateStatNotDefine');

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbPDChargeAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbPDChargeAutoNumClick') else _udebug := nil;{$ENDIF}

  lPDChargePrefix.Enabled := chbPDChargeAutoNum.Checked;
  edPDChargePrefix.Enabled := chbPDChargeAutoNum.Checked;
  lPDChargeSuffix.Enabled := chbPDChargeAutoNum.Checked;
  edPDChargeSuffix.Enabled := chbPDChargeAutoNum.Checked;
  lPDChargeCurrNum.Enabled := chbPDChargeAutoNum.Checked;
  edPDChargeCurrNum.Enabled := chbPDChargeAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbWriteOffAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbWriteOffAutoNumClick') else _udebug := nil;{$ENDIF}

  lWriteOffPrefix.Enabled := chbWriteOffAutoNum.Checked;
  edWriteOffPrefix.Enabled := chbWriteOffAutoNum.Checked;
  lWriteOffSuffix.Enabled := chbWriteOffAutoNum.Checked;
  edWriteOffSuffix.Enabled := chbWriteOffAutoNum.Checked;
  lWriteOffCurrNum.Enabled := chbWriteOffAutoNum.Checked;
  edWriteOffCurrNum.Enabled := chbWriteOffAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbInvAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbInvAutoNumClick') else _udebug := nil;{$ENDIF}

  lInvPrefix.Enabled := chbInvAutoNum.Checked;
  edInvPrefix.Enabled := chbInvAutoNum.Checked;
  lInvSuffix.Enabled := chbInvAutoNum.Checked;
  edInvSuffix.Enabled := chbInvAutoNum.Checked;
  lInvCurrNum.Enabled := chbInvAutoNum.Checked;
  edInvCurrNum.Enabled := chbInvAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.aBanksRefExecute(Sender: TObject);
  var
    aid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.aBanksRefExecute') else _udebug := nil;{$ENDIF}

  try
    aid := cdsBanks.fieldbyname('bankid').AsInteger;
  except
    aid := 0;
  end;

  lcbBanks.SetFocus;
  ShowModalRef(Self, rtBank, vtBank, 'TfmBank', Now, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.aAccountRefExecute(Sender: TObject);
 var
  aid: Integer;
  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.aAccountRefExecute') else _udebug := nil;{$ENDIF}


  try aid := cdsAccountType.fieldbyname('typeid').AsInteger; except aid := 0; end;
  lcbAccountType.SetFocus;
  ShowModalRef(Self, rtAccountType, vtAccountType, 'TfmAccountType', Now, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.WMRefresh') else _udebug := nil;{$ENDIF}


  case TRefType(M.LParam) of
    rtBank:
      begin
        DSRefresh(cdsBanks, 'bankid', 0);
        mdAccount.Edit;
        mdAccount.FieldByName('bankid').AsInteger := M.WParam;
        mdAccount.Post;
      end;
    rtAccountType:
      begin
        DSRefresh(cdsAccountType, 'typeid', 0);
        mdAccount.Edit;
        mdAccount.FieldByName('typeid').AsInteger := M.WParam;
        mdAccount.Post;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbRetOutAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbRetOutAutoNumClick') else _udebug := nil;{$ENDIF}


  lRetOutPrefix.Enabled := chbRetOutAutoNum.Checked;
  edRetOutPrefix.Enabled := chbRetOutAutoNum.Checked;
  lRetOutSuffix.Enabled := chbRetOutAutoNum.Checked;
  edRetOutSuffix.Enabled := chbRetOutAutoNum.Checked;
  lRetOutCurrNum.Enabled := chbRetOutAutoNum.Checked;
  edRetOutCurrNum.Enabled := chbRetOutAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbRetInAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbRetInAutoNumClick') else _udebug := nil;{$ENDIF}


  lRetInPrefix.Enabled := chbRetInAutoNum.Checked;
  edRetInPrefix.Enabled := chbRetInAutoNum.Checked;
  lRetInSuffix.Enabled := chbRetInAutoNum.Checked;
  edRetInSuffix.Enabled := chbRetInAutoNum.Checked;
  lRetInCurrNum.Enabled := chbRetInAutoNum.Checked;
  edRetInCurrNum.Enabled := chbRetInAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbWBInAutoPriceClick(Sender: TObject);
 var
  FEn: Boolean;
  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbWBInAutoPriceClick') else _udebug := nil;{$ENDIF}


  FEn := chbWBInAutoPrice.Checked;
  rbtWBInLastPrice.Enabled := FEn;
  rbtWBInPriceType.Enabled := FEn;
  lcbWBInPriceType.Enabled := FEn and rbtWBInPriceType.Checked;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.tsWBInShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.tsWBInShow') else _udebug := nil;{$ENDIF}


  inherited;

  rbtWBInLastPrice.Enabled := not rbtWBInLastPrice.Enabled;
  rbtWBInLastPrice.Enabled := not rbtWBInLastPrice.Enabled;
  rbtWBInPriceType.Enabled := not rbtWBInPriceType.Enabled;
  rbtWBInPriceType.Enabled := not rbtWBInPriceType.Enabled;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.mdAccountFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.mdAccountFilterRecord') else _udebug := nil;{$ENDIF}

  Accept := (DataSet.FieldByName('deleted').AsInteger <> 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF FREE}
  chbDelToBin.Enabled := False;
  chbDelToBin.Checked := False;
  {$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.rbtT13PriceInClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.rbtT13PriceInClick') else _udebug := nil;{$ENDIF}

  lcbT13PriceTypes.Enabled := rbtT13PriceType.Checked;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.aHelpExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.aHelpExecute') else _udebug := nil;{$ENDIF}

  ShowHelpTopic('opt' + pcMain.ActivePage.Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbInvoiceAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbInvoiceAutoNumClick') else _udebug := nil;{$ENDIF}


  lInvoicePrefix.Enabled := chbInvoiceAutoNum.Checked;
  edInvoicePrefix.Enabled := chbInvoiceAutoNum.Checked;
  lInvoiceSuffix.Enabled := chbInvoiceAutoNum.Checked;
  edInvoiceSuffix.Enabled := chbInvoiceAutoNum.Checked;
  lInvoiceCurrNum.Enabled := chbInvoiceAutoNum.Checked;
  edInvoiceCurrNum.Enabled := chbInvoiceAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbHLWMatNeededClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbHLWMatNeededClick') else _udebug := nil;{$ENDIF}

  lHLWMatNeeded.Enabled := chbHLWMatNeeded.Checked;
  edHLWMatNeeded.Enabled := chbHLWMatNeeded.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbBC_WeightClick(Sender: TObject);
  var
    FEn: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbBC_WeightClick') else _udebug := nil;{$ENDIF}

  FEn := chbBC_Weight.Checked;

  lBCFirstDigit.Enabled := FEn;
  edBCFirstDigit.Enabled := FEn;
  lBCCode.Enabled := FEn;
  lBCCodeFrom.Enabled := FEn;
  edBCCodeFrom.Enabled := FEn;
  lBCCodeTo.Enabled := FEn;
  edBCCodeTo.Enabled := FEn;
  lBCWeight.Enabled := FEn;
  lBCCodeInt.Enabled := FEn;
  lBCCodeIntFrom.Enabled := FEn;
  edBCCodeIntFrom.Enabled := FEn;
  lBCCodeIntTo.Enabled := FEn;
  edBCCodeIntTo.Enabled := FEn;
  lBCCodeFrac.Enabled := FEn;
  lBCCodeFracFrom.Enabled := FEn;
  edBCCodeFracFrom.Enabled := FEn;
  lBCCodeFracTo.Enabled := FEn;
  edBCCodeFracTo.Enabled := FEn;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.cbRPTypePropertiesEditValueChanged(Sender: TObject);
  var
    FEn: Boolean;
    e1,e2: Extended;
    i,f: Integer;
    rp: TRoundPricesType;
    s: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.cbRPTypePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  FEn := (cbRPType.ItemIndex <> 0);

  if FEn then begin
    e1 := 1.2345;
    e2 := 12345.6789;
    i := PriceRoundInt; // save
    f := PriceRoundFrac;
    rp := RPType;

    PriceRoundInt := edRInt.EditValue; // for example
    PriceRoundFrac := edRFrac.EditValue;
    RPType := TRoundPricesType(cbRPType.ItemIndex);

    s := crlf + rs('', 'Example') + ': ' + FloatToStr(e1) + ' -> ' + FloatToStr(SalesPriceRound(e1))
         + crlf + rs('', 'Example') + ': ' + FloatToStr(e2) + ' -> ' + FloatToStr(SalesPriceRound(e2));

    PriceRoundInt := i; //restore
    PriceRoundFrac := f;
    RPType := rp;
  end
  else s := '';

  lRDigitsCount.Caption := RS(Self.Name, 'DigitCount') + ':' + s;

  rbtRFrac.Enabled := FEn;
  edRFrac.Enabled := FEn;
  rbtRInt.Enabled := FEn;
  edRInt.Enabled := FEn;
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.edRFracPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.edRFracPropertiesChange') else _udebug := nil;{$ENDIF}

  cbRPTypePropertiesEditValueChanged(cbRPType);
  //edRInt.Enabled := not (edRFrac.Value > 0);
  //lRInt.Enabled := not (edRFrac.Value > 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.edRIntPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.edRIntPropertiesChange') else _udebug := nil;{$ENDIF}

  cbRPTypePropertiesEditValueChanged(cbRPType);
  //edRFrac.Enabled := not (edRInt.Value > 0);
  //lRFrac.Enabled := not (edRInt.Value > 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.edRFracPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.edRFracPropertiesValidate') else _udebug := nil;{$ENDIF}

  with Sender as TcxSpinEdit do begin
    if VarToInt(DisplayValue) < Properties.MinValue
      then DisplayValue := Trunc(Properties.MinValue)
    else if VarToInt(DisplayValue) > Properties.MaxValue
      then DisplayValue := Trunc(Properties.MaxValue);
  end;
  Error := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.rbtRFracClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.rbtRFracClick') else _udebug := nil;{$ENDIF}

  DataModified(Sender);
  edRFrac.Enabled := rbtRFrac.Checked;
  edRInt.Enabled := rbtRInt.Checked;

  if rbtRFrac.Checked
    then edRInt.Value := 0
    else edRFrac.Value := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbAOSelectNPClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbAOSelectNPClick') else _udebug := nil;{$ENDIF}

  edAOSelectNP.Enabled := chbAOSelectNP.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbOrdersOutAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbOrdersOutAutoNumClick') else _udebug := nil;{$ENDIF}

  lOrdersOutPrefix.Enabled := chbOrdersOutAutoNum.Checked;
  edOrdersOutPrefix.Enabled := chbOrdersOutAutoNum.Checked;
  lOrdersOutSuffix.Enabled := chbOrdersOutAutoNum.Checked;
  edOrdersOutSuffix.Enabled := chbOrdersOutAutoNum.Checked;
  lOrdersOutCurrNum.Enabled := chbOrdersOutAutoNum.Checked;
  edOrdersOutCurrNum.Enabled := chbOrdersOutAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbOrdersInAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbOrdersInAutoNumClick') else _udebug := nil;{$ENDIF}

  lOrdersInPrefix.Enabled := chbOrdersInAutoNum.Checked;
  edOrdersInPrefix.Enabled := chbOrdersInAutoNum.Checked;
  lOrdersInSuffix.Enabled := chbOrdersInAutoNum.Checked;
  edOrdersInSuffix.Enabled := chbOrdersInAutoNum.Checked;
  lOrdersInCurrNum.Enabled := chbOrdersInAutoNum.Checked;
  edOrdersInCurrNum.Enabled := chbOrdersInAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.ReloadGroup(ANode: TTreeNode);
  var
    i: integer;
    FNode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.ReloadGroup') else _udebug := nil;{$ENDIF}

  tlGrp.ClearNodes;

  for i := 0 to ANode.Count - 1 do begin
    FNode := tlGrp.Add;
    FNode.Values[0] := 1;
    FNode.Values[1] := ANode.Item[i].Text;
    FNode.Values[2] := 1;
    FNode.Data := ANode.Item[i];
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbOISelectNPClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbOISelectNPClick') else _udebug := nil;{$ENDIF}

  edOISelectNP.Enabled := chbOISelectNP.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbOOSelectNPClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.chbOOSelectNPClick') else _udebug := nil;{$ENDIF}

  edOOSelectNP.Enabled := chbOOSelectNP.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.tlGrpMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  var
    FCol: TdxTreeListColumn;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.tlGrpMouseMove') else _udebug := nil;{$ENDIF}

  FCol := tlGrp.GetColumnAt(X, Y);

  if FCol = colJump
    then tlGrp.Cursor := crHandPoint
    else tlGrp.Cursor := crDefault;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.tlGrpClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.tlGrpClick') else _udebug := nil;{$ENDIF}

  if tlGrp.Cursor = crHandPoint then begin
    if not tvMain.Selected.Expanded then tvMain.Selected.Expand(False);

    tvMain.Selected := TTreeNode(tlGrp.FocusedNode.Data);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.cbWBOutAutoPricePropertiesEditValueChanged(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
(*  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.cbWBOutAutoPricePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  {$IFDEF FREE}
  if cbWBOutAutoPrice.ItemIndex = 2 then begin
    ssMessageDlg(rs('frmOptions', 'PricingMethodNA'), ssmtError, [ssmbOK]);
    cbWBOutAutoPrice.ItemIndex := 0;
  end;
  {$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
*)
end;

//==============================================================================================
procedure TfrmOptions.btnWBOutRepSortDescClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOptions.btnWBOutRepSortDescClick') else _udebug := nil;{$ENDIF}

  if TssSpeedButton(Sender).Checked
    then TssSpeedButton(Sender).Caption := rs(Self.Name, 'btnWBRepSortDescZA')
    else TssSpeedButton(Sender).Caption := rs(Self.Name, 'btnWBRepSortDescAZ');

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOptions.chbAccRulesPropertiesChange(Sender: TObject);
begin
  inherited;
  cbAccRules.Enabled := not chbAccRules.Checked;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Options', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
