{$I ok_sklad.inc}
unit BaseRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseDlg, ssBevel, ActnList, ssFormStorage, ImgList, xButton,
  ssPanel, ssGradientPanel, ssSpeedButton, ExtCtrls, ClientData, FR_Chart,
  FR_ChBox, FR_Class, FR_DSet, FR_DBSet, DB, DBClient, ssClientDataSet,
  StdCtrls, dxTL6, dxDBCtrl6, dxCntner6, dxDBTL6, xLngDefs,
  ssMemDS;

type
  TfrmBaseRep = class(TBaseDlg)    
    aCurAction: TAction;
    aPrint: TAction;
    btnUseDiagram: TssSpeedButton;
    btnUseLogo: TssSpeedButton;
    cdsDetail: TssClientDataSet;
    cdsMaster: TssMemoryData;
    cdsSubDetail: TssClientDataSet;
    colAmount: TdxDBTreeListColumn;
    colArtikul: TdxDBTreeListColumn;
    colCertNum: TdxDBTreeListColumn;
    colGrpId: TdxDBTreeListColumn;
    colGTD: TdxDBTreeListColumn;
    colKoef: TdxDBTreeListColumn;
    colKoefNDS: TdxDBTreeListColumn;
    colMatId: TdxDBTreeListColumn;
    colMatName: TdxDBTreeListColumn;
    colMsrName: TdxDBTreeListColumn;
    colNdsDif: TdxDBTreeListColumn;
    colNDSIn: TdxDBTreeListColumn;
    colNdsOut: TdxDBTreeListColumn;
    colNotes: TdxDBTreeListColumn;
    colPosDate: TdxDBTreeListColumn;
    colPrib: TdxDBTreeListColumn;
    colPribNDS: TdxDBTreeListColumn;
    colProducer: TdxDBTreeListColumn;
    colRsv: TdxDBTreeListColumn;
    colSummdef: TdxDBTreeListColumn;
    colSummIn: TdxDBTreeListColumn;
    colWRNum: TdxDBTreeListColumn;
    dbgRef: TdxDBTreeList;
    dsDetail: TDataSource;
    dsMaster: TDataSource;
    dsSubDetail: TDataSource;
    frChartObject1: TfrChartObject;
    frCheckBoxObject1: TfrCheckBoxObject;
    frDBDSDetail: TfrDBDataSet;
    frDBDSMaster: TfrDBDataSet;
    frDBDSSubDetail: TfrDBDataSet;
    frReport1: TfrReport;
    Image3: TImage;
    lTextNotes: TLabel;
    panNotes: TPanel;

    procedure aPrintExecute(Sender: TObject);
    procedure CtrlEnter(Sender: TObject);
    procedure CtrlExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure frReport1BeforePrint(Memo: TStringList; View: TfrView);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);

  private
    FRepID: Integer;

  protected
    FCurCtrl: TControl;
    FromDate: TDateTime;
    ToDate: TDateTime;

    procedure SetRepID(const Value: Integer); virtual;
    procedure ShowRep(const AName: string);
    procedure WriteNode(ANode: TdxTreeListNode);
    function HasMat(ANode: TdxTreeListNode): Boolean;
    procedure SetDel0(ANode: TdxTreeListNode);

  public
    procedure SetCaptions; override;

    property RepID: Integer read FRepID write SetRepID;
  end;

var
  frmBaseRep: TfrmBaseRep;

implementation

uses
  prConst, prFun, fMessageDlg, ssBaseConst, ssStrUtil, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmBaseRep.aPrintExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRep.aPrintExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrOk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseRep.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRep.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    btnUseLogo.Hint := GetRS('fmPriceList', 'UseLogo');
    aPrint.Hint := GetRS('fmAllReports', 'ShowRep');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseRep.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRep.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseRep.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRep.FormDestroy') else _udebug := nil;{$ENDIF}

  inherited;

  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseRep.ShowRep(const AName: string);
  var
    S: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRep.ShowRep') else _udebug := nil;{$ENDIF}

  S := RepDir + AName;
  with frReport1 do begin
    if LoadFromFile(S)
      then ShowReport
      else ssMessageDlg(LangMan.GetRS('fmAllReports', 'RepNotFound') + ' "' + s + '"', ssmtError, [ssmbOK]);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseRep.SetRepID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRep.SetRepID') else _udebug := nil;{$ENDIF}

  FRepID := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseRep.WriteNode(ANode: TdxTreeListNode);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRep.WriteNode') else _udebug := nil;{$ENDIF}

  case RepID of
    7:begin
      cdsMaster.Append;
      cdsMaster.FieldByName('matid').AsInteger := ANode.Values[colMatId.Index];
      cdsMaster.FieldByName('grpid').AsInteger := ANode.Values[colGrpId.Index];

      if ANode.Values[colMatId.Index] < 0
        then  cdsMaster.FieldByName('matname').AsString := GetSpace(ANode.Level) + ANode.Values[colMatName.Index]
        else cdsMaster.FieldByName('matname').AsString := ANode.Values[colMatName.Index];

      cdsMaster.FieldByName('msrname').AsString := ANode.Values[colMsrName.Index];
      cdsMaster.FieldByName('artikul').AsString := ANode.Values[colArtikul.Index];
      cdsMaster.FieldByName('producer').AsString := ANode.Values[colProducer.Index];

      {$IFDEF CBL}
      cdsMaster.FieldByName('gtd').AsString := VarToStr(ANode.Values[colGTD.Index]);
      cdsMaster.FieldByName('notes').AsString := VarToStr(ANode.Values[colNotes.Index]);
      cdsMaster.FieldByName('certnum').AsString := VarToStr(ANode.Values[colCertNum.Index]);

      if not VarIsNull(ANode.Values[colPosDate.Index]) then cdsMaster.FieldByName('posdate').AsString := DateToStr(ANode.Values[colPosDate.Index]);

      cdsMaster.FieldByName('wrnum').AsString := VarToStr(ANode.Values[colWRNum.Index]);
      {$ENDIF}

      if ANode.Values[colAmount.Index] <> null then cdsMaster.FieldByName('rest').AsFloat := ssStrToFloat(ANode.Values[colAmount.Index]);

      if ANode.Values[colRsv.Index] <> null then cdsMaster.FieldByName('rsv').AsFloat := ssStrToFloat(ANode.Values[colRsv.Index]);

      if ANode.Values[colPrib.Index] <> null then cdsMaster.FieldByName('accsum').AsFloat := ssStrToFloat(ANode.Values[colPrib.Index]);

      if ANode.Values[colSummdef.Index] <> null then cdsMaster.FieldByName('summrest').AsFloat := ssStrToFloat(ANode.Values[colSummdef.Index]);

      cdsMaster.FieldByName('del').AsInteger := 0;
      cdsMaster.Post;
    end;//7

    20: begin
          cdsMaster.Append;
          cdsMaster.FieldByName('svcid').AsInteger := ANode.Values[colMatId.Index];
          cdsMaster.FieldByName('pid').AsInteger := ANode.Values[colGrpId.Index];

          if ANode.Values[colMatId.Index] < 0
            then cdsMaster.FieldByName('svcname').AsString := GetSpace(ANode.Level) + ANode.Values[colMatName.Index]
            else cdsMaster.FieldByName('svcname').AsString := ANode.Values[colMatName.Index];

          cdsMaster.FieldByName('msrname').AsString := ANode.Values[colMsrName.Index];

          if not VarIsNull(ANode.Values[colAmount.Index])
            then cdsMaster.FieldByName('amountout').AsFloat := ssStrToFloat(ANode.Values[colAmount.Index]);

          if not VarIsNull(ANode.Values[colSummdef.Index])
            then cdsMaster.FieldByName('summout').AsFloat := ssStrToFloat(ANode.Values[colSummdef.Index]);

          cdsMaster.FieldByName('del').AsInteger := 0;
          cdsMaster.Post;
        end;

    12, 13, 17:
        begin
          cdsMaster.Append;
          cdsMaster.FieldByName('matid').AsInteger := ANode.Values[colMatId.Index];
          cdsMaster.FieldByName('grpid').AsInteger := ANode.Values[colGrpId.Index];

          if ANode.Values[colMatId.Index] < 0
            then cdsMaster.FieldByName('matname').AsString := GetSpace(ANode.Level) + ANode.Values[colMatName.Index]
            else cdsMaster.FieldByName('matname').AsString := ANode.Values[colMatName.Index];

          cdsMaster.FieldByName('msrname').AsString := ANode.Values[colMsrName.Index];

          if not VarIsNull(ANode.Values[colAmount.Index])
            then cdsMaster.FieldByName('amountout').AsFloat := ssStrToFloat(ANode.Values[colAmount.Index]);

          if not VarIsNull(ANode.Values[colSummdef.Index])
            then cdsMaster.FieldByName('summout').AsFloat := ssStrToFloat(ANode.Values[colSummdef.Index]);

          if not VarIsNull(ANode.Values[colSummIn.Index])
            then cdsMaster.FieldByName('summin').AsFloat := ssStrToFloat(ANode.Values[colSummIn.Index]);

          if not VarIsNull(ANode.Values[colNDSIn.Index])
            then cdsMaster.FieldByName('ndsin').AsFloat := ssStrToFloat(ANode.Values[colNDSIn.Index]);

          if not VarIsNull(ANode.Values[colNdsOut.Index])
            then cdsMaster.FieldByName('ndsout').AsFloat := ssStrToFloat(ANode.Values[colNdsOut.Index]);

          if not VarIsNull(ANode.Values[colNdsDif.Index])
            then cdsMaster.FieldByName('ndsdif').AsFloat := ssStrToFloat(ANode.Values[colNdsDif.Index]);

          if not VarIsNull(ANode.Values[colPrib.Index])
            then cdsMaster.FieldByName('prib').AsFloat := ssStrToFloat(ANode.Values[colPrib.Index]);

          if not VarIsNull(ANode.Values[colKoef.Index])
            then cdsMaster.FieldByName('koef').AsFloat := ssStrToFloat(ANode.Values[colKoef.Index]);

          if not VarIsNull(ANode.Values[colArtikul.Index])
            then cdsMaster.FieldByName('artikul').AsString := VarToStr(ANode.Values[colArtikul.Index]);

          if not VarIsNull(ANode.Values[colProducer.Index])
            then cdsMaster.FieldByName('producer').AsString := VarToStr(ANode.Values[colProducer.Index]);

          cdsMaster.FieldByName('del').AsInteger := 0;
          cdsMaster.Post;
        end;
  end;

  if ANode.Count > 0 then
    for i := 0 to ANode.Count - 1 do WriteNode(ANode.Items[i]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmBaseRep.HasMat(ANode: TdxTreeListNode): Boolean;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
Begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRep.HasMat') else _udebug := nil;{$ENDIF}

  Result := False;

  if ANode.Values[colMatId.Index] > 0
  then Result := True
  else begin
    if ANode.Count > 0 then begin
      for i := 0 to ANode.Count - 1 do begin
        if HasMat(ANode.Items[i]) then begin
          SetDel0(ANode.Items[i]);
          Result := True;
        end;
      end;
    end//if ANode.Count>0
    else Result := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseRep.SetDel0(ANode: TdxTreeListNode);
  var
    FName: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRep.SetDel0') else _udebug := nil;{$ENDIF}

  case RepID of
    20: FName := 'svcid'
    else FName := 'matid';
  end;

  if (ANode.Values[colMatId.Index] < 0) and cdsMaster.Locate(FName, ANode.Values[colMatId.Index], [])
  then begin
    cdsMaster.Edit;
    cdsMaster.FieldByName('del').AsInteger := 0;
    cdsMaster.Post;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseRep.frReport1GetValue(const ParName: String; var ParValue: Variant);
  var
    na: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRep.frReport1GetValue') else _udebug := nil;{$ENDIF}

  na := RS('Common', 'NA');

  try
    if 0 = AnsiCompareText(ParName, 'fromdate') then begin
      if FromDate <> MinDateTime
        then ParValue := DateToStr(FromDate)
        else ParValue := '__________';
    end
    else if 0 = AnsiCompareText(ParName, 'todate') then begin
      if ToDate <> MaxDateTime
        then ParValue := DateToStr(ToDate)
        else ParValue := '__________';
    end
    else if 0 = AnsiCompareText(ParName, 'PriceDisplayFormatEx')
         then ParValue := PriceDisplayFormatEx
    else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
    else if 0 = AnsiCompareText(ParName, 'BaseCurrID') then ParValue := BaseCurrID
    else if 0 = AnsiCompareText(ParName, 'BaseCurrName') then ParValue := BaseCurrName
    else if 0 = AnsiCompareText(ParName, 'CLGRPCOLOR') then ParValue := PLGrpColor
    else if 0 = AnsiCompareText(ParName, 'showp') then ParValue := ShowPrices
    else if 0 = AnsiCompareText(ParName, 'showb') then ParValue := ShowBallance
    else if 0 = AnsiCompareText(ParName, 'noaccess') then ParValue := na
    else if not ShowPrices and ((0 = AnsiCompareText(ParName, 'pricedef')) or (0 = AnsiCompareText(ParName, 'pricein')))
         then ParValue := na
    else if 0 = AnsiCompareText(ParName, 'summ') then begin
      if ShowPrices
        then ParValue := cdsMaster.FieldByName('summ').AsFloat
        else ParValue := na;
    end;

  except
    ParValue := '!ERR!';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseRep.frReport1BeforePrint(Memo: TStringList; View: TfrView);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRep.frReport1BeforePrint') else _udebug := nil;{$ENDIF}

  if (View.Name = 'EntLogo') and btnUseLogo.Checked and (EntLogo.Size > 0) then begin
    EntLogo.Position := 0;
    TfrPictureView(View).Picture.Bitmap.LoadFromStream(EntLogo);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseRep.CtrlEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRep.CtrlEnter') else _udebug := nil;{$ENDIF}

  FCurCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseRep.CtrlExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRep.CtrlExit') else _udebug := nil;{$ENDIF}

  FCurCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('BaseRep', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end. 
