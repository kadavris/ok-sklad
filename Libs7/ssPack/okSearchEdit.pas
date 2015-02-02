{$IFNDEF PKG}
{$I ok_sklad.inc}
{$ENDIF}
unit okSearchEdit;

interface

uses
  cxTextEdit, StdCtrls, Graphics, ssLabel, DB,
  ssSpeedButton, TB2Toolbar, TB2Item, Windows, TBSkinPlus, SConnect, Messages,
  ssClientDataSet, Forms, xLngManager, Menus, ssBaseConst, okClasses, cxEdit,
  ssDBLookupCombo, okEditors,
  cxDropDownEdit,
  dxDBCtrl6, dxTL6, dxDBGrid6,
  SysUtils, Classes, Controls, dialogs;

const
  ok_clHotBorder = $206B2408;
  ok_clHotTrack = $20D6BEB5;

  ok_EditOffset = 80;

  OK_II_SCANNER = 50;

type
  TokSearchType = (stBegin, stConcurr, stSubstr);
  TokSearchViewMode = (vmSearch, vmList);
  TokShowButtonsType = (sbtShow, sbtHide, sbtOnlyRef, sbtNoRef);

  TokMatSearchEdit = class;
  TokSvcSearchEdit = class;
  TokKASearchEdit = class;
  TokOrderSearchEdit = class;

  TokSearchEditState = (oseFound, oseRevert, oseFail);

  //-------------------------------------------------------------------------------
  TokSearchEdit = class(TCustomControl)
    private
      FbtnFindParams: TssSpeedButton;
      FbtnRef: TssSpeedButton;
      FCapContextFind: TCaption;
      FCapFind: TCaption;
      FCapFindBegin: TCaption;
      FCapFindConcurr: TCaption;
      FCapFindParams: TCaption;
      FCapFindSubstr: TCaption;
      FCapRef: TCaption;
      FContextFind: Boolean;
      FContextFindItem: TTBItem;
      FCurrentSearchIndex: Integer;
      FDisabledImages: TImageList;
      FEditMode: Boolean;
      FEditorOffset: Cardinal;
      FFindBeginItem: TTBItem;
      FFindConcurrItem: TTBItem;
      FFindSubstrItem: TTBItem;
      FGoNextOnEnter: Boolean;
      FImages: TImageList;
      FLangManager: TxLngManager;
      FLastIDShortCut: TShortCut;
      FlName: TssLabel;
      FLng: TssLabel;
      FLocked: Boolean;
      FOnChange: TNotifyEvent;
      FOnEditorChange: TNotifyEvent;
      FOnEndSearch: TNotifyEvent;
      FOnFailSearch: TNotifyEvent;
      FOnKeyDown: TKeyEvent;
      FOnRefButtonClick: TNotifyEvent;
      FOnStartSearch: TNotifyEvent;
      FOnTypeChanged: TNotifyEvent;
      FPopup: TTBPopupMenu;
      FRefShortCut: TShortCut;
      FRemoteServer: TSocketConnection;
      FSearchNames: TStringList;
      FsearchState: TokSearchEditState;
      FSearchType: TokSearchType;
      FShowButtons: TokShowButtonsType;
      FShowCaptions: Boolean;
      FShowLng: Boolean;
      FViewMode: TokSearchViewMode;

      procedure SetShowLng(const Value: Boolean);
      procedure SetEditorOffset(const Value: Cardinal);
      procedure SetImages(const Value: TImageList);
      procedure SetDisabledImages(const Value: TImageList);
      function GetImageIndexFind: Integer;
      function GetImageIndexFindParams: Integer;
      function GetImageIndexRef: Integer;
      procedure SetImageIndexFind(const Value: Integer);
      procedure SetImageIndexFindParams(const Value: Integer);
      procedure SetImageIndexRef(const Value: Integer);
      procedure SetSearchNames(const Value: TStringList);
      procedure FindParamsClick(Sender: TObject);
      procedure ContextFindClick(Sender: TObject);
      procedure FindClick(Sender: TObject);
      procedure EditChange(Sender: TObject);

      function GetSkin: TTBBaseSkin;
      procedure SetSkin(const Value: TTBBaseSkin);
      procedure SetCapFind(const Value: TCaption);
      procedure SetCapFindParams(const Value: TCaption);
      procedure SetCapRef(const Value: TCaption);
      procedure SetCapContextFind(const Value: TCaption);
      procedure SetCapFindBegin(const Value: TCaption);
      procedure SetCapFindConcurr(const Value: TCaption);
      procedure SetCapFindSubstr(const Value: TCaption);
      procedure SetSearchType(const Value: TokSearchType);
      procedure SetGoNextOnEnter(const Value: Boolean);
      procedure SetLangManager(const Value: TxLngManager);
      function GetButtonLeftMargin: Integer;
      procedure SetButtonsLeftMargin(const Value: Integer);
      procedure SetShowButtons(const Value: TokShowButtonsType);
      procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
      procedure WMRefresh(var M: TMessage); message WM_REFRESH;
      procedure SetEditMode(const Value: Boolean);
      function GetText: string;
      procedure SetText(const Value: string);
      function GetSC: TcxEditStyleController;
      procedure SetSC(const Value: TcxEditStyleController);
      procedure SetShowCaptions(const Value: Boolean);

    protected
      FBSPressed: Boolean;
      FcdsFind: TssClientDataSet;
      FCombo: TssDBLookupCombo;
      FEdit: TokTextEdit;
      FFindStr: string;
      FItemsDS: TssClientDataSet;
      FItemsSrc: TDataSource;
      FLastID: Integer;
      FLockFind: Boolean;
      FModified: Boolean;
      FParentCtrl: TWinControl;
      FPrevFindStr: string;
      FPrevFindText: string;

      procedure SetCurrentSearchIndex(const Value: Integer); virtual;
      procedure IDChanged(const Value: Integer); virtual;
      procedure SetEnabled(Value: Boolean); override;
      procedure DoSearch(AForward: Boolean); virtual;
      procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState); virtual;
      procedure EditKeyPress(Sender: TObject; var Key: Char); virtual;
      procedure ComboKeyPress(Sender: TObject; var Key: Char); virtual;
      procedure FindNameClick(Sender: TObject); virtual;
      procedure RefButtonClick(Sender: TObject); virtual;
      procedure SetRemoteServer(const Value: TSocketConnection); virtual;
      procedure DoError; virtual;
      procedure ComboChange(Sender: TObject); virtual;
      procedure SetViewMode(const Value: TokSearchViewMode); virtual;
      function  GetID: Integer; virtual;
      procedure SetID(const Value: Integer); virtual;

      property ViewMode: TokSearchViewMode read FViewMode write SetViewMode default vmSearch;

    public
      FbtnFind: TssSpeedButton;

      procedure AdjustCtrls; virtual;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure InitRes; virtual;
      procedure Loaded; override;
      procedure ResetPopup;
      procedure SetLng;
      procedure ShowRef;
      procedure SaveToRegistry(const ARegPath: string);
      procedure LoadFromRegistry(const ARegPath: string);
      procedure findAgain; virtual;

      property Editor: TokTextEdit read FEdit;
      property Combo: TssDBLookupCombo read FCombo;
      property Locked: Boolean read FLocked;
      property Caption: TssLabel read FlName;
      property CurrentSearchIndex: Integer read FCurrentSearchIndex write SetCurrentSearchIndex default -1;

      property ID: Integer read GetID write SetID;
      property LastID: Integer read FLastID;
      property searchState: TokSearchEditState read FSearchState;

    published
      property Anchors;
      property ButtonsLeftMargin: Integer read GetButtonLeftMargin write SetButtonsLeftMargin;
      property Color;

      property CapFind: TCaption read FCapFind write SetCapFind;
      property CapFindParams: TCaption read FCapFindParams write SetCapFindParams;
      property CapRef: TCaption read FCapRef write SetCapRef;
      property CapContextFind: TCaption read FCapContextFind write SetCapContextFind;
      property CapFindBegin: TCaption read FCapFindBegin write SetCapFindBegin;
      property CapFindConcurr: TCaption read FCapFindConcurr write SetCapFindConcurr;
      property CapFindSubstr: TCaption read FCapFindSubstr write SetCapFindSubstr;

      property EditMode: Boolean read FEditMode write SetEditMode default False;
      property EditorOffset: Cardinal read FEditorOffset write SetEditorOffset default ok_EditOffset;
      property Font;
      property DisabledImages: TImageList read FDisabledImages write SetDisabledImages;
      property Enabled;
      property GoNextOnEnter: Boolean read FGoNextOnEnter write SetGoNextOnEnter default True;
      property Images: TImageList read FImages write SetImages;
      property ImageIndexRef: Integer read GetImageIndexRef write SetImageIndexRef default 0;
      property ImageIndexFind: Integer read GetImageIndexFind write SetImageIndexFind default 0;
      property ImageIndexFindParams: Integer read GetImageIndexFindParams write SetImageIndexFindParams default 0;
      property LangManager: TxLngManager read FLangManager write SetLangManager;
      property ParentColor;
      property RefShortCut: TShortCut read FRefShortCut write FRefShortCut default 16429;
      property LastIDShortCut: TShortCut read FLastIDShortCut write FLastIDShortCut default 16460;
      property RemoteServer: TSocketConnection read FRemoteServer write SetRemoteServer;
      property ShowHint;
      property ShowCaptions: Boolean read FShowCaptions write SetShowCaptions default True;
      property ShowLng: Boolean read FShowLng write SetShowLng default True;
      property ShowButtons: TokShowButtonsType read FShowButtons write SetShowButtons default sbtShow;
      property SearchNames: TStringList read FSearchNames write SetSearchNames;
      property SearchType: TokSearchType read FSearchType write SetSearchType;
      property Skin: TTBBaseSkin read GetSkin write SetSkin;
      property StyleController: TcxEditStyleController read GetSC write SetSC;
      property TabOrder;
      property TabStop;
      property Text: string read GetText write SetText;

      property OnChange: TNotifyEvent read FOnChange write FOnChange;
      property OnFailSearch: TNotifyEvent read FOnFailSearch write FOnFailSearch;
      property OnKeyDown: TKeyEvent read FOnKeyDown write FOnKeyDown;
      property OnStartSearch: TNotifyEvent read FOnStartSearch write FOnStartSearch;
      property OnEditorChange: TNotifyEvent read FOnEditorChange write FOnEditorChange;
      property OnEndSearch: TNotifyEvent read FOnEndSearch write FOnEndSearch;
      property OnEnter;
      property OnExit;
      property OnRefButtonClick: TNotifyEvent read FOnRefButtonClick write FOnRefButtonClick;
      property OnTypeChanged: TNotifyEvent read FOnTypeChanged write FOnTypeChanged;
  end;

  //-------------------------------------------------------------------------------
  TokMatSearchEdit = class(TokSearchEdit)
    private
      FAllowZeroRest: Boolean; // zero quantity allowed in search results
      FArtikul: string;
      FBarCode: string;
      FCountry: string;
      FGrpName: string;
      FIsSerial: Boolean;
      FLoadNDS: Boolean;
      FLoadTaxes: Boolean;
      FMatID: Integer;
      FMatName: string;
      FMeasure: string;
      FNDS: Extended;
      FOnWeightChanged: TNotifyEvent;
      FProducer: string;
      FScannerImageIndex: Integer;
      FScannerRect: TRect;
      FTaxes: TssClientDataSet;
      FWareHouses: String; // comma separated allowed warehouse IDs list
      FWeight: Extended;
      FWID: Integer;

      function GetMatCode(S: string): string;
      function GetWeight(S: string): Extended;
      procedure GetNDS;
      procedure GetTaxes;
      procedure SetMatID(const Value: Integer);
      procedure SetScannerImageIndex(const Value: Integer);
      procedure SetWareHouses(const Value: String);
      procedure SetWeight(const Value: Extended);

    protected
      function GetID: Integer; override;
      procedure FindNameClick(Sender: TObject); override;
      procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
      procedure refreshMat;
      procedure searchFail(RevertToLast: Boolean);
      procedure SetCurrentSearchIndex(const Value: Integer); override;
      procedure SetID(const Value: Integer); override;
      procedure SetRemoteServer(const Value: TSocketConnection); override;

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      procedure AdjustCtrls; override;
      procedure DoSearch(AForward: Boolean); override;
      procedure findAgain; override;
      procedure InitRes; override;
      procedure Paint; override;

      property Artikul: string read FArtikul;
      property BarCode: string read FBarCode;
      property Country: string read FCountry;
      property GrpName: string read FGrpName;
      property IsSerial: Boolean read FIsSerial;
      property MatID: Integer read FMatID write SetMatID;
      property MatName: string read FMatName;
      property Measure: string read FMeasure;
      property NDS: Extended read FNDS;
      property Producer: string read FProducer;
      property Taxes: TssClientDataSet read FTaxes;
      property WareHouses: String read FWareHouses write SetWareHouses;
      property Weight: Extended read FWeight write SetWeight;
      property WID: Integer read FWID;

    published
      property AllowZeroRest: Boolean read FAllowZeroRest write FAllowZeroRest;
      property LoadNDS: Boolean read FLoadNDS write FLoadNDS default False;
      property LoadTaxes: Boolean read FLoadTaxes write FLoadTaxes default False;
      property OnWeightChanged: TNotifyEvent read FOnWeightChanged write FOnWeightChanged;
      property ScannerImageIndex: Integer read FScannerImageIndex write SetScannerImageIndex;
  end;

  //-------------------------------------------------------------------------------
  TokSvcSearchEdit = class(TokSearchEdit)
    private
      FSvcID: Integer;
      FSvcName: string;
      FArtikul: string;
      FMeasure: string;
      FIsTransport: Boolean;
      FIsNormed: Boolean;
      FPrice: Extended;
      FCurrID: Integer;
      FNorm: Extended;
      procedure SetSvcID(const Value: Integer);

    protected
      procedure FindNameClick(Sender: TObject); override;
      procedure RefButtonClick(Sender: TObject); override;
      procedure IDChanged(const Value: Integer); override;
      function GetID: Integer; override;
      procedure SetID(const Value: Integer); override;

    public
      procedure InitRes; override;
      procedure DoSearch(AForward: Boolean); override;

      property SvcID: Integer read FSvcID write SetSvcID;
      property SvcName: string read FSvcName;
      property Artikul: string read FArtikul;
      property Measure: string read FMeasure;
      property Price: Extended read FPrice;
      property CurrID: Integer read FCurrID;
      property IsTransport: Boolean read FIsTransport;
      property IsNormed: Boolean read FIsNormed;
      property Norm: Extended read FNorm;
  end;

  //-------------------------------------------------------------------------------
  TokGridSearchEdit = class(TokSearchEdit)
    private
      FFindIndex: Integer;
      FGrid: TCustomdxDBTreeListControl;
      procedure SetSvcID(const Value: Integer);
      { Private declarations }
    protected
      procedure FindNameClick(Sender: TObject); override;
      procedure RefButtonClick(Sender: TObject); override;
      procedure IDChanged(const Value: Integer); override;
      procedure EditKeyPress(Sender: TObject; var Key: Char); override;
      function GetID: Integer; override;
      procedure SetID(const Value: Integer); override;
    public
      constructor Create(AOwner: TComponent); override;
      procedure InitRes; override;
      procedure DoSearch(AForward: Boolean); override;
    published
      property Grid: TCustomdxDBTreeListControl read FGrid write FGrid;
  end;

  //-------------------------------------------------------------------------------
  TokKASearchMode = (smAll, smOwnFirms);
  TokKASearchEdit = class(TokSearchEdit)
    private
      FKAID: Integer;
      FLoadContracts: Boolean;
      FLoadPersons: Boolean;
      FObj: TokKAgent;
      FSearchMode: TokKASearchMode;
      procedure SetKAID(const Value: Integer);
      procedure SetLoadContracts(const Value: Boolean);
      procedure SetLoadPersons(const Value: Boolean);
      procedure SetSearchMode(const Value: TokKASearchMode);
      
    protected
      procedure RefButtonClick(Sender: TObject); override;
      procedure FindNameClick(Sender: TObject); override;
      procedure IDChanged(const Value: Integer); override;
      procedure SetRemoteServer(const Value: TSocketConnection); override;
      function GetID: Integer; override;
      procedure SetID(const Value: Integer); override;

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      procedure DoSearch(AForward: Boolean); override;
      procedure InitRes; override;

      property KAID: Integer read FKAID write SetKAID;
      property Obj: TokKAgent read FObj;

    published
      property LoadContracts: Boolean read FLoadContracts write SetLoadContracts default False;
      property LoadPersons: Boolean read FLoadPersons write SetLoadPersons default False;
      property SearchMode: TokKASearchMode read FSearchMode write SetSearchMode;
  end;

  //-------------------------------------------------------------------------------
  TokDocSearchEdit = class(TokSearchEdit)
    private
      FID: Integer;
      FDocNum: string;
      FDocDate: TDateTime;
      FKAID: Integer;
      FWType: Integer;
      FDocSumm: Extended;
      FLoadDocSaldo: Boolean;
      FPaidSumm: Extended;
      FDocSaldo: Extended;
      procedure SetWType(const Value: Integer);
      procedure SetKAID(const Value: Integer);
      procedure SetLoadDocSaldo(const Value: Boolean);
      procedure GetDocSaldo;
    protected
      function GetID: Integer; override;
      procedure SetID(const Value: Integer); override;
    public
      procedure DoSearch(AForward: Boolean); override;
      procedure InitRes; override;
      procedure ReloadData;

      property DocNum: string read FDocNum;
      property DocDate: TDateTime read FDocDate;
      property DocSumm: Extended read FDocSumm;
      property PaidSumm: Extended read FPaidSumm;
      property DocSaldo: Extended read FDocSaldo;
      property KAID: Integer read FKAID write SetKAID;
    published
      property WType: Integer read FWType write SetWType;
      property LoadDocSaldo: Boolean read FLoadDocSaldo write SetLoadDocSaldo default False;
  end;

  //-------------------------------------------------------------------------------
  TokContractType = (ctAll, ctIn, ctOut);
  TokContractSearchEdit = class(TokSearchEdit)
    private
      FContractType: TokContractType;
      FDocID: Integer;
      FObj: TokContract;
      FKAID: Integer;
      FOnDate: TDateTime;
      procedure SetContractType(const Value: TokContractType);
      procedure SetDocID(const Value: Integer);
      procedure SetKAID(const Value: Integer);
      procedure SetOnDate(const Value: TDateTime);

    protected
      procedure SetRemoteServer(const Value: TSocketConnection); override;
      procedure IDChanged(const Value: Integer); override;
      procedure RefButtonClick(Sender: TObject); override;
      function GetID: Integer; override;
      procedure SetID(const Value: Integer); override;

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure DoSearch(AForward: Boolean); override;
      procedure InitRes; override;
      procedure ReloadData;

      property DocID: Integer read FDocID write SetDocID;
      property KAID: Integer read FKAID write SetKAID;
      property OnDate: TDateTime read FOnDate write SetOnDate;
      property Obj: TokContract read FObj;

    published
      property ContractType: TokContractType read FContractType write SetContractType default ctAll;
  end;

  //-------------------------------------------------------------------------------
  TokWHouseSearchEdit = class(TokSearchEdit)
    private
      FObj: TokWarehouse;
      FWID: Integer;
      procedure SetWID(const Value: Integer);

    protected
      procedure SetRemoteServer(const Value: TSocketConnection); override;
      procedure IDChanged(const Value: Integer); override;
      procedure RefButtonClick(Sender: TObject); override;
      procedure ComboChange(Sender: TObject); override;
      function GetID: Integer; override;
      procedure SetID(const Value: Integer); override;

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure DoSearch(AForward: Boolean); override;
      procedure InitRes; override;
      procedure ReloadData;
      procedure RefreshItemsDS;

      property WID: Integer read FWID write SetWID;
      property Obj: TokWarehouse read FObj;

    published
      property ViewMode;
  end;

  //-------------------------------------------------------------------------------
  //-------------------------------------------------------------------------------
  //-------------------------------------------------------------------------------
  TokPayDocSearchEdit = class(TokSearchEdit)
    private
      FObj: TokPayDoc;
      FKAID: Integer;
      FPayDocID: Integer;
      FDocType: TokPayDocType;
      procedure SetKAID(const Value: Integer);
      procedure SetPayDocID(const Value: Integer);
      procedure SetDocType(const Value: TokPayDocType);
      function GetDocType: TokPayDocType;

    protected
      procedure RefButtonClick(Sender: TObject); override;
      procedure SetRemoteServer(const Value: TSocketConnection); override;
      procedure IDChanged(const Value: Integer); override;
      function GetID: Integer; override;
      procedure SetID(const Value: Integer); override;
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure DoSearch(AForward: Boolean); override;
      procedure InitRes; override;
      procedure SetDocTypeInfo(AType: TokPayDocType);
      procedure ReloadData;

      property KAID: Integer read FKAID write SetKAID;
      property Obj: TokPayDoc read FObj;
      property PayDocID: Integer read FPayDocID write SetPayDocID;
    published
      property PayDocType: TokPayDocType read FDocType write SetDocType;
  end;

  //-------------------------------------------------------------------------------
  TokOrderType = (otIn, otOut);
  TokOrderSearchEdit = class(TokSearchEdit)
    private
      FObj: TokOrder;
      FKAID: Integer;
      FDocType: TokOrderType;
      FWBillID: Integer;
      procedure SetKAID(const Value: Integer);
      procedure SetDocType(const Value: TokOrderType);
      function GetDocType: TokOrderType;
    protected
      procedure RefButtonClick(Sender: TObject); override;
      procedure SetRemoteServer(const Value: TSocketConnection); override;
      procedure IDChanged(const Value: Integer); override;
      function GetID: Integer; override;
      procedure SetID(const Value: Integer); override;
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure DoSearch(AForward: Boolean); override;
      procedure InitRes; override;
      procedure SetDocTypeInfo(AType: TokOrderType);
      procedure ReloadData;

      property KAID: Integer read FKAID write SetKAID;
      property Obj: TokOrder read FObj;
    published
      property DocType: TokOrderType read FDocType write SetDocType;
  end;

  //-------------------------------------------------------------------------------
  TokDiscCardSearchEdit = class(TokSearchEdit)
    private
      FObj: TokDiscCard;
      FCardID: Integer;
      FDocType: TokPayDocType;
      procedure SetCardID(const Value: Integer);
    protected
      procedure RefButtonClick(Sender: TObject); override;
      procedure SetRemoteServer(const Value: TSocketConnection); override;
      procedure IDChanged(const Value: Integer); override;
      function GetID: Integer; override;
      procedure SetID(const Value: Integer); override;
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure DoSearch(AForward: Boolean); override;
      procedure InitRes; override;
      procedure ReloadData;

      property Obj: TokDiscCard read FObj;
      property CardID: Integer read FCardID write SetCardID;
  end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFNDEF PKG}fMessageDlg, ssFun, prTypes, prConst, ssBaseTypes, prFun,{$ENDIF}
  StrUtils, ssStrUtil, ssRegUtils, Math, Types;

//==============================================================================================
procedure TokSearchEdit.AdjustCtrls;
  var
    edw: Integer; // editor field width
begin
  FlName.Top := (Self.Height - FlName.Height) div 2;
  FLng.Top := (Self.Height - FLng.Height) div 2;
  FEdit.Top := (Self.Height - FEdit.Height) div 2;

  if (csDesigning in ComponentState) and (FShowButtons in [sbtHide, sbtOnlyRef]) then begin
    FbtnFind.Top := -100;
    FbtnFindParams.Top := -100;

    if FShowButtons = sbtOnlyRef
      then FbtnRef.Top := (Self.Height - FbtnRef.Height) div 2
      else FbtnRef.Top := -100;
  end
  else begin
    FbtnFind.Top := (Self.Height - FbtnFind.Height) div 2;

    if FShowButtons = sbtNoRef
      then FbtnRef.Top := -100
      else FbtnRef.Top := (Self.Height - FbtnRef.Height) div 2;

    FbtnFindParams.Top := (Self.Height - FbtnFindParams.Height) div 2;
  end;

  FLng.Visible := FShowLng;
  FLng.Left := FEditorOffset; // default

  FEdit.Left := FEditorOffset;

  edw := Self.Width - FEdit.Left - 1; // full width by default

  if FShowLng then edw := edw - FLng.Width - 2;

  case FShowButtons of
    sbtShow:    edw := edw - 23*3;
    sbtHide:    ;
    sbtOnlyRef: edw := edw - 23;
    sbtNoRef:   edw := edw - 23*2;
  end;

  FEdit.Width := edw;
  if FShowLng then begin
    FLng.Left := FEdit.Left + FEdit.Width + 2;
    FbtnRef.Left := FLng.Left + FLng.Width + 1;
  end
  else FbtnRef.Left := FEdit.Left + FEdit.Width + 1;

  FCombo.Left := FEdit.Left;
  FCombo.Top := FEdit.Top;
  FCombo.Width := FEdit.Width;
end;

//==============================================================================================
procedure TokSearchEdit.ComboChange(Sender: TObject);
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

//==============================================================================================
procedure TokSearchEdit.ComboKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and FGoNextOnEnter then begin
    Key := #0;
    FParentCtrl.Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

//==============================================================================================
procedure TokSearchEdit.ContextFindClick(Sender: TObject);
begin
  FContextFind := FContextFindItem.Checked;
end;

//==============================================================================================
constructor TokSearchEdit.Create(AOwner: TComponent);
begin
  inherited;

  Self.Width := 300;
  Self.Height := 25;

  FCurrentSearchIndex := -1;
  FGoNextOnEnter := True;
  FRefShortCut := 16429;
  FLastIDShortCut := 16460;
  FShowCaptions := True;

  FShowLng := True;
  FShowButtons := sbtShow;
  FEditorOffset := ok_EditOffset;

  FSearchNames := TStringList.Create;

  FcdsFind := TssClientDataSet.Create(nil);
  with FcdsFind do begin
    Macros.AddParam(TParam.Create(Macros, ptInput));
    Macros[0].DataType := ftString;
    Macros[0].Name := 'sql';
  end;

  FItemsDS := TssClientDataSet.Create(nil);
  {with FItemsDS do begin
  end;
  }

  FItemsSrc := TDataSource.Create(nil);
  FItemsSrc.DataSet := FItemsDS;

  FlName := TssLabel.Create(Self);
  with FlName do begin
    Caption := 'Name';
    DisabledDraw := ddUser;
    DisabledColor := clBtnShadow;
    Parent := Self;
  end;

  FLng := TssLabel.Create(Self);
  with FLng do begin
    Caption := 'EN';
    Font.Style := [fsBold];
    DisabledDraw := ddUser;
    DisabledColor := clBtnShadow;
    Parent := Self;
    Anchors := [akRight, akTop];
  end;

  FbtnRef := TssSpeedButton.Create(Self);
  with FbtnRef do begin
    Parent := Self;
    Width := 23;
    Height := 23;
    HotBorderColor := ok_clHotBorder;
    HotTrackColor := ok_clHotTrack;
    Style := ssbsUser;
    Left := Self.Width - 23*3;
    ShowHint := True;
    Anchors := [akRight, akTop];
    OnClick := RefButtonClick;
  end;

  FbtnFind := TssSpeedButton.Create(Self);
  with FbtnFind do begin
    Parent := Self;
    Width := 23;
    Height := 23;
    HotBorderColor := ok_clHotBorder;
    HotTrackColor := ok_clHotTrack;
    Style := ssbsUser;
    Left := Self.Width - 23*2;
    ShowHint := True;
    Anchors := [akRight, akTop];
  end;

  FbtnFindParams := TssSpeedButton.Create(Self);
  with FbtnFindParams do begin
    Parent := Self;
    Width := 23;
    Height := 23;
    HotBorderColor := ok_clHotBorder;
    HotTrackColor := ok_clHotTrack;
    Style := ssbsUser;
    Left := Self.Width - 23;
    Anchors := [akRight, akTop];
    ShowHint := True;
    OnClick := FindParamsClick;
  end;

  FEdit := TokTextEdit.Create(Self);
  with FEdit do begin
    ChangeDelay := 0;
    BeepOnEnter := False;
    Text := '';
    Anchors := Anchors + [akRight];
    OnKeyDown := EditKeyDown;
    OnKeyPress := EditKeyPress;
    OnDelayedChange := EditChange;
    Parent := Self;
  end;

  FCombo := TssDBLookupCombo.Create(Self);
  with FCombo do begin
    Text := '';
    Anchors := Anchors + [akRight];
    Properties.OnChange := ComboChange;
    Parent := Self;
    ListSource := FItemsSrc;
    Visible := False;
    Style.PopupBorderStyle := epbsFlat;
    OnKeyPress := ComboKeyPress;
    Properties.DropDownListStyle := lsFixedList;
  end;

  FPopup := TTBPopupMenu.Create(Self);
  FContextFindItem := TTBItem.Create(FPopup);
  FContextFind := True;
  with FContextFindItem do begin
    Checked := True;
    AutoCheck := True;
    OnClick := ContextFindClick;
  end;
  FPopup.Items.Insert(0, FContextFindItem);
  FPopup.Items.Insert(0, TTBSeparatorItem.Create(FPopup));

  FFindSubstrItem := TTBItem.Create(FPopup);
  with FFindSubstrItem do begin
    GroupIndex := 1;
    AutoCheck := True;
    OnClick := FindClick;
  end;
  FPopup.Items.Insert(0, FFindSubstrItem);

  FFindConcurrItem := TTBItem.Create(FPopup);
  with FFindConcurrItem do begin
    GroupIndex := 1;
    AutoCheck := True;
    OnClick := FindClick;
  end;
  FPopup.Items.Insert(0, FFindConcurrItem);

  FFindBeginItem := TTBItem.Create(FPopup);
  with FFindBeginItem do begin
    GroupIndex := 1;
    AutoCheck := True;
    Checked := True;
    OnClick := FindClick;
  end;
  FPopup.Items.Insert(0, FFindBeginItem);
  FPopup.Items.Insert(0, TTBSeparatorItem.Create(FPopup));

  SetLng;
  AdjustCtrls;
end;

//==============================================================================================
destructor TokSearchEdit.Destroy;
begin
  FlName.Free;
  FLng.Free;
  FEdit.Free;
  FbtnFind.Free;
  FbtnFindParams.Free;
  FbtnRef.Free;
  FSearchNames.Free;
  FPopup.Free;
  FcdsFind.Free;
  FItemsSrc.Free;
  FItemsDS.Free;

  inherited;
end;

//==============================================================================================
procedure TokSearchEdit.DoError;
begin
  Editor.Style.Color := okSearchFailedColor;
  Application.ProcessMessages;
  SysUtils.Beep;
  Sleep(100);
  Editor.Style.Color := clWindow;
end;

//==============================================================================================
procedure TokSearchEdit.DoSearch(AForward: Boolean);
begin
{}
end;

//==============================================================================================
procedure TokSearchEdit.EditChange(Sender: TObject);
begin
  if not EditMode then begin
    if FEdit.Text = '' then FFindStr := '';
    if not FLockFind then FModified := True;
    if not FLockFind and FContextFind then DoSearch(True);
  end;
  
  if Assigned(FOnEditorChange) then FOnEditorChange(Self);
end;

//==============================================================================================
procedure TokSearchEdit.EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
 var
   AForward: Boolean;
begin
  if Assigned(FOnKeyDown) then FOnKeyDown(Self, Key, Shift);

  if ShortCut(Key, Shift) = FRefShortCut then begin
    RefButtonClick(Self);
  end
  else if ShortCut(Key, Shift) = FLastIDShortCut then begin
    if LastID > 0 then ID := LastID;
    Key := 0;
  end
  else if not FEditMode and ((Key = VK_UP) or (Key = VK_DOWN)) and not (ssCtrl in Shift) then begin
    if (Key = VK_UP) and FModified then Exit;
    AForward := Key = VK_DOWN;
    Key := 0;
    DoSearch(AForward);
  end
  else if ssCtrl in Shift then
    case Key of
      VK_UP   : FParentCtrl.Perform(WM_NEXTDLGCTL, 1, 0);
      VK_DOWN : FParentCtrl.Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

//==============================================================================================
procedure TokSearchEdit.EditKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and FGoNextOnEnter then begin
    Key := #0;
    FParentCtrl.Perform(WM_NEXTDLGCTL, 0, 0);
    FBSPressed := False;
  end
  else begin
    if FEditMode then Exit;
    if (Key = #8) and (FEdit.Text <> '') then begin
      Delete(FFindStr, Length(FFindStr), 1);
      FBSPressed := True;
    end
  end;
end;

//==============================================================================================
procedure TokSearchEdit.FindClick(Sender: TObject);
begin
  (Sender as TTBItem).Checked := True;
  if Sender = FFindBeginItem then FSearchType := stBegin else
  if Sender = FFindSubstrItem then FSearchType := stSubstr else
  if Sender = FFindConcurrItem then FSearchType := stConcurr;
end;

//==============================================================================================
procedure TokSearchEdit.FindNameClick(Sender: TObject);
begin
  with Sender as TTBItem do begin
    Checked := True;
    CurrentSearchIndex := Parent.IndexOf(Sender as TTBItem);
  end;
end;

//==============================================================================================
procedure TokSearchEdit.FindParamsClick(Sender: TObject);
 var
   Pos: TPoint;
begin
  Pos := ClientToScreen(Point(FbtnFindParams.Left, FbtnFindParams.Top + FbtnFindParams.Height + 1));
  FPopup.Popup(Pos.X, Pos.Y);
end;

//==============================================================================================
function TokSearchEdit.GetButtonLeftMargin: Integer;
begin
  Result := FbtnRef.LeftMargin;
end;

//==============================================================================================
function TokSearchEdit.GetID: Integer;
begin
  Result := 0;
end;

//==============================================================================================
function TokSearchEdit.GetImageIndexFind: Integer;
begin
  Result := FbtnFind.ImageIndex;
end;

//==============================================================================================
function TokSearchEdit.GetImageIndexFindParams: Integer;
begin
  Result := FbtnFindParams.ImageIndex;
end;

//==============================================================================================
function TokSearchEdit.GetImageIndexRef: Integer;
begin
  Result := FbtnRef.ImageIndex;
end;

//==============================================================================================
function TokSearchEdit.GetSC: TcxEditStyleController;
begin
  Result := FEdit.Style.StyleController;
end;

//==============================================================================================
function TokSearchEdit.GetSkin: TTBBaseSkin;
begin
  Result := FPopup.Skin;
end;

//==============================================================================================
function TokSearchEdit.GetText: string;
begin
  Result := Editor.Text;
end;

//==============================================================================================
procedure TokSearchEdit.IDChanged(const Value: Integer);
begin

end;

//==============================================================================================
procedure TokSearchEdit.InitRes;
begin
  if not Assigned(LangManager) then Exit;

  with FLangManager do begin
    CapFindBegin := GetRS('Common', 'FindBegin');
    CapFindConcurr := GetRS('Common', 'FindConcurr');
    CapFindSubstr := GetRS('Common', 'FindSubst');
    CapContextFind := GetRS('Common', 'FindContext');
    CapFindParams := GetRS('Common', 'FindParams');
    CapFind := GetRS('Common', 'Find');
  end;
end;

//==============================================================================================
procedure TokSearchEdit.Loaded;
begin
  inherited;

  FParentCtrl := Self;
  while not (FParentCtrl is TCustomForm) do
    if Assigned(FParentCtrl.Parent)
      then FParentCtrl := FParentCtrl.Parent
      else Break;

  InitRes;
  ResetPopup;
  AdjustCtrls;
end;

//==============================================================================================
procedure TokSearchEdit.LoadFromRegistry(const ARegPath: string);
 var
   intTmp: Integer;
begin
  if ReadFromRegInt(ARegPath, 'SearchIndex', intTmp) then begin
    CurrentSearchIndex := intTmp;
    FPopup.Items.Items[intTmp].Checked := True;
    if Assigned(OnTypeChanged) then OnTypeChanged(Self);
  end;

  if ReadFromRegInt(ARegPath, 'SearchType', intTmp) then begin
    SearchType := TokSearchType(intTmp);
  end;

  if ReadFromRegInt(ARegPath, 'ContextFind', intTmp) then begin
    FContextFind := intTmp = 1;
    FContextFindItem.Checked := FContextFind;
  end;
end;

//==============================================================================================
procedure TokSearchEdit.RefButtonClick(Sender: TObject);
begin
  if Assigned(FOnRefButtonClick) then FOnRefButtonClick(Self);
end;

//==============================================================================================
procedure TokSearchEdit.ResetPopup;
 var
   i: Integer;
   FItem: TTBItem;
begin
  while not (FPopup.Items.Items[0] is TTBSeparatorItem) do begin
    FPopup.Items.Items[0].Free;
  end;

  for i := FSearchNames.Count - 1 downto 0 do begin
    FItem := TTBItem.Create(FPopup);
    FItem.Caption := ExtractWord(1, FSearchNames[i], [';']);
    FItem.GroupIndex := 2;
    if i = 0 then begin
      FItem.Checked := True;
      CurrentSearchIndex := 0;
    end;
    FItem.OnClick := FindNameClick;
    FPopup.Items.Insert(0, FItem);
  end;
end;

//==============================================================================================
procedure TokSearchEdit.SaveToRegistry(const ARegPath: string);
begin
  WriteToRegInt(ARegPath, 'SearchIndex', FCurrentSearchIndex);
  WriteToRegInt(ARegPath, 'ContextFind', Integer(FContextFind));
  WriteToRegInt(ARegPath, 'SearchType', Integer(FSearchType));
end;

//==============================================================================================
procedure TokSearchEdit.SetButtonsLeftMargin(const Value: Integer);
begin
  FbtnFind.LeftMargin := Value;
  FbtnFindParams.LeftMargin := Value;
  FbtnRef.LeftMargin := Value;
end;

//==============================================================================================
procedure TokSearchEdit.SetCapContextFind(const Value: TCaption);
begin
  FCapContextFind := Value;
  FContextFindItem.Caption := Value;
end;

//==============================================================================================
procedure TokSearchEdit.SetCapFind(const Value: TCaption);
begin
  FCapFind := Value;
  FbtnFind.Hint := Value;
end;

//==============================================================================================
procedure TokSearchEdit.SetCapFindBegin(const Value: TCaption);
begin
  FCapFindBegin := Value;
  FFindBeginItem.Caption := Value;
end;

//==============================================================================================
procedure TokSearchEdit.SetCapFindConcurr(const Value: TCaption);
begin
  FCapFindConcurr := Value;
  FFindConcurrItem.Caption := Value;
end;

//==============================================================================================
procedure TokSearchEdit.SetCapFindParams(const Value: TCaption);
begin
  FCapFindParams := Value;
  FbtnFindParams.Hint := Value;
end;

//==============================================================================================
procedure TokSearchEdit.SetCapFindSubstr(const Value: TCaption);
begin
  FCapFindSubstr := Value;
  FFindSubstrItem.Caption := Value;
end;

//==============================================================================================
procedure TokSearchEdit.SetCapRef(const Value: TCaption);
begin
  FCapRef := Value;
  FbtnRef.Hint := Value;
  if FRefShortCut > 0
    then FbtnRef.Hint := FbtnRef.Hint + ' (' + ShortCutToText(FRefShortCut) + ')';
end;

//==============================================================================================
procedure TokSearchEdit.SetCurrentSearchIndex(const Value: Integer);
begin
  if Value = FCurrentSearchIndex then Exit;
  if (Value < -1) or (Value > FSearchNames.Count - 1)
    then FCurrentSearchIndex := -1
    else begin
      FlName.Caption := ExtractWord(1, FSearchNames[Value], [';']) + ':';
      FCurrentSearchIndex := Value;
    end;
end;

//==============================================================================================
procedure TokSearchEdit.SetDisabledImages(const Value: TImageList);
begin
  FDisabledImages := Value;
  FbtnRef.DisabledImages := Value;
  FbtnFind.DisabledImages := Value;
  FbtnFindParams.DisabledImages := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

//==============================================================================================
procedure TokSearchEdit.SetEditMode(const Value: Boolean);
begin
  FEditMode := Value;
end;

//==============================================================================================
procedure TokSearchEdit.SetEditorOffset(const Value: Cardinal);
begin
  FEditorOffset := Value;
  AdjustCtrls;
end;

//==============================================================================================
procedure TokSearchEdit.SetEnabled(Value: Boolean);
begin
  inherited;

  if Value <> FEdit.Enabled then begin
    FlName.Enabled := Value;
    FEdit.Enabled := Value;
    FCombo.Enabled := Value;
    FLng.Enabled := Value;
    FbtnFind.Enabled := Value;
    FbtnFindParams.Enabled := Value;
    FbtnRef.Enabled := Value;
  end;
end;

//==============================================================================================
procedure TokSearchEdit.SetGoNextOnEnter(const Value: Boolean);
begin
  FGoNextOnEnter := Value;
end;

//==============================================================================================
procedure TokSearchEdit.SetID(const Value: Integer);
begin

end;

//==============================================================================================
procedure TokSearchEdit.SetImageIndexFind(const Value: Integer);
begin
  FbtnFind.ImageIndex := Value;
end;

//==============================================================================================
procedure TokSearchEdit.SetImageIndexFindParams(const Value: Integer);
begin
  FbtnFindParams.ImageIndex := Value;
end;

//==============================================================================================
procedure TokSearchEdit.SetImageIndexRef(const Value: Integer);
begin
  FbtnRef.ImageIndex := Value;
end;

//==============================================================================================
procedure TokSearchEdit.SetImages(const Value: TImageList);
begin
  FImages := Value;
  FbtnRef.Images := Value;
  FbtnFind.Images := Value;
  FbtnFindParams.Images := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

//==============================================================================================
procedure TokSearchEdit.SetLangManager(const Value: TxLngManager);
begin
  if Value = FLangManager then Exit;
  if Assigned(Value) then Value.FreeNotification(Self);
  FLangManager := Value;
end;

//==============================================================================================
procedure TokSearchEdit.SetLng;
begin
  FLng.Caption := {$IFNDEF PKG}keyboardIndicator{$ELSE}'EN'{$ENDIF};
end;

//==============================================================================================
procedure TokSearchEdit.SetRemoteServer(const Value: TSocketConnection);
begin
  if Value = FRemoteServer then Exit;

  FRemoteServer := Value;
  if Assigned(Value) then begin
    Value.FreeNotification(Self);
    FcdsFind.RemoteServer := Value;
    FcdsFind.ProviderName := 'pSQL';
    FItemsDS.RemoteServer := Value;
  end
  else begin
    FcdsFind.RemoteServer := nil;
    FItemsDS.RemoteServer := nil;
  end;
end;

//==============================================================================================
procedure TokSearchEdit.SetSC(const Value: TcxEditStyleController);
begin
  FEdit.Style.StyleController := Value;
  FCombo.Style.StyleController := Value;
end;

//==============================================================================================
procedure TokSearchEdit.SetSearchNames(const Value: TStringList);
begin
  FSearchNames.Assign(Value);
  ResetPopup;
  if FCurrentSearchIndex = -1 then CurrentSearchIndex := 0
    else CurrentSearchIndex := FCurrentSearchIndex;
end;

//==============================================================================================
procedure TokSearchEdit.SetSearchType(const Value: TokSearchType);
begin
  if FSearchType = Value then Exit;
  FSearchType := Value;
  case Value of
    stBegin:   FFindBeginItem.Checked := True;
    stSubstr:  FFindSubstrItem.Checked := True;
    stConcurr: FFindConcurrItem.Checked := True;
  end;
end;

//==============================================================================================
procedure TokSearchEdit.SetShowButtons(const Value: TokShowButtonsType);
begin
  FShowButtons := Value;
  FbtnFind.Visible := Value in [sbtShow, sbtNoRef];
  FbtnFindParams.Visible := Value in [sbtShow, sbtNoRef];
  FbtnRef.Visible := Value in [sbtShow, sbtOnlyRef];
  AdjustCtrls;
end;

//==============================================================================================
procedure TokSearchEdit.SetShowCaptions(const Value: Boolean);
begin
  FShowCaptions := Value;
  Caption.Visible := Value;
end;

//==============================================================================================
procedure TokSearchEdit.SetShowLng(const Value: Boolean);
begin
  FShowLng := Value;
  FLng.Visible := Value;
  AdjustCtrls;
end;

//==============================================================================================
procedure TokSearchEdit.SetSkin(const Value: TTBBaseSkin);
begin
  FPopup.Skin := Value;
end;

//==============================================================================================
procedure TokSearchEdit.findAgain;
begin
end;

{TokMatSearchEdit}

//==============================================================================================
//==============================================================================================
//==============================================================================================
procedure TokMatSearchEdit.AdjustCtrls;
begin
  inherited;

  {if CurrentSearchIndex = 2 then begin
    if FShowLng
      then FEdit.Left := 18 + FLng.Left + FLng.Width + 2
      else FEdit.Left := 18 + FEditorOffset;

    case FShowButtons of
      sbtShow:
        FEdit.Width := Self.Width - 23*3 - FEdit.Left - 1;
      sbtHide:
        FEdit.Width := Self.Width - FEdit.Left;
      sbtOnlyRef:
        begin
          FEdit.Width := Self.Width - 23 - FEdit.Left - 1;
        end;
    end;

    FCombo.Left := FEdit.Left;
    FCombo.Width := FEdit.Width;
  end;}

end;

//==============================================================================================
constructor TokMatSearchEdit.Create(AOwner: TComponent);
begin
  inherited;

  FTaxes := TssClientDataSet.Create(nil);
  FTaxes.RemoteServer := FRemoteServer;
  FTaxes.ProviderName := 'pMatTaxes_Get';

  FScannerImageIndex := OK_II_SCANNER;
  ShowHint := True;
  FAllowZeroRest := True;
end;

//==============================================================================================
destructor TokMatSearchEdit.Destroy;
begin
  FTaxes.Free;

  inherited;
end;

//==============================================================================================
procedure TokMatSearchEdit.findAgain;
begin
  Fmodified := True;
  DoSearch(true);
  if FsearchState <> oseFound then MatID := 0; // invalidating as there is no match for this WH
end;

//==============================================================================================
procedure TokMatSearchEdit.searchFail(RevertToLast: Boolean);
begin
  DoError;
  if RevertToLast then begin
    FsearchState := oseFail;
    FFindStr := FPrevFindStr;
    FEdit.Text := FPrevFindText;
    FEdit.SelStart := Length(FFindStr);
    FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);
    if Assigned(OnFailSearch) then OnFailSearch(Self);
  end
  else begin
    FsearchState := oseRevert;
    MatID := 0;
    FPrevFindStr := '';
    FPrevFindText := '';
    FFindStr := '';
    FEdit.ClearSelection;
    FEdit.Clear;
  end;
  //FTaxes.Close;
  //if Assigned(OnChange) then OnChange(Self);
end;

//==============================================================================================
procedure TokMatSearchEdit.DoSearch(AForward: Boolean);
  {$IFNDEF PKG}
  var
    FSQL, addSqlCond: String;
    FFieldName, FStart, FEnd: String;
    FMatCode: string;
    FWeight_: Extended;
    //MinPrice, MaxPrice, AvgPrice, Remain: Extended;

  procedure GetNext;
  begin
    with FcdsFind do
      repeat
        Next;
      until Eof or (Length(FieldByName('barcode').AsString) = BC_CodeTo - BC_CodeFrom + 1)
  end;

  procedure GetPrior;
  begin
    with FcdsFind do
      repeat
        Prior;
      until Bof or (Length(FieldByName('barcode').AsString) = BC_CodeTo - BC_CodeFrom + 1)
  end;
  {$ENDIF}
begin
  {$IFNDEF PKG}
  if not Assigned(RemoteServer) or not RemoteServer.Connected then Exit;

  FLockFind := True;
  FsearchState := oseFail;
  AddSqlCond := '';

  {!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   ToDo: we need to optimize this !!!!!!!!!!!
   dataset should be active always. only special events will trigger reloading
   maybe some else... ;)
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1!!!}

  {FSQL := 'select m.matid, m.name, m.artikul, m.producer, ms.shortname, '+
     ' m.serials, m.barcode, m.wid, mg.name as grpname, c.name as country, '+
     ' (mr.remain-mr.rsv-mr.ordered-mr.orsv) as remain, mr.ondate '+
     ' from materials m join measures ms on ms.mid=m.mid '+
     ' join matgroup mg on mg.grpid=m.grpid '+
     ' left join matremains mr on '+
     ' mr.ondate=(select first 1 ondate from matremains where matid=m.matid order by ondate desc) '+
     ' left join countries c on c.cid=m.cid '+
     ' where m.deleted=0 and m.archived=0 ';
  }
  FSQL := 'select first 50 m.matid, m.name, m.artikul, m.producer, ms.shortname, '
     + ' m.serials, m.barcode, mg.name as grpname, c.name as country ';

  if not FAllowZeroRest
    then FSQL := FSQL + ', pr.wid, pr.ondate, (pr.remain-pr.rsv-pr.ordered) as remain'
    else FSQL := FSQL + ', 1 as wid, 0 as remain, now() as ondate ';

  FSQL := FSQL + ' from materials m'
     + ' left join measures ms on ms.mid=m.mid '
     + ' left join matgroup mg on mg.grpid=m.grpid ';

  if not FAllowZeroRest
    then FSQL := FSQL + ' left join posremains pr on pr.ondate=(select first 1 ondate from posremains where posremains.matid=m.matid order by ondate desc) ';

  FSQL := FSQL + ' left join countries c on c.cid=m.cid '
     + ' where m.deleted=0 and m.archived=0 ';

  if not FAllowZeroRest then AddSqlCond := AddSqlCond + ' and remain > 0 ';

  if not FAllowZeroRest and (FWareHouses <> '') // restrict to chosen warehouse
    then addSqlCond := AddSqlCond + ' and pr.wid in (' + FWareHouses + ') ';

  try
    if not FBSPressed and FModified
      then FFindStr := trim(FEdit.Text)
      else FBSPressed := False;

    if FFindStr = '' then begin
      searchFail(False);
      Exit;
    end;

    if length(FFindStr) < 3 then begin
      FsearchState := oseFound;
      Font.Color := clInactiveCaption;
      Exit;
    end
    else Font.Color := clWindowText;

    Screen.Cursor := crSQLWait;

    FFieldName := ExtractWord(2, SearchNames[CurrentSearchIndex], [';']);

    if (LowerCase(FFieldName) = 'barcode') and (FSearchType <> stSubstr)
      and BC_Enabled and (FFindStr[1] = IntToStr(BC_StartDigit))
    then begin
      FMatCode := GetMatCode(FFindStr);
      FWeight_ := GetWeight(FFindStr);

      (*{$IFDEF FREE}
      ssMessageDlg(LangMan.GetRS('fmMaterials', 'BCWeightNA'), ssmtError, [ssmbOk]);
      Screen.Cursor := crDefault;
      Exit;
      {$ELSE}
      *)
      if FWeight_ <> Weight then Weight := FWeight_;

      if (FMatCode = '') or (FMatCode = FBarCode) then begin
        FPrevFindStr := FFindStr;
        FPrevFindText := FEdit.Text;
        Screen.Cursor := crDefault;
        Exit;
      end;

      if (FModified or not FcdsFind.Active) then begin
        if FcdsFind.Active then FcdsFind.Close;

        FStart := ''; FEnd := '';
        case FSearchType of
          stBegin:
            begin
              FEnd := '%';
            end;
        end;

        FSQL := FSQL + addSqlCond + ' and m.' + FFieldName + ' like ''' + FStart + FMatCode + FEnd + ''' order by m.' + FFieldName;

        FcdsFind.Macros.ParamByName('sql').AsString := FSQL;

        try
          if Assigned(OnStartSearch) then OnStartSearch(Self);
          FcdsFind.Open;

        finally
          if Assigned(OnEndSearch) then OnEndSearch(Self);
        end;

        FModified := False;

        if Length(FcdsFind.FieldByName('barcode').AsString) <> BC_CodeTo - BC_CodeFrom + 1
          then GetNext;
      end
      else if AForward
        then GetNext
        else GetPrior;

      if not FcdsFind.Eof and (Length(FcdsFind.FieldByName('barcode').AsString) = BC_CodeTo - BC_CodeFrom + 1)
      then begin
        if FMatCode <> FcdsFind.FieldByName('barcode').AsString then begin
          FEdit.Text := Copy(FFindStr, 1, Pos(FMatCode, FFindStr) - 1) +
            FcdsFind.FieldByName(FFieldName).AsString;
          FEdit.SelStart := Pos(FMatCode, FFindStr);
          FEdit.SelLength := Length(FcdsFind.FieldByName(FFieldName).AsString);
        end;
        FPrevFindStr := FFindStr;
        FPrevFindText := FEdit.Text;

        FMatName := FcdsFind.FieldByName('name').AsString;
        if (FMatID > 0) and (FLastID <> FMatID) then FLastID := FMatID;
        FMatID := FcdsFind.FieldByName('matid').AsInteger;
        FMeasure := FcdsFind.FieldByName('shortname').AsString;
        FGrpName := FcdsFind.FieldByName('grpname').AsString;
        FProducer := FcdsFind.FieldByName('producer').AsString;
        FArtikul := FcdsFind.FieldByName('artikul').AsString;
        FBarCode := FcdsFind.FieldByName('barcode').AsString;
        FCountry := FcdsFind.FieldByName('country').AsString;
        FIsSerial := FcdsFind.FieldByName('serials').AsInteger = 1;
        FWID := FcdsFind.FieldByName('wid').AsInteger;
        GetNDS;
        GetTaxes;
        FsearchState := oseFound;
        if Assigned(OnChange) then OnChange(Self);
      end // not eof...
      else begin
        searchFail(True);
      end;
      //ShowMessage(FMatCode + #13#10 + FloatToStr(FWeight_));
      //{$ENDIF} // FREE
    end // barcode

    else begin // by name or model
      if FModified or not FcdsFind.Active then begin
        if FcdsFind.Active then FcdsFind.Close;

        if FFieldName = '' then begin
          Screen.Cursor := crDefault;
          Exit;
        end;

        FStart := ''; FEnd := '';
        case FSearchType of
          stBegin: FEnd := '%';

          stSubstr:
            begin
              FEnd := '%';
              FStart := '%';
            end;
        end;

        FSQL := FSQL + addSqlCond + ' and upper(m.' + FFieldName + ') like ''' + FStart + AnsiUpperCase(FFindStr) + FEnd + ''' order by m.' + FFieldName;

        FcdsFind.Macros.ParamByName('sql').AsString := FSQL;
        try
          if Assigned(OnStartSearch) then OnStartSearch(Self);
          FcdsFind.Open;

        finally
          if Assigned(OnEndSearch) then OnEndSearch(Self);
        end;

        FModified := False;
      end // if FModified or not FcdsFind.Active

      else if AForward
        then FcdsFind.Next
        else FcdsFind.Prior;

      if not FcdsFind.Eof then begin
        FEdit.Text := FcdsFind.FieldByName(FFieldName).AsString;
        FEdit.SelStart := Length(FFindStr);
        FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);
        FPrevFindStr := FFindStr;
        FPrevFindText := FEdit.Text;

        FMatName  := FcdsFind.FieldByName('name').AsString;
        FMatID    := FcdsFind.FieldByName('matid').AsInteger;
        FMeasure  := FcdsFind.FieldByName('shortname').AsString;
        FGrpName  := FcdsFind.FieldByName('grpname').AsString;
        FProducer := FcdsFind.FieldByName('producer').AsString;
        FArtikul  := FcdsFind.FieldByName('artikul').AsString;
        FBarCode  := FcdsFind.FieldByName('barcode').AsString;
        FCountry  := FcdsFind.FieldByName('country').AsString;
        FIsSerial := FcdsFind.FieldByName('serials').AsInteger = 1;
        FWID      := FcdsFind.FieldByName('wid').AsInteger;

        GetNDS;
        GetTaxes;
        FsearchState := oseFound;
        if Assigned(OnChange) then OnChange(Self);

      end // not FcdsFind.Eof
      else begin
        searchFail(True);

        (*{$IFNDEF NODESIGN_}
        ssMessageDlg(LangManager.GetRS('Common', 'FindError') + ', ' + LangManager.GetRS('Common', 'DSEnd'), ssmtInformation, [ssmbOk]);
        {$ENDIF}
        *)
      end;
    end; // not barcode

  finally
    FLockFind := False;
  end;

  Screen.Cursor := crDefault;

  {$ENDIF} // NOT PKG
end;

//==============================================================================================
procedure TokMatSearchEdit.FindNameClick(Sender: TObject);
begin
  inherited;

  FLockFind := True;
  try
    case (Sender as TTBItem).Parent.IndexOf(Sender as TTBItem) of
      0: FEdit.Text := FMatName;
      1: FEdit.Text := FArtikul;
      2: FEdit.Text := FBarCode;
    end;
  finally
    FLockFind := False;
  end;
  if Assigned(OnTypeChanged) then OnTypeChanged(Self);
end;

//==============================================================================================
function TokMatSearchEdit.GetID: Integer;
begin
  Result := MatID;
end;

//==============================================================================================
function TokMatSearchEdit.GetMatCode(S: string): string;
 var
  i: Integer;
begin
  {$IFNDEF PKG}
  Result := '';
  for i := BC_CodeFrom to Length(S) do begin
    if i <= BC_CodeTo then Result := Result + S[i];
  end;
  {$ENDIF}
end;

//==============================================================================================
procedure TokMatSearchEdit.GetNDS;
begin
  if not FLoadNDS or not Assigned(RemoteServer) then Exit;

  with TssClientDataSet.Create(nil) do
  try
    RemoteServer := Self.RemoteServer;
    ProviderName := 'pMaterials_GetNDS';
    FetchParams;
    Params.ParamByName('matid').AsInteger := FMatID;
    Open;
    if not IsEmpty then FNDS := FieldByName('nds').AsFloat;
    if FNDS = -1 then FNDS := 0;
    Close;
  finally
    Free;
  end;  
end;

//==============================================================================================
procedure TokMatSearchEdit.GetTaxes;
begin
  if not FLoadTaxes or not Assigned(RemoteServer) then Exit;
  with FTaxes do begin
    if Active then Close;
    FetchParams;
    Params.ParamByName('matid').AsInteger := FMatID;
    Open;
  end;
end;

//==============================================================================================
function TokMatSearchEdit.GetWeight(S: string): Extended;
  {$IFNDEF PKG}
  var
    i: Integer;
    FInt, FFrac: string;
  {$ENDIF}
begin
  Result := 0;
  {$IFNDEF PKG}
  FInt := '0';
  FFrac := '0';
  for i := BC_Weight_IntFrom to Length(S) do begin
    if i <= BC_Weight_IntTo then FInt := FInt + S[i];
  end;
  for i := BC_Weight_FracFrom to Length(S) do begin
    if i <= BC_Weight_FracTo then FFrac := FFrac + S[i];
  end;
  Result := StrToFloat(FInt) + StrToInt(FFrac) / Power(10, Length(FFrac) - 1);
  {$ENDIF}
end;

//==============================================================================================
procedure TokMatSearchEdit.InitRes;
begin
  inherited;

  if not Assigned(LangManager) then Exit;

  with LangManager do begin
    CapRef := GetRS('fmWaybill', 'MatAdd');
    SearchNames.Clear;
    SearchNames.Add(GetRS('fmWaybill', 'Name') + ';name');
    SearchNames.Add(GetRS('fmWaybill', 'Artikul') + ';artikul');
    SearchNames.Add(GetRS('fmMaterials', 'BarCode') + ';barcode');
  end;
end;

//==============================================================================================
procedure TokMatSearchEdit.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if (CurrentSearchIndex = 2) and PtInRect(FScannerRect, Point(X, Y)) then begin
    //Application.CancelHint;
    {$IFNDEF PKG}Self.Hint := LangMan.GetRS('fmWaybill', 'BCHint');{$ENDIF}
  end
  else begin
    Self.Hint := '';
    Application.CancelHint;
  end;
  {if (FCol <> FCurrCol) or (FNode <> FCurrNode) or (FHeader <> FCurrHeader) then begin
     Application.CancelHint;
      if FNode <> nil then begin
        if Self.Canvas.TextWidth(VarToStr(FNode.Values[FCol.Index])) > FCol.Width
          then Self.Hint := VarToStr(FNode.Values[FCol.Index])
          else Self.Hint := '';
      end
      else if FHeader <> nil then begin
        Self.Hint := FHeader.Caption;
      end;
      FCurrCol := FCol;
      FCurrNode := FNode;
      FCurrHeader := FHeader;
    end;
  end
  else begin
    Self.Hint := '';
    FCurrCol := nil;
    FCurrNode := nil;
    Application.CancelHint;
  end;
  }
end;

//==============================================================================================
procedure TokMatSearchEdit.Paint;
begin
  inherited;

  with Canvas do begin
    if CurrentSearchIndex = 2 then begin
      With FScannerRect do begin
        Left := EditorOffset;
        Top := (Self.Height - Images.Height) div 2;
        Right := Left + Images.Width;
        Bottom := Top + Images.Height;
        if Enabled
          then Images.Draw(Self.Canvas, Left, Top, FScannerImageIndex)
          else DisabledImages.Draw(Self.Canvas, Left, Top, FScannerImageIndex);
      end;
    end
    else begin
    end;
  end;

end;

//==============================================================================================
procedure TokMatSearchEdit.SetCurrentSearchIndex(const Value: Integer);
begin
  inherited;

  if FCurrentSearchIndex <> -1 then begin
    Self.FPopup.Items[Value].Checked := True;
    case FCurrentSearchIndex of
      0: FEdit.Text := FMatName;
      1: FEdit.Text := FArtikul;
      2: FEdit.Text := FBarCode;
    end;
  end;

  AdjustCtrls;
  FLng.Visible := FShowLng and (CurrentSearchIndex <> 2);
  Invalidate;
  Editor.Repaint;
end;

//==============================================================================================
procedure TokMatSearchEdit.SetID(const Value: Integer);
begin
  MatID := Value;
end;

//==============================================================================================
procedure TokMatSearchEdit.refreshMat;
begin
  if FMatID > 0 then
    with TssClientDataSet.Create(nil) do
    try
      RemoteServer := Self.RemoteServer;

      if FWareHouses <> '' then begin
        ProviderName := 'GetMatBy_ID_and_WH'; // AP: 2007-01-29: allow right warehouse to be fetched
        FetchMacros;
        Macros.ParamByName('w').AsString := FWareHouses;
      end
      else ProviderName := 'GetMatBy_ID'; // prov groups: ssPack/SearchEDit/MatSearchEdit

      FetchParams;
      Params.ParamByName('MatId').AsInteger := FMatID;

      Open;
      if not IsEmpty then begin
        FMatName := FieldByName('name').AsString;
        FMeasure := FieldByName('msrname').AsString;
        FArtikul := FieldByName('artikul').AsString;
        FBarCode := FieldByName('barcode').AsString;
        FCountry := FieldByName('country').AsString;
        FProducer := FieldByName('producer').AsString;
        FGrpName := FieldByName('grpname').AsString;
        FWID := FieldByName('wid').AsInteger;
        FIsSerial := FieldByName('serials').AsInteger = 1;
        GetNDS;
        GetTaxes;
      end
      else begin // empty
        FMatID := 0;
      end;
      Close;

    finally
      Free;
    end;

  if FMatID = 0 then begin
    FMatName := '';
    FMeasure := '';
    FArtikul := '';
    FBarCode := '';
    FCountry := '';
    FWeight := 0;
    FIsSerial := False;
    FWID := 0;
    FGrpName := '';
    FNDS := 0;
    FTaxes.Close;
    FPrevFindStr := '';
    FPrevFindText := '';
  end;

  FLockFind := True;
  case CurrentSearchIndex of
    0: FEdit.Text := FMatName;
    1: FEdit.Text := FArtikul;
    2: FEdit.Text := FBarCode;
  end;
  FLockFind := False;
  if Assigned(OnChange) then OnChange(Self);
end;

//==============================================================================================
procedure TokMatSearchEdit.SetMatID(const Value: Integer);
begin
  if Value = FMatID then Exit;
  if FMatID > 0 then FLastID := FMatID;
  FMatID := Value;

  refreshMat;
end;

//==============================================================================================
procedure TokMatSearchEdit.SetRemoteServer(const Value: TSocketConnection);
begin
  inherited;

  if Value <> nil then begin
    FTaxes.RemoteServer := Value;
  end
  else FTaxes.RemoteServer := nil;
end;

//==============================================================================================
procedure TokMatSearchEdit.SetScannerImageIndex(const Value: Integer);
begin
  FScannerImageIndex := Value;
end;

//==============================================================================================
procedure TokMatSearchEdit.SetWeight(const Value: Extended);
begin
  FWeight := Value;
  if Assigned(FOnWeightChanged) then FOnWeightChanged(Self);
end;

//==============================================================================================
procedure TokMatSearchEdit.SetWareHouses(const Value: String);
begin
  FWareHouses := Value;
  refreshMat;
  //if Assigned(FOnWareHousesChanged) then FOnWareHousesChanged(Self);
  //findAgain;
end;

{TokSvcSearchEdit}

//==============================================================================================
//==============================================================================================
//==============================================================================================
procedure TokSvcSearchEdit.DoSearch(AForward: Boolean);
var
  FSQL: string;
  FFieldName: string;
begin
  if not Assigned(RemoteServer) or not RemoteServer.Connected or FLockFind then Exit;

  FLockFind := True;
  try
    FSQL := '';
    if not FBSPressed and FModified
      then FFindStr := FEdit.Text
      else FBSPressed := False;

    if FFindStr = '' then begin
      FSvcID := 0;
      FPrevFindStr := '';
      FPrevFindText := '';
      if Assigned(OnChange) then OnChange(Self);
      Exit;
    end;

    FFieldName := ExtractWord(2, SearchNames[CurrentSearchIndex], [';']);
    if FModified or not FcdsFind.Active then begin
      if FcdsFind.Active then FcdsFind.Close;
      if FFieldName = '' then Exit;

      FSQL := 'select s.svcid, s.name, s.artikul, ms.shortname, s.price, ' +
        ' s.currid, s.norm, s.istransport, s.isnormed ' +
        ' from services s, measures ms where ms.mid=s.mid and upper(s.' +
        FFieldName + ') like ''' +
        AnsiUpperCase(FFindStr) + '%'' order by s.' + FFieldName;
      FcdsFind.Macros.ParamByName('sql').AsString := FSQL;
      try
        if Assigned(OnStartSearch) then OnStartSearch(Self);
        FcdsFind.Open;
      finally
        if Assigned(OnEndSearch) then OnEndSearch(Self);
      end;
      FModified := False;
    end
    else if AForward
      then FcdsFind.Next
      else FcdsFind.Prior;

    if not FcdsFind.Eof then begin
      FEdit.Text := FcdsFind.FieldByName(FFieldName).AsString;
      FEdit.SelStart := Length(FFindStr);
      FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);
      FPrevFindStr := FFindStr;
      FPrevFindText := FEdit.Text;

      FSvcName := FcdsFind.FieldByName('name').AsString;
      if (FSvcID > 0) and (FLastID <> FSvcID) then FLastID := FSvcID;
      FSvcID := FcdsFind.FieldByName('svcid').AsInteger;
      FMeasure := FcdsFind.FieldByName('shortname').AsString;
      FArtikul := FcdsFind.FieldByName('artikul').AsString;
      FCurrID := FcdsFind.FieldByName('currid').AsInteger;
      FIsTransport := FcdsFind.FieldByName('istransport').AsInteger = 1;
      FIsNormed := FcdsFind.FieldByName('isnormed').AsInteger = 1;
      FNorm := FcdsFind.FieldByName('norm').AsFloat;
      FPrice := FcdsFind.FieldByName('price').AsFloat;
      if Assigned(OnChange) then OnChange(Self);
    end
    else begin
      Editor.Style.Color := okSearchFailedColor;
      Application.ProcessMessages;
      SysUtils.Beep;
      Sleep(100);
      Editor.Style.Color := clWindow;

      FFindStr := FPrevFindStr;
      FEdit.Text := FPrevFindText;
      FEdit.SelStart := Length(FFindStr);
      FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);
      if Assigned(OnFailSearch) then OnFailSearch(Self);
    end
  finally
    FLockFind := False;
  end;
end;

//==============================================================================================
procedure TokSvcSearchEdit.FindNameClick(Sender: TObject);
begin
  inherited;

  FLockFind := True;
  try
    if (Sender as TTBItem).Parent.IndexOf(Sender as TTBItem) = 0
      then FEdit.Text := FSvcName
      else FEdit.Text := FArtikul
  finally
    FLockFind := False;
  end;
end;

//==============================================================================================
function TokSvcSearchEdit.GetID: Integer;
begin
  Result := SvcID;
end;

//==============================================================================================
procedure TokSvcSearchEdit.IDChanged(const Value: Integer);
begin
  SvcID := Value;
end;

//==============================================================================================
procedure TokSvcSearchEdit.InitRes;
begin
  inherited;

  if not Assigned(LangManager) then Exit;

  with LangManager do begin
    CapRef := GetRS('fmWaybill', 'SvcRef');
    SearchNames.Clear;
    SearchNames.Add(GetRS('fmWaybill', 'Name') + ';name');
    SearchNames.Add(GetRS('fmWaybill', 'Artikul') + ';artikul');
  end;
end;

//==============================================================================================
procedure TokSvcSearchEdit.RefButtonClick(Sender: TObject);
begin
  if Assigned(OnRefButtonClick) then inherited
  {$IFNDEF PKG}
    else ShowModalRef(Self, rtServices, vtServices, 'TfmServices', Date, Self.SvcID);
  {$ENDIF}
end;

//==============================================================================================
procedure TokSvcSearchEdit.SetID(const Value: Integer);
begin
  SvcID := Value;
end;

//==============================================================================================
procedure TokSvcSearchEdit.SetSvcID(const Value: Integer);
begin
  if Value = FSvcID then Exit;
  if (FSvcID > 0) and (FLastID <> FSvcID) then FLastID := FSvcID;
  FSvcID := Value;
  with TssClientDataSet.Create(nil) do
  try
    RemoteServer := Self.RemoteServer;
    ProviderName := 'pSvc_Get';
    FetchParams;
    Params.ParamByName('svcid').AsInteger := Value;
    Open;
    if not IsEmpty then begin
      FSvcName := FieldByName('name').AsString;
      FMeasure := FieldByName('msrname').AsString;
      FArtikul := FieldByName('artikul').AsString;
      FPrice := FieldByName('price').AsFloat;
      FCurrID := FieldByName('currid').AsInteger;
      FNorm := FieldByName('norm').AsFloat;
      FIsTransport := FieldByName('istransport').AsInteger = 1;
      FIsNormed := FieldByName('isnormed').AsInteger = 1;
    end
    else begin
      FSvcName := '';
      FMeasure := '';
      FArtikul := '';
      FPrice := 0;
      FCurrID := 0;
      FNorm := 0;
      FIsTransport := False;
      FIsNormed := False;
    end;
    Close;
    FLockFind := True;
    if CurrentSearchIndex = 0
      then FEdit.Text := FSvcName
      else FEdit.Text := FArtikul;
    FLockFind := False;  
  finally
    Free;
  end;
  if Assigned(OnChange) then OnChange(Self);
end;

{ TokKASearchEdit }

//==============================================================================================
constructor TokKASearchEdit.Create(AOwner: TComponent);
begin
  inherited;

  FObj := TokKAgent.Create(nil);

  LoadContracts := False;
  LoadPersons := False;
end;

//==============================================================================================
destructor TokKASearchEdit.Destroy;
begin
  FObj.Free;

  inherited;
end;

//==============================================================================================
procedure TokKASearchEdit.DoSearch(AForward: Boolean);
  var
   FSQL: String;
   FFieldName: String;
   FStart, FEnd: String;
begin
  if not Assigned(RemoteServer) or not RemoteServer.Connected then Exit;

  FLockFind := True;

  try
    FSQL := '';
    if not FBSPressed and FModified
      then FFindStr := FEdit.Text
      else FBSPressed := False;

    if FFindStr = '' then begin
      FKAID := 0;
      FObj.KAID := 0;
      FPrevFindStr := '';
      FPrevFindText := '';
      if Assigned(OnChange) then OnChange(Self);
      Exit;
    end;

    FFieldName := ExtractWord(2, SearchNames[CurrentSearchIndex], [';']);
    if FModified or not FcdsFind.Active then begin
      if FcdsFind.Active then FcdsFind.Close;
      if FFieldName = '' then Exit;
      FStart := ''; FEnd := '';
      case FSearchType of
        stBegin:
          begin
            FEnd := '%';
          end;
        stSubstr:
          begin
            FEnd := '%';
            FStart := '%';
          end;
      end;

      FSQL := 'select * from kagent where coalesce(archived, 0)=0 ' +
              ' and upper(' + FFieldName + ') like ''' + FStart + AnsiUpperCase(FFindStr) + FEnd + '''';

      if FSearchMode = smOwnFirms then FSQL := FSQL + ' and ktype=3 ';

      FSQL := FSQL + ' order by ' + FFieldName;
      FcdsFind.Macros.ParamByName('sql').AsString := FSQL;

      try
        if Assigned(OnStartSearch) then OnStartSearch(Self);
        FcdsFind.Open;

      finally
        if Assigned(OnEndSearch) then OnEndSearch(Self);
      end;

      FModified := False;
    end
    else if AForward
         then FcdsFind.Next
         else FcdsFind.Prior;

    if not FcdsFind.Eof then begin
      FEdit.Text := FcdsFind.FieldByName(FFieldName).AsString;
      FEdit.SelStart := Length(FFindStr);
      FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);
      FPrevFindStr := FFindStr;
      FPrevFindText := FEdit.Text;

      if (FKAID > 0) and (FLastID <> FKAID) then FLastID := FKAID;

      FKAID := FcdsFind.FieldByName('kaid').AsInteger;
      FObj.KAID := FKAID;

      if Assigned(OnChange) then OnChange(Self);
    end
    else begin
      Editor.Style.Color := okSearchFailedColor;
      Application.ProcessMessages;
      SysUtils.Beep;
      Sleep(100);
      Editor.Style.Color := clWindow;

      FFindStr := FPrevFindStr;
      FEdit.Text := FPrevFindText;
      FEdit.SelStart := Length(FFindStr);
      FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);

      if Assigned(OnFailSearch) then OnFailSearch(Self);
    end

  finally
    FLockFind := False;
  end;
end;

//==============================================================================================
procedure TokKASearchEdit.FindNameClick(Sender: TObject);
begin
  inherited;

  FLockFind := True;
  try
    if (Sender as TTBItem).Parent.IndexOf(Sender as TTBItem) = 0
      then FEdit.Text := FObj.Name_
      else FEdit.Text := FObj.Name_;

  finally
    FLockFind := False;
  end;
end;

//==============================================================================================
function TokKASearchEdit.GetID: Integer;
begin
  Result := KAID;
end;

//==============================================================================================
procedure TokKASearchEdit.IDChanged(const Value: Integer);
begin
  KAID := Value;
end;

//==============================================================================================
procedure TokKASearchEdit.InitRes;
begin
  inherited;

  if not Assigned(LangManager) then Exit;

  with LangManager do begin
    case FSearchMode of
      smAll:      CapRef := GetRS('fmWaybill', 'KAAdd');
      smOwnFirms: CapRef := GetRS('fmKAgent', 'EntsRef');
    end;

    SearchNames.Clear;
    SearchNames.Add(GetRS('fmKAgent', 'Name') + ';name');
  end;
end;

//==============================================================================================
procedure TokKASearchEdit.RefButtonClick(Sender: TObject);
begin
  if Assigned(OnRefButtonClick)
    then inherited
    {$IFNDEF PKG}
    else
      case FSearchMode of
        smAll:      ShowModalRef(Self, rtKAgent, vtKAgent, 'TfmKAgent', Date, Self.KAID);
        smOwnFirms: ShowModalRef(Self, rtEnt, vtKAgent, 'TfmKAgent', Date, Self.KAID);
      end;
    {$ENDIF}
end;

//==============================================================================================
procedure TokKASearchEdit.SetID(const Value: Integer);
begin
  KAID := Value;
end;

//==============================================================================================
procedure TokKASearchEdit.SetKAID(const Value: Integer);
begin
  if Value = FKAID then Exit;

  FObj.KAID := Value;

  if (FKAID > 0) and (FLastID <> FKAID) then FLastID := FKAID;

  FKAID := FObj.KAID;
  FLockFind := True;

  if CurrentSearchIndex = 0 then FEdit.Text := FObj.Name_;

  FLockFind := False;

  if Assigned(OnChange) then OnChange(Self);
end;

//==============================================================================================
procedure TokKASearchEdit.SetLoadContracts(const Value: Boolean);
begin
  FLoadContracts := Value;
  Obj.LoadContracts := Value;
end;

//==============================================================================================
procedure TokKASearchEdit.SetLoadPersons(const Value: Boolean);
begin
  FLoadPersons := Value;
  Obj.LoadPersons := Value;
end;

//==============================================================================================
procedure TokKASearchEdit.SetRemoteServer(const Value: TSocketConnection);
begin
  inherited;

  if Value <> nil
    then FObj.RemoteServer := Value
    else FObj.RemoteServer := nil;
end;

//==============================================================================================
procedure TokKASearchEdit.SetSearchMode(const Value: TokKASearchMode);
begin
  FSearchMode := Value;

  if not Assigned(LangManager) then Exit;

  with LangManager do begin
    case FSearchMode of
      smAll:      CapRef := GetRS('fmWaybill', 'KAAdd');
      smOwnFirms: CapRef := GetRS('fmKAgent', 'EntsRef');
    end;
  end;
end;

{ TokDocSearchEdit }

//==============================================================================================
procedure TokDocSearchEdit.DoSearch(AForward: Boolean);
  var
    FSQL: String;
    FFieldName: String;
    FKA: string;
begin
  if not Assigned(RemoteServer) or not RemoteServer.Connected then Exit;

  FLockFind := True;

  try
    FSQL := '';

    if not FBSPressed and FModified
      then FFindStr := FEdit.Text
      else FBSPressed := False;

    if FFindStr = '' then begin
      FID := 0;
      FPrevFindStr := '';
      FPrevFindText := '';
      if Assigned(OnChange) then OnChange(Self);
      Exit;
    end;

    FFieldName := 'num';

    if FModified or not FcdsFind.Active then begin
      if FcdsFind.Active then FcdsFind.Close;

      if FFieldName = '' then Exit;

      if FKAID = 0
        then FKA := ''
        else FKA := ' and kaid=' + IntToStr(FKAID);

      FSQL := 'select * from waybilllist where wtype=' + IntToStr(FWType) +
             ' and upper(' + FFieldName + ') like ''' + AnsiUpperCase(FFindStr) + '%'' ' + FKA + ' order by ' + FFieldName;

      FcdsFind.Macros.ParamByName('sql').AsString := FSQL;

      try
        if Assigned(OnStartSearch) then OnStartSearch(Self);
        FcdsFind.Open;

      finally
        if Assigned(OnEndSearch) then OnEndSearch(Self);
      end;

      FModified := False;
    end
    else if AForward
         then FcdsFind.Next
         else FcdsFind.Prior;

    if not FcdsFind.Eof then begin
      FEdit.Text := FcdsFind.FieldByName(FFieldName).AsString;
      FEdit.SelStart := Length(FFindStr);
      FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);
      FPrevFindStr := FFindStr;
      FPrevFindText := FEdit.Text;

      FDocNum := FcdsFind.FieldByName('num').AsString;
      FID := FcdsFind.FieldByName('wbillid').AsInteger;
      FKAID := FcdsFind.FieldByName('kaid').AsInteger;
      FDocDate := FcdsFind.FieldByName('ondate').AsDateTime;
      FDocSumm := FcdsFind.FieldByName('summall').AsCurrency;
      FPaidSumm := FcdsFind.FieldByName('summpay').AsCurrency;
      FDocSaldo := FDocSumm - FPaidSumm;

      //GetDocSaldo;
      if Assigned(OnChange) then OnChange(Self);
    end
    else begin
      Editor.Style.Color := okSearchFailedColor;
      Application.ProcessMessages;
      SysUtils.Beep;
      Sleep(100);
      Editor.Style.Color := clWindow;

      FFindStr := FPrevFindStr;
      FEdit.Text := FPrevFindText;
      FEdit.SelStart := Length(FFindStr);
      FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);

      if Assigned(OnFailSearch) then OnFailSearch(Self);
    end

  finally
    FLockFind := False;
  end;
end;

//==============================================================================================
procedure TokDocSearchEdit.GetDocSaldo;
begin
  if FLoadDocSaldo then
    with TssClientDataSet.Create(nil) do
    try
      RemoteServer := Self.RemoteServer;
      ProviderName := 'pPayDoc_GetPaysByWB';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FID;
      Open;
      FPaidSumm := Fields[0].AsCurrency;
      FDocSaldo := FDocSumm - FPaidSumm;
      Close;

    finally
      Free;
    end;
end;

//==============================================================================================
function TokDocSearchEdit.GetID: Integer;
begin
  Result := FID;
end;

//==============================================================================================
procedure TokDocSearchEdit.InitRes;
begin
  if not Assigned(LangManager) then Exit;

  with LangManager do begin
    SearchNames.Clear;
    SearchNames.Add(GetRS('fmWaybill', 'DocNum') + ';num');
  end;
end;

//==============================================================================================
procedure TokDocSearchEdit.ReloadData;
begin
  with TssClientDataSet.Create(nil) do
  try
    RemoteServer := Self.RemoteServer;
    ProviderName := 'pWaybill_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := FID;
    Open;
    if not IsEmpty then begin
      FKAID := FieldByName('kaid').AsInteger;
      FDocNum := FieldByName('num').AsString;
      FDocDate := FieldByName('ondate').AsDateTime;
      FDocSumm := FieldByName('summall').AsCurrency;
      FPaidSumm := FieldByName('summpay').AsCurrency;
      FDocSaldo := FDocSumm - FPaidSumm;
    end
    else begin
      FDocNum := '';
      FDocDate := 0;
      FDocSumm := 0;
    end;
    Close;
    //GetDocSaldo;
    FLockFind := True;
    FEdit.Text := FDocNum;
    FLockFind := False;

  finally
    Free;
  end;
  if Assigned(OnChange) then OnChange(Self);
end;

//==============================================================================================
procedure TokDocSearchEdit.SetID(const Value: Integer);
begin
  if Value = FID then Exit;
  FID := Value;
  ReloadData;
end;

//==============================================================================================
procedure TokDocSearchEdit.SetKAID(const Value: Integer);
begin
  FKAID := Value;
end;

//==============================================================================================
procedure TokDocSearchEdit.SetLoadDocSaldo(const Value: Boolean);
begin
  FLoadDocSaldo := Value;
end;

//==============================================================================================
procedure TokDocSearchEdit.SetWType(const Value: Integer);
begin
  FWType := Value;
end;

{ TokContractSearchEdit }

//==============================================================================================
constructor TokContractSearchEdit.Create(AOwner: TComponent);
begin
  inherited;

  FContractType := ctAll;
  FbtnRef.ImageIndex := 45;
  FOnDate := MaxDateTime;

  FObj := TokContract.Create(nil);
end;

//==============================================================================================
destructor TokContractSearchEdit.Destroy;
begin
  FObj.Free;

  inherited;
end;

//==============================================================================================
procedure TokContractSearchEdit.DoSearch(AForward: Boolean);
  var
    FSQL: String;
    FFieldName: String;
    FKA: string;
begin
  if not Assigned(RemoteServer) or not RemoteServer.Connected then Exit;

  FLockFind := True;

  try
    FSQL := '';
    if not FBSPressed and FModified
      then FFindStr := FEdit.Text
      else FBSPressed := False;

    if FFindStr = '' then begin
      FDocID := 0;
      Obj.DocID := 0;
      FPrevFindStr := '';
      FPrevFindText := '';
      if Assigned(OnChange) then OnChange(Self);
      Exit;
    end;

    FFieldName := 'num';

    if FModified or not FcdsFind.Active then begin
      if FcdsFind.Active then FcdsFind.Close;

      if FFieldName = '' then Exit;

      if FKAID = 0
        then FKA := ''
        else FKA := ' and c.kaid=' + IntToStr(FKAID);

      FSQL := 'select c.*, d.doctype from contracts c, docs d where c.docid=d.docid ';

      case FContractType of
        ctIn: FSQL := FSQL + ' and d.doctype=8';
        ctOut: FSQL := FSQL + ' and d.doctype=-8';
      end;

      FSQL := FSQL + ' and c.checked=1 and upper(c.' + FFieldName + ') like ''' +
        AnsiUpperCase(FFindStr) + '%'' ' + FKA + ' order by c.' + FFieldName;

      FcdsFind.Macros.ParamByName('sql').AsString := FSQL;

      try
        if Assigned(OnStartSearch) then OnStartSearch(Self);
        FcdsFind.Open;

      finally
        if Assigned(OnEndSearch) then OnEndSearch(Self);
      end;

      FModified := False;
    end
    else if AForward
         then FcdsFind.Next
         else FcdsFind.Prior;

    if not FcdsFind.Eof then begin
      FEdit.Text := FcdsFind.FieldByName(FFieldName).AsString;
      FEdit.SelStart := Length(FFindStr);
      FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);
      FPrevFindStr := FFindStr;
      FPrevFindText := FEdit.Text;

      FObj.DocID := FcdsFind.FieldByName('docid').AsInteger;
      FDocID := FObj.DocID;

      if Assigned(OnChange) then OnChange(Self);
    end
    else begin
      Editor.Style.Color := okSearchFailedColor;
      Application.ProcessMessages;
      SysUtils.Beep;
      Sleep(100);
      Editor.Style.Color := clWindow;

      FFindStr := FPrevFindStr;
      FEdit.Text := FPrevFindText;
      FEdit.SelStart := Length(FFindStr);
      FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);
      if Assigned(OnFailSearch) then OnFailSearch(Self);
    end

  finally
    FLockFind := False;
  end;
end;

//==============================================================================================
function TokContractSearchEdit.GetID: Integer;
begin
  Result := DocID;
end;

//==============================================================================================
procedure TokContractSearchEdit.IDChanged(const Value: Integer);
begin
  DocID := Value;
end;

//==============================================================================================
procedure TokContractSearchEdit.InitRes;
begin
  if not Assigned(LangManager) then Exit;

  with LangManager do begin
    SearchNames.Clear;
    SearchNames.Add(GetRS('fmContr', 'Contract') + ';num');

    CapRef := GetRS('fmWaybill', 'ContrReestr');
  end;
end;

//==============================================================================================
procedure TokContractSearchEdit.RefButtonClick(Sender: TObject);
  {$IFNDEF PKG}
  var
    FRefType: TRefType;
    FViewType: TCCViewType;
  {$ENDIF}
begin
  if Assigned(OnRefButtonClick)
    then inherited
    {$IFNDEF PKG}
    else begin
      case ContractType of
        ctIn:
          begin
            FRefType := rtContrIn;
            FViewType := vtContrIn;
          end;

        ctOut:
          begin
            FRefType := rtContrOut;
            FViewType := vtContrOut;
          end;

        else begin // for a strange fuckup
          FRefType := rtContrOut;
          FViewType := vtContrOut;
        end;
      end;

      ShowModalRef(Self, FRefType, FViewType, 'TfmContr', Date, Self.DocID);
    end;
    {$ENDIF}
end;

//==============================================================================================
procedure TokContractSearchEdit.ReloadData;
begin
  with TssClientDataSet.Create(nil) do
  try
    RemoteServer := Self.RemoteServer;
    ProviderName := 'pContr_GetEx';
    FetchParams;
    Params.ParamByName('docid').AsInteger := FDocID;
    Open;
    if not IsEmpty and
       (((FContractType in [ctAll, ctIn]) and (FieldByName('doctype').AsInteger = 8))
        or
       ((FContractType in [ctAll, ctOut]) and (FieldByName('doctype').AsInteger = -8)))
    then FObj.DocID := FDocID
    else FObj.DocID := 0;

    Close;

    FLockFind := True;
    FEdit.Text := FObj.Num;
    FLockFind := False;

  finally
    Free;
  end;

  FLocked := True;
  if Assigned(OnChange) then OnChange(Self);
  FLocked := False;
end;

//==============================================================================================
procedure TokContractSearchEdit.SetContractType(const Value: TokContractType);
begin
  FContractType := Value;
end;

//==============================================================================================
procedure TokContractSearchEdit.SetDocID(const Value: Integer);
begin
  //if Value = FDocID then Exit;
  FDocID := Value;
  ReloadData;
end;

//==============================================================================================
procedure TokSearchEdit.SetText(const Value: string);
begin
  Editor.Text := Value;
end;

//==============================================================================================
procedure TokSearchEdit.SetViewMode(const Value: TokSearchViewMode);
begin
  FViewMode := Value;

  case Value of
    vmSearch:
      begin
        FEdit.Visible := True;
        FCombo.Visible := False;
      end;

    vmList:
      begin
        FEdit.Visible := False;
        FCombo.Visible := True;
      end;
  end;
end;

//==============================================================================================
procedure TokSearchEdit.ShowRef;
begin
  RefButtonClick(Self);
end;

//==============================================================================================
procedure TokSearchEdit.WMRefresh(var M: TMessage);
begin
  IDChanged(M.WParam);
  case ViewMode of
    vmSearch: Editor.SetFocus;
    vmList:   FCombo.SetFocus;
  end;
end;

//==============================================================================================
procedure TokSearchEdit.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  case ViewMode of
    vmSearch: Editor.SetFocus;
    vmList:   FCombo.SetFocus;
  end;
end;

//==============================================================================================
procedure TokContractSearchEdit.SetID(const Value: Integer);
begin
  DocID := Value;
end;

//==============================================================================================
procedure TokContractSearchEdit.SetKAID(const Value: Integer);
begin
  FKAID := Value;
end;

//==============================================================================================
procedure TokContractSearchEdit.SetOnDate(const Value: TDateTime);
begin
  FOnDate := Value;
end;

//==============================================================================================
procedure TokContractSearchEdit.SetRemoteServer(
  const Value: TSocketConnection);
begin
  inherited;

  if Value <> nil
    then FObj.RemoteServer := Value
    else FObj.RemoteServer := nil;
end;

{ TokPayDocSearchEdit }

//==============================================================================================
constructor TokPayDocSearchEdit.Create(AOwner: TComponent);
begin
  inherited;

  FbtnRef.ImageIndex := 47;

  FObj := TokPayDoc.Create(nil);
end;

//==============================================================================================
destructor TokPayDocSearchEdit.Destroy;
begin
  FObj.Free;

  inherited;
end;

//==============================================================================================
procedure TokPayDocSearchEdit.DoSearch(AForward: Boolean);
  var
    FSQL: String;
    FFieldName: String;
    FKA: string;
begin
  if not Assigned(RemoteServer) or not RemoteServer.Connected then Exit;

  FLockFind := True;

  try
    FSQL := '';
    if not FBSPressed and FModified
      then FFindStr := FEdit.Text
      else FBSPressed := False;

    if FFindStr = '' then begin
      FPayDocID := 0;
      Obj.PayDocID := 0;
      FPrevFindStr := '';
      FPrevFindText := '';
      if Assigned(OnChange) then OnChange(Self);
      Exit;
    end;

    FFieldName := 'docnum';

    if FModified or not FcdsFind.Active then begin
      if FcdsFind.Active then FcdsFind.Close;

      if FFieldName = '' then Exit;

      if FKAID = 0
        then FKA := ''
        else FKA := ' and pd.kaid=' + IntToStr(FKAID);

      FSQL := 'select pd.* from paydoc pd';
      case FDocType of
        pdtIn: FSQL := FSQL + ' where pd.doctype=1';
        pdtOut: FSQL := FSQL + ' where pd.doctype=-1';
        pdtCharge: FSQL := FSQL + ' where pd.doctype=-2';
      end;

      FSQL := FSQL + ' and pd.checked=1 and upper(pd.' + FFieldName + ') like ''' +
              AnsiUpperCase(FFindStr) + '%'' ' + FKA + ' order by pd.' + FFieldName;

      FcdsFind.Macros.ParamByName('sql').AsString := FSQL;

      try
        if Assigned(OnStartSearch) then OnStartSearch(Self);
        FcdsFind.Open;

      finally
        if Assigned(OnEndSearch) then OnEndSearch(Self);
      end;

      FModified := False;
    end
    else if AForward
         then FcdsFind.Next
         else FcdsFind.Prior;

    if not FcdsFind.Eof then begin
      FEdit.Text := FcdsFind.FieldByName(FFieldName).AsString;
      FEdit.SelStart := Length(FFindStr);
      FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);
      FPrevFindStr := FFindStr;
      FPrevFindText := FEdit.Text;

      FObj.PayDocID := FcdsFind.FieldByName('paydocid').AsInteger;
      FPayDocID := FObj.PayDocID;

      if Assigned(OnChange) then OnChange(Self);
    end
    else begin
      DoError;

      FFindStr := FPrevFindStr;
      FEdit.Text := FPrevFindText;
      FEdit.SelStart := Length(FFindStr);
      FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);
      if Assigned(OnFailSearch) then OnFailSearch(Self);
    end
  finally
    FLockFind := False;
  end;
end;

//==============================================================================================
function TokPayDocSearchEdit.GetDocType: TokPayDocType;
begin
  Result := FObj.DocType;
end;

//==============================================================================================
function TokPayDocSearchEdit.GetID: Integer;
begin
  Result := PayDocID;
end;

//==============================================================================================
procedure TokPayDocSearchEdit.IDChanged(const Value: Integer);
begin
  PayDocID := Value;
end;

//==============================================================================================
procedure TokPayDocSearchEdit.InitRes;
begin
  if not Assigned(LangManager) then Exit;

  with LangManager do begin
    SearchNames.Clear;
    SearchNames.Add(GetRS('fmWaybill', 'PayNum') + ';docnum');

    SetDocTypeInfo(FDocType);
  end;
end;

//==============================================================================================
procedure TokPayDocSearchEdit.RefButtonClick(Sender: TObject);
  {$IFNDEF PKG}
  var
    FRefType: TRefType;
    FViewType: TCCViewType;
  {$ENDIF}
begin
  if Assigned(OnRefButtonClick)
    then inherited
    {$IFNDEF PKG}
    else begin
      case FDocType of
        pdtIn:
          begin
            FRefType := rtPDIn;
            FViewType := vtPDIn;
          end;

        pdtOut:
          begin
            FRefType := rtPDOut;
            FViewType := vtPDOut;
          end;

        else begin // for a strange fuckup
          FRefType := rtPDOut;
          FViewType := vtPDOut;
        end;
      end;

      ShowModalRef(Self, FRefType, FViewType, 'TfmPayDoc', Date, Self.PayDocID, FKAID);
    end;
    {$ENDIF}
end;

//==============================================================================================
procedure TokPayDocSearchEdit.ReloadData;
begin
  FObj.PayDocID := FPayDocID;
  FLockFind := True;
  if KAID = 0 then KAID := Obj.KAID;
  FEdit.Text := FObj.Num;
  FLockFind := False;
  FLocked := True;
  if Assigned(OnChange) then OnChange(Self);
  FLocked := False;
end;

//==============================================================================================
procedure TokPayDocSearchEdit.SetDocType(const Value: TokPayDocType);
begin
  FDocType := Value;
  SetDocTypeInfo(Value);
end;

//==============================================================================================
procedure TokPayDocSearchEdit.SetDocTypeInfo(AType: TokPayDocType);
begin
  if not Assigned(LangManager) then Exit;

  case AType of
    pdtIn:
      begin
        CapRef := LangManager.GetRS('fmPayDoc', 'PDInReestr');
        FbtnRef.ImageIndex := 47;
      end;

    pdtOut:
      begin
        CapRef := LangManager.GetRS('fmPayDoc', 'PDOutReestr');
        FbtnRef.ImageIndex := 48;
      end;

    pdtCharge:
      begin
        CapRef := LangManager.GetRS('fmPayDoc', 'PDChargeReestr');
        FbtnRef.ImageIndex := 48;
      end;
  end;
end;

//==============================================================================================
procedure TokPayDocSearchEdit.SetID(const Value: Integer);
begin
  PayDocID := Value;
end;

//==============================================================================================
procedure TokPayDocSearchEdit.SetKAID(const Value: Integer);
begin
  FKAID := Value;
end;

//==============================================================================================
procedure TokPayDocSearchEdit.SetPayDocID(const Value: Integer);
begin
  FPayDocID := Value;
  ReloadData;
end;

//==============================================================================================
procedure TokPayDocSearchEdit.SetRemoteServer(const Value: TSocketConnection);
begin
  inherited;

  if Value <> nil
    then FObj.RemoteServer := Value
    else FObj.RemoteServer := nil;
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
{ TokWHouseSearchEdit }
//==============================================================================================
//==============================================================================================
//==============================================================================================
procedure TokWHouseSearchEdit.ComboChange(Sender: TObject);
begin
  FWID := FCombo.KeyValue;

  inherited;
end;

//==============================================================================================
constructor TokWHouseSearchEdit.Create(AOwner: TComponent);
begin
  inherited;

  FObj := TokWarehouse.Create(nil);

  ViewMode := vmList;
  ShowButtons := sbtOnlyRef;
  ImageIndexRef := 50;
  ShowLng := False;

  FItemsDS.ProviderName := 'pWHouse_List';
  FCombo.KeyField := 'wid';
  FCombo.ListField := 'name';
end;

//==============================================================================================
destructor TokWHouseSearchEdit.Destroy;
begin
  FObj.Free;

  inherited;
end;

//==============================================================================================
procedure TokWHouseSearchEdit.DoSearch(AForward: Boolean);
  var
    FSQL: String;
    FFieldName: String;
begin
  if not Assigned(RemoteServer) or not RemoteServer.Connected then Exit;

  FLockFind := True;

  try
    FSQL := '';

    if not FBSPressed and FModified
      then FFindStr := FEdit.Text
      else FBSPressed := False;

    if FFindStr = '' then begin
      FWID := 0;
      Obj.WID := 0;
      FPrevFindStr := '';
      FPrevFindText := '';
      if Assigned(OnChange) then OnChange(Self);
      Exit;
    end;

    FFieldName := 'name';

    if FModified or not FcdsFind.Active then begin
      if FcdsFind.Active then FcdsFind.Close;

      if FFieldName = '' then Exit;

      FSQL := 'select * from warehouse where deleted=0 ';
      FSQL := FSQL + ' and upper(' + FFieldName + ') like ''' +
              AnsiUpperCase(FFindStr) + '%''' + ' order by ' + FFieldName;

      FcdsFind.Macros.ParamByName('sql').AsString := FSQL;

      try
        if Assigned(OnStartSearch) then OnStartSearch(Self);
        FcdsFind.Open;

      finally
        if Assigned(OnEndSearch) then OnEndSearch(Self);
      end;

      FModified := False;
    end
    else if AForward
         then FcdsFind.Next
         else FcdsFind.Prior;

    if not FcdsFind.Eof then begin
      FEdit.Text := FcdsFind.FieldByName(FFieldName).AsString;
      FEdit.SelStart := Length(FFindStr);
      FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);
      FPrevFindStr := FFindStr;
      FPrevFindText := FEdit.Text;

      FObj.WID := FcdsFind.FieldByName('wid').AsInteger;
      FWID := FObj.WID;

      if Assigned(OnChange) then OnChange(Self);
    end
    else begin
      Editor.Style.Color := okSearchFailedColor;
      Application.ProcessMessages;
      SysUtils.Beep;
      Sleep(100);
      Editor.Style.Color := clWindow;

      FFindStr := FPrevFindStr;
      FEdit.Text := FPrevFindText;
      FEdit.SelStart := Length(FFindStr);
      FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);
      if Assigned(OnFailSearch) then OnFailSearch(Self);
    end

  finally
    FLockFind := False;
  end;
end;

//==============================================================================================
function TokWHouseSearchEdit.GetID: Integer;
begin
  Result := WID;
end;

//==============================================================================================
procedure TokWHouseSearchEdit.IDChanged(const Value: Integer);
begin
  RefreshItemsDS;
  WID := Value;
end;

//==============================================================================================
procedure TokWHouseSearchEdit.InitRes;
begin
  if not Assigned(LangManager) then Exit;

  with LangManager do begin
    SearchNames.Clear;
    SearchNames.Add(GetRS('fmWMat', 'Title') + ';name');

    CapRef := GetRS('fmWaybill', 'WHouseRef')
  end;
end;

//==============================================================================================
procedure TokWHouseSearchEdit.RefButtonClick(Sender: TObject);
  {$IFNDEF PKG}
  var
    FRefType: TRefType;
    FViewType: TCCViewType;
  {$ENDIF}
begin
  if Assigned(OnRefButtonClick)
    then inherited
    {$IFNDEF PKG}
    else ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWhouse', Date, Self.WID)
    {$ENDIF}
  ;

    if Assigned(OnChange) then OnChange(Self);
end;

//==============================================================================================
procedure TokWHouseSearchEdit.RefreshItemsDS;
  var
    FL: Boolean;
begin
  FL := not FItemsDS.Active;
  if FItemsDS.Active then FItemsDS.Close;
  FItemsDS.FetchMacros;

  {$IFNDEF PKG}
  FItemsDS.Macros.ParamByName('m').AsString := ifThen(AllowedWH = '*', '', AllowedWH);
  {$ENDIF}

  FItemsDS.Open;
  if FL then begin
    FItemsDS.Locate('def', 1, []);
    FCombo.KeyValue := FItemsDS.FieldByName('wid').AsInteger;
  end;
end;

//==============================================================================================
procedure TokWHouseSearchEdit.ReloadData;
begin
  with TssClientDataSet.Create(nil) do
  try
    {RemoteServer := Self.RemoteServer;
    ProviderName := 'p_GetEx';
    FetchParams;
    Params.ParamByName('docid').AsInteger := FDocID;
    Open;
    if not IsEmpty and
     (((FContractType in [ctAll, ctIn]) and (FieldByName('doctype').AsInteger = 8))
       or
     ((FContractType in [ctAll, ctOut]) and (FieldByName('doctype').AsInteger = -8))) then
    begin
      FObj.DocID := FDocID;
    end
    else begin
      FObj.DocID := 0;
    end;
    Close;
    }
    FObj.WID := FWID;
    FLockFind := True;
    FEdit.Text := FObj.Name_;
    FLockFind := False;

  finally
    Free;
  end;

  FLocked := True;
  if Assigned(OnChange) then OnChange(Self);
  FLocked := False;
end;

//==============================================================================================
procedure TokWHouseSearchEdit.SetID(const Value: Integer);
begin
  WID := Value;
end;

//==============================================================================================
procedure TokWHouseSearchEdit.SetRemoteServer(const Value: TSocketConnection);
begin
  inherited;

  if Value <> nil
    then FObj.RemoteServer := Value
    else FObj.RemoteServer := nil;
end;

//==============================================================================================
procedure TokWHouseSearchEdit.SetWID(const Value: Integer);
begin
  FWID := Value;

  if ViewMode = vmSearch
    then ReloadData
    else FCombo.KeyValue := Value;
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
{ TokDiscCardSearchEdit }
//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TokDiscCardSearchEdit.Create(AOwner: TComponent);
begin
  inherited;

  FbtnRef.ImageIndex := 185;

  FObj := TokDiscCard.Create(nil);
end;

//==============================================================================================
destructor TokDiscCardSearchEdit.Destroy;
begin
  FObj.Free;

  inherited;
end;

//==============================================================================================
procedure TokDiscCardSearchEdit.DoSearch(AForward: Boolean);
var
  FSQL: String;
  FFieldName: String;
begin
  if not Assigned(RemoteServer) or not RemoteServer.Connected then Exit;

  FLockFind := True;

  try
    FSQL := '';

    if not FBSPressed and FModified
      then FFindStr := FEdit.Text
      else FBSPressed := False;

    if FFindStr = '' then begin
      FCardID := 0;
      Obj.CardID := 0;
      FPrevFindStr := '';
      FPrevFindText := '';
      if Assigned(OnChange) then OnChange(Self);
      Exit;
    end;

    FFieldName := 'num';

    if FModified or not FcdsFind.Active then begin
      if FcdsFind.Active then FcdsFind.Close;

      if FFieldName = '' then Exit;

      FSQL := 'select dc.* from disccards dc where dc.deleted=0 and upper(dc.' + FFieldName + ') like '''
              + AnsiUpperCase(FFindStr) + '%'' order by dc.' + FFieldName;

      FcdsFind.Macros.ParamByName('sql').AsString := FSQL;

      try
        if Assigned(OnStartSearch) then OnStartSearch(Self);
        FcdsFind.Open;

      finally
        if Assigned(OnEndSearch) then OnEndSearch(Self);
      end;

      FModified := False;
    end
    else if AForward
         then FcdsFind.Next
         else FcdsFind.Prior;

    if not FcdsFind.Eof then begin
      FEdit.Text := FcdsFind.FieldByName(FFieldName).AsString;
      FEdit.SelStart := Length(FFindStr);
      FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);
      FPrevFindStr := FFindStr;
      FPrevFindText := FEdit.Text;

      FObj.CardID := FcdsFind.FieldByName('cardid').AsInteger;
      if (FCardID > 0) and (FLastID <> FCardID) then FLastID := FCardID;
      FCardID := FObj.CardID;

      if Assigned(OnChange) then OnChange(Self);
    end
    else begin
      DoError;

      FFindStr := FPrevFindStr;
      FEdit.Text := FPrevFindText;
      FEdit.SelStart := Length(FFindStr);
      FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);
      if Assigned(OnFailSearch) then OnFailSearch(Self);
    end

  finally
    FLockFind := False;
  end;
end;

//==============================================================================================
function TokDiscCardSearchEdit.GetID: Integer;
begin
  Result := CardID;
end;

//==============================================================================================
procedure TokDiscCardSearchEdit.IDChanged(const Value: Integer);
begin
  CardID := Value;
end;

//==============================================================================================
procedure TokDiscCardSearchEdit.InitRes;
begin
  if not Assigned(LangManager) then Exit;

  with LangManager do begin
    SearchNames.Clear;
    SearchNames.Add(GetRS('fmDiscCards', 'Num') + ';num');

    CapRef := GetRS('fmDiscCards', 'Ref');
  end;
end;

//==============================================================================================
procedure TokDiscCardSearchEdit.RefButtonClick(Sender: TObject);
begin
  if Assigned(OnRefButtonClick)
    then inherited
    {$IFNDEF PKG}
    else ShowModalRef(Self, rtDiscCards, vtDiscCards, 'TfmDiscCards', Date, Self.CardID);
    {$ENDIF}
end;

//==============================================================================================
procedure TokDiscCardSearchEdit.ReloadData;
begin
  FObj.CardID := FCardID;
  FLockFind := True;
  FPrevFindText := '';
  FPrevFindStr := '';
  FEdit.Text := FObj.Num;
  FLockFind := False;
  FLocked := True;
  if Assigned(OnChange) then OnChange(Self);
  FLocked := False;
end;

//==============================================================================================
procedure TokDiscCardSearchEdit.SetCardID(const Value: Integer);
begin
  if (FCardID > 0) and (FLastID <> FCardID) then FLastID := FCardID;
  FCardID := Value;
  ReloadData;
end;

//==============================================================================================
procedure TokDiscCardSearchEdit.SetID(const Value: Integer);
begin
  CardID := Value;
end;

//==============================================================================================
procedure TokDiscCardSearchEdit.SetRemoteServer(const Value: TSocketConnection);
begin
  inherited;

  if Value <> nil then begin
    FObj.RemoteServer := Value;
  end
  else FObj.RemoteServer := nil;
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
{ TokOrderSearchEdit }
//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TokOrderSearchEdit.Create(AOwner: TComponent);
begin
  inherited;

  //FbtnRef.ImageIndex := 47;
  FObj := TokOrder.Create(nil);

  DocType := otIn;
end;

//==============================================================================================
destructor TokOrderSearchEdit.Destroy;
begin
  FObj.Free;

  inherited;
end;

//==============================================================================================
procedure TokOrderSearchEdit.DoSearch(AForward: Boolean);
  var
    FSQL: String;
    FFieldName: String;
    FKA: string;
begin
  if not Assigned(RemoteServer) or not RemoteServer.Connected then Exit;

  FLockFind := True;

  try
    FSQL := '';
    if not FBSPressed and FModified
      then FFindStr := FEdit.Text
      else FBSPressed := False;

    if FFindStr = '' then begin
      ID := 0;
      Obj.WBillID := 0;
      FPrevFindStr := '';
      FPrevFindText := '';
      if Assigned(OnChange) then OnChange(Self);
      Exit;
    end;

    FFieldName := 'num';

    if FModified or not FcdsFind.Active then begin
      if FcdsFind.Active then FcdsFind.Close;

      if FFieldName = '' then Exit;

      if FKAID = 0
        then FKA := ''
        else FKA := ' and wbl.kaid=' + IntToStr(FKAID);

      FSQL := 'select wbl.* from waybilllist wbl';

      case FDocType of
        otIn: FSQL := FSQL + ' where wbl.wtype=16';
        otOut: FSQL := FSQL + ' where wbl.wtype=-16';
      end;

      FSQL := FSQL + ' and wbl.checked=0 and upper(wbl.' + FFieldName + ') like ''' +
              AnsiUpperCase(FFindStr) + '%'' ' + FKA + ' order by wbl.' + FFieldName;
      FcdsFind.Macros.ParamByName('sql').AsString := FSQL;
      try
        if Assigned(OnStartSearch) then OnStartSearch(Self);
        FcdsFind.Open;
      finally
        if Assigned(OnEndSearch) then OnEndSearch(Self);
      end;
      FModified := False;
    end
    else if AForward
         then FcdsFind.Next
         else FcdsFind.Prior;

    if not FcdsFind.Eof then begin
      FEdit.Text := FcdsFind.FieldByName(FFieldName).AsString;
      FEdit.SelStart := Length(FFindStr);
      FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);
      FPrevFindStr := FFindStr;
      FPrevFindText := FEdit.Text;

      FObj.WBillID := FcdsFind.FieldByName('wbillid').AsInteger;
      //ID := FObj.WBillID;

      if Assigned(OnChange) then OnChange(Self);
    end
    else begin
      DoError;

      FFindStr := FPrevFindStr;
      FEdit.Text := FPrevFindText;
      FEdit.SelStart := Length(FFindStr);
      FEdit.SelLength := Length(FEdit.Text) - Length(FFindStr);
      if Assigned(OnFailSearch) then OnFailSearch(Self);
    end
  finally
    FLockFind := False;
  end;
end;

//==============================================================================================
function TokOrderSearchEdit.GetDocType: TokOrderType;
begin
  case FObj.DocType of
     16: Result := otIn;
    -16: Result := otOut;
    else Result := otOut; // warnings off
  end;
end;

//==============================================================================================
function TokOrderSearchEdit.GetID: Integer;
begin
  Result := FWBillID;
end;

//==============================================================================================
procedure TokOrderSearchEdit.IDChanged(const Value: Integer);
begin
  ID := Value;
end;

//==============================================================================================
procedure TokOrderSearchEdit.InitRes;
begin
  if not Assigned(LangManager) then Exit;

  with LangManager do begin
    SearchNames.Clear;
    SearchNames.Add(GetRS('fmOrders', 'OrderNum') + ';num');

    SetDocTypeInfo(FDocType);
  end;
end;

//==============================================================================================
procedure TokOrderSearchEdit.RefButtonClick(Sender: TObject);
  {$IFNDEF PKG}
  var
    FRefType: TRefType;
    FViewType: TCCViewType;
  {$ENDIF}
begin
  if Assigned(OnRefButtonClick) then inherited
    {$IFNDEF PKG}
    else begin
      case FDocType of
        otIn:
          begin
            FRefType := rtOrderIn;
            FViewType := vtOrderIn;
          end;

        otOut:
          begin
            FRefType := rtOrderOut;
            FViewType := vtOrderOut;
          end;

        else begin //warnings off
            FRefType := rtOrderOut;
            FViewType := vtOrderOut;
        end;
      end;

      ShowModalRef(Self, FRefType, FViewType, 'TfmOrders', Date, Self.ID, FKAID);
    end;
    {$ENDIF}
end;

//==============================================================================================
procedure TokOrderSearchEdit.ReloadData;
begin
  FObj.ID := ID;
  FLockFind := True;
  //if KAID = 0 then KAID := Obj.KAID;
  FEdit.Text := FObj.Num;
  FLockFind := False;
  FLocked := True;
  if Assigned(OnChange) then OnChange(Self);
  FLocked := False;
end;

//==============================================================================================
procedure TokOrderSearchEdit.SetDocType(const Value: TokOrderType);
begin
  FDocType := Value;
  SetDocTypeInfo(Value);
end;

//==============================================================================================
procedure TokOrderSearchEdit.SetDocTypeInfo(AType: TokOrderType);
begin
  if not Assigned(LangManager) then Exit;
  case AType of
    otIn:
      begin
        CapRef := LangManager.GetRS('fmOrders', 'OrderInReestr');
        FbtnRef.ImageIndex := 190;
      end;

    otOut:
      begin
        CapRef := LangManager.GetRS('fmOrders', 'OrderOutReestr');
        FbtnRef.ImageIndex := 189;
      end;
  end;
end;

//==============================================================================================
procedure TokOrderSearchEdit.SetID(const Value: Integer);
begin
  FWBillID := Value;
  ReloadData;
end;

//==============================================================================================
procedure TokOrderSearchEdit.SetKAID(const Value: Integer);
begin
  FKAID := Value;
end;

//==============================================================================================
procedure TokOrderSearchEdit.SetRemoteServer(const Value: TSocketConnection);
begin
  inherited;

  if Value <> nil then begin
    FObj.RemoteServer := Value;
  end
  else FObj.RemoteServer := nil;
end;

{ TokGridSearchEdit }

//==============================================================================================
constructor TokGridSearchEdit.Create(AOwner: TComponent);
begin
  inherited;

  FShowButtons := sbtNoRef;
  FShowCaptions := False;
  FEditorOffset := 0;

  ImageIndexFind := 18;
  ImageIndexFind := 19;
end;

//==============================================================================================
procedure TokGridSearchEdit.DoSearch(AForward: Boolean);
  {$IFNDEF PKG}
  var
    FNode: TdxTreeListNode;
    FFieldName: string;
    FLocType: TLocateType;
  {$ENDIF}
begin
  {$IFNDEF PKG}
  if (FFindStr <> Editor.EditingText) or FBSPressed then FFindIndex := -1;

  if not FBSPressed and FModified
    then FFindStr := Editor.EditingText
    else FBSPressed := False;

  //FFindStr := Editor.Text;
  if Editor.EditingText = '' then begin
    FPrevFindStr := '';
    FPrevFindText := '';
    Exit;
  end;

  FFieldName := ExtractWord(2, SearchNames[CurrentSearchIndex], [';']);
  case FSearchType of
    stBegin: FLocType := ltBegin;
    stSubstr: FLocType := ltSubstr;
    else {stConcurr:} FLocType := ltFull;
  end;

  FNode := FindNode(FGrid, FFieldName, Editor.EditingText, FLocType, FFindIndex, AForward);

  if FNode <> nil then begin
    FPrevFindStr := FFindStr;
    FPrevFindText := Editor.EditingText;
    FFindIndex := FNode.Index;
    FGrid.ClearSelection;
    FNode.Selected := True;

    FGrid.DataSource.DataSet.DisableControls;
    try
      if FGrid is TdxDBGrid
        then FGrid.DataSource.DataSet.Locate(TdxDBGrid(FGrid).KeyField,
          FNode.Values[TdxDBGrid(FGrid).ColumnByFieldName(TdxDBGrid(FGrid).KeyField).Index], []);
    finally
      FGrid.DataSource.DataSet.EnableControls;
    end;

    FModified := False;
  end
  else begin
    DoError;
    FFindStr := FPrevFindStr;
    FEdit.Text := FPrevFindText;
    FEdit.SelStart := Length(FFindStr);
    FEdit.SelLength := 0;
    if Assigned(OnFailSearch) then OnFailSearch(Self);
  end;
  {$ENDIF}
end;

//==============================================================================================
procedure TokGridSearchEdit.EditKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then begin
    Key := #0;
    if Assigned(Grid) then Grid.SetFocus;
    FBSPressed := False;
  end;
  
  inherited;
end;

//==============================================================================================
procedure TokGridSearchEdit.FindNameClick(Sender: TObject);
begin
  inherited;
end;

//==============================================================================================
function TokGridSearchEdit.GetID: Integer;
begin
  Result := -1; // dummy. warnings off
end;

//==============================================================================================
procedure TokGridSearchEdit.IDChanged(const Value: Integer);
begin
  inherited;

end;

//==============================================================================================
procedure TokGridSearchEdit.InitRes;
begin
  inherited;

  if not Assigned(LangManager) then Exit;
   
  with LangManager do begin
    CapRef := '';
    SearchNames.Clear;
    SearchNames.Add(GetRS('fmWaybill', 'Name') + ';matname');
    SearchNames.Add(GetRS('fmWaybill', 'Artikul') + ';artikul');
  end;
end;

//==============================================================================================
procedure TokGridSearchEdit.RefButtonClick(Sender: TObject);
begin
  inherited;

end;

//==============================================================================================
procedure TokGridSearchEdit.SetID(const Value: Integer);
begin
  inherited;

end;

//==============================================================================================
procedure TokGridSearchEdit.SetSvcID(const Value: Integer);
begin

end;

end.
