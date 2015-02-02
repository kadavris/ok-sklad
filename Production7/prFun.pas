{$IFNDEF PKG}
{$I ok_sklad.inc}
{$ENDIF}
unit prFun;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, DBClient, SConnect, DB,
  StrUtils, Types, Variants, Graphics,
  ssMemDS, ssBaseConst, ssSocketConnection, ssClientDataSet, okMoneyFun, ssCalcEdit, cxEdit,
  dxTL6, dxDBTL6, dxDBGrid6, dxmdaset, cxDropDownEdit,
  prTypes, xLngManager, xLngDefs, TlHelp32, FR_CLass;

const
  prvTemp = 'prvTemp';

var
  cdsFunc: TssClientDataSet;
  cdsEnts: TssClientDataSet;
  ServerAddr: Integer;
  CheckLost: Boolean;
  TrError: String;

type
  TLoginType  = (ltProduction, ltServer);
  TUserAccess = (uaView, uaInsert, uaModify, uaDelete, uaPost);

//function GetMatNDS(AConn: TssSocketConnection; MatID: Integer): Extended;
//function MoneyToStrRUS(AValue: Extended): string;
//function MoneyToStrUKR(AValue: Extended): string;
procedure AccessDenied;
function  AddToRecycleBin(AConn: TssSocketConnection; const AClassName: string; AID: integer; const AText: string; ResetDef: boolean; AFunID: Integer): boolean;
function  BoolToInt(const b: Boolean): Integer;
          // price calculation handling
function  CalcPercentPrice(var ds: TDataSet; ptype, pptype: Integer; srcPrice, priceFactor, discount: Extended): Extended;
function  CalcPriceFields(var grdDS, ptDS: TDataSet): Boolean;

function  CheckDocDate(const ADocDate: TDateTime): Boolean;
function  CheckLogin(AConn: TssSocketConnection; ALoginType: TLoginType): boolean;
function  CheckMoneyDlg(AConn: TssSocketConnection; AOnDate: TDateTime; ASaldoType, AAccID, ACashID, ACurrID: Integer; ASumm: Extended): Boolean;
function  CheckSocketserver(AConn: TssSocketConnection): Boolean;
function  ClientServerAuth(AConn: TssSocketConnection): Integer;
function  CollectTechInfo(getLogs: Boolean = False): String; // prepares tech info for sending along with error reports
procedure ConnectionLost(AConn: TssSocketConnection);
procedure CopyDataSet(Ato: TssMemoryData; Afrom: TDataSet);
function  CurrToCurr(AConn: TssSocketConnection; CurrID1, CurrID2: Integer; OnDate: TDateTime; ADefCurrID: Integer = 0; ADefRate: Extended = -1): Extended;

function  DeleteData(AConn: TssSocketConnection; const ATableName: string; AID: integer): boolean;
function  DeleteDataEx(AConn: TssSocketConnection; const ATableName,AKeyName: string; AID: integer): boolean;
function  DeleteFileWithUndo(sFileName: string ): boolean;
procedure DoRecalcContract(AConn: TssSocketConnection; DOCID: Integer);
procedure DoRecalcDC(AConn: TssSocketConnection; AID: Integer);
procedure DoRecalcDCByWB(AConn: TssSocketConnection; AID: Integer);
procedure DoRecalcKASaldo(AConn: TssSocketConnection; FKAID: Integer; FDate: TDateTime; const FTitle: String; AShowProgress: Boolean = True);
function  dsNextPosID(ds:TDataSet):Integer;
procedure DSRefresh(ADS: TDataSet; const AKeyName: string; AKeyValue: integer; AHourGlass: boolean = true; AForce: Boolean = False);

function  ExistRegPath(AKey: string): boolean;
procedure ExpandAll(ATree: TCustomdxTreeListControl);
procedure ExportToExcel(AGrid: TdxDBGrid; AFieldList: TStringList; AShowExcel: Boolean = False);

function  Gen_ID(AConn: TssSocketConnection; const AName: string; AStep: Integer): Integer;
function  genBarCodeFromStr(AFrom: String): String;
function  GetBaseCurrName(AConn: TssSocketConnection): string;
function  GetColPriceType(AConn: TssSocketConnection; ColId:integer):integer;
function  GetCurrencyInfo(AConn: TssSocketConnection; CurrID: Integer;OnDate: TDateTime; var AShortName: string; var AOnDate: TDateTime;var ARateID: integer): Extended;
function  GetCurrencyRate(AConn: TssSocketConnection; CurrID: Integer; OnDate: TDateTime; var AOnDate: TDateTime; var ARateID: integer): extended;
function  GetCurrencyRateEx(AConn: TssSocketConnection; CurrID: Integer; OnDate: TDateTime): extended;
procedure GetCurrentEnt(AConn: TssSocketConnection);
function  GetDefPriceIn(AMatID, APTypeID, ACurrID: Integer; AOnDate: TDateTime; ANDS: Extended): Extended;
function  GetDefPriceOut(AConn: TssSocketConnection; MatId, PTypeId: Integer; AvgPrice: Extended; OnDate: TDateTime; Kurs: Extended; var WithNDS: Boolean; CurrID: Integer = 0): Extended;
function  GetDefPriceType: Integer;
function  GetDiscount(AConn:TssSocketConnection;MatId, KaId:integer):Extended;
function  GetDocNum(AConn: TssSocketConnection; AType: TDocType; AStep: Integer): Integer;
function  GetDocNumEx(AConn: TssSocketConnection; AType: TDocType; AStep: Integer; var APreffix, ASuffix, AGen: string; AKAID: Integer = 0): Integer;
function  GetDocRelContr(AConn: TssSocketConnection; DOCID: Integer): Integer;
function  GetDrillDownList(AConn: TssSocketConnection; const ATable, AKeyName, AParentName: string; APID: integer): string;
function  GetIntervalStr(ASec: Integer): string;
function  GetKAAddrEx(AConn: TssSocketConnection; KAID, AType: Integer): string;
procedure GetKAPersons(KAID:integer; var CB:TcxComboBox);
function  GetLang: string;
function  GetLastOutPrice(AConn: TssSocketConnection; MatID, CurrID: Integer; OnDate: TDateTime; Kurs: Extended; KAID: Integer = 0): Extended;
function  GetMatExtra(AConn: TssSocketConnection; AMatID, APTypeID: Integer; AOnDate: TDateTime; APrice: Extended): Extended;
function  GetMatFIFO(AConn: TssSocketConnection; AMatID: integer; AAmount: extended; var ARemain: extended): TList;
function  GetMatIdByPosId(AConn: TssSocketConnection; APosID:integer):integer;
function  GetMatPrices(AConn: TssSocketConnection; MatId: integer; var MinPrice, MaxPrice, AvgPrice, LastInPrice, Remain, Rsv: Extended): Extended;
function  GetMatRest(AConn: TssSocketConnection; AMatID: Integer; AOnDate: TDateTime): Extended;
function  GetMatRestsByKA(AConn: TssSocketConnection; AMatID, AKAID: integer; AOnDate:TDateTime; PMemData:Integer):Extended;
function  GetMatRestsByKAorWID(AConn: TssSocketConnection; AMatID, AKAID, AWID: integer; AOnDate:TDateTime; PMemData:Integer;
          AChType:TChargeType = ctFIFO): Extended;
function  GetMatRestsOnWHouse(AConn: TssSocketConnection; AMatID, AWID: integer; AOnDate:TDateTime; PMemData:Integer):Extended;
function  GetMatRestsOnWHouseWBM(AConn: TssSocketConnection; AMatID, AWID: integer; AOnDate: TDateTime; PMemData: Integer): Extended;
function  GetMatSelsByKA(AConn: TssSocketConnection; AMatID, AKAID: integer; PMemData:Integer):Extended;
function  GetMaxDocDate(AConn: TssSocketConnection): TDateTime;
function  GetMaxID(AConn: TssSocketConnection; const ATableName, AKeyName: string): integer;
function  GetMinDocDate(AConn: TssSocketConnection): TDateTime;
function  GetNextDefNum(AConn: TssSocketConnection;wtype:integer):integer;
function  GetPosRest(AConn:TssSocketConnection;PosId:integer; var PInfo:TPosInInfo):boolean;
function  GetSpace(n:integer):String;
function  GetSysError(ACode: Integer = 0): String;
function  getUsageStat: String;
function  GetUserAccess(const AFunID: integer; AAccess: TUserAccess): boolean;
function  GetUserAccessByClass(const AClassName: string; AAccess: TUserAccess): boolean;
function  GetWIDByPosId(AConn: TssSocketConnection; APosID:integer):integer;

procedure InitConfig(ALngMan: TxLngManager; AConn: TssSocketConnection; ASC: TcxEditStyleController);
procedure InitProfile(AConn: TssSocketConnection; const AUserID: integer; var AProfID, ATreeID: integer; ASC: TcxEditStyleController);
procedure InitRes(ALngMan: TxLngManager);
procedure InitUserAccess(AConn: TssSocketConnection; const AUserID: integer);
function  IsCyclingRef(AConn: TssSocketConnection; const ATableName, AKeyName, AParentName: string; AID, APID: integer): boolean;
function  IsFormFound(AClass: string): boolean;
function  isProcessRunning(const s: String): Boolean;
function  IsWindowsAdmin: Boolean; //returns True if the currently logged Windows user has Administrator rights

function  KAName(AConn:TssSocketConnection;kaid:integer;var APTypeID: Integer; NameType:integer = 0):string;
function  KANameEx(AConn: TssSocketConnection; KAID: Integer; var APTypeID: Integer; var KType: Integer):string;

function  lastServerError(emptyIfNoErrors: Boolean = True): String;
procedure LockScreen;
function  Login(AConn: TssSocketConnection; const ALoginType: TLoginType; const AUser, APass, AHost: string; ADBID: integer; ASMode: Boolean = False): integer;
function  LoginCodeInterprete(Code: Integer): Integer;

procedure MakeDefaultEnt(AConn: TssSocketConnection; KAID: Integer);
function  MatGrpName(AConn: TssSocketConnection; GrpID: Integer): string;
function  MatName(AConn: TssSocketConnection;MatId:integer; var msrname, Article:String; var wid:integer; var ABySN:boolean):string;
function  MoneyToStrShort(AValue: Extended): string;

function  newDataSet(Conn: TssSocketConnection = nil): TssClientDataSet;

procedure processCommand(ACmd: Integer; AParam: Variant); // used mostly for server to client requests for data updates. some internal tricks too.
function  PropisRUS(Value: int64; CyrrRend: Integer; AR: Boolean = False): string;
function  PropisUKR(Value: int64; CyrrRend: Boolean): string;
function  ProtCheck: Boolean;

procedure RefreshEnts;
procedure RefreshFun(const AClassName: string; AID: Integer);
procedure RefreshLog;
procedure RemoveRSV(PosId,iDet,iTmpIds,iWMatTurn,iWMatTurnOld,AFree:integer);
procedure ResetMatDisplayFormat;

procedure SavePrgParam(AConn: TssSocketConnection; const AParName: string; AParValue: Variant);
procedure SendMsg(AText: string = '');
procedure setFontStyle(f: TFont; Grid: Boolean = False);
function  SetHostPort(AConn: TssSocketConnection; const AHost: String): Boolean;
procedure SetDocNum(AConn: TssSocketConnection; AType: TDocType; AStep: Integer);
procedure SetPriceDispFormat;
procedure SetStyle(ACtrl: TWinControl; AStyle: Integer);
procedure SetUserActivity(AConn: TssSocketConnection; AFunID: Integer);
procedure ShowFinance(Sender: TWinControl; AOnDate: TDateTime; AID: Integer = 0);
procedure ShowHelpTopic(ATopic: string);
procedure showNotAvailable;
procedure ShowOrdersInfo(AKAID: Integer; ADocType: Integer; AOnDate: TDateTime);
procedure ShowTmpPanel(AOwner: TWinControl; const AText: string);
function  SmartShowRep(const Rep: TfrReport; fname: string; const doShow: Boolean = True; showErrMsg: Boolean = True): Boolean;

          // extended transactions support
procedure TrStart(Conn: TssSocketConnection = nil);
procedure TrRollBack(Conn: TssSocketConnection = nil);
function  TrCommit(const showMsg: Boolean = False; doExcept: Boolean = True; Conn: TssSocketConnection = nil): Boolean;

function  WHAccessMacro(id: string = 'wid'): String; // makes macro subst for providers
function  WHName(AConn: TssSocketConnection; wid: integer): string;
function  WIDforMatID(AConn: TssSocketConnection; MatId: integer): Integer;

// localization helpers
function  amountPrefix(leadSpace: Boolean = True): String; // returns localed preefix for quantitative numbers
procedure LoadLangInfo;
function  rs(s,r:String; spmode: Integer = 0): String; overload; // langman.getrs shortcut
function  rs(r:String; spmode: Integer = 0): String; overload;   // langman.getrs shortcut
function  SaveLangInfo: boolean;
procedure setRepDir; // constructs full path to reports for current language
procedure switchLang(LID: Integer; CID: Integer = -1);

function  OK_URL: string;
function  OK_Copyright: string;
function  OK_AppName: string;
function  OK_AppNameMotto: string;
function  OK_Version: string;

//################################################################################################
implementation

uses
  ssStrUtil, ssFileUtil, Registry, Login, prConst, cxButtons, cxPC,
  cxLookAndFeels, cxRadioGroup, ssExcel, ssExcelConst, Progress,
  Math, IdTCPClient, Dialogs, ssFun, ssDateUtils, fMessageDlg, ShellAPI, ExtCtrls,
  ssRegUtils, Lock, Main, ClientData, XLSExportComp, ssXLSExport, EmailMsg,
  IniFiles, OrdersInfo, ok_rep, Udebug, xNumInWords, dateUtils, Protection,
  WebReq, CommonConstants, InitialSettings;

const
  DefExcelFontName = 'Times New Roman';
  SECURITY_NT_AUTHORITY: TSIDIdentifierAuthority = (Value: (0, 0, 0, 0, 0, 5)) ;
  SECURITY_BUILTIN_DOMAIN_RID = $00000020;
  DOMAIN_ALIAS_RID_ADMINS = $00000220;

var
  ex: TssExcel;
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
  FNextProtCheck: TDateTime = 0;
  TransactionsCount: Integer = 0;

//==============================================================================================
function genBarCodeFromStr(AFrom: String): String;
  var
    s: String;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'genBarCodeFromStr') else _udebug := nil;{$ENDIF}

  s := '0123456789012'; // 13 char BC
  for i := 1 to length(AFrom) do begin
    s[i mod 12 + 1] := chr( 48 + (ord(s[i mod 12 + 1]) xor ord(AFrom[i mod 12 + 1])) mod 10 );
  end;
  Result := s;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetDocNumEx(AConn: TssSocketConnection; AType: TDocType; AStep: Integer; var APreffix, ASuffix, AGen: string; AKAID: Integer = 0): Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetDocNumEx') else _udebug := nil;{$ENDIF}

  Result := -1;

  if (AKAID > 0) and (AType in [dtWBOut, dtAO, dtInvoice, dtOrderOut]) then begin
    with newDataSet(AConn) do
    try
      ProviderName := 'pEntExParams_Get';
      FetchParams;
      Params.ParamByName('kaid').AsInteger := AKAID;
      Open;

      if not IsEmpty then
        case AType of
          dtWBOut:
            begin
              if Locate('wtype', -1, []) and (FieldByName('autonum').AsInteger = 1) then begin
                Result := Gen_ID(AConn, FieldByName('gen').AsString, AStep);
                APreffix := FieldByName('preffix').AsString;
                ASuffix := FieldByName('suffix').AsString;
                AGen := FieldByName('gen').AsString;
              end;
            end;

          dtAO:
            begin
              if Locate('wtype', 2, []) and (FieldByName('autonum').AsInteger = 1) then begin
                Result := Gen_ID(AConn, FieldByName('gen').AsString, AStep);
                APreffix := FieldByName('preffix').AsString;
                ASuffix := FieldByName('suffix').AsString;
                AGen := FieldByName('gen').AsString;
              end;
            end;

          dtInvoice:
            begin
              if Locate('wtype', -9, []) and (FieldByName('autonum').AsInteger = 1) then begin
                Result := Gen_ID(AConn, FieldByName('gen').AsString, AStep);
                APreffix := FieldByName('preffix').AsString;
                ASuffix := FieldByName('suffix').AsString;
                AGen := FieldByName('gen').AsString;
              end;
            end;

          dtOrderOut:
            begin
              if Locate('wtype', -16, []) and (FieldByName('autonum').AsInteger = 1) then begin
                Result := Gen_ID(AConn, FieldByName('gen').AsString, AStep);
                APreffix := FieldByName('preffix').AsString;
                ASuffix := FieldByName('suffix').AsString;
                AGen := FieldByName('gen').AsString;
              end;
            end
          else Result := GetDocNum(AConn, AType, AStep);
        end;

      Close;

    finally
      Free;
    end;
  end // if (AKAID > 0) and (AType in [dtWBOut, dtAO, dtInvoice, dtOrderOut])
  else begin
    Result := GetDocNum(AConn, AType, AStep);
  end;

  if Result = -1 then Result := GetDocNum(AConn, AType, AStep);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure ShowOrdersInfo(AKAID: Integer; ADocType: Integer; AOnDate: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ShowOrdersInfo') else _udebug := nil;{$ENDIF}

  with TfrmOrdersInfo.Create(nil) do
  try
    ParentNameEx := 'fmOrders';
    KAID := AKAID;
    if ADocType <> 0 then DocType := ADocType;
    OnDate := AOnDate;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure DoRecalcDCByWB(AConn: TssSocketConnection; AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'DoRecalcDCByWB') else _udebug := nil;{$ENDIF}

  with newDataSet(AConn) do
  try
    Screen.Cursor := crSQLWait;
    ProviderName := 'pDiscCards_RecalcByWB';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AID;
    Execute;

  finally
    Free;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure DoRecalcDC(AConn: TssSocketConnection; AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'DoRecalcDC') else _udebug := nil;{$ENDIF}

  with newDataSet(AConn) do
  try
    Screen.Cursor := crSQLWait;
    ProviderName := 'pDiscCards_Recalc';
    FetchParams;
    Params.ParamByName('cardid').AsInteger := AID;
    Execute;

  finally
    Free;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetMatRest(AConn: TssSocketConnection; AMatID: Integer; AOnDate: TDateTime): Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetMatRest') else _udebug := nil;{$ENDIF}

  Result := 0;
  with newDataSet(AConn) do
  try
    ProviderName := 'pWMat_Get_Mat_Rest';
    FetchParams;
    Params.ParamByName('ondate').AsDateTime := AOnDate;
    Params.ParamByName('matid').AsInteger := AMatID;
    Open;
    Result := Fields[0].AsFloat;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure MakeDefaultEnt(AConn: TssSocketConnection; KAID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'MakeDefaultEnt') else _udebug := nil;{$ENDIF}

  with newDataSet(AConn) do
  try
    AConn.AppServer.Start;

    try
      ProviderName := 'pKAgent_SetDefAll';
      Execute;

      ProviderName := 'pKAgent_SetDef';
      FetchParams;
      Params.ParamByName('kaid').AsInteger := KAID;
      Params.ParamByName('def').AsInteger := 1;
      Execute;

      AConn.AppServer.Commit;
      CurrEnt.KAID := KAID;

    except
      AConn.AppServer.Rollback;
      raise;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure RefreshEnts;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'RefreshEnts') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsEnts, 'kaid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure GetCurrentEnt(AConn: TssSocketConnection);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetCurrentEnt') else _udebug := nil;{$ENDIF}

  with newDataSet(AConn) do
  try
    ProviderName := 'pKAgent_GetDefEnt';
    Open;

    if CurrEnt.RemoteServer = nil then CurrEnt.RemoteServer := AConn;

    CurrEnt.KAID := FieldByName('kaid').AsInteger;
    cdsEnts.Locate('kaid', CurrEnt.KAID, []);
    if CurrEnt.KAID > 0 then EntParamsLoaded := True;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetKAAddrEx(AConn: TssSocketConnection; KAID, AType: Integer): string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetKAAddrEx') else _udebug := nil;{$ENDIF}

  Result := '';
  with newDataSet(AConn) do
  try
    ProviderName := 'pKAAddr_Get';
    FetchParams;
    Params.ParamByName('kaid').AsInteger := KAID;
    Open;

    if Locate('addrtype', AType, []) then begin
      if FieldByName('postindex').AsString <> '' then Result := FieldByName('postindex').AsString + ', ';
      if FieldByName('country').AsString <> ''   then Result := Result + ' ' + FieldByName('country').AsString + ', ';
      if FieldByName('district').AsString <> ''  then Result := Result + ' ' + FieldByName('district').AsString + ', ';
      if FieldByName('city').AsString <> ''      then Result := Result + ' ' + FieldByName('city').AsString + ', ';

      Result := Result + ' ' + FieldByName('address').AsString;
    end;
    Close;

    Result := Trim(Result);
    //if Result[Length(Result)] = ',' then System.Delete(Result, Length(Result), 1);

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure ShowTmpPanel(AOwner: TWinControl; const AText: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ShowTmpPanel') else _udebug := nil;{$ENDIF}

  with TPanel.Create(AOwner) do begin
    Parent := AOwner;
    Width := AOwner.Width;
    Height := AOwner.Height;
    Anchors := [akLeft, akRight, akBottom, akTop];
    Color := clWindow;
    Caption := AText;
    BevelInner := bvNone;
    BevelOuter := bvNone;
    Font.Style := [fsBold];
    Font.Size := 12;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function CheckDocDate(const ADocDate: TDateTime): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'CheckDocDate') else _udebug := nil;{$ENDIF}

  if (ADocDate > Date) and (mrYes <> ssMessageDlg(Format(rs('fmWaybill', 'FutureDocDate'), [DateToStr(ADocDate)]), ssmtWarning, [ssmbYes, ssmbNo]))
    then Result := False
    else Result := True;

  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure SetPriceDispFormat;
begin
  MoneyDisplayFormat := ',0.' + StringOfChar('0', PricePrecision);
  
  PriceDisplayFormatEx := ',0.' + StringOfChar('0', PricePrecision);
  PriceDisplayFormat := ',0.' + StringOfChar('#', PricePrecision);
end;

//==============================================================================================
function GetMaxDocDate(AConn: TssSocketConnection): TDateTime;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetMaxDocDate') else _udebug := nil;{$ENDIF}

  Result := Date;

  with newDataSet(AConn) do
  try
    ProviderName := 'pSQL';
    FetchMacros;
    Macros.ParamByName('sql').AsString := 'select max(ondate) from waybilllist where checked=1';
    Open;
    if not IsEmpty then Result := Fields[0].AsDateTime;
    Close;

    Macros.ParamByName('sql').AsString := 'select max(ondate) from paydoc where checked=1';
    Open;
    if not IsEmpty and (Fields[0].AsDateTime > Result) then Result := Fields[0].AsDateTime;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetMinDocDate(AConn: TssSocketConnection): TDateTime;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetMinDocDate') else _udebug := nil;{$ENDIF}

  Result := Date;

  with newDataSet(AConn) do
  try
    ProviderName := 'pSQL';
    FetchMacros;
    Macros.ParamByName('sql').AsString := 'select min(ondate) from waybilllist where checked=1';
    Open;
    if not IsEmpty then Result := Fields[0].AsDateTime;
    Close;

    Macros.ParamByName('sql').AsString := 'select min(ondate) from paydoc where checked=1';
    Open;
    if not IsEmpty and (Fields[0].AsDateTime < Result) then Result := Fields[0].AsDateTime;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure ShowFinance(Sender: TWinControl; AOnDate: TDateTime; AID: Integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ShowFinance') else _udebug := nil;{$ENDIF}

  ShowModalRef(Sender, rtFinances, vtFinances, 'fmFinance', AOnDate, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetMatExtra(AConn: TssSocketConnection; AMatID, APTypeID: Integer; AOnDate: TDateTime; APrice: Extended): Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetMatExtra') else _udebug := nil;{$ENDIF}

  Result := 0;
  with newDataSet(AConn) do
  try
    ProviderName := 'pWaybill_Get_Mat_Extra';
    FetchParams;
    Params.ParamByName('matid').AsInteger := AMatID;
    Params.ParamByName('ptypeid').AsInteger := APTypeID;
    Params.ParamByName('ondate').AsDateTime := AOnDate;
    Params.ParamByName('price').AsFloat := APrice;
    Open;
    Result := FieldByName('extra').AsFloat;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure GetKAPersons(KAID:integer; var CB:TcxComboBox);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetKAPersons') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    CB.Clear;
    CB.Properties.Items.Clear;
    ProviderName := 'pWayBillKAPersons_Get';
    FetchParams;
    Params.ParamByName('kaid').AsInteger := KAID;
    Open;
    if not IsEmpty then begin
      First;
      while not eof do begin
        if Fields.fieldbyname('name').AsString <> ''
        then CB.Properties.Items.Add(Fields.fieldbyname('name').AsString);
        Next;
      end;//while not eof
    end;//if not IsEmpty then
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
{
function GetMatNDS(AConn: TssSocketConnection; MatID: Integer): Extended;
begin
  Result := 0;
  with newDataSet(AConn) do
  try
    ProviderName := 'pMaterials_GetNDS';
    FetchParams;
    Params.ParamByName('matid').AsInteger := MatID;
    Open;
    if not IsEmpty then Result := FieldByName('nds').AsFloat;
    Close;
  finally
    Free;
  end;
end;
}

//==============================================================================================
function CheckMoneyDlg(AConn: TssSocketConnection; AOnDate: TDateTime;
          ASaldoType, AAccID, ACashID, ACurrID: Integer; ASumm: Extended): Boolean;
  var
    m, s: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'CheckMoneyDlg') else _udebug := nil;{$ENDIF}

  Result := True;

  if not CheckMoney then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with newDataSet(AConn) do
  try
    ProviderName := 'pCheckSaldo';
    FetchParams;
    FetchMacros;
    Params.ParamByName('ondate').AsDateTime := AOnDate;
    Params.ParamByName('currid').AsInteger := ACurrID;

    if ASaldoType = 0
      then m := ' and ms.cashid=' + IntToStr(ACashID)
      else m := ' and ms.accid=' + IntToStr(AAccID);

    Macros.ParamByName('m').AsString := m;
    Open;

    if ASaldoType = 0
      then s := rs('fmFinance', 'NotEnoughMoneyCash')
      else s := rs('fmFinance', 'NotEnoughMoneyCashless');

    if (FieldByName('saldo').AsCurrency - ASumm < 0) and (ssMessageDlg(s, ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes)
    then Result := False;

    Close;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetSpace(n: Integer):String;
begin
  Result := StringOfChar(' ', n);
end;

//==============================================================================================
procedure ConnectionLost(AConn: TssSocketConnection);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFNDEF DEBUG}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  {$ENDIF}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ConnectionLost') else _udebug := nil;{$ENDIF}

  CheckLost := True;

  try
    // loop to ask to retry in case of bad user/password etc...
    while mrYes = ssMessageDlg(rs('Common', 'ConnectionLost'), ssmtError, [ssmbYes, ssmbNo])
    do begin
      {AConn.DBConnected := False; // WTF? it is already closed...
      AConn.Close;
      sleep(1000);
      }

      case LoginCodeInterprete(prFun.Login(AConn, ltProduction, UserName, UserPass, AConn.Host, AConn.DBID, SingleUserMode)) of
        0,3: Break; // OK
      end;
    end;
    
  finally
    CheckLost := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure SavePrgParam(AConn: TssSocketConnection; const AParName: string; AParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'SavePrgParam') else _udebug := nil;{$ENDIF}

  with newDataSet(AConn) do
  try
    ProviderName := 'pPrgParams_Del';
    FetchParams;
    Params.ParamByName('parname').AsString := AParName;
    Execute;

    ProviderName := 'pPrgParams_Ins';
    FetchParams;
    Params.ParamByName('parname').AsString := AParName;

    if VarType(AParValue) = varBoolean
      then Params.ParamByName('parvalue').AsString := ifThen(AParValue, '1', '0')
      else Params.ParamByName('parvalue').AsString := VarToStr(AParValue);
      
    Execute;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function CurrToCurr(AConn: TssSocketConnection; CurrID1, CurrID2: Integer;
            OnDate: TDateTime; ADefCurrID: Integer = 0; ADefRate: Extended = -1): Extended;
 var
   FRate1, FRate2: Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'CurrToCurr') else _udebug := nil;{$ENDIF}

  if CurrID1 <> ADefCurrID
    then FRate1 := GetCurrencyRateEx(AConn, CurrID1, OnDate)
    else FRate1 := ADefRate;

  if CurrID2 <> ADefCurrID
    then FRate2 := GetCurrencyRateEx(AConn, CurrID2, OnDate)
    else FRate2 := ADefRate;

  if FRate2 = 0 then FRate2 := 1;
  Result := FRate1 / FRate2;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetCurrencyRateEx(AConn: TssSocketConnection; CurrID:Integer; OnDate:TDateTime): extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetCurrencyRateEx') else _udebug := nil;{$ENDIF}

  try
    with newDataSet(AConn) do
    try
      ProviderName := 'pCurrency_RateEx';
      FetchParams;
      Params.ParamByName('currid').AsInteger := CurrID;
      Params.ParamByName('ondate').AsDate := OnDate;
      Open;
      if not IsEmpty
        then Result := FieldByName('onvalue').AsFloat
        else Result := -1;

    finally
      Free;
    end;

  except
    Result := -1;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetCurrencyInfo(AConn: TssSocketConnection; CurrID: Integer;
  OnDate: TDateTime; var AShortName: string; var AOnDate: TDateTime;
  var ARateID: integer): Extended;

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetCurrencyInfo') else _udebug := nil;{$ENDIF}

  Result := -1;
  try
    with newDataSet(AConn) do
    try
      ProviderName := 'pCurrency_GetInfo';
      FetchParams;
      Params.ParamByName('currid').AsInteger := CurrID;
      Params.ParamByName('ondate').AsDateTime := OnDate;
      Open;
      if not IsEmpty then begin
        Result := FieldByName('onvalue').AsFloat;
        AOnDate := FieldByName('ondate').AsDateTime;
        ARateID := FieldByName('rateid').AsInteger;
        AShortName := FieldByName('shortname').AsString;
      end
      else Result := -1;

    finally
      Free;
    end;

  Except
    Result := -1;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetMatSelsByKA(AConn: TssSocketConnection; AMatID, AKAID: integer; PMemData:Integer):Extended;
  var
    cdsSels: TssClientDataSet;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetMatSelsByKA') else _udebug := nil;{$ENDIF}

  Result := 0;
  cdsSels := nil;

  try
    cdsSels := newDataSet(AConn);

    with cdsSels do begin
      ProviderName := 'pGetMatSelsByKA';
      FetchParams;
      Params.ParamByName('matid').AsInteger := AMatID;
      Params.ParamByName('kaid').AsInteger := AKAID;
      Open;
    end;//with cdsRest

    with TssMemoryData(pointer(PMemData)) do begin
      Close;
      Open;
      cdsSels.First;
      while not cdsSels.Eof do begin
        Append;
        FieldByName('docnum').AsString := cdsSels.fieldbyname('docnum').AsString;
        FieldByName('matid').AsInteger := cdsSels.fieldbyname('matid').AsInteger;
        FieldByName('wid').AsInteger := cdsSels.fieldbyname('wid').AsInteger;
        FieldByName('whname').AsString := cdsSels.fieldbyname('whname').AsString;
        FieldByName('posid').AsInteger := cdsSels.fieldbyname('posid').AsInteger;
        FieldByName('sourceid').AsInteger := cdsSels.fieldbyname('sourceid').AsInteger;
        FieldByName('amount').AsFloat := RoundToA(cdsSels.fieldbyname('amount').AsFloat, MatDisplayDigits);
        FieldByName('price').AsFloat := cdsSels.fieldbyname('price').AsFloat;
        FieldByName('onvalue').AsFloat := cdsSels.fieldbyname('onvalue').AsFloat;
        FieldByName('NDS').AsFloat := cdsSels.fieldbyname('NDS').AsFloat;
        FieldByName('Discount').AsFloat := cdsSels.fieldbyname('Discount').AsFloat;
        FieldByName('ondate').AsDateTime := cdsSels.fieldbyname('ondate').AsDateTime;
        FieldByName('currid').AsInteger := cdsSels.fieldbyname('currid').AsInteger;
        FieldByName('currname').AsString := cdsSels.fieldbyname('currname').AsString;

        //********************************
        if not cdsSels.fieldbyname('sn').IsNull then FieldByName('sn').AsString := cdsSels.fieldbyname('sn').AsString;
        FieldByName('wbillid').AsInteger := cdsSels.fieldbyname('wbillid').AsInteger;
        FieldByName('wtype').AsInteger := cdsSels.fieldbyname('wtype').AsInteger;
        if cdsSels.fieldbyname('gtd').IsNull then FieldByName('gtd').AsString := cdsSels.fieldbyname('gtd').AsString;
        if cdsSels.fieldbyname('producer').IsNull then FieldByName('producer').AsString := cdsSels.fieldbyname('producer').AsString;
        if cdsSels.fieldbyname('certnum').IsNull then FieldByName('certnum').AsString := cdsSels.fieldbyname('certnum').AsString;
        if cdsSels.fieldbyname('certdate').IsNull then FieldByName('certdate').AsDateTime := cdsSels.fieldbyname('certdate').AsDateTime;
        FieldByName('cardid').AsInteger := cdsSels.fieldbyname('cardid').AsInteger;
        //********************************

        Post;
        cdsSels.Next;
      end;//while not cdsRest.Eof
    end;//with TssMemoryData(pointer(PMemData))

  finally
    cdsSels.Free;
  end;//try

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetIntervalStr(ASec: Integer): string;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetIntervalStr') else _udebug := nil;{$ENDIF}

  Result := ssTimeToStr(Asec);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetWIDByPosId(AConn: TssSocketConnection; APosID:integer):integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetWIDByPosId') else _udebug := nil;{$ENDIF}

  Result := 0;
  with newDataSet(AConn) do
    try
      ProviderName := 'pSQL';
      FetchMacros;
      Macros.ParamByName('sql').AsString := 'select wid from wmatturn where sourceid=' + IntToStr(APosId);
      Open;
      Result := Fields[0].AsInteger;
      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetMatIdByPosId(AConn: TssSocketConnection; APosID:integer):integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetMatIdByPosId') else _udebug := nil;{$ENDIF}

  Result := 0;
  with newDataSet(AConn) do
    try
      ProviderName := 'pSQL';
      FetchMacros;
      Macros.ParamByName('sql').AsString := 'select matid from waybilldet where posid='+IntToStr(APosId);
      Open;
      Result := Fields[0].AsInteger;
      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetMatRestsByKA(AConn: TssSocketConnection; AMatID, AKAID: integer; AOnDate:TDateTime; PMemData: Integer): Extended;
  var
    cdsRest, cdsRsv_Temp: TssClientDataSet;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetMatRestsByKA') else _udebug := nil;{$ENDIF}

  Result := 0;
  cdsRest := nil;
  cdsRsv_Temp := nil;
  
  //Получение таблицы временного резерва
  try
    cdsRsv_Temp := newDataSet(AConn);
    with cdsRsv_Temp do begin
      ProviderName := 'pSysRsv_List';
      Open;
    end;// with cdsRsv_Temp

    //Получение остатков
    try
      cdsRest := newDataSet(AConn);
      with cdsRest do begin
        ProviderName := 'pWMat_GetRestByKA';
        FetchParams;
        Params.ParamByName('matid').AsInteger := AMatID;
        Params.ParamByName('kaid').AsInteger := AKAID;
        Params.ParamByName('ondate').AsDateTime := AOnDate;
        Open;
      end;//with cdsRest

     //Заполнение MemData
     with TssMemoryData(pointer(PMemData)) do begin
       Close;
       Open;
       cdsRest.First;
       while not cdsRest.Eof do begin
         Append;
         FieldByName('docnum').AsString := cdsRest.fieldbyname('docnum').AsString;
         FieldByName('matid').AsInteger := cdsRest.fieldbyname('matid').AsInteger;
         FieldByName('wid').AsInteger := cdsRest.fieldbyname('wid').AsInteger;
         FieldByName('whname').AsString := cdsRest.fieldbyname('whname').AsString;
         FieldByName('posid').AsInteger := cdsRest.fieldbyname('posid').AsInteger;
         FieldByName('amount').AsFloat := RoundToA(cdsRest.fieldbyname('amount').AsFloat, MatDisplayDigits);

         if not cdsRsv_Temp.IsEmpty then begin
           cdsRsv_Temp.First;

           while not cdsRsv_Temp.Eof do begin
             if ((cdsRsv_Temp.FieldByName('visible').AsInteger = 1) or ((cdsRsv_Temp.FieldByName('visible').AsInteger = 0)
                and (cdsRsv_Temp.fieldbyname('addr').AsInteger = ServerAddr)))
                and (cdsRsv_Temp.FieldByName('posid').AsInteger = cdsRest.fieldbyname('posid').AsInteger)
             then FieldByName('amount').AsFloat := RoundToA(FieldByName('amount').AsFloat
                  - cdsRsv_Temp.fieldbyname('amount').AsFloat, MatDisplayDigits);

             cdsRsv_Temp.Next;
           end;//while not cdsRsv_Temp.Eof
         end;//if not cdsRsv_Temp.IsEmpty

         FieldByName('price').AsFloat := cdsRest.fieldbyname('price').AsFloat;
         FieldByName('onvalue').AsFloat := cdsRest.fieldbyname('onvalue').AsFloat;
         FieldByName('NDS').AsFloat := cdsRest.fieldbyname('NDS').AsFloat;
         FieldByName('Discount').AsFloat := cdsRest.fieldbyname('Discount').AsFloat;
         FieldByName('ondate').AsDateTime := cdsRest.fieldbyname('ondate').AsDateTime;
         FieldByName('currid').AsInteger := cdsRest.fieldbyname('currid').AsInteger;

         if FindField('currname') <> nil then FieldByName('currname').AsString := cdsRest.fieldbyname('currname').AsString;

         if FieldByName('amount').AsFloat > 0.00000001
           then Post
           else Cancel;

         cdsRest.Next;
       end;//while not cdsRest.Eof
     end;//with TssMemoryData(pointer(PMemData))

   finally
     cdsRest.Free;
   end;

 finally
   cdsRsv_Temp.Free;
 end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure showNotAvailable;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'showNotAvailable') else _udebug := nil;{$ENDIF}

  ssMessageDlg(rs('Common', 'NotInThisVer'), ssmtError, [ssmbOk]);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function isProcessRunning(const s: String): Boolean;
  var
    hSnap: THandle;
    pe: TProcessEntry32;
    s2: THandle;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'isProcessRunning') else _udebug := nil;{$ENDIF}

  try
    Result := False;

    try
      pe.dwSize := SizeOf(pe);
      hSnap := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
      Process32First(hSnap, pe);

      While Process32Next(hSnap, pe) do begin
        if 0 = AnsiCompareText(LowerCase(ExtractFileName(pe.szExeFile)), LowerCase(s))
        then begin
          //s2 := OpenProcess(PROCESS_TERMINATE,false,pe.th32ProcessID);
          //TerminateProcess(s2, 0);
          Result := True;
          Exit;
        end;
      end;

    except
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function IsWindowsAdmin: Boolean;
  var
    hAccessToken: THandle;
    ptgGroups: PTokenGroups;
    dwInfoBufferSize: DWORD;
    psidAdministrators: PSID;
    g: Integer;
    bSuccess: BOOL;
begin
  Result := False;

  try // except
    bSuccess := OpenThreadToken(GetCurrentThread, TOKEN_QUERY, True, hAccessToken) ;
    if not bSuccess then begin
      if GetLastError = ERROR_NO_TOKEN then bSuccess := OpenProcessToken(GetCurrentProcess, TOKEN_QUERY, hAccessToken) ;
    end;

    if bSuccess then begin
      GetMem(ptgGroups, 1024) ;

      bSuccess := GetTokenInformation(hAccessToken, TokenGroups, ptgGroups, 1024, dwInfoBufferSize) ;

      CloseHandle(hAccessToken) ;

      if bSuccess then begin
        AllocateAndInitializeSid(SECURITY_NT_AUTHORITY, 2, SECURITY_BUILTIN_DOMAIN_RID, DOMAIN_ALIAS_RID_ADMINS, 0, 0, 0, 0, 0, 0, psidAdministrators);

        for g := 0 to ptgGroups.GroupCount - 1 do
          if EqualSid(psidAdministrators, ptgGroups.Groups[g].Sid)
          then begin
            Result := True;
            Break;
          end;

        FreeSid(psidAdministrators) ;
      end;

      FreeMem(ptgGroups) ;
    end;

  except
  end;
end;

//==============================================================================================
procedure RefreshFun(const AClassName: string; AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'RefreshFun') else _udebug := nil;{$ENDIF}

  Application.ProcessMessages;
  frmMainForm.ExecRefresh(AClassName, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure ShowHelpTopic(ATopic: string);
  var
    err: Integer;
    s: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ShowHelpTopic') else _udebug := nil;{$ENDIF}

  if trim(Atopic) = '' then Atopic := 'index';
  //trying to find native lang help. fallback to english otherwise
  s := ClientPath + 'Help\' + langName + '\HTML\' + ATopic + '.html';
  if not FileExists(s) then s := ClientPath + 'Help\ENG\HTML\' + ATopic + '.html';

  s := AnsiReplaceStr('file://' + s, '\', '/');
  s[9] := '|';
  err := ShellExecute(Application.Handle, nil, PChar(s), nil, nil, SW_SHOWNORMAL);
  if err < 33 then ssMessageDlg(s + crlf + GetSysError,  ssmtError, [ssmbOk]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure AccessDenied;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'AccessDenied') else _udebug := nil;{$ENDIF}

  ssMessageDlg(RS('Common', 'AccessDenied') + #13#10 + RS('Common', 'ContactAdmin'), ssmtError, [ssmbOk]);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetDocNum(AConn: TssSocketConnection; AType: TDocType; AStep: Integer): Integer;
  var
    FSQL: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetDocNum') else _udebug := nil;{$ENDIF}

  with newDataSet(AConn) do
    try
      ProviderName := 'pSQL';
      FetchMacros;

      case AType of
        dtAO:          FSQL := 'select gen_id(gen_ao,' + IntToStr(AStep) + ') from profcommon';
        dtDogIn:       FSQL := 'select gen_id(gen_contrin,' + IntToStr(AStep) + ') from profcommon';
        dtDogOut:      FSQL := 'select gen_id(gen_controut,' + IntToStr(AStep) + ') from profcommon';
        dtInv:         FSQL := 'select gen_id(gen_inv,' + IntToStr(AStep) + ') from profcommon';
        dtInvoice:     FSQL := 'select gen_id(gen_invoice,' + IntToStr(AStep) + ') from profcommon';
        dtOrderIn:     FSQL := 'select gen_id(gen_orderin,' + IntToStr(AStep) + ') from profcommon';
        dtOrderOut:    FSQL := 'select gen_id(gen_orderout,' + IntToStr(AStep) + ') from profcommon';
        dtPDCharge:    FSQL := 'select gen_id(gen_pdcharge,' + IntToStr(AStep) + ') from profcommon';
        dtPDIn:        FSQL := 'select gen_id(gen_pdin,' + IntToStr(AStep) + ') from profcommon';
        dtPDOut:       FSQL := 'select gen_id(gen_pdout,' + IntToStr(AStep) + ') from profcommon';
        dtReturnIn:    FSQL := 'select gen_id(gen_returnin,' + IntToStr(AStep) + ') from profcommon';
        dtReturnOut:   FSQL := 'select gen_id(gen_returnout,' + IntToStr(AStep) + ') from profcommon';
        dtTaxWB:       FSQL := 'select gen_id(gen_taxwb,' + IntToStr(AStep) + ') from profcommon';
        dtWarrantyDoc: FSQL := 'select gen_id(gen_warranty,' + IntToStr(AStep) + ') from profcommon';
        dtWBIn:        FSQL := 'select gen_id(gen_wbin,' + IntToStr(AStep) + ') from profcommon';
        dtWBMove:      FSQL := 'select gen_id(gen_wbmove,' + IntToStr(AStep) + ') from profcommon';
        dtWBOut:       FSQL := 'select gen_id(gen_wbout,' + IntToStr(AStep) + ') from profcommon';
        dtWBRest:      FSQL := 'select gen_id(gen_wbrest,' + IntToStr(AStep) + ') from profcommon';
        dtWriteOff:    FSQL := 'select gen_id(gen_writeoff,' + IntToStr(AStep) + ') from profcommon';
      end;

      Macros.ParamByName('sql').AsString := FSQL;
      Open;
      Result := Fields[0].AsInteger;
      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure SetDocNum(AConn: TssSocketConnection; AType: TDocType; AStep: Integer);
  var
    FSQL: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'SetDocNum') else _udebug := nil;{$ENDIF}

  with newDataSet(AConn) do
    try
      ProviderName := 'pSQL';
      FetchMacros;

      case AType of
        dtWBOut:       FSQL := 'set generator gen_wbout to ' + IntToStr(AStep);
        dtWBIn:        FSQL := 'set generator gen_wbin to ' + IntToStr(AStep);
        dtWBMove:      FSQL := 'set generator gen_wbmove to ' + IntToStr(AStep);
        dtAO:          FSQL := 'set generator gen_ao to ' + IntToStr(AStep);
        dtTaxWB:       FSQL := 'set generator gen_taxwb to ' + IntToStr(AStep);
        dtPDIn:        FSQL := 'set generator gen_pdin to ' + IntToStr(AStep);
        dtPDOut:       FSQL := 'set generator gen_pdout to ' + IntToStr(AStep);
        dtPDCharge:    FSQL := 'set generator gen_pdcharge to ' + IntToStr(AStep);
        dtWBRest:      FSQL := 'set generator gen_wbrest to ' + IntToStr(AStep);
        dtWriteOff:    FSQL := 'set generator gen_writeoff to ' + IntToStr(AStep);
        dtInv:         FSQL := 'set generator gen_inv to ' + IntToStr(AStep);
        dtReturnOut:   FSQL := 'set generator gen_returnout to ' + IntToStr(AStep);
        dtReturnIn:    FSQL := 'set generator gen_returnin to ' + IntToStr(AStep);
        dtWarrantyDoc: FSQL := 'set generator gen_warranty to ' + IntToStr(AStep);
        dtInvoice:     FSQL := 'set generator gen_invoice to ' + IntToStr(AStep);
        dtOrderOut:    FSQL := 'set generator gen_orderout to ' + IntToStr(AStep);
        dtOrderIn:     FSQL := 'set generator gen_orderin to ' + IntToStr(AStep);
      end;

      Macros.ParamByName('sql').AsString := FSQL;
      Execute;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure SendMsg;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'SendMsg') else _udebug := nil;{$ENDIF}

  with TfrmSendMsg.Create(nil) do
  try
    edMsg.Text := AText;
    ShowModal;

  finally
    Free;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function Gen_ID(AConn: TssSocketConnection; const AName: string; AStep: Integer): Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'Gen_ID') else _udebug := nil;{$ENDIF}

  Result := 0;
  with newDataSet(AConn) do
    try
      ProviderName := 'pSQL';
      FetchMacros;
      Macros.ParamByName('sql').AsString := 'select gen_id(' + AName + ',' + IntToStr(AStep) + ') from commonparams';
      Open;
      Result := Fields[0].AsInteger;
      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure RefreshLog;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'RefreshLog') else _udebug := nil;{$ENDIF}

  frmMainForm.ExecRefresh('TfmOperLog', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetColPriceType(AConn:TssSocketConnection;ColId:integer):integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
Begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetColPriceType') else _udebug := nil;{$ENDIF}

  Result := -1;
  with newDataSet(AConn) do
  try
    ProviderName := 'pPLColPriceT_Get1';
    FetchParams;
    Params.ParamByName('ColId').AsInteger := ColId;
    Open;
    if not IsEmpty
      then Result := fieldbyname('PTypeId').AsInteger
      else Result := -1;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
End;

//==============================================================================================
function GetPosRest(AConn:TssSocketConnection;PosId:integer; var PInfo:TPosInInfo):boolean;
  var
    tmpAmount: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetPosRest') else _udebug := nil;{$ENDIF}

  tmpAmount := 0;
  with newDataSet(AConn) do
  try
    ProviderName := 'pWB_PosInfo';
    FetchParams;
    Params.ParamByName('PosId').AsInteger := PosId;
    Open;
    with PInfo do begin
      if not IsEmpty then begin
        PosId := fieldbyname('posid').AsInteger;
        PInfo.WBillId := fieldbyname('wbillid').AsInteger;
        PInfo.MatId := fieldbyname('matid').AsInteger;
        WId := fieldbyname('wid').AsInteger;
        Price := fieldbyname('price').AsFloat;
        CurrId := fieldbyname('currid').AsInteger;
        CurrShortName := fieldbyname('ShortName').AsString;
        OnValue := fieldbyname('onvalue').AsFloat;
        Rest := 0;//?
        NDS := fieldbyname('NDS').AsFloat;
        OnDate := fieldbyname('OnDate').AsDateTime;
      end
      else begin
        PosId := 0;
        PInfo.WBillId := 0;
        PInfo.MatId := 0;
        WId := 0;
        Price := 0;
        CurrId := 0;
        CurrShortName := '';
        OnValue := 0;
        Rest := 0;
        NDS := 0;
        OnDate := 0;
      end;
    end; // with Pinfo
    Close;

    ProviderName := 'pSysRsv_List';
    Open;
    First;
    while not Eof do begin
      if FieldByName('posid').AsInteger = PosId then tmpAmount := tmpAmount + FieldByName('amount').AsFloat;
      Next;
    end;
    Close;
    ProviderName := 'pWMatPosRest';
    FetchParams;
    Params.ParamByName('ondate').AsDateTime := MaxDateTime;
    Params.ParamByName('posid').AsInteger := PosId;

    Open;
    if not IsEmpty then tmpAmount := fieldbyname('remain').AsFloat - tmpAmount;
    Close;

    ProviderName := 'pWMatPosRestR';
    FetchParams;
    Params.ParamByName('ondate').AsDateTime := MaxDateTime;
    Params.ParamByName('posid').AsInteger := PosId;

    Open;
    if not IsEmpty then tmpAmount := tmpAmount - fieldbyname('rsv').AsFloat;
    Close;

    PInfo.Rest := tmpAmount;

  finally
    Free;
  end;

  Result := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function WIDforMatID(AConn:TssSocketConnection;MatId:integer):Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'WIDforMatID') else _udebug := nil;{$ENDIF}

  Result := 0;
  with newDataSet(AConn) do
  try
    ProviderName := 'pWIDforMatID';
    FetchParams;
    Params.ParamByName('MatId').AsInteger := MatId;
    Open;
    if not IsEmpty
      then Result := Fields[0].AsInteger
      else Result := 0;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure LockScreen;
  var
    i: Integer;
    FList: TList;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'LockScreen') else _udebug := nil;{$ENDIF}

  FList := TList.Create;
  try
    for i := 0 to Screen.FormCount - 1 do
      if Screen.Forms[i].Visible and (Screen.Forms[i].FormStyle <> fsMDIChild)
      then begin
        try
          Screen.Forms[i].Hide;
        except
        end;

        FList.Add(Screen.Forms[i]);
      end;

  except
  end;

  with TfrmLock.Create(nil) do
    try
      if ShowModal = mrOk then begin
        for i := FList.Count - 1 downto 0 do
          try
            TForm(FList[i]).Show;
          except
          end;
      end
      else begin
        Application.Terminate;
        Application.ProcessMessages;
        Halt;
      end;

    finally
      Free;
      FList.Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetMatPrices(AConn: TssSocketConnection; MatId: integer; var MinPrice, MaxPrice, AvgPrice, LastInPrice, Remain, Rsv: Extended): Extended;
  var
    tmpSumm, tmpRest:Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  Result := 0.0;

  if MatID = 0 then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetMatPrices') else _udebug := nil;{$ENDIF}

  tmpSumm := 0;
  tmpRest := 0;
  MinPrice := 0;
  MaxPrice := 0;
  AvgPrice := 0;
  Remain := 0;
  Rsv := 0;

  with newDataSet(AConn) do
  try
    ProviderName := 'pWayBill_PriceIn';
    FetchParams;
    Params.ParamByName('MatId').AsInteger := MatId;
    Params.ParamByName('ondate').AsDateTime := MaxDateTime;
    Open;
    if not IsEmpty then begin
      MinPrice := FieldByName('minprice').AsFloat;
      MaxPrice := FieldByName('maxprice').AsFloat;
      AvgPrice := FieldByName('avgprice').AsFloat;
      LastInPrice := FieldByName('lastinprice').AsFloat * FieldByName('onvalue').AsFloat;
      Remain := RoundToA(FieldByName('remain').AsFloat, MatDisplayDigits);
      Rsv := RoundToA(FieldByName('rsv').AsFloat, MatDisplayDigits);

      Close;

      ProviderName := 'pSysRsv_List';
      Params.Clear;
      Open;

      First;
      while not Eof do begin
        if ((FieldByName('visible').AsInteger = 1) or ((FieldByName('visible').AsInteger = 0) and (fieldbyname('addr').AsInteger = ServerAddr)))
           and (FieldByName('matid').AsInteger = MatID)
        then Rsv := Rsv + FieldByName('amount').AsFloat;

        Next;
      end;

    end
    else begin
      MinPrice := 0.0;
      MaxPrice := 0.0;
      AvgPrice := 0.0;
      Remain := 0.0;
      Result := 0.0;
    end;

    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function dsNextPosID(ds:TDataSet):Integer;
  var
     BM: TBookmark;
     maxid: Integer;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'dsNextPosID') else _udebug := nil;{$ENDIF}

  Result := 0;
  with ds do begin
    BM := GetBookmark;
    DisableControls;
    try
      try
        First;
        while not Eof do begin
          if Abs(FieldByName('posid').AsInteger) > Result then Result := Abs(FieldByName('posid').AsInteger);
          Next;
        end;//while

        Result := -1 * (Result + 1);

      except
        Result := 0;
      end;

    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
      EnableControls;
    end;
  end;//with md

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function DeleteFileWithUndo( sFileName : string ) : boolean;
  var
    fos : TSHFileOpStruct;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'DeleteFileWithUndo') else _udebug := nil;{$ENDIF}

  sFileName := sFileName + #0;
  FillChar( fos, SizeOf( fos ), 0 );
  with fos do begin
    wFunc := FO_DELETE;
    pFrom := PChar( sFileName );
    fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION or FOF_SILENT;
  end;
  Result := ( 0 = ShFileOperation( fos ) );

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function KANameEx(AConn: TssSocketConnection; KAID: Integer; var APTypeID: Integer; var KType: Integer):string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'KANameEx') else _udebug := nil;{$ENDIF}

  with newDataSet(AConn) do
  try
    ProviderName := 'pKAgentName_Get';
    FetchParams;
    Params.ParamByName('KAID').AsInteger := KAID;
    Open;
    if not IsEmpty then begin
      APTypeID := FieldByName('ptypeid').AsInteger;
      Result := FieldByName('name').AsString;
      KType := FieldByName('ktype').AsInteger;
    end
    else Result := '';
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function KAName(AConn: TssSocketConnection;kaid:integer; var APTypeID: Integer; NameType: integer = 0):string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'KAName') else _udebug := nil;{$ENDIF}

  with newDataSet(AConn) do
  try
    ProviderName := 'pKAgentName_Get';
    FetchParams;
    Params.ParamByName('KAID').AsInteger := kaid;
    Open;
    if not IsEmpty then begin
      APTypeID := FieldByName('ptypeid').AsInteger;

      case NameType of
        0: Result := FieldByName('name').AsString;
        1:
          if FieldByName('fullname').AsString = ''
            then Result := FieldByName('name').AsString
            else Result := FieldByName('fullname').AsString;
      end//case
    end
    else Result := '';
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function MatGrpName(AConn: TssSocketConnection; GrpID: Integer): string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'MatGrpName') else _udebug := nil;{$ENDIF}

  with newDataSet(AConn) do
  try
    ProviderName := 'pMatGroup_Get';
    FetchParams;
    Params.ParamByName('grpid').AsInteger := GrpID;
    Open;
    Result := FieldByName('name').AsString;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetDiscount(AConn:TssSocketConnection;MatId, KaId:integer):Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetDiscount') else _udebug := nil;{$ENDIF}

  Result := 0;
  if MatID = 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  try
    with newDataSet(AConn) do
    try
      ProviderName := 'pWayBill_GetDiscount';
      FetchParams;
      Params.ParamByName('MatId').AsInteger := MatId;
      Params.ParamByName('kaId').AsInteger := KaId;
      Open;
      if not IsEmpty
        then Result := Fields[0].AsFloat
        else Result := 0;

    finally
      Free;
    end;

  except
    Result := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetLastOutPrice(AConn: TssSocketConnection; MatID, CurrID: Integer;
  OnDate: TDateTime; Kurs: Extended; KAID: Integer = 0): Extended;

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetLastOutPrice') else _udebug := nil;{$ENDIF}

  Result := 0;
  try
    with newDataSet(AConn) do
    try
      ProviderName := 'pWaybill_GetLastOutPrice';
      FetchParams;
      Params.ParamByName('matid').AsInteger := MatID;
      Params.ParamByName('kaid').AsInteger := KAID;
      Params.ParamByName('ondate').AsDateTime := OnDate;
      Open;
      if not IsEmpty then begin
        Result := RoundToA(FieldByName('price').AsFloat *
          GetCurrencyRateEx(AConn, FieldByName('currid').AsInteger, OnDate) / Kurs, PriceDisplayDigits);
      end
      else Result := 0;

    finally
      Free;
    end;

  except
    Result := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetDefPriceOut(AConn: TssSocketConnection; MatId, PTypeId: Integer;
  AvgPrice: Extended; OnDate: TDateTime; Kurs: Extended; var WithNDS: Boolean;
  CurrID: Integer = 0): Extended;

  var
    tmpOndate: TDateTime;
    tmpRateId: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetDefPriceOut') else _udebug := nil;{$ENDIF}

  try
    with newDataSet(AConn) do
    try
      ProviderName := 'pWayBill_GetDefPrice';
      FetchParams;
      Params.ParamByName('MatId').AsInteger := MatId;
      Params.ParamByName('PTypeId').AsInteger := PTypeId;
      Params.ParamByName('ondate').AsDateTime := OnDate;
      Params.ParamByName('price').AsFloat := AvgPrice;
      Params.ParamByName('onvalue').AsFloat := Kurs;
      Params.ParamByName('currid').AsInteger := CurrID;
      Open;
      if not IsEmpty then begin
        Result := RoundToA(FieldByName('extra').AsFloat, -6);
        WithNDS := FieldByName('withnds').AsInteger = 1;
      end
      else Result := 0;

    finally
      Free;
    end;

  except
    Result := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function MatName(AConn: TssSocketConnection;MatId:integer; var msrname, Article:String; var wid:integer; var ABySN:boolean):string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'MatName') else _udebug := nil;{$ENDIF}

  with newDataSet(AConn) do
  try
    ProviderName := 'pMaterials_GetName';
    FetchParams;
    Params.ParamByName('MatId').AsInteger := MatId;
    Open;
    if not IsEmpty then begin
      Result := Fields[0].AsString;
      msrname := Fields[1].AsString;
      Article := Fields[2].AsString;

      if Fields[3].IsNull
        then wid := 0
        else wid := Fields[3].AsInteger;

      ABySN := (Fields[4].AsInteger=1);
    end
    else begin
      Result := '';
      msrname := '';
      Article := '';
      wid := 0;
      ABySN := False;
    end;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetNextDefNum(AConn: TssSocketConnection; wtype:integer):integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetNextDefNum') else _udebug := nil;{$ENDIF}

  Result := 1;

  with newDataSet(AConn) do
    try
      case wtype of
        -1,1,4,5: begin
          ProviderName := 'pWayBill_Max_DefNum';
          FetchParams;
          Params.ParamByName('wtype').AsInteger := wtype;
        end;//-1,1

        6: begin
          ProviderName := 'pWayBill_Max_DefNum';
          FetchParams;
          Params.ParamByName('wtype').AsInteger := round(wtype/3);
        end;

        3: ProviderName := 'pTaxWB_Max_DefNum';

        -2,2:begin
          ProviderName := 'pContr_Max_DefNum';
          FetchParams;
          Params.ParamByName('conttype').AsInteger := round(wtype/2);
        end;//-2,2
      end;//case

      Open;
      if not Fields[0].IsNull
        then Result := Fields[0].AsInteger + 1
        else Result := 1;

      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure DoRecalcKASaldo(AConn: TssSocketConnection;
            FKAID: Integer; FDate: TDateTime; const FTitle: string; AShowProgress: Boolean = True);
  var
    cdsCalc: TssClientDataSet;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'DoRecalcKASaldo') else _udebug := nil;{$ENDIF}

  cdsCalc := newDataSet(AConn);

  with newDataSet(AConn) do
    try
      cdsCalc.ProviderName := 'pKAgent_Recalc';
      cdsCalc.FetchParams;

      ProviderName := 'pKAgent_GetDocs';
      FetchParams;
      Params.ParamByName('kaid').AsInteger := FKAID;
      Params.ParamByName('kaid1').AsInteger := FKAID;
      Params.ParamByName('kaid2').AsInteger := FKAID;
      Params.ParamByName('kaid3').AsInteger := FKAID;
      Params.ParamByName('ondate').AsDateTime := FDate;
      Params.ParamByName('ondate1').AsDateTime := FDate;
      Params.ParamByName('ondate2').AsDateTime := FDate;
      Open;

      if AShowProgress then fProgress.Show;

      try
        if AShowProgress then begin
          fProgress.Caption := FTitle + '...';
          fProgress.UpDate;
          fProgress.pbMain.Max := RecordCount;
        end;

        AConn.AppServer.Start;

        try
          while not Eof do begin
            if AShowProgress then fProgress.lText.Visible := False;

            Application.ProcessMessages;
            cdsCalc.Params.ParamByName('kaid').AsInteger := FKAID;
            cdsCalc.Params.ParamByName('ondate').AsDateTime := LastSecondInDay(Fields[0].AsDateTime);
            cdsCalc.Execute;
            if AShowProgress then fProgress.pbMain.StepIt;
            Next;
          end;
          AConn.AppServer.Commit;

        except
          AConn.AppServer.Rollback;
          raise;
        end;

      finally
        if AShowProgress then fProgress.Hide;
        Application.ProcessMessages;
      end;

      Close;
      if Logging and AShowProgress then RefreshLog;
      if AShowProgress then RefreshFun('TfmKAgent', 0);

    finally
      Free;
      cdsCalc.Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetMatRestsOnWHouse(AConn: TssSocketConnection; AMatID, AWID: integer;
           AOnDate: TDateTime; PMemData: Integer): Extended;
  var
    cdsRest, cdsRestR, cdsRsv_Temp: TssClientDataSet;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetMatRestsOnWHouse') else _udebug := nil;{$ENDIF}
  {$IFNDEF DEBUG}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then begin
    inc(AMatID);
  end;
  {$ENDIF}

  Result := 0;
  cdsRsv_Temp := newDataSet(AConn);
  cdsRest := newDataSet(AConn);

  //Получение таблицы временного резерва
  try
    with cdsRsv_Temp do begin
      ProviderName := 'pSysRsv_List';
      Open;
    end;// with cdsRsv_Temp

    //Получение остатков
    try
      with cdsRest do begin
        ProviderName := 'pWMat_GetMatRemain';
        FetchParams;
        Params.ParamByName('matid').AsInteger := AMatID;
        Params.ParamByName('wid').AsInteger := AWID;
        Params.ParamByName('ondate').AsDateTime := AOnDate;
        Open;
      end;//with cdsRest

      //**Заполнение MemData**//
      with TssMemoryData(pointer(PMemData)) do begin
        Close;
        Open;
        cdsRest.First;
        while not cdsRest.Eof do begin
          Append;
          FieldByName('matid').AsInteger := AMatID;
          FieldByName('wid').AsInteger := AWID;
          FieldByName('posid').AsInteger := cdsRest.fieldbyname('posid').AsInteger;

          FieldByName('amount').AsFloat := cdsRest.fieldbyname('remain').AsFloat -
                cdsRest.FieldByName('rsv').AsFloat + cdsRest.fieldbyname('ordered').AsFloat;

          if not cdsRsv_Temp.IsEmpty then begin
            cdsRsv_Temp.First;

            while not cdsRsv_Temp.Eof do begin
              if ((cdsRsv_Temp.FieldByName('visible').AsInteger = 1) or ((cdsRsv_Temp.FieldByName('visible').AsInteger=0)
                 and (cdsRsv_Temp.fieldbyname('addr').AsInteger = ServerAddr)))
                 and (cdsRsv_Temp.FieldByName('posid').AsInteger = cdsRest.fieldbyname('posid').AsInteger)
              then FieldByName('amount').AsFloat := FieldByName('amount').AsFloat-cdsRsv_Temp.fieldbyname('amount').AsFloat;

              cdsRsv_Temp.Next;
            end;//while not cdsRsv_Temp.Eof
          end;//if not cdsRsv_Temp.IsEmpty
          FieldByName('price').AsFloat := cdsRest.fieldbyname('avgprice').AsFloat;
          FieldByName('postype').AsInteger := cdsRest.fieldbyname('postype').AsInteger;
          FieldByName('ondate').AsDateTime := cdsRest.fieldbyname('v_ondate').AsDateTime;

          if not cdsRest.FieldByName('serial').IsNull
            then FieldByName('sn').AsString := cdsRest.fieldbyname('serial').AsString;

          if FieldByName('amount').AsFloat <> 0
            then Post
            else Cancel;

          cdsRest.Next;
        end;//while not cdsRest.Eof
      end;//with TssMemoryData(pointer(PMemData))

    finally
      cdsRest.Free;
    end;

  finally
    cdsRsv_Temp.Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetMatRestsOnWHouseWBM(AConn: TssSocketConnection; AMatID, AWID: integer;
          AOnDate: TDateTime; PMemData: Integer): Extended;
  var
    cdsRest, cdsRestR, cdsRsv_Temp: TssClientDataSet;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFNDEF DEBUG}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then begin
    inc(AMatID);
  end;
  {$ENDIF}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetMatRestsOnWHouseWBM') else _udebug := nil;{$ENDIF}

  Result := 0;
  cdsRsv_Temp := newDataSet(AConn);
  cdsRest := newDataSet(AConn);

  //Получение таблицы временного резерва
  try
    with cdsRsv_Temp do begin
      ProviderName := 'pSysRsv_List';
      Open;
    end;// with cdsRsv_Temp

    //Получение остатков
    try
      with cdsRest do begin
        ProviderName := 'pWMat_GetMatRemainWBM';
        FetchParams;
        Params.ParamByName('matid').AsInteger := AMatID;
        Params.ParamByName('wid').AsInteger := AWID;
        Params.ParamByName('ondate').AsDateTime := AOnDate;
        Open;
      end;//with cdsRest

      //**Заполнение MemData**//
      with TssMemoryData(pointer(PMemData)) do begin
        Close;
        Open;
        cdsRest.First;
        while not cdsRest.Eof do begin
          Append;
          FieldByName('matid').AsInteger := AMatID;
          FieldByName('wid').AsInteger := AWID;
          FieldByName('posid').AsInteger := cdsRest.fieldbyname('posid').AsInteger;
          FieldByName('amount').AsFloat := cdsRest.fieldbyname('remain').AsFloat - cdsRest.FieldByName('rsv').AsFloat;

          if not cdsRsv_Temp.IsEmpty then begin
             cdsRsv_Temp.First;

             while not cdsRsv_Temp.Eof do begin
               if ((cdsRsv_Temp.FieldByName('visible').AsInteger = 1) or ((cdsRsv_Temp.FieldByName('visible').AsInteger = 0)
                  and (cdsRsv_Temp.fieldbyname('addr').AsInteger = ServerAddr)))
                  and (cdsRsv_Temp.FieldByName('posid').AsInteger = cdsRest.fieldbyname('posid').AsInteger)
               then FieldByName('amount').AsFloat := FieldByName('amount').AsFloat-cdsRsv_Temp.fieldbyname('amount').AsFloat;

               cdsRsv_Temp.Next;
             end;//while not cdsRsv_Temp.Eof
           end;//if not cdsRsv_Temp.IsEmpty

           FieldByName('price').AsFloat := cdsRest.fieldbyname('avgprice').AsFloat;
           FieldByName('onvalue').AsFloat := cdsRest.fieldbyname('onvalue').AsFloat;
           FieldByName('NDS').AsFloat := cdsRest.fieldbyname('NDS').AsFloat;
           FieldByName('Discount').AsFloat := cdsRest.fieldbyname('Discount').AsFloat;
           FieldByName('ondate').AsDateTime := cdsRest.fieldbyname('v_ondate').AsDateTime;
           FieldByName('currid').AsInteger := cdsRest.fieldbyname('currid').AsInteger;

           if FindField('currname') <> nil then FieldByName('currname').AsString := cdsRest.fieldbyname('currname').AsString;

           if FieldByName('amount').AsFloat <> 0
             then Post
             else Cancel;

           cdsRest.Next;
         end;//while not cdsRest.Eof
       end;//with TssMemoryData(pointer(PMemData))

    finally
      cdsRest.Free;
    end;

  finally
    cdsRsv_Temp.Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function MoneyToStrShort(AValue: Extended): string;
  var
    fr: string;
    FValue: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFNDEF DEBUG}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then begin
    AValue := AValue + random(30);
  end;
  {$ENDIF}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'MoneyToStrShort') else _udebug := nil;{$ENDIF}

  case RepLangID of
    lidRUS, lidUKR:
      begin
        FValue := StrToFloat(FloatToStr(RoundToA(AValue, -2)));
        fr := FloatToStr(100 * RoundToA(Frac(FValue), -2));
        if Length(fr) = 1 then fr := '0' + fr;
        Result := IntToStr(Trunc(FValue)) + ' ' + BaseCurrShortName + ' ' + fr + ' ' + BaseCurrFracName;
      end;

    lidENG, lidESP:
      Result := FloatToStr(AValue) + ' ' + BaseCurrShortName;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetMaxID(AConn: TssSocketConnection; const ATableName, AKeyName: string): integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetMaxID') else _udebug := nil;{$ENDIF}

  Result := AConn.AppServer.GetMaxID(ATableName, AKeyName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetDrillDownList(AConn: TssSocketConnection; const ATable, AKeyName, AParentName: string; APID: integer): string;
  var
    ARes: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  procedure GetChildren(ADS: TDataSet; const AKeyName, AParentName: string; APID: integer; var ARes: string);
    var BM: TBookmark;
  begin
    BM := ADS.GetBookmark;

    try
      ADS.First;
      while not ADS.Eof do begin
        if (ADS.FieldByName(AParentName).AsInteger = APID) and (ADS.FieldByName(AKeyName).AsInteger <> APID)
        then begin
          ARes := ARes + ADS.fieldbyname(AKeyName).AsString + ',';
          GetChildren(ADS, AKeyName, AParentName, ADS.FieldByName(AKeyName).AsInteger, ARes);
        end;
        ADS.Next;
      end;

    finally
      ADS.GotoBookmark(BM);
      ADS.FreeBookmark(BM);
    end;
  end;

begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetDrillDownList') else _udebug := nil;{$ENDIF}

  ARes := '';
  with newDataSet(AConn) do
    try
       ProviderName := 'pSQL';
       FetchMacros;
       Macros.ParamByName('sql').AsString := 'select ' + AKeyName + ',' + AParentName + ' from ' + ATable;
       Open;
       if not IsEmpty then begin
         ARes := IntToStr(APID) + ',';
         GetChildren(Fields[0].DataSet, AKeyName, AParentName, APID, ARes);
       end;
       Close;

    finally
      Free;
    end;

  if ARes <> '' then System.Delete(ARes, Length(ARes), 1);

  Result := ARes;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetMatFIFO(AConn: TssSocketConnection; AMatID: integer; AAmount: extended; var ARemain: extended): TList;
  var
    FInfo: TWMatInfo;
    FAmount, Temp: extended;
    PosStr: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetMatFIFO') else _udebug := nil;{$ENDIF}

  ARemain := 0;
  Result := TList.Create;
  with newDataSet(AConn) do
    try
     ProviderName := 'pWMat_GetFIFO';
     FetchParams;
     FetchMacros;
     Params.ParamByName('matid').AsInteger := AMatID;
     Macros.ParamByName('m').AsString := '';
     Open;

     if IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

     FAmount := fieldbyname('remain').AsFloat - fieldbyname('reserved').AsFloat;
     FInfo := TWMatInfo.Create;
     FInfo.MatID := AMatID;
     FInfo.PosID := fieldbyname('posid').AsInteger;
     FInfo.Amount := FAmount;
     ARemain := FAmount;
     Result.Add(FInfo);
     PosStr := fieldbyname('posid').AsString;
     Close;
     while AAmount>FAmount do begin
       Macros.ParamByName('m').AsString := ' and w.posid not in ('+PosStr+')';
       Open;

       if IsEmpty then Break;

       Temp := fieldbyname('remain').AsFloat - fieldbyname('reserved').AsFloat;
       FAmount := FAmount + Temp;
       FInfo := TWMatInfo.Create;
       FInfo.MatID := AMatID;
       FInfo.PosID := fieldbyname('posid').AsInteger;
       FInfo.Amount := Temp;
       ARemain := ARemain+Temp;
       Result.Add(FInfo);
       PosStr := PosStr+','+fieldbyname('posid').AsString;
       Close;
     end;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure DoProgress(Obj: TObject; AIndex: Integer; const AText: string);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'DoProgress') else _udebug := nil;{$ENDIF}

  fProgress.pbMain.StepIt;
  fProgress.lText.Caption := AText;
  Application.ProcessMessages;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure ExportToExcel(AGrid: TdxDBGrid; AFieldList: TStringList; AShowExcel: Boolean = False);
  var
    i, j, k: integer;
    cw: integer;
    rect: string;
    AFName: string;
    pMethod: ^TMethod;
    FxlsExpFile: TXLSExportFile;
    FxlsExport: TssXLSExport;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFNDEF DEBUG}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then Exit;
  {$ENDIF}

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ExportToExcel') else _udebug := nil;{$ENDIF}

  with TSaveDialog.Create(nil) do
    try
      DefaultExt := 'xls';
      Filter := 'Excel files (*.xls)|*.xls';

      if not Execute then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

      if FileName <> '' then AFName := FileName;

    finally
      Free;
    end;

  fProgress.Caption := rs('Common', 'Excel') + '...';
  fProgress.lText.Caption := AFName;
  fProgress.Show;
  fProgress.Update;
  fProgress.pbMain.Max := AGrid.Count;
  fProgress.pbMain.Position := 0;

  FxlsExpFile := TXLSExportFile.Create(nil);
  FxlsExport := TssXLSExport.Create(nil);

  try
    FxlsExport.XLSExportFile := FxlsExpFile;
    pMethod := @@FxlsExport.OnProgress;
    pMethod.Code := @DoProgress;
    //todo: убрать пробелы в числах при экспорте
    FxlsExport.ExportGrid(0, 0, 0, AGrid, AFieldList, AFName);

    {k := 0;
    for i := 0 to AFieldList.Count-1 do begin
     if Integer(AFieldList.Objects[i])=1 then begin
      ex.PutFontCenter(k+1, 1, AGrid.ColumnByName(AFieldList.Strings[i]).Caption, DefExcelFontName, 12, clWindowText, [fsBold]);
      cw := trunc(AGrid.ColumnByName(AFieldList.Strings[i]).Width/AGrid.Canvas.TextWidth('W'));
      if Length(AGrid.ColumnByName(AFieldList.Strings[i]).Caption)>cw then cw := Length(AGrid.ColumnByName(AFieldList.Strings[i]).Caption)+10;
      ex.ColWidth(k+1, 1, cw);
      rect := ExcelRectToStr(k+1, 1, k+1, 1);
      SetCellsBackground(ex.WorkSheet, rect, clBtnFace);
      SetCellsBorder(ex.WorkSheet, rect, 1, 2);
      inc(k);
     end;
    end;
    for j := 0 to AGrid.Count-1 do begin
     k := 0;
     for i := 0 to AFieldList.Count-1 do begin
      if Integer(AFieldList.Objects[i])=1 then begin
       ex.PutFontLeft(k+1, j+2, VarToStr(AGrid.Items[j].Values[AGrid.ColumnByName(AFieldList.Strings[i]).Index]), DefExcelFontName, 10, clWindowText, []);
       if ex.WorkSheet.Cells[k+1, j+2].ColumnWidth < Length(VarToStr(AGrid.Items[j].Values[AGrid.ColumnByName(AFieldList.Strings[i]).Index]))
         then ex.ColWidth(k+1, j+2, Length(VarToStr(AGrid.Items[j].Values[AGrid.ColumnByName(AFieldList.Strings[i]).Index])) + 10);
       inc(k);
      end;
     end;
     FWait.pbMain.StepIt;
     Application.ProcessMessages;
    end;

    ex.SaveWorkBookAs(AFName);
    if AShowExcel
      then ex.Visible := True
      else ex.Connected := False;
    }

  finally
    FxlsExport.Free;
    FxlsExpFile.Free;
    fProgress.Hide;
  end;

  Application.ProcessMessages;

  if AShowExcel
    then ShellExecute(Application.Handle, nil, PChar(AFName), nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function IsCyclingRef(AConn: TssSocketConnection; const ATableName, AKeyName, AParentName: string; AID, APID: integer): boolean;

  function IsRef(DS: TDataSet; const AKeyName, AParentName: string; AID, APID: integer): boolean;
    var BM: TBookmark;
  begin
    Result := False;
    BM := DS.GetBookmark;

    try
      DS.First;
      while not DS.Eof do begin
        if (DS.FieldByName(AKeyName).AsInteger = APID) and (DS.FieldByName(AParentName).AsInteger = APID)
          then Exit;

        if (DS.FieldByName(AKeyName).AsInteger = APID) and (DS.FieldByName(AParentName).AsInteger = AID)
        then begin
          Result := True;
          Exit;
        end;

        if (DS.FieldByName(AKeyName).AsInteger = APID) then begin
          Result := IsRef(DS, AKeyName, AParentName, AID, DS.fieldbyname(AParentName).AsInteger);
          Exit;
        end;

        DS.Next;
      end;

    finally
      DS.GotoBookmark(BM);
      DS.FreeBookmark(BM);
    end;
  end;

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'IsCyclingRef') else _udebug := nil;{$ENDIF}

  Result := False;
  with newDataSet(AConn) do
    try
      ProviderName := 'pSQL';
      FetchMacros;
      Macros.ParamByName('sql').AsString := 'select '+AKeyName+','+AParentName+' from '+ATableName;
      Open;
      Result := IsRef(Fields[0].DataSet, AKeyName, AParentName, AID, APID);
      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure SetBtnStyle(ABtn: TcxButton; AStyle: integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'SetBtnStyle') else _udebug := nil;{$ENDIF}

  case AStyle of
    0: ABtn.LookAndFeel.Kind := lfStandard;
    1: ABtn.LookAndFeel.Kind := lfFlat;
    2: ABtn.LookAndFeel.Kind := lfUltraFlat;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure SetPCStyle(APC: TcxPageControl; AStyle: integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'SetPCStyle') else _udebug := nil;{$ENDIF}

  case AStyle of
    0: APC.LookAndFeel.Kind := lfStandard;
    1: APC.LookAndFeel.Kind := lfFlat;
    2: APC.LookAndFeel.Kind := lfUltraFlat;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure SetRBStyle(APC: TcxRadioButton; AStyle: integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'SetRBStyle') else _udebug := nil;{$ENDIF}

  case AStyle of
    0: APC.LookAndFeel.Kind := lfStandard;
    1: APC.LookAndFeel.Kind := lfFlat;
    2: APC.LookAndFeel.Kind := lfUltraFlat;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure SetGridStyle(APC: TdxDBGrid; AStyle: integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'SetGridStyle') else _udebug := nil;{$ENDIF}

  case AStyle of
    0: APC.LookAndFeel := dxTL6.lfStandard;
    1: APC.LookAndFeel := dxTL6.lfFlat;
    2: APC.LookAndFeel := dxTL6.lfUltraFlat;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure SetTLStyle(APC: TdxTreeList; AStyle: integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'SetTLStyle') else _udebug := nil;{$ENDIF}

  case AStyle of
    0: APC.LookAndFeel := dxTL6.lfStandard;
    1: APC.LookAndFeel := dxTL6.lfFlat;
    2: APC.LookAndFeel := dxTL6.lfUltraFlat;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure SetDBTLStyle(APC: TdxDBTreeList; AStyle: integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'SetDBTLStyle') else _udebug := nil;{$ENDIF}

  case AStyle of
    0: APC.LookAndFeel := dxTL6.lfStandard;
    1: APC.LookAndFeel := dxTL6.lfFlat;
    2: APC.LookAndFeel := dxTL6.lfUltraFlat;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
{procedure SetBarStyle(APC: TdxBarManager; AStyle: integer);
begin
  case AStyle of
    0: APC.Style := bmsStandard;
    1: APC.Style := bmsEnhanced;
    2: APC.Style := bmsFlat;
  end;
end;
}

//==============================================================================================
procedure SetStyle(ACtrl: TWinControl; AStyle: Integer);
  (*var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'SetStyle') else _udebug := nil;{$ENDIF}

  for i := 0 to ACtrl.ComponentCount-1 do begin
      if ACtrl.Components[i] is TcxButton
         then SetBtnStyle(TcxButton(ACtrl.Components[i]), AStyle)
      else if ACtrl.Components[i] is TcxPageControl
           then SetPCStyle(TcxPageControl(ACtrl.Components[i]), AStyle)
      else if ACtrl.Components[i] is TdxDBGrid
           then SetGridStyle(TdxDBGrid(ACtrl.Components[i]), AStyle)
      else if ACtrl.Components[i] is TdxBarManager
           then SetBarStyle(TdxBarManager(ACtrl.Components[i]), AStyle)
      else if ACtrl.Components[i] is TdxTreeList
           then SetTLStyle(TdxTreeList(ACtrl.Components[i]), AStyle)
      else if ACtrl.Components[i] is TdxDBTreeList
           then SetDBTLStyle(TdxDBTreeList(ACtrl.Components[i]), AStyle)
      else if ACtrl.Components[i] is TcxRadioButton
           then SetRBStyle(TcxRadioButton(ACtrl.Components[i]), AStyle);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
function DeleteDataEx(AConn: TssSocketConnection; const ATableName, AKeyName: string; AID: integer): boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'DeleteDataEx') else _udebug := nil;{$ENDIF}

  try
    with newDataSet(AConn) do
    try
      ProviderName := 'pSQL';
      FetchMacros;
      Macros.ParamByName('sql').AsString := 'delete from ' + ATableName + ' where ' + AKeyName + '=' + IntToStr(AID);
      Execute;
      Result := True;

    finally
      Free;
    end;

  except
    on e:exception do begin
      Result := False;
      raise exception.create(e.message);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function DeleteData(AConn: TssSocketConnection; const ATableName: string; AID: integer): boolean;
  var
    cdsRel: TssClientDataSet;
    qDel: TStringList;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  {
  function DeleteChildren(AConn: TssSocketConnection; ATabID, AID: integer; const ATableName, AKeyName: string): boolean;
     var BM: TBookmark;
  begin
    Result := False;
    BM := cdsRel.GetBookmark;

    with newDataSet(AConn) do
    try
      try
        cdsRel.First;

        while not cdsRel.Eof do begin
          if (cdsRel.FieldByName('PID').AsInteger = ATabID)
              and not DeleteChildren(AConn, cdsRel.fieldbyname('tabid').AsInteger, AID, cdsRel.fieldbyname('tname').AsString, cdsRel.fieldbyname('keyname').AsString)
          then Exit;

          cdsRel.Next;
        end;

        ProviderName := 'pSQL';
        FetchMacros;
        Macros.ParamByName('sql').AsString := 'delete from '+ATableName+' where '+AKeyName+'='+IntToStr(AID);
        Execute;

        Result := True;

      except
      end;
    finally
      cdsRel.GotoBookmark(BM);
      cdsRel.FreeBookmark(BM);
      Free;
    end;
  end;
  }

begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'DeleteData') else _udebug := nil;{$ENDIF}

  Result := False;

  {if cdsFunc.Locate('tablename', ATableName, [loCaseInsensitive]) then begin
   cdsRel := newDataSet(AConn);
   qDel := TStringList.Create;
   try
    cdsRel.ProviderName := 'pTableRel_Get';
    cdsRel.Open;
     if DeleteChildren(AConn, cdsFunc.fieldbyname('tabid').AsInteger, AID, cdsFunc.fieldbyname('tablename').AsString, cdsFunc.fieldbyname('keyname').AsString)
      then Result := True;
    cdsRel.Close;
   finally
    cdsRel.Free;
    qDel.Free;
   end;
  end;
  }

  try
    with newDataSet(AConn) do
    try
      ProviderName := 'pDeleteData';
      FetchParams;
      Params.ParamByName('tablename').AsString := ATableName;
      Params.ParamByName('id').AsInteger := AID;
      Execute;
      Result := True;

    finally
      Free;
    end;

  except
    on e: exception do begin
      Result := False;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function AddToRecycleBin(AConn: TssSocketConnection; const AClassName: string;
  AID: integer; const AText: string; ResetDef: boolean; AFunID: Integer): Boolean;

 var
   FTableName, FKeyName: string;
   FID, FAccID: integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFNDEF FREE}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'AddToRecycleBin') else _udebug := nil;{$ENDIF}

  Result := False;

  if not cdsFunc.Locate('classname', AClassName, []) then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FTableName := cdsFunc.fieldbyname('tablename').AsString;
  FKeyName := cdsFunc.fieldbyname('keyname').AsString;

  with newDataSet(AConn) do
  try
    AConn.AppServer.Start;

    try
      if ResetDef then begin
        ProviderName := 'pSQL';
        FetchMacros;
        Macros.ParamByName('sql').AsString := 'update ' + FTableName + ' set def=0 where ' + FKeyName + '=' + IntToStr(AID);
        Execute;

        Macros.ParamByName('sql').AsString := 'select min(' + FKeyName
          + ') from ' + FTableName + ' where ' + FKeyName + '<>' + IntToStr(AID) + ' and deleted<>1';

        Open;
        if not IsEmpty
          then FID := Fields[0].AsInteger
          else FID := 0;
        Close;

        if FID > 0 then begin
          Macros.ParamByName('sql').AsString := 'update ' + FTableName + ' set def=1 where ' + FKeyName + '=' + IntToStr(FID);
          Execute;
        end;
      end; // if ResetDef

      if AFunID = 23 then begin // wbout
        ProviderName := 'pWaybill_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := AID;
        Open;
        FAccID := Trunc(FieldByName('todate').AsFloat);
        Close;

        if FAccID > 0 then begin
          ProviderName := 'pWaybill_UpdAccRsv';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := AID;
          Execute;
          ProviderName := 'pDocsRel_WB_Acc_Del';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := AID;
          Params.ParamByName('accid').AsInteger := FAccID;
          Execute;
          ProviderName := 'pWaybill_SetToDate';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := AID;
          Execute;
        end;
      end;

      // wbout, Accout, order
      if AFunID in [23, 30, 64, 65 {$IFDEF CBL},21{$ENDIF}] then begin
        ProviderName := 'pWMatTurn_Del';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := AID;
        Execute;
      end;

      {$IFNDEF DEBUG}
      if not ProtCheck then Exit;
      {$ENDIF}

      FID := GetMaxID(AConn, 'recyclebin', 'id');

      ProviderName := 'pRBin_Ins';
      FetchParams;
      Params.ParamByName('id').AsInteger := FID;
      Params.ParamByName('tabid').AsInteger := cdsFunc.fieldbyname('tabid').AsInteger;
      Params.ParamByName('delid').AsInteger := AID;
      Params.ParamByName('funid').AsInteger := AFunID;
      Params.ParamByName('textstr').AsString := AText;
      Params.ParamByName('ontime').AsDateTime := Now;
      Params.ParamByName('userid').AsInteger := UserID;
      Execute;

      ProviderName := 'pRBin_SetDeleted';
      FetchParams;
      FetchMacros;
      Macros.ParamByName('tablename').AsString := cdsFunc.fieldbyname('tablename').AsString;
      Macros.ParamByName('keyname').AsString := cdsFunc.fieldbyname('keyname').AsString;
      Params.ParamByName('id').AsInteger := AID;
      Execute;

      AConn.AppServer.Commit;
      Result := True;
      RefreshFun('TfmRecycleBin', 0);

    except
      AConn.AppServer.Rollback;
      raise;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  {$ENDIF}
end;

//==============================================================================================
procedure SetUserActivity(AConn: TssSocketConnection; AFunID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'SetUserActivity') else _udebug := nil;{$ENDIF}

  AConn.AppServer.usr_SetActivity(AFunID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure ExpandAll(ATree: TCustomdxTreeListControl);
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ExpandAll') else _udebug := nil;{$ENDIF}

  for i := 0 to ATree.Count - 1 do ATree.Items[i].Expand(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure InitUserAccess(AConn: TssSocketConnection; const AUserID: integer);
  var
    AllowedAllWH: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'InitUserAccess') else _udebug := nil;{$ENDIF}

  AllowedWH := '';
  AllowedAllWH := True;
  UserID := AUserID;

  with newDataSet(AConn) do
  try
    ProviderName := 'pWHPerm_Get';
    FetchParams;
    Params.ParamByName('userid').AsInteger := AUserID;
    Open;

    while not Eof do begin
      if (AUserID = 0) or not FieldByName('allow').IsNull
        then AllowedWH := AllowedWH + FieldByName('wid').AsString + ','
        else AllowedAllWH := False;

        if length(AllowedWH) > 1023 then begin //weird case. allowing all to prevent usual 1024 char length limit on stored procedures, etc.
          debugInstantLog('! Too much warehouses created. disabling access limiting');
          AllowedAllWH := True;
          Break;
        end;

      Next;
    end;

    Close;

  finally
    Free;
  end;

  if AllowedAllWH
    then AllowedWH := '*'
    else if trim(AllowedWH) <> ''
      then System.Delete(AllowedWH, Length(AllowedWH), 1)
      else AllowedWH := '-1';

  if not Assigned(cdsFunc) then cdsFunc := newDataSet(AConn);

  if cdsFunc.Active then cdsFunc.Close;

  if AUserID = 0
    then cdsFunc.ProviderName := 'pUserAccess_GetAdmin'
    else begin
      cdsFunc.ProviderName := 'pUserAccess_Get';
      cdsFunc.FetchParams;
      cdsFunc.Params.ParamByName('userid').AsInteger := AUserID;
    end;

  cdsFunc.Open;

  if (AUserID > 0) and cdsFunc.Locate('classname', 'f_ShowPrices', [])
    then ShowPrices := cdsFunc.FieldByName('canview').AsInteger = 1
    else ShowPrices := True;

  if (AUserID > 0) and cdsFunc.Locate('classname', 'f_ShowBallance', [])
    then ShowBallance := cdsFunc.FieldByName('canview').AsInteger = 1
    else ShowBallance := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function WHAccessMacro(id: string = 'wid'): String;
begin
  Result := ifThen(AllowedWH = '*', '', ' and ' + id + ' in (' + AllowedWH + ')');
end;

//==============================================================================================
procedure InitProfile(AConn: TssSocketConnection; const AUserID: integer; var AProfID, ATreeID: integer; ASC: TcxEditStyleController);
 var
   intTmp: Integer;
   s: String;
   ds: TssClientDataSet;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

   function loadParam(const name: string; var val: Integer): Boolean;
   begin
     Result := False;
     try
       if ds.Locate('parname', name, []) then begin
         val := ds.FieldByName('parvalue').AsInteger;
         Result := True;
       end;

     except
     end;
   end;

   function loadParamBool(const name: string; var val: Boolean): Boolean;
     var i: integer;
   begin
     Result := loadParam(name, i);
     if Result then val := (i = 1);
   end;

   function loadParamStr(const name: string; var val: String): Boolean;
   begin
     Result := False;
     try
       if ds.Locate('parname', name, []) then begin
         val := ds.FieldByName('parvalue').AsString;
         Result := True;
       end;
       
     except
     end;
   end;

begin
  {$IFNDEF DEBUG}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  {$ENDIF}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'InitProfile') else _udebug := nil;{$ENDIF}

  BaseCurrName := GetBaseCurrName(AConn);

  cdsEnts.Open;

  ds := newDataSet(AConn);

  with ds do
  try
    ProviderName := 'pProfiles_GetByUser';
    //FetchParams;
    //Params.ParamByName('userid').AsInteger := AUserID;
    Open;

    if not IsEmpty then begin
      AProfID := fieldbyname('profid').AsInteger;
      ATreeID := fieldbyname('treeid').AsInteger;
      //FLang := fieldbyname('lang').AsInteger;
      IStyle := fieldbyname('istyle').AsInteger;
      GridOddLinesColor := fieldbyname('oddcolor').AsInteger;
      //RunCCatStartup := fieldbyname('runcc').asinteger=1;
    end;

    Close;

    {$IFDEF FREE}
    optHideInfoPane := False;
    {$ELSE}
    if not ReadFromRegBool(MainRegKey, 'HideInfoPane', optHideInfoPane)
      then optHideInfoPane := True;
    {$ENDIF}

    if not ReadFromRegBool(MainRegKey, 'FilterOnSearch', FilterOnSearch)
      then FilterOnSearch := True;

    if not ReadFromRegBool(MainRegKey, 'NextCtrlOnEnter', NextCtrlOnEnter)
      then NextCtrlOnEnter := True;

    if not ReadFromRegBool(MainRegKey, 'ShowCalcOnKeyPress', ShowCalcOnKeyPress)
      then ShowCalcOnKeyPress := True;

    if not ReadFromRegBool(MainRegKey, 'ShowRetNDS', ShowRetNDS)
      then ShowRetNDS := True;

    ProviderName := 'pCommonParams_Get';
    Params.Clear;
    Open;
    if not IsEmpty then begin
      NDS := fieldbyname('nds').AsFloat;
      ChargeType := TChargeType(fieldbyname('chargetype').AsInteger);

      if not FieldByName('potype').IsNull
        then POType := TPOType(FieldByName('potype').AsInteger);

      if not FieldByName('printtype').IsNull
        then PrintType := FieldByName('printtype').AsInteger;

      if not FieldByName('deltobin').IsNull
        then DelToRecycleBin := (FieldByName('deltobin').AsInteger = 1)
        else DelToRecycleBin := True;
    end;
    Close;

    {$IFDEF FREE}
    DelToRecycleBin := False;
    {$ENDIF}

    ProviderName := 'pProfCommon_Get';
    FetchParams;
    Params.ParamByName('profid').AsInteger := AProfID;
    Open;

    if not IsEmpty then begin
      CheckCurrency := (fieldbyname('checkcurrency').AsInteger = 1);
      WBOutAutoWH := (FieldByName('wboutautowh').AsInteger = 1);
      AccOutAutoWH := (FieldByName('accoutautowh').AsInteger = 1);

      if not FieldByName('rptype').IsNull
        then RPType := TRoundPricesType(FieldByName('rptype').AsInteger);
    end;
    Close;


    ProviderName := 'pProfDocParams_Get';
    FetchParams;
    Params.ParamByName('profid').AsInteger := AProfID;
    Open;

    if Locate('doctype', 1, []) then begin
      WBInAllowZero := (FieldByName('allowzero').AsInteger = 1);
      WBInDefAmount := FieldByName('defamount').AsFloat;
      WBInChecked := (FieldByName('checked').AsInteger = 1);
      WBInAutoNum := (FieldByName('autonum').AsInteger = 1);
      WBInPrefix := FieldByName('prefix').AsString;
      WBInSuffix := FieldByName('suffix').AsString;
    end;

    if Locate('doctype', 2, []) then begin
      WBOutAllowZero := FieldByName('allowzero').AsInteger = 1;
      WBOutDefAmount := FieldByName('defamount').AsFloat;
      WBOutChecked := FieldByName('checked').AsInteger = 1;
      WBOutAutoNum := FieldByName('autonum').AsInteger = 1;
      WBOutPrefix := FieldByName('prefix').AsString;
      WBOutSuffix := FieldByName('suffix').AsString;
    end;

    if Locate('doctype', 3, []) then begin
      AODefAmount := FieldByName('defamount').AsFloat;
      AOAutoNum := FieldByName('autonum').AsInteger = 1;
      AOPrefix := FieldByName('prefix').AsString;
      AOSuffix := FieldByName('suffix').AsString;
    end;

    if Locate('doctype', 4, []) then begin
      WBMoveDefAmount := FieldByName('defamount').AsFloat;
      WBMoveChecked := FieldByName('checked').AsInteger = 1;
      WBMoveAutoNum := FieldByName('autonum').AsInteger = 1;
      WBMovePrefix := FieldByName('prefix').AsString;
      WBMoveSuffix := FieldByName('suffix').AsString;
    end;

    if Locate('doctype', 5, []) then begin
      TaxWBDefAmount := FieldByName('defamount').AsFloat;
      TaxAutoNum := FieldByName('autonum').AsInteger = 1;
      TaxPrefix := FieldByName('prefix').AsString;
      TaxSuffix := FieldByName('suffix').AsString;
    end;

    if Locate('doctype', 6, []) then begin
      PDInChecked := FieldByName('checked').AsInteger = 1;
      PDInAutoNum := FieldByName('autonum').AsInteger = 1;
      PDInPrefix := FieldByName('prefix').AsString;
      PDInSuffix := FieldByName('suffix').AsString;
    end;

    if Locate('doctype', 7, []) then begin
      PDOutChecked := FieldByName('checked').AsInteger = 1;
      PDOutAutoNum := FieldByName('autonum').AsInteger = 1;
      PDOutPrefix := FieldByName('prefix').AsString;
      PDOutSuffix := FieldByName('suffix').AsString;
    end;

    if Locate('doctype', 8, []) then begin
      WBRestAllowZero := FieldByName('allowzero').AsInteger = 1;
      WBRestDefAmount := FieldByName('defamount').AsFloat;
      WBRestChecked := FieldByName('checked').AsInteger = 1;
      WBRestAutoNum := FieldByName('autonum').AsInteger = 1;
      WBRestPrefix := FieldByName('prefix').AsString;
      WBRestSuffix := FieldByName('suffix').AsString;
    end;

    if Locate('doctype', 9, []) then begin
      WriteOffDefAmount := FieldByName('defamount').AsFloat;
      WriteOffChecked := FieldByName('checked').AsInteger = 1;
      WriteOffAutoNum := FieldByName('autonum').AsInteger = 1;
      WriteOffPrefix := FieldByName('prefix').AsString;
      WriteOffSuffix := FieldByName('suffix').AsString;
    end;

    if Locate('doctype', 10, []) then begin
      PDChargeChecked := FieldByName('checked').AsInteger = 1;
      PDChargeAutoNum := FieldByName('autonum').AsInteger = 1;
      PDChargePrefix := FieldByName('prefix').AsString;
      PDChargeSuffix := FieldByName('suffix').AsString;
    end;

    if Locate('doctype', 11, []) then begin
      InvChecked := FieldByName('checked').AsInteger = 1;
      InvAutoNum := FieldByName('autonum').AsInteger = 1;
      InvPrefix := FieldByName('prefix').AsString;
      InvSuffix := FieldByName('suffix').AsString;
    end;

    if Locate('doctype', 12, []) then begin
      ReturnOutChecked := FieldByName('checked').AsInteger = 1;
      ReturnOutAutoNum := FieldByName('autonum').AsInteger = 1;
      ReturnOutPrefix := FieldByName('prefix').AsString;
      ReturnOutSuffix := FieldByName('suffix').AsString;
    end;

    if Locate('doctype', 13, []) then begin
      ReturnInChecked := FieldByName('checked').AsInteger = 1;
      ReturnInAutoNum := FieldByName('autonum').AsInteger = 1;
      ReturnInPrefix := FieldByName('prefix').AsString;
      ReturnInSuffix := FieldByName('suffix').AsString;
    end;

    if Locate('doctype', 14, []) then begin
      InvoiceDefAmount := FieldByName('defamount').AsFloat;
      InvoiceAutoNum := FieldByName('autonum').AsInteger = 1;
      InvoicePrefix := FieldByName('prefix').AsString;
      InvoiceSuffix := FieldByName('suffix').AsString;
    end;

    if Locate('doctype', 15, []) then begin
      OrdersInDefAmount := FieldByName('defamount').AsFloat;
      OrdersInAutoNum := FieldByName('autonum').AsInteger = 1;
      OrdersInPrefix := FieldByName('prefix').AsString;
      OrdersInSuffix := FieldByName('suffix').AsString;
    end;

    if Locate('doctype', 16, []) then begin
      OrdersOutDefAmount := FieldByName('defamount').AsFloat;
      OrdersOutAutoNum := FieldByName('autonum').AsInteger = 1;
      OrdersOutPrefix := FieldByName('prefix').AsString;
      OrdersOutSuffix := FieldByName('suffix').AsString;
    end;
    Close;

    EntLogo := TMemoryStream.Create;

    ProviderName := 'pEntParams_Get';
    Params.Clear;
    Open;
    if not IsEmpty then begin
      (FieldByName('logo') as TBlobField).SaveToStream(EntLogo);
      EntLogo.Position := 0;
    end;
    Close;

    //------------------------------------------------------------------------------
    GetCurrentEnt(AConn);

    ProviderName := 'pPrgParams_List';
    Params.Clear;
    Open;
    if loadParam('WBOutDefAction', intTmp) then WBOutDefAction := TAddAction(intTmp);

    if loadParam('WBInDefAction', intTmp) then WBInDefAction := TAddAction(intTmp);

    if loadParamStr('WBInAutoPrice', s) then WBInAutoPrice := (s = 'True');
    loadParam('WBInAutoPriceType', WBInAutoPriceType);
    loadParam('WBInPriceType', WBInPriceType);
    loadParam('WBOutPriceType', WBOutPriceType);
    if not loadParam('WBOutAutoPrice', WBOutAutoPrice) then WBOutAutoPrice := 0;

    loadParamBool('WBOutCheckDC', WBOutCheckDC);

    loadParam('Torg13PriceType', Torg13PriceType);

    loadParamBool('CheckMoney', CheckMoney);

    loadParam('PricePrecision', PricePrecision);

    if loadParam('MatPrecision', MatDisplayDigits) then MatDisplayDigits := -MatDisplayDigits;

    loadParamBool('WMatHLNeeded', HighlightNeededMats);

    if loadParam('WMatHLColor', intTmp) then CL_OK_WMAT_HIGHLIGHT_NEEDED := intTmp;

    loadParamBool('WMatShowAll', WMatShowAll);

    if loadParam('AONPColor', intTmp) then CL_OK_AO_NOT_PAID := intTmp;

    loadParamBool('AOSelectNP', AOSelectNP);

    if loadParam('OONPColor', intTmp) then CL_OK_OO_NOT_PAID := intTmp;

    loadParamBool('OOSelectNP', OrdersOutSelectNP);

    if loadParam('OINPColor', intTmp) then CL_OK_OI_NOT_PAID := intTmp;

    loadParamBool('OISelectNP', OrdersInSelectNP);

    loadParam('MEViewType', MultiEntsViewType);

    loadParamBool('BC_Enabled', BC_Enabled);
    loadParam('BC_CodeFrom', BC_CodeFrom);
    loadParam('BC_CodeTo', BC_CodeTo);
    loadParam('BC_Weight_IntFrom', BC_Weight_IntFrom);
    loadParam('BC_Weight_IntTo', BC_Weight_IntTo);
    loadParam('BC_Weight_FracFrom', BC_Weight_FracFrom);
    loadParam('BC_Weight_FracTo', BC_Weight_FracTo);
    loadParam('PriceRoundFrac', PriceRoundFrac);
    loadParam('PriceRoundInt', PriceRoundInt);

    if not loadParam('WBInShowModel', OptWBInShowModel) then OptWBInShowModel := 0;
    if not loadParam('WBOutShowModel', OptWBOutShowModel) then OptWBOutShowModel := 0;
    if not loadParam('WBMoveShowModel', OptWBMoveShowModel) then OptWBMoveShowModel := 0;

    if not loadParam('WBInRepSortField', optWBInRepSortField) then optWBInRepSortField := 1; // by name
    if not loadParamBool('WBInRepSortDesc', optWBInRepSortDesc) then optWBInRepSortDesc := False;
    if not loadParam('WBOutRepSortField', optWBOutRepSortField) then optWBOutRepSortField := 1;
    if not loadParamBool('WBOutRepSortDesc', optWBOutRepSortDesc) then optWBOutRepSortDesc := False;

    if not loadParamBool('OptMultiCurrency', OptMultiCurrency) then OptMultiCurrency := True;

    Close;

    resetMatDisplayFormat;

  finally
    Free;
  end;

  InitUserAccess(AConn, UserID);
  SetPriceDispFormat;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetBaseCurrName(AConn: TssSocketConnection): string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetBaseCurrName') else _udebug := nil;{$ENDIF}

  Result := '';
  with newDataSet(AConn) do
    try
      ProviderName := 'pCurrency_GetDef';
      Open;
      Result := fieldbyname('shortname').AsString;
      BaseCurrID := fieldbyname('currid').AsInteger;
      BaseCurrShortName := fieldbyname('repshortname').AsString;
      BaseCurrFracName := fieldbyname('repfracname').AsString;
      BaseCurrType := fieldbyname('curtype').AsInteger;
      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function ExistRegPath(AKey: string): boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ExistRegPath') else _udebug := nil;{$ENDIF}

  Result := False;
  with TRegistry.Create do
    try
      if OpenKey(PrRegKey + '\' + AKey, false) then begin
        Result := True;
        CloseKey;
      end;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function IsFormFound(AClass: string): boolean;
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'IsFormFound') else _udebug := nil;{$ENDIF}

  Result := False;
  for i := 0 to Screen.FormCount-1 do
    if Screen.Forms[i].ClassName = AClass then begin
      if Screen.Forms[i].WindowState = wsMinimized then Screen.Forms[i].WindowState := wsNormal;
      Screen.Forms[i].BringToFront;
      Result := True;
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure DSRefresh(ADS: TDataSet; const AKeyName: string; AKeyValue: integer; AHourGlass: boolean = true; AForce: Boolean = False);
  var
    FID: Integer;
    m: TParams;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'DSRefresh') else _udebug := nil;{$ENDIF}

  //ADS.DisableControls;
  if AHourGlass then Screen.Cursor := crHourGlass;

  m := nil;
  FID := -1;

  try //finally
    try
      if (AKeyValue = 0) and ADS.Active
        then FID := ADS.fieldbyname(AKeyName).AsInteger
        else FID := AKeyValue;

    except
      on e: Exception do
        debugInstantLog('DSrefresh: gettin current id ' + e.Message + ' for DS: "' + ADS.Name + '" key: "' + AKeyName + '" val: ' + IntToStr(AKeyValue));
    end;

    try
      if ADS.Active and (ADS is TssClientDataSet) and (TssClientDataSet(ADS).Macros.Count > 0)
      then begin
        m := TParams.Create;
        m.Assign(TssClientDataSet(ADS).Macros);
      end;

      if AForce then begin
        ADS.Close;
        if m <> nil then TssClientDataSet(ADS).Macros.Assign(m);
        ADS.Open;
        //ADS.Refresh;
      end
      else begin
        if ADS.Active then begin
          ADS.Close;
          if m <> nil then TssClientDataSet(ADS).Macros.Assign(m);
          ADS.Open;
          //ADS.Refresh;
        end
        else ADS.Open;
      end;

    except
      on e: Exception do
        debugInstantLog('DSrefresh: Close/Open/Refresh: ' + e.Message + ' for DS: "' + ADS.Name + '" key: "' + AKeyName + '" val: ' + IntToStr(AKeyValue));
    end;

    try
      ADS.Locate(AKeyName, FID, []);

    except
      on e: Exception do
        debugInstantLog('DSrefresh: locate() ' + e.Message + ' for DS: "' + ADS.Name + '" key: "' + AKeyName + '" val: ' + IntToStr(AKeyValue));
    end;

  finally
    //ADS.EnableControls;
    if m <> nil then m.Free;
    if AHourGlass then Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure InitRes(ALngMan: TxLngManager);
  var
    FFileName, FCfgFile: string;
    S: string;
    I: Integer;
    b: array [0..1024] of char;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFNDEF DEBUG}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  {$ENDIF}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'InitRes') else _udebug := nil;{$ENDIF}

  LoadLangInfo;

  InWordsRepLang := LangNames[lidRUS];

  with TIniFile.Create(ClientPath + client_ini) do
  try
    S := ReadString('lng', 'InWordsRepLang', '');
    if S <> '' then InWordsRepLang := AnsiUpperCase(S);

    S := ReadString('font', 'EditsFont', '');
    if S <> '' then dmData.scMain.Style.Font.Name := S;

    S := ReadString('font', 'MainFont', '');
    if S <> '' then Font_Main.Name := S;

    i := ReadInteger('font', 'MainFontSize', -1);
    if i > 5 then Font_Main.Size := i;

    if ValueExists('font', 'MainFontColor') then Font_Main.Color := ReadInteger('font', 'MainFontColor', 0);

    S := ReadString('font', 'GridsFont', '');
    if S <> '' then Font_Grids.Name := S;

    i := ReadInteger('font', 'GridsFontSize', -1);
    if i > 5 then Font_Grids.Size := i;

    if ValueExists('font', 'GridsFontColor') then Font_Grids.Color := ReadInteger('font', 'GridsFontColor', 0);

    setFontStyle(dmData.scMain.Style.font);
    {setFontStyle(dmData.scMain4Labels.Style.font);
    setFontStyle(dmData.scMainErr.Style.font);
    setFontStyle(dmData.scMainOK.Style.font);
    }

    i := ReadInteger('font', 'MainCharset', -1);
    if i <> -1 then begin
      Font_Main.Charset := i;
      Font_Grids.Charset := i;
    end;

  finally
    Free;
  end;

  // loading activation URLs
  loadString(resDllHandle, 7,  b, 1024); URL_KeyActivate := decodeKey(string(b));
  loadString(resDllHandle, 8,  b, 1024); URL_KeyActivatePost := decodeKey(string(b));
  loadString(resDllHandle, 9,  b, 1024); URL_KeyCheck := decodeKey(string(b));
  loadString(resDllHandle, 10, b, 1024); URL_KeyCheckPost := decodeKey(string(b));
  loadString(resDllHandle, 11, b, 1024); URL_KeyHost := decodeKey(string(b));
  loadString(resDllHandle, 12, b, 1024);
  if BrandCodes = nil then BrandCodes := TStringList.Create;
  BrandCodes.Text := AnsiReplaceStr(AnsiString(b), ',', #13#10);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function CheckLogin(AConn: TssSocketConnection; ALoginType: TLoginType): boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'CheckLogin') else _udebug := nil;{$ENDIF}

  Result := False;

  frmLogin := TokLoginClass.Create(nil);
  
  with frmLogin do
    try
      LoginType := ALoginType;
      SConn := AConn;

      Result := True;

      repeat
        if ShowModal <> mrOk then begin
          Result := False;
          Break;
        end;
      until UserID >= 0;

      //Result := (ShowModal = mrOk) and (UserID >= 0);

    finally
      FreeAndNil(frmLogin);
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function ProtCheck: Boolean;
begin
  Result := True;

  (*
  {$IFNDEF DEBUG}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if CompareDateTime(Now, FNextProtCheck) = GreaterThanValue then Exit; // not yet

  FNextProtCheck := IncMilliSecond(now, random(10000) + 500); // 0,5 - 10 sec

  //If not EnvelopeCheck then Result := False;

  {$IFNDEF FREE}
  if Reginfo.Text = '' then Result := False;
  {$ENDIF}

  {$IFDEF DEBUG}
  if not Result then storeMessage('Envelope check failed!');
  {$ENDIF}

  {$ENDIF}
  *)
end;

//==============================================================================================
function ClientServerAuth(AConn: TssSocketConnection): Integer;
  var
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    AservKey, AservMsg: OleVariant;
    s: WideString;
    atype: String;
    i: Integer;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ClientServerAuth') else _udebug := nil;{$ENDIF}

  Result := 0;
  s := '';

  try //finally
    {$IFDEF FREE}
      s := s + 'Type=F'#13#10;
    {$ELSE}
      if ReadFromRegStr(prRegKey, 'AType', atype) and (trim(atype) <> '') // inserting last activation result
        then s := s + #13#10 + decodeKey(trim(atype)) + #13#10;

      s := s + 'Type=C'#13#10;
    {$ENDIF}

    s := s + 'clientVer=' + FullVersionNo + #13#10;

    try
      // sending our version, type to server and getting key out
      s := encodeKey(s);
      Result := Aconn.AppServer.ClientRegInfo(s, AservKey, AservMsg);
      servMsg.Text := decodeKey(AservMsg);
      //{$IFDEF DEBUG}showmessage('got srv key: "' + decodeKey(Aservkey) + '"'#10#13' msg: ' + servMsg.Text);{$ENDIF}

      {$IFNDEF FREE}
        AssignRegKey(AservKey, False); // no key check, as hid is for server's hardware.
      {$ENDIF}

    except
      on e: exception do begin
        if cmdLineDebugLevel > 9 then showmessage('exception (' + e.Message + ') on CRI');
        Result := 1;
      end;
    end;

    if Result <> 0 then begin // ClientRegInfo failed somehow
      Result := Result + 20;
      Exit;
    end;

    if servMsg.Values['type'] <> {$IFDEF FREE}'F'{$ELSE}'C'{$ENDIF} then Result := 10; // not our type server

    i := compareVersionNumbers(servMsg.Values['serverVer'], minSrvVer);
    if i < 0 then Result := 10;

    if Result <> 0 then Exit;

    // setting capabilities based on key
    BarcodesEnabled := (RegInfo.Values['barcodes'] = '1') or (RegInfo.Values['barcode'] = '1');
    DropRegKey(prRegKey + '\AType');

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function Login(AConn: TssSocketConnection; const ALoginType: TLoginType;
               const AUser, APass, AHost: string; ADBID: integer; ASMode: Boolean = False): integer;
  var
    dummy: OleVariant;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFNDEF DEBUG}{$I ASPROTECT\UserPolyBuffer.inc}{$ENDIF}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'Login') else _udebug := nil;{$ENDIF}

  Result := 0;

  try //finally
    try
      Result := ClientServerAuth(AConn);
    except
    end;

    if Result <> 0 then Exit;

    try
      AConn.Host := AHost;
      AConn.DBID := ADBID;

      if not AConn.DBConnected then AConn.DBConnected := True;

    except
      on e: Exception do begin
        Result := 1;
        ssMessageDlg(rs('common', 'connerr') + lastServerError, ssmtError, [ssmbOk]);
        Exit;
      end;
    end;

    if AConn.ErrCode <> 0 then begin
      Result := 4;
      Exit;
    end;

    try
      if ALoginType <> ltServer then begin
        // switching off single-user if needed
        if ASmode and (0 <> AConn.AppServer.Command(cmdSetSingleUserMode, '', dummy)) then begin
          Result := 7;
          Exit;
        end;
        UserID := AConn.Login(AUser, APass, ADBID, Integer(ASMode));
        UserName := AUser;
        UserPass := APass;

        case UserID of
          -1: Result := 9; // unspecified
          -2: Result := 5; // single-user mode disallowed
          -3: Result := 6; // server in single-user already
          -4: Result := 7; // cannot log single-user beacuse of users connected
          -5: Result := 2; // bad user or password
          -6: Result := 8; // DB connect error
        end;
      end;

    except
      on e: Exception do begin
        Result := 8;
        ssMessageDlg(rs('common', 'connerr', 1) + e.Message + lastServerError, ssmtError, [ssmbOk]);
        Exit;
      end;
    end;

    if UserID < 0 then Exit;

    try
      with newDataSet(AConn) do
        try
          ProviderName := 'pUsers_GetByID';
          FetchParams;
          Params.ParamByName('userid').AsInteger := UserID;
          Open;
          UserFullName := FieldByName('fullname').AsString;
          Close;

        finally
          Free;
        end;

    except
      on e: Exception do begin
        Result := 8;
        debugInstantLog('! login() ERROR: ' + e.Message);
      end;
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function LoginCodeInterprete(Code: Integer): Integer;
  const
    langSec: String = 'frmLogin';
    
  var
    msg: String;
begin
  Result := Code; // doing it passthrough for additional case statements

  msg := '';

  case Code of
   1: begin
        // making more user-friendly error messages
        msg := lastServerError;

        if AnsiContainsText(msg, 'unavailable database')
          then msg := rs(langSec, 'Err_UnavailableDB')
          else msg := rs(langSec, 'Err_ConnError') + msg;
      end;

   2: msg := rs(langSec, 'Err_InvalidUser');  // bad user or password

   3: msg := rs(langSec, 'Err_UserAlreadyLogged');

   4: msg := rs(langSec, 'Err_ConnError'); // general connection error

   5: msg := rs(langSec, 'Err_SModeForAdminOnly');  // single-user mode disallowed

   6: msg := rs(langSec, 'SModeDetected');  // server in single-user already

   7: msg := rs(langSec, 'Err_SModeUsersConnected'); // cannot log single-user beacuse of users connected

   8: msg := rs(langSec, 'Err_DBConnectError') + lastServerError; // DB connect error

   9: msg := rs(langSec, 'Err_Unspecified') + lastServerError;  // unspecified

   10: // server versions mismatch
       msg := Format(rs(langSec, 'Err_VerMismatch'), [minSrvVer, servMsg.Values['serverVer']]);

   // server's response codes minus 20 returned by ClientServerAuth/ClientRegInfo
   21: // client-server Registration info mismatch or invalid
       msg := rs(langSec, 'Err_ServerRegMismatch');

   // server registration check responses
   22: // client versions mismatch
       msg := rs(langSec, 'Err_VerMismatch');

   23: // activation timeout
       msg := rs(langSec, 'Err_ActTimeout');

   24: // wrong hardwareid
       msg := rs(langSec, 'Err_wrHID');

   25: // activation denied
       msg := rs(langSec, 'Err_ActDenied');
  end; // case

  if msg <> '' then ssMessageDlg(msg, ssmtError, [ssmbOk]);
end;

//==============================================================================================
function SetHostPort(AConn: TssSocketConnection; const AHost: String): Boolean;
  var
    FHost, FPort: String;
    port: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'SetHostPort') else _udebug := nil;{$ENDIF}

  Result := False;

  Fhost := trim(AHost);
  //AConn.Close;

  if AnsiPos(':', FHost) > 0 then Begin // Host:Port
    FPort := AnsiMidStr(FHost, AnsiPos(':', FHost) + 1, 999);
    Fhost := AnsiMidStr(FHost, 1, AnsiPos(':', FHost) - 1);

    try
      Port := strToInt(FPort);
      if (Port < 0) or (Port > 65535) then Exception.Create('Out of range (0-65535)');
      AConn.Host := FHost;
      if AConn.Port <> Port then AConn.Port := Port;
      Result := True;

    except
      on e:Exception do begin
        AConn.Host := 'localhost';
        AConn.Port := 211;
        ssMessageDlg(rs('frmLogin', 'Err_InvalidPort', 1) + FPort + '; (' + e.Message + ')', ssmtError, [ssmbOk]);
      end;
    end;
  end // if AnsiPos(':', FHost) > 0
  else begin
    AConn.Host := FHost;
    AConn.Port := 211;
    Result := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetLang: string;
  var
    Reg: TRegistry;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  function ValidLang(ALang: string): boolean;
    var i: integer;
  begin
    Result := False;
    for i := 1 to High(langNames) do if ALang = langNames[i] then Result := True; Exit;
  end;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetLang') else _udebug := nil;{$ENDIF}

  Result := LangNames[DefLangID];
  Reg := TRegistry.Create;

  try
    if Reg.OpenKey(PrRegKey, True) then begin
      Result := Reg.ReadString('Lang');

      if not ValidLang(Result) then begin
        Reg.WriteString('Lang', LangNames[DefLangID]);
        Result := LangNames[DefLangID];
      end;

      Reg.CloseKey;
    end
    else Reg.CreateKey(PrRegKey);

  finally
    Reg.Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure InitConfig(ALngMan: TxLngManager; AConn: TssSocketConnection; ASC: TcxEditStyleController);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFNDEF DEBUG}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  {$ENDIF}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'InitConfig') else _udebug := nil;{$ENDIF}

  InitProfile(AConn, UserID, ProfID, TreeID, ASC);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetUserAccess(const AFunID: integer; AAccess: TUserAccess): boolean;
  var
    FFName: string;
    //_udebug: Tdebug;
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetUserAccess') else _udebug := nil;{$ENDIF}

  Result := False;
  if cdsFunc.Locate('funid', AFunID, []) then begin
    case AAccess of
       uaView    : FFName := 'canview';
       uaInsert  : FFName := 'caninsert';
       uaModify  : FFName := 'canmodify';
       uaDelete  : FFName := 'candelete';
       uaPost    : FFName := 'canpost';
    end;

    Result := (cdsFunc.FieldByName(FFName).AsInteger = 1);
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetUserAccessByClass(const AClassName: string; AAccess: TUserAccess): boolean;
  var
    FFName: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetUserAccessByClass') else _udebug := nil;{$ENDIF}

  Result := False;
  if cdsFunc.Locate('classname', AClassName, []) or cdsFunc.Locate('classname', 'T' + AClassName, []) then begin
    case AAccess of
      uaView    : FFName := 'canview';
      uaInsert  : FFName := 'caninsert';
      uaModify  : FFName := 'canmodify';
      uaDelete  : FFName := 'candelete';
      uaPost    : FFName := 'canpost';
    end;

    Result := (cdsFunc.FieldByName(FFName).AsInteger = 1);
  end
  else debugInstantLog('! ERROR: No such classname in "functions" table: ' + AClassName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetCurrencyRate(AConn: TssSocketConnection; CurrID: Integer; OnDate: TDateTime; var AOnDate: TDateTime; var ARateID: integer): Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetCurrencyRate') else _udebug := nil;{$ENDIF}

  try
    with newDataSet(AConn) do
    try
      ProviderName := 'pCurrency_RateEx';
      FetchParams;
      Params.ParamByName('currid').AsInteger := CurrID;
      Params.ParamByName('ondate').AsDate := OnDate;
      Open;
      if not IsEmpty then begin
        Result := FieldByName('onvalue').AsFloat;
        AOnDate := FieldByName('ondate').AsDateTime;
        ARateID := FieldByName('rateid').AsInteger;
      end
      else Result := -1;

    finally
      Free;
    end;

  Except
    Result := -1;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
//==============================================================================================
//==============================================================================================
function PropisRus(Value: int64; CyrrRend: Integer; AR: Boolean = False): string;
var
   Rend: Integer;
   ValueTemp: int64;

  //--------------------------------------------------------------------
  procedure Num(Value: byte);
  begin
    if not AR then begin
      case Value of
        1: if Rend = 0 then Result := Result + 'один ' else
           if Rend = 1 then Result := Result + 'одна ' else Result := Result + 'одно ';
        2: if Rend in [0, 2] then Result := Result + 'два ' else Result := Result + 'две ';
        3: Result := Result + 'три ';
        4: Result := Result + 'четыре ';
        5: Result := Result + 'пять ';
        6: Result := Result + 'шесть ';
        7: Result := Result + 'семь ';
        8: Result := Result + 'восемь ';
        9: Result := Result + 'девять ';
        10: Result := Result + 'десять ';
        11: Result := Result + 'одиннадцать ';
        12: Result := Result + 'двенадцать ';
        13: Result := Result + 'тринадцать ';
        14: Result := Result + 'четырнадцать ';
        15: Result := Result + 'пятнадцать ';
        16: Result := Result + 'шестнадцать ';
        17: Result := Result + 'семнадцать ';
        18: Result := Result + 'восемнадцать ';
        19: Result := Result + 'девятнадцать ';
      end
    end
    else begin
      case Value of
        1: if Rend = 0 then Result := Result + 'одном ' else
           if Rend = 1 then Result := Result + 'одной ' else Result := Result + 'одном ';
        2: if Rend in [0, 2] then Result := Result + 'двух ' else Result := Result + 'двух ';
        3: Result := Result + 'трёх ';
        4: Result := Result + 'четырёх ';
        5: Result := Result + 'пяти ';
        6: Result := Result + 'шести ';
        7: Result := Result + 'семи ';
        8: Result := Result + 'восьми ';
        9: Result := Result + 'девяти ';
        10: Result := Result + 'десяти ';
        11: Result := Result + 'одиннадцати ';
        12: Result := Result + 'двенадцати ';
        13: Result := Result + 'тринадцати ';
        14: Result := Result + 'четырнадцати ';
        15: Result := Result + 'пятнадцати ';
        16: Result := Result + 'шестнадцати ';
        17: Result := Result + 'семнадцати ';
        18: Result := Result + 'восемнадцати ';
        19: Result := Result + 'девятнадцати ';
      end
    end;
  end;

  //--------------------------------------------------------------------
  procedure Num10(Value: byte);
  begin
    if not AR then begin
      case Value of
        2: Result := Result + 'двадцать ';
        3: Result := Result + 'тридцать ';
        4: Result := Result + 'сорок ';
        5: Result := Result + 'пятьдесят ';
        6: Result := Result + 'шестьдесят ';
        7: Result := Result + 'семьдесят ';
        8: Result := Result + 'восемьдесят ';
        9: Result := Result + 'девяносто ';
      end;
    end
    else begin
      case Value of
        2: Result := Result + 'двадцати ';
        3: Result := Result + 'тридцати ';
        4: Result := Result + 'сорока ';
        5: Result := Result + 'пятидесяти ';
        6: Result := Result + 'шестидесяти ';
        7: Result := Result + 'семидесяти ';
        8: Result := Result + 'восьмидесяти ';
        9: Result := Result + 'девяноста ';
      end;
    end;
  end;

  //--------------------------------------------------------------------
  procedure Num100(Value: byte);
  begin
    if not AR then begin
      case Value of
        1: Result := Result + 'сто ';
        2: Result := Result + 'двести ';
        3: Result := Result + 'триста ';
        4: Result := Result + 'четыреста ';
        5: Result := Result + 'пятьсот ';
        6: Result := Result + 'шестьсот ';
        7: Result := Result + 'семьсот ';
        8: Result := Result + 'восемьсот ';
        9: Result := Result + 'девятьсот ';
      end
    end
    else begin
      case Value of
        1: Result := Result + 'ста ';
        2: Result := Result + 'двухсот ';
        3: Result := Result + 'трёхсот ';
        4: Result := Result + 'четырёхсот ';
        5: Result := Result + 'пятисот ';
        6: Result := Result + 'шестисот ';
        7: Result := Result + 'семисот ';
        8: Result := Result + 'восьмисот ';
        9: Result := Result + 'девятисот ';
      end
    end;
  end;

  //--------------------------------------------------------------------
  procedure Num00;
  begin
    Num100(ValueTemp div 100);
    ValueTemp := ValueTemp mod 100;
    if ValueTemp < 20
      then Num(ValueTemp)
      else begin
        Num10(ValueTemp div 10);
        ValueTemp := ValueTemp mod 10;
        Num(ValueTemp);
      end;
  end;

  //--------------------------------------------------------------------
  procedure NumMult(Mult: int64; s1,s2,s3: string);
    var ValueRes: int64;
  begin
    if Value >= Mult then begin
      ValueTemp := Value div Mult;
      ValueRes := ValueTemp;
      Num00;
      if ValueTemp = 1
        then Result := Result + s1
        else if (ValueTemp > 1) and (ValueTemp < 5)
             then Result := Result + s2
             else Result := Result + s3;

      Value := Value - Mult * ValueRes;
   end;
  end;

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
Begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'PropisRus') else _udebug := nil;{$ENDIF}

  // main func
  if InWordsRepLang = 'ESP' then begin
    Result := NumInWords(Value, genderMale) + ' ';
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

   if (Value = 0)
     then Result := 'ноль '
     else begin
       Result := '';
       Rend := 0;
       if not AR then begin
         NumMult(1000000000000,'триллион ','триллиона ','триллионов ');
         NumMult(1000000000,'миллиард ','миллиарда ','миллиардов ');
         NumMult(1000000,'миллион ','миллиона ','миллионов ');
         Rend := 1;
         NumMult(1000, 'тысяча ','тысячи ','тысяч ');
       end
       else begin
         NumMult(1000000000000,'триллионах ','триллионах ','триллионах ');
         NumMult(1000000000,'миллиардах ','миллиардах ','миллиардах ');
         NumMult(1000000,'миллионах ','миллионах ','миллионовх ');
         Rend := 1;
         NumMult(1000, 'тысячах ','тысячах ','тысячах ');
       end;
       Rend := CyrrRend;
       ValueTemp := Value;
       Num00;
     end;
   Result := AnsiUpperCase(Result[1]) + Copy(Result, 2, Length(Result) - 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
function PropisUKR(Value: int64; CyrrRend:boolean): string;
var
   Rend: boolean;
   ValueTemp: int64;
//--------------------------------------------------------------------
procedure Num(Value: byte);
begin
  case Value of
    1: if Rend = true then Result := Result + 'один ' else Result := Result + 'одна ';
    2: if Rend = true then Result := Result + 'два ' else Result := Result + 'дві ';
    3: Result := Result + 'три ';
    4: Result := Result + 'чотири ';
    5: Result := Result + 'п'+char(39)+'ять ';
    6: Result := Result + 'шість ';
    7: Result := Result + 'сім ';
    8: Result := Result + 'вісім ';
    9: Result := Result + 'дев'+char(39)+'ять ';
    10: Result := Result + 'десять ';
    11: Result := Result + 'одинадцять ';
    12: Result := Result + 'дванадцять ';
    13: Result := Result + 'тринадцять ';
    14: Result := Result + 'чотирнадцять ';
    15: Result := Result + 'п'+char(39)+'ятнадцять ';
    16: Result := Result + 'шістнадцять ';
    17: Result := Result + 'сімнадцять ';
    18: Result := Result + 'вісімнадцять ';
    19: Result := Result + 'дев'+char(39)+'ятнадцять ';
  end
end;

//--------------------------------------------------------------------
procedure Num10(Value: byte);
begin
  case Value of
    2: Result := Result + 'двадцять ';
    3: Result := Result + 'тридцять ';
    4: Result := Result + 'сорок ';
    5: Result := Result + 'п'+char(39)+'ятдесят ';
    6: Result := Result + 'шістдесят ';
    7: Result := Result + 'сімдесят ';
    8: Result := Result + 'вісімдесят ';
    9: Result := Result + 'дев'+char(39)+'яносто ';
  end;
end;

//--------------------------------------------------------------------
procedure Num100(Value: byte);
begin
  case Value of
    1: Result := Result + 'сто ';
    2: Result := Result + 'двісті ';
    3: Result := Result + 'триста ';
    4: Result := Result + 'чотириста ';
    5: Result := Result + 'п'+char(39)+'ятсот ';
    6: Result := Result + 'шістсот ';
    7: Result := Result + 'сімсот ';
    8: Result := Result + 'вісімсот ';
    9: Result := Result + 'дев'+char(39)+'ятсот ';
  end
end;

//--------------------------------------------------------------------
procedure Num00;
begin
  Num100(ValueTemp div 100);
  ValueTemp := ValueTemp mod 100;
  if ValueTemp < 20
    then Num(ValueTemp)
    else begin
      Num10(ValueTemp div 10);
      ValueTemp := ValueTemp mod 10;
      Num(ValueTemp);
    end;
end;

//--------------------------------------------------------------------
procedure NumMult(Mult: int64; s1,s2,s3: string);
  var ValueRes: int64;
begin
   if Value >= Mult then begin
     ValueTemp := Value div Mult;
     ValueRes := ValueTemp;
     Num00;
     if ValueTemp = 1
       then Result := Result + s1
       else if (ValueTemp > 1) and (ValueTemp < 5)
            then Result := Result + s2
            else Result := Result + s3;

     Value := Value - Mult * ValueRes;
   end;
end;

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
 // main func
Begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'PropisUKR') else _udebug := nil;{$ENDIF}

   if (Value = 0)
     then Result := 'нуль '
     else begin
       Result := '';
       Rend := true;
       NumMult(1000000000000,'трильйон ','трильйона ','трильйонів ');
       NumMult(1000000000,'мільярд ','мільярда ','мільярдів ');
       NumMult(1000000,'мільйон ','мільйона ','мільйонів ');
       Rend := false;
       NumMult(1000,'тисяча ','тисячі ','тисяч ');
       Rend := CyrrRend;
       ValueTemp := Value;
       Num00;
     end;
   Result := AnsiUpperCase(Result[1]) + Copy(Result, 2, Length(Result) - 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function WHName(AConn: TssSocketConnection; wid:integer):string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'WHName') else _udebug := nil;{$ENDIF}

  with newDataSet(AConn) do
  try
    ProviderName := 'pWHouse_Get';
    FetchParams;
    Params.ParamByName('wid').AsInteger := wid;
    Open;
    if not IsEmpty
      then Result := FieldByName('name').AsString
      else Result := '';
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetMatRestsByKAorWID(AConn: TssSocketConnection; AMatID, AKAID, AWID: integer; AOnDate: TDateTime;
               PMemData: Integer; AChType: TChargeType = ctFIFO): Extended;
  var
    cdsRest, cdsRsv_Temp: TssClientDataSet;
    rsv: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFNDEF DEBUG}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  {$ENDIF}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetMatRestsByKAorWID') else _udebug := nil;{$ENDIF}

  Result := 0;
  rsv := 0;

  if AMatID = 0 then
    with TssMemoryData(pointer(PMemData)) do begin
      Close;
      Open;
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
   end;

  cdsRsv_Temp := newDataSet(AConn);
  cdsRest := newDataSet(AConn);
  try
    with cdsRsv_Temp do begin
      ProviderName := 'pSysRsv_List';
      Open;
    end;// with cdsRsv_Temp

    try
      with cdsRest do begin
        if AKAID > 0
          then ProviderName := 'pWMat_GetRestByKA'
          else if AWID = -1
               then ProviderName := 'pWMat_GetRestForClientOrder'
               else ProviderName := 'pWMat_GetRestByWH';

        FetchParams;
        Params.ParamByName('matid').AsInteger := AMatID;
        FetchMacros;

        case ChargeType of
          ctFIFO: Macros.ParamByName('d').AsString := '';
          ctLIFO: Macros.ParamByName('d').AsString := 'desc';
        end;

        if AKAID > 0 then  Params.ParamByName('kaid').AsInteger := AKAID;

        Params.ParamByName('wid').AsInteger := AWID;
        Params.ParamByName('ondate').AsDateTime := AOnDate;
        Open;
      end;//with cdsRest

      with TssMemoryData(pointer(PMemData)) do begin
        Close;
        Open;
        cdsRest.First;
        while not cdsRest.Eof do begin
          Append;
          FieldByName('docnum').AsString := cdsRest.fieldbyname('docnum').AsString;
          FieldByName('docdate').AsDateTime := cdsRest.fieldbyname('docdate').AsDateTime;
          FieldByName('matid').AsInteger := cdsRest.fieldbyname('matid').AsInteger;
          FieldByName('wid').AsInteger := cdsRest.fieldbyname('wid').AsInteger;
          FieldByName('whname').AsString := cdsRest.fieldbyname('whname').AsString;
          FieldByName('posid').AsInteger := cdsRest.fieldbyname('posid').AsInteger;
          FieldByName('amount').AsFloat := RoundToA(cdsRest.fieldbyname('amount').AsFloat, MatDisplayDigits);
          rsv := RoundToA(cdsRest.FieldByName('rsv').AsFloat, MatDisplayDigits);

          {$IFNDEF DEBUG}
          if not ProtCheck then rsv := rsv - random(5);
          {$ENDIF}

          if not cdsRsv_Temp.IsEmpty then begin
            cdsRsv_Temp.First;
            while not cdsRsv_Temp.Eof do begin
              if ((cdsRsv_Temp.FieldByName('visible').AsInteger = 1)
                  or ((cdsRsv_Temp.FieldByName('visible').AsInteger = 0)
                      and (cdsRsv_Temp.fieldbyname('addr').AsInteger = ServerAddr)))
                 and (cdsRsv_Temp.FieldByName('posid').AsInteger = cdsRest.fieldbyname('posid').AsInteger)
              then begin
                FieldByName('amount').AsFloat := RoundToA(FieldByName('amount').AsFloat-cdsRsv_Temp.fieldbyname('amount').AsFloat, MatDisplayDigits);
                rsv := rsv + RoundToA(cdsRsv_Temp.fieldbyname('amount').AsFloat, MatDisplayDigits);
              end;

              cdsRsv_Temp.Next;
            end;//while not cdsRsv_Temp.Eof
          end;//if not cdsRsv_Temp.IsEmpty

          FieldByName('price').AsFloat := cdsRest.fieldbyname('price').AsFloat;
          FieldByName('gtd').AsString := cdsRest.FieldByName('gtd').AsString;
          FieldByName('certnum').AsString := cdsRest.fieldbyname('certnum').AsString;

          if not cdsRest.FieldByName('certdate').IsNull
            then FieldByName('certdate').AsDateTime := cdsRest.fieldbyname('certdate').AsDateTime;

          FieldByName('producer').AsString := cdsRest.fieldbyname('producer').AsString;
          FieldByName('onvalue').AsFloat := cdsRest.fieldbyname('onvalue').AsFloat;
          FieldByName('NDS').AsFloat := cdsRest.fieldbyname('NDS').AsFloat;
          FieldByName('Discount').AsFloat := cdsRest.fieldbyname('Discount').AsFloat;
          FieldByName('ondate').AsDateTime := cdsRest.fieldbyname('ondate').AsDateTime;
          FieldByName('currid').AsInteger := cdsRest.fieldbyname('currid').AsInteger;
          FieldByName('postype').AsInteger := cdsRest.fieldbyname('postype').AsInteger;

          if FindField('currname')<>nil then FieldByName('currname').AsString := cdsRest.fieldbyname('currname').AsString;
          if FindField('wtype')<>nil then FieldByName('wtype').AsInteger := cdsRest.fieldbyname('wtype').AsInteger;
          if FindField('wbillid')<>nil then FieldByName('wbillid').AsInteger := cdsRest.fieldbyname('wbillid').AsInteger;
          if FindField('sn')<>nil then FieldByName('sn').AsString := cdsRest.fieldbyname('sn').AsString;
          if FindField('rsv')<>nil then FieldByName('rsv').AsFloat := rsv;

          if FieldByName('amount').AsFloat > 0.00000001
            then Post
            else Cancel;

          cdsRest.Next;
        end;//while not cdsRest.Eof

        if not IsEmpty then begin
          case AChType of
            ctFIFO: SortOnFields('postype;ondate');
            ctLIFO: SortOnFields('postype;ondate',true,true);
          end;//case
          First;
        end;
      end;//with TssMemoryData(pointer(PMemData))

    finally
      cdsRest.Free;
    end;

  finally
    cdsRsv_Temp.Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure RemoveRSV(PosId, iDet, iTmpIds, iWMatTurn, iWMatTurnOld, AFree:integer);
  var
    mdDet, mdTmpIds, mdWMT, mdWMTold :TdxMemData;
    BM:TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFNDEF DEBUG}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  {$ENDIF}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'RemoveRSV') else _udebug := nil;{$ENDIF}

  mdDet := TdxMemData(pointer(iDet));
  mdTmpIds := TdxMemData(pointer(iTmpIds));
  mdWMT := TdxMemData(pointer(iWMatTurn));
  mdWMTold := TdxMemData(pointer(iWMatTurnOld));

  while mdWMT.Locate('sourceid',PosId,[] ) do  mdWMT.Delete;

  //Очистка цены
  BM := mdDet.GetBookmark;
  mdDet.DisableControls;
  try
    if mdDet.Locate('posid',PosId,[]) then begin
      mdDet.Edit;
      mdDet.FieldByName('price').Clear;
      mdDet.FieldByName('discount').Clear;
      mdDet.FieldByName('nds').Clear;
      mdDet.FieldByName('ondate').Clear;
      mdDet.FieldByName('currid').Clear;
      mdDet.FieldByName('ptypeid').Clear;
      mdDet.FieldByName('currname').Clear;
      mdDet.FieldByName('onvalue').Clear;
      mdDet.FieldByName('sn').Clear;
      mdDet.Post;
    end;

  finally
    mdDet.GotoBookmark(BM);
    mdDet.FreeBookmark(BM);
    mdDet.EnableControls;
  end;

  //Удаление из mdTmpIds и освобождение резерва для текущего sourceid
  with mdTmpIds do begin
    First;
    while not Eof do begin
      if (FieldByName('sourceid').AsInteger=PosId) then begin
        dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
        Delete;
      end
      else Next;
    end;//while not eof
  end;//with mdTmpIds

  //Освобождение редактируемых позиций (старых)
  mdWMTOld.First;
  while not mdWMTOld.Eof do begin
    if mdWMTOld.FieldByName('sourceid').AsInteger = PosId then begin
      with newDataSet do
      try
        ProviderName := 'pWayBill_GetMatID_WID';
        FetchParams;
        Params.ParamByName('posId').AsInteger := mdWMTOld.FieldByName('posid').AsInteger;
        Open;
        if not IsEmpty then begin
          mdTmpIds.Append;
          mdTmpIds.FieldByName('sourceid').AsInteger := mdWMTOld.FieldByName('sourceid').AsInteger;
          mdTmpIds.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdWMTOld.fieldbyname('amount').AsString)*-1, MatDisplayDigits);
          mdTmpIds.FieldByName('posid').AsInteger := mdWMTOld.FieldByName('posid').AsInteger;
          mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdWMTOld.FieldByName('posid').AsInteger,Fields[0].AsInteger,Fields[1].AsInteger,0,RoundToA(strtofloat(mdWMTOld.fieldbyname('amount').AsString)*-1, MatDisplayDigits));
          mdTmpIds.FieldByName('free').AsInteger := AFree;
          mdTmpIds.FieldByName('forall').AsInteger := 0;
          mdTmpIds.Post;
        end;//if not IsEmpty
        Close;

      finally
        Free;
      end;
    end;

    mdWMTOld.Next;
  end;//while not mdWMatTurnOld.Eof

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure DoRecalcContract(AConn: TssSocketConnection; DOCID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'DoRecalcContract') else _udebug := nil;{$ENDIF}

  with newDataSet(AConn) do
  try
    ProviderName := 'pContr_Recalc';
    FetchParams;
    Params.ParamByName('docid').AsInteger := DOCID;
    Execute;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetDocRelContr(AConn: TssSocketConnection; DOCID: Integer):Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetDocRelContr') else _udebug := nil;{$ENDIF}

  Result := -1;
  with newDataSet(AConn) do
  try
    ProviderName := 'pContr_DocRel';
    FetchParams;
    Params.ParamByName('docid').AsInteger := DOCID;
    Open;
    if not IsEmpty
      then Result := FieldByName('docid').AsInteger
      else Result := -1;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetDefPriceType: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetDefPriceType') else _udebug := nil;{$ENDIF}

  Result := 0;
  with newDataSet do
  try
    ProviderName := 'pPriceTypes_GetDef';
    Open;
    Result := FieldByName('ptypeid').AsInteger;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetDefPriceIn(AMatID, APTypeID, ACurrID: Integer; AOnDate: TDateTime; ANDS: Extended): Extended;
  var
    FPrice: Extended;
    WithNDS: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetDefPriceIn') else _udebug := nil;{$ENDIF}

  FPrice := 0;
  Result := 0;

  if WBInAutoPrice then begin
    with newDataSet do
    try
      if WBInAutoPriceType <> 0 then begin
        ProviderName := 'pWayBill_GetDefPrice';
        FetchParams;
        Params.ParamByName('matid').AsInteger := AMatID;
        Params.ParamByName('ptypeid').AsInteger := WBInPriceType;
        Params.ParamByName('ondate').AsDateTime := AOnDate;
        Params.ParamByName('price').AsFloat := FPrice;
        Open;
        if not IsEmpty then begin
          FPrice := RoundToA(FieldByName('extra').AsFloat, -6);
          WithNDS := FieldByName('withnds').AsInteger = 1;
          if not WithNDS then FPrice := NDSIn(FPrice, ANDS);
          FPrice := FPrice / GetCurrencyRateEx(dmData.SConnection, ACurrID, AOnDate);
        end
        else FPrice := 0;
        Close;
      end
      else begin
        ProviderName := 'pWaybill_GetLastPrice';
        FetchParams;
        Params.ParamByName('matid').AsInteger := AMatID;
        Params.ParamByName('ondate').AsDateTime := AOnDate;
        Open;
        FPrice := FieldByName('price').AsFloat * CurrToCurr(dmData.SConnection, FieldByName('currid').AsInteger, ACurrID, AOnDate);
        Close;
      end;

    finally
      Free;
    end;
    Result := RoundToA(FPrice, PriceDisplayDigits);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
// requires open dataset with price categories
function CalcPercentPrice(var ds: TDataSet; ptype, pptype: Integer; srcPrice, priceFactor, discount: Extended): Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'CalcPercentPrice') else _udebug := nil;{$ENDIF}

  try
    ds.Open;
  except
    Result := -1;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  case ptype of
    priceType_Markup: Result := srcPrice / 100 * (100 + priceFactor);
    priceType_Fixed:  Result := srcPrice;
    priceType_PCExtra, priceType_PCDiscount:
         with ds do begin // % of price category
           if not Locate('ptypeid', pptype, [])
             then Result := -1
             else begin
               Result := CalcPercentPrice(ds, FieldByName('extratype').AsInteger, FieldByName('pptypeid').asInteger,
                          srcPrice, FieldByName('onvalue').AsFloat, discount);
               if ptype = priceType_PCExtra
                 then Result := Result / 100 * (100 + priceFactor)  // extra
                 else Result := Result / 100 * (100 - priceFactor); // discount
             end;
         end; // 2,3

    else Result := -1;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function CalcPriceFields(var grdDS, ptDS: TDataSet): Boolean;
  var
    prices: TStringDynArray; // parsed price list
    i, pp, ptype: Integer;
    s: String;
    pf: Extended; // price factor
    pfield, cfield: TField;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'CalcPriceFields') else _udebug := nil;{$ENDIF}

  Result := True;

  try // finally
    with grdDS do begin
      ExtractWords(FieldByName('prices').AsString, [';'], prices);
      
      if High(prices) < 2 then begin
        debugInstantLog('! CalcPriceFields: invalid priceType string: "' + FieldByName('prices').AsString +'"');
        Result := False;
        Exit
      end;

      for i := 0 to High(prices) do prices[i] := ReplaceStr(Trim(prices[i]), '.', DecimalSeparator);

      i := 0;
      while i <= High(prices) do begin
        if trim(prices[i]) = '' then break; // handle last empty field, because of delimiter at eol presense ('1;10;RUR;')

        try  // in case of stale dataset or somethig like it
          pfield := FieldByName('PT' + prices[i]);
          cfield := FieldByName('CurrPT' + prices[i]);

          if pfield.AsString = '' then begin // let's optimize it slightly
            pf := RoundToA(StrToFloat(prices[i + 1]), -5);

            ptype := 0; // memorizing price type for cell coloring
            if AnsiStartsStr('PPTYPE:', prices[i + 2]) // price type 2/3: percent of other price category
              then begin
                s := AnsiMidStr(prices[i + 2], 8, length(prices[i + 2])); // ptype/pptype
                pp := Pos('/', s);

                if pp <> -1 then begin // just in case
                  ptype := StrToInt(AnsiMidStr(s, 1, pp - 1));

                  if ShowPrices
                    then pfield.AsFloat := RoundToA(CalcPercentPrice(ptDS, ptype, StrToInt(AnsiMidStr(s, pp + 1, length(s))),
                             fieldbyName('avgprice').asFloat, StrToFloat(prices[i + 1]), 0), -2);
                end; // if pp <> -1

                cfield.AsString := '';

              end
              else if prices[i + 2] = '' // price type 0: percent of incoming price
                then begin
                  ptype := 0;
                  cfield.AsString := '';

                  if ShowPrices
                    then pfield.AsFloat := RoundToA(CalcPercentPrice(ptDS, ptype, 0, fieldbyName('avgprice').asFloat,
                           StrToFloat(prices[i + 1]), 0), -2);

                end
                else begin // price type 1: defined price
                  ptype := 1;
                  pfield.AsFloat := pf;
                  cfield.AsString := prices[i + 2];
                end;

            pField.asString := FormatFloat(',0.00', RoundToA(pField.asFloat, -5));

            if AnsiLowerCase(prices[i + 2]) <> AnsiLowerCase(BaseCurrName)
              then pField.asString := pfield.asString + ' ' + prices[i + 2];

            pfield.Tag := ptype; // remember type for cell coloring
          end; // if pfield.AsString = '' then begin

        except
          udebug1('! CalcPriceFields: Exception on price type ' + prices[i] + ' at "' + FieldByName('prices').AsString + '"');
          Result := False;
        end;

        i := i + 3;
      end; // while i
    end; // with grdDS

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

// localization helpers
//==============================================================================================
function amountPrefix(leadSpace: Boolean = True): String;
begin
  if leadSpace
    then Result := ' '
    else Result := '';

  Result := Result + rs('common', 'amountPrefix');
end;

//==============================================================================================
function rs(r:String; spmode: Integer = 0): String;
begin
  result := rs('', r, spmode);
end;

//==============================================================================================
function rs(s,r:String; spmode: Integer = 0): String;
begin
  if (spmode and 2) = 2
    then Result := ' '
    else Result := '';

  Result := Result + langman.getrs(s,r);
  if (spmode and 1) = 1 then Result := Result + ' ';
end;

//==============================================================================================
procedure setRepDir;
begin
  RepDir := ClientPath + 'Reports\' + RepLangName + '\';
end;

//==============================================================================================
procedure switchLang(LID: Integer; CID: Integer = -1);
  var s: string;
begin
  LangID := LID;
  if (LangID < 0) or (LangID > lidMax) then LangID := DefLangID;
  if (RepLangId < 0) or (RepLangId > lidMax) then ReplangID := LangID;
  LangName := langNames[LangID];
  RepLangName := langNames[RepLangID];

  if (CID <> -1) and (CountryRules.cid <> CID) then CountryRules.setCurrent(CID);

  try
    LangMan.Active := False;
    LangMan.Active := True;
    LangMan.ActiveLngDesc := LangName;

  except
    on e: Exception do debugInstantLog('cannot switch lang to: "' + LangName + '", with error: ' + e.Message);
  end;

  s := 'FR_' + LangName + '.DLL';

  try
    //frLocale := TfrLocale.Create;
    frLocale.LoadDll(s);
  except
    on e: Exception do debugInstantLog('cannot localize FR as: ' + s);
  end;

  SaveLangInfo;
end;

//==============================================================================================
function SaveLangInfo: boolean;
  var
    res: Boolean;
begin
  Result := True;
  Res := True;

  {
  with dmData.iniFile do begin
    WriteInt('Lang', 'CountryID', CountryRules.CID);
    WriteStr('Lang', 'LangName', LangName);
    WriteStr('Lang', 'RepLangName', RepLangName);
    UpdateFile;
  end;
  }

  // saving hklm first to see if problems arise
  try // except
    Res := WriteToRegInt(PrRegKey, 'CountryID', CountryRules.cid, HKEY_LOCAL_MACHINE) and Res;
    Res := WriteToRegInt(PrRegKey, 'AccRules', CountryRules.AR, HKEY_LOCAL_MACHINE) and Res;
    if (LangID > -1) and (LangID <= lidMax) then Res := WriteToRegStr(PrRegKey, 'Lang', LangName, HKEY_LOCAL_MACHINE) and Res;
    if (RepLangID > -1) and (RepLangID <= lidMax) then Res := WriteToRegStr(PrRegKey, 'RepLang', RepLangName, HKEY_LOCAL_MACHINE) and Res;
    if not Res then debugInstantLog('SaveLangInfo: cannot store HKLM section!');
    
  except
  end;

  Result := True;
  Result := WriteToRegInt(PrRegKey, 'CountryID', CountryRules.cid, HKEY_CURRENT_USER) and Result;
  Result := WriteToRegInt(PrRegKey, 'AccRules', CountryRules.AR, HKEY_CURRENT_USER) and Result;
  if (LangID > -1) and (LangID <= lidMax) then Result := WriteToRegStr(PrRegKey, 'Lang', LangName, HKEY_CURRENT_USER) and Result;
  if (RepLangID > -1) and (RepLangID <= lidMax) then Result := WriteToRegStr(PrRegKey, 'RepLang', RepLangName, HKEY_CURRENT_USER) and Result;

  if Result
    then SetRepDir
    else begin
      ssMessageDlg(rs('Common', 'Err_savelang'), ssmtError, [ssmbOK]);
      debugInstantLog('SaveLangInfo: cannot store HKCU section');
    end;
end;

//==============================================================================================
procedure LoadLangInfo;
  const
    problStr: array[0 .. 5] of String = (
     'RegProbl_cid',
     'RegProbl_AR',
     'RegProbl_iflang',
     'RegProbl_deflang',
     'RegProbl_replang',
     'RegProbl_repldef'
    );

  var
    problemBits: Cardinal; // a bit set
    problemPlace: Cardinal; // floating bit mask
    Problems: string;
    i: Integer;
begin
  problemBits := 0;

  problemPlace := 1; // country of ooperations. single value for all users
  if not ReadFromRegInt(PrRegKey, 'CountryID', i, HKEY_CURRENT_USER)
     or (i < 0) or (i > cidMax)
  then begin
    if ReadFromRegInt(PrRegKey, 'CountryID', i, HKEY_LOCAL_MACHINE)
      then WriteToRegInt(PrRegKey, 'CountryID', i, HKEY_CURRENT_USER)
      else i := -1; // to force change in InitialSetting form later

    problemBits := problemBits or problemPlace;
  end;

  if not CountryRules.setCurrent(i)
    then problemBits := problemBits or problemPlace;

  //--------------------------------------------------------------
  problemPlace := 2; // Accounting Rules. -1 = default (not an error)
  if not ReadFromRegInt(PrRegKey, 'AccRules', i, HKEY_CURRENT_USER)
     or (i < -1) or (i > accRul_Max)
  then begin
    if ReadFromRegInt(PrRegKey, 'AccRules', i, HKEY_LOCAL_MACHINE)
      then WriteToRegInt(PrRegKey, 'AccRules', i, HKEY_CURRENT_USER)
      else i := -1; // to force change in InitialSetting form later

    problemBits := problemBits or problemPlace;
  end;

  if (i = -1) and (CountryRules.defAR <> -1) // defAR = -1 when country is not set. (dummy country record) 
    then CountryRules.AR := CountryRules.defAR
    else CountryRules.AR := i;

  //--------------------------------------------------------------
  problemPlace := 4; // interface language. individual user's choice
  if not ReadFromRegStr(PrRegKey, 'Lang', LangName, HKEY_CURRENT_USER) or (-1 = LangIDbyName(LangName)) then begin
    problemBits := problemBits or problemPlace;

    problemPlace := 8;
    if not ReadFromRegStr(PrRegKey, 'Lang', LangName, HKEY_LOCAL_MACHINE) or (-1 = LangIDbyName(LangName)) then begin // getting install default
      problemBits := problemBits or problemPlace;

      if CountryRules.LangID <> -1 then LangName := LangNames[CountryRules.LangID]; // default language for this country
      WriteToRegStr(PrRegKey, 'Lang', LangName, HKEY_LOCAL_MACHINE);
    end;

    WriteToRegStr(PrRegKey, 'Lang', LangName, HKEY_CURRENT_USER);
  end;

  LangID := LangIDbyName(LangName);

  //--------------------------------------------------------------
  problemPlace := 16;
  // reports language. individual user's choice
  if not ReadFromRegStr(PrRegKey, 'RepLang', RepLangName) or (-1 = LangIDbyName(RepLangName)) then begin
    problemBits := problemBits or problemPlace;

    problemPlace := 32;
    if not ReadFromRegStr(PrRegKey, 'RepLang', RepLangName, HKEY_LOCAL_MACHINE) or (-1 = LangIDbyName(RepLangName)) then begin // getting install default
      problemBits := problemBits or problemPlace;
      RepLangName := LangName;
      WriteToRegStr(PrRegKey, 'RepLang', RepLangName, HKEY_LOCAL_MACHINE);
    end;

    WriteToRegStr(PrRegKey, 'RepLang', RepLangName, HKEY_CURRENT_USER);
  end;

  //---------------------------------------------------------------------------
  if ProblemBits <> 0 then begin
    Problems := '';
    problemPlace := 1;
    for i := 0 to High(problStr) do begin
      if (problemBits and problemPlace) <> 0 then Problems := Problems + rs('prFun', problStr[i]) + ', ';
      problemPlace := problemPlace * 2;
    end;

    Problems := AnsiMidStr(Problems, 1, length(Problems) - 2);
    debugInstantLog('# Fixed registry problems with ' + Problems);
    ssMessageDlg(rs('prFun', 'RegProbl_prefix') + crlf + Problems + crlf + rs('prFun', 'RegProbl_suffix'), ssmtWarning, [ssmbOK], '', False, False);

    // this may be a critical problem, so launching Initial Settings form to let user decide what is default
    with TfrmInitialSettings.Create(nil) do try
      CanCancel := False;
      ShowModal;

    finally
      Free;
    end;
  end // if ProblemBits <> 0
  else begin
    RepLangID := LangIDbyName(RepLangName);
    switchLang(LangID);
  end;
end; // LoadLangInfo

//==============================================================================================
function BoolToInt(const b: Boolean): Integer;
begin
  if b then Result := 1 else result := 0;
end;

//==============================================================================================
function lastServerError(emptyIfNoErrors: Boolean = True): String;
begin
  if dmData.SConnection.Connected
  then begin
    try
      Result := dmData.SConnection.AppServer.stat_lastError;

      if Result <> ''
        then Result := rs('Common', 'Server_LastError', 3) + Result
        else if not emptyIfNoErrors then Result := rs('Common', 'Server_NoErrors', 2);

    except
      Result := rs('Common', 'Server_LastErrorFailed', 2);
    end
  end
  else Result := rs('Common', 'Server_LastErrorNotConn', 2);
end;

//==============================================================================================
function newDataSet(Conn: TssSocketConnection = nil): TssClientDataSet;
begin
  Result := nil;

  try
    Result := TssClientDataSet.Create(nil);
    if Conn = nil
      then Result.RemoteServer := dmData.SConnection
      else Result.RemoteServer := Conn

  except
    if Result <> nil then begin
      Result.Free;
      Result := nil;
    end;
  end;
end;

//==============================================================================================
procedure CopyDataSet(Ato: TssMemoryData; Afrom: TDataSet);
  var i: Integer;
begin
  try
    Ato.Close;
    Ato.CopyStructure(Afrom);
    with Ato do for I := 0 to FieldCount - 1 do Fields[I].ReadOnly := False;
    Ato.LoadFromDataSet(Afrom, 0, lmAppend);

  except
    raise;
  end;
end;

//==============================================================================================
procedure setFontStyle(f: TFont; Grid: Boolean = False);
begin
  Exit;
  if Grid
    then f.Assign(Font_Grids)
    else f.Assign(Font_Main);
end;

//==============================================================================================
function OK_URL: string;
  var
    b: array [0..255] of char;
begin
  loadString(resDllHandle, 4, b, 255);
  Result := string(b);
end;

//==============================================================================================
function OK_Copyright: string;
  var
    b: array [0..255] of char;
begin
  loadString(resDllHandle, 3, b, 255);
  Result := 'Copyright © ' + b + ', 2003-' + IntToStr(CurrentYear);
end;

//==============================================================================================
function OK_AppName: string;
  var
    b: array [0..255] of char;
begin
  loadString(resDllHandle, 1, b, 255);
  Result := string(b);
end;

//==============================================================================================
function OK_AppNameMotto: string;
  var
    b: array [0..255] of char;
begin
  loadString(resDllHandle, 2, b, 255);
  Result := string(b);
end;

//==============================================================================================
function OK_Version: string;
begin
  Result := RS('Common', 'Version',1) + FullVersionNo + ' [' + compiledDateStr + ']';
  if BarcodesEnabled then Result := Result + '/' + rs('Common', 'VerBarCode');
  {$IFDEF DEBUG}Result := Result + ' ** DEBUG ** / ';{$ENDIF}
  {$IFDEF FREE}
    Result := Result + RS('Common', 'FreeVer', 2);
  {$ELSE}
    {$IFDEF LITE}
      Result := Result + RS('Common', 'LiteVer', 2);
    {$ELSE}
      Result := Result + RS('Common', 'ProVer', 2);
    {$ENDIF}
  {$ENDIF}

  {$IFDEF BETA}Result := Result + RS('Common', 'BetaVer', 2);{$ENDIF}
  Result := Result + ' {' + CountryRules.CountryName + '}. ';
end;

//==============================================================================================
// Transactions helpers.
// for now we compress multiple transactions into one
procedure TrStart(Conn: TssSocketConnection = nil);
begin
  if Conn = nil
    then dmData.SConnection.TrStart
    else Conn.TrStart;
end;

//==============================================================================================
procedure TrRollBack(Conn: TssSocketConnection = nil);
begin
  if Conn = nil
    then dmData.SConnection.TrRollBack
    else Conn.TrRollBack;
end;

//==============================================================================================
function TrCommit(const showMsg: Boolean = False; doExcept: Boolean = True; Conn: TssSocketConnection = nil): Boolean;
begin
  if Conn = nil then Conn := dmData.SConnection;

  if not Conn.inTransaction then begin
    debugInstantLog('! TrCommint W/O transaction');
    Result := False;
    Exit;
  end;

  try
    Result := Conn.TrCommit;
  except
    Result := False;
  end;

  if not Result then begin
    TrError := rs('Common', 'Server_LastError', 1) + Conn.lastTrError;

    if doExcept
      then raise Exception.Create(TrError)
      else if showMsg then ssMessageDlg(TrError, ssmtError, [ssmbOK], '', False, True);
  end;
end;

//==============================================================================================
function GetSysError(ACode: Integer = 0): String;
  var
    lpMsgBuf: pchar;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetSysErr') else _udebug := nil;{$ENDIF}

  if Acode = 0 then ACode := GetLastError;

  if Acode = 0 then begin
    Result := '';
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER or FORMAT_MESSAGE_FROM_SYSTEM, nil, Acode, 0, @lpMsgBuf, 0, nil);
  Result := lpMsgBuf;
  LocalFree( Cardinal(lpMsgBuf) );

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
// nice techical data for computer. used in error reporting interface
function CollectTechInfo(getLogs: Boolean = False): String;
  var
    ov: OleVariant;
    clt,srv,s: String;
begin
  s := '';
  clt := crlf + 'Client {' + crlf + '  Version: ' + OK_Version;
  srv := crlf + 'Server {' + addNonEmptyLine('  Version ', servMsg.Values['serverVer'], 2);

  try
    if dmData.SConnection.Connected and dmData.SConnection.AppServer.Command(cmdGetServerSysInfo, '', ov)
    then begin
      s := trim(ov);
      if s <> '' then s := PadLeft(s, 4) + crlf;
    end;

    srv := srv + crlf + s;

  except
    on e: Exception do srv := srv + crlf + '  ERROR: cmdGetServerSysInfo: ' + e.message;
  end;

  if s = '' then clt := crlf + '  SysInfo {' + crlf + PadLeft(RegSysInfo, 4) + crlf + '  } // client sysinfo';

  Result := crlf + 'Tech info: ' + crlf + clt + crlf + '} // client' + crlf + crlf + srv;

  if getLogs
  then try
    if dmData.SConnection.Connected
      then Result := Result + crlf + dmData.SConnection.AppServer.stat_GetLog
      else Result := Result + crlf + 'Server disconnected. no log available';

  except
    on e: Exception do Result := Result + crlf + 'Server log retrieval error: ' + e.Message + crlf;
  end; // if getlogs

  Result := Result + crlf + '} // server';
end;

//==============================================================================================
function getUsageStat: String;
  var
    s: string;
begin
  Result := 'Usage Stats:'
    + #13#10'Run count: ' + IntToStr(stat_runcount) + #13#10'Exceptions caught: ' + IntToStr(stat_Exceptions)
    + #13#10'This instance run time: ' + GetSpent(MilliSecondsBetWeen(now, ClientStartTime), False)
    + #13#10'This ver (' + FullVersionNo + ') total run time: ' + GetSpent((SecondsBetween(now, ClientStartTime) + stat_RunTimeCurVer) * 1000, False)
    + #13#10'Total run time: ' + GetSpent((SecondsBetween(now, ClientStartTime) + stat_TotalRunTime) * 1000, False)
    + #13#10;

  {$IFNDEF FREE}
    if RegInfo.Values['user'] = ''
    then s := #13#10'Reg data missing.'
    else s := #13#10'Reg:'#13#10'User: ' + RegInfo.Values['user']
      + addNonEmptyLine('ID: ', RegInfo.Values['id'], 2)
      + addNonEmptyLine('e-mail: ',  RegInfo.Values['email'], 2)
      + addNonEmptyLine('addr: ',  RegInfo.Values['addr'], 2)
      + crlf;
  {$ENDIF}
end;

//==============================================================================================
function SmartShowRep(const Rep: TfrReport; fname: string; const doShow: Boolean = True; showErrMsg: Boolean = True): Boolean;
  var
    s: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'prFun.ShowRep') else _udebug := nil;{$ENDIF}

  try
    s := RepDir + fname;
//todo: preload tree with info on individual country/client's/bus partn/own enterprise report dirs/suffixes and set report path accordingly   
    if not FileExists(s) then begin
      s := RepDir + fname;
    end;

    //rep.
    Result := rep.LoadFromFile(s);
    if not Result then begin
      if showErrMsg then ssMessageDlg(rs('RepNotFound',1) + '"' + fname + '"', ssmtError,[ssmbOK]);
      Exit;
    end;

    if doShow then rep.ShowReport;
    //rep.DesignReport;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
// arbitrary command processing interface.
// used for internal or server-to-client data push/refresh requests
// constants are from CommonConstants module.
procedure processCommand(ACmd: Integer; AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'processCommand') else _udebug := nil;{$ENDIF}

  case ACmd of
    {will refresh web category tree node
    AParam: VarArrayOf(webshopID, nodeID);
    but now we fuck the nodeID and always refreshing all tree. ;)
    }
    cltIcmdWebCatRefresh: frmMainForm.ExecRefresh('', AParam[0], Integer(rtWebShops)); // actually it then uses same named func in CCMain

    else raise Exception.Create('Unknown code for processCommand(): ' + IntToStr(Acmd));
  end; // case ACmd

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure ResetMatDisplayFormat;
  var
    i: Integer;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ResetMatDisplayFormat') else _udebug := nil;{$ENDIF}

  MatDisplayFormat := ',0.';
  for i := 1 to -MatDisplayDigits do MatDisplayFormat := MatDisplayFormat + '#';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function CheckSocketserver(AConn: TssSocketConnection): Boolean;
  var
    tc: TidTCPCLient;
    localhost: Boolean;
begin
  Result := False;

  localhost := (AConn.Host = '') or (AConn.Host = '127.0.0.1') or (AnsiLowerCase(AConn.Host) = 'localhost')
     or (AnsiLowerCase(AConn.Host) = AnsiLowerCase(Trim(RegSysInfo.Values['ComputerName'])));
     
  try //except
    fProgress.InfoText := 'Checking Socket Server';
    fProgress.DoTimer(10);
    tc := dmData.IdTCPClient1;
    tc.Host := AConn.Host;
    tc.Port := AConn.Port;
    tc.Connect(ifThen(localhost, 3000, 10000));
    Result := tc.Connected;
    tc.Disconnect;

  except
  end;
  fProgress.Hide;

  if Result then Exit;
  
  // trying to start local socket server
  if localhost then begin
    {$IFDEF FREE}ShellExecute(Application.Handle, nil, PChar(ServerPath + '\\scktsrvr.exe'), '-install -quiet', nil, SW_HIDE);{$ENDIF}

    if 32 >= ShellExecute(Application.Handle, nil, PChar(ServerPath + '\\scktsrvr.exe'), nil, nil, SW_HIDE)
    then ssMessageDlg(rs('frmLogin', 'Err_CantExecScktSrvr', 1) + GetSysError, ssmtError, [ssmbOk])
    else begin
      sleep(1000);
      try
        Aconn.Open;
        Result := AConn.Connected;

      except
        on e: Exception do ssMessageDlg(rs('frmLogin', 'Err_ConnError', 1) + e.Message, ssmtError, [ssmbOk]);
      end;
    end;
  end // OK-server probably is in localhost
  else ssMessageDlg(rs('frmLogin', 'Err_CheckRemoteServer'), ssmtError, [ssmbOk]);
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('prFun', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  if Assigned(cdsFunc) then cdsFunc.Free;
  if Assigned(ex) then ex.Free;
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}
end.
