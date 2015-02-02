{$I ok_sklad.inc}
unit prTypes;

interface

uses
  {$IFNDEF PKG}ssClientDataSet,{$ENDIF}
  ComCtrls, Controls, Classes, Forms, Types, Messages, Graphics,
  Contnrs, dxTL6, ssBaseTypes, DB, Variants;

type
  TRefType    = (rtNone, rtWHouse, rtMeasures, rtMatGroup, rtMat, rtKAgent,
                 rtBank, rtWMat, rtPersons, rtAccountType, rtPriceTypes,
                 rtCountries, rtSetPosting, rtSetKurs, rtWBIn, rtWBOut, rtAccOut,
                 rtWBMove, rtWBRest, rtTaxWB, rtPDIn, rtPDOut, rtPriceList,
                 rtChargeType, rtPDOutEx, rtRetPos, rtServices, rtSvcGroup,
                 rtMC, rtCashDesks, rtEntAcc, rtWBReestr, rtFinances, rtMoneyMove,
                 rtWBRetIn, rtWBRetOut, rtInv, rtWriteOff, rtContrIn, rtContrOut,
                 rtTaxes, rtEnt, rtInvoice, rtDiscCards, rtOrderIn, rtOrderOut,
                 rtDiscCardGroup, rtInternet, rtWebShops, rtRSS, rtBundling, rtUnBundling
                 );

  TDocType    = (dtWBIn, dtWBOut, dtWBMove, dtPDIn, dtPDOut, dtTaxWB, dtAO,
                 dtWBRest, dtWriteOff, dtPDCharge, dtInv, dtReturnOut, dtReturnIn,
                 dtDogIn, dtDogOut, dtWarrantyDoc, dtInvoice, dtOrderIn, dtOrderOut,
                 dtBundling, dtUnBundling
                );

  TCCViewType = (vtAll, vtRefs, vtDocs, vtReports, vtService, vtWMat, vtMat,
                 vtWHouse, vtKAgent, vtMeasures, vtAccountType, vtBank,
                 vtMatGroup, vtPriceTypes, vtCountries, vtChargeType, vtServices,
                 vtSvcGroup, vtFinances, vtCashDesks, vtWBReestr, vtMoneyMove, vtTaxes,
                 vtContrIn, vtContrOut, vtPDOut, vtPDIn, vtDiscCards, vtOrderIn,
                 vtOrderOut, vtDiscCardGroup, vtInternet, vtWebShops, vtRSS,
                 vtBundling, vtUnBundling
                );


//----------------------------------------------------------------------------------
  TCurrencyInfo = class {���������� � ������}
    public
      ID        : integer;      // ID
      Name      : string[24];   // ������������
      ShortName : string[3];    // ����. ������������
      OnDate    : TDateTime;    // ���� ���������� ���������
      OnValue   : Extended;     // ����
      BaseCurr  : string[3];    // ������� ������
  end;

//----------------------------------------------------------------------------------
  TokAddDocInfo = record
    KAID: Integer;
    OnDate: TDateTime;
    PTypeID: Integer;
    WID: Integer;
    CurrName: string[10];
    CurrID: Integer;
    CurrRate: Extended;
    NDS: Extended;
    NDSPayer: Boolean;
    Tag: Integer;
  end;

//----------------------------------------------------------------------------------
  TTreeItemInfo = class
  public
    ID         : Integer; // usertreeview.id mainly (id of user-defined group sometimes)
    DisplayedName  : string;  // viewlng.name
    refersClassName: string;  // functions.classname (form's classname)
    FunName    : string;  // ?
    FunID      : Integer; // functions.id
    NodeType   : Integer; // tree's internal node type ID
    ShowInTree : Integer;
    utv_gType  : Integer; // usertreeview.gtype
    UserData   : Integer; // user-defined data
    FullName   : string;
    Enabled    : Boolean;

    ImageIndex : Integer;
    DisabledIndex: Integer;
  end;

//----------------------------------------------------------------------------------
  TWMatInfo = class
  public
    MatID  : Integer;
    PosID  : Integer;
    Amount : extended;
  end;

//----------------------------------------------------------------------------------
  TPosInfo = record
    PosID : Integer;
    MatID : Integer;
    WID   : Integer;
  end;
  PPosInfo = ^TPosInfo;

//----------------------------------------------------------------------------------
  TKAgentInfo = record
    ID    : integer;
    KType : integer;
  end;
  PKAgentInfo = ^TKAgentInfo;

//----------------------------------------------------------------------------------
  TGrpInfo = record
    ID  : integer;
    PID : integer;
  end;
  PGrpInfo = ^TGrpInfo;

//----------------------------------------------------------------------------------
  TNewRecordInfo = record
    ID    : Integer;
    Name  : String[255];
    Notes : String[255];
    Str1  : String[255];
    Int1  : Integer;
  end;
  PNewRecordInfo = ^TNewRecordInfo;

//----------------------------------------------------------------------------------
  TDragInfo = record
   ID    : integer;
   GrpID : integer;
   Name  : string[64];
   IsGrp : integer;
   Num   : integer;
   Sender: Pointer;
   RefType : TRefType;
  end;
  PDragInfo = ^TDragInfo;

//----------------------------------------------------------------------------------
  TPosInInfo = record
    PosId     : integer;
    WBillId   : integer;
    MatId     : integer;
    WId       : integer;
    Price     : Extended;
    CurrId    : integer;
    CurrShortName : string[3];
    OnValue   : Extended;
    Rest      : Extended;
    NDS       : Extended;
    OnDate    : TDateTime;
  end;

//----------------------------------------------------------------------------------
  TSearchInfo = record
    SearchID: Integer;
    LocateType: TLocateType;
    FindStr: string[255];
    PrevFindStr: string[255];
    Failed: Boolean;
  end;
  PSearchInfo = ^TSearchInfo;

  TDragType = (dtMat);
  TAddAction = (aaMat, aaSvc, aaMatList, aaAssembly);

  TChargeType = (ctFIFO, ctLIFO, ctRandom);
  TPOType     = (poAvg, poLast);

  TRoundPricesType = (rpNone, rpHigh, rpLow);

//----------------------------------------------------------------------------------
  TokLocateInfo = record
    ViewType: TCCViewType;
    ClassName: string[128];
    ID: Integer;
    GType: Integer;
  end;
  PokLocateInfo = ^TokLocateInfo;

//----------------------------------------------------------------------------------
  THackCtrl = class(TControl)
  published
    property Font;
  end;

//----------------------------------------------------------------------------------
  THackdxTL = class(TcustomdxTreeListControl)
  published
    property BandFont;
    property HeaderFont;
    property Font;
  end;

//----------------------------------------------------------------------------------
  TokHintWindow = class(THintWindow)
  private
    FMaxHintWidth: Cardinal;
    FHintColor: TColor;
    procedure SetMaxHintWidth(const Value: Cardinal);
    procedure SetHintColor(const Value: TColor);

  protected
    procedure Paint; override;

  public
    constructor Create(AOwner: TComponent); override;
    function CalcHintRect(MaxWidth: Integer; const AHint: string; AData: Pointer): TRect; override;
    property MaxHintWidth: Cardinal read FMaxHintWidth write SetMaxHintWidth;
    property HintColor: TColor read FHintColor write SetHintColor;
  end;
  TokHintWindowClass = class of TokHintWindow;

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
const
  utv_gType_All         = -1;
  utv_gType_Refs        = 1;
  utv_gType_Docs        = 2;
  utv_gType_Service     = 3;
  utv_gType_WMat        = 4;
  utv_gType_Reports     = 5;

  utv_gType_AccountType   = 105;
  utv_gType_Bank          = 106;
  utv_gType_Bundles       = 170;
  utv_gType_Bundling      = 171;
  utv_gType_UnBundling    = 172;
  utv_gType_CashDesks     = 115;
  utv_gType_ChargeType    = 370;
  utv_gType_ContrIn       = 20;
  utv_gType_ContrOut      = -20;
  utv_gType_Countries     = 209;
  utv_gType_DB            = 501;
  utv_gType_DiscCards     = 119;
  utv_gType_DiscCardGroup = 520;
  utv_gType_Finances      = 118;
  utv_gType_Internet      = 600;
  utv_gType_Inventory     = 160;
  utv_gType_Invoices      = 510;
  utv_gType_KAgent        = 103;
  utv_gType_Mat           = 101;
  utv_gType_MatGroup      = 110;
  utv_gType_Measures      = 104;
  utv_gType_MoneyMove     = 131;
  utv_gType_OrderIn       = 16;
  utv_gType_OrderOut      = -16;
  utv_gType_OperLog       = 500;
  utv_gType_PayDocIn      = 206;
  utv_gType_PayDocOut     = 207;
  utv_gType_PayDocOutEx   = 210;
  utv_gType_PriceTypes    = 208;
  utv_gType_RecycleBin    = -10;
  utv_gType_RSS           = 602;
  utv_gType_Services      = 400;
  utv_gType_SvcGroup      = 111;
  utv_gType_SQLEditor     = 126;
  utv_gType_Taxes         = 371;
  utv_gType_Users         = 117;
  utv_gType_WB            = 200;
  utv_gType_WBReestr      = 125;
  utv_gType_WBRest        = 150;
  utv_gType_WBReturnIn    = 57;
  utv_gType_WBReturnOut   = 56;
  utv_gType_WaybillMove   = 250;
  utv_gType_WBOut         = 201;
  utv_gType_WebShops      = 601;
  utv_gType_WHouse        = 102;
  utv_gType_WriteOff      = 251;
  utv_gType_WBMov         = 250;

  //------------------------------------------------------------------------
  //functions.funid:
  funID_Measures    =  2; //  ������� ���������
  funID_Currency    =  3; //  ������
  funID_Products    =  6; //  ������ (���)
  funID_KAgent      = 10; //  ����������� (���)
  funID_Bank        = 11; //  �����
  funID_AccountType = 12; //  ���� ������
  funID_UserGroups  = 13; //  ������ �������������
  funID_Users       = 14; //  ������������
  funID_UserMonitor = 15; //  ������� �������������
  funID_RecycleBin  = 16; //  �������
  funID_Options     = 18; //  ���������
  funID_Whouse      = 20; //  ������
  funID_Waybill     = 21; //  ��������� ���������
  funID_WaybillOut  = 23; //  ��������� ���������
  funID_WMat        = 24; //  ����� (���)
  funID_PayDocIn    = 25; //  ��������� �������
  funID_PayDocOut   = 26; //  �������� �������
  funID_DB          = 27; //  ���� ������
  funID_MatGroup    = 29; //  ������ �������
  funID_AccOut      = 30; //  �����
  funID_PriceTypes  = 31; //  ������� ���������
  funID_Countries   = 32; //  ������
  funID_TaxWB       = 33; //  ��������� ���������
  funID_ContrIn     = 34; //  �������� �����
  funID_ContrOut    = 35; //  �������� �������
  funID_WaybillMov  = 36; //  ��������� �����������
  funID_PriceList   = 37; //  �����-�����
  funID_Services    = 38; //  ������
  funID_OperLog     = 39; //  ������ �������
  funID_Bundles     = 40; //  ���������
  funID_WriteOff    = 41; //  ���� �������� ������
  funID_WBReturnIn  = 42; //  ������� �� �������
  funID_WBReturnOut = 43; //  ������� ����������
  funID_WBRest      = 44; //  ���� �������� �������
  funID_RepKA       = 47; //  ������ �� ������������
  funID_RepWH       = 48; //  ��������� ������
  funID_RepFin      = 49; //  ���������� ������
  funID_RepDocs     = 50; //  ���������
  funID_ChargeType  = 51; //  ������ ��������
  funID_PayDoc      = 52; //  ���. �������
  funID_Inventory   = 53; //  ���� ��������������
  funID_SvcGroup    = 54; //  ������ �����
  funID_RepSvc      = 55; //  ��������� ������
  funID_CashDesks   = 56; //  �����
  funID_SQLEditor   = 57; //  �������� SQL-��������
  funID_Cash        = 58; //  �������� ������
  funID_Cashless    = 58; //  ����������� ������
  funID_Finance     = 58; //  �������
  funID_WBReestr    = 59; //  ������ ����������
  funID_MoneyMove   = 60; //  ���������� ��������
  funID_Taxes       = 61; //  ������
  funID_Invoices    = 62; //  �����-�������
  funID_ContractReports = 63; //  ������ �� ���������
  funID_OrdersC     = 64; //  ������ �� ��������
  funID_OrdersS     = 65; //  ������ �����������
  funID_DiscCards   = 66; //  ���������� �����
  funID_DCG         = 67; //  ������ ���������� ����
  funID_WebShops    = 68; //  ���-��������
  funID_RSS         = 69; //  ������ ������� �� �������������

  //------------------------------------------------------------------------
  //usertreeview.id

  utvID_Root = 0;       //����� + �������� PID: 0 Num: 0 Show expanded: 0 visible: 1 img idx 38 dis idx:
  utvID_Directories = 8;//�������� ����������� PID: 0 Num: 7 gType: 1 Show expanded: 1 visible: 1 img idx 16 dis idx:
  utvID_Service   = 15; //������ PID: 0 Num: 9 gType: 3 Show expanded: 1 visible: 1 img idx 27 dis idx:

  utvID_Documents = 21; //��������� PID: 0 Num: 1 gType: 2 Show expanded: 1 visible: 1 img idx 42 dis idx:
  utvID_PayDocs   = 31; //�������� ��������� PID: 21 Num: 300 Show expanded: 1 visible: 1 img idx 48 dis idx:
  utvID_Slips     = 32; //��������� PID: 21 Num: 200 Show expanded: 1 visible: 1 img idx 48 dis idx:
  utvID_Contracts = 45; //�������� �����/������� PID: 21 Num: 800  Show expanded: 1 visible: 1 img idx 48 dis idx:
  utvID_Returning = 55; //���������� ��������� PID: 21 Num: 750  Show expanded: 1 visible: 1 img idx 48 dis idx:
  utvID_Orders    = 106;//������ PID: 21 Num: 751 Show expanded: 1 visible: 1 img idx 48 dis idx:

  utvID_Reports   = 34; //������ PID: 0 Num: 6 gType: 5 Show expanded: 1 visible: 1 img idx 58 dis idx:
  utvID_addDirs   = 50; //�������������� ����������� PID: 0 Num: 8 gType: 1 Show expanded: 1 visible: 1 img idx 16 dis idx:
  utvID_Internet  = 110;//�������� PID: 0 Num: 6000 gType: 600 Show expanded: 1 visible: 1 img idx 91 dis idx: 92

  utvID_Measures = 2;     //  ������� ���������
  utvID_Currency = 3;     //  ������
  utvID_Products = 6;     //  ������ (���)
  utvID_KAgent   = 10;    //  ����������� (���)
  utvID_Bank     = 11;    //  �����
  utvID_AccountType = 12; //  ���� ������
  utvID_Users = 17;       //  ������������
  utvID_UserGroups  = 18; //  ������ �������������
  utvID_UserMonitor = 19; //  ������� �������������
  utvID_RecycleBin  = 20; //  �������
  utvID_Options = 23;     //  ���������
  utvID_Whouse = 25;      //  ������
  utvID_Waybill = 26;     //  ��������� ���������
  utvID_WaybillOut = 27;  //  ��������� ���������
  utvID_WMat = 28;        //  ����� (���)
  utvID_PayDocIn  = 29;   //  �������� �������
  utvID_PayDocOut = 30;   //  ��������� �������
  utvID_DB = 33;          //  ���� ������
  utvID_RepWH = 35;       //  ��������� ������
  utvID_RepFin = 36;      //  ���������� ������
  utvID_RepKA = 37;       //  ������ �� ������������
  utvID_MatGroup = 38;    //  ������ �������
  utvID_AccOut = 39;      //  �����
  utvID_PriceTypes = 40;  //  ������� ���������
  utvID_RepDocs = 41;     //  ���������
  utvID_Countries = 43;   //  ������
  utvID_TaxWB = 44;       //  ��������� ���������
  utvID_ContrIn = 46;     //  �������� �����
  utvID_ContrOut = 47;    //  �������� �������
  utvID_WaybillMov = 48;  //  ��������� �����������
  utvID_Services = 51;    //  ������
  utvID_OperLog = 52;     //  ������ �������
  utvID_Bundles = 53;     //  ���������
  utvID_WriteOff = 54;    //  ���� �������� ������
  utvID_WBReturnOut = 56; //  ������� ����������
  utvID_WBReturnIn = 57;  //  ������� �� �������
  utvID_WBRest = 58;      //  ���� �������� �������
  utvID_SvcGroup = 59;    //  ������ �����
  utvID_RepSvc = 60;      //  ��������� ������
  utvID_Cash = 61;        //  �������� ������
  utvID_Finance = 62;     //  �������
  utvID_CashLess = 63;    //  ����������� ������
  utvID_CashDesks = 64;   //  �����
  utvID_WBReestr = 65;    //  ������ ����������
  utvID_SQLEditor = 66;   //  �������� SQL-��������
  utvID_MoneyMove = 67;   //  ���������� ��������
  utvID_Taxes = 68;       //  ������
  utvID_Invoices = 69;    //  �����-�������
  utvID_DCG = 70;         //  ������ ���������� ����
  utvID_PriceList = 101;  //  �����-�����
  utvID_ChargeType = 102; //  ������ ��������
  utvID_PayDoc = 103;     //  ���. �������
  utvID_Inventory = 104;  //  ���� ��������������
  utvID_RepContr = 105;   //  ������ �� ���������
  utvID_OrdersC = 107;    //  ������ �� ��������
  utvID_OrdersS = 108;    //  ������ �����������
  utvID_DiscCards = 109;  //  ���������� �����
  utvID_WebShops = 111;   //  ���-��������
  utvID_RSS = 112;        //  ������ ������� �� �������������
  utvID_Bundling = 114;   //  ������������
  utvID_UnBundling = 115; //  ����������������


//==============================================================================================
implementation

uses
  {$IFDEF UDEBUG}Udebug,{$ENDIF}
  {$IFNDEF PKG}ClientData,{$ENDIF}
  Windows, xGraphUtils, prConst;

{$IFDEF UDEBUG}
var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

//==============================================================================================
function TokHintWindow.CalcHintRect(MaxWidth: Integer; const AHint: string; AData: Pointer): TRect;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokHintWindow.CalcHintRect') else _udebug := nil;{$ENDIF}

  Result := inherited CalcHintRect(FMaxHintWidth, AHint, AData);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
constructor TokHintWindow.Create(AOwner: TComponent);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokHintWindow.Create') else _udebug := nil;{$ENDIF}

  inherited;

  FMaxHintWidth := 250;
  FHintColor := $00FFFFE7;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokHintWindow.Paint;
 var
   R: TRect;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokHintWindow.Paint') else _udebug := nil;{$ENDIF}

  R := ClientRect;
  Canvas.Brush.Color := FHintColor;
  Canvas.FillRect(R);
  //DrawGradient(Canvas, R, clAqua, clBlue, gdVertical);
  Inc(R.Left, 2);
  Inc(R.Top, 2);
  Canvas.Font.Color := Screen.HintFont.Color;
  Canvas.Brush.Style := bsClear;
  Canvas.Font.Name := Font_Main.Name;
  Canvas.Font.CharSet := Font_Main.Charset;
  DrawText(Canvas.Handle, PChar(Caption), -1, R, DT_LEFT or DT_NOPREFIX or DT_WORDBREAK or DrawTextBiDiModeFlagsReadingOnly);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokHintWindow.SetHintColor(const Value: TColor);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokHintWindow.SetHintColor') else _udebug := nil;{$ENDIF}

  FHintColor := Value;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokHintWindow.SetMaxHintWidth(const Value: Cardinal);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokHintWindow.SetMaxHintWidth') else _udebug := nil;{$ENDIF}

  FMaxHintWidth := Value;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('prTypes', @Debugging, DEBUG_group_ID);
  {$ENDIF}

  HintWindowClass := TokHintWindow;

finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
