{$I ok_sklad.inc}
unit Rep21; // Краткий отчёт о финансовом результате

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRepWithPeriod, FR_DSet, FR_DBSet, DB, DBClient,
  ssClientDataSet, FR_Chart, FR_ChBox, FR_Class, ActnList, ssFormStorage,
  ImgList, xButton, ssPanel, ssGradientPanel, dxTL6, dxDBCtrl6, dxCntner6,
  dxDBTL6, ssPeriod, okPeriod, StdCtrls, ExtCtrls, ssBevel, ssSpeedButton,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  Grids, DBGrids, ssMemDS;

type
  TfrmRep21 = class(TfrmBaseRepWithPeriod)
    cbInter: TcxComboBox;
    dsRep: TDataSource;
    lInter: TLabel;
    mdRep: TssMemoryData;
    mdRepFinRes: TFloatField;
    mdRepfromDate: TDateTimeField;
    mdRepIname: TStringField;
    mdRepMatPrib: TFloatField;
    mdRepMatRetNDS: TCurrencyField;
    mdRepMatSummIn: TFloatField;
    mdRepMatSummOut: TFloatField;
    mdRepMatSummRetIn: TCurrencyField;
    mdRepMatSummWriteOff: TCurrencyField;
    mdRepPayOut: TFloatField;
    mdRepSvcSumm: TFloatField;
    mdReptoDate: TDateTimeField;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);
    procedure mdRepCalcFields(DataSet: TDataSet);
    procedure prdMainChange(Sender: TObject);

  private
    FShowRetNDS: Integer;
    function MonthNo(ADate:TDateTime):byte;
    function DaysInQuarter(ADate:TDateTime):byte;
    function QuarterNo(ADate:TDateTime):byte;

  public
    procedure SetCaptions; override;
  end;

var
  frmRep21: TfrmRep21;

implementation

uses
  prConst, ssBaseIntfDlg, BaseRep, ssRegUtils,ssBaseConst, StdConvs,
  DateUtils,ssDateUtils,ClientData, ssFun, prFun, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
function TfrmRep21.QuarterNo(ADate:TDateTime):byte;
  var
    FYear, FMonth, FDay: Word;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep21.QuarterNo') else _udebug := nil;{$ENDIF}

  Result := 0;
  DecodeDate(ADate,FYear,FMonth,FDay);
  if FMonth in [1,2,3] then Result := 1;
  if FMonth in [4,5,6] then Result := 2;
  if FMonth in [7,8,9] then Result := 3;
  if FMonth in [10,11,12] then Result := 4;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmRep21.DaysInQuarter(ADate:TDateTime):byte;
  var
    FYear, FMonth, FDay: Word;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep21.DaysInQuarter') else _udebug := nil;{$ENDIF}

  Result := 0;
  DecodeDate(ADate,FYear,FMonth,FDay);
  if FMonth in [1,2,3] then Result := DaysInAMonth(FYear,1)+DaysInAMonth(FYear,2)+DaysInAMonth(FYear,3) else
  if FMonth in [4,5,6] then Result := DaysInAMonth(FYear,4)+DaysInAMonth(FYear,5)+DaysInAMonth(FYear,6) else
  if FMonth in [7,8,9] then Result := DaysInAMonth(FYear,7)+DaysInAMonth(FYear,8)+DaysInAMonth(FYear,9) else
  if FMonth in [10,11,12] then Result := DaysInAMonth(FYear,10)+DaysInAMonth(FYear,11)+DaysInAMonth(FYear,12);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmRep21.MonthNo(ADate:TDateTime):byte;
  var
    FYear, FMonth, FDay: Word;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep21.MonthNo') else _udebug := nil;{$ENDIF}

  DecodeDate(ADate,FYear,FMonth,FDay);
  Result := FMonth;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfrmRep21.SetCaptions;
  var
    fItemIndex:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep21.SetCaptions') else _udebug := nil;{$ENDIF}

  fItemIndex := 0;
  inherited;
  with LangMan do begin
    lTextNotes.Caption := GetRS('fmAllReports','ReplPRvsEx');
    lInter.Caption := GetRS('fmAllReports','Int')+':';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep21.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep21.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;
  aOK.Enabled := cbInter.EditingText<>'';
  aPrint.Enabled := aOK.Enabled;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep21.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    FInt, cDate:TDateTime;
    iname: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep21.FormCloseQuery') else _udebug := nil;{$ENDIF}

  CanClose := False;
  if ModalResult=mrOk then begin
    cDate := prdMain.FromDate;
    mdRep.Close;
    mdRep.Open;
    with newDataSet do
    try
      ProviderName := 'pRep21_GetRetNDS';
      FetchParams;
      Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;
      Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);
      Open;
      FShowRetNDS := Integer(Fields[0].AsInteger > 0); 
      Close;

    finally
      Free;
    end;

    Screen.Cursor := crSQLWait;
    Fint := 1;

    while cDate <= prdMain.ToDate do begin
      iname := '';

      case cbInter.ItemIndex of
        0: begin//по дням
          FInt := 1;
          iname := DateToStr(cDate);
        end;//0

        1: begin
          FInt := DaysInMonth(cDate);
          iname := rs('Period', 'Month' + IntToStr(MonthNo(cDate))) + ' ' + inttostr(YearOf(cDate));
        end;//1по месяцам

        2:begin
          FInt := DaysInQuarter(cDate);
          iname := rs('Period', 'quarter' + IntToStr(QuarterNo(cDate))) + ' ' + inttostr(YearOf(cDate));
        end;//2по кварталам

        3:begin FInt := 365 end;//3//по годам
      end;//case

      mdRep.Append;
      mdRep.FieldByName('fromdate').AsDateTime := cDate;
      mdRep.FieldByName('iname').AsString := iname;
      cDate := cDate + FInt - 1;
      mdRep.FieldByName('todate').AsDateTime := LastSecondInDay(cDate);

      //1.Получаем по товарам
      with newDataSet do
      try
        // Списание
        ProviderName := 'pRep21_WriteOff';
        FetchParams;
        FetchMacros;

        Macros.ParamByName('m').AsString := WHAccessMacro('wbd.wid');

        Params.ParamByName('fromdate').AsDateTime := mdRep.FieldByName('fromdate').AsDateTime;
        Params.ParamByName('todate').AsDateTime := mdRep.FieldByName('todate').AsDateTime;
        Open;
        mdRep.FieldByName('MatSummWriteOff').AsFloat := Fields[0].AsFloat;
        Close;

        // Возврат от клиентов
        ProviderName := 'pRep21_RetIn';
        FetchParams;
        FetchMacros;
        Macros.ParamByName('m').AsString := WHAccessMacro('wbd.wid');
        Params.ParamByName('fromdate').AsDateTime := mdRep.FieldByName('fromdate').AsDateTime;
        Params.ParamByName('todate').AsDateTime := mdRep.FieldByName('todate').AsDateTime;
        Open;
        mdRep.FieldByName('MatSummRetIn').AsFloat := Fields[0].AsCurrency - Fields[1].AsCurrency;
        Close;

        // Возврат НДС
        ProviderName := 'pRep21_RetNDS';
        FetchParams;
        FetchMacros;
        Macros.ParamByName('m').AsString := WHAccessMacro('wbd.wid');
        Params.ParamByName('fromdate').AsDateTime := mdRep.FieldByName('fromdate').AsDateTime;
        Params.ParamByName('todate').AsDateTime := mdRep.FieldByName('todate').AsDateTime;
        Open;
        mdRep.FieldByName('MatRetNDS').AsFloat := Fields[0].AsFloat;
        Close;

        ProviderName := 'pRep21_1';
        FetchParams;
        FetchMacros;
        Macros.ParamByName('m').AsString := WHAccessMacro('wbd.wid');

        Params.ParamByName('fromdate').AsDateTime := mdRep.FieldByName('fromdate').AsDateTime;
        Params.ParamByName('todate').AsDateTime := mdRep.FieldByName('todate').AsDateTime;
        Open;
        if not IsEmpty then begin
          mdRep.FieldByName('matsummin').AsFloat := RoundToA(FieldByName('summin').AsFloat, -2);
          mdRep.FieldByName('matsummout').AsFloat := RoundToA(FieldByName('summout').AsFloat, -2);
          mdRep.FieldByName('matprib').AsFloat := mdRep.FieldByName('matsummout').AsFloat -
            mdRep.FieldByName('matsummin').AsFloat -
            mdRep.FieldByName('MatSummWriteOff').AsFloat -
            mdRep.FieldByName('MatSummRetIn').AsFloat;
        end//if
        else begin
          mdRep.FieldByName('matsummin').AsFloat := 0;
          mdRep.FieldByName('matsummout').AsFloat := 0;
          mdRep.FieldByName('matprib').AsFloat := 0;
        end;//else
        Close;

        //2.Получаем по услугам
        ProviderName := 'pRep21_2';
        FetchParams;
        Params.ParamByName('fromdate').AsDateTime := mdRep.FieldByName('fromdate').AsDateTime;
        Params.ParamByName('todate').AsDateTime := mdRep.FieldByName('todate').AsDateTime;
        Open;
        if not IsEmpty then mdRep.FieldByName('svcsumm').AsFloat := FieldByName('svcsumm').AsFloat
         else mdRep.FieldByName('svcsumm').AsFloat := 0;
        Close;
        //3.Получаем по расходам
        ProviderName := 'pRep21_3';
        FetchParams;
        Params.ParamByName('fromdate').AsDateTime := mdRep.FieldByName('fromdate').AsDateTime;
        Params.ParamByName('todate').AsDateTime := mdRep.FieldByName('todate').AsDateTime;
        Open;
        if not IsEmpty
          then mdRep.FieldByName('payout').AsFloat := FieldByName('payout').AsFloat
          else mdRep.FieldByName('payout').AsFloat := 0;
        Close;

      finally
        Free;
      end;

      mdRep.Post;
    end;//while

    Screen.Cursor := crDefault;
    SmartShowRep(frReport1, 'Rep21.frf');
  end//if ModalResult=mrOk
  else CanClose := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep21.prdMainChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep21.prdMainChange') else _udebug := nil;{$ENDIF}

  with LangMan do
  case prdMain.PeriodType of
    ptMonth:begin
      cbInter.Clear;
      cbInter.Properties.Items.Clear;
      cbInter.Properties.Items.Add(GetRS('fmAllReports','IntByDay'));
      cbInter.ItemIndex := 0;
    end;//prMont

    ptQuarter:begin
      cbInter.Clear;
      cbInter.Properties.Items.Clear;
      cbInter.Properties.Items.Add(GetRS('fmAllReports','IntByDay'));
      cbInter.Properties.Items.Add(GetRS('fmAllReports','IntByMonth'));
      cbInter.ItemIndex := 1;
    end;//ptQuarter

    ptYear:begin
      cbInter.Clear;
      cbInter.Properties.Items.Clear;
      cbInter.Properties.Items.Add(GetRS('fmAllReports','IntByDay'));
      cbInter.Properties.Items.Add(GetRS('fmAllReports','IntByMonth'));
      cbInter.Properties.Items.Add(GetRS('fmAllReports','IntByKv'));
      cbInter.ItemIndex := 2;
    end;//ptYear

    ptCustom:begin
      cbInter.Clear;
      cbInter.Properties.Items.Clear;
    end;//ptCustom
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep21.frReport1GetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep21.frReport1GetValue') else _udebug := nil;{$ENDIF}
              
  if (0 = AnsiCompareText(ParName, 'fromdate')) then begin
    if prdMain.FromDate>MinDateTime
      then ParValue := DateToStr(prdMain.FromDate)
      else ParValue := '__________';
  end
  else if (0 = AnsiCompareText(ParName, 'todate')) then begin
    if prdMain.ToDate < MaxDateTime
      then ParValue := DateToStr(prdMain.ToDate)
      else ParValue := '__________';
  end
  else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
  else if LowerCase(parname)='showretnds'
    then ParValue := FShowRetNDS;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep21.mdRepCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep21.mdRepCalcFields') else _udebug := nil;{$ENDIF}

  with DataSet do begin
    try
      FieldByName('finres').AsFloat := FieldByName('matprib').AsFloat+FieldByName('svcsumm').AsFloat-FieldByName('payout').AsFloat;

    except
      FieldByName('finres').AsFloat;
    end
  end;//with

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Rep21', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
