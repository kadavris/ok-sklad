{$I ok_sklad.inc}
unit EditKAgent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls,
  StdCtrls, ActnList, DB, Buttons, DBClient, Menus, Grids, DBGrids, ImgList, TB2Item, xButton, ComCtrls,

  dxCntner6, dxEditor6, dxExEdtr6, dxTL6, dxDBCtrl6, dxDBGrid6, dxDBTLCl6, dxGrClms6,

  cxMemo, cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons,
  cxPC, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox,
  cxCheckComboBox, cxGraphics, cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxCheckListBox,
  cxDBEdit, cxListView, cxCalendar, cxRadioGroup, cxCalc, cxSpinEdit,

  ssBaseTypes, ssFormStorage, ssBaseDlg, ssDBComboBox, ssClientDataSet, ssMemDS, ssGroupBox,
  ssImagePanel, ssBaseConst, ssSpeedButton, ssGradientPanel, ssBevel, ssDBLookupCombo, ssLabel,
  ssCalcEdit, ssPopupTreeEdit, ssPanel, ssCheckBox;

type
  TfrmEditKAgent = class(TBaseDlg)
    aBankRef: TAction;
    ActionListAccount: TActionList;
    ActionListPerson: TActionList;
    aDel: TAction;
    aDelAccount: TAction;
    aDelPerson: TAction;
    aDiscAdd: TAction;
    aDiscDel: TAction;
    aDiscProps: TAction;
    aMatRef: TAction;
    aNew: TAction;
    aNewAccount: TAction;
    aNewPerson: TAction;
    aPropAccount: TAction;
    aPropsPerson: TAction;
    aRefreshAccount: TAction;
    aRefreshPerson: TAction;
    btnAccDel: TssSpeedButton;
    btnAccLevelUp: TssSpeedButton;
    btnAccNew: TssSpeedButton;
    btnAccountRef: TssSpeedButton;
    btnAccProps: TssSpeedButton;
    btnAddPerson: TssSpeedButton;
    btnAddUser: TssSpeedButton;
    btnBallance: TssSpeedButton;
    btnBankRef: TssSpeedButton;
    btnCopyAddr: TssSpeedButton;
    btnDelDisc: TssSpeedButton;
    btnDelPerson: TssSpeedButton;
    btnDiscAdd: TssSpeedButton;
    btnDiscDel: TssSpeedButton;
    btnDiscLevelUp: TssSpeedButton;
    btnDiscProps: TssSpeedButton;
    btnEMail: TssSpeedButton;
    btnEMainPerson: TssSpeedButton;
    btnFind: TssSpeedButton;
    btnMatRef: TssSpeedButton;
    btnNewDisc: TssSpeedButton;
    btnPersonLevelUp: TssSpeedButton;
    btnPropsDisc: TssSpeedButton;
    btnPropsPerson: TssSpeedButton;
    btnWWW: TssSpeedButton;
    bvlAccountSep: TssBevel;
    bvlDiscSep: TssBevel;
    bvlPersonSep: TssBevel;
    cbDocName: TcxComboBox;
    cbFindField: TcxComboBox;
    cbJob: TcxComboBox;
    cbKAKind: TcxComboBox;
    cbKType: TcxComboBox;
    cbPost: TcxDBComboBox;
    cbType: TcxComboBox;
    cdsAccountType: TssClientDataSet;
    cdsBanks: TssClientDataSet;
    cdsPriceTypes: TssClientDataSet;
    cdsUsers: TssClientDataSet;
    cdsUsersfname: TStringField;
    cdsUsersFULLNAME: TStringField;
    cdsUsersNAME: TStringField;
    cdsUsersPASS: TStringField;
    cdsUsersSYSNAME: TStringField;
    cdsUsersUSERID: TIntegerField;
    chbAOAutoNum: TcxCheckBox;
    chbDiscAll: TcxCheckBox;
    chbDiscCustom: TcxCheckBox;
    chbInvAutoNum: TcxCheckBox;
    chbNDSPayer: TcxCheckBox;
    chbOrdAutoNum: TcxCheckBox;
    chbStartSaldo: TcxCheckBox;
    chbUseDiscount: TcxCheckBox;
    chbWBOutAutoNum: TcxCheckBox;
    colAccMFO: TdxDBGridColumn;
    colAccNum: TdxDBGridColumn;
    colAccType: TdxDBGridColumn;
    colArtikul: TdxDBGridColumn;
    colDiscID: TdxDBGridColumn;
    colDiscName: TdxDBGridColumn;
    colDiscOnValue: TdxDBGridColumn;
    colDiscType: TdxDBGridImageColumn;
    colJobType: TdxDBGridColumn;
    colName: TdxDBGridColumn;
    colPost: TdxDBGridColumn;
    cxTreeListColumn1: TcxTreeListColumn;
    dsAccount: TDataSource;
    dsAccountType: TDataSource;
    dsBanks: TDataSource;
    dsKontakt: TDataSource;
    dsTypeRel: TDataSource;
    edAccount: TcxDBTextEdit;
    edAddress: TcxMemo;
    edAOCurrNum: TcxSpinEdit;
    edAOPrefix: TcxTextEdit;
    edAOSuffix: TcxTextEdit;
    edBirthDate: TcxDateEdit;
    edCertNum: TcxTextEdit;
    edCity: TcxTextEdit;
    edCountry: TcxTextEdit;
    edDiscAll: TssCalcEdit;
    edDistrict: TcxTextEdit;
    edDocDate: TcxDateEdit;
    edDocNum: TcxTextEdit;
    edDocSeries: TcxTextEdit;
    edEmail: TcxTextEdit;
    edEmailPerson: TcxDBTextEdit;
    edFAddr: TcxMemo;
    edFax: TcxTextEdit;
    edFCity: TcxTextEdit;
    edFCountry: TcxTextEdit;
    edFDistrict: TcxTextEdit;
    edFind: TcxTextEdit;
    edFIndex: TcxTextEdit;
    edFIO: TcxTextEdit;
    edFullName: TcxMemo;
    edIndex: TcxTextEdit;
    edINN: TcxTextEdit;
    edInvCurrNum: TcxSpinEdit;
    edInvPrefix: TcxTextEdit;
    edInvSuffix: TcxTextEdit;
    edKPP: TcxTextEdit;
    edMat: TcxTextEdit;
    edMatDiscPercent: TssCalcEdit;
    edName: TcxTextEdit;
    edNamePerson: TcxDBTextEdit;
    edNotes: TcxMemo;
    edOKPO: TcxTextEdit;
    edOrdCurrNum: TcxSpinEdit;
    edOrderNum: TcxDBTextEdit;
    edOrdPrefix: TcxTextEdit;
    edOrdSuffix: TcxTextEdit;
    edPhone: TcxTextEdit;
    edPhonePerson: TcxDBTextEdit;
    edStartSaldo: TssCalcEdit;
    edStartSaldoDate: TcxDateEdit;
    edWBOutCurrNum: TcxSpinEdit;
    edWBOutPrefix: TcxTextEdit;
    edWBOutSuffix: TcxTextEdit;
    edWWW: TcxTextEdit;
    gbAccountEdit: TssGroupBox;
    gbAccounts: TssGroupBox;
    gbAddInfo: TssGroupBox;
    gbAddr: TssGroupBox;
    gbContact: TssGroupBox;
    gbDiscount: TssGroupBox;
    gbDiscounts: TssGroupBox;
    gbDoc: TssGroupBox;
    gbFactAddr: TssGroupBox;
    gbMainInfo: TssGroupBox;
    gbNotes: TssGroupBox;
    gbPersonEdit: TssGroupBox;
    gbPersons: TssGroupBox;
    gbStartSaldo: TssGroupBox;
    grdAccounts: TdxDBGrid;
    grdDisc: TdxDBGrid;
    grdPersons: TdxDBGrid;
    lAccOrderNum: TLabel;
    lAccount: TLabel;
    lAddress: TLabel;
    lAOCurrNum: TssLabel;
    lAOPrefix: TssLabel;
    lAOSuffix: TssLabel;
    lBank: TLabel;
    lBankName: TLabel;
    lBirthDate: TLabel;
    lcbAccountType: TcxDBLookupComboBox;
    lcbBank: TcxDBLookupComboBox;
    lcbPriceType: TssDBLookupCombo;
    lcbUser: TssDBLookupCombo;
    lCertNum: TssLabel;
    lCity: TLabel;
    lCountry: TLabel;
    lDiscAllPercent: TssLabel;
    lDistrict: TLabel;
    lDocDate: TLabel;
    lDocName: TLabel;
    lDocNum: TLabel;
    lDocSeries: TLabel;
    lDocWhoProduce: TLabel;
    lEmail: TLabel;
    lFAddr: TLabel;
    lFax: TLabel;
    lFCity: TLabel;
    lFCountry: TLabel;
    lFDistrict: TLabel;
    lFindBy: TssLabel;
    lFIndex: TLabel;
    lFIO: TLabel;
    lFullName: TLabel;
    lIndex: TLabel;
    lINN: TssLabel;
    lInvCurrNum: TssLabel;
    lInvPrefix: TssLabel;
    lInvSuffix: TssLabel;
    lJob: TLabel;
    lKAKind: TLabel;
    lKPP: TLabel;
    lKType: TLabel;
    lMat: TssLabel;
    lMatDisc: TssLabel;
    lMatDiscPercent: TssLabel;
    lMatType: TssLabel;
    lName: TLabel;
    lNotes: TLabel;
    lOKPO: TLabel;
    lOrdCurrNum: TssLabel;
    lOrdPrefix: TssLabel;
    lOrdSuffix: TssLabel;
    lPersonEmail: TLabel;
    lPersonFIO: TLabel;
    lPersonPhone: TLabel;
    lPersonPost: TLabel;
    lPhone: TLabel;
    lPriceType: TLabel;
    lStartSaldo: TssLabel;
    lStartSaldoDate: TssLabel;
    lType: TLabel;
    lUser: TLabel;
    lWBOutCurrNum: TssLabel;
    lWBOutPrefix: TssLabel;
    lWBOutSuffix: TssLabel;
    lWWW: TLabel;
    mdAccount: TssMemoryData;
    mdAccountaccid: TIntegerField;
    mdAccountaccnum: TStringField;
    mdAccountbankid: TIntegerField;
    mdAccountbankname2: TStringField;
    mdAccountDef: TIntegerField;
    mdAccountdeleted: TIntegerField;
    mdAccountfnode: TIntegerField;
    mdAccountkaid: TIntegerField;
    mdAccountmfo: TStringField;
    mdAccounttypeid: TIntegerField;
    mdAccounttypename: TStringField;
    mdDisc: TssMemoryData;
    mdDiscartikul: TStringField;
    mdDiscfnode: TIntegerField;
    mdDiscid: TIntegerField;
    mdDiscmtype: TIntegerField;
    mdDiscname: TStringField;
    mdDisconvalue: TFloatField;
    mdKontakt: TssMemoryData;
    mdKontaktemail: TStringField;
    mdKontaktfnode: TIntegerField;
    mdKontaktjobtype: TIntegerField;
    mdKontaktkaid: TIntegerField;
    mdKontaktname: TStringField;
    mdKontaktnotes: TStringField;
    mdKontaktpersonid: TIntegerField;
    mdKontaktphone: TStringField;
    mdKontaktpost: TStringField;
    mdTypeRel: TssMemoryData;
    memDocWhoProduce: TcxMemo;
    memNotes: TcxDBMemo;
    mnuDiscAdd: TTBItem;
    PageAccounts: TcxTabSheet;
    PageContact: TcxTabSheet;
    PageEditAccount: TcxTabSheet;
    PageEditPerson: TcxTabSheet;
    PageMain: TcxTabSheet;
    PageNotes: TcxTabSheet;
    PagePersons: TcxTabSheet;
    panAccButtons: TPanel;
    panAutoNum: TPanel;
    panDiscBar: TPanel;
    panDiscButtons: TPanel;
    panDiscFooter: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    panPersonButtons: TPanel;
    pcEditKAgent: TcxPageControl;
    pcName: TPageControl;
    pmAccounts: TTBPopupMenu;
    pmDisc: TTBPopupMenu;
    pmTree: TTBPopupMenu;
    rbtBuh: TcxRadioButton;
    rbtDirector: TcxRadioButton;
    rbtOther: TcxRadioButton;
    rbtPBuh: TcxRadioButton;
    rbtPDir: TcxRadioButton;
    rbtPOther: TcxRadioButton;
    rbtSSCredit: TcxRadioButton;
    rbtSSDebt: TcxRadioButton;
    sbAddToFull: TssSpeedButton;
    srcDisc: TDataSource;
    srcPriceTypes: TDataSource;
    srcUsers: TDataSource;
    ssBevel1: TssBevel;
    ssBevel5: TssBevel;
    ssBevel6: TssBevel;
    ssBevel7: TssBevel;
    ssSpeedButton1: TssSpeedButton;
    ssSpeedButton2: TssSpeedButton;
    ssSpeedButton3: TssSpeedButton;
    ssSpeedButton4: TssSpeedButton;
    ssSpeedButton5: TssSpeedButton;
    ssSpeedButton6: TssSpeedButton;
    stStartSaldoCurr: TssBevel;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    tsAddInfo: TcxTabSheet;
    tsDiscount: TcxTabSheet;
    tsDiscounts: TcxTabSheet;
    tsDoc: TcxTabSheet;
    tsEnt: TTabSheet;
    tsPerson: TTabSheet;
    tvMain: TcxTreeList;
    txtBankName: TssBevel;
    txtLang: TssBevel;

    function AddAgentAccount(KAID:integer):boolean;
    function AddPersons(KAID:integer):boolean;
    function DelAgentAccount(ID:integer):boolean; {Oaaeaiea anao AgentAccount aey oaeouaai KA *************}
    function DelAgentPersons(ID:integer):boolean; {Oaaeaiea anao AgentPrsons aey oaeouaai KA *************}
    function GetAccount(KAID:integer):boolean;{ Caienu a mdAccount anao AgentAccount aey oaeouaai KAgent}
    function GetPersons(KAID:integer):boolean;    {Cai?in a cdsAgentPersons anao AgentPersons aey oaeouaai KAgent }
    function NextIdAccount:integer;{ Ooieoey iieo?aiey neaao?uaai ID aey AgentAccount ***}
    function NextIdPersons:integer;{ Ooieoey iieo?aiey neaao?uaai ID aey AgentPersons ***}
    procedure aBankRefExecute(Sender: TObject);
    procedure ActionListAccountUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure ActionListPersonUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aDelAccountExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aDelPersonExecute(Sender: TObject);
    procedure aDiscAddExecute(Sender: TObject);
    procedure aDiscDelExecute(Sender: TObject);
    procedure aMatRefExecute(Sender: TObject);
    procedure aNewAccountExecute(Sender: TObject);
    procedure aNewExecute(Sender: TObject);
    procedure aPropsPersonExecute(Sender: TObject);
    procedure btnAccountRefMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnAccountRefMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnAddUserClick(Sender: TObject);
    procedure btnBallanceClick(Sender: TObject);
    procedure btnCopyAddrClick(Sender: TObject);
    procedure btnDiscLevelUpClick(Sender: TObject);
    procedure btnEMailClick(Sender: TObject);
    procedure btnEMailPersonClick(Sender: TObject);
    procedure btnEMainPersonClick(Sender: TObject);
    procedure btnWWWClick(Sender: TObject);
    procedure cbKAKindKeyPress(Sender: TObject; var Key: Char);
    procedure cbKAKindPropertiesChange(Sender: TObject);
    procedure cbKAKindPropertiesEditValueChanged(Sender: TObject);
    procedure cbKTypePropertiesChange(Sender: TObject);
    procedure cbKTypePropertiesEditValueChanged(Sender: TObject);
    procedure cbPostPropertiesChange(Sender: TObject);
    procedure cbTypeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbTypePropertiesEditValueChanged(Sender: TObject);
    procedure cdsUsersCalcFields(DataSet: TDataSet);
    procedure chbAOAutoNumClick(Sender: TObject);
    procedure chbDiscAllClick(Sender: TObject);
    procedure chbDiscCustomClick(Sender: TObject);
    procedure chbInvAutoNumClick(Sender: TObject);
    procedure chbNDSPayerClick(Sender: TObject);
    procedure chbOrdAutoNumClick(Sender: TObject);
    procedure chbStartSaldoClick(Sender: TObject);
    procedure chbUseDiscountClick(Sender: TObject);
    procedure chbWBOutAutoNumClick(Sender: TObject);
    procedure chcbKAgentTypePropertiesChange(Sender: TObject);
    procedure colDiscOnValueGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDiscTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPostGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure DataModified(Sender: TObject);
    procedure dbgKAgentAccountDblClick(Sender: TObject);
    procedure dsKontaktDataChange(Sender: TObject; Field: TField);
    procedure edAccountPropertiesChange(Sender: TObject);
    procedure edCertNumKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCertNumKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCountryKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edEmailPersonPropertiesChange(Sender: TObject);
    procedure edFindKeyPress(Sender: TObject; var Key: Char);
    procedure edFindPropertiesChange(Sender: TObject);
    procedure edFIOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edMatDiscPercentKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edMatDiscPercentPropertiesChange(Sender: TObject);
    procedure edNamePersonPropertiesChange(Sender: TObject);
    procedure edNamePropertiesChange(Sender: TObject);
    procedure edNotesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edOKPOPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure gbAccountEditMouseEnter(Sender: TObject);
    procedure gbAccountEditMouseLeave(Sender: TObject);
    procedure gbDiscountMouseEnter(Sender: TObject);
    procedure gbDiscountMouseLeave(Sender: TObject);
    procedure gbPersonEditMouseEnter(Sender: TObject);
    procedure gbPersonEditMouseLeave(Sender: TObject);
    procedure grdAccountsDblClick(Sender: TObject);
    procedure grdAccountsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdDiscCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdDiscCustomDrawColumnHeader(Sender: TObject; AColumn: TdxTreeListColumn; ACanvas: TCanvas; ARect: TRect; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ASorted: TdxTreeListColumnSort; var ADone: Boolean);
    procedure grdDiscDblClick(Sender: TObject);
    procedure grdDiscKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdPersonsDblClick(Sender: TObject);
    procedure grdPersonsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lcbAccountTypeEnter(Sender: TObject);
    procedure lcbAccountTypePropertiesChange(Sender: TObject);
    procedure lcbBankEnter(Sender: TObject);
    procedure lcbBankExit(Sender: TObject);
    procedure lcbBankPropertiesChange(Sender: TObject);
    procedure lcbBankPropertiesEditValueChanged(Sender: TObject);
    procedure mdAccountAfterDelete(DataSet: TDataSet);
    procedure mdAccountAfterPost(DataSet: TDataSet);
    procedure mdAccountFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure mdKontaktAfterDelete(DataSet: TDataSet);
    procedure mdKontaktAfterPost(DataSet: TDataSet);
    procedure rbtBuhClick(Sender: TObject);
    procedure rbtPDirClick(Sender: TObject);
    procedure sbAddAccountTypeClick(Sender: TObject);
    procedure sbAddBankClick(Sender: TObject);
    procedure sbAddToFullClick(Sender: TObject);
    procedure sbEMailClick(Sender: TObject);
    procedure sbWWWClick(Sender: TObject);
    procedure srcDiscDataChange(Sender: TObject; Field: TField);
    procedure tvMainCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure tvMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tvMainSelectionChanged(Sender: TObject);

  private
    FPersonsItem: TcxTreeListNode;
    FAccountItem: TcxTreeListNode;
    FDiscItem: TcxTreeListNode;
    PersonsModified:boolean;
    AccountModified:boolean;
    DefaultModified:boolean;
    TypeModified:boolean;
    FCurrRef: TControl;
    DiscCanPost, DiscCanChange: Boolean;
    TmpGrpName, TmpMatName, TmpMatArt: string;
    TmpMatID, TmpGrpID: Integer;
    FindStr: string;
    FindIndex: Integer;
    CCanPost, CCanChange: Boolean;
    FDef: Boolean;
    
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    function CheckContacts: boolean;
    function CheckAccounts: boolean;
    function CheckDisc: Boolean;
    function CheckDiscounts: Boolean;
    procedure ResetDoc(ADelete: boolean);
    procedure GetDocName;
    procedure GetPost;
    function MatInfo(AID: Integer; var AArtikul: string): string;
    procedure DoFind;
    procedure SetDiscImages;
    procedure GetJobs;

  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
    procedure SetSubID(const Value: integer); override;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;

  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
    procedure DoCustom(AParam: Integer); override;
  end;

var
  frmEditKAgent: TfrmEditKAgent;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ClientData, prFun, EditAccountType, UsersEdit,
  EditBank, ssFun, ShellAPI, prTypes, ssStrUtil, xLngDefs,
  ssCallbackConst, ssRegUtils, fMessageDlg, ssBaseIntfDlg, KATurnover, udebug, 
  EditServices;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmEditKAgent.WMRefresh(var M: TMessage);
  var
    strTmp, strMat: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.WMRefresh') else _udebug := nil;{$ENDIF}

    case TRefType(M.LParam) of
      rtBank:
        begin
          DSRefresh(cdsBanks, 'BankID', M.WParam);
          mdAccount.Edit;
          mdAccount.Fields.FieldByName('bankid').AsInteger := M.WParam;
          mdAccount.Post;
        end;

      rtAccountType:
        begin
          DSRefresh(cdsAccountType, 'typeid', M.WParam);
          mdAccount.Edit;
          mdAccount.Fields.FieldByName('typeid').AsInteger := M.WParam;
          mdAccount.Post;
        end;

      rtMat:
        begin
          if DiscCanPost then
            try
              DiscCanChange := False;

              if mdDisc.Locate('id', M.WParam, []) then begin
                ssMessageDlg(rs(ParentNameEx, 'MatDiscError'), ssmtError, [ssmbOk]);
                {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
                Exit;
              end;

              strMat := MatInfo(M.WParam, strTmp);
              edMat.Text := strMat;
              tvMain.FocusedNode.Values[0] := '(' + edMatDiscPercent.EditText + '%) ' + strMat;
              gbDiscount.Caption := ' ' + tvMain.FocusedNode.Values[0] + ' ';
              tvMain.FocusedNode.Data := Pointer(M.WParam);
              mdDisc.Edit;
              mdDisc.FieldByName('id').AsInteger := M.WParam;
              mdDisc.FieldByName('name').AsString := strMat;
              mdDisc.FieldByName('artikul').AsString := strTmp;
              mdDisc.Post;

            finally
              DiscCanChange := True;
            end;
        end;

      rtMatGroup:
        begin
          if DiscCanPost then
            try
              DiscCanChange := False;

              if mdDisc.Locate('id', -M.WParam, []) then begin
                ssMessageDlg(rs(ParentNameEx, 'MatGrpDiscError'), ssmtError, [ssmbOk]);
                {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
                Exit;
              end;

              strMat := MatGrpName(dmData.SConnection, M.WParam);
              edMat.Text := strMat;
              tvMain.FocusedNode.Values[0] := '(' + edMatDiscPercent.EditText + '%) ' + strMat;
              gbDiscount.Caption := ' ' + tvMain.FocusedNode.Values[0] + ' ';
              tvMain.FocusedNode.Data := Pointer(-M.WParam);
              mdDisc.Edit;
              mdDisc.FieldByName('id').AsInteger := -M.WParam;
              mdDisc.FieldByName('name').AsString := strMat;
              mdDisc.FieldByName('artikul').AsString := strMat;
              mdDisc.Post;

            finally
              DiscCanChange := True;
            end;
        end;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  CCanPost := True;
  CCanChange := True;
  setFontStyle(grdAccounts.Font, True);
  Screen.Cursor := crSQLWait;

  {case CountryRules.AR of  // those codes are now preferable to be visible for all rule types
    accRul_US:
      begin
        lKPP.Visible := False;
        edKPP.Visible := False;
        lOKPO.Visible := False;
        edOKPO.Visible := False;
        lINN.Visible := False;
        edINN.Visible := False;
        lCertNum.Visible := False;
        edCertNum.Visible := False;
      end;
  end;
  }

  FormStorage.IniFileName := PrRegKey;
  FormStorage.IniSection := Self.Name;
  FormStorage.Active := True;

  btnBankRef.ImageIndex := 19;
  btnAccountRef.ImageIndex := 23;

  cdsBanks.Open;
  cdsPriceTypes.Open;
  lcbPriceType.KeyValue := 0;
  lcbPriceType.Clear;

  cdsUsers.Open;
  lcbUser.KeyValue := -1;
  lcbUser.Clear;
  mdDisc.Open;
  mdDisc.EmptyTable;
  GetDocName;
  pcEditKAgent.ActivePageIndex := 0;
  ActiveControl := cbKType;
  DiscCanPost := True;

  txtLang.Caption := keyboardIndicator;

  GetJobs;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


{*** Функция получения следующего ID для AgentAccount ***}
//==============================================================================================
function TfrmEditKAgent.NextIdAccount: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.NextIdAccount') else _udebug := nil;{$ENDIF}

  with newDataSet do try
    ProviderName := 'pAgentAccount_Max';
    Open;
    Result := Fields[0].AsInteger + 1;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{******** Запись в mdAccount всех AgentAccount для текущего KAgent ***}
//==============================================================================================
function TfrmEditKAgent.GetAccount(KAID:integer):boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.GetAccount') else _udebug := nil;{$ENDIF}

  try
    with newDataSet do try
      ProviderName := 'pAgentAccount_Get';
      FetchParams;
      Params.ParamByName('KAID').AsInteger := KAID;
      Open;
      mdAccount.Close;
      mdAccount.LoadFromDataSet(Fields[0].DataSet, 0, lmAppend);
      Result := true;

    finally
      Free;
    end;

  Except
    Result := false;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{******** Запись в mdKontakt всех AgentPersons для текущего KAgent ***}
//==============================================================================================
function TfrmEditKAgent.GetPersons(KAID:integer):boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.GetPersons') else _udebug := nil;{$ENDIF}

  Try
    with newDataSet do try
      ProviderName := 'pAgentPersons_Get';
      FetchParams;
      Params.ParamByName('KAID').AsInteger := KAID;
      Open;

      mdKontakt.Close;
      mdKontakt.Open;
      mdKontakt.LoadFromDataSet(Fields[0].DataSet, 0, lmAppend);
      mdKontakt.Open;
      Result := true;

    finally
      Free;
    end;

  Except
    Result := false;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


{*** Функция получения следующего ID для AgentPersons ***}
//==============================================================================================
function TfrmEditKAgent.NextIdPersons:integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.NextIdPersons') else _udebug := nil;{$ENDIF}

  with newDataSet do try
    ProviderName := 'pAgentPersons_Max';
    Open;
    Result := Fields[0].AsInteger+1;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//********* Удаление всех AgentPrsons для текущего KA *************
//==============================================================================================
function TfrmEditKAgent.DelAgentPersons(ID:integer):boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.DelAgentPersons') else _udebug := nil;{$ENDIF}

  try
    with newDataSet do try
      ProviderName := 'pAgentPersons_Del';
      FetchParams;
      Params.ParamByName('KAID').AsInteger := ID;
      Execute;
      Result := True;

    Finally
      Free;
    end;

  except
    Result := false;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{********* Удаление всех AgentAccountдлякущего KA *************}
//==============================================================================================
function TfrmEditKAgent.DelAgentAccount(ID:integer):boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.DelAgentAccount') else _udebug := nil;{$ENDIF}

  try
    with newDataSet do try
      ProviderName := 'pAgentAccount_Del';
      FetchParams;
      Params.ParamByName('KAID').AsInteger := ID;
      Execute;
      Result := True;

    Finally
      Free;
    end;

  except
    Result := false;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


{******* Функция записи в AgentPersons из mdKontakt *****************}
//==============================================================================================
function TfrmEditKAgent.AddPersons(KAID:integer):boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.AddPersons') else _udebug := nil;{$ENDIF}

  try
    TrStart;

    with newDataSet do try
      mdKontakt.First;

      while not mdKontakt.Eof do begin
        ProviderName := 'pAgentPersons_Ins';
        FetchParams;
        Params.ParamByName('PersonId').AsInteger := NextIdPersons;
        Params.ParamByName('KAID').AsInteger := KAID;
        Params.ParamByName('Name').AsString := mdKontakt.fieldbyname('Name').AsString;
        Params.ParamByName('Phone').AsString := mdKontakt.fieldbyname('Phone').AsString;
        Params.ParamByName('Email').AsString := mdKontakt.fieldbyname('Email').AsString;
        Params.ParamByName('Notes').AsString := mdKontakt.fieldbyname('Notes').AsString;

        if mdKontakt.FieldByName('jobtype').IsNull then begin
          Params.ParamByName('jobtype').DataType := ftInteger;
          Params.ParamByName('jobtype').Clear;
          Params.ParamByName('Post').AsString := mdKontakt.fieldbyname('Post').AsString;
        end
        else begin
          Params.ParamByName('jobtype').AsInteger := mdKontakt.fieldbyname('jobtype').AsInteger;
          Params.ParamByName('Post').AsString := '';
        end;

        Execute;
        mdKontakt.Next;
      end; // while not mdKontakt.Eof do

    finally
      Free;
    end;

    Result := TrCommit;

  except
    Result := false;
    TrRollBack;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{******* Функция записи в AgentAccount из mdAccount *****************}
//==============================================================================================
function TfrmEditKAgent.AddAgentAccount(KAID:integer):boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.AddAgentAccount') else _udebug := nil;{$ENDIF}

  try
    TrStart;

    with mdAccount do begin
       First;
       while not Eof do begin
         try
           with newDataSet do
           try
             ProviderName := 'pAgentAccount_Ins';
             FetchParams;
             Params.ParamByName('AccId').AsInteger := NextIdAccount;
             Params.ParamByName('KAID').AsInteger := KAID;
             Params.ParamByName('TypeId').AsInteger := mdAccount.fieldbyname('TypeId').AsInteger;
             Params.ParamByName('BankId').AsInteger := mdAccount.fieldbyname('BankId').AsInteger;
             Params.ParamByName('AccNum').AsString := mdAccount.fieldbyname('AccNum').AsString;
             Params.ParamByName('Def').AsInteger := mdAccount.fieldbyname('Def').AsInteger;
             Execute;

           finally
             Free;
           end;

         except
           Result := false;
         end;

         Next;
       end;
    end;

    Result := TrCommit;

  except
    Result := false;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.setid(const Value: integer);
  var
    FItem: TcxTreeListNode;
    FCanSaveSaldo: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditKAgent.setid') else _udebug := nil;{$ENDIF}

  edStartSaldoDate.Date := Self.OnDate;

  if not IsPattern then FID := Value;

  mdAccount.Close;
  mdAccount.Open;
  GetPersons(Value);
  GetPost;

  DiscCanPost := False;
  DiscCanChange := False;

  with newDataSet do try
    if Value <> 0 then begin

     if not IsPattern
       then Self.Caption := rs('fmKAgent', 'TitleEdit')
       else Self.Caption := rs('fmKAgent', 'TitleAdd');

     ProviderName := 'pKAgent_Get';
     FetchParams;
     Params.ParamByName('KAID').AsInteger := Value;
     Open;

     if not IsEmpty then begin
       edName.Text := Fieldbyname('Name').asstring;
       edFIO.Text := fieldbyname('Name').asstring;
       cbKType.ItemIndex := fieldbyname('ktype').AsInteger;
       cbKType.Enabled := cbKType.ItemIndex <> bpTypeOurCompany;
       cbKAKind.ItemIndex := fieldbyname('kakind').AsInteger;

       if fieldbyname('birthdate').AsDateTime <> 0
         then edBirthDate.Date := fieldbyname('birthdate').AsDateTime;

       edFullName.Text := fieldbyname('FullName').AsString;
       edINN.Text := fieldbyname('INN').AsString;
       edOKPO.Text := fieldbyname('OKPO').AsString;
       edKPP.Text := fieldbyname('kpp').AsString;
       edCertNum.Text := fieldbyname('CertNum').AsString;
       edPhone.Text := fieldbyname('Phone').AsString;
       edEmail.Text := fieldbyname('Email').AsString;
       edWWW.Text := fieldbyname('WWW').AsString;
       edFax.Text := fieldbyname('Fax').AsString;
       FDef := FieldByName('def').AsInteger = 1;

       edNotes.Text := fieldbyname('Notes').AsString;
       chbNDSPayer.Checked := fieldbyname('ndspayer').AsInteger=1;
       cbJob.Text := FieldByName('job').AsString;

       if FieldByName('jobtype').IsNull then rbtOther.Checked := True
       else if FieldByName('jobtype').AsInteger = 0 then rbtDirector.Checked := True
       else if FieldByName('jobtype').AsInteger = 1 then rbtBuh.Checked := True;

       if not FieldByName('ptypeid').IsNull
         then lcbPriceType.KeyValue := FieldByName('ptypeid').AsInteger
         else lcbPriceType.Clear;

       if not FieldByName('startsaldo').IsNull then begin
         chbStartSaldo.Checked := True;
         edStartSaldoDate.Date := FieldByName('startsaldodate').AsDateTime;
         edStartSaldo.Value := Abs(FieldByName('startsaldo').AsCurrency);

         if FieldByName('startsaldo').AsCurrency >= 0
           then rbtSSDebt.Checked := True
           else rbtSSCredit.Checked := True;
       end
       else chbStartSaldo.Checked := False;

       if not FieldByName('userid').IsNull then lcbUser.KeyValue := FieldByName('userid').AsInteger;
     end;
     Close;

     ProviderName := 'pKAAddr_Get';
     FetchParams;
     Params.ParamByName('kaid').AsInteger := Value;
     Open;

     if Locate('addrtype', 0, []) then begin
       edAddress.Text := fieldbyname('Address').AsString;
       edIndex.Text := fieldbyname('PostIndex').AsString;
       edCountry.Text := fieldbyname('Country').AsString;
       edDistrict.Text := fieldbyname('District').AsString;
       edCity.Text := fieldbyname('City').AsString;
     end;

     if Locate('addrtype', 1, []) then begin
       edFAddr.Text := fieldbyname('Address').AsString;
       edFIndex.Text := fieldbyname('PostIndex').AsString;
       edFCountry.Text := fieldbyname('Country').AsString;
       edFDistrict.Text := fieldbyname('District').AsString;
       edFCity.Text := fieldbyname('City').AsString;
     end;
     Close;

     if cbKType.ItemIndex <> bpTypeOurCompany then begin
       ProviderName := 'pKA_GetWB'; // waybills count
       FetchParams;
       Params.ParamByName('kaid').AsInteger := FID;
       Open;
       FCanSaveSaldo := (Fields[0].AsInteger = 0);
       Close;

       if FCanSaveSaldo then begin
         ProviderName := 'pKA_GetPayDoc';
         FetchParams;
         Params.ParamByName('kaid').AsInteger := FID;
         Open;
         FCanSaveSaldo := (Fields[0].AsInteger = 0);
         Close;
       end;

       lStartSaldo.Enabled := FCanSaveSaldo and chbStartSaldo.Checked;
       edStartSaldo.Enabled := FCanSaveSaldo and chbStartSaldo.Checked;
       lStartSaldoDate.Enabled := FCanSaveSaldo and chbStartSaldo.Checked;
       edStartSaldoDate.Enabled := FCanSaveSaldo and chbStartSaldo.Checked;
       rbtSSDebt.Enabled := FCanSaveSaldo and chbStartSaldo.Checked;
       rbtSSCredit.Enabled := FCanSaveSaldo and chbStartSaldo.Checked;

       if not (FCanSaveSaldo and chbStartSaldo.Checked) then stStartSaldoCurr.Font.Color := clBtnShadow;
       chbStartSaldo.Enabled := FCanSaveSaldo;
     end;

     ProviderName := 'pKADiscount_Get';
     FetchParams;
     Params.ParamByName('kaid').AsInteger := Value;
     Open;

     if not IsEmpty then begin
       chbUseDiscount.Checked := True;
       chbDiscAll.Checked := FieldByName('discforall').AsInteger = 1;
       chbDiscCustom.Checked := FieldByName('disccustom').AsInteger = 1;
       edDiscAll.Value := FieldByName('onvalue').AsFloat;
       Close;
       ProviderName := 'pKAMatGroupDiscount_Get';
       FetchParams;
       Params.ParamByName('kaid').AsInteger := Value;
       Open;

       while not Eof do begin
         FItem := tvMain.AddChild(FDiscItem, Pointer(-FieldByName('grpid').AsInteger));
         mdDisc.Append;
         mdDisc.FieldByName('id').AsInteger := -FieldByName('grpid').AsInteger;
         mdDisc.FieldByName('name').AsString := FieldByName('name').AsString;
         mdDisc.FieldByName('artikul').AsString := FieldByName('name').AsString;
         mdDisc.FieldByName('fnode').AsInteger := Integer(FItem);
         mdDisc.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
         mdDisc.FieldByName('mtype').AsInteger := 1;
         mdDisc.Post;

         if grdDisc.Enabled then begin
           FItem.ImageIndex := 48;
           FItem.SelectedIndex := 48;
         end
         else begin
           FItem.ImageIndex := 94;
           FItem.SelectedIndex := 94;
         end;

         FItem.Values[0] := '(' + FieldByName('onvalue').AsString + '%) ' + FieldByName('name').AsString;
         Next;
       end;
       Close;
       ProviderName := 'pKAMatDiscount_Get';
       FetchParams;
       Params.ParamByName('kaid').AsInteger := Value;
       Open;

       while not Eof do begin
         FItem := tvMain.AddChild(FDiscItem, Pointer(FieldByName('matid').AsInteger));
         mdDisc.Append;
         mdDisc.FieldByName('id').AsInteger := FieldByName('matid').AsInteger;
         mdDisc.FieldByName('name').AsString := FieldByName('name').AsString;
         mdDisc.FieldByName('artikul').AsString := FieldByName('artikul').AsString;
         mdDisc.FieldByName('fnode').AsInteger := Integer(FItem);
         mdDisc.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
         mdDisc.FieldByName('mtype').AsInteger := 0;
         mdDisc.Post;
         if grdDisc.Enabled then begin
           FItem.ImageIndex := 14;
           FItem.SelectedIndex := 14;
         end
         else begin
           FItem.ImageIndex := 74;
           FItem.SelectedIndex := 74;
         end;

         FItem.Values[0] := '(' + FieldByName('onvalue').AsString + '%) ' + FieldByName('name').AsString;
         Next;
       end;
       Close;
       //FDiscItem.Expand(False);
     end
     else Close;

     if cbKType.ItemIndex <> bpTypeCompany then begin
       ProviderName := 'pAgentDoc_Get';
       FetchParams;
       Params.ParamByName('kaid').AsInteger := Value;
       Open;
       if not IsEmpty then begin
         cbDocName.Text := fieldbyname('docname').AsString;
         edDocNum.Text := fieldbyname('docnum').AsString;
         edDocSeries.Text := fieldbyname('docseries').AsString;
         if not fieldbyname('docdate').IsNull then edDocDate.Date := fieldbyname('docdate').AsDateTime;
         memDocWhoProduce.Text := fieldbyname('docwhoproduce').AsString;
       end;
       Close;
     end;

     mdKontakt.Open;
     mdKontakt.First;
     while not mdKontakt.Eof do begin
       FItem := tvMain.AddChild(FPersonsItem);
       FItem.Values[0] := mdKontakt.FieldByName('name').AsString;
       FItem.Data := pointer(mdKontakt.FieldByName('personid').AsInteger);
       FItem.ImageIndex := 41;
       FItem.SelectedIndex := 41;
       mdKontakt.Edit;
       mdKontakt.FieldByName('fnode').AsInteger := Integer(FItem);
       mdKontakt.Post;
       mdKontakt.Next;
     end;
     FPersonsItem.Expand(False);
     FPersonsItem.Parent.Expand(False);

     //-----------------------------------------------------------------
     GetAccount(Value);
     mdAccount.First;
     while not mdAccount.Eof do begin
       FItem := tvMain.AddChild(FAccountItem);
       FItem.Values[0] := mdAccount.FieldByName('accnum').AsString;
       FItem.Data := pointer(mdAccount.FieldByName('ACCID').AsInteger);
       FItem.ImageIndex := 41;
       FItem.SelectedIndex := 41;
       mdAccount.Edit;
       mdAccount.FieldByName('fnode').AsInteger := Integer(FItem);
       mdAccount.Post;
       mdAccount.Next;
     end;

     if cbKType.ItemIndex = bpTypeOurCompany then begin
       ProviderName := 'pEntExParams_Get';
       FetchParams;
       Params.ParamByName('kaid').AsInteger := FID;
       Open;
       if Locate('wtype', -1, []) then begin
         chbWBOutAutoNum.Checked := FieldByName('autonum').AsInteger = 1;
         edWBOutPrefix.Text := FieldByName('preffix').AsString;
         edWBOutSuffix.Text := FieldByName('suffix').AsString;
         edWBOutCurrNum.Value := Gen_ID(dmData.SConnection, FieldByName('gen').AsString, 0);
       end;

       if Locate('wtype', 2, []) then begin
         chbAOAutoNum.Checked := FieldByName('autonum').AsInteger = 1;
         edAOPrefix.Text := FieldByName('preffix').AsString;
         edAOSuffix.Text := FieldByName('suffix').AsString;
         edAOCurrNum.Value := Gen_ID(dmData.SConnection, FieldByName('gen').AsString, 0);
       end;

       if Locate('wtype', -9, []) then begin
         chbInvAutoNum.Checked := FieldByName('autonum').AsInteger = 1;
         edInvPrefix.Text := FieldByName('preffix').AsString;
         edInvSuffix.Text := FieldByName('suffix').AsString;
         edInvCurrNum.Value := Gen_ID(dmData.SConnection, FieldByName('gen').AsString, 0);
       end;

       if Locate('wtype', -16, []) then begin
         chbOrdAutoNum.Checked := FieldByName('autonum').AsInteger = 1;
         edOrdPrefix.Text := FieldByName('preffix').AsString;
         edOrdSuffix.Text := FieldByName('suffix').AsString;
         edOrdCurrNum.Value := Gen_ID(dmData.SConnection, FieldByName('gen').AsString, 0);
       end;
       Close;
     end;

     FAccountItem.Expand(False);
     AccountModified := false;
     DefaultModified := false;
     PersonsModified := false;
     FModified := false;
    end
    else Self.Caption := rs(ParentNameEx, 'TitleAdd');

   finally
     Free;
     DiscCanPost := True;
     DiscCanChange := True;
   end;

   // set admin only options
   if UserId <> 0 then begin
     lcbUser.Enabled := false;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditKAgent.CheckContacts: boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.CheckContacts') else _udebug := nil;{$ENDIF}

  Result := True;
  try // finally
    if PersonsModified then begin
      with mdKontakt do begin
        First;

        while not Eof do begin
          if FieldByName('name').AsString = '' then begin
            Result := False;
            Exit;
          end;

          Next;
        end;
      end;
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TfrmEditKAgent.CheckAccounts: boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.CheckAccounts') else _udebug := nil;{$ENDIF}

  Result := True;

  try // finally
    if not AccountModified then Exit;

    with mdAccount do begin
      First;
      while not Eof do begin
        if (FieldByName('accnum').AsString = '') or (FieldByName('typeID').AsString = '') or (FieldByName('bankid').AsString='')
        then begin
          Result := False;
          Exit;
        end;

        Next;
      end;
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfrmEditKAgent.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord, FSetDef: boolean;
    FInfo: TKAgentInfo;
    FCanSaveSaldo: Boolean;
    FLegalAddrID, FRealAddrID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.FormCloseQuery') else _udebug := nil;{$ENDIF}

  try // finally
    if not ModalResult in [mrOK, mrYes] then Exit;

    CanClose := False;

    if not CheckContacts then begin
      ssMessageDlg(rs(ParentNameEx, 'ErrorContacts'), ssmtError, [ssmbOk]);
      Exit;
    end;

    if not CheckAccounts then begin
      ssMessageDlg(rs(ParentNameEx, 'ErrorAccounts'), ssmtError, [ssmbOk]);
      Exit;
    end;

    if not CheckDiscounts then begin
      ssMessageDlg(rs(ParentNameEx, 'ErrorDisc'), ssmtError, [ssmbOk]);
      Exit;
    end;

    with newDataSet do
    try
      TrStart;

      try
        NewRecord := (ID = 0);

        if NewRecord then FID := GetMaxID(dmData.SConnection, 'kagent', 'kaid');

        FSetDef := False;
        if NewRecord and (cbKType.ItemIndex = bpTypeOurCompany) then begin
          ProviderName := 'pKAgent_GetFirmsCount';
          Open;
          FSetDef := Fields[0].AsInteger = 0;
          Close;
        end;

        if (cbKType.ItemIndex = bpTypeEmployee) and (lcbUser.EditText <> '') then begin
          ProviderName := 'pKAgent_UpdUser';
          FetchParams;
          Params.ParamByName('userid').AsInteger := lcbUser.KeyValue;
          Execute;
        end;

        if NewRecord
          then ProviderName := 'pKAgent_Ins'
          else ProviderName := 'pKAgent_Upd';

        FetchParams;
        Params.ParamByName('KAID').AsInteger := ID;
        Params.ParamByName('ktype').AsInteger := cbKType.ItemIndex;
        Params.ParamByName('kakind').AsInteger := cbKAKind.ItemIndex;

        if cbKType.ItemIndex in [bpTypeCompany, bpTypeOurCompany]
          then Params.ParamByName('Name').AsString := edName.Text
          else Params.ParamByName('Name').AsString := edFIO.Text;

        if edBirthDate.Date > 0
          then Params.ParamByName('birthdate').AsDateTime := edBirthDate.Date
          else begin
            Params.ParamByName('birthdate').DataType := ftDateTime;
            Params.ParamByName('birthdate').Clear;
          end;

        Params.ParamByName('FullName').AsString := edFullName.Text;
        Params.ParamByName('INN').AsString := edINN.Text;
        Params.ParamByName('OKPO').AsString := edOKPO.Text;
        Params.ParamByName('kpp').AsString := edKPP.Text;
        Params.ParamByName('CertNum').AsString := edCertNum.Text;
        Params.ParamByName('Phone').AsString := edPhone.Text;
        Params.ParamByName('EMail').AsString := edEMail.Text;
        Params.ParamByName('WWW').AsString := Trim(edWWW.Text);
        Params.ParamByName('Fax').AsString := Trim(edFax.Text);
        Params.ParamByName('Address').AsString := edAddress.Text;
        Params.ParamByName('Country').AsString := Trim(edCountry.Text);
        Params.ParamByName('District').AsString := Trim(edDistrict.Text);
        Params.ParamByName('City').AsString := Trim(edCity.Text);
        Params.ParamByName('PostIndex').AsString := Trim(edIndex.Text);
        Params.ParamByName('Notes').AsString := Trim(edNotes.Text);

        if lcbUser.EditText = '' then begin
          Params.ParamByName('userid').DataType := ftInteger;
          Params.ParamByName('userid').Clear;
        end
        else Params.ParamByName('userid').AsInteger := lcbUser.KeyValue;

        Params.ParamByName('deleted').AsInteger := 0;
        Params.ParamByName('ndspayer').AsInteger := Integer(chbNDSPayer.Checked);

        if lcbPriceType.EditingText = '' then begin
          Params.ParamByName('ptypeid').DataType := ftInteger;
          Params.ParamByName('ptypeid').Clear;
        end
        else Params.ParamByName('ptypeid').AsInteger := lcbPriceType.KeyValue;

        if cbKType.ItemIndex = bpTypeEmployee then begin
          if rbtOther.Checked then begin
            Params.ParamByName('job').AsString := cbJob.Text;
            Params.ParamByName('jobtype').DataType := ftInteger;
            Params.ParamByName('jobtype').Clear;
          end
          else begin
            Params.ParamByName('job').DataType := ftString;
            Params.ParamByName('job').Clear;
            Params.ParamByName('jobtype').AsInteger := Integer(not rbtDirector.Checked);
          end;
        end
        else begin
          Params.ParamByName('job').DataType := ftString;
          Params.ParamByName('job').Clear;
          Params.ParamByName('jobtype').DataType := ftInteger;
          Params.ParamByName('jobtype').Clear;
        end;

        Execute;

        if not NewRecord then begin
          ProviderName := 'pKAAddr_Get';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Open;

          if Locate('addrtype', 0, [])
            then FLegalAddrID := FieldByName('addrid').AsInteger
            else FLegalAddrID := 0;

          if Locate('addrtype', 1, [])
            then FRealAddrID := FieldByName('addrid').AsInteger
            else FRealAddrID := 0;
          Close;
        end
        else begin
          FLegalAddrID := 0;
          FRealAddrID := 0;
        end;

        if FLegalAddrID = 0 then begin
          ProviderName := 'pKAAddr_Ins';
          FLegalAddrID := GetMaxID(dmData.SConnection, 'kaaddr', 'addrid');
        end
        else ProviderName := 'pKAAddr_Upd';

        FetchParams;
        Params.ParamByName('kaid').AsInteger := FID;
        Params.ParamByName('addrid').AsInteger := FLegalAddrID;

        Params.ParamByName('addrtype').AsInteger := 0;
        Params.ParamByName('Address').AsString := edAddress.Text;
        Params.ParamByName('Country').AsString := Trim(edCountry.Text);
        Params.ParamByName('District').AsString := Trim(edDistrict.Text);
        Params.ParamByName('City').AsString := Trim(edCity.Text);
        Params.ParamByName('PostIndex').AsString := Trim(edIndex.Text);
        Execute;

        if FRealAddrID = 0 then begin
          ProviderName := 'pKAAddr_Ins';
          FRealAddrID := GetMaxID(dmData.SConnection, 'kaaddr', 'addrid');
        end
        else ProviderName := 'pKAAddr_Upd';

        Params.ParamByName('addrid').AsInteger := FRealAddrID;
        Params.ParamByName('addrtype').AsInteger := 1;
        Params.ParamByName('Address').AsString := edFAddr.Text;
        Params.ParamByName('Country').AsString := Trim(edFCountry.Text);
        Params.ParamByName('District').AsString := Trim(edFDistrict.Text);
        Params.ParamByName('City').AsString := Trim(edFCity.Text);
        Params.ParamByName('PostIndex').AsString := Trim(edFIndex.Text);
        Execute;

        FCanSaveSaldo := edStartSaldo.Enabled;

        if FCanSaveSaldo then begin
          ProviderName := 'pKA_StartSaldoUpd';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;

          if edStartSaldo.EditText <> '' then begin
            if rbtSSCredit.Checked
              then Params.ParamByName('startsaldo').AsCurrency := - edStartSaldo.Value
              else Params.ParamByName('startsaldo').AsCurrency := edStartSaldo.Value;

            Params.ParamByName('startsaldodate').AsDateTime := edStartSaldoDate.Date;
          end
          else begin
            Params.ParamByName('startsaldo').DataType := ftCurrency;
            Params.ParamByName('startsaldo').Clear;
            Params.ParamByName('startsaldodate').DataType := ftDateTime;
            Params.ParamByName('startsaldodate').Clear;
          end;

          Execute;
        end;
        if not NewRecord then begin
          ProviderName := 'pAgentDoc_Del';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Execute;
        end;

        if cbKType.ItemIndex in [bpTypePerson, bpTypeEmployee] then begin
          ProviderName := 'pAgentDoc_Ins';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Params.ParamByName('docnum').AsString := Trim(edDocNum.Text);
          Params.ParamByName('docseries').AsString := Trim(edDocSeries.Text);
          Params.ParamByName('docname').AsString := Trim(cbDocName.Text);
          Params.ParamByName('docwhoproduce').AsString := Trim(memDocWhoProduce.Text);

          if DelChars(edDocDate.Text, [' ', DateSeparator]) <> ''
            then Params.ParamByName('docdate').AsDateTime := edDocDate.Date
            else begin
              Params.ParamByName('docdate').DataType := ftDateTime;
              Params.ParamByName('docdate').Clear;
            end;

          Execute;
        end;

        if PersonsModified //{******* Запись всех AgentPersons из mdKontakt *************}
          then if DelAgentPersons(FID) then AddPersons(FID);

        if AccountModified then begin
          mdAccount.Filtered := False;
          mdAccount.First;

          while not mdAccount.Eof do begin
            if mdAccount.FieldByName('deleted').AsInteger = 1 then begin
              ProviderName := 'pAgentAccount_DelByID';
              FetchParams;
              Params.ParamByName('accid').AsInteger := mdAccount.FieldByName('accid').AsInteger;
              Execute;
            end
            else begin
              if mdAccount.FieldByName('accid').AsInteger < 0
                then ProviderName := 'pAgentAccount_Ins'
                else ProviderName := 'pAgentAccount_Upd';

              FetchParams;

              if mdAccount.FieldByName('accid').AsInteger < 0
                then Params.ParamByName('accid').AsInteger := GetMaxID(dmData.SConnection, 'agentaccount', 'accid')
                else Params.ParamByName('accid').AsInteger := mdAccount.FieldByName('accid').AsInteger;

              Params.ParamByName('kaid').AsInteger := FID;
              Params.ParamByName('bankid').AsInteger := mdAccount.FieldByName('bankid').AsInteger;
              Params.ParamByName('typeid').AsInteger := mdAccount.FieldByName('typeid').AsInteger;
              Params.ParamByName('accnum').AsString := mdAccount.FieldByName('accnum').AsString;
              Params.ParamByName('def').AsInteger := mdAccount.FieldByName('def').AsInteger;
              Execute;
            end;

            mdAccount.Next;
          end;
        end;

        if not NewRecord then begin
          ProviderName := 'pKADiscount_Del';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Execute;
          ProviderName := 'pKAMatDiscount_Del';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Execute;
          ProviderName := 'pKAMatGroupDiscount_Del';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Execute;
        end;

        if chbUseDiscount.Checked then begin
          ProviderName := 'pKADiscount_Ins';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Params.ParamByName('discforall').AsInteger := Integer(chbDiscAll.Checked);
          Params.ParamByName('disccustom').AsInteger := Integer(chbDiscCustom.Checked);
          Params.ParamByName('onvalue').AsFloat := edDiscAll.Value;
          Execute;

          mdDisc.First;
          while not mdDisc.Eof do begin
            if mdDisc.FieldByName('mtype').AsInteger = 0
              then ProviderName := 'pKAMatDiscount_Ins'
              else ProviderName := 'pKAMatGroupDiscount_Ins';

            FetchParams;
            Params.ParamByName('kaid').AsInteger := FID;

            if mdDisc.FieldByName('mtype').AsInteger = 0
              then Params.ParamByName('matid').AsInteger := mdDisc.FieldByName('id').AsInteger
              else Params.ParamByName('grpid').AsInteger := -mdDisc.FieldByName('id').AsInteger;

            Params.ParamByName('onvalue').AsFloat := mdDisc.FieldByName('onvalue').AsFloat;
            Execute;
            mdDisc.Next;
          end;
        end;

        if NewRecord and (cbKType.ItemIndex = bpTypeOurCompany) and FSetDef then begin
          ProviderName := 'pKAgent_SetDef';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Params.ParamByName('def').AsInteger := 1;
          Execute;
          CurrEnt.KAID := FID;
        end;

        if cbKType.ItemIndex = bpTypeOurCompany then begin
          ProviderName := 'pSQL';
          FetchMacros;
          Params.Clear;

          Macros.ParamByName('sql').AsString := 'select * from rdb$generators where rdb$generator_name=''' + 'GEN_ENT_WBOUT' + IntToStr(FID) + '''';
          Open;
          if IsEmpty then begin
            Close;
            Macros.ParamByName('sql').AsString := 'create generator gen_ent_wbout' + IntToStr(FID);
            Execute;
          end
          else Close;

          Macros.ParamByName('sql').AsString := 'select * from rdb$generators where rdb$generator_name=''' + 'GEN_ENT_ACCOUT' + IntToStr(FID) + '''';
          Open;
          if IsEmpty then begin
            Close;
            Macros.ParamByName('sql').AsString := 'create generator gen_ent_accout' + IntToStr(FID);
            Execute;
          end
          else Close;

          Macros.ParamByName('sql').AsString := 'select * from rdb$generators where rdb$generator_name=''' + 'GEN_ENT_INV' + IntToStr(FID) + '''';
          Open;
          if IsEmpty then begin
            Close;
            Macros.ParamByName('sql').AsString := 'create generator gen_ent_inv' + IntToStr(FID);
            Execute;
          end
          else Close;

          Macros.ParamByName('sql').AsString := 'select * from rdb$generators where rdb$generator_name=''' + 'GEN_ENT_ORDOUT' + IntToStr(FID) + '''';
          Open;
          if IsEmpty then begin
            Close;
            Macros.ParamByName('sql').AsString := 'create generator gen_ent_ordout' + IntToStr(FID);
            Execute;
          end
          else Close;

          Macros.ParamByName('sql').AsString := 'set generator gen_ent_wbout' + IntToStr(FID) + ' to ' + IntToStr(edWBOutCurrNum.Value);
          Execute;

          Macros.ParamByName('sql').AsString := 'set generator gen_ent_accout' + IntToStr(FID) + ' to ' + IntToStr(edAOCurrNum.Value);
          Execute;

          Macros.ParamByName('sql').AsString := 'set generator gen_ent_inv' + IntToStr(FID) + ' to ' + IntToStr(edInvCurrNum.Value);
          Execute;

          Macros.ParamByName('sql').AsString := 'set generator gen_ent_ordout' + IntToStr(FID) + ' to ' + IntToStr(edOrdCurrNum.Value);
          Execute;

          if not NewRecord then begin
            ProviderName := 'pEntExParams_Del';
            Macros.Clear;
            FetchParams;
            Params.ParamByName('kaid').AsInteger := FID;
            Execute;
          end;
            
          ProviderName := 'pEntExParams_Ins';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Params.ParamByName('wtype').AsInteger := -1;
          Params.ParamByName('autonum').AsInteger := Integer(chbWBOutAutoNum.Checked);
          Params.ParamByName('preffix').AsString := edWBOutPrefix.Text;
          Params.ParamByName('suffix').AsString := edWBOutSuffix.Text;
          Params.ParamByName('gen').AsString := 'gen_ent_wbout' + IntToStr(FID);
          Execute;

          Params.ParamByName('wtype').AsInteger := 2;
          Params.ParamByName('autonum').AsInteger := Integer(chbAOAutoNum.Checked);
          Params.ParamByName('preffix').AsString := edAOPrefix.Text;
          Params.ParamByName('suffix').AsString := edAOSuffix.Text;
          Params.ParamByName('gen').AsString := 'gen_ent_accout' + IntToStr(FID);
          Execute;

          Params.ParamByName('wtype').AsInteger := -9;
          Params.ParamByName('autonum').AsInteger := Integer(chbInvAutoNum.Checked);
          Params.ParamByName('preffix').AsString := edInvPrefix.Text;
          Params.ParamByName('suffix').AsString := edInvSuffix.Text;
          Params.ParamByName('gen').AsString := 'gen_ent_inv' + IntToStr(FID);
          Execute;

          Params.ParamByName('wtype').AsInteger := -16;
          Params.ParamByName('autonum').AsInteger := Integer(chbOrdAutoNum.Checked);
          Params.ParamByName('preffix').AsString := edOrdPrefix.Text;
          Params.ParamByName('suffix').AsString := edOrdSuffix.Text;
          Params.ParamByName('gen').AsString := 'gen_ent_ordout' + IntToStr(FID);
          Execute;
        end;

        TrCommit;

        //------------------------------------------------------------------------------------
        if not NewRecord and (cbKType.ItemIndex = bpTypeOurCompany) and FDef then begin
          //CurrEnt.KAID := 0;
          CurrEnt.KAID := FID;
        end;

        if cbKType.ItemIndex = bpTypeOurCompany then begin
          RefreshEnts;
          RefreshFun('TfmFinance', -1);
        end;

        if cbKType.ItemIndex = bpTypeEmployee then begin
          if rbtDirector.Checked then begin
            EntDir := edFIO.Text;
            EntDirID := FID;
          end
          else if rbtBuh.Checked then begin
            EntBuh := edFIO.Text;
            EntBuhID := FID;
          end;
        end;

        if FCanSaveSaldo then DoRecalcKASaldo(dmData.SConnection, FID, edStartSaldoDate.Date, rs(ParentNameEx, 'RecalcBallance'), False);

        FInfo.ID := FID;
        FInfo.KType := cbKType.ItemIndex;
        SendMessage(MainHandle, WM_REFRESH, Integer(@FInfo), 3);

        if RefreshAllClients then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);

        if ModalResult = mrYes then begin

          if NewRecord then begin

            if not IsPattern then begin
              if cbJob.Visible and (Trim(cbJob.Text) <> '') and (cbJob.Properties.Items.IndexOf(cbJob.Text) = -1)
                then cbJob.Properties.Items.Add(cbJob.Text);

              cbJob.Text := '';
              edName.Text := '';
              edFIO.Clear;
              edFullName.Text := '';
              edINN.Text := '';
              edOKPO.Text := '';
              edCertNum.Text := '';
              edAddress.Text := '';
              edPhone.Text := '';
              edEmail.Text := '';
              edWWW.Text := '';
              edFax.Text := '';
              edCity.Text := '';
              edDistrict.Text := '';
              edCountry.Text := '';
              edIndex.Text := '';
              edNotes.Text := '';
              mdKontakt.EmptyTable;
              mdAccount.EmptyTable;
              mdTypeRel.EmptyTable;
              FAccountItem.DeleteChildren;
              tvMainSelectionChanged(tvMain);
            end; //if not IsPattern

            PageMain.Visible := true;

            if cbKType.Enabled
              then cbKType.SetFocus
              else edFIO.SetFocus;

            FID := 0;
          end; // if NewRecord
        end // if ModalResult = mrYes
        else CanClose := True;

        FModified := False;

      finally
        Free;
      end;

    except
      on e:exception do begin
        TrRollback;
        MessageDlg(e.Message, mtError, [mbOk], 0);
      end;
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfrmEditKAgent.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if not allowALUpdate(200) then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;
  
  try
    aOk.Enabled := ( ((Trim(edName.Text) <> '') and (cbKType.ItemIndex in [bpTypeCompany, bpTypeOurCompany]))
          or ( (Trim(edFIO.Text) <> '') and (cbKType.ItemIndex in [bpTypePerson, bpTypeEmployee]) )
         )
         and
         ( not edStartSaldo.Enabled or (Trim(edStartSaldoDate.EditingText) <> '') );

    aApply.Enabled := aOk.Enabled and FModified;

    if tvMain.FocusedNode <> nil then begin // AP: 2010-02-23 fix?
      aNew.Enabled := Integer(tvMain.FocusedNode.Data) > 0;
      aDel.Enabled := Integer(tvMain.FocusedNode.Data) > 0;
    end
    else begin
      aNew.Enabled := False;
      aDel.Enabled := False;
    end;

  except
    on e: Exception do debugInstantLog('!ERROR: TfrmEditKAgent.ActionListUpdate: ' + e.Message);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.DataModified(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.DataModified') else _udebug := nil;{$ENDIF}

  FModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.SetCaptions;
  var
    FItem: TcxTreeListNode;
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    case CountryRules.AR of
      accRul_RU:
        begin
          colAccMFO.Caption := GetRS(ParentNameEx, 'BIC');
          lBank.Caption := GetRS(ParentNameEx, 'BIC');
        end;

      accRul_UA:
        begin
          colAccMFO.Caption := GetRS(ParentNameEx, 'MFO');
          lBank.Caption := GetRS(ParentNameEx, 'MFO');
        end;

      else
        begin
          colAccMFO.Caption := GetRS(ParentNameEx, 'ABA');
          lBank.Caption := GetRS(ParentNameEx, 'ABA');
        end;
    end;

    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aApply.Caption := GetRS('Common', 'Apply');

    aDelAccount.Caption := GetRS('Common', 'Del');
    aDelPerson.Caption := GetRS('Common', 'Del');
    aDiscAdd.Caption := GetRS('Common', 'Add');
    aDiscDel.Caption := GetRS('Common', 'Del');
    aDiscProps.Caption := GetRS('Common', 'Properties');
    aNewAccount.Caption := GetRS('Common', 'Add');
    aNewPerson.Caption := GetRS('Common', 'Add');
    aPropAccount.Caption := GetRS('Common', 'Properties');
    aPropsPerson.Caption := GetRS('Common', 'Properties');
    aRefreshAccount.Caption := GetRS('Common', 'Refresh');
    aRefreshPerson.Caption := GetRS('Common', 'Refresh');

    btnAccLevelUp.Hint := GetRS(ParentNameEx, 'AccList');
    btnAccountRef.Hint := GetRS(ParentNameEx, 'AccountRef');
    btnBallance.Hint := GetRS('fmWaybill', 'KABallance');
    btnBankRef.Hint := GetRS('fmWaybill', 'BankRef');
    btnCopyAddr.Hint := GetRS('fmKAgent', 'CopyAddr');
    btnDiscLevelUp.Hint := GetRS(ParentNameEx, 'DiscList');
    btnPersonLevelUp.Hint := GetRS(ParentNameEx, 'PersonsList');

    chbAOAutoNum.Properties.Caption := GetRS('fmKAgent', 'ANAccOut');
    chbDiscAll.Properties.Caption := GetRS(ParentNameEx, 'DiscAll');
    chbDiscCustom.Properties.Caption := GetRS(ParentNameEx, 'DiscCustom') + ':';
    chbInvAutoNum.Properties.Caption := GetRS('fmKAgent', 'ANInv');
    chbNDSPayer.Properties.Caption := GetRS(ParentNameEx, 'NDSPayer');
    chbOrdAutoNum.Properties.Caption := GetRS('fmKAgent', 'ANOrdOut');
    chbStartSaldo.Properties.Caption := GetRS(ParentNameEx, 'StartSaldo');
    chbUseDiscount.Properties.Caption := GetRS(ParentNameEx, 'UseDiscount');
    chbWBOutAutoNum.Properties.Caption := GetRS('fmKAgent', 'ANWBOut');

    colAccNum.Caption := GetRS(ParentNameEx, 'Account');
    colAccType.Caption := GetRS(ParentNameEx, 'AccountType');
    colDiscName.Caption := GetRS(ParentNameEx, 'MatOrGrp');
    colDiscOnValue.Caption := GetRS(ParentNameEx, 'Discount') + ', %';
    colDiscType.Caption := '';
    colName.Caption := GetRS(ParentNameEx, 'PersonName');
    colPost.Caption := GetRS(ParentNameEx, 'PersonPost');

    gbAccounts.Caption := ' ' + GetRS(ParentNameEx, 'AgentAccounts') + ' ';
    gbAddInfo.Caption := ' ' + GetRS(ParentNameEx, 'AddInfo') + ' ';
    gbAddr.Caption := ' ' + GetRS(ParentNameEx, 'LegalAddr') + ' ';
    gbContact.Caption := ' ' + GetRS(ParentNameEx, 'gbKontakt') + ' ';
    gbDoc.Caption := ' ' + GetRS(ParentNameEx, 'Doc') + ' ';
    gbFactAddr.Caption := ' ' + GetRS(ParentNameEx, 'FactAddr') + ' ';
    gbMainInfo.Caption := ' ' + GetRS(ParentNameEx, 'PageMain') + ' ';
    gbNotes.Caption := ' ' + GetRS(ParentNameEx, 'Notes') + ' ';
    gbPersons.Caption := ' ' + GetRS(ParentNameEx, 'AgentPersons') + ' ';
    gbStartSaldo.Caption := ' ' + GetRS(ParentNameEx, 'StartSaldo') + ' ';

    lAccOrderNum.Caption := GetRS(ParentNameEx, 'AccountOrder') + ':';
    lAccount.Caption := GetRS(ParentNameEx, 'Account') + ':';
    lAddress.Caption := GetRS(ParentNameEx, 'Address') + ':';
    lAOCurrNum.Caption := GetRS('frmOptions', 'CurrNum') + ':';
    lAOPrefix.Caption := GetRS('frmOptions', 'Prefix') + ':';
    lAOSuffix.Caption := GetRS('frmOptions', 'Suffix') + ':';
    lBankName.Caption := GetRS(ParentNameEx, 'AccountBank') + ':';
    lBirthDate.Caption := GetRS(ParentNameEx, 'BirthDate') + ':';
    lCertNum.Caption := GetRS(ParentNameEx, 'CertNum') + ':';
    lCity.Caption := GetRS(ParentNameEx, 'City') + ':';
    lCountry.Caption := GetRS(ParentNameEx, 'Country') + ':';
    lDistrict.Caption := GetRS(ParentNameEx, 'District') + ':';
    lDocDate.Caption := GetRS(ParentNameEx, 'DocDate') + ':';
    lDocName.Caption := GetRS(ParentNameEx, 'DocName') + ':';
    lDocNum.Caption := GetRS(ParentNameEx, 'DocNum') + ':';
    lDocSeries.Caption := GetRS(ParentNameEx, 'DocSeries') + ':';
    lDocWhoProduce.Caption := GetRS(ParentNameEx, 'DocWhoProduce') + ':';
    lEmail.Caption := GetRS(ParentNameEx, 'EMail') + ':';
    lFAddr.Caption := GetRS(ParentNameEx, 'Address') + ':';
    lFax.Caption := GetRS(ParentNameEx, 'Fax') + ':';
    lFCity.Caption := GetRS(ParentNameEx, 'City') + ':';
    lFCountry.Caption := GetRS(ParentNameEx, 'Country') + ':';
    lFDistrict.Caption := GetRS(ParentNameEx, 'District') + ':';
    lFindBy.Caption := GetRS(ParentNameEx, 'FindBy') + ':';
    lFIndex.Caption := GetRS(ParentNameEx, 'PostIndex') + ':';
    lFIO.Caption := GetRS(ParentNameEx, 'FIO') + ':';
    lFullName.Caption := GetRS(ParentNameEx, 'FullName') + ':';
    lIndex.Caption := GetRS(ParentNameEx, 'PostIndex') + ':';
    lINN.Caption := GetRS(ParentNameEx, 'INN') + ':';
    lInvCurrNum.Caption := GetRS('frmOptions', 'CurrNum') + ':';
    lInvPrefix.Caption := GetRS('frmOptions', 'Prefix') + ':';
    lInvSuffix.Caption := GetRS('frmOptions', 'Suffix') + ':';
    lJob.Caption := GetRS(ParentNameEx, 'Job') + ':';
    lKAKind.Caption := GetRS(ParentNameEx, 'KAKind') + ':';
    lKPP.Caption := GetRS(ParentNameEx, 'KPP') + ':';
    lKType.Caption := GetRS(ParentNameEx, 'Type') + ':';
    lMat.Caption := '---';
    lMatDisc.Caption := GetRS(ParentNameEx, 'Discount') + ':';
    lMatType.Caption := GetRS(ParentNameEx, 'DiscOn') + ':';
    lName.Caption := GetRS(ParentNameEx, 'Name') + ':';
    lNotes.Caption := GetRS(ParentNameEx, 'PageNotes') + ':';
    lOKPO.Caption := GetRS(ParentNameEx, 'OKPO') + ':';
    lOrdCurrNum.Caption := GetRS('frmOptions', 'CurrNum') + ':';
    lOrdPrefix.Caption := GetRS('frmOptions', 'Prefix') + ':';
    lOrdSuffix.Caption := GetRS('frmOptions', 'Suffix') + ':';
    lPersonEmail.Caption := GetRS(ParentNameEx, 'EMail') + ':';
    lPersonFIO.Caption := GetRS(ParentNameEx, 'PersonName') + ':';
    lPersonPhone.Caption := GetRS(ParentNameEx, 'Phone') + ':';
    lPersonPost.Caption := GetRS(ParentNameEx, 'PersonPost') + ':';
    lPhone.Caption := GetRS(ParentNameEx, 'Phone') + ':';
    lPriceType.Caption := GetRS('fmWaybill', 'PriceType') + ':';
    lStartSaldo.Caption := GetRS(ParentNameEx, 'Sum') + ':';
    lStartSaldoDate.Caption := GetRS(ParentNameEx, 'OnDate') + ':';
    lType.Caption := GetRS(ParentNameEx, 'AccountType') + ':';
    lUser.Caption := GetRS(ParentNameEx, 'User');
    lWBOutCurrNum.Caption := GetRS('frmOptions', 'CurrNum') + ':';
    lWBOutPrefix.Caption := GetRS('frmOptions', 'Prefix') + ':';
    lWBOutSuffix.Caption := GetRS('frmOptions', 'Suffix') + ':';
    lWWW.Caption := GetRS(ParentNameEx, 'WWW') + ':';

    PageAccounts.Caption := GetRS(ParentNameEx, 'PageAccounts');
    PageContact.Caption := GetRS(ParentNameEx, 'PageContact');
    PageMain.Caption := GetRS(ParentNameEx, 'PageMain');
    PageNotes.Caption := GetRS(ParentNameEx, 'PageNotes');
    PagePersons.Caption := GetRS(ParentNameEx, 'PagePersons');

    rbtBuh.Caption := GetRS(ParentNameEx, 'Buh');
    rbtDirector.Caption := GetRS(ParentNameEx, 'Director');
    rbtOther.Caption := GetRS(ParentNameEx, 'Other');
    rbtPBuh.Caption := GetRS(ParentNameEx, 'Buh');
    rbtPDir.Caption := GetRS(ParentNameEx, 'Director');
    rbtPOther.Caption := GetRS(ParentNameEx, 'Other');

    rbtSSCredit.Caption := GetRS(ParentNameEx, 'Credit');
    rbtSSDebt.Caption := GetRS(ParentNameEx, 'Debt');

    sbAddToFull.Hint := GetRS(ParentNameEx, 'AddToFull');
    stStartSaldoCurr.Caption := BaseCurrName;

    with tvMain do begin
      Clear;
      FItem := Add;
      FItem.Values[0] := GetRS(ParentNameEx, 'PageMain');
      FItem.Data := pointer(-1);
      FItem.SelectedIndex := 24;
      FItem.ImageIndex := 24;

      FItem := Add;
      FItem.Values[0] := GetRS(ParentNameEx, 'AddInfo');
      FItem.Data := Pointer(-8);
      FItem.SelectedIndex := 24;
      FItem.ImageIndex := 24;

      FItem := Add;
      FItem.Data := pointer(-7);
      FItem.Values[0] := GetRS(ParentNameEx, 'Discounts');
      FItem.SelectedIndex := 108;
      FItem.ImageIndex := 108;
      FDiscItem := FItem;

      FItem := Add;
      FItem.Values[0] := GetRS(ParentNameEx, 'Doc');
      FItem.Data := pointer(-6);
      FItem.SelectedIndex := 68;
      FItem.ImageIndex := 68;

      FItem := Add;
      FItem.Data := pointer(-2);
      FItem.Values[0] := GetRS(ParentNameEx, 'PageContact');
      FItem.SelectedIndex := 24;
      FItem.ImageIndex := 24;

      FItem := Nodes[4].AddChild;
      FItem.Data := pointer(-4);
      FItem.Values[0] := GetRS(ParentNameEx, 'PagePersons');
      FItem.SelectedIndex := 25;
      FItem.ImageIndex := 25;
      FPersonsItem := FItem;
      FPersonsItem.Parent.Expand(False);

      FItem := Add;
      FItem.Data := pointer(-3);
      FItem.Values[0] := GetRS(ParentNameEx, 'PageAccounts');
      FItem.SelectedIndex := 23;
      FItem.ImageIndex := 23;
      FAccountItem := FItem;

      FItem := Add;
      FItem.Data := pointer(-5);
      FItem.Values[0] := GetRS(ParentNameEx, 'PageNotes');
      FItem.SelectedIndex := 4;
      FItem.ImageIndex := 4;

      FocusedNode := tvMain.Items[0];
    end;

    with cbKType do begin
      Properties.Items.Add(GetRS(ParentNameEx, 'KAEnt'));
      Properties.Items.Add(GetRS(ParentNameEx, 'KAPersons'));
      Properties.Items.Add(GetRS(ParentNameEx, 'KAWorkers'));
      Properties.Items.Add(GetRS(ParentNameEx, 'Ents'));
      ItemIndex := 0;
    end;

    with cbType do begin
      Properties.Items.Add(GetRS(ParentNameEx, 'Mat'));
      Properties.Items.Add(GetRS(ParentNameEx, 'MatGrpD'));
      ItemIndex := 1;
      btnMatRef.ImageIndex := 23;
    end;

    with cbFindField do begin
      Properties.Items.Add(GetRS(ParentNameEx, 'MatNameD'));
      Properties.Items.Add(GetRS(ParentNameEx, 'ArtikulD'));
      ItemIndex := 0;
    end;

    if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'FindField', Temp)
      then cbFindField.ItemIndex := Temp;

    cbKType.ItemIndex := LastKAKType;
    cbKAKind.ItemIndex := LastKAKind;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.sbAddToFullClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.sbAddToFullClick') else _udebug := nil;{$ENDIF}

  edFullName.Text := edName.Text;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.ActionListAccountUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.ActionListAccountUpdate') else _udebug := nil;{$ENDIF}

  try
    if PageAccounts.Visible or PageEditAccount.Visible then begin
      aNewAccount.Enabled := true;
      aPropAccount.Enabled := not mdAccount.IsEmpty and (pcEditKAgent.ActivePage <> PageEditAccount);
      aDelAccount.Enabled := not mdAccount.IsEmpty;
    end
    else begin
      aNewAccount.Enabled := false;
      aPropAccount.Enabled := false;
      aDelAccount.Enabled := false;
    end;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.ActionListPersonUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.ActionListPersonUpdate') else _udebug := nil;{$ENDIF}

  try
    if PagePersons.Visible or PageEditPerson.Visible or PageContact.Visible
    then begin
      aNewPerson.Enabled := true;
      aPropsPerson.Enabled := not mdKontakt.IsEmpty and (pcEditKAgent.ActivePage<>PageEditPerson);
      aDelPerson.Enabled := not mdKontakt.IsEmpty;
    end
    else begin
      aNewPerson.Enabled := false;
      aPropsPerson.Enabled := false;
      aDelPerson.Enabled := false;
    end;

    aDiscAdd.Enabled := chbUseDiscount.Checked and chbDiscCustom.Checked;

    aDiscProps.Enabled := chbUseDiscount.Checked and not mdDisc.IsEmpty and (tvMain.FocusedNode.Parent <> FDiscItem) and chbDiscCustom.Checked;

    aDiscDel.Enabled := chbUseDiscount.Checked and not mdDisc.IsEmpty and chbDiscCustom.Checked;
    
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.aDelAccountExecute(Sender: TObject);
  var
    FNode: Pointer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.aDelAccountExecute') else _udebug := nil;{$ENDIF}

  if ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  FNode := Pointer(mdAccount.FieldByName('fnode').AsInteger);

  if mdAccount.FieldByName('accid').AsInteger < 0
    then mdAccount.Delete
    else begin
      with newDataSet do
      try
        ProviderName := 'pAgentAccount_DelByID';
        FetchParams;
        Params.ParamByName('accid').AsInteger := mdAccount.FieldByName('accid').AsInteger;

        TrStart;

        try
          Execute;

          TrRollback; // WTF?????

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

  tvMain.FocusedNode := TcxTreeListNode(FNode).GetPrev;
  TcxTreeListNode(FNode).Free;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.aDelPersonExecute(Sender: TObject);
  var
    fnode: pointer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.aDelPersonExecute') else _udebug := nil;{$ENDIF}

  if ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  fnode := pointer(mdKontakt.FieldByName('fnode').AsInteger);
  mdKontakt.Delete;
  tvMain.FocusedNode := TcxTreeListNode(fnode).GetPrev;
  TcxTreeListNode(fnode).Free;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.mdKontaktAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.mdKontaktAfterDelete') else _udebug := nil;{$ENDIF}

  FModified := True;
  PersonsModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.mdKontaktAfterPost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.mdKontaktAfterPost') else _udebug := nil;{$ENDIF}

  FModified := True;
  PersonsModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.mdAccountAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.mdAccountAfterDelete') else _udebug := nil;{$ENDIF}

  FModified := True;
  AccountModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.mdAccountAfterPost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.mdAccountAfterPost') else _udebug := nil;{$ENDIF}

  FModified := true;
  AccountModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.aPropsPersonExecute(Sender: TObject);
  var
    FNode: TcxTreeListNode;
    maxx: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.aPropsPersonExecute') else _udebug := nil;{$ENDIF}

  if (Sender as TComponent).Tag = 0 then begin
    if CheckContacts then begin
      FNode := tvMain.AddChild(FPersonsItem);

      FPersonsItem.Expand(False);
      maxx := GetMax(mdKontakt, 'personid') + 1;
      FNode.Data := pointer(maxx);
      FNode.ImageIndex := 41;
      FNode.SelectedIndex := 41;
      FNode.Values[0] := '';
      tvMain.FocusedNode := FNode;
      edNamePerson.SetFocus;
      mdKontakt.Append;
      mdKontakt.FieldByName('personid').AsInteger := maxx;
      mdKontakt.FieldByName('fnode').AsInteger := Integer(FNode);
      mdKontakt.Post;
    end
    else ssMessageDlg(rs(ParentNameEx, 'ErrorContacts'), ssmtError, [ssmbOk]);
  end
  else grdPersonsDblClick(grdPersons);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.aNewAccountExecute(Sender: TObject);
 var
    FNode: TcxTreeListNode;
    maxx: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.aNewAccountExecute') else _udebug := nil;{$ENDIF}

  if (Sender as TComponent).Tag = 0 then begin
    if CheckAccounts then begin
      FNode := tvMain.AddChild(FAccountItem);
      maxx := - GetMaxAbs(mdAccount, 'accid') - 100;
      FNode.Data := pointer(maxx);
      FNode.ImageIndex := 41;
      FNode.SelectedIndex := 41;
      FNode.Values[0] := '';

      if not FAccountItem.Expanded then FAccountItem.Expand(False);

      tvMain.FocusedNode := FNode;
      edAccount.SetFocus;

      mdAccount.Append;
      mdAccount.FieldByName('accid').AsInteger := maxx;
      mdAccount.FieldByName('fnode').AsInteger := Integer(FNode);
      mdAccount.Post;
    end
    else ssMessageDlg(rs(ParentNameEx, 'ErrorAccounts'), ssmtError, [ssmbOk]);
  end
  else grdAccountsDblClick(grdAccounts);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.dbgKAgentAccountDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.dbgKAgentAccountDblClick') else _udebug := nil;{$ENDIF}

  aPropAccount.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  Screen.Cursor := crDefault;
  cbKType.Enabled := (Tag <> 100) and (cbKType.ItemIndex <> bpTypeOurCompany);

  if Tag = 100 then edFIO.SetFocus;

  rbtSSCredit.Enabled := not rbtSSCredit.Enabled;
  rbtSSCredit.Enabled := not rbtSSCredit.Enabled;
  rbtSSDebt.Enabled := not rbtSSDebt.Enabled;
  rbtSSDebt.Enabled := not rbtSSDebt.Enabled;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.chcbKAgentTypePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.chcbKAgentTypePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  TypeModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.tvMainSelectionChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.tvMainSelectionChanged') else _udebug := nil;{$ENDIF}

  if tvMain.FocusedNode.Parent <> FDiscItem then
    case Integer(tvMain.FocusedNode.Data) of
      -1: pcEditKAgent.ActivePage := PageMain;
      -2: pcEditKAgent.ActivePage := PageContact;
      -3: pcEditKAgent.ActivePage := PageAccounts;
      -4: pcEditKAgent.ActivePage := PagePersons;
      -5: pcEditKAgent.ActivePage := PageNotes;
      -6: pcEditKAgent.ActivePage := tsDoc;
      -7: pcEditKAgent.ActivePage := tsDiscounts;
      -8: pcEditKAgent.ActivePage := tsAddInfo;
      else begin
        if tvMain.FocusedNode.Parent=FPersonsItem then begin
          pcEditKAgent.ActivePage := PageEditPerson;
          mdKontakt.Locate('personid', Integer(tvMain.FocusedNode.Data), []);
          gbPersonEdit.Caption := ' ' + tvMain.FocusedNode.Values[0] + ' ';
        end;
        if tvMain.FocusedNode.Parent=FAccountItem then begin
          pcEditKAgent.ActivePage := PageEditAccount;
          mdAccount.Locate('accid', Integer(tvMain.FocusedNode.Data), []);
          gbAccountEdit.Caption := ' ' + tvMain.FocusedNode.Values[0] + ' ';
        end;
      end;
    end
    else begin
      pcEditKAgent.ActivePage := tsDiscount;
      mdDisc.Locate('id', Integer(tvMain.FocusedNode.Data), []);
      gbDiscount.Caption := ' ' + tvMain.FocusedNode.Values[0] + ' ';
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.sbWWWClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.sbWWWClick') else _udebug := nil;{$ENDIF}

  if trim(edWWW.Text) <> '' then ShellExecute(Application.Handle, nil, PChar(edWWW.Text),nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.sbEMailClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.sbEMailClick') else _udebug := nil;{$ENDIF}

  if trim(edEMail.Text) <> '' then ShellExecute(Application.Handle, nil, PChar('mailto:'+edEMail.Text),nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{Процедура получения списка должностей}
//==============================================================================================
procedure  TfrmEditKAgent.GetPost;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.GetPost') else _udebug := nil;{$ENDIF}

  with newDataSet do
    try
      ProviderName := 'pAgentPersons_Posts';
      Open;
      cbPost.Clear;

      if not IsEmpty then begin
        First;
        while not eof do begin
          if Fields.fieldbyname('post').AsString <> '' then cbPost.Properties.Items.Add(Fields.fieldbyname('post').AsString);

          Next;
        end;
      end;
      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.edNamePersonPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.edNamePersonPropertiesChange') else _udebug := nil;{$ENDIF}

  if (tvMain.FocusedNode <> nil) and (Integer(tvMain.FocusedNode.Data) > 0) then begin
    tvMain.FocusedNode.Values[0] := edNamePerson.Text;
    gbPersonEdit.Caption := '  ' + edNamePerson.Text + ' ';
  end;

  if pcEditKAgent.Pages[5].Enabled then begin
    FModified := true;
    PersonsModified := true;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.cbPostPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.cbPostPropertiesChange') else _udebug := nil;{$ENDIF}

  if pcEditKAgent.Pages[5].Enabled then begin
    FModified := true;
    PersonsModified := true;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.edEmailPersonPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.edEmailPersonPropertiesChange') else _udebug := nil;{$ENDIF}

  if pcEditKAgent.Pages[5].Enabled then begin
    FModified := true;
    PersonsModified := true;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.edAccountPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.edAccountPropertiesChange') else _udebug := nil;{$ENDIF}

  if pcEditKAgent.Pages[6].Enabled then begin
    FModified := true;
    AccountModified := true;

    if (tvMain.FocusedNode<>nil) and ((Integer(tvMain.FocusedNode.Data)>0) or (Integer(tvMain.FocusedNode.Data)<=-100))
    then begin
      tvMain.FocusedNode.Values[0] := edAccount.EditingText;
      gbAccountEdit.Caption := ' ' + edAccount.EditingText + ' ';
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.lcbAccountTypePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.lcbAccountTypePropertiesChange') else _udebug := nil;{$ENDIF}

  if (tvMain.FocusedNode <> nil) and (Integer(tvMain.FocusedNode.Data) > 0) then begin
    gbAccountEdit.Caption := '  ' + lcbAccountType.EditText + ' ';
    //lvAccounts.Selected := lvAccounts.Items[tvMain.FocusedNode.Index];
    //lvAccounts.Selected.Caption := ' '+lcbAccountType.EditText;
  end;

  if pcEditKAgent.Pages[6].Enabled then begin
    FModified := true;
    AccountModified := true;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.lcbBankPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.lcbBankPropertiesChange') else _udebug := nil;{$ENDIF}

  if lcbBank.EditText=''
    then txtBankName.Caption := ''
    else begin
      cdsBanks.Locate('bankid', lcbBank.EditValue, []);
      txtBankName.Caption := cdsBanks.fieldbyname('name').AsString;
    end;

  if pcEditKAgent.Pages[6].Enabled=true then begin
    FModified := true;
    AccountModified := true;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.sbAddAccountTypeClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.sbAddAccountTypeClick') else _udebug := nil;{$ENDIF}

  ShowModalByClass(Self, TfrmEditAccountType, 'TfmAccountType', 0, 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.sbAddBankClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.sbAddBankClick') else _udebug := nil;{$ENDIF}

  ShowModalByClass(Self, TfrmEditBank, 'TfmBank', 0, 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.chbNDSPayerClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.chbNDSPayerClick') else _udebug := nil;{$ENDIF}

  if chbNDSPayer.Checked then begin
    //lINN.Enabled := True;
    //edINN.Enabled := True;
    lCertNum.Enabled := True;
    edCertNum.Enabled := True;
  end
  else begin
    //lINN.Enabled := False;
    //edINN.Enabled := False;
    lCertNum.Enabled := False;
    edCertNum.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.grdAccountsDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.grdAccountsDblClick') else _udebug := nil;{$ENDIF}

  tvMain.FocusedNode.Expanded := true;
  tvMain.FocusedNode := pointer(mdAccount.fieldbyname('fnode').AsInteger);
  edAccount.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.grdPersonsDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.grdPersonsDblClick') else _udebug := nil;{$ENDIF}

  tvMain.FocusedNode.Expanded := True;
  tvMain.FocusedNode := pointer(mdKontakt.fieldbyname('fnode').AsInteger);
  edNamePerson.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.cbKTypePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.cbKTypePropertiesChange') else _udebug := nil;{$ENDIF}

  {chbNDSPayer.Visible := (cbKType.ItemIndex <> bpTypeEmployee);
  chbNDSPayerClick(chbNDSPayer);
  lINN.Visible := chbNDSPayer.Visible;
  edINN.Visible := chbNDSPayer.Visible;
  lCertNum.Visible := chbNDSPayer.Visible;
  edCertNum.Visible := chbNDSPayer.Visible;
  }

  chbStartSaldo.Enabled := cbKType.ItemIndex <> bpTypeOurCompany;

  lcbUser.Visible := (cbKType.ItemIndex = bpTypeEmployee);
  lUser.Visible := lcbUser.Visible;
  btnAddUser.Visible := lcbUser.Visible;

  if cbKType.ItemIndex = bpTypeOurCompany then chbStartSaldo.Checked := False;

  if cbKType.ItemIndex in [bpTypeCompany, bpTypeOurCompany]
    then begin
      pcName.ActivePage := tsEnt;
      ResetDoc(True);
    end
    else begin
      pcName.ActivePage := tsPerson;
      ResetDoc(False);
      lJob.Visible := (cbKType.ItemIndex = bpTypeEmployee);
      cbJob.Visible := lJob.Visible;
      rbtDirector.Visible := lJob.Visible;
      rbtBuh.Visible := lJob.Visible;
      rbtOther.Visible := lJob.Visible;
    end;

   case cbKType.ItemIndex of
     bpTypeCompany, bpTypePerson:
       with cbKAKind do begin
         Properties.Items.Clear;
         Properties.Items.Add(rs(ParentNameEx, 'Supplier'));
         Properties.Items.Add(rs(ParentNameEx, 'Client'));
         Properties.Items.Add(rs(ParentNameEx, 'SupplierClient'));
         ItemIndex := 0;
       end;

     bpTypeEmployee:
       with cbKAKind do begin
         Properties.Items.Clear;
         Properties.Items.Add(rs(ParentNameEx, 'Worker'));
         ItemIndex := 0;
         Enabled := False;
       end;

     bpTypeOurCompany:
       with cbKAKind do begin
         Properties.Items.Clear;
         Properties.Items.Add(rs(ParentNameEx, 'OwnEnt'));
         ItemIndex := 0;
         Enabled := False;
       end;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.edOKPOPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.edOKPOPropertiesChange') else _udebug := nil;{$ENDIF}
  FModified := True;
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.tvMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  (*var
    P: TPoint;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.tvMainMouseUp') else _udebug := nil;{$ENDIF}

  if (Button=mbRight) and (tvMain.FocusedNode<>nil) then begin
   P := tvMain.ClientToScreen(Point(X, Y));
   if (tvMain.FocusedNode=FAccountItem) or (tvMain.FocusedNode=FPersonItem) or (Integer(tvMain.FocusedNode.Data)>0)
    then pmTree.Popup(P.X, P.Y);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditKAgent.aNewExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.aNewExecute') else _udebug := nil;{$ENDIF}

  if (tvMain.FocusedNode = FAccountItem) or ((tvMain.FocusedNode.Parent <> nil) and (tvMain.FocusedNode.Parent = FAccountItem))
    then aNewAccount.Execute
    else aNewPerson.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.aDelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.aDelExecute') else _udebug := nil;{$ENDIF}

  if (tvMain.FocusedNode = FAccountItem) or ((tvMain.FocusedNode.Parent <> nil) and (tvMain.FocusedNode.Parent = FAccountItem))
    then aDelAccount.Execute
    else aDelPerson.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.ResetDoc(ADelete: boolean);
  var
    i: integer;
    FNode: TcxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.ResetDoc') else _udebug := nil;{$ENDIF}

  FNode := nil;

  try //finally
    for i := 0 to tvMain.Count - 1 do
      if Integer(tvMain.Items[i].Data) = -6 then FNode := tvMain.Items[i];

    if ADelete and (FNode = nil) then Exit;

    if not ADelete and (FNode <> nil) then Exit;

    if ADelete then begin
      FNode.Free;
    end
    else begin
      FNode := tvMain.Insert(tvMain.Items[1]);
      FNode.Values[0] := rs(ParentNameEx, 'Doc');
      FNode.Data := pointer(-6);
      FNode.SelectedIndex := 68;
      FNode.ImageIndex := 68;
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfrmEditKAgent.GetDocName;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.GetDocName') else _udebug := nil;{$ENDIF}

  with newDataSet do
   try
     ProviderName := 'pAgentDoc_List';
     Open;
     cbDocName.Clear;

     while not Eof do begin
       cbDocName.Properties.Items.Add(fieldbyname('docname').AsString);
       Next;
     end;
     Close;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.btnWWWClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.btnWWWClick') else _udebug := nil;{$ENDIF}

  if trim(edWWW.Text)<>'' then ShellExecute(Application.Handle, nil, PChar(edWWW.Text),nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.btnEMailClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.btnEMailClick') else _udebug := nil;{$ENDIF}

  if trim(edEMail.Text) <> '' then ShellExecute(Application.Handle, nil, PChar('mailto:'+edEMail.Text),nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.btnEMailPersonClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.btnEMailPersonClick') else _udebug := nil;{$ENDIF}

  if trim(edEmailPerson.Text)<>'' then
    ShellExecute(Application.Handle, nil, PChar('mailto:'+edEmailPerson.Text),nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.SetSubID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.SetSubID') else _udebug := nil;{$ENDIF}

  inherited;
  
  if Value > 0 then cbKType.ItemIndex := Value - 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.edCertNumKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.edCertNumKeyUp') else _udebug := nil;{$ENDIF}

  if Key=VK_INSERT then begin
    tvMain.FocusedNode := tvMain.FocusedNode.GetNext;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditKAgent.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.FormKeyDown') else _udebug := nil;{$ENDIF}

  if (ssCtrl in Shift) and (Key in [VK_DOWN, VK_UP]) then begin
    if cbKType.Focused and not cbKType.DroppedDown and (Key = VK_DOWN) then begin
      Key := 0;
      if cbKType.ItemIndex <> bpTypeCompany
        then edFIO.SetFocus
        else edName.SetFocus
    end
    else if chbNDSPayer.Focused then begin
      case Key of
        VK_DOWN : tvMain.FocusedNode := tvMain.FocusedNode.GetNext;
        VK_UP   : Perform(WM_NEXTDLGCTL, 1, 0);
      end;
      Key := 0;
    end
    else if lcbAccountType.Focused and not lcbAccountType.DroppedDown then begin
      case Key of
        VK_DOWN : Perform(WM_NEXTDLGCTL, 0, 0);
        VK_UP   : Perform(WM_NEXTDLGCTL, 1, 0);
      end;
      Key := 0;
    end
    else if lcbBank.Focused and not lcbBank.DroppedDown then begin
      case Key of
        VK_DOWN : tvMain.FocusedNode := tvMain.FocusedNode.GetNext;
        VK_UP   : Perform(WM_NEXTDLGCTL, 1, 0);
      end;
      Key := 0;
    end
    else if cbPost.Focused and not cbPost.DroppedDown then begin
      case Key of
        VK_DOWN : Perform(WM_NEXTDLGCTL, 0, 0);
        VK_UP   : Perform(WM_NEXTDLGCTL, 1, 0);
      end;
      Key := 0;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.edFIOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.edFIOKeyDown') else _udebug := nil;{$ENDIF}

  if ssCtrl in Shift then
    case Key of
      VK_UP   : cbKType.SetFocus;
      VK_DOWN : Perform(WM_NEXTDLGCTL, 0, 0);
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.edCertNumKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.edCertNumKeyDown') else _udebug := nil;{$ENDIF}

  if ssCtrl in Shift then
    case Key of
      VK_UP   : Perform(WM_NEXTDLGCTL, 1, 0);
      VK_DOWN : tvMain.FocusedNode := tvMain.FocusedNode.GetNext;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.edCountryKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.edCountryKeyDown') else _udebug := nil;{$ENDIF}

  if ssCtrl in Shift then
    case Key of
      VK_UP:
        begin
          tvMain.FocusedNode := tvMain.FocusedNode.GetPrev;

          if edCertNum.Enabled
            then edCertNum.SetFocus
            else chbNDSPayer.SetFocus;
        end;

      VK_DOWN : Perform(WM_NEXTDLGCTL, 0, 0);
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.grdAccountsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.grdAccountsKeyDown') else _udebug := nil;{$ENDIF}

  if (ssCtrl in Shift) then
    case Key of
      VK_UP: tvMain.FocusedNode := tvMain.FocusedNode.GetPrev;
      VK_DOWN: tvMain.FocusedNode := tvMain.FocusedNode.GetNext;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.grdPersonsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.grdPersonsKeyDown') else _udebug := nil;{$ENDIF}

  if (ssCtrl in Shift) then
   case Key of
     VK_UP:
       begin
         tvMain.FocusedNode := tvMain.FocusedNode.GetPrev;
         edWWW.SetFocus;
       end;

     VK_DOWN: tvMain.FocusedNode := tvMain.FocusedNode.GetNext;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.edNotesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.edNotesKeyDown') else _udebug := nil;{$ENDIF}

  if (ssCtrl in Shift) then
    case Key of
      VK_UP:   tvMain.FocusedNode := tvMain.FocusedNode.GetPrev;
      VK_DOWN: Perform(WM_NEXTDLGCTL, 0, 0);
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.aBankRefExecute(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.aBankRefExecute') else _udebug := nil;{$ENDIF}

  if FCurrRef=btnAccountRef then begin
    try
      if lcbAccountType.EditText = ''
        then aid := -1
        else aid := cdsAccountType.fieldbyname('typeid').AsInteger;
    except
      aid := 0;
    end;

    lcbAccountType.SetFocus;
    ShowModalRef(Self, rtAccountType, vtAccountType, 'TfmAccountType', Self.OnDate, aid);
  end
  else if FCurrRef=btnBankRef then begin
    try
      aid := cdsBanks.fieldbyname('bankid').AsInteger;
    except
      aid := 0;
    end;

    lcbBank.SetFocus;
    ShowModalRef(Self, rtBank, vtBank, 'TfmBank', Self.OnDate, aid);
  end
  else if edMat.Focused then aMatRef.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.btnAccountRefMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.btnAccountRefMouseDown') else _udebug := nil;{$ENDIF}

  FCurrRef := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.btnAccountRefMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.btnAccountRefMouseUp') else _udebug := nil;{$ENDIF}

  FCurrRef := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.lcbAccountTypeEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.lcbAccountTypeEnter') else _udebug := nil;{$ENDIF}

  FCurrRef := btnAccountRef;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.lcbBankEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.lcbBankEnter') else _udebug := nil;{$ENDIF}

  FCurrRef := btnBankRef;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.lcbBankExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.lcbBankExit') else _udebug := nil;{$ENDIF}

  FCurrRef := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.chbUseDiscountClick(Sender: TObject);
  var
    FEn: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.chbUseDiscountClick') else _udebug := nil;{$ENDIF}

  FEn := chbUseDiscount.Checked;
  chbDiscAll.Enabled := FEn;
  grdDisc.Enabled := FEn;
  grdDisc.Invalidate;
  chbDiscCustom.Enabled := FEn;
  chbDiscAllClick(chbDiscAll);
  chbDiscCustomClick(chbDiscCustom);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.grdDiscCustomDrawColumnHeader(Sender: TObject; AColumn: TdxTreeListColumn; ACanvas: TCanvas; ARect: TRect; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ASorted: TdxTreeListColumnSort; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.grdDiscCustomDrawColumnHeader') else _udebug := nil;{$ENDIF}

  if not grdDisc.Enabled then AFont.Color := clBtnShadow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.chbDiscAllClick(Sender: TObject);
  var
    FEn: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.chbDiscAllClick') else _udebug := nil;{$ENDIF}

  FEn := chbDiscAll.Checked;
  edDiscAll.Enabled := FEn and chbDiscAll.Enabled;
  lDiscAllPercent.Enabled := FEn and chbDiscAll.Enabled;
  grdDisc.Enabled := chbDiscAll.Enabled and chbDiscCustom.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.aDiscAddExecute(Sender: TObject);
  var
    FNode: TcxTreeListNode;
    maxx: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.aDiscAddExecute') else _udebug := nil;{$ENDIF}

  if (Sender as TComponent).Tag = 0 then begin
    if CheckDisc then begin
      FNode := tvMain.AddChild(FDiscItem);

      FDiscItem.Expand(False);
      //maxx := GetMax(mdKontakt, 'personid')+1;
      //FNode.Data := pointer(maxx);

      if cbType.ItemIndex = 1 then begin
        FNode.ImageIndex := 48;
        FNode.SelectedIndex := 48;
      end
      else begin
        FNode.ImageIndex := 14;
        FNode.SelectedIndex := 14;
      end;

      FNode.Values[0] := '';
      gbDiscount.Caption := '';
      tvMain.FocusedNode := FNode;
      cbType.SetFocus;
      mdDisc.Append;
      mdDisc.FieldByName('id').AsInteger := 0;
      mdDisc.FieldByName('mtype').AsInteger := cbType.ItemIndex;
      mdDisc.FieldByName('onvalue').AsFloat := 0;
      mdDisc.FieldByName('fnode').AsInteger := Integer(FNode);
      mdDisc.Post;
    end
    else ssMessageDlg(rs(ParentNameEx, 'EmptyDiscError'), ssmtError, [ssmbOk]);
  end
  else grdDiscDblClick(grdDisc);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.aDiscDelExecute(Sender: TObject);
  var
    FNode: Pointer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.aDiscDelExecute') else _udebug := nil;{$ENDIF}

  if ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FNode := Pointer(mdDisc.FieldByName('fnode').AsInteger);
  mdDisc.Delete;
  tvMain.FocusedNode := TcxTreeListNode(FNode).GetPrev;
  TcxTreeListNode(FNode).Free;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditKAgent.CheckDisc: Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.CheckDisc') else _udebug := nil;{$ENDIF}

  Result := (mdDisc.FieldByName('id').AsInteger <> 0) or mdDisc.IsEmpty;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.cbTypePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.cbTypePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if cbType.ItemIndex = 0 then begin
    btnMatRef.Hint := rs(ParentNameEx, 'MatRef');
    lMat.Caption := rs(ParentNameEx, 'Mat') + ':';
  end
  else begin
    btnMatRef.Hint := rs(ParentNameEx, 'MatGrpRef');
    lMat.Caption := rs(ParentNameEx, 'MatGrp') + ':';
  end;

  if tvMain.FocusedNode.Parent = FDiscItem then
    with tvMain.FocusedNode do
      if cbType.ItemIndex = 0 then begin
        if grdDisc.Enabled then begin
          ImageIndex := 14;
          SelectedIndex := 14;
        end;

        btnMatRef.ImageIndex := 22;
      end
      else begin
        if grdDisc.Enabled then begin
          ImageIndex := 48;
          SelectedIndex := 48;
        end;

        btnMatRef.ImageIndex := 23;
      end;

  if DiscCanPost and (tvMain.FocusedNode.Parent = FDiscItem)
    then try
      DiscCanChange := False;

      with tvMain.FocusedNode do
        if cbType.ItemIndex = 0 then begin
          ImageIndex := 14;
          SelectedIndex := 14;
          lMat.Caption := rs(ParentNameEx, 'Mat');
          btnMatRef.ImageIndex := 22;
          TmpGrpName := mdDisc.FieldByName('name').AsString;
          TmpGrpID := mdDisc.FieldByName('id').AsInteger;
          edMat.Text := TmpMatName;
          tvMain.FocusedNode.Values[0] := '(' + edMatDiscPercent.EditText + '%) ' + TmpMatName;
          tvMain.FocusedNode.Data := Pointer(TmpMatID);
        end
        else begin
          ImageIndex := 48;
          SelectedIndex := 48;
          lMat.Caption := rs(ParentNameEx, 'MatGrp');
          btnMatRef.ImageIndex := 23;
          TmpMatName := mdDisc.FieldByName('name').AsString;
          TmpMatArt := mdDisc.FieldByName('artikul').AsString;
          TmpMatID := mdDisc.FieldByName('id').AsInteger;
          edMat.Text := TmpGrpName;
          tvMain.FocusedNode.Values[0] := '(' + edMatDiscPercent.EditText + '%) ' + TmpGrpName;
          tvMain.FocusedNode.Data := Pointer(TmpGrpID);
        end;

      if not mdDisc.IsEmpty then begin
        mdDisc.Edit;
        mdDisc.FieldByName('mtype').AsInteger := cbType.ItemIndex;

        if cbType.ItemIndex = 0 then begin
          mdDisc.FieldByName('id').AsInteger := TmpMatID;
          mdDisc.FieldByName('name').AsString := TmpMatName;
          mdDisc.FieldByName('artikul').AsString := TmpMatArt;
        end
        else begin
          mdDisc.FieldByName('id').AsInteger := TmpGrpID;
          mdDisc.FieldByName('name').AsString := TmpGrpName;
          mdDisc.FieldByName('artikul').AsString := TmpGrpName;
        end;
        mdDisc.Post;
      end;

      gbDiscount.Caption := ' ' + tvMain.FocusedNode.Values[0] + ' ';

    finally
      DiscCanChange := True;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.aMatRefExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.aMatRefExecute') else _udebug := nil;{$ENDIF}

  if cbType.ItemIndex = 0
    then ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, mdDisc.fieldbyname('id').AsInteger)
    else ShowModalRef(Self, rtMatGroup, vtMatGroup, 'TfmMatGroup', Self.OnDate, -mdDisc.fieldbyname('id').AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.edMatDiscPercentPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.edMatDiscPercentPropertiesChange') else _udebug := nil;{$ENDIF}

  if DiscCanPost then
    try
      DiscCanChange := False;
      mdDisc.Edit;

      try
        mdDisc.FieldByName('onvalue').AsFloat := StrToFloat(edMatDiscPercent.EditText);
      except
        mdDisc.FieldByName('onvalue').AsFloat := 0;
      end;

      mdDisc.Post;
      tvMain.FocusedNode.Values[0] := '(' + edMatDiscPercent.EditText + '%) ' + edMat.Text;
      gbDiscount.Caption := ' ' + tvMain.FocusedNode.Values[0] + ' ';

    finally
      DiscCanChange := True;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.grdDiscDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.grdDiscDblClick') else _udebug := nil;{$ENDIF}

  tvMain.FocusedNode.Expanded := True;
  tvMain.FocusedNode := pointer(mdDisc.fieldbyname('fnode').AsInteger);
  cbType.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.srcDiscDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.srcDiscDataChange') else _udebug := nil;{$ENDIF}

  if DiscCanChange then
    try
      DiscCanPost := False;
      if mdDisc.FieldByName('id').AsInteger <> 0 then cbType.ItemIndex := mdDisc.fieldbyname('mtype').AsInteger;
      edMat.Text := mdDisc.fieldbyname('name').AsString;
      edMatDiscPercent.Value := mdDisc.fieldbyname('onvalue').AsFloat;

    finally
      DiscCanPost := True;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.cbTypeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.cbTypeKeyDown') else _udebug := nil;{$ENDIF}

  if (ssCtrl in Shift) then begin
    case Key of
      VK_UP: tvMain.FocusedNode := tvMain.FocusedNode.GetPrev;
      VK_DOWN: Perform(WM_NEXTDLGCTL, 0, 0);
    end;
    Key := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.edMatDiscPercentKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.edMatDiscPercentKeyDown') else _udebug := nil;{$ENDIF}

  if (ssCtrl in Shift) then
    case Key of
      VK_UP: Perform(WM_NEXTDLGCTL, 1, 0);
      VK_DOWN:
        begin
          if tvMain.FocusedNode.GetNext <> nil
            then tvMain.FocusedNode := tvMain.FocusedNode.GetNext
            else Perform(WM_NEXTDLGCTL, 0, 0);
        end;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  txtLang.Caption := keyboardIndicator;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.FormDestroy') else _udebug := nil;{$ENDIF}

  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'FindField', cbFindField.ItemIndex);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditKAgent.MatInfo(AID: Integer; var AArtikul: string): string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.MatInfo') else _udebug := nil;{$ENDIF}

  Result := '';
  with newDataSet do
    try
      ProviderName := 'pMaterials_Get';
      FetchParams;
      Params.ParamByName('matid').AsInteger := AID;
      Open;
      Result := FieldByName('name').AsString;
      AArtikul := FieldByName('artikul').AsString;
      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.DoFind;
  var
    FNode: TdxTreeListNode;
    FName: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.DoFind') else _udebug := nil;{$ENDIF}

  inherited;

  if FindStr <> edFind.EditingText then FindIndex := -1;

  FindStr := edFind.EditingText;

  if edFind.EditingText = '' then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if cbFindField.ItemIndex = 0
    then FName := 'name'
    else FName := 'artikul';

  FNode := FindNode(grdDisc, FName, edFind.EditingText, ltBegin, FindIndex);

  if FNode <> nil then begin
    FindIndex := FNode.Index;
    mdDisc.Locate('id', FNode.Values[colDiscID.Index], []);
  end
  else ssMessageDlg(rs('Common', 'FindError') + ',' + #13#10 + rs('Common', 'DSEnd'), ssmtInformation, [ssmbOk]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.edFindPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.edFindPropertiesChange') else _udebug := nil;{$ENDIF}

  DoFind;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.edFindKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.edFindKeyPress') else _udebug := nil;{$ENDIF}

  if Key = #13 then begin
    Key := #0;
    grdDisc.SetFocus;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.grdDiscKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.grdDiscKeyDown') else _udebug := nil;{$ENDIF}

  if (Key = 13) and (grdDisc.Count > 0) then begin
    Key := 0;
    grdDiscDblClick(grdDisc);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.colDiscOnValueGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.colDiscOnValueGetText') else _udebug := nil;{$ENDIF}

  AText := AText + '%';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditKAgent.CheckDiscounts: Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.CheckDiscounts') else _udebug := nil;{$ENDIF}

  Result := True;
  with mdDisc do begin
    First;
    while not Eof do begin
      if (FieldByName('id').AsInteger = 0) then begin
        Result := False;
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;
      Next;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.chbDiscCustomClick(Sender: TObject);
  var
    FEn: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.chbDiscCustomClick') else _udebug := nil;{$ENDIF}

  FEn := chbDiscCustom.Checked and chbUseDiscount.Checked;
  grdDisc.Enabled := FEn;
  cbType.Enabled := FEn;
  edMat.Enabled := FEn;
  edMatDiscPercent.Enabled := FEn;
  btnMatRef.Enabled := FEn;
  lMatDisc.Enabled := FEn;
  lMat.Enabled := FEn;
  lMatType.Enabled := FEn;
  lFindBy.Enabled := FEn;

  if FEn
    then txtLang.Font.Color := clWindowText
    else txtLang.Font.Color := clBtnShadow;

  edFind.Enabled := FEn;
  cbFindField.Enabled := FEn;
  btnFind.Enabled := FEn;
  grdDisc.Invalidate;
  SetDiscImages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.btnDiscLevelUpClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.btnDiscLevelUpClick') else _udebug := nil;{$ENDIF}

  tvMain.FocusedNode := tvMain.FocusedNode.Parent;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.gbAccountEditMouseEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.gbAccountEditMouseEnter') else _udebug := nil;{$ENDIF}

  with (Sender as TssGroupBox) do begin
    if HotTrack then bvlAccountSep.ColorInner := HotTrackColor;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.gbAccountEditMouseLeave(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.gbAccountEditMouseLeave') else _udebug := nil;{$ENDIF}

  with (Sender as TssGroupBox) do begin
    if HotTrack then bvlAccountSep.ColorInner := clBtnShadow;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.gbPersonEditMouseEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.gbPersonEditMouseEnter') else _udebug := nil;{$ENDIF}

  with (Sender as TssGroupBox) do begin
    if HotTrack then bvlPersonSep.ColorInner := HotTrackColor;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.gbPersonEditMouseLeave(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.gbPersonEditMouseLeave') else _udebug := nil;{$ENDIF}

  with (Sender as TssGroupBox) do begin
    if HotTrack then bvlPersonSep.ColorInner := clBtnShadow;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.gbDiscountMouseLeave(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.gbDiscountMouseLeave') else _udebug := nil;{$ENDIF}

  with (Sender as TssGroupBox) do begin
    if HotTrack then bvlDiscSep.ColorInner := clBtnShadow;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.gbDiscountMouseEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.gbDiscountMouseEnter') else _udebug := nil;{$ENDIF}

  with (Sender as TssGroupBox) do begin
    if HotTrack then bvlDiscSep.ColorInner := HotTrackColor;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.colDiscTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.colDiscTypeGetText') else _udebug := nil;{$ENDIF}

  if not grdDisc.Enabled then
    if (AText = '1')
      then AText := '2'
      else if (AText = '0') then AText := '3';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.grdDiscCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.grdDiscCustomDrawCell') else _udebug := nil;{$ENDIF}

  if not grdDisc.Enabled then AFont.Color := clBtnShadow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.SetDiscImages;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.SetDiscImages') else _udebug := nil;{$ENDIF}

  for i := 0 to FDiscItem.Count - 1 do begin
    if grdDisc.Enabled then
      case FDiscItem.Items[i].ImageIndex of
        94:
          begin
            FDiscItem.Items[i].ImageIndex := 48;
            FDiscItem.Items[i].SelectedIndex := 48;
          end;

        74:
          begin
            FDiscItem.Items[i].ImageIndex := 14;
            FDiscItem.Items[i].SelectedIndex := 14;
          end;
      end
    else
      case FDiscItem.Items[i].ImageIndex of
        48:
          begin
            FDiscItem.Items[i].ImageIndex := 94;
            FDiscItem.Items[i].SelectedIndex := 94;
          end;

        14:
          begin
            FDiscItem.Items[i].ImageIndex := 74;
            FDiscItem.Items[i].SelectedIndex := 74;
          end;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.tvMainCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
  var
    R: TRect;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.tvMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  if (AViewInfo.Node.Parent = FDiscItem) and not grdDisc.Enabled and not AViewInfo.Selected
  then
    with ACanvas do begin
      Brush.Color := clWindow;
      FillRect(AViewInfo.ContentRect);
      Font.Color := clBtnShadow;
      R := AViewInfo.EditRect;
      R.Left := R.Left + 1;
      DrawTexT(AViewInfo.Node.Values[0], R, DT_CENTER or DT_SINGLELINE);
      ADone := True;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.cbKAKindKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.cbKAKindKeyPress') else _udebug := nil;{$ENDIF}

  if Key = #13 then begin
    Key := #0;
    if not (cbKType.ItemIndex in [bpTypeCompany, bpTypeOurCompany])
      then edFIO.SetFocus
      else edName.SetFocus;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.GetJobs;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.GetJobs') else _udebug := nil;{$ENDIF}

  with newDataSet.Create(nil) do
    try
      ProviderName := 'pKA_GetJob';
      Open;
      cbJob.Properties.Items.Clear;

      while not Eof do begin
        if Trim(FieldByName('job').AsString) <> '' then cbJob.Properties.Items.Add(FieldByName('job').AsString);
        Next;
      end;
      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.DoCustom(AParam: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.DoCustom') else _udebug := nil;{$ENDIF}

  inherited;
  //cbKAKind.ItemIndex := AParam;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.btnEMainPersonClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.btnEMainPersonClick') else _udebug := nil;{$ENDIF}

  if Trim(edEmailPerson.Text) <> '' then ShellExecute(Application.Handle, nil, PChar('mailto:' + edEmailPerson.Text), nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.chbStartSaldoClick(Sender: TObject);
  var
    FEn: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.chbStartSaldoClick') else _udebug := nil;{$ENDIF}

  FEn := chbStartSaldo.Checked;
  lStartSaldo.Enabled := FEn;
  edStartSaldo.Enabled := FEn;
  lStartSaldoDate.Enabled := FEn;
  edStartSaldoDate.Enabled := FEn;
  rbtSSDebt.Enabled := FEn;
  rbtSSCredit.Enabled := FEn;

  if FEn
    then stStartSaldoCurr.Font.Color := clMaroon
    else stStartSaldoCurr.Font.Color := clBtnShadow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.cbKAKindPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.cbKAKindPropertiesChange') else _udebug := nil;{$ENDIF}

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.cbKAKindPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.cbKAKindPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if Self.Visible then LastKAKind := cbKAKind.ItemIndex;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.cbKTypePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.cbKTypePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if Self.Visible then LastKAKType := cbKType.ItemIndex;
  panAutoNum.Visible := (cbKType.ItemIndex = bpTypeOurCompany);
  edNamePropertiesChange(edName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.btnBallanceClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.btnBallanceClick') else _udebug := nil;{$ENDIF}

  if not ShowBallance then begin
    AccessDenied;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if FID <= 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmKATurnover.Create(nil) do
    try
      ParentNameEx := 'fmKAgent';
      OnDate := Self.OnDate;
      ID := Self.FID;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.rbtBuhClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.rbtBuhClick') else _udebug := nil;{$ENDIF}

  cbJob.Enabled := rbtOther.Checked;

  if rbtOther.Checked then begin
    if cbJob.ItemIndex <> -1 then cbJob.Text := cbJob.Properties.Items[cbJob.ItemIndex];
  end
  else cbJob.Text := '';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.mdAccountFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.mdAccountFilterRecord') else _udebug := nil;{$ENDIF}

  Accept := DataSet.FieldByName('deleted').AsInteger <> 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.rbtPDirClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.rbtPDirClick') else _udebug := nil;{$ENDIF}

  cbPost.Enabled := rbtPOther.Checked;

  if rbtPOther.Checked then begin
    if cbPost.ItemIndex <> -1 then cbPost.Text := cbPost.Properties.Items[cbPost.ItemIndex];
  end
  else cbPost.Text := '';

  if CCanPost then begin
    CCanChange := False;
    mdKontakt.Edit;

    if rbtPDir.Checked
      then mdKontakt.FieldByName('jobtype').AsInteger := 0
      else if rbtPBuh.Checked
        then mdKontakt.FieldByName('jobtype').AsInteger := 1
        else mdKontakt.FieldByName('jobtype').Clear;

    mdKontakt.Post;
    CCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.dsKontaktDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.dsKontaktDataChange') else _udebug := nil;{$ENDIF}

  if CCanChange then begin
    CCanPost := False;

    if mdKontakt.FieldByName('jobtype').IsNull then rbtPOther.Checked := True
    else if mdKontakt.FieldByName('jobtype').AsInteger = 0 then rbtPDir.Checked := True
    else if mdKontakt.FieldByName('jobtype').AsInteger = 1 then rbtPBuh.Checked := True;

    CCanPost := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.colPostGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.colPostGetText') else _udebug := nil;{$ENDIF}

  if not VarIsNull(ANode.Values[colJobType.Index])
    then case VarToInt(ANode.Values[colJobType.Index]) of
      0: AText := rs('fmKAgent', 'Director');
      1: AText := rs('fmKAgent', 'Buh');
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.lcbBankPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.lcbBankPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  cdsBanks.Locate('bankid', lcbBank.EditValue, []);
  txtBankName.Caption := cdsBanks.fieldbyname('name').AsString;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.edNamePropertiesChange(Sender: TObject);
  var
    strTemp: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.edNamePropertiesChange') else _udebug := nil;{$ENDIF}

  if ID = 0
    then strTemp := rs(ParentNameEx, 'TitleAdd') + ': '
    else strTemp := rs(ParentNameEx, 'TitleEdit') + ': ';

  if pcName.ActivePage = tsEnt
    then strTemp := strTemp + edName.EditingText
    else strTemp := strTemp + edFIO.EditingText;

  panTitleBar.Caption := strTemp;
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.btnCopyAddrClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.btnCopyAddrClick') else _udebug := nil;{$ENDIF}

  edFCountry.Text := edCountry.Text;
  edFDistrict.Text := edDistrict.Text;
  edFAddr.Text := edAddress.Text;
  edFCity.Text := edCity.Text;
  edFIndex.Text := edIndex.Text;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.cdsUsersCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.cdsUsersCalcFields') else _udebug := nil;{$ENDIF}

  with DataSet do
    FieldByName('fname').AsString := FieldByName('name').AsString + ' (' + FieldByName('fullname').AsString + ')';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.chbWBOutAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.chbWBOutAutoNumClick') else _udebug := nil;{$ENDIF}

  lWBOutPrefix.Enabled := chbWBOutAutoNum.Checked;
  edWBOutPrefix.Enabled := chbWBOutAutoNum.Checked;
  lWBOutSuffix.Enabled := chbWBOutAutoNum.Checked;
  edWBOutSuffix.Enabled := chbWBOutAutoNum.Checked;
  lWBOutCurrNum.Enabled := chbWBOutAutoNum.Checked;
  edWBOutCurrNum.Enabled := chbWBOutAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.chbAOAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.chbAOAutoNumClick') else _udebug := nil;{$ENDIF}

  lAOPrefix.Enabled := chbAOAutoNum.Checked;
  edAOPrefix.Enabled := chbAOAutoNum.Checked;
  lAOSuffix.Enabled := chbAOAutoNum.Checked;
  edAOSuffix.Enabled := chbAOAutoNum.Checked;
  lAOCurrNum.Enabled := chbAOAutoNum.Checked;
  edAOCurrNum.Enabled := chbAOAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.chbInvAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.chbInvAutoNumClick') else _udebug := nil;{$ENDIF}

  lInvPrefix.Enabled := chbInvAutoNum.Checked;
  edInvPrefix.Enabled := chbInvAutoNum.Checked;
  lInvSuffix.Enabled := chbInvAutoNum.Checked;
  edInvSuffix.Enabled := chbInvAutoNum.Checked;
  lInvCurrNum.Enabled := chbInvAutoNum.Checked;
  edInvCurrNum.Enabled := chbInvAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.chbOrdAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.chbOrdAutoNumClick') else _udebug := nil;{$ENDIF}

  lOrdPrefix.Enabled := chbOrdAutoNum.Checked;
  edOrdPrefix.Enabled := chbOrdAutoNum.Checked;
  lOrdSuffix.Enabled := chbOrdAutoNum.Checked;
  edOrdSuffix.Enabled := chbOrdAutoNum.Checked;
  lOrdCurrNum.Enabled := chbOrdAutoNum.Checked;
  edOrdCurrNum.Enabled := chbOrdAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAgent.btnAddUserClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAgent.btnAddUserClick') else _udebug := nil;{$ENDIF}

  with TfrmUsersEdit.Create(nil) do
  try
    ParentNameEx := 'fmUsers';
    id := -1;
    setFullName(trim(edFIO.text));
    if ShowModal <> mrCancel then begin
      with cdsUsers do begin
        if Active then Close;
        Open;
        Locate('name', getLogin, []);
        lcbUser.Keyvalue := FieldByname('userid').asInteger;
      end;
    end;

  except
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditKAgent', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
