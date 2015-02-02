{$I ok_sklad.inc}
unit prConst;

interface

uses
  {$IFDEF MAIN}
  //Login,
  Main,
  CCMain,
  fLoadingData,
  Progress,
  ssBaseConst,
  //prFun,
  apTree,
  {$ENDIF}
  Messages, prTypes, xLngManager, Classes, Registry, ssRegUtils,
  Graphics, okClasses, xLngDefs, FR_Class;

const
  crlf = #13#10;
  ClipText = 'OperCalc:';

  PrRegKey = 'Software\Operator\Sklad'; // copy of ssBaseConst.MainRegKey
  prRegStatKey = prRegKey + '\Stat';

  // statistics
  regKeyRunCount = 'RunCount';
  regKeyRunTime = 'RunTime'; // lifetime run time (seconds)
  regKeyRunTimeCurVer = 'RunTimeCurVer'; // current version run time (seconds)
  regKeyLastVer = 'LastVer'; // last used version
  regKeyExceptions = 'Exceptions'; // total exceptions caught
  regKeyDVPHPLatestVer = 'dvphpLatestVer'; // latest available ver from www site. used to check for available update

  MinSrvVer = '2.1.5.3000'; // minimal allowed server version
  ClientLogFile = 'ok-client.log';
  clientExeMapFile = 'borlfl32.dat';
  client_ini = 'ok_client.ini';

  LangDir = 'LNG';

  mtCurrency = 1;

  AdminLoginName = 'admin';

  // WAYBILLIST table document types
  //wbtContr1 = 8;
  //wbtcontr2 = -8;
  //wbtInvoice = -9;
  wbtWaybillIn = 1;
  wbtWaybillOut = -1;
  wbtOrderOut = -16;  // from client
  wbtOrderIn = 16; // to supplier
  wbtAccOut = 2; // Invoice
  wbtWaybillmove = 4;
  wbtRest = 5; // initial product quantity
  wbtWriteOff = -5;
  wbtReturnOut = -6;
  wbtReturnIn = 6;
  wbtBundling = 40; // as functions.id
  wbtUnBundling = -40;
  //wbt = -100:Index:=74;

  // wmatturn constants
  matTurnIn = 1;
  matTurnOut = -1;
  matTurnReserved = 2;
  matTurnOrdered = 3;

  priceType_Markup = 0;     // buy price + percent
  priceType_Fixed = 1;      // fixed price
  priceType_PCExtra = 2;    // markup on other price category
  priceType_PCDiscount = 3; // discount from other price category

  // image indexes
  II_WBIN   = 51;
  II_WBINDis = 78;
  II_WBOUT  = 62;
  II_WBOUTDis = 83;
  II_WBINVOICE  = 181;
  II_WBINVOICEDis  = 182;
  II_WBMove = 98;
  II_WBMoveDis = 143;
  II_WRITEOFFDis = 144;
  II_WBDocs = 42;
  II_TaxWB  = 114;
  II_TaxWBDis = 115;
  II_AccOut = 112;
  II_AccOutDis = 134;
  II_PDIN   = 63;
  II_PDINDis   = 77;
  II_PDOUT  = 64;
  II_PDOUTDis  = 84;
  II_PDCHARGE = 150;
  II_PDCHARGEDis = 159;
  II_WBRETOUT = 128;
  II_WBRETOUTDis = 139;
  II_WBRETIN = 127;
  II_WBRETINDis = 140;

  II_ORDERIN = 189;
  II_ORDEROUT = 190;
  II_ORDERINDis = 199;
  II_ORDEROUTDis = 200;

  II_CONTRIN = 130;
  II_CONTRINDis = 137;
  II_CONTROUT = 131;
  II_CONTROUTDis = 138;

  II_WBREST = 133;
  II_WBRESTDis = 145;
  II_WRITEOFF = 125;
  II_INVENTORY = 156;
  II_INVENTORYDis = 157;

  II_CASHDESK = 164;
  II_CHARGETYPE = 149;
  II_MAT = 14;
  II_MC = 153;
  II_MATDis = 74;
  II_KA = 18;
  II_KADis = 75;
  II_WH = 50;
  II_WHDis = 80;
  II_MEASURES = 1;
  II_MEASURESDis = 79;
  II_CURRENCY = 2;
  II_CURRENCYDis = 141;
  II_COUNTRIES = 91;
  II_COUNTRIESDis = 92;
  II_PRICETYPES = 82;
  II_PRICETYPESDis = 93;
  II_BANKS = 19;
  II_BANKSDis = 97;
  II_ACCTYPE = 23;
  II_ACCTYPEDis = 81;

  II_FINANCES = 165;
  II_PARTIES = 171;

  II_DISC_CARDS = 185;
  II_DISC_CARDS_DIS = 186;
  II_BARCODE = 188;

  II_EXCEL = 54;

  // product TypeID field
  prodTIDTangible = 0;
  prodTIDBundle = 1;
  bundleItemTypeProd = 14; // actually it is image indexes from dmData.images
  bundleItemTypeSvc = 15;

  // Business Partners types
  bpTypeCompany = 0;
  bpTypePerson = 1;
  bpTypeEmployee = 2;
  bpTypeOurCompany = 3;

  bpKindSupplier = 0;
  bpKindClient = 1;
  bpKindAny = 2;

  // Employee position kind
  bpPosTypeChief = 0;
  bpPosTypePartner = 1;
  bpPosTypeOther = 2;

  TaxForAll = 0;
  TaxForPersons = 1;
  TaxForCompanies = 2;

  cfOwnerTypeWaybillIn = 1;
  cfOwnerTypeWaybillOut = -1;
  cfOwnerTypeOrderOut = -16;  // from client
  cfOwnerTypeOrderIn = 16; // to supplier
  cfOwnerTypeAccOut = 2; // Invoice
  cfOwnerTypeWaybillMove = 4;
  cfOwnerTypeWriteOff = -5;
  cfOwnerTypeReturnOut = -6;
  cfOwnerTypeReturnIn = 6;
  cfOwnerTypeProduct = 1000;
  cfOwnerTypeWebShop = 1001;

  tree_wwwProps = 'wwwProps';
  tree_wwwLangs = 'WebShopsLangList';
  tree_wwwGroups = 'WebShop_Groups_';
  tree_Products = 'Products';
  tree_ProdCustAttr = 'CustAttr';

  // constants for webshop tree TapNodeData CID values (it's for categories tree's self data wich have OwnerID = 0)
  // the product affiliation to this particular category is stored in boolean TapNodeData block with OwnerID = Product ID and CID is doesn't matter)
  wsDataCIDType = 0; // 1=lang node, 0=master node (the node's name is the web-shop category name as it is displayed in editing tree)
  wsDataCIDDescription = 1; // Master or lang nodes description
  wsDataCIDPosition = 2;  // master node only. position in list of categories

  // lang node properties
  wsDataCIDName = 2; // <Name> in this language
  wsDataCIDMetaCharSet = 3; // <MetaCharset> in this language
  wsDataCIDMetaKeywords = 4; // <MetaKeywords> in this language
  wsDataCIDMetaTitle = 5; // <MetaTitle> in this language
  wsDataCIDMetaDescr = 6; // <MetaDescr> in this language
  wsDataCIDCustomAlias = 7; // 1 if custom <Alias>.
  wsDataCIDAlias = 8; // <Alias> in this language

  WBRepSortFieldNames: array[0..2] of String = ('', 'matname', 'artikul');

  //---------------------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------------------
var
  VersionNo         : string = '1.0.0';   // no build version
  FullVersionNo     : string = '0.0.0.0'; // full four digits

  MaxUserCount      : Integer = 1;
  SingleUserMode    : Boolean = False;

  ActivationResponse: TStringStream;
  servMsg           : TStringList;

  BarcodesEnabled   : Boolean;
  resDllHandle      : THandle;

  CurrentView       : TCCViewType = vtDocs;
  CurrentNode       : Integer = -1;
  LastNodeID        : Integer = -1;
  LastPNodeID       : Integer = -1;
  LastMatID         : Integer = -1;
  ChargeType        : TChargeType = ctFIFO;

  BaseCurrName      : string = '';
  BaseCurrID        : integer = 0;
  BaseCurrShortName : string = '';
  BaseCurrFracName  : string = '';
  BaseCurrType      : Integer = 0;

  RoundSumm         : integer = -2;
  RoundPrice        : integer = -6;

  UserID          : integer = -1;
  UserName        : string = '';
  UserPass        : string = '';
  UserFullName    : string = '';
  HostAddr        : string = '';

  CheckMoney      : Boolean = True;
  ShowRetNDS      : Boolean = False;

  PricePrecision  : Integer = 2;
  PriceDisplayFormatEx : string = ',0.##';
  MatDisplayFormat     : string = ',0.####';
  MoneyDisplayFormat   : string = ',0.00';
  PriceDisplayFormat   : string = ',0.00####';

//-------------------------------
  RegUserName   : string = '';
  RegID         : Integer = -1;
  RegEmail      : string = '';
  RegBarcode    : boolean = False;
//-------------------------------

  TreeID          : integer = 0;
  ProfID          : integer = 0;
  IStyle          : integer = 2;

  RunCCatStartup  : boolean = False;
  NDS             : Extended = 20;
  POType          : TPOType = poAvg;

  RPType          : TRoundPricesType = rpNone;

  FilterOnSearch  : Boolean  = False;

  // encoded by standard procedure in order not to have cleartext strings
  URL_KeyActivate     : string = ''; // http://www.ok-sklad.com/index.php
  URL_KeyActivatePost : string = ''; // op=check_key&key=
  URL_KeyCheck        : string = ''; // http://www.ok-sklad.com/index.php
  URL_KeyCheckPost    : string = ''; // op=check_key&key=
  URL_KeyHost         : string = ''; // http://www.ok-sklad.com/
  URL_XMLDefault      : string = 'manager.php';

  BrandCodes : TStringList = nil;

  AllowedWH: string = '';

//!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#
// OPTIONS (see Options form)

  // what to show in print: 0:item name only, 1:model # only or 2:name\nmodel
  OptWBInShowModel     : Integer = 0;
  OptWBMoveShowModel   : Integer = 0;
  OptAccOutShowModel   : Integer = 0;
  OptWBRestShowModel   : Integer = 0;
  OptWriteOffShowModel : Integer = 0;
  OptWBOutShowModel    : Integer = 0;
  OptReturnOutShowModel: Integer = 0;
  OptReturnInShowModel : Integer = 0;
  OptInvShowModel      : Integer = 0;
  OptOrderOutShowModel : Integer = 0;
  OptOrderInShowModel  : Integer = 0;

  optHideInfoPane  : Boolean = False; // hide ads/nag/info pane

  CheckCurrency    : Boolean = True;
  MultiEntsViewType: Integer = 0;

  MatShowPrices   : Boolean = True;

  WBInDefAmount   : Extended = 1;
  WBInAllowZero   : Boolean = False;
  WBInChecked     : Boolean = True;
  WBInAutoNum     : Boolean = True;
  WBInPrefix      : string = '';
  WBInSuffix      : string = '';
  WBInAutoPrice   : Boolean = False;
  WBInPriceType   : Integer = 0;
  WBInAutoPriceType : Integer = 0;
  optWBInRepSortField: Integer = 0; // name/model sorting in reports
  optWBInRepSortDesc : Boolean = True; // ascending/descending sort

  PrintType   : Integer = 1;

  WBOutDefAmount  : Extended = 1;
  WBOutAllowZero  : Boolean = False;
  WBOutAutoWH     : Boolean = True;
  AccOutAutoWH    : Boolean = True;
  WBOutChecked    : Boolean = True;
  WBOutAutoNum    : Boolean = True;
  WBOutPrefix     : string = '';
  WBOutSuffix     : string = '';
  WBOutDefAction  : TAddAction = aaMat;
  WBInDefAction   : TAddAction = aaMat;
  WBOutPriceType  : Integer = 0;
  WBOutAutoPrice  : Integer = 0;
  WBOutCheckDC    : Boolean = False;
  optWBOutRepSortField: Integer = 0; // name/model sorting in reports
  optWBOutRepSortDesc : Boolean = True; // ascending/descending sort

  InvoiceDefAmount: Extended = 1;
  InvoiceAutoNum  : Boolean = True;
  InvoicePrefix   : string = '';
  InvoiceSuffix   : string = '';

  WBRestDefAmount   : Extended = 0;
  WBRestAllowZero   : Boolean = False;
  WBRestChecked     : Boolean = True;
  WBRestAutoNum     : Boolean = True;
  WBRestPrefix      : string = '';
  WBRestSuffix      : string = '';

  WBMoveDefAmount : Extended = 1;
  WBMoveChecked   : Boolean = True;
  WBMoveAutoNum   : Boolean = True;
  WBMoveAutoWH    : Boolean = True;
  WBMovePrefix    : string = '';
  WBMoveSuffix    : string = '';

  AODefAmount : Extended = 1;
  AOAutoNum   : Boolean = True;
  AOPrefix    : string = '';
  AOSuffix    : string = '';
  AOSelectNP  : Boolean = False;

  InWordsRepLang: string;

  TaxWBDefAmount  : Extended = 1;
  TaxAutoNum   : Boolean = True;
  TaxPrefix    : string = '';
  TaxSuffix    : string = '';

  PDInChecked  : Boolean = True;
  PDInAutoNum  : Boolean = True;
  PDInPrefix   : string = '';
  PDInSuffix   : string = '';

  PDOutChecked  : Boolean = True;
  PDOutAutoNum  : Boolean = True;
  PDOutPrefix   : string = '';
  PDOutSuffix   : string = '';

  PDChargeChecked  : Boolean = True;
  PDChargeAutoNum  : Boolean = True;
  PDChargePrefix   : string = '';
  PDChargeSuffix   : string = '';

  WriteOffAutoNum : Boolean = True;
  WriteOffChecked : Boolean = True;
  WriteOffPrefix  : string = '';
  WriteOffSuffix  : string = '';
  WriteOffDefAmount : Extended = 1;
  WriteOffAutoWH: Boolean = True;

  InvAutoNum : Boolean = True;
  InvChecked : Boolean = True;
  InvPrefix  : string = '';
  InvSuffix  : string = '';
  InvDefAmount : Extended = 1;

  ReturnOutChecked : Boolean = True;
  ReturnOutPrefix  : string = '';
  ReturnOutSuffix  : string = '';
  ReturnOutAutoNum : Boolean = True;
  ReturnOutAutoWH  : Boolean = True;
  ReturnOutDefAmount : Extended = 1;

  ReturnInChecked : Boolean = True;
  ReturnInPrefix  : string = '';
  ReturnInSuffix  : string = '';
  ReturnInAutoNum : Boolean = True;
  ReturnInDefAmount : Extended = 1;

  OrdersInDefAmount   : Extended = 1;
  OrdersInAutoNum     : Boolean = True;
  OrdersInPrefix      : string = '';
  OrdersInSuffix      : string = '';
  OrdersInSelectNP   : Boolean = False;

  OrdersOutDefAmount   : Extended = 1;
  OrdersOutAutoNum     : Boolean = True;
  OrdersOutPrefix      : string = '';
  OrdersOutSuffix      : string = '';
  OrdersOutSelectNP   : Boolean = False;

  DogInChecked     : Boolean = True;
  DogInAutoNum     : Boolean = True;
  DogInPrefix      : string = '';
  DogInSuffix      : string = '';

  DogOutChecked     : Boolean = True;
  DogOutAutoNum     : Boolean = True;
  DogOutPrefix      : string = '';
  DogOutSuffix      : string = '';

  optBundlingAutoNum : Boolean = True;
  optBundlingChecked : Boolean = True;
  optBundlingPrefix  : string = '';
  optBundlingSuffix  : string = '';

  optUnBundlingAutoNum : Boolean = True;
  optUnBundlingChecked : Boolean = True;
  optUnBundlingPrefix  : string = '';
  optUnBundlingSuffix  : string = '';

  Torg13PriceType   : Integer = -1;

  CurrEnt     : TokKAgent;
  EntName     : string;
  EntFullName : string;
  EntAddr     : string;
  EntAccount  : string;
  EntBank     : string;
  EntPhone    : string;
  EntINN      : string;
  EntOKPO     : string;
  EntKPP      : string;
  EntCertNum  : string;
  EntMFO      : string;
  EntCorrAcc  : string;
  EntNDSPayer : integer = 0;
  EntLogo     : TMemoryStream;

  EntDir   : string;
  EntDirID : Integer;
  EntBuh   : string;
  EntBuhID : Integer;

  EntParamsLoaded : boolean = False;

  DefFilterPeriod : integer = 31;
  DefAccOutPeriod : integer = 3;

  JumpFromBuffer: Boolean = False;

  LangMan: TxLngManager;

  Logging: Boolean = True;
  ShowPrices: Boolean = True;
  ShowBallance: Boolean = True;

  ShowErrorText          : Boolean = False;
  ShowFindPanel          : Boolean = True;
  DelToRecycleBin        : Boolean = True;
  CheckUserExist         : Boolean = False;
  UseGridOddColor        : Boolean = True;
  LoadKbdLayoutOnStartup : Boolean = True;
  RefreshAllClients      : Boolean = False;
  HighlightNeededMats    : Boolean = True;

  Font_Grids, Font_Main  : TFont;

  WMatShowAll            : Boolean = True;

  DefCheckWB             : Boolean = True;

  LastKAKType            : Integer = 0;
  LastKAKind             : Integer = 0;
  LastPayType            : Integer = 0;
  LastChargeType         : Integer = 0;

  LocateInfo             : TokLocateInfo;

  DefDiscountValue       : Extended = 5;
  DefOrderShipPeriod     : Integer = 3;
  DefOrderRcvPeriod      : Integer = 3;

  DC_Expire_Period       : Integer = 1;

  BC_Enabled             : Boolean = False;
  BC_StartDigit          : Integer = 2;
  BC_CodeFrom            : Integer = 2;
  BC_CodeTo              : Integer = 8;
  BC_Weight_IntFrom      : Integer = 9;
  BC_Weight_IntTo        : Integer = 9;
  BC_Weight_FracFrom     : Integer = 10;
  BC_Weight_FracTo       : Integer = 12;

  ClientPath, ServerPath : String;

  {$IFDEF MAIN}
  frmMainForm: TfrmMain;

  TfrmCCMainClass: TfrmCCMainForm;
  TokMainClass: TokMain;

  fProgress: TfrmProgress;
  fLoading: TfmLoadingData;

  wsGroupTrees: TapWoods = nil; // Webshops groups trees. placed here in attempt to cache data between products edits
  WebCatsLangTree: TapTree = nil; // the list of available languages with info on which ones enabled for each website
  ProductsTree: TapTree = nil; // Products-related data that does not fit into std tables. such as custom attributes arrays
  {$ENDIF} // MAIN

  OptMultiCurrency: Boolean = True;

  // statistics
  ClientStartTime: TDateTime; // to record lifetime run time
  stat_Exceptions: Integer;
  stat_runcount: Integer;
  stat_RunTimeCurVer: Integer;
  stat_TotalRunTime: Integer;

  // these variales used in free and lite versions with some limits applied. actual numbers look in ok_sklad_XXX_limits.inc
  compiledYear, compiledMonth, compiledDay, compiledHour, compiledMinute: Word; // compiled at. used for quick expiration check of free version
  compiledDateStr: string; // as above, but in fine YYYY-MM-DD HH:MM
  MaxFreeDays: Integer; // also expiration check. being set from include

  limitBusinessPartnersCount: Integer = 1;
  limitCurrenciesCount: Integer = 1;
  limitDatabasesCount: Integer = 1;
  limitDiscCardsCount: Integer = 1;
  limitDocumentsCount: Integer = 1;
  limitPriceCategoriesCount: Integer = 1;
  limitProductsCount: Integer = 1;
  limitUsersCount: Integer = 1;
  limitWarehousesCount: Integer = 1;

//==========================================================================
//==========================================================================
//==========================================================================
//==========================================================================
implementation

//uses Udebug;

var
  s : string;
  //DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

//==========================================================================
//==========================================================================
//==========================================================================
initialization
  {$IFDEF MAIN}
  //{$IFDEF UDEBUG}Debugging := False;
  //DEBUG_unit_ID := debugRegisterUnit('prConst', @Debugging, DEBUG_group_ID);{$ENDIF}

  servMsg := TStringList.Create;

  Font_Grids := TFont.Create;
  Font_Grids.Name := 'Tahoma';
  Font_Grids.Size := 10;
  Font_Grids.Charset := 1;
  Font_Grids.Color := clBlack;

  Font_Main := TFont.Create;
  Font_Main.Name := 'Tahoma';
  Font_Main.Size := 10;
  Font_Main.Charset := 1;
  Font_Main.Color := clBlack;
  {
  ANSI_CHARSET0ANSI characters.
  DEFAULT_CHARSET1Font is chosen based solely on Name and Size. If the described font is not available on the system, Windows will substitute another font.
  SYMBOL_CHARSET2Standard symbol set.
  MAC_CHARSET77Macintosh characters. Not available on NT 3.51.
  SHIFTJIS_CHARSET128Japanese shift-JIS characters.
  HANGEUL_CHARSET129Korean characters (Wansung).
  JOHAB_CHARSET130Korean characters (Johab). Not available on NT 3.51
  GB2312_CHARSET134Simplified Chinese characters (mainland china).
  CHINESEBIG5_CHARSET136Traditional Chinese characters (Taiwanese).
  GREEK_CHARSET161Greek characters. Not available on NT 3.51.
  TURKISH_CHARSET162Turkish characters. Not available on NT 3.51
  VIETNAMESE_CHARSET163Vietnamese characters. Not available on NT 3.51.
  HEBREW_CHARSET177Hebrew characters. Not available on NT 3.51
  ARABIC_CHARSET178Arabic characters. Not available on NT 3.51
  BALTIC_CHARSET186Baltic characters. Not available on NT 3.51.
  RUSSIAN_CHARSET204Cyrillic characters. Not available on NT 3.51.
  THAI_CHARSET222Thai characters. Not available on NT 3.51
  EASTEUROPE_CHARSET238Includes diacritical marks for eastern european countries. Not available on NT 3.51.
  OEM_CHARSET255Depends on the codepage of the operating system.
  }
  {$ENDIF}

//==========================================================================
//==========================================================================
//==========================================================================
finalization
  {$IFDEF MAIN}
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}
  {$ENDIF}
end.
