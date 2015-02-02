{$I ok_sklad.inc}
unit Rep17; //Отчёт о финансовом результате

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRepWithPeriod, FR_DSet, FR_DBSet, DB, DBClient,
  ssClientDataSet, FR_Chart, FR_ChBox, FR_Class, ActnList, ssFormStorage,
  ImgList, xButton, ssPanel, ssGradientPanel, ssPeriod, okPeriod, StdCtrls,
  ExtCtrls, ssBevel, ssSpeedButton, dxTL6, dxDBCtrl6, dxCntner6, dxDBTL6,
  ssMemDS;

type
  TfrmRep17 = class(TfrmBaseRepWithPeriod)
    ActionList1: TActionList;
    cdsMaster2: TssClientDataSet;
    cdsRetIn: TssClientDataSet;
    cdsWriteOff: TssClientDataSet;
    dsMaster2: TDataSource;
    frDBDSMaster2: TfrDBDataSet;
    fsrcRetIn: TfrDBDataSet;
    fsrcWriteOff: TfrDBDataSet;
    srcRetIn: TDataSource;
    srcWriteOff: TDataSource;

    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure frReport1BeforePrint(Memo: TStringList; View: TfrView);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);

  private
    FSummRetNDS: Extended;

  public
    procedure SetCaptions; override;
  end;

var
  frmRep17: TfrmRep17;

implementation

uses 
  prConst, ssBaseConst, ssDateUtils, ClientData, prFun, udebug;

var 
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmRep17.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep17.FormCloseQuery') else _udebug := nil;{$ENDIF}
    
  CanClose := False;

  if ModalResult = mrOk then begin
    Screen.Cursor := crSQLWait;
    try
      Application.ProcessMessages;
      FromDate := prdMain.FromDate;
      ToDate := LastSecondInDay(prdMain.ToDate);

      with newDataSet do
      try
        ProviderName := 'pRep21_RetNDS';
        FetchParams;
        FetchMacros;
        Params.ParamByName('fromdate').AsDateTime := FromDate;
        Params.ParamByName('todate').AsDateTime := ToDate;

        Macros.ParamByName('m').AsString := WHAccessMacro('wbd.wid');

        Open;
        FSummRetNDS := Fields[0].AsCurrency;
        Close;

        ProviderName := 'pRep_MatOut1';
        FetchMacros;

        Macros.ParamByName('m').AsString := WHAccessMacro('wmt.wid');

        FetchParams;
        Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;
        Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);

        Open;
        CopyDataSet(cdsMaster, Fields[0].Dataset);
        Close;

      finally
        Free;
      end;

      colAmount.FieldName   := 'amountout';
      colSummdef.FieldName  := 'summout';
      colNDSIn.FieldName    := 'ndsin';
      colSummIn.FieldName   := 'summin';
      colNdsOut.FieldName   := 'ndsout';
      colNdsDif.FieldName   := 'NdsDif';
      colPrib.FieldName     := 'Prib';
      colArtikul.FieldName  := 'artikul';
      colProducer.FieldName := 'producer';

      dbgRef.DataSource := dsMaster;
      colMatName.Sorted := csUp;
      cdsMaster.DisableControls;

      for i := 0 to dbgRef.Count - 1 do begin
        if HasMat(dbgRef.Items[i]) then SetDel0(dbgRef.Items[i]);
      end;

      //Удаление "лишних" позиций
      cdsMaster.First;
      while not cdsMaster.Eof do begin
        if cdsMaster.FieldByName('del').AsInteger = 1
          then cdsMaster.Delete
          else cdsMaster.Next;
      end;

      cdsMaster.EnableControls;//Для treelista
      cdsMaster.DisableControls;

      while not cdsMaster.IsEmpty do cdsMaster.Delete;

      //Запись в cdsMaster
      for i := 0 to dbgRef.Count - 1 do WriteNode(dbgRef.Items[i]);

      cdsMaster.EnableControls;

      with cdsWriteOff do begin
        Close;
        ProviderName := 'pRep17_WriteOff';
        FetchParams;
        FetchMacros;

        Macros.ParamByName('m').AsString := WHAccessMacro('wbd.wid');

        Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;
        Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);
        Open;
      end;

      with cdsRetIn do begin
        Close;
        ProviderName := 'pRep17_RetIn';
        FetchParams;
        FetchMacros;
        Macros.ParamByName('m').AsString := WHAccessMacro('wbd.wid');
        Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;
        Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);
        Open;
      end;

      //Считываем продажи услуг
      with cdsDetail do begin
        Close;
        ProviderName := 'pRep_SvcOut';
        FetchMacros;
        Macros.ParamByName('m').AsString := '';
        Macros.ParamByName('n').AsString := 'order by 3';
        FetchParams;
        Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;
        Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);
        Open;
      end;//with

      //*************************

      //Считываем затраты
      with cdsMaster2 do begin
        Close;
        ProviderName := 'pRep17_Charge';
        FetchParams;
        Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;
        Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);
        Open;
      end;//with cdsMaster2

      SmartShowRep(frReport1, 'ReplPRvsEx.frf');

    finally
      Screen.Cursor := crDefault;
    end;
  end
  else CanClose := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep17.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep17.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    lTextNotes.Caption := GetRS('fmAllReports', 'ReplPRvsEx');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep17.frReport1BeforePrint(Memo: TStringList; View: TfrView);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep17.frReport1BeforePrint') else _udebug := nil;{$ENDIF}

  { if cdsMaster.FieldByName('prib').AsFloat > 0 then begin
    if View.Name = 'nNo' then (View as TfrMemoView).FillColor := clWhite else
    if View.Name = 'mMatName' then (View as TfrMemoView).FillColor := clWhite else
    if View.Name = 'mAmountOut' then (View as TfrMemoView).FillColor := clWhite else
    if View.Name = 'mMsrName' then (View as TfrMemoView).FillColor := clWhite else
    if View.Name = 'mPriceDefIn' then (View as TfrMemoView).FillColor := clWhite else
    if View.Name = 'mSummIn' then (View as TfrMemoView).FillColor := clWhite else
    if View.Name = 'mNDSIn' then (View as TfrMemoView).FillColor := clWhite else
    if View.Name = 'mPriceDef' then (View as TfrMemoView).FillColor := clWhite else
    if View.Name = 'mSummOut' then (View as TfrMemoView).FillColor := clWhite else
    if View.Name = 'mNDSOut' then (View as TfrMemoView).FillColor := clWhite else
    if View.Name = 'mNDSDif' then (View as TfrMemoView).FillColor := clWhite else
    if View.Name = 'mPrib' then (View as TfrMemoView).FillColor := clWhite;
  end
  else begin
    if View.Name = 'nNo' then (View as TfrMemoView).FillColor := $E8E8FF else
    if View.Name = 'mMatName' then (View as TfrMemoView).FillColor := $E8E8FF else
    if View.Name = 'mAmountOut' then (View as TfrMemoView).FillColor := $E8E8FF else
    if View.Name = 'mMsrName' then (View as TfrMemoView).FillColor := $E8E8FF else
    if View.Name = 'mPriceDefIn' then (View as TfrMemoView).FillColor := $E8E8FF else
    if View.Name = 'mSummIn' then (View as TfrMemoView).FillColor := $E8E8FF else
    if View.Name = 'mNDSIn' then (View as TfrMemoView).FillColor := $E8E8FF else
    if View.Name = 'mPriceDef' then (View as TfrMemoView).FillColor := $E8E8FF else
    if View.Name = 'mSummOut' then (View as TfrMemoView).FillColor := $E8E8FF else
    if View.Name = 'mNDSOut' then (View as TfrMemoView).FillColor := $E8E8FF else
    if View.Name = 'mNDSDif' then (View as TfrMemoView).FillColor := $E8E8FF else
    if View.Name = 'mPrib' then (View as TfrMemoView).FillColor := $E8E8FF;
  end;

  if View.Name='mMatName' then
    with (View as TfrMemoView) do begin
      if cdsMaster.FieldByName('matid').AsInteger < 0 then begin
        x := 28;
        dx := 1013;
        FillColor := PLGrpColor;
        Font.Style := Font.Style + [fsBold];
      end
      else begin
        x := 68;
        dx := 387;
        Font.Style := Font.Style - [fsBold];
      end;
    end;
  }

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep17.frReport1GetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep17.frReport1GetValue') else _udebug := nil;{$ENDIF}

  inherited;

  if 0 = AnsiCompareText(ParName, 'summretnds') then ParValue := FSummRetNDS;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Rep17', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
