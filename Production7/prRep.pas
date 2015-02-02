{$I ok_sklad.inc}
unit prRep;

interface

uses
  Classes, FR_Class, prConst, ssClientDataSet, ssSocketConnection, SysUtils,
  FR_DSet, FR_DBSet, DB, dxmdaset, Variants, okClasses, dialogs, xLngDefs;

type
  TxRepType = (rtWBOut, rtWBIn, rtWBMove, rtAccOut, rtTaxWB, rtKABallance,
    rtWBRest, rtWriteOff, rtWBOutInvoice, rtReturnOut, rtReturnIn, rtInv,
    rtWBTorg12, rtWBOutOrder, rtWBOutWork, rtWarrantyDoc, rtContr, rtDCTurnover,
    rtOrderOut, rtOrderIn);

  //---------------------------------------------------------
  TxRep = class;

  //---------------------------------------------------------
  TxWarrantyDoc = class(TComponent)
    private
      FParent: TxRep;
      ID: Integer;
      DocNum: string;
      DocDate: TDateTime;
      KAName: string;
      FKA: TokKAgent;
      procedure WarrantyDocGetValue(const ParName: String; var ParValue: Variant);

    public
      procedure Load(AID: Integer; IDs: string);
      constructor Create(AParent: TxRep); reintroduce;
      destructor Destroy; override;
  end;

  //---------------------------------------------------------
  TxInvDoc = class(TComponent)
    private
      FParent: TxRep;
      ID: Integer;
      DocNum: string;
      DocDate: TDateTime;
      Reason: string;
      WHouseName: string;

      ChairMan: string;
      Person1: string;
      Person2: string;
      Person3: string;

      procedure Load(AID: Integer);
      constructor Create(AParent: TxRep); reintroduce;
      destructor Destroy; override;
  end;

  //---------------------------------------------------------
  TxKABallance = class(TComponent)
      frDBDSMaster: TfrDBDataSet;
      fsrcDetail: TfrDBDataSet;
      fsrcSubDetail: TfrDBDataSet;
      fsrcMaster2: TfrDBDataSet;
      fsrcDetail2: TfrDBDataSet;
      cdsMaster: TssClientDataSet;
      cdsMaster2: TssClientDataSet;
      cdsSubDetail: TssClientDataSet;
      cdsDetail: TssClientDataSet;
      cdsDetail2: TssClientDataSet;
      procedure MasterAfterScroll(DataSet: TDataSet);
      procedure Master2AfterScroll(DataSet: TDataSet);
      procedure RepGetValue(const ParName: String; var ParValue: Variant);
      procedure RepBeginDoc;

    private
      FParent: TxRep;
      FReport: TfrReport;
      ID: Integer;
      KAName: string;
      FromDate, ToDate: TDateTime;

    public
      procedure Load(AID: Integer; AFromDate, AToDate: TDateTime);
      constructor Create(AOwner: TComponent; AParent: TxRep);  reintroduce; virtual;
      destructor Destroy; override;
  end;

  //---------------------------------------------------------
  TxDCTurnover = class(TComponent)
      frDBDSMaster: TfrDBDataSet;
      cdsMaster: TssClientDataSet;
      procedure MasterAfterScroll(DataSet: TDataSet);
      procedure RepGetValue(const ParName: String; var ParValue: Variant);
      procedure RepBeginDoc;

    private
      FParent: TxRep;
      FReport: TfrReport;
      ID: Integer;
      Holder, CardNum: string;
      FromDate, ToDate: TDateTime;
      FPosCount: Integer;
      FTotalSumm: Extended;

    public
      procedure Load(AID: Integer; AFromDate, AToDate: TDateTime);
      constructor Create(AOwner: TComponent; AParent: TxRep);  reintroduce; virtual;
      destructor Destroy; override;
  end;

  //---------------------------------------------------------
  TxWBDoc = class(TComponent)
    private
      FKA, FKAEx: TokKAgent;
      ShipKA, ShipEnt: TokKAgent;
      procedure RepBeginDoc;

    public
      FParent: TxRep;
      ID: Integer;
      DocNum: string;
      DocDate: TDateTime;
      KAAccount: string;
      KAID: Integer;
      KAMFO: string;
      KABank: string;
      KABankCorAcc: string;
      KAName: string;
      KAPhone: string;
      KAAddr: string;
      KARealAddr: string;
      KAINN: string;
      KAKPP: string;
      KAOKPO: string;
      Reason: string;
      Notes: string;
      SummText: string;
      SummTextCurr: string;
      DocNDS: Extended;
      PersonName: string;
      PersonJob: string;
      Received: string;
      Att: string;
      AttNum: string;
      AttDate: string;
      AttName: string;
      SummNDS: Extended;
      SummAll: Extended;
      SummCurr: Extended;
      SummAllTax: Extended;
      ToDate: TDateTime;
      EAccNum: string;
      EBank: string;
      EMFO: string;
      ECorAcc: string;
      AccID: Integer;
      PayDocNum: string;
      PayDocDate: TDateTime;

      procedure Load(AID: Integer; IDs: String = '');
      constructor Create(AParent: TxRep); reintroduce;
      destructor Destroy; override;
  end;

  //---------------------------------------------------------
  TxReturnIn = class
    public
      FParent: TxRep;
      ID: Integer;
      DocNum: string;
      DocDate: TDateTime;
      KAName: string;
      Reason: string;
      SummText: string;
      PersonName: string;
      SummNDS: Extended;
      SummAll: Extended;
      procedure Load(AID: Integer);
      constructor Create(AParent: TxRep);
      destructor Destroy; override;
  end;

  //---------------------------------------------------------
  TxReturnOut = class
    public
      FParent: TxRep;
      ID: Integer;
      DocNum: string;
      DocDate: TDateTime;
      KAName: string;
      Reason: string;
      SummText: string;
      PersonName: string;
      Att: string;
      Received: string;
      SummNDS: Extended;
      SummAll: Extended;
      procedure Load(AID: Integer);
      constructor Create(AParent: TxRep);
      destructor Destroy; override;
  end;

  //---------------------------------------------------------
  TxTaxDoc = class
    public
      FParent: TxRep;
      ID: Integer;
      DocNum: string;
      DocDate: TDateTime;
      Condition: string;
      Form: string;
      PersonName: string;
      KAName: string;
      KAPhone: string;
      KACertNo: string;
      KAINN: string;
      KAAddr: string;
      NDSPayer: Integer;
      NDS, AAddCharges, ADiscount, ASummWONDS, ASummNDS: Extended;

      procedure Load(AID: Integer);
      constructor Create(AParent: TxRep);
      destructor Destroy; override;
  end;

  //---------------------------------------------------------
  TxWBMoveDoc = class
    public
      FParent: TxRep;
      ID: Integer;
      DocNum: string;
      DocDate: TDateTime;
      WHouseIn: string;
      WHouseOut: string;
      PersonIn: string;
      PersonOut: string;
      Reason: string;
      SummText: string;

      procedure Load(AID: Integer);
      constructor Create(AParent: TxRep);
      destructor Destroy; override;
  end;

  //---------------------------------------------------------
  TxWriteOffDoc = class
    public
      FParent: TxRep;
      ID: Integer;
      DocNum: string;
      DocDate: TDateTime;
      WHouseOut: string;

      Chairman: string;
      Person1: string;
      Person2: string;
      Person3: string;
      Reason: string;
      SummText: string;

      procedure Load(AID: Integer);
      constructor Create(AParent: TxRep);
      destructor Destroy; override;
  end;

  //---------------------------------------------------------
  TxContr = class
    public
      FParent: TxRep;
      ID: Integer;
      DocNum: string;
      DocDate: TDateTime;
      KAName: string;
      Notes: string;
      CurrName: string;
      PersonName: string;
      ToDate : TDateTime;
      SummAll:Extended;
      SummAmount:Extended;
      ShippedAmount:Extended;
      ShippedSumm:Extended;
      PaidSumm:Extended;
      DocType:Integer;
      FPath:String;
      procedure Load(AID: Integer);
      constructor Create(AParent: TxRep);
      destructor Destroy; override;
  end;

  //---------------------------------------------------------
  TxRep = class(TComponent)
    FReport: TfrReport;
    FWBDoc: TxWBDoc;
    FWBMove: TxWBMoveDoc;
    FTaxDoc: TxTaxDoc;
    FWriteOff: TxWriteOffDoc;
    FReturnOut: TxReturnOut;

    FInv: TxInvDoc;
    FReturnIn: TxReturnIn;
    FContr: TxContr;

    FKABallance: TxKABallance;
    procedure WBDocBeginBand(Band: TfrBand);
    procedure WBDocGetValue(const ParName: String; var ParValue: Variant);
    procedure WBDocUserFunction(const Name: String; p1, p2, p3: Variant; var Val: Variant);
    procedure WBDocBeforePrint(Memo: TStringList; View: TfrView);

  private
    FType: TxRepType;
    procedure ShowWBOut(AID: Integer; IDs: string);
    procedure ShowWBOutOrder(AID: Integer);
    procedure ShowWBOutWork(AID: Integer);
    procedure ShowWBTorg12(AID: Integer);
    procedure ShowWBOutInvoice(AID: Integer; IDs: string);
    procedure ShowWBIn(AID: Integer);
    procedure ShowWBRest(AID: Integer);
    procedure ShowAccOut(AID: Integer; IDs: String = '');
    procedure ShowOrderOut(AID: Integer);
    procedure ShowOrderIn(AID: Integer);
    procedure ShowWBMove(AID: Integer; AParam:integer=0);
    procedure ShowTax(AID: Integer);
    procedure ShowWriteOff(AID: Integer);
    procedure ShowInv(AID: Integer);
    procedure ShowWarrantyDoc(AID: Integer; IDs: string = '');
    procedure ShowContr(AID:Integer; PType:Integer);
    //procedure ShowDCTurnover(AID: Integer; AFromDate, AToDate: TDateTime);

    procedure ShowReturnOut(AID: Integer);
    procedure ShowReturnIn(AID: Integer);

  public
    mdReport: TdxMemData;
    mdTaxes, mdInvTaxes: TdxMemData;
    FsrcTaxes, FsrcInvTaxes: TfrDBDataSet;
    FsrcMaster: TfrDBDataSet;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ShowRep(AType: TxRepType; AID: Integer; AFromDate: TDateTime = 0; AToDate: TDateTime = 0; AStr: string = '');
  end;

//---------------------------------------------------------
  procedure GetSecParValue(const ParName: String; var ParValue: Variant);

//---------------------------------------------------------
var
  xRep: TxRep;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  Forms, ClientData, prFun, ssFun, DateUtils, WBMovSetPT, Controls,
  DBClient, ssBaseConst, Torg12, ssStrUtil, ShellAPI, fMessageDlg,
  Windows, okMoneyFun, Udebug, xNumInWords;

{$IFDEF UDEBUG}
var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

{ TxRep }
//==============================================================================================
constructor TxRep.Create(AOwner: TComponent);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.Create') else _udebug := nil;{$ENDIF}
                       
  inherited;

  FReport := TfrReport.Create(Self);
  FsrcMaster := TfrDBDataSet.Create(nil);
  FsrcTaxes := TfrDBDataSet.Create(Self);
  FsrcTaxes.Name := 'FsrcTaxes';
  FsrcInvTaxes := TfrDBDataSet.Create(Self);
  FsrcInvTaxes.Name := 'FsrcInvTaxes';
  FReport.Dataset := FsrcMaster;
  mdReport := TdxMemData.Create(Self);
  mdReport.Name := 'mdReport';
  mdTaxes := TdxMemData.Create(Self);
  mdTaxes.Name := 'mdTaxes';
  mdInvTaxes := TdxMemData.Create(Self);
  mdInvTaxes.Name := 'mdInvTaxes';
  FWBDoc := TxWBDoc.Create(Self);
  FWBMove := TxWBMoveDoc.Create(Self);
  FTaxDoc := TxTaxDoc.Create(Self);
  FWriteOff := TxWriteOffDoc.Create(Self);
  FInv := TxInvDoc.Create(Self);
  FReturnIn := TxReturnIn.Create(Self);
  FReturnOut := TxReturnOut.Create(Self);
  FKABallance := TxKABallance.Create(Self, Self);
  FsrcTaxes.Dataset := mdTaxes;
  FsrcInvTaxes.Dataset := mdInvTaxes;
  FContr := TxContr.Create(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxRep.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.Destroy') else _udebug := nil;{$ENDIF}

  mdReport.Free;
  mdTaxes.Free;
  mdInvTaxes.Free;
  FsrcTaxes.Free;
  FsrcInvTaxes.Free;
  FsrcMaster.Free;
  FReport.Free;
  FWBDoc.Free;
  FWBMove.Free;
  FTaxDoc.Free;
  FInv.Free;
  FKABallance.Free;
  FContr.Free;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowRep(AType: TxRepType; AID: Integer; AFromDate: TDateTime = 0; AToDate: TDateTime = 0; AStr: string = '');
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowRep') else _udebug := nil;{$ENDIF}

  case AType of
    rtWBRest: ShowWBRest(AID);
    rtWBOut:  ShowWBOut(AID, AStr);
    rtWBOutInvoice: ShowWBOutInvoice(AID, AStr);
    rtWBTorg12: ShowWBTorg12(AID);
    rtWBOutWork: ShowWBOutWork(AID);
    rtWBOutOrder: ShowWBOutOrder(AID);
    rtWBIn: ShowWBIn(AID);
    rtWBMove: ShowWBMove(AID,trunc(AFromDate));
    rtAccOut: ShowAccOut(AID, AStr);
    rtTaxWB: ShowTax(AID);
    rtKABallance: FKABallance.Load(AID, AFromDate, AToDate);
    rtWriteOff: ShowWriteOff(AID);
    rtReturnIn: ShowReturnIn(AID);
    rtReturnOut: ShowReturnOut(AID);
    rtInv: ShowInv(AID);
    rtWarrantyDoc: ShowWarrantyDoc(AID, AStr);
    rtContr: ShowContr(AID,trunc(AFromDate));
    rtOrderOut: ShowOrderOut(AID);
    rtOrderIn: ShowOrderIn(AID);

    rtDCTurnover:
      with TxDCTurnover.Create(Self, Self) do
      try
        Load(AID, AFromDate, AToDate);

      finally
        Free;
      end;
  end; // case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowWBIn(AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowWBIn') else _udebug := nil;{$ENDIF}

  FType := rtWBIn;
  FWBDoc.Load(AID);
  FsrcMaster.DataSet := mdReport;

  if optWBInRepSortDesc
    then mdReport.SortOptions := [soDesc,soCaseInsensitive]
    else mdReport.SortOptions := [soCaseInsensitive];

  mdReport.SortedField := WBRepSortFieldNames[optWBInRepSortField];

  FReport.OnGetValue := WBDocGetValue;
  FReport.OnUserFunction := WBDocUserFunction;
  FReport.OnBeforePrint := WBDocBeforePrint;
  SmartShowRep(FReport, 'Waybill_IN.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowReturnIn(AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowReturnIn') else _udebug := nil;{$ENDIF}

  FType := rtReturnIn;
  FReturnIn.Load(AID);
  FsrcMaster.DataSet := mdReport;
  FReport.OnGetValue := WBDocGetValue;
  FReport.OnUserFunction := WBDocUserFunction;
  SmartShowRep(FReport, 'Return_IN.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowWBOut(AID: Integer; IDs: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowWBOut') else _udebug := nil;{$ENDIF}

  FType := rtWBOut;
  FWBDoc.Load(AID, IDs);
  FsrcMaster.DataSet := mdReport;

  if optWBOutRepSortDesc
    then mdReport.SortOptions := [soDesc,soCaseInsensitive]
    else mdReport.SortOptions := [soCaseInsensitive];

  mdReport.SortedField := WBRepSortFieldNames[optWBOutRepSortField];

  FReport.OnGetValue := WBDocGetValue;
  FReport.OnUserFunction := WBDocUserFunction;
  FReport.OnBeforePrint := WBDocBeforePrint;
  SmartShowRep(FReport, 'Waybill_Out.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowWBMove(AID: Integer; AParam: Integer=0);
  var
    fname: string;
    FWithNDS: Boolean;
    FPrice: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowWBMove') else _udebug := nil;{$ENDIF}

  FType := rtWBMove;
  FWBMove.Load(AID);
  FsrcMaster.DataSet := mdReport;
  FReport.OnGetValue := WBDocGetValue;
  FReport.OnUserFunction := WBDocUserFunction;
  FReport.OnBeforePrint := WBDocBeforePrint;

  case AParam of
     0: fname := 'Waybill_Mov.frf';
     1: fname := 'Waybill_Mov1.frf';
     3: fname := 'Waybill_Mov_Torg13.frf';
     2: begin
       with TfrmWBMovSetPT.Create(nil) do
       try
         //OnDate := Self.OnDate;
         Caption := rs('fmWaybill','WBMonPrintPT2');
         cdsPriceTypes.Open;

         if cdsPriceTypes.Locate('def',1,[])
           then lcbPriceTypes.KeyValue := cdsPriceTypes.FieldByName('ptypeid').AsInteger;

         if ShowModal = mrOk then begin
           Application.ProcessMessages;
           mdReport.First;

           while not mdReport.Eof do begin
             mdReport.Edit;
             FPrice := GetDefPriceOut(dmData.SConnection, mdReport.FieldByName('matid').AsInteger, lcbPriceTypes.KeyValue,
                     mdReport.FieldByName('price').AsFloat, mdReport.FieldByName('ondate').AsDateTime,
                     mdReport.FieldByName('onvalue').AsFloat, FWithNDS) * mdReport.FieldByName('onvalue').AsFloat;

             if not FWithNDS
               then FPrice := RoundToA(NDSIn(FPrice, mdReport.FieldByName('nds').AsFloat), -6);

             mdReport.FieldByName('price').AsFloat := FPrice;
             mdReport.FieldByName('onvalue').AsFloat := 1;
             mdReport.Post;
             mdReport.Next;
           end;

           fname := 'Waybill_Mov.frf';
         end;

       finally
         cdsPriceTypes.Close;
         Free;
       end;
     end;//2;
  end;//case

  SmartShowRep(FReport, fname);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.WBDocBeginBand(Band: TfrBand);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.WBDocBeginBand') else _udebug := nil;{$ENDIF}

  if (Band.Typ = btMasterData) and (Band.Name = 'MasterData2') then begin
    Band.IsVirtualDS := True;
    //Band.DataSet := FsrcMaster;
    Band.DataSet.RangeEndCount := 3;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TxRep.WBDocGetValue(const ParName: String; var ParValue: Variant);
  var
    FSumNDSPos, FSumWithoutNDSPos, FSummPos, FTmp, FAmount, FPrice: Extended;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.WBDocGetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'director') then ParValue := FWBDoc.FKA.Director
  else if 0 = AnsiCompareText(ParName, 'buh') then ParValue := FWBDoc.FKA.Buh
  else if 0 = AnsiCompareText(ParName, 'notes') then ParValue := FWBDoc.Notes
  else if 0 = AnsiCompareText(ParName, 'MatDisplayFormat') then ParValue := MatDisplayFormat
  else if 0 = AnsiCompareText(ParName, 'PriceDisplayFormatEx') then ParValue := PriceDisplayFormatEx
  else
    if 0 = AnsiCompareText(ParName, 'item') then begin
      case FType of
        rtWBOut, rtWBOutInvoice: i := OptWBOutShowModel;
        rtWBIn:          i := OptWBInShowModel;
        rtWBMove:        i := OptWBMoveShowModel;
        rtAccOut:        i := OptAccOutShowModel;
        rtWBRest:        i := OptWBRestShowModel;
        rtWriteOff:      i := OptWriteOffShowModel;
        rtReturnOut:     i := OptReturnOutShowModel;
        rtReturnIn:      i := OptreturnInShowModel;
        rtInv:           i := OptInvShowModel;
        rtOrderOut:      i := OptOrderOutShowModel;
        rtOrderIn:       i := OptOrderInShowModel;
        //rtWBTorg12:      i := OptWBTorg12ShowModel;
        //rtWBOutOrder:    i := OptWBOutOrderShowModel;
        //rtWBOutWork:     i := OptWBOutWorkShowModel;
        else i := 0; // just in case
      end; // case FType

      case i of
        1: ParValue := mdReport.FieldByName('artikul').AsString;
        2: ParValue := mdReport.FieldByName('matname').AsString + #13#10'(' + mdReport.FieldByName('artikul').AsString + ')';
        else ParValue := mdReport.FieldByName('matname').AsString;
      end; //case i
  end
  //-----------------------------------------------------------------------------------
  else if FType in [rtOrderIn, rtOrderOut, rtWBIn, rtWBOut, rtAccOut, rtWBOutInvoice, rtWBTorg12,
                    rtWBOutOrder, rtWBOutWork]
  then begin
    with FWBDoc do begin
      if 0 = AnsiCompareText(ParName, 'printtype') then ParValue := PrintType
      else if 0 = AnsiCompareText(ParName, 'poscountstr') then ParValue := numInWords(mdReport.RecordCount, genderFemale)
      else if 0 = AnsiCompareText(ParName, 'personjob') then ParValue := PersonJob
      else if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := DocNum
      else if 0 = AnsiCompareText(ParName, 'attnum') then ParValue := AttNum
      else if 0 = AnsiCompareText(ParName, 'attdate') then ParValue := AttDate
      else if 0 = AnsiCompareText(ParName, 'attname') then ParValue := AttName
      else if 0 = AnsiCompareText(ParName, 'barcode') then ParValue := genBarCodeFromStr('WBO' + DocNum)
      else if 0 = AnsiCompareText(ParName, 'paydocnum') then begin
        if PayDocNum <> ''
          then ParValue := PayDocNum
          else ParValue := '__________';
      end
      else if 0 = AnsiCompareText(ParName, 'paydocdate') then begin
        if PayDocDate <> 0
          then ParValue := DateToStr(PayDocDate)
          else ParValue := '__________';
      end
      else if 0 = AnsiCompareText(ParName, 'possumnds') then begin
        NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

        ParValue := RoundToA(FSumNDSPos + FSumWithoutNDSPos, -2);
      end
      else if 0 = AnsiCompareText(ParName, 'posnds') then begin
        NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

          ParValue := RoundToA(FSumNDSPos, -2);
      end
      else if 0 = AnsiCompareText(ParName, 'posprice') then begin
        if mdReport.FieldByName('amount').AsFloat = 1
          then begin
            NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                    mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

            FSummPos := RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
            ParValue := FSummPos - RoundToA(FSumNDSPos, -2);
          end
          else ParValue := mdReport.FieldByName('price').AsFloat * mdReport.FieldByName('onvalue').AsFloat;
      end
      else if 0 = AnsiCompareText(ParName, 'postaxsum') then ParValue := mdReport.FieldByName('taxsum').AsCurrency
      else if 0 = AnsiCompareText(ParName, 'postaxrate') then begin
        for i := 0 to mdReport.FieldCount - 1 do
          if (Pos('Tax', mdReport.Fields[i].FieldName) = 1) and (Pos('TaxRate', mdReport.Fields[i].FieldName) = 0)
             and (Pos('TaxSum', mdReport.Fields[i].FieldName) = 0)
          then ParValue := mdReport.Fields[i].AsFloat;
      end
      else if 0 = AnsiCompareText(ParName, 'possum') then begin
        if (PrintType = 0) or (FType in [rtWBOutInvoice, rtWBTorg12]) then begin
          NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                  mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

          FSummPos := RoundToA(FSumWithoutNDSPos+FSumNDSPos, -2);
          //FWONDS := RoundToA(FSumm - FNDS, -2);
          FSumWithoutNDSPos := FSummPos - RoundToA(FSumNDSPos, -2);
          ParValue := FSumWithoutNDSPos;
        end// if =0
        else begin
          NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                  mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

          ParValue := RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
        end;
      end
      else if 0 = AnsiCompareText(ParName, 'possumwithnds') then begin
        NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

        ParValue := RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
      end
      else if 0 = AnsiCompareText(ParName, 'possumwonds') then begin
        NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

        ParValue := RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
        FSumNDSPos := RoundToA(FSumNDSPos, -2);
        ParValue := ParValue - FSumNDSPOs;
      end
      else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := DocDate
      else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := FKA.NameEx
      else if 0 = AnsiCompareText(ParName, 'entshortname') then ParValue := FKA.Name_
      else if 0 = AnsiCompareText(ParName, 'entfullname') then ParValue := FKA.FullName
      else if 0 = AnsiCompareText(ParName, 'kafullname') then begin
        ParValue := FKAEx.NameEx;
        if (FKAEx.KType in [1, 2]) and (FKAEx.DocNum <> '')
          then ParValue := ParValue + rs('prRep','passport') + ' ' + FKAEx.DocNum + ' ' + FKAEx.DocSeries;
      end
      else if 0 = AnsiCompareText(ParName, 'reason') then ParValue := Reason
      else if 0 = AnsiCompareText(ParName, 'curnds') then ParValue := NDS
      else if 0 = AnsiCompareText(ParName, 'propis') then ParValue := SummText
      else if 0 = AnsiCompareText(ParName, 'propiscurr') then ParValue := SummTextCurr
      else if 0 = AnsiCompareText(ParName, 'personname') then ParValue := PersonName
      else if 0 = AnsiCompareText(ParName, 'received') then ParValue := Received
      else if 0 = AnsiCompareText(ParName, 'att') then ParValue := Att
      else if 0 = AnsiCompareText(ParName, 'sumnds') then ParValue := SummNDS
      else if 0 = AnsiCompareText(ParName, 'sumall') then ParValue := SummAll
      else if 0 = AnsiCompareText(ParName, 'entaddr') then begin
        if FType = rtWBOutInvoice
          then ParValue := FKA.GetAddr
          else begin
            FKA.Addr.Locate('addrtype', 0, []);
            ParValue := FKA.GetAddr;
          end;
      end
      else if 0 = AnsiCompareText(ParName, 'entphone') then ParValue := FKA.Phone
      else if 0 = AnsiCompareText(ParName, 'entfax') then ParValue := FKA.Fax
      else if 0 = AnsiCompareText(ParName, 'entaccount') then ParValue := EAccNum
      else if 0 = AnsiCompareText(ParName, 'entbank') then ParValue := EBank
      else if 0 = AnsiCompareText(ParName, 'entcoracc') then begin
        if FParent.FType = rtAccOut
          then ParValue := ECorAcc
          else ParValue := EntCorrAcc;
      end
      else if 0 = AnsiCompareText(ParName, 'entmfo') then ParValue := EMFO
      else if 0 = AnsiCompareText(ParName, 'entokpo') then ParValue := FKA.OKPO
      else if 0 = AnsiCompareText(ParName, 'entinn') then ParValue := FKA.INN
      else if 0 = AnsiCompareText(ParName, 'entcertno') then ParValue := FKA.CertNum
      else if 0 = AnsiCompareText(ParName, 'entkpp') then ParValue := FKA.KPP
      else if 0 = AnsiCompareText(ParName, 'kaphone') then ParValue := KAPhone
      else if 0 = AnsiCompareText(ParName, 'kaaccount') then ParValue := KAAccount
      else if 0 = AnsiCompareText(ParName, 'kamfo') then ParValue := KAMFO
      else if 0 = AnsiCompareText(ParName, 'kabank') then ParValue := KABank
      else if 0 = AnsiCompareText(ParName, 'kabankcoracc') then ParValue := KABankCorAcc
      else if 0 = AnsiCompareText(ParName, 'kaaddr') then begin
        if FType = rtWBOutInvoice
          then ParValue := FKAEx.GetAddr
          else ParValue := KAAddr;
      end 
      else if 0 = AnsiCompareText(ParName, 'karealaddr') then begin
        FWBDoc.FKAEx.Addr.Locate('addrtype', 1, []);
        ParValue := FWBDoc.FKAEx.GetAddr;
      end
      else if 0 = AnsiCompareText(ParName, 'kakpp') then ParValue := KAKPP
      else if 0 = AnsiCompareText(ParName, 'kaokpo') then ParValue := KAOKPO
      else if 0 = AnsiCompareText(ParName, 'kainn') then ParValue := KAINN
      else if 0 = AnsiCompareText(ParName, 'shipent') then ParValue := ShipEnt.NameEx
      else if 0 = AnsiCompareText(ParName, 'shipentinn') then ParValue := ShipEnt.INN
      else if 0 = AnsiCompareText(ParName, 'shipentcertnum') then ParValue := ShipEnt.CertNum
      else if 0 = AnsiCompareText(ParName, 'shipentaddr') then ParValue := ShipEnt.GetAddr
      else if 0 = AnsiCompareText(ParName, 'shipka') then begin
        ParValue := ShipKA.NameEx;

        if (ShipKA.KType in [1, 2]) and (ShipKA.DocNum <> '')
          then ParValue := ParValue + rs('prRep','passport') + ' ' + ShipKA.DocNum + ' ' + ShipKA.DocSeries;
      end
      else if 0 = AnsiCompareText(ParName, 'shipkaaddr') then ParValue := ShipKA.GetAddr
      else if 0 = AnsiCompareText(ParName, 'shipkainn') then ParValue := ShipKA.INN
      else if 0 = AnsiCompareText(ParName, 'todate') then ParValue := ToDate
      else if 0 = AnsiCompareText(ParName, 'MFO') then begin
    case CountryRules.AR of
      accRul_RU: ParValue := rs('fmBank', 'BIC');
      accRul_UA: ParValue := rs('fmBank', 'MFO');
      else ParValue := rs('fmBank', 'ABA');
    end;
      end
      else if 0 = AnsiCompareText(ParName, 'shipperjob') then ParValue := PersonJob
      else if 0 = AnsiCompareText(ParName, 'shipper') then ParValue := PersonName;
    end; //With FWBDoc
  end
  //-----------------------------------------------------------------------------------
  else if FType = rtReturnIn then begin
    with FReturnIn do begin
      if 0 = AnsiCompareText(ParName, 'printtype') then ParValue := PrintType
      else if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := DocNum
      else if 0 = AnsiCompareText(ParName, 'curnds') then ParValue := NDS
      else if 0 = AnsiCompareText(ParName, 'possumwonds') then begin
        NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

        ParValue := RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
        FSumNDSPos := RoundToA(FSumNDSPos, -2);
        ParValue := ParValue - FSumNDSPOs;
      end
      else if 0 = AnsiCompareText(ParName, 'possumnds') then begin
        NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

        ParValue := RoundToA(FSumNDSPos + FSumWithoutNDSPos, -2);
      end
      else if 0 = AnsiCompareText(ParName, 'posnds') then begin
        NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

        ParValue := RoundToA(FSumNDSPos, -2);
      end
      else if 0 = AnsiCompareText(ParName, 'posprice') then begin
        if mdReport.FieldByName('amount').AsFloat = 1
          then begin
            NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                    mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

            FSummPos := RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
            ParValue := FSummPos - RoundToA(FSumNDSPos, -2);
          end
          else ParValue := mdReport.FieldByName('price').AsFloat;
      end
      else if 0 = AnsiCompareText(ParName, 'possum') then begin
        if (PrintType = 0) or (FType in [rtWBOutInvoice, rtWBTorg12]) then begin
          NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                  mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

          FSummPos := RoundToA(FSumWithoutNDSPos+FSumNDSPos, -2);
          //FWONDS := RoundToA(FSumm - FNDS, -2);
          FSumWithoutNDSPos := FSummPos - RoundToA(FSumNDSPos, -2);
          ParValue := FSumWithoutNDSPos;
        end
        else begin
          NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                  mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

          ParValue := RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
        end;
      end
      else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := DocDate
      else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
      else if 0 = AnsiCompareText(ParName, 'kafullname') then ParValue := KAName
      else if 0 = AnsiCompareText(ParName, 'reason') then ParValue := Reason
      else if 0 = AnsiCompareText(ParName, 'propis') then ParValue := SummText
      else if 0 = AnsiCompareText(ParName, 'personname') then ParValue := PersonName
      else if 0 = AnsiCompareText(ParName, 'sumnds') then ParValue := SummNDS
      else if 0 = AnsiCompareText(ParName, 'sumall') then ParValue := SummAll;
    end;
  end
  else if FType = rtReturnOut then
    with FReturnOut do begin
      if 0 = AnsiCompareText(ParName, 'printtype') then ParValue := PrintType
      else if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := DocNum
      else if 0 = AnsiCompareText(ParName, 'possumwonds') then begin
        NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

        ParValue := RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
        FSumNDSPos := RoundToA(FSumNDSPos, -2);
        ParValue := ParValue - FSumNDSPOs;
      end
      else if 0 = AnsiCompareText(ParName, 'possumnds') then begin
        NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

        ParValue := RoundToA(FSumNDSPos + FSumWithoutNDSPos, -2);
      end
      else if 0 = AnsiCompareText(ParName, 'posnds') then begin
        NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

        ParValue := RoundToA(FSumNDSPos, -2);
      end
      else if 0 = AnsiCompareText(ParName, 'posprice') then begin
        if mdReport.FieldByName('amount').AsFloat = 1
          then begin
            NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                    mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

            FSummPos := RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
            ParValue := FSummPos - RoundToA(FSumNDSPos, -2);
          end
          else ParValue := mdReport.FieldByName('price').AsFloat;
      end
      else if 0 = AnsiCompareText(ParName, 'possum') then begin
        if (PrintType = 0) or (FType = rtWBOutInvoice) then begin
          NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                  mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

          FSummPos := RoundToA(FSumWithoutNDSPos+FSumNDSPos, -2);
          //FWONDS := RoundToA(FSumm - FNDS, -2);
          FSumWithoutNDSPos := FSummPos - RoundToA(FSumNDSPos, -2);
          ParValue := FSumWithoutNDSPos;
        end// if =0
        else begin
          NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
                  mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);
          ParValue := RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
        end;
      end
      else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := DocDate
      else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
      else if 0 = AnsiCompareText(ParName, 'kafullname') then ParValue := KAName
      else if 0 = AnsiCompareText(ParName, 'curnds') then ParValue := NDS
      else if 0 = AnsiCompareText(ParName, 'reason') then ParValue := Reason
      else if 0 = AnsiCompareText(ParName, 'propis') then ParValue := SummText
      else if 0 = AnsiCompareText(ParName, 'personname') then ParValue := PersonName
      else if 0 = AnsiCompareText(ParName, 'sumnds') then ParValue := SummNDS
      else if 0 = AnsiCompareText(ParName, 'sumall') then ParValue := SummAll
      else if 0 = AnsiCompareText(ParName, 'received') then ParValue := Received
      else if 0 = AnsiCompareText(ParName, 'att') then ParValue := Att;
    end //with FReturnOut
  else if FType = rtWBMove then
    with FWBMove do begin
      if 0 = AnsiCompareText(ParName, 'printtype') then ParValue := PrintType
      else if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := docnum
      else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := docdate
      else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
      else if 0 = AnsiCompareText(ParName, 'entaddr') then ParValue := EntAddr
      else if 0 = AnsiCompareText(ParName, 'entphone') then ParValue := EntPhone
      else if 0 = AnsiCompareText(ParName, 'entaccount') then ParValue := EntAccount
      else if 0 = AnsiCompareText(ParName, 'entbank') then ParValue := EntBank
      else if 0 = AnsiCompareText(ParName, 'entmfo') then ParValue := EntMFO
      else if 0 = AnsiCompareText(ParName, 'entokpo') then ParValue := EntOKPO
      else if 0 = AnsiCompareText(ParName, 'propis') then ParValue := SummText
      else if 0 = AnsiCompareText(ParName, 'whousein') then ParValue := whousein
      else if 0 = AnsiCompareText(ParName, 'whouseout') then ParValue := whouseout
      else if 0 = AnsiCompareText(ParName, 'personin') then ParValue := personin
      else if 0 = AnsiCompareText(ParName, 'personout') then ParValue := personout
      else if 0 = AnsiCompareText(ParName, 'reason') then ParValue := reason
      else if 0 = AnsiCompareText(ParName, 'possumnds') then begin
        FPrice := mdReport.FieldByName('price').AsFloat * mdReport.FieldByName('onvalue').AsFloat;

        if Torg13PriceType > 0
          then FPrice := GetMatExtra(dmData.SConnection, mdReport.FieldByName('matid').AsInteger, Torg13PriceType, Date, FPrice);

        NDSCalc(mdReport.FieldByName('amount').AsFloat, FPrice, mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);
        ParValue := RoundToA(FSumNDSPos + FSumWithoutNDSPos, -2);
      end
      else if 0 = AnsiCompareText(ParName, 'posprice') then begin
        FPrice := mdReport.FieldByName('price').AsFloat * mdReport.FieldByName('onvalue').AsFloat;
        NDSCalc(1, FPrice, mdReport.FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);
        ParValue := RoundToA(FSumWithoutNDSPos, -6);
      end;
    end
  else if FType = rtWriteOff then
    with FWriteOff do begin
      if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := docnum
      else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := docdate
      else if 0 = AnsiCompareText(ParName, 'whouseout') then ParValue := whouseout
      else if 0 = AnsiCompareText(ParName, 'chairman') then ParValue := Chairman
      else if 0 = AnsiCompareText(ParName, 'person1') then ParValue := Person1
      else if 0 = AnsiCompareText(ParName, 'person2') then ParValue := Person2
      else if 0 = AnsiCompareText(ParName, 'person3') then ParValue := Person3
      else if 0 = AnsiCompareText(ParName, 'reason') then ParValue := reason
      else if 0 = AnsiCompareText(ParName, 'propis') then ParValue := SummText;
    end
  else if FType = rtInv then
    with FInv do begin
      if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := DocNum
      else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := DocDate
      else if 0 = AnsiCompareText(ParName, 'whname') then ParValue := WHouseName
      else if 0 = AnsiCompareText(ParName, 'chairman') then ParValue := ChairMan
      else if 0 = AnsiCompareText(ParName, 'person1') then ParValue := Person1
      else if 0 = AnsiCompareText(ParName, 'person2') then ParValue := Person2
      else if 0 = AnsiCompareText(ParName, 'person3') then ParValue := Person3
      else if 0 = AnsiCompareText(ParName, 'reason') then ParValue := Reason
      else if 0 = AnsiCompareText(ParName, 'realsum') then begin
        ParValue := RoundToA(mdReport.FieldByName('discount').AsFloat * mdReport.FieldByName('nds').AsFloat, -2);
      end
      else if 0 = AnsiCompareText(ParName, 'calcsum') then begin
        ParValue := RoundToA(mdReport.FieldByName('amount').AsFloat * mdReport.FieldByName('price').AsFloat, -2);
      end
      else if 0 = AnsiCompareText(ParName, 'diff')
        then ParValue := mdReport.FieldByName('discount').AsFloat - mdReport.FieldByName('amount').AsFloat
      else if 0 = AnsiCompareText(ParName, 'diffsum') then begin
        ParValue := RoundToA(mdReport.FieldByName('discount').AsFloat * mdReport.FieldByName('nds').AsFloat, -2)
                    - RoundToA(mdReport.FieldByName('amount').AsFloat * mdReport.FieldByName('price').AsFloat, -2);
      end
      else if 0 = AnsiCompareText(ParName, 'diffsum1') then begin
        FTmp := RoundToA(mdReport.FieldByName('discount').AsFloat * mdReport.FieldByName('nds').AsFloat, -2)
                - RoundToA(mdReport.FieldByName('amount').AsFloat * mdReport.FieldByName('price').AsFloat, -2);
        if FTmp < 0
          then ParValue := FTmp
          else ParValue := 0;
      end
      else if 0 = AnsiCompareText(ParName, 'diffsum2') then begin
        FTmp := RoundToA(mdReport.FieldByName('discount').AsFloat * mdReport.FieldByName('nds').AsFloat, -2)
                - RoundToA(mdReport.FieldByName('amount').AsFloat * mdReport.FieldByName('price').AsFloat, -2);
        if FTmp > 0
          then ParValue := FTmp
          else ParValue := 0;
      end
      else if 0 = AnsiCompareText(ParName, 'color1') then ParValue := okRepColor1
      else if 0 = AnsiCompareText(ParName, 'color2') then ParValue := okRepColor2
      else if 0 = AnsiCompareText(ParName, 'BaseCurrName') then ParValue := BaseCurrShortName;
    end
  else if FType in [rtContr] then
    with FContr do begin
      if 0 = AnsiCompareText(ParName, 'DOCNUM') then ParValue := DocNum
      else if 0 = AnsiCompareText(ParName, 'DOCDATE') then ParValue := DocDate
      else if 0 = AnsiCompareText(ParName, 'NOTES') then ParValue := Notes
      else if 0 = AnsiCompareText(ParName, 'KAIN') then begin
        case DocType of
          -8:ParValue := KAName;
           8: ParValue := EntName;
        end;
      end
      else if 0 = AnsiCompareText(ParName, 'KAOUT') then begin
        case DocType of
          -8:ParValue := EntName;
           8: ParValue := KAName;
        end;
      end
      else if 0 = AnsiCompareText(ParName, 'SUMMALL') then ParValue := SummAll
      else if 0 = AnsiCompareText(ParName, 'SUMMAMOUNT') then ParValue := SummAmount
      else if 0 = AnsiCompareText(ParName, 'SHIPPEDAMOUNT') then ParValue := ShippedAmount
      else if 0 = AnsiCompareText(ParName, 'SHIPPEDSUMM') then ParValue := ShippedSumm
      else if 0 = AnsiCompareText(ParName, 'PAIDSUMM') then ParValue := PaidSumm
      else if 0 = AnsiCompareText(ParName, 'PERSONNAME') then ParValue := PersonName
      else if 0 = AnsiCompareText(ParName, 'TODATE') then ParValue := ToDate
      else if 0 = AnsiCompareText(ParName, 'CURRNAME') then ParValue := CurrName;
    end//FContr

  else
    with FTaxDoc do begin
      if 0 = AnsiCompareText(ParName, 'ondate') then ParValue := DocDate
      else if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := DocNum
      else if 0 = AnsiCompareText(ParName, 'Condition') then ParValue := Condition
      else if 0 = AnsiCompareText(ParName, 'Form') then ParValue := Form
      else if 0 = AnsiCompareText(ParName, 'NDS') then ParValue := NDS
      else if 0 = AnsiCompareText(ParName, 'AddCharges') then ParValue := AAddCharges
      else if 0 = AnsiCompareText(ParName, 'Personname') then ParValue := PersonName
      {else if 0 = AnsiCompareText(ParName, 'Price') then
        ParValue := RoundToA(NDSOut(mdReport.FieldByName('price').AsFloat, SummNDS), RoundPrice);
  }
      else if 0 = AnsiCompareText(ParName, 'DiscountAdd') then begin
        if ADiscount > 0
          then ParValue := ADiscount
          else ParValue := 0;
      end
      else if 0 = AnsiCompareText(ParName, 'DiscountDec') then begin
        if ADiscount < 0
          then ParValue := -1 *ADiscount
          else ParValue := 0;
      end
      else if 0 = AnsiCompareText(ParName, 'SummWONDS') then ParValue := ASummWONDS
      else if 0 = AnsiCompareText(ParName, 'SummNDS') then ParValue := ASummNDS
      else if 0 = AnsiCompareText(ParName, 'EntFullName') then ParValue := EntName
      else if 0 = AnsiCompareText(ParName, 'EntPhone') then ParValue := EntPhone
      else if 0 = AnsiCompareText(ParName, 'EntCertNo') then ParValue := EntCertNum
      else if 0 = AnsiCompareText(ParName, 'EntAdress') then ParValue := EntAddr
      else if 0 = AnsiCompareText(ParName, 'EntINN1') then begin
        if Length(EntINN) >= 1
          then ParValue := EntINN[1]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'EntINN2') then begin
        if Length(EntINN) >= 2
          then ParValue := EntINN[2]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'EntINN3') then begin
        if Length(EntINN) >= 3
          then ParValue := EntINN[3]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'EntINN4') then begin
        if Length(EntINN) >= 4
          then ParValue := EntINN[4]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'EntINN5') then begin
        if Length(EntINN) >= 5
          then ParValue := EntINN[5]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'EntINN6') then begin
        if Length(EntINN) >= 6
          then ParValue := EntINN[6]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'EntINN7') then begin
        if Length(EntINN) >= 7
          then ParValue := EntINN[7]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'EntINN8') then begin
        if Length(EntINN) >= 8
          then ParValue := EntINN[8]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'EntINN9') then begin
        if Length(EntINN) >= 9
          then ParValue := EntINN[9]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'EntINN10') then begin
        if Length(EntINN) >=10
          then ParValue := EntINN[10]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'EntINN11') then begin
        if Length(EntINN) >= 11
          then ParValue := EntINN[11]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'EntINN12') then begin
        if Length(EntINN) >= 12
          then ParValue := EntINN[12]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'KAFullName') then ParValue := KAName
      else if 0 = AnsiCompareText(ParName, 'KAPhone') then ParValue := KAPhone
      else if 0 = AnsiCompareText(ParName, 'KACertNo') then ParValue := KACertNo
      else if 0 = AnsiCompareText(ParName, 'KAINN1') then begin
        if (Length(KAINN) >= 1) and (NDSPayer = 1)
          then ParValue := KAINN[1]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'KAINN2') then begin
        if (Length(KAINN) >= 2) and (NDSPayer = 1)
          then ParValue := KAINN[2]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'KAINN3') then begin
        if (Length(KAINN) >= 3) and (NDSPayer = 1)
          then ParValue := KAINN[3]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'KAINN4') then begin
        if (Length(KAINN) >= 4) and (NDSPayer = 1)
          then ParValue := KAINN[4]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'KAINN5') then begin
        if (Length(KAINN) >= 5) and (NDSPayer = 1)
          then ParValue := KAINN[5]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'KAINN6') then begin
        if (Length(KAINN) >= 6) and (NDSPayer = 1)
          then ParValue := KAINN[6]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'KAINN7') then begin
        if (Length(KAINN) >= 7) and (NDSPayer = 1)
          then ParValue := KAINN[7]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'KAINN8') then begin
        if (Length(KAINN) >= 8) and (NDSPayer = 1)
          then ParValue := KAINN[8]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'KAINN9') then begin
        if (Length(KAINN) >= 9) and (NDSPayer = 1)
          then ParValue := KAINN[9]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'KAINN10') then begin
        if (Length(KAINN) >= 10) and (NDSPayer = 1)
          then ParValue := KAINN[10]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'KAINN11') then begin
        if (Length(KAINN) >= 11) and (NDSPayer = 1)
          then ParValue := KAINN[11]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'KAINN12') then begin
        if (Length(KAINN) >= 12) and (NDSPayer = 1)
          then ParValue := KAINN[12]
          else ParValue := 'X';
      end
      else if 0 = AnsiCompareText(ParName, 'KAAdress') then ParValue := KAAddr;
    end;

    GetSecParValue(ParName, ParValue);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowAccOut(AID: Integer; IDs: String = '');
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowAccOut') else _udebug := nil;{$ENDIF}

  FType := rtAccOut;
  FWBDoc.Load(AID, IDs);
  FsrcMaster.DataSet := mdReport;
  FReport.OnGetValue := WBDocGetValue;
  FReport.OnUserFunction := WBDocUserFunction;
  SmartShowRep(FReport, 'WaybillAcc_Out.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowTax(AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowTax') else _udebug := nil;{$ENDIF}

  FType := rtTaxWB;
  FTaxDoc.Load(AID);
  FsrcMaster.DataSet := mdReport;
  FReport.OnGetValue := WBDocGetValue;
  FReport.OnUserFunction := WBDocUserFunction;
  SmartShowRep(FReport, 'TaxWB.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowWBRest(AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowWBRest') else _udebug := nil;{$ENDIF}

  FType := rtWBIn;
  FWBDoc.Load(AID);
  FsrcMaster.DataSet := mdReport;
  FReport.OnGetValue := WBDocGetValue;
  FReport.OnUserFunction := WBDocUserFunction;
  SmartShowRep(FReport, 'Waybill_Rest.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowWriteOff(AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowWriteOff') else _udebug := nil;{$ENDIF}

  FType := rtWriteOff;
  FWriteOff.Load(AID);
  FsrcMaster.DataSet := mdReport;
  FReport.OnGetValue := WBDocGetValue;
  FReport.OnUserFunction := WBDocUserFunction;
  SmartShowRep(FReport, 'WriteOff.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowWBOutInvoice(AID: Integer; IDs: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowWBOutInvoice') else _udebug := nil;{$ENDIF}

  FType := rtWBOutInvoice;
  FWBDoc.Load(AID, IDs);
  FsrcMaster.DataSet := mdReport;
  FReport.OnGetValue := WBDocGetValue;
  FReport.OnUserFunction := WBDocUserFunction;
  SmartShowRep(FReport, 'Waybill_Invoice.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowReturnOut(AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowReturnOut') else _udebug := nil;{$ENDIF}

  FType := rtReturnOut;
  FReturnOut.Load(AID);
  FsrcMaster.DataSet := mdReport;
  FReport.OnGetValue := WBDocGetValue;
  FReport.OnUserFunction := WBDocUserFunction;
  SmartShowRep(FReport, 'Return_Out.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TxRep.ShowInv(AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowInv') else _udebug := nil;{$ENDIF}

  FType := rtInv;
  FInv.Load(AID);
  FsrcMaster.DataSet := mdReport;
  FReport.OnGetValue := WBDocGetValue;
  FReport.OnUserFunction := WBDocUserFunction;
  SmartShowRep(FReport, 'Inv.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowWBTorg12(AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowWBTorg12') else _udebug := nil;{$ENDIF}

  FType := rtWBTorg12;
  FWBDoc.Load(AID);

  with TfrmTorg12.Create(nil) do
  try
    OnDate := Date;
    ID := AID;
    lSumStr.Caption := FWBDoc.SummText;
    mdReport.CopyFromDataSet(Self.mdReport);
    ShowModal;

  finally
    Free;
  end;
  //FsrcMaster.DataSet := mdReport;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowWBOutOrder(AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowWBOutOrder') else _udebug := nil;{$ENDIF}

  FType := rtWBOutOrder;
  FWBDoc.Load(AID);
  FsrcMaster.DataSet := mdReport;
  FReport.OnGetValue := WBDocGetValue;
  FReport.OnUserFunction := WBDocUserFunction;
  SmartShowRep(FReport, 'Waybill_Out_Order.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowWBOutWork(AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowWBOutWork') else _udebug := nil;{$ENDIF}

  FType := rtWBOutWork;
  FWBDoc.Load(AID);
  FsrcMaster.DataSet := mdReport;
  FReport.OnGetValue := WBDocGetValue;
  FReport.OnUserFunction := WBDocUserFunction;
  SmartShowRep(FReport, 'Waybill_Out_Work.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.WBDocBeforePrint(Memo: TStringList; View: TfrView);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.WBDocBeforePrint') else _udebug := nil;{$ENDIF}

  if FType = rtWBMove then begin
    if View.Name = 'mPropis' then begin
      Memo.Clear;
      Memo.Text := rs('prRep', 'Sum') + ': ' + MoneyToStr(StrToFloat(View.Tag))
    end;
  end;

  if (View.Name = 'EntLogo') and (EntLogo.Size > 0) then begin
    EntLogo.Position := 0;
    TfrPictureView(View).Picture.Bitmap.LoadFromStream(EntLogo);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowWarrantyDoc(AID: Integer; IDs: string = '');
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowWarrantyDoc') else _udebug := nil;{$ENDIF}

  FType := rtWarrantyDoc;
  FsrcMaster.DataSet := mdReport;

  with TxWarrantyDoc.Create(Self) do
  try
    Load(AID, IDs);

    if Self.mdReport.IsEmpty then begin
      ssMessageDlg(rs('prRep', 'noWarrantyItems'), ssmtInformation, [ssmbOK]);
      Exit;
    end;

    FReport.OnGetValue := WarrantyDocGetValue;
    SmartShowRep(FReport, 'WarrantyDoc.frf');
    FReport.OnGetValue := nil;

  finally
    Free;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TxWarrantyDoc.WarrantyDocGetValue(const ParName: String; var ParValue: Variant);
  var
    D1, D2: Char;
    FText: string;
    FType: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxWarrantyDoc.WarrantyDocGetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'PriceDisplayFormatEx') then ParValue := PriceDisplayFormatEx
  else if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := DocNum
  else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := DocDate
  else if 0 = AnsiCompareText(ParName, 'entname') then begin
    if FKA.FullName = ''
      then ParValue := FKA.Name_
      else ParValue := FKA.FullName;
  end
  else if 0 = AnsiCompareText(ParName, 'kafullname') then ParValue := KAName
  //else if 0 = AnsiCompareText(ParName, 'personname') then ParValue := PersonName
  else if 0 = AnsiCompareText(ParName, 'entaddr') then ParValue := FKA.GetAddr
  else if 0 = AnsiCompareText(ParName, 'entphone') then begin
    if FKA.Phone <> ''
      then ParValue := rs('Common','phone',1) + FKA.Phone
      else ParValue := '';
  end
  else if 0 = AnsiCompareText(ParName, 'warrantyperiod') then begin
    ParValue := '';
    FText := FParent.mdReport.FieldByName('wperiod').AsString;
    if FText = '' then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    D1 := FText[Length(FText)];
    FType := FParent.mdReport.FieldByName('wperiodtype').AsInteger;

    if Length(FText) > 1
      then D2 := FText[Length(FText) - 1]
      else D2 := #0;

    if D1 = '1' then begin
      case FType of
        0: ParValue := FText + ' ' + AnsiLowerCase(rs('Period', 'Year'));
        1: ParValue := FText + ' ' + AnsiLowerCase(rs('Period', 'Month'));
      end;
    end
    else if (D1 in ['2'..'4']) and (D2 <> '1') then begin
      case FType of
        0: ParValue := FText + ' ' + AnsiLowerCase(rs('Period', 'Year_R'));
        1: ParValue := FText + ' ' + AnsiLowerCase(rs('Period', 'Month_R'));
      end;
    end
    else begin
      case FType of
        0: ParValue := FText + ' ' + AnsiLowerCase(rs('Period', 'Year_RM'));
        1: ParValue := FText + ' ' + AnsiLowerCase(rs('Period', 'Month_RM'));
      end;
    end;
  end;

  GetSecParValue(ParName, ParValue);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowContr(AID:Integer;PType:Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowContr') else _udebug := nil;{$ENDIF}

  FType := rtContr;
  //FType := rtContrOut;
  FContr.Load(AID);
  case PType of
    0: begin
      FsrcMaster.DataSet := mdReport;
      FReport.OnGetValue := WBDocGetValue;
      FReport.OnUserFunction := WBDocUserFunction;
      SmartShowRep(FReport, 'Contr.frf');
    end;//0

    1: begin
      if FileExists(trim(FContr.FPath)) then begin
        if ShellExecute(Application.Handle, nil,PChar(trim(FContr.FPath)),nil, nil, SW_SHOWNORMAL) < 32
          then ssMessageDlg(rs('fmContr','FileOpenError') + trim(FContr.FPath), ssmtError, [ssmbOK]);
      end
      else ssMessageDlg(rs('fmContr', 'FileNotFound') + trim(FContr.FPath), ssmtError, [ssmbOK]);
    end;//1
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowOrderOut(AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowOrderOut') else _udebug := nil;{$ENDIF}

  FType := rtOrderOut;
  FWBDoc.Load(AID);
  FsrcMaster.DataSet := mdReport;
  FReport.OnGetValue := WBDocGetValue;
  FReport.OnUserFunction := WBDocUserFunction;
  SmartShowRep(FReport, 'Order_Out.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.ShowOrderIn(AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.ShowOrderIn') else _udebug := nil;{$ENDIF}

  FType := rtOrderIn;
  FWBDoc.Load(AID);
  FsrcMaster.DataSet := mdReport;
  FReport.OnGetValue := WBDocGetValue;
  FReport.OnUserFunction := WBDocUserFunction;
  SmartShowRep(FReport, 'Order_In.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxRep.WBDocUserFunction(const Name: String; p1, p2, p3: Variant; var Val: Variant);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxRep.WBDocUserFunction') else _udebug := nil;{$ENDIF}

  //showmessage(name);
  if LowerCase(Name) = 'suminwords' then
      Val := MoneyToStr(VarToFloat(p1));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

{ TxWriteOffDoc }
//==============================================================================================
constructor TxWriteOffDoc.Create(AParent: TxRep);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxWriteOffDoc.Create') else _udebug := nil;{$ENDIF}

  FParent := AParent;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxWriteOffDoc.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxWriteOffDoc.Destroy') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxWriteOffDoc.Load(AID: Integer);
  var
    FFracSumm: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxWriteOffDoc.Load') else _udebug := nil;{$ENDIF}

  with newDataSet do
    try
      ProviderName := 'pWaybill_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := AID;
      Open;
      ID := AID;
      DocNum := FieldByName('num').AsString;
      DocDate := Int(FieldByName('ondate').AsDateTime);
      Reason := FieldByName('reason').AsString;
      FFracSumm := FormatFloat('0', RoundToA(Frac(FieldByName('SUMMALL').AsCurrency) * 100, 0));
      if Length(FFracSumm) = 1 then FFracSumm := '0' + FFracSumm;
      SummText := MoneyToStr(FieldByName('summall').AsCurrency);
      Close;

      //*******
      //чтени комиссии
      ProviderName := 'pWOCom_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := AID;
      Open;
      if not IsEmpty then begin
        if Locate('num',0,[]) then Chairman := fieldbyname('name').AsString;
        if Locate('num',1,[]) then Person1 := fieldbyname('name').AsString;
        if Locate('num',2,[]) then Person2 := fieldbyname('name').AsString;
        if Locate('num',3,[]) then Person3 := fieldbyname('name').AsString;
      end
      else begin
        Chairman := '';
        Person1 := '';
        Person2 := '';
        Person3 := '';
      end;
      Close;

      ProviderName := 'pWaybillDet_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := AID;
      Open;
      WHouseOut := WHName(dmData.SConnection, FieldByName('wid').AsInteger);

      FParent.mdReport.Close;
      FParent.mdReport.CopyFromDataSet(Fields[0].DataSet);
      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{TxReturnOut}
//==============================================================================================
constructor TxReturnOut.Create(AParent: TxRep);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxReturnOut.Create') else _udebug := nil;{$ENDIF}

  FParent := AParent;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxReturnOut.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxReturnOut.Destroy') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxReturnOut.Load(AID: Integer);
  var
     FSumWithoutNDSPos, FSumNDSPos, FSumWithoutNDS,
     FSumWONDS, FNDS, FSumWithNDS: Extended;
     FFracSumm: string;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxReturnOut.Load') else _udebug := nil;{$ENDIF}

  with newDataSet do
    try
      ProviderName := 'pWBReturn_GetHeader';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := AID;
      Open;
      ID := AID;

      DocNum := FieldByName('num').AsString;
      DocDate := Int(FieldByName('ondate').AsDateTime);

      if Trim(FieldByName('fullname').AsString) <> ''
        then KAName := FieldByName('fullname').AsString
        else KAName := FieldByName('name').AsString;

      Reason := FieldByName('reason').AsString;
      PersonName := FieldByName('personname').AsString;
      Received := FieldByName('received').AsString;

      if Trim(FieldByName('attnum').AsString) <> ''
        then Att := FieldByName('attnum').AsString + rs('fmWaybill','AttDate', 3) + DateTimeToStr(FieldByName('attdate').AsDateTime)
        else Att := '';

      Close;
      ProviderName := 'pRetOutDet_GetP2';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := AID;
      Open;
      FParent.mdReport.Close;
      FParent.mdReport.CopyFromDataSet(Fields[0].DataSet);
      Close;

    finally
      Free;
    end;

    with FParent.mdReport do begin
      First;
      SummNDS := 0;
      SummAll := 0;
      FSumWithoutNDS := 0;
      while not Eof do begin
        NDSCalc(FieldByName('amount').AsFloat, FieldByName('price').AsFloat * FieldByName('onvalue').AsFloat,
                FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

        SummAll := SummAll + RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
        SummNDS := SummNDS + RoundToA(FSumNDSPos, -2);
        Next;
      end;
      //SummNDS := RoundToA(GetNDSOutEx(SummAll, DocNDS), -2);

      if (PrintType = 0) or (FParent.FType = rtWBOutInvoice) then begin
        First;
        while not Eof do begin
          Edit;
          NDSCalc(1, FieldByName('price').AsFloat, FieldByName('nds').AsFloat, 1, FSumWONDS, FNDS);
          FSumWithNDS := RoundToA(FSumWONDS + FNDS, -2);
          FSumWONDS := FSumWithNDS - FNDS;
          FieldByName('price').AsFloat := FSumWONDS;
          Post;
          Next;
        end;//while
      end;//if

      First;
      FFracSumm := IntToStr(Round(Frac(RoundToA(SummAll, -2)) * 100));

      if Length(FFracSumm) = 1 then FFracSumm := '0' + FFracSumm;

      SummText := MoneyToStr(SummAll);
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{ TxWBDoc }
//==============================================================================================
constructor TxWBDoc.Create(AParent: TxRep);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxWBDoc.Create') else _udebug := nil;{$ENDIF}

  FParent := AParent;
  FParent.FReport.OnBeginDoc := RepBeginDoc;
  FParent.FReport.OnBeginBand := FParent.WBDocBeginBand;
  FKA := TokKAgent.Create(Self);
  FKAEx := TokKAgent.Create(Self);
  ShipKA := TokKAgent.Create(Self);
  ShipEnt := TokKAgent.Create(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxWBDoc.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxWBDoc.Destroy') else _udebug := nil;{$ENDIF}

  FKA.Free;
  FKAEx.Free;
  ShipKA.Free;
  ShipEnt.Free;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxWBDoc.Load(AID: Integer; IDs: string = '');
  var
    FSumWithoutNDSPos, FSumNDSPos, FSumWithoutNDS: Extended;
    FAmount: Extended;
    FFracSumm: string;
    FSumWONDS, FNDS, FSumWithNDS, PosSummTax, SummTax: Extended;
    FField: TFloatField;
    S, T, SS, TaxID: string;
    TaxRate: Extended;
    i, j: Integer;
    cdsT: TssClientDataSet;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxWBDoc.Load') else _udebug := nil;{$ENDIF}

  FKA.RemoteServer := dmData.SConnection;
  FKAEx.RemoteServer := dmData.SConnection;
  ShipKA.RemoteServer := dmData.SConnection;
  ShipEnt.RemoteServer := dmData.SConnection;
  cdsT := newDataSet;
  Screen.Cursor := crSQLWait;

  with newDataSet do
    try
      ProviderName := 'pWayBill_GetHeader2';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := AID;
      Open;

      ID := AID;
      AccID := FieldByName('defnum').AsInteger;
      KAID := FieldByName('kaid').AsInteger;
      FKAEx.KAID := FieldByName('kaid').AsInteger;
      DocNum := FieldByName('num').AsString;
      DocDate := Int(FieldByName('ondate').AsDateTime);

      if Trim(FieldByName('fullname').AsString) <> ''
        then KAName := FieldByName('fullname').AsString
        else KAName := FieldByName('name').AsString;

      FKA.KAID := FieldByName('entid').AsInteger;

      if FKA.KAID = 0 then FKA.KAID := CurrEnt.KAID;

      //FKA.Addr.Locate('addrtype', 1, []);
      Reason := FieldByName('reason').AsString;
      Notes := FieldByName('notes').AsString;
      DocNDS := FieldByName('nds').AsFloat;
      PersonName := FieldByName('personname').AsString;
      SummCurr := FieldByName('summincurr').AsCurrency;
      Received := FieldByName('received').AsString;
      PersonJob := FieldByName('personjob').AsString;

      if FieldByName('todate').IsNull
        then ToDate := 0
        else ToDate := DateOf(FieldByName('todate').AsDateTime);

  {if not FieldByName('todate').IsNull then
        ToDate := rs('fmWaybill', 'AccToDate') + ' ' +
          FormatDateTime('dd.mm.yyyy',FieldByName('todate').AsDateTime)
        else ToDate := '';
  }

      KAPhone := FieldByName('phone').AsString;
      KAINN := FieldByName('inn').AsString;
      KAKPP := FieldByName('kpp').AsString;
      KAOKPO := FieldByName('okpo').AsString;

      //Адрес
      //Запись адреса контрагента одной строкой
      KAAddr := FieldByName('postindex').AsString;
      if (Trim(KAAddr) <> '') and (Trim(FieldByName('country').AsString) <> '')
        then KAAddr := KAAddr + ', ' + FieldByName('country').AsString
        else KAAddr := KAAddr + FieldByName('country').AsString;

      if (Trim(KAAddr) <> '') and (Trim(FieldByName('district').AsString) <> '')
        then KAAddr := KAAddr + ', ' + FieldByName('district').AsString
        else KAAddr := KAAddr + FieldByName('district').AsString;

      if (Trim(KAAddr) <> '') and (Trim(FieldByName('city').AsString) <> '')
        then KAAddr := KAAddr + ', ' + FieldByName('city').AsString
        else KAAddr := KAAddr + FieldByName('city').AsString;

      if (Trim(KAAddr) <> '') and (Trim(FieldByName('address').AsString) <> '')
        then KAAddr := KAAddr + ', ' + FieldByName('address').AsString
        else KAAddr := KAAddr + FieldByName('address').AsString;

      if Trim(FieldByName('attnum').AsString) <> ''
        then begin
          Att := FieldByName('attnum').AsString + ' ' + rs('fmWaybill', 'AttDate') + ' ' + DateTimeToStr(FieldByName('attdate').AsDateTime);
          AttNum := FieldByName('attnum').AsString;
          AttDate := FieldByName('attdate').AsString;
          AttName := FieldByName('received').AsString;
        end
        else Att := '';

      Close;

      if FParent.FType = rtWBOutInvoice then begin
        ProviderName := 'pInvoiceParams_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := AID;
        Open;
        if not IsEmpty then begin
          ShipEnt.KAID := FieldByName('shipentid').AsInteger;
          ShipEnt.AddrID := FieldByName('shipentaddrid').AsInteger;
          ShipKA.KAID := FieldByName('shipkaid').AsInteger;
          ShipKA.AddrID := FieldByName('shipkaaddrid').AsInteger;
          FKA.AddrID := FieldByName('entaddrid').AsInteger;
          FKAEx.AddrID := FieldByName('kaaddrid').AsInteger;
          //ShipEnt.AddrID := FieldByName('shipentaddrid').AsInteger;
        end
        else begin
          ShipKA.KAID := KAID;
          ShipKA.Addr.Locate('addrtype', 1, []);
        end;
        Close;
      end;

      if KAID > 0 then begin
        ProviderName := 'pAgentAccount_GetWithBank';
        FetchParams;
        Params.ParamByName('kaid').AsInteger := KAID;
        Open;
        if not IsEmpty then begin
          KAMFO := FieldByName('mfo').AsString;
          KAAccount := FieldByName('accnum').AsString;
          KABank := FieldByName('name').AsString;
          KABankCorAcc := FieldByName('coracc').AsString;
        end;
        Close;
      end;

      if AccId > 0 then begin
        EAccNum := '';
        EBank := '';
        EMFO := '';
        ECorAcc := '';
        ProviderName := 'pAgentAccount_GetEx';
        FetchParams;
        Params.ParamByName('accid').AsInteger := AccId;
        Open;
        if not IsEmpty then begin
          EAccNum := FieldByName('accnum').AsString;
          EBank := FieldByName('name').AsString;
          EMFO := FieldByName('mfo').AsString;
          ECorAcc := FieldByName('coracc').AsString;
        end;
        Close;
      end
      else begin
        EAccNum := FKA.Accounts.FieldByName('accnum').AsString;
        EBank := FKA.Accounts.FieldByName('name').AsString;
        EMFO := FKA.Accounts.FieldByName('mfo').AsString;
        ECorAcc := FKA.Accounts.FieldByName('coracc').AsString;
      end;

      //*****************************************************************
      if FParent.FType in [rtWBOutInvoice, rtWBIn, rtWBOut, rtAccOut, rtOrderIn, rtOrderOut, rtWBOutOrder, rtWBOutWork]
        then ProviderName := 'pWaybillDet_GetP2WithSvc'
        else ProviderName := 'pWaybillDet_GetP2';

      FetchParams;
      Params.ParamByName('wbillid').AsInteger := AID;
      Open;
      FParent.mdReport.Close;

      FParent.mdReport.CopyFromDataSet(Fields[0].DataSet);

      //*****************************************************************
      SummAllTax := 0;
      if FParent.FType in [rtWBOut, rtWBOutOrder, rtAccOut, rtOrderOut, rtWBOutInvoice]
      then begin
        FParent.mdReport.Close;
        cdsT.ProviderName := 'pTaxes_ListP';
        cdsT.Params.Clear;
        cdsT.Open;
        FParent.mdTaxes.CopyFromDataSet(cdsT);
        FParent.mdTaxes.Close;
        FField := TFloatField.Create(FParent.mdTaxes);
        FField.Name := 'fldTaxCustom';
        FField.FieldKind := fkData;
        FField.FieldName := 'TaxCustom';
        FField.DataSet := FParent.mdTaxes;
        FParent.mdTaxes.Open;

        cdsT.First;
        while not cdsT.Eof do begin
          FField := TFloatField.Create(FParent.mdReport);
          FField.Name := 'fldTax' + cdsT.FieldByName('taxid').AsString;
          FField.FieldKind := fkData;
          FField.FieldName := 'Tax' + cdsT.FieldByName('taxid').AsString;
          FField.DataSet := FParent.mdReport;

          FField := TFloatField.Create(FParent.mdReport);
          FField.Name := 'fldTaxRate' + cdsT.FieldByName('taxid').AsString;
          FField.FieldKind := fkData;
          FField.FieldName := 'TaxRate' + cdsT.FieldByName('taxid').AsString;
          FField.DataSet := FParent.mdReport;

          cdsT.Next;
        end;

        FField := TFloatField.Create(FParent.mdReport);
        FField.Name := 'fldTaxSum';
        FField.FieldKind := fkData;
        FField.FieldName := 'TaxSum';
        FField.DataSet := FParent.mdReport;

        FParent.mdReport.Open;
        FParent.mdReport.LoadFromDataSet(Fields[0].DataSet);
      end; // if FParent.FType in [rtWBOut, rtWBOutOrder, rtAccOut, rtOrderOut, rtWBOutInvoice]
      Close;

      if IDs <> '' then begin // removing IDs not in request list
        FParent.mdReport.First;
        while not FParent.mdReport.Eof do
          if WordPositionEx(FParent.mdReport.FieldByName('posid').AsString, IDs, [',']) = -1
            then FParent.mdReport.Delete
            else FParent.mdReport.Next;
      end; // if IDs

      //обработка инфы про налоги
      if FParent.FType in [rtWBOut, rtWBOutOrder, rtAccOut, rtOrderOut, rtWBOutInvoice]
      then begin
        FParent.mdReport.First;
        while not FParent.mdReport.Eof do begin
          if FParent.mdReport.FieldByName('tax').AsString <> '' then begin
            S := FParent.mdReport.FieldByName('tax').AsString;

            if S <> '' then begin
              for i := 1 to WordCount(S, [';']) do begin
                T := ExtractWord(i, S, [';']);
                TaxID := Trim(ExtractWord(1, T, [',']));

                try
                  TaxRate := StrToFloat(ReplaceStr(ExtractWord(2, T, [',']), '.', DecimalSeparator));
                except
                  TaxRate := 0;
                end;

                if TaxRate > 0 then begin
                  NDSCalc(FParent.mdReport.FieldByName('amount').AsFloat,
                    FParent.mdReport.FieldByName('price').AsFloat * FParent.mdReport.FieldByName('onvalue').AsFloat,
                    FParent.mdReport.FieldByName('nds').AsFloat, 1, FSumWONDS, FNDS);

                  FSumWithNDS := RoundToA(FSumWONDS + FNDS, -2);
                  FSumWONDS := FSumWithNDS - RoundToA(FNDS, -2);

                  PosSummTax := 0;
                  SummTax := RoundToA(FSumWONDS * TaxRate / 100, -2);
                  FParent.mdReport.Edit;
                  FParent.mdReport.FieldByName('Tax' + TaxID).AsFloat := TaxRate;
                  FParent.mdReport.FieldByName('TaxRate' + TaxID).AsCurrency := SummTax;

                  FParent.mdReport.FieldByName('TaxSum').AsCurrency := FParent.mdReport.FieldByName('TaxSum').AsCurrency + SummTax;

                  FParent.mdReport.Post;

                  if cdsT.Locate('taxid', StrToInt(TaxID), []) then begin
                    if not FParent.mdTaxes.Locate('taxid;onvalue', VarArrayOf([StrToInt(TaxID), TaxRate]), []) then begin
                      FParent.mdTaxes.Append;
                      FParent.mdTaxes.FieldByName('taxid').AsInteger := StrToInt(TaxID);
                      FParent.mdTaxes.FieldByName('name').AsString := cdsT.FieldByName('name').AsString;
                      FParent.mdTaxes.FieldByName('onvalue').AsFloat := TaxRate;
                    end
                    else FParent.mdTaxes.Edit;

                    FParent.mdTaxes.FieldByName('taxsum').AsCurrency := FParent.mdTaxes.FieldByName('taxsum').AsCurrency + SummTax;

                    FParent.mdTaxes.Post;
                  end;

                  PosSummTax := PosSummTax + SummTax;
                  SummAllTax := SummAllTax + SummTax;
                end;
              end;
            end;
          end;

          FParent.mdReport.Next;
        end;

        if FParent.FType = rtWBOutInvoice then begin
          FParent.mdInvTaxes.CopyFromDataSet(FParent.mdTaxes);
          FParent.mdTaxes.Close;
          FParent.mdTaxes.Open;
          FParent.mdReport.First;
          while not FParent.mdReport.Eof do begin
            if not FParent.mdTaxes.Locate('onvalue', FParent.mdReport.FieldByName('nds').AsFloat, []) then begin
              FParent.mdTaxes.Append;
              FParent.mdTaxes.FieldByName('taxid').AsInteger := 0;
              FParent.mdTaxes.FieldByName('name').AsString := FParent.mdReport.FieldByName('nds').AsString;
              FParent.mdTaxes.FieldByName('onvalue').AsFloat := FParent.mdReport.FieldByName('nds').AsFloat;
            end
            else FParent.mdTaxes.Edit;

            NDSCalc(FParent.mdReport.FieldByName('amount').AsFloat,
              FParent.mdReport.FieldByName('price').AsFloat * FParent.mdReport.FieldByName('onvalue').AsFloat,
              FParent.mdReport.FieldByName('nds').AsFloat, 1, FSumWONDS, FNDS);

            FSumWithNDS := RoundToA(FSumWONDS + FNDS, -2);
            FNDS := RoundToA(FNDS, -2);
            FSumWONDS := FSumWithNDS - FNDS;

            FParent.mdTaxes.FieldByName('taxsum').AsCurrency := FParent.mdTaxes.FieldByName('taxsum').AsCurrency + FNDS;

            FParent.mdTaxes.FieldByName('taxcustom').AsCurrency := FParent.mdTaxes.FieldByName('taxcustom').AsCurrency + FSumWONDS;

            FParent.mdTaxes.Post;

            FParent.mdReport.Next;
          end;
          FParent.mdInvTaxes.First;
        end;

        Close;
        FParent.mdTaxes.First;
      end; // if FParent.FType in [rtWBOut, rtWBOutOrder, rtAccOut, rtOrderOut, rtWBOutInvoice] then begin

      if FParent.FType = rtWBOutInvoice then begin
        ProviderName := 'pWayBillPay_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := AID;
        Open;
        PayDocNum := FieldByName('docnum').AsString;
        PayDocDate := FieldByName('ondate').AsDateTime;
        Close;
      end;

    finally
      Free;
      cdsT.Free;
    end;

    with FParent.mdReport do begin
      First;
      SummNDS := 0;
      SummAll := 0;
      FSumWithoutNDS := 0;
      while not Eof do begin
        if (FParent.FType = rtWBOutWork) and (FieldByName('postype').AsInteger = 0)
          then begin
            Delete;
            Continue;
          end;

        if (FieldByName('postype').AsInteger = 1) and (FieldByName('norm').AsFloat > 0)
          then FAmount := FieldByName('amount').AsFloat * FieldByName('norm').AsFloat
          else FAmount := FieldByName('amount').AsFloat;

        NDSCalc(FieldByName('amount').AsFloat, FieldByName('price').AsFloat * FieldByName('onvalue').AsFloat,
                FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

        SummAll := SummAll + RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
        SummNDS := SummNDS + RoundToA(FSumNDSPos, -2);
        Next;
      end;

      if (PrintType = 0) or (FParent.FType in [rtWBOutInvoice, rtWBTorg12]) then begin
        First;
        while not Eof do begin
          Edit;
          NDSCalc(1, FieldByName('price').AsFloat, FieldByName('nds').AsFloat, 1, FSumWONDS, FNDS);
          FSumWithNDS := RoundToA(FSumWONDS + FNDS, -2);
          FSumWONDS := FSumWithNDS - FNDS;
          FieldByName('price').AsFloat := FSumWONDS;
          Post;
          Next;
        end;//while
      end;//if

      First;
      FFracSumm := FormatFloat('0', Round(Frac(SummAll + SummAllTax) * 100));
      if Length(FFracSumm) = 1 then FFracSumm := '0' + FFracSumm;
      SummText := MoneyToStr(SummAll + SummAllTax);

      SummTextCurr := MoneyToStr(VarToFloat(SummCurr));
    end;
  Screen.Cursor := crDefault;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxWBDoc.RepBeginDoc;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxWBDoc.RepBeginDoc') else _udebug := nil;{$ENDIF}

  if FParent.FType in [rtWBOut, rtWBOutOrder, rtAccOut, rtOrderOut, rtWBOutInvoice] then begin
    if FParent.FReport.FindObject('MasterData2') <> nil then begin
      TfrBandView(FParent.FReport.FindObject('MasterData2')).DataSet := 'FsrcTaxes';
    end;
  end;

  if FParent.FType in [rtWBOutInvoice] then begin
    if FParent.FReport.FindObject('MasterData3') <> nil then begin
      TfrBandView(FParent.FReport.FindObject('MasterData3')).DataSet := 'FsrcInvTaxes';
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{ TxReturnIn }
//==============================================================================================
constructor TxReturnIn.Create(AParent: TxRep);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxReturnIn.Create') else _udebug := nil;{$ENDIF}

  FParent := AParent;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxReturnIn.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxReturnIn.Destroy') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxReturnIn.Load(AID: Integer);
 var
  FSumWithoutNDSPos, FSumNDSPos, FSumWithoutNDS: Extended;
  FSumWONDS, FNDS, FSumWithNDS: Extended;
  FFracSumm: string;
  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxReturnIn.Load') else _udebug := nil;{$ENDIF}

  with newDataSet do
    try
      ProviderName := 'pWBReturn_GetHeader';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := AID;
      Open;

      ID := AID;
      DocNum := FieldByName('num').AsString;
      DocDate := Int(FieldByName('ondate').AsDateTime);

      if Trim(FieldByName('fullname').AsString) <> ''
        then KAName := FieldByName('fullname').AsString
        else KAName := FieldByName('name').AsString;

      Reason := FieldByName('reason').AsString;
      PersonName := FieldByName('personname').AsString;
      Close;
      ProviderName := 'pRetInDet_GetP2';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := AID;
      Open;
      FParent.mdReport.Close;
      FParent.mdReport.CopyFromDataSet(Fields[0].DataSet);
      Close;

    finally
      Free;
    end;

    with FParent.mdReport do begin
      First;
      SummNDS := 0;
      SummAll := 0;
      FSumWithoutNDS := 0;

      while not Eof do begin
        NDSCalc(FieldByName('amount').AsFloat, FieldByName('price').AsFloat*FieldByName('onvalue').AsFloat,
          FieldByName('nds').AsFloat, 1, FSumWithoutNDSPos, FSumNDSPos);

        SummAll := SummAll + RoundToA(FSumWithoutNDSPos + FSumNDSPos, -2);
        SummNDS := SummNDS + RoundToA(FSumNDSPos, -2);

        Next;
      end;
      //SummNDS := RoundToA(GetNDSOutEx(SummAll, DocNDS), -2);

      if (PrintType = 0) or (FParent.FType = rtWBOutInvoice) then begin
        First;

        while not Eof do begin
          Edit;
          NDSCalc(1, FieldByName('price').AsFloat, FieldByName('nds').AsFloat, 1, FSumWONDS, FNDS);
          FSumWithNDS := RoundToA(FSumWONDS + FNDS, -2);
          FSumWONDS := FSumWithNDS - FNDS;
          FieldByName('price').AsFloat := FSumWONDS;
          Post;

          Next;
        end;//while
      end;//if

      First;
      FFracSumm := IntToStr(Round(Frac(RoundToA(SummAll, -2)) * 100));

      if Length(FFracSumm) = 1 then FFracSumm := '0' + FFracSumm;

      SummText := MoneyToStr(SummAll);
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{ TxWBMoveDoc }
//==============================================================================================
constructor TxWBMoveDoc.Create(AParent: TxRep);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxWBMoveDoc.Create') else _udebug := nil;{$ENDIF}

  FParent := AParent;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxWBMoveDoc.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxWBMoveDoc.Destroy') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxWBMoveDoc.Load(AID: Integer);
  var
    FSumWONDS, FNDS, FSumWithNDS:Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxWBMoveDoc.Load') else _udebug := nil;{$ENDIF}

  with newDataSet do
    try
      ProviderName := 'pWayBillMovHeader';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := AID;
      Open;

      ID := AID;
      DocNum := FieldByName('num').AsString;
      DocDate := Int(FieldByName('ondate').AsDateTime);
      WHouseIn := FieldByName('whin').AsString;
      WHouseOut := FieldByName('whout').AsString;
      PersonIn := FieldByName('personin').AsString;
      PersonOut := FieldByName('personout').AsString;
      Reason := FieldByName('reason').AsString;
      SummText := MoneyToStr(FieldByName('summall').AsCurrency);
      Close;

      ProviderName := 'pWaybillDet_GetMove';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := AID;
      Open;
      FParent.mdReport.Close;
      FParent.mdReport.CopyFromDataSet(Fields[0].DataSet);
      Close;

    finally
      Free;
    end;

  with FParent.mdReport do begin
    if PrintType = 0 then begin
      First;
      while not Eof do begin
        Edit;
        NDSCalc(1, FieldByName('price').AsFloat, FieldByName('nds').AsFloat, 1, FSumWONDS, FNDS);
        FSumWithNDS := RoundToA(FSumWONDS + FNDS, -2);
        FSumWONDS := RoundToA(FSumWithNDS - FNDS, -2);
        FieldByName('price').AsFloat := FSumWONDS;
        Post;
        Next;
      end;//while
    end;//if
  end;//with FParent.mdReport do begin

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{ TxTaxDoc }
//==============================================================================================
constructor TxTaxDoc.Create(AParent: TxRep);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxTaxDoc.Create') else _udebug := nil;{$ENDIF}

  FParent := AParent;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxTaxDoc.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxTaxDoc.Destroy') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxTaxDoc.Load(AID: Integer);
  var
    FAddCharges, FDiscount, SummOutNDS,SummNDS,AddChargesOutNDS,AddChargesNDS:Extended;
    //FSumWithoutNDSPos, FSumNDSPos, FSumWithoutNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxTaxDoc.Load') else _udebug := nil;{$ENDIF}

  with newDataSet do
    try
      ProviderName := 'pTaxWB_GetHeader';
      FetchParams;
      Params.ParamByName('twbid').AsInteger := AID;
      Open;

      ID := AID;
      DocNum := FieldByName('num').AsString;
      DocDate := Int(FieldByName('ondate').AsDateTime);

      if Trim(FieldByName('kafullname').AsString) <> ''
        then KAName := FieldByName('kafullname').AsString
        else KAName := FieldByName('kaname').AsString;

      PersonName := FieldByName('personname').AsString;
      KAPhone := FieldByName('kaphone').AsString;
      KAAddr := FieldByName('kapostindex').AsString;

      if (Trim(KAAddr) <> '') and (Trim(FieldByName('kacountry').AsString) <> '')
        then KAAddr := FieldByName('kacountry').AsString + ', ' + KAAddr
        else KAAddr := FieldByName('kacountry').AsString + KAAddr;

      if (Trim(KAAddr) <> '') and (Trim(FieldByName('kadistrict').AsString) <> '')
        then KAAddr := FieldByName('kadistrict').AsString + ', ' + KAAddr
        else KAAddr := FieldByName('kadistrict').AsString + KAAddr;

      if (Trim(KAAddr) <> '') and (Trim(FieldByName('kacity').AsString) <> '')
        then KAAddr := FieldByName('kacity').AsString + ', ' + KAAddr
        else KAAddr := FieldByName('kacity').AsString + KAAddr;

      if (Trim(KAAddr) <> '') and (Trim(FieldByName('kaaddress').AsString) <> '')
        then KAAddr := FieldByName('kaaddress').AsString + ', ' + KAAddr
        else KAAddr := FieldByName('kaaddress').AsString + KAAddr;

      KACertNo := FieldByName('kacertnum').AsString;
      KAINN := FieldByName('kainn').AsString;
      NDSPayer := FieldByName('kandspayer').AsInteger;
      Condition := FieldByName('condition').AsString;

      NDS := FieldByName('nds').AsFloat;
      FAddCharges := FieldByName('ADDCHARGES').AsFloat;
      FDiscount := FieldByName('Discount').AsFloat;

      Form := FieldByName('form').AsString;
      Close;
      ProviderName := 'pTaxWBDet_Get';
      FetchParams;
      Params.ParamByName('twbid').AsInteger := AID;
      Open;
      FParent.mdReport.Close;
      FParent.mdReport.CopyFromDataSet(Fields[0].DataSet);
      Close;

    finally
      Free;
    end;

    ASummNDS := 0;
    ASummWONDS := 0;
    ADiscount := 0;
    AAddCharges := 0;

    with FParent.mdReport do begin
      First;
      while not Eof do begin
        NDSCalc(FieldByName('amount').AsFloat,FieldByName('price').AsFloat,FieldByName('nds').AsFloat,1,SummOutNDS,SummNDS);
        ASummWONDS := ASummWONDS+SummOutNDS;
        ASummNDS := ASummNDS+SummNDS;
        Edit;
        FieldByName('price').AsFloat := RoundToA(NDSOut(FieldByName('price').AsFloat,FieldByName('nds').AsFloat),RoundPrice);
        Post;
        Next;
      end;

      if FDiscount > 0 then begin
        ADiscount := ASummNDS / 100 * FDiscount;
        ASummNDS := RoundtoA(ASummNDS + ADiscount, -2);
        ADiscount := ASummWONDS / 100 * FDiscount;
        ASummWONDS := RoundtoA(ASummWONDS + ADiscount, -2);
      end;

      if FDiscount < 0 then begin
        ADiscount := ASummNDS / 100 * (-FDiscount);
        ASummNDS := RoundtoA(ASummNDS - ADiscount, -2);
        ADiscount := ASummWONDS / 100 * (-FDiscount);
        ASummWONDS := RoundtoA(ASummWONDS - ADiscount, -2);
        ADiscount := -ADiscount;
      end;

      if FAddCharges>0 then begin
        NDSCalc(1, FAddCharges, NDS, 1, AddChargesOutNDS, AddChargesNDS);
        ASummWONDS := RoundtoA(ASummWONDS + AddChargesOutNDS, -2);
        AAddCharges := AddChargesOutNDS;
        ASummNDS := RoundtoA(ASummNDS + AddChargesNDS, -2);
      end;//if
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{ TxKABallance }
//==============================================================================================
constructor TxKABallance.Create(AOwner: TComponent; AParent: TxRep);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxKABallance.Create') else _udebug := nil;{$ENDIF}

  inherited Create(AOwner);
  FReport := TfrReport.Create(Self);
  FParent := AParent;

  cdsMaster := TssClientDataSet.Create(Self);
  cdsMaster.Name := 'cdsMaster';
  cdsMaster2 := TssClientDataSet.Create(Self);
  cdsMaster2.Name := 'cdsMaster2';
  cdsSubDetail := TssClientDataSet.Create(Self);
  cdsSubDetail.Name := 'cdsSubDetail';
  cdsDetail := TssClientDataSet.Create(Self);
  cdsDetail.Name := 'cdsDetail';
  cdsDetail2 := TssClientDataSet.Create(Self);
  cdsDetail2.Name := 'cdsDetail2';

  cdsMaster.AfterScroll := MasterAfterScroll;
  cdsMaster2.AfterScroll := Master2AfterScroll;
  FReport.OnGetValue := RepGetValue;
  FReport.OnBeginDoc := RepBeginDoc;

  frDBDSMaster := TfrDBDataSet.Create(Self);
  frDBDSMaster.Name := 'frDBDSMaster';
  frDBDSMaster.DataSet := cdsMaster;
  fsrcMaster2 := TfrDBDataSet.Create(Self);
  fsrcMaster2.Name := 'frDBDSMaster2';
  fsrcMaster2.DataSet := cdsMaster2;
  fsrcDetail := TfrDBDataSet.Create(Self);
  fsrcDetail.Name := 'frDBDSDetail';
  fsrcDetail.DataSet := cdsDetail;
  fsrcDetail2 := TfrDBDataSet.Create(Self);
  fsrcDetail2.Name := 'frDBDSDetail2';
  fsrcDetail2.DataSet := cdsDetail2;
  fsrcSubDetail := TfrDBDataSet.Create(Self);
  fsrcSubDetail.DataSet := cdsSubDetail;
  fsrcSubDetail.Name := 'frDBDSSubDetail';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxKABallance.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxKABallance.Destroy') else _udebug := nil;{$ENDIF}

  FReport.Free;
  frDBDSMaster.Free;
  fsrcMaster2.Free;
  fsrcDetail.Free;
  fsrcDetail2.Free;
  fsrcSubDetail.Free;
  cdsMaster.Free;
  cdsMaster2.Free;
  cdsSubDetail.Free;
  cdsDetail.Free;
  cdsDetail2.Free;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxKABallance.Load(AID: Integer; AFromDate, AToDate: TDateTime);
  var
    tmpInt: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxKABallance.Load') else _udebug := nil;{$ENDIF}

  ID := AID;
  FromDate := AFromDate;
  ToDate := AToDate;
  if ToDate = 0 then ToDate := MaxDateTime;
  KAName := prFun.KAName(dmData.SConnection, AID, tmpInt);

  with cdsMaster do begin
    Close;
    RemoteServer := dmData.SConnection;
    ProviderName := 'pRep_KAInDetail';
    FetchParams;
    Params.ParamByName('fromdate').AsDateTime := FromDate;
    Params.ParamByName('todate').AsDateTime := ToDate;
    Params.ParamByName('kaid').AsInteger := ID;
    Open;
  end;

  with cdsMaster2 do begin
    Close;
    RemoteServer := dmData.SConnection;
    ProviderName := 'pRep_KAOutDetail';
    FetchParams;
    Params.ParamByName('fromdate').AsDateTime := FromDate;
    Params.ParamByName('todate').AsDateTime := ToDate;
    Params.ParamByName('kaid').AsInteger := ID;
    Open;
  end;

  with cdsSubDetail do begin
    Close;
    RemoteServer := dmData.SConnection;
    ProviderName := 'pRep_KABalanceAll';
    FetchParams;
    Params.ParamByName('fromdate').AsDateTime := FromDate;
    Params.ParamByName('todate').AsDateTime := ToDate;
    Params.ParamByName('kaid').AsInteger := ID;
    Open;
  end;

  if (FromDate > 0) then
    with newDataSet do
    try
      ProviderName := 'pKA_GetSaldo';
      FetchParams;
      Params.ParamByName('kaid').AsInteger := ID;
      Params.ParamByName('ondate').AsDateTime := FromDate;
      Open;
      if not IsEmpty then begin
        cdsSubDetail.First;

        if not cdsSubDetail.IsEmpty
          then cdsSubDetail.Insert
          else cdsSubDetail.Append;

    //cdsSubDetail.FieldByName('id').AsInteger := -100;
        cdsSubDetail.FieldByName('tp').AsInteger := -200;
    //cdsSubDetail.FieldByName('num').AsString := '777';
        cdsSubDetail.FieldByName('ondate').AsDateTime := FromDate;
        cdsSubDetail.FieldByName('summdef').AsCurrency := Fields[0].AsCurrency;
        cdsSubDetail.FieldByName('wb').AsInteger := 1;
        cdsSubDetail.Post;
        if cdsSubDetail.Locate('tp', 0, []) then cdsSubDetail.Delete;
      end;
      Close;

    finally
      Free;
    end;

  with cdsDetail do begin
    RemoteServer := dmData.SConnection;
    ProviderName := 'pRep_KAOutSubDetail';
    FetchParams;
  end;

  with cdsDetail2 do begin
    RemoteServer := dmData.SConnection;
    ProviderName := 'pRep_KAOutSubDetail';
    FetchParams;
  end;

  SmartShowRep(FReport, 'RepKAAll.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxKABallance.Master2AfterScroll(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxKABallance.Master2AfterScroll') else _udebug := nil;{$ENDIF}

  with cdsDetail2 do begin
    Close;
    RemoteServer := dmData.SConnection;
    ProviderName := 'pRep_KAOutSubDetail';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := cdsMaster2.FieldByName('wbillid').AsInteger;
    Open;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxKABallance.MasterAfterScroll(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxKABallance.MasterAfterScroll') else _udebug := nil;{$ENDIF}

  with cdsDetail do begin
    Close;
    RemoteServer := dmData.SConnection;
    ProviderName := 'pRep_KAOutSubDetail';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := cdsMaster.FieldByName('wbillid').AsInteger;
    Open;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxKABallance.RepBeginDoc;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxKABallance.RepBeginDoc') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TxKABallance.RepGetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxKABallance.RepGetValue') else _udebug := nil;{$ENDIF}

  if (0 = AnsiCompareText(ParName, 'fromdate')) then begin
    if FromDate > 0
      then ParValue := DateToStr(FromDate)
      else ParValue := '________';
  end
  else if (0 = AnsiCompareText(ParName, 'todate')) then begin
    if ToDate <> MaxDateTime
      then ParValue := DateToStr(ToDate)
      else ParValue := '________';
  end

  else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
  else if 0 = AnsiCompareText(ParName, 'kaname') then ParValue := KAName
  else if 0 = AnsiCompareText(ParName, 'BaseCurrID') then ParValue := BaseCurrID;

  GetSecParValue(ParName, ParValue);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{ TxInvDoc }
//==============================================================================================
constructor TxInvDoc.Create(AParent: TxRep);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxInvDoc.Create') else _udebug := nil;{$ENDIF}

  FParent := AParent;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxInvDoc.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxInvDoc.Destroy') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxInvDoc.Load(AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxInvDoc.Load') else _udebug := nil;{$ENDIF}

  with newDataSet do
    try
      ProviderName := 'pWaybill_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := AID;
      Open;

      ID := AID;
      DocNum := FieldByName('num').AsString;
      DocDate := Int(FieldByName('ondate').AsDateTime);
      Reason := FieldByName('reason').AsString;
      Close;

      ProviderName := 'pWOCom_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := AID;
      Open;
      if not IsEmpty then begin
        if Locate('num', 0, []) then Chairman := FieldByName('name').AsString;
        if Locate('num', 1, []) then Person1 := FieldByName('name').AsString;
        if Locate('num', 2, []) then Person2 := FieldByName('name').AsString;
        if Locate('num', 3, []) then Person3 := FieldByName('name').AsString;
      end
      else begin
        Chairman := '';
        Person1 := '';
        Person2 := '';
        Person3 := '';
      end;
      Close;

      RemoteServer := dmData.SConnection;
      ProviderName := 'pWaybillDet_GetInvEx';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := AID;
      Open;
      WHouseName := WHName(dmData.SConnection, FieldByName('wid').AsInteger);
      FParent.mdReport.Close;
      FParent.mdReport.CopyFromDataSet(Fields[0].DataSet);
      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{ TxWarrantyDoc }
//==============================================================================================
constructor TxWarrantyDoc.Create(AParent: TxRep);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxWarrantyDoc.Create') else _udebug := nil;{$ENDIF}

  FParent := AParent;
  FKA := TokKAgent.Create(Self);
  FKA.RemoteServer := dmData.SConnection;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxWarrantyDoc.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxWarrantyDoc.Destroy') else _udebug := nil;{$ENDIF}

  FKA.Free;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxWarrantyDoc.Load(AID: Integer; IDs: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxWarrantyDoc.Load') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    if IDs = '' then begin
      ProviderName := 'pWarrantyDocs_GetHeader';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := AID;
      Open;
      ID := FieldByName('wdocid').AsInteger;
      DocNum := FieldByName('num').AsString;
      DocDate := Int(FieldByName('ondate').AsDateTime);

      if FieldByName('fullname').AsString = ''
        then KAName := FieldByName('name').AsString
        else KAName := FieldByName('fullname').AsString;

      FKA.KAID := FieldByName('entid').AsInteger;
      if FKA.KAID = 0 then FKA.KAID := CurrEnt.KAID;
      Close;
    end // if IDs = ''
    else begin
      ProviderName := 'pWayBill_GetHeader2';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := AID;
      Open;
      ID := AID;
      DocNum := FieldByName('num').AsString;
      DocDate := Int(FieldByName('ondate').AsDateTime);

      if Trim(FieldByName('fullname').AsString) <> ''
        then KAName := FieldByName('fullname').AsString
        else KAName := FieldByName('name').AsString;

      FKA.KAID := FieldByName('entid').AsInteger;
      if FKA.KAID = 0 then FKA.KAID := CurrEnt.KAID;
      Close;
    end;

    ProviderName := 'pWaybillDet_GetP2WithSvc';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AID;
    Open;
    FParent.mdReport.Close;
    FParent.mdReport.CopyFromDataSet(Fields[0].DataSet);
    Close;

  finally
    Free;
  end;

  with FParent.mdReport do begin
    First;
    while not Eof do begin
      if ((IDs = '') and FieldByName('wperiod').IsNull) or ((IDs <> '') and (WordPositionEx(FieldByName('posid').AsString, IDs, [',']) = -1))
        then Delete
        else Next;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{ TxContr }
//==============================================================================================
constructor TxContr.Create(AParent: TxRep);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxContr.Create') else _udebug := nil;{$ENDIF}

  FParent := AParent;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxContr.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxContr.Destroy') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxContr.Load(AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxContr.Load') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pContr_Get';
    FetchParams;
    Params.ParamByName('docid').AsInteger := AID;
    Open;

    ID := AID;
    DocNum := FieldByName('num').AsString;
    DocDate := Int(FieldByName('ondate').AsDateTime);
    DocType := FieldByName('doctype').AsInteger;
    KAName := FieldByName('kaname').AsString;
    Notes := FieldByName('notes').AsString;
    CurrName := FieldByName('currname').AsString;
    PersonName := FieldByName('personname').AsString;
    ToDate := Int(FieldByName('todate').AsDateTime);
    SummAll := abs(FieldByName('summ').AsFloat);
    SummAmount := abs(FieldByName('amount').AsFloat);
    ShippedAmount := abs(FieldByName('shippedamount').AsFloat);
    ShippedSumm := abs(FieldByName('shippedsumm').AsFloat);
    PaidSumm := abs(FieldByName('paidsumm').AsFloat);
    FPath := FieldByName('fpath').AsString;
    Close;

    ProviderName := 'pContrDet_Get';
    FetchParams;
    Params.ParamByName('docid').AsInteger := AID;
    Open;

    FParent.mdReport.Close;
    FParent.mdReport.CopyFromDataSet(Fields[0].DataSet);
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{ TxDCTurnover }
//==============================================================================================
constructor TxDCTurnover.Create(AOwner: TComponent; AParent: TxRep);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxDCTurnover.Create') else _udebug := nil;{$ENDIF}

  inherited Create(AOwner);

  FReport := TfrReport.Create(Self);
  FParent := AParent;

  cdsMaster := TssClientDataSet.Create(Self);
  cdsMaster.Name := 'cdsMaster';

  FReport.OnGetValue := RepGetValue;
  FReport.OnBeginDoc := RepBeginDoc;

  frDBDSMaster := TfrDBDataSet.Create(Self);
  frDBDSMaster.Name := 'frDBDSMaster';
  frDBDSMaster.DataSet := cdsMaster;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxDCTurnover.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxDCTurnover.Destroy') else _udebug := nil;{$ENDIF}

  FReport.Free;
  frDBDSMaster.Free;
  cdsMaster.Free;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxDCTurnover.Load(AID: Integer; AFromDate, AToDate: TDateTime);
  var
    tmpInt: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxDCTurnover.Load') else _udebug := nil;{$ENDIF}

  ID := AID;
  FromDate := AFromDate;
  ToDate := AToDate;

  if ToDate = 0 then ToDate := MaxDateTime;

  with newDataSet do
  try
    ProviderName := 'pDiscCards_GetEx';
    FetchParams;
    Params.ParamByName('cardid').AsInteger := AID;
    Open;
    CardNum := FieldByName('num').AsString;
    Holder := FieldByName('name').AsString;
    Close;

  finally
    Free;
  end;

  with cdsMaster do begin
    Close;
    RemoteServer := dmData.SConnection;
    ProviderName := 'pDC_Turnover';
    FetchParams;
    Params.ParamByName('fromdate').AsDateTime := FromDate;
    Params.ParamByName('todate').AsDateTime := ToDate;
    Params.ParamByName('cardid').AsInteger := AID;
    Open;

    First;
    FPosCount := 0;
    FTotalSumm := 0;

    while not Eof do begin
      if FieldByName('wtype').AsInteger = -1 then begin
        Inc(FPosCount);
        FTotalSumm := FTotalSumm + FieldByName('total').AsCurrency;
      end
      else FTotalSumm := FTotalSumm - FieldByName('total').AsCurrency;

      Next;
    end;
  end;

  if SmartShowRep(FReport, 'DCTurnover.frf', False) then begin
    if FReport.FindObject('MasterData1') <> nil then begin
      TfrBandView(FReport.FindObject('MasterData1')).DataSet := 'frDBDSMaster';
    end;

    FReport.ShowReport;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxDCTurnover.MasterAfterScroll(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxDCTurnover.MasterAfterScroll') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TxDCTurnover.RepBeginDoc;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxDCTurnover.RepBeginDoc') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TxDCTurnover.RepGetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxDCTurnover.RepGetValue') else _udebug := nil;{$ENDIF}

  if (0 = AnsiCompareText(ParName, 'fromdate')) then begin
    if FromDate > 0
      then ParValue := DateToStr(FromDate)
      else ParValue := '________';
  end
  else if (0 = AnsiCompareText(ParName, 'todate')) then begin
    if ToDate <> MaxDateTime
      then ParValue := DateToStr(ToDate)
      else ParValue := '________';
  end
  else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
  else if 0 = AnsiCompareText(ParName, 'holder') then ParValue := Holder
  else if 0 = AnsiCompareText(ParName, 'basecurrname') then ParValue := BaseCurrName
  else if 0 = AnsiCompareText(ParName, 'poscount') then ParValue := FPosCount
  else if 0 = AnsiCompareText(ParName, 'totalsumm') then ParValue := FTotalSumm
  else if 0 = AnsiCompareText(ParName, 'cardnum') then ParValue := CardNum;

  GetSecParValue(ParName, ParValue);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure GetSecParValue(const ParName: String; var ParValue: Variant);
  var
    na: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetSecParValue') else _udebug := nil;{$ENDIF}

  na := rs('Common', 'NA');

  if 0 = AnsiCompareText(ParName, 'showp') then ParValue := ShowPrices
  else if 0 = AnsiCompareText(ParName, 'showb') then ParValue := ShowBallance
  else if 0 = AnsiCompareText(ParName, 'noaccess') then ParValue := na
  else if not ShowPrices and (0 = AnsiCompareText(ParName, 'pricedef')) then ParValue := na;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('prRep', @Debugging, DEBUG_group_ID);
  {$ENDIF}

  xRep := TxRep.Create(nil);

//==============================================================================================
finalization
  xRep.Free;

  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}
end.
