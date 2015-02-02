{$I ok_sklad.inc}
unit fTaxWB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWBDoc, dxExEdtr6, DB, ssDataSource, DBClient,
  ssClientDataSet, TB2Item, Menus, ActnList, dxInspRw, dxInspct, dxCntner6,
  cxPC, cxDropDownEdit, ssDBLookupCombo, cxImageComboBox,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxCalendar,
  ssSpeedButton, StdCtrls, dxDBGrid6, dxTL6, dxDBCtrl6, dxDBTLCl6, dxGrClms6,
  prTypes, ssBevel, ExtCtrls, ssDBGrid, ssPeriod, okPeriod,
  ssMemDS, dxExEdtr, dxCntner;

type
  TfmTaxWB = class(TfmBaseWBDoc)
    cdsDetailsumm: TFloatField;
    cdsMainADDCHARGES: TFloatField;
    cdsMainCHECKED: TIntegerField;
    cdsMainCONDITION: TStringField;
    cdsMainDEFNUM: TIntegerField;
    cdsMainDELETED: TIntegerField;
    cdsMainDISCOUNT: TFloatField;
    cdsMaindocid: TIntegerField;
    cdsMainEMAIL: TStringField;
    cdsMainFAX: TStringField;
    cdsMainFORM: TStringField;
    cdsMainIMGINDEX: TIntegerField;
    cdsMainKAADDRESS: TStringField;
    cdsMainKACERTNUM: TStringField;
    cdsMainKACITY: TStringField;
    cdsMainKACOUNTRY: TStringField;
    cdsMainKADISTRICT: TStringField;
    cdsMainKAFULLNAME: TStringField;
    cdsMainKAID: TIntegerField;
    cdsMainKAINN: TStringField;
    cdsMainKANAME: TStringField;
    cdsMainKANDSPAYER: TIntegerField;
    cdsMainKAPHONE: TStringField;
    cdsMainKAPOSTINDEX: TStringField;
    cdsMainKATYPE: TIntegerField;
    cdsMainNDS: TFloatField;
    cdsMainNUM: TStringField;
    cdsMainnumex: TIntegerField;
    cdsMainONDATE: TDateTimeField;
    cdsMainPERSONID: TIntegerField;
    cdsMainPERSONNAME: TStringField;
    cdsMainSUMMALL: TFloatField;
    cdsMainTWBID: TIntegerField;
    cdsMainWWW: TStringField;
    colNumEx: TdxDBGridColumn;
    irForm: TdxInspectorTextRow;
    irKACertnum: TdxInspectorTextRow;
    irKAINN: TdxInspectorTextRow;
    irWhoCreate: TdxInspectorTextRow;
    TBItem7: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;

    procedure cdsDetailFetchAfterOpen(DataSet: TDataSet);
    procedure cdsDetailCalcFields(DataSet: TDataSet);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure cdsRelAfterOpen(DataSet: TDataSet);
    procedure cdsRelBeforeOpen(DataSet: TDataSet);
    procedure colNDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);

  protected
     procedure GetSummAll; override;
     procedure RefreshDetail; override;

  public
    procedure DoOpen(AParam: Variant); override;
    procedure DoCheck(EditRequest: Boolean); override;
    procedure DoPrint(AParam: integer = 0); override;
    procedure UpdateActionList; override;
    procedure SetCaptions; override;
    procedure DoDelete; override;
  end;

var
  fmTaxWB: TfmTaxWB;

implementation

uses
  ssDateUtils, ClientData, fMessageDlg, prFun, prConst, StrUtils,
  ssCallbackConst, BaseFrame, EditTaxWB, prRep, ssBaseConst,
  ssStrUtil, BaseRef, ssFun, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfmTaxWB.DoDelete;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.DoDelete') else _udebug := nil;{$ENDIF}

  if mrYes = ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo])
  then
    with newDataSet do
    try
      Application.ProcessMessages;

      TrStart;

      try
        if not DeleteData(dmData.SConnection, 'taxwb', cdsMain.fieldbyname(_ID_).AsInteger)
          then raise Exception.Create(rs('Common', 'DeleteError'));

        if not DelToRecycleBin
          then TrCommit
          else begin
            TrRollback;

            if not AddToRecycleBin(dmData.SConnection, Self.ClassName, cdsMain.fieldbyname(_ID_).AsInteger,
                                   GetDelStr(cdsMain.fieldbyname(_ID_).AsInteger), false, Self.FunID)
            then begin
              ssMessageDlg(rs('Common', 'ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
              {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
              Exit;
            end;
          end;

         DoRefresh(0);
         UpdateActionList;

      except
        on e:exception do begin
          TrRollback;
          ssMessageDlg(rs('Common', 'NoDelete'), ssmtError, [ssmbOk]);
        end;
      end;

    finally
      Free;
    end;

  SendMessage(ParentHandle, WM_REFRESHBIN, 0, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfmTaxWB.cdsMainBeforeOpen(DataSet: TDataSet);
  var
    M: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  M := '';
  with cdsMain do begin
    if (lcbKAgent.KeyValue <> lcbKAgent.EmptyValue) and panFilter.Visible
      then M := M + ' and twb.kaid=' + IntToStr(lcbKAgent.KeyValue);

    if cbChecked.EditValue = 1
      then M := M + ' and twb.checked=1'
      else if cbChecked.EditValue = 2 then M := M + ' and twb.checked=0';

    Macros.ParamByName('m').AsString := M;
    //Params.ParamByName('wtype').AsInteger := 1;

    if panFilter.Visible
      then Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate
      else Params.ParamByName('fromdate').AsDateTime := 0;

    if panFilter.Visible
      then Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate)
      else Params.ParamByName('todate').AsDateTime := MaxDateTime;
  end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.DoCheck(EditRequest: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.DoCheck') else _udebug := nil;{$ENDIF}

  with newDataSet do
    try
      if grdMain.FocusedNode.Values[colChecked.Index] = 0 then begin
        if ssMessageDlg(rs('Common', 'CheckConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes then begin
          Application.ProcessMessages;

          TrStart;

          try
            //5)Запись в CHECKED=1
            ProviderName := 'pTaxWBCheck_Set1';
            FetchParams;
            Params.ParamByName('TWBID').AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;
            Execute;
            TrCommit;
            DoRefresh(0);
            UpdateActionList;

          except
            on E: Exception do begin
              TrRollback;
              ssMessageDlg(E.Message, ssmtError, [ssmbOk]);
            end;
          end;
        end;
      end
      else begin
        Close;

        if mrYes = ssMessageDlg(rs('Common', ifThen(EditRequest, 'PostedEditConfirm', 'UncheckConfirm')), ssmtWarning, [ssmbYes, ssmbNo])
        then begin
          Application.ProcessMessages;

          TrStart;

          try
            //3)Запись в CHECKED=0
            ProviderName := 'pTaxWBCheck_Set0';
            FetchParams;
            Params.ParamByName('TWBID').AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;
            Execute;
            TrCommit;
            DoRefresh(0);
            UpdateActionList;

          except
            on E: Exception do begin
              TrRollback;
              MessageDlg(E.Message, mtError, [mbOk], 0);
            end;
          end;
        end;
      end;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.DoOpen') else _udebug := nil;{$ENDIF}

  _ID_ := 'twbid';
  RefType := prTypes.rtTaxWB;
  EditingClass := TfrmEditTaxWB;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.UpdateActionList') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.DoPrint(AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.DoPrint') else _udebug := nil;{$ENDIF}

  xRep.ShowRep(rtTaxWB, cdsMain.FieldByName(_ID_).AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    Self.Caption := GetRS('fmWaybill' ,'TitleWaybill');
    FindList.Clear;
    FindList.AddObject(GetRS('fmWaybill', 'FiltNum') + ';' + 'num', pointer(1));
    FindList.AddObject(GetRS('fmWaybill', 'FiltDate') + ';' + 'ondate', pointer(2));
    FindList.AddObject(GetRS('fmWaybill', 'FiltKAIn') + ';' + 'kaname', pointer(3));

    inherited;

    irKACertnum.Caption := GetRS('fmWaybill', 'CertNum');
    irKAINN.Caption := GetRS('fmWaybill', 'INN');
    irWhoCreate.Caption := GetRS('fmWaybill', 'WhoCreate');
    irForm.Caption := GetRS('fmWaybill', 'PayForm');

    colNDS.Caption := GetRS('fmWaybill', 'NDS');
    colPriceWONDS.Caption := GetRS('fmWaybill', 'Price') + ' ' +GetRS('fmWaybill', 'outNDS');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  try
    with cdsMain do begin
      FCurrRate := 1;
      //CurKurs := 1;

      if not IsEmpty then begin
        irNum.Text := FieldByName('num').AsString + rs('fmWaybill', 'From',3) +
            ssDateToStr(FieldByName('ondate').AsDateTime) + ' ' +
            TimeToStr(FieldByName('ondate').AsDateTime);

        irKAgent.Text := FieldByName('kaname').AsString;
        irKAFullName.Text := FieldByName('kafullname').AsString;
        irKAPhone.Text := FieldByName('kaphone').AsString;
        irFax.Text := FieldByName('fax').AsString;

        if trim(FieldByName('email').AsString)<>''
          then irEmail.Text := 'mailto:'+FieldByName('email').AsString
          else irEmail.Text := '';

        irWWW.Text := FieldByName('www').AsString;

        //Запись адреса контрагента одной строкой
        irKAAdress.Text := FieldByName('kapostindex').AsString;

        if (trim(irKAAdress.Text)<>'') and (trim(FieldByName('kacountry').AsString)<>'')
          then irKAAdress.Text := FieldByName('kacountry').AsString+', '+irKAAdress.Text
          else irKAAdress.Text := FieldByName('kacountry').AsString+irKAAdress.Text;

        if (trim(irKAAdress.Text)<>'') and (trim(FieldByName('kadistrict').AsString)<>'')
          then irKAAdress.Text := FieldByName('kadistrict').AsString+', '+irKAAdress.Text
          else irKAAdress.Text := FieldByName('kadistrict').AsString+irKAAdress.Text;

        if (trim(irKAAdress.Text)<>'') and (trim(FieldByName('kacity').AsString)<>'')
          then irKAAdress.Text := FieldByName('kacity').AsString+', '+irKAAdress.Text
          else irKAAdress.Text := FieldByName('kacity').AsString+irKAAdress.Text;

        if (trim(irKAAdress.Text)<>'') and (trim(FieldByName('kaaddress').AsString)<>'')
          then irKAAdress.Text := FieldByName('kaaddress').AsString+', '+irKAAdress.Text
          else irKAAdress.Text := FieldByName('kaaddress').AsString+irKAAdress.Text;

        irKAINN.Text := FieldByName('kainn').AsString;
        irKACertnum.Text := FieldByName('kacertnum').AsString;

        irCurr.Text := FormatFloat(MoneyDisplayFormat,FieldByName('summall').AsCurrency) + ' ' + BaseCurrName;


        irReason.Text := FieldByName('condition').AsString;
        irForm.Text := FieldByName('form').AsString;
        irWhoCreate.Text := FieldByName('personname').AsString;

        if FieldByName('checked').AsInteger = 1
          then irStatus.Text := rs('fmWaybill', 'DocChecked')
          else irStatus.Text := rs('fmWaybill', 'DocUnChecked');

      end
      else begin
        irNum.Text := '';
        irKAINN.Text := '';
        irKACertnum.Text := '';
        irKAgent.Text := '';
        irForm.Text := '';
        irWhoCreate.Text := '';
        irKAPhone.Text := '';
        irKAFullName.Text := '';
        irKAAdress.Text := '';
        irCurr.Text := '';
        irReason.Text := '';
        irFax.Text := '';
        irEmail.Text := '';
        irWWW.Text := '';
        irStatus.Text := '';
        //irPayment.Text := '';
      end;
    end;//with cdsMain

    with cdsDetailFetch do begin
      Close;
      FetchParams;
      Params.ParamByName('twbid').AsInteger := cdsMain.FieldByName(_ID_).AsInteger;
      Open;
    end;//with

    GetSummAll;

  finally
    Screen.Cursor := crDefault;
  end;

  FrameResize(Self);
  DSRefresh(cdsRel, 'docid', 0);
  //inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.cdsDetailFetchAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.cdsDetailFetchAfterOpen') else _udebug := nil;{$ENDIF}

  CopyDataSet(cdsDetail, cdsDetailfetch);
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.cdsDetailCalcFields(DataSet: TDataSet);
  var
    SummOutNDS, SummNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.cdsDetailCalcFields') else _udebug := nil;{$ENDIF}

  DataSet.FieldByName('pricewonds').AsFloat :=
    RoundToA(NDSOut(DataSet.FieldByName('price').AsFloat,
    cdsMain.fieldbyname('NDS').AsFloat), RoundPrice);

  DataSet.FieldByName('nds').AsFloat := DataSet.FieldByName('price').AsFloat -
    DataSet.FieldByName('pricewonds').AsFloat;

  NDSCalc(DataSet.FieldByName('amount').AsFloat, DataSet.FieldByName('price').AsFloat,
      cdsMain.fieldbyname('NDS').AsFloat, 1, SummOutNDS, SummNDS);

  DataSet.FieldByName('summ').AsFloat := SummOutNDS + SummNDS;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.colNumGetText') else _udebug := nil;{$ENDIF}

  AText := ANode.Values[colNumEx.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.cdsMainCalcFields(DataSet: TDataSet);
  var
    FNum: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.cdsMainCalcFields') else _udebug := nil;{$ENDIF}

  try
    FNum := DataSet.FieldByName('num').AsString;

    if Pos(TaxPrefix, FNum) = 1
      then DataSet.FieldByName('numex').AsInteger :=
        StrToInt(Trim(Copy(FNum, Length(TaxPrefix) + 1, Length(FNum) -
        Length(TaxPrefix) - Length(TaxSuffix))))
      else DataSet.FieldByName('numex').AsInteger := StrToInt(FNum);

  except
    DataSet.FieldByName('numex').AsInteger := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.cdsRelBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.cdsRelBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsRel.Params.ParamByName('docid').AsInteger := cdsMain.FieldByName('docid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.cdsRelAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.cdsRelAfterOpen') else _udebug := nil;{$ENDIF}

  inherited;

  AdjustGrid(grdDocRel, colDRTypeName);
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.grdDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'DocTaxWB');
  ImgList := dmData.Images;
  AIndex := II_TaxWB;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.colNDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.colNDSGetText') else _udebug := nil;{$ENDIF}

  AText := cdsMain.FieldByName('nds').AsString + ' %';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.RefreshDetail;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.RefreshDetail') else _udebug := nil;{$ENDIF}

  if pcMain.ActivePage.Tag = 1 then begin
    if pcMain.ActivePage = tsInfo then begin
      DSRefresh(cdsDetail, 'posid', 0);
      grdDetNeedAdjust(grdDet);
    end
    else if pcMain.ActivePage = tsPositions then begin
      DSRefresh(cdsDetail, 'posid', 0);
      grdDetNeedAdjust(grdDet);
      GetSummAll;
    end
    else if pcMain.ActivePage = tsDocRel then begin
      if tsDocRel.TabVisible then DSRefresh(cdsRel, 'docid', 0);
      AdjustGrid(grdDocRel, colDRTypeName);
    end;

    pcMain.ActivePage.Tag := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.GetSummAll;
  var
    i:integer;
    PriceOutNDS, PriceNDS, SummOutNDS,SummNDS,Summ,
    AllSumm, AllSummOutNDS, AllSummNDS,
    AddChargesNDS, AddChargesOutNDS, {Discount,} DiscountNDS, DiscountOutNDS :Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.GetSummAll') else _udebug := nil;{$ENDIF}

  with grdDet do begin
    AllSumm := 0;
    AllSummOutNDS := 0;
    AllSummNDS := 0;
    AllSumm := 0;

    for i := 0 to Count-1 do begin
      try
        PriceOutNDS := RoundToA(NDSOut(ssStrToFloat(Items[i].Values[colPrice.Index]), cdsMain.FieldByName('NDS').AsFloat),RoundPrice);

        PriceNDS := RoundToA(ssStrToFloat(Items[i].Values[colPrice.Index]) - PriceOutNDS, RoundPrice);

        NDSCalc(ssStrToFloat(Items[i].Values[colAmount.Index]), ssStrToFloat(Items[i].Values[colPrice.Index]),
                cdsMain.FieldByName('NDS').AsFloat, 1,SummOutNDS,SummNDS);

        Summ := SummOutNDS+SummNDS;  //Сумма c НДС
        AllSumm := AllSumm+Summ;
        AllSummOutNDS := AllSummOutNDS+SummOutNDS;
        AllSummNDS := AllSummNDS+SummNDS;
        Items[i].Values[colSummDefWONDS.Index] := Summ - RoundToA(SummNDS, -2);
        Items[i].Values[colDetNDS.Index] := RoundToA(SummNDS, -2);

        NDSCalc(1, ssStrToFloat(Items[i].Values[colPrice.Index]) * FCurrRate,
          cdsMain.FieldByName('nds').AsFloat, 1, SummOutNDS, SummNDS);

        Items[i].Values[colPrice.Index] := RoundToA(SummOutNDS + SummNDS, -2);
        Items[i].Values[colPriceWONDS.Index] := RoundToA(SummOutNDS + SummNDS, -2) - RoundToA(SummNDS, -2);

      except
        Items[i].Values[colSummCurr.Index] := -1;
        Items[i].Values[colPriceWONDS.Index] := -1;
        Items[i].Values[colPrice.Index] := -1;
      end;
    end;

    if cdsMain.FieldByName('discount').AsFloat>0 then begin
      DiscountNDS := AllSummNDS/100*cdsMain.FieldByName('discount').AsFloat;
      DiscountOutNDS := AllSummOutNDS/100*cdsMain.FieldByName('discount').AsFloat;
      AllSummOutNDS := RoundtoA(AllSummOutNDS+DiscountOutNDS,-2);
      AllSummNDS := RoundtoA(AllSummNDS+DiscountNDS,-2);
      AllSumm := AllSummOutNDS+AllSummNDS;
    end;//if

    if cdsMain.FieldByName('discount').AsFloat<0 then begin
      DiscountNDS := AllSummNDS/100*(-1*cdsMain.FieldByName('discount').AsFloat);
      DiscountOutNDS := AllSummOutNDS/100*(-1*cdsMain.FieldByName('discount').AsFloat);
      AllSummOutNDS := RoundtoA(AllSummOutNDS-DiscountOutNDS,-2);
      AllSummNDS := RoundtoA(AllSummNDS-DiscountNDS,-2);
      AllSumm := AllSummOutNDS+AllSummNDS;
    end;

    try
      try
        if cdsMain.FieldByName('ADDCHARGES').AsFloat>0 then begin
          NDSCalc(1, cdsMain.FieldByName('ADDCHARGES').AsFloat, cdsMain.FieldByName('NDS').AsFloat, 1,AddChargesOutNDS,AddChargesNDS);
          AllSummOutNDS := RoundtoA(AllSummOutNDS+AddChargesOutNDS,-2);
          AllSummNDS := RoundtoA(AllSummNDS+AddChargesNDS,-2);
          AllSumm := AllSummOutNDS+AllSummNDS;
        end;

      except
      end;

    finally
      stSummDefNoNDS.Caption := formatfloat(MoneyDisplayFormat, AllSummOutNDS);
      stSummDefNDS.Caption := formatfloat(MoneyDisplayFormat,AllSummNDS);
      stSummDef.Caption := formatfloat(MoneyDisplayFormat, AllSumm);
    end;
  end;//with dbgWaybillDet do

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxWB.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxWB.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}
    
  AText := rs('frmOptions', 'TaxWB');
  ImgList := dmData.Images;
  AIndex := II_TaxWB;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fTaxWB', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
