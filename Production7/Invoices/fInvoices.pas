{$I ok_sklad.inc}
unit fInvoices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWBDoc, dxExEdtr6, DB, ssDataSource, DBClient,
  ssClientDataSet, TB2Item, Menus, ActnList, dxInspRw, dxInspct, dxCntner6,
  cxPC, cxDropDownEdit, ssDBLookupCombo, cxImageComboBox,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxCalendar,
  ssSpeedButton, StdCtrls, dxDBGrid6, dxTL6, dxDBCtrl6, dxDBTLCl6, dxGrClms6,
  prTypes, ssBevel, ExtCtrls, ssDBGrid, okClasses, ssPeriod, okPeriod,
  ssMemDS, dxExEdtr, dxCntner;

type
  TfmInvoices = class(TfmBaseWBDoc)
    cdsDetailCOUNTRY: TStringField;
    cdsDetailGRPID: TIntegerField;
    cdsDetailGTD: TStringField;
    cdsDetailNORM: TFloatField;
    cdsDetailPOSTYPE: TIntegerField;
    cdsDetailsumm: TFloatField;
    cdsDetailTAX: TStringField;
    cdsMainCHECKED: TIntegerField;
    cdsMainCURRID: TIntegerField;
    cdsMainDEFNUM: TIntegerField;
    cdsMainDELETED: TIntegerField;
    cdsMainDOCID: TIntegerField;
    cdsMainENTADDRID: TIntegerField;
    cdsMainENTID: TIntegerField;
    cdsMainENTINN: TStringField;
    cdsMainENTKPP: TStringField;
    cdsMainENTNAME: TStringField;
    cdsMainKAADDRID: TIntegerField;
    cdsMainKAID: TIntegerField;
    cdsMainKAINN: TStringField;
    cdsMainKAKPP: TStringField;
    cdsMainKANAME: TStringField;
    cdsMainNOTES: TStringField;
    cdsMainNUM: TStringField;
    cdsMainnumex: TIntegerField;
    cdsMainONDATE: TDateTimeField;
    cdsMainSHIPENTADDRID: TIntegerField;
    cdsMainSHIPENTID: TIntegerField;
    cdsMainSHIPENTINN: TStringField;
    cdsMainSHIPENTKPP: TStringField;
    cdsMainSHIPENTNAME: TStringField;
    cdsMainSHIPKAADDRID: TIntegerField;
    cdsMainSHIPKAID: TIntegerField;
    cdsMainSHIPKAINN: TStringField;
    cdsMainSHIPKAKPP: TStringField;
    cdsMainSHIPKANAME: TStringField;
    cdsMainSUMMALL: TFloatField;
    cdsMainWBILLID: TIntegerField;
    cdsMainWTYPE: TIntegerField;
    colCountry: TdxDBGridColumn;
    colNumEx: TdxDBGridColumn;
    colType: TdxDBGridImageColumn;
    irEnt: TdxInspectorTextRow;
    irEntAddr: TdxInspectorTextRow;
    irEntFullName: TdxInspectorTextRow;
    irEntINN: TdxInspectorTextRow;
    irEntKPP: TdxInspectorTextRow;
    irForm: TdxInspectorTextRow;
    irKACertnum: TdxInspectorTextRow;
    irKAINN: TdxInspectorTextRow;
    irKPP: TdxInspectorTextRow;
    irShipEnt: TdxInspectorTextRow;
    irShipEntAddr: TdxInspectorTextRow;
    irShipEntFullName: TdxInspectorTextRow;
    irShipEntINN: TdxInspectorTextRow;
    irShipEntKPP: TdxInspectorTextRow;
    irShipKA: TdxInspectorTextRow;
    irShipKAAddr: TdxInspectorTextRow;
    irShipKAFullName: TdxInspectorTextRow;
    irShipKAINN: TdxInspectorTextRow;
    irShipKAKPP: TdxInspectorTextRow;
    irWhoCreate: TdxInspectorTextRow;
    kaInfo: TokKAgent;

    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);
    procedure cdsDetailFetchAfterOpen(DataSet: TDataSet);
    procedure cdsDetailCalcFields(DataSet: TDataSet);
    procedure colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure cdsRelAfterOpen(DataSet: TDataSet);
    procedure grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure colNDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure pmDetPopup(Sender: TObject);

  private
    procedure GetTaxes;

  protected
    procedure TaxGSAll;
    procedure RefreshDetail; override;
    procedure RefreshKAInfo;
    procedure GetSummAll; override;
    procedure RealignControls; override;

  public
    procedure DoOpen(AParam: Variant); override;
    procedure DoCheck(EditRequest: Boolean); override;
    procedure DoCopy; override;
    procedure DoExcel(Grid: TdxDBGrid); override;
    procedure DoPrint(AParam: integer = 0); override;
    procedure UpdateActionList; override;
    procedure SetCaptions; override;
    procedure DoDelete; override;
    procedure NotifyChanged; override;
  end;

var
  fmInvoices: TfmInvoices;

//==============================================================================================
implementation

uses
  ssDateUtils, ClientData, fMessageDlg, prFun, prConst,
  ssCallbackConst, BaseFrame, prRep, ssBaseConst, BaseRef, ssFun, EditInvoice,
  ssStrUtil, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//Функция подсчёта итоговых сумм
//==============================================================================================
procedure TfmInvoices.TaxGSAll;
  (*var i:integer;
    PriceOutNDS, PriceNDS, SummOutNDS,SummNDS,Summ,
    AllSumm, AllSummOutNDS, AllSummNDS,
    AddChargesNDS, AddChargesOutNDS, {Discount,} DiscountNDS, DiscountOutNDS :Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.TaxGSAll') else _udebug := nil;{$ENDIF}

  with grdDet do begin
    AllSumm := 0;
    AllSummOutNDS := 0;
    AllSummNDS := 0;
    AllSumm := 0;
    for i := 0 to Count-1 do
    begin
      try
        PriceOutNDS := RoundToA(NDSOut(Items[i].Values[colPrice.Index],cdsMain.FieldByName('NDS').AsFloat),RoundPrice);
        PriceNDS := RoundToA(Items[i].Values[colPrice.Index]-PriceOutNDS,RoundPrice);
        NDSCalc(Items[i].Values[colAmount.Index],Items[i].Values[colPrice.Index],cdsMain.FieldByName('NDS').AsFloat, 1,SummOutNDS,SummNDS);
        Summ := SummOutNDS+SummNDS;  //Сумма c НДС
        AllSumm := AllSumm+Summ;
        AllSummOutNDS := AllSummOutNDS+SummOutNDS;
        AllSummNDS := AllSummNDS+SummNDS;
        Items[i].Values[colSummDefWONDS.Index] := Summ - RoundToA(SummNDS, -2);
        Items[i].Values[colDetNDS.Index] := RoundToA(SummNDS, -2);

        NDSCalc(1, Items[i].Values[colPrice.Index] * FCurrRate,
          cdsMain.FieldByName('nds').AsFloat, 1, SummOutNDS, SummNDS);
        Items[i].Values[colPrice.Index] := RoundToA(SummOutNDS + SummNDS, -2);
        Items[i].Values[colPriceWONDS.Index] := RoundToA(SummOutNDS + SummNDS, -2) -
          RoundToA(SummNDS, -2);
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
          NDSCalc(1,cdsMain.FieldByName('ADDCHARGES').AsFloat,cdsMain.FieldByName('NDS').AsFloat, 1,AddChargesOutNDS,AddChargesNDS);
          AllSummOutNDS := RoundtoA(AllSummOutNDS+AddChargesOutNDS,-2);
          AllSummNDS := RoundtoA(AllSummNDS+AddChargesNDS,-2);
          AllSumm := AllSummOutNDS+AllSummNDS;
        end;

      except
      end;

    finally
      stSummDefNoNDS.Caption := formatfloat(MoneyDisplayFormat, AllSummOutNDS);
  //stSummDefNoNDS.Hint := lSummDefNoNDS.Caption;
      stSummDefNDS.Caption := formatfloat(MoneyDisplayFormat,AllSummNDS);
  //stSummDefNDS.Hint := lSummDefNDS.Caption;
      stSummDef.Caption := formatfloat(MoneyDisplayFormat, AllSumm);
      //stSummDef.Hint := lSummDef.Caption;
    end;
  end;//with dbgWaybillDet do

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmInvoices.DoDelete;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.DoDelete') else _udebug := nil;{$ENDIF}

  if not GetUserAccessByClass(Self.ClassName, uaDelete) then begin
    ssMessageDlg(rs('Common', 'CantDelete'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes
  then
     with newDataSet do
     try
       Application.ProcessMessages;

       TrStart;

       try
         if not DeleteDataEx(dmData.SConnection, 'waybilllist', 'wbillid', cdsMain.fieldbyname(_ID_).AsInteger)
           then raise Exception.Create(rs('Common', 'DeleteError'));

         if not DelToRecycleBin
           then TrCommit
           else begin
             TrRollback;

             if not AddToRecycleBin(dmData.SConnection, Self.ClassName, cdsMain.fieldbyname(_ID_).AsInteger, GetDelStr(cdsMain.fieldbyname(_ID_).AsInteger), false, Self.FunID) then
             begin
               ssMessageDlg(rs('Common', 'ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
               {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
               Exit;
             end;
           end;

         LocateAfterDel;
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
procedure TfmInvoices.cdsMainBeforeOpen(DataSet: TDataSet);
  var
    M: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  M := '';
  with cdsMain do begin
    if (lcbKAgent.KeyValue <> lcbKAgent.EmptyValue) and panFilter.Visible
      then M := M + ' and wbl.kaid=' + IntToStr(lcbKAgent.KeyValue);

    if cbChecked.EditValue = 1
      then M := M + ' and wbl.checked=1'
      else if cbChecked.EditValue = 2 then M := M + ' and wbl.checked=0';

    Macros.ParamByName('m').AsString := M;

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
procedure TfmInvoices.DoCheck(EditRequest: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.DoCheck') else _udebug := nil;{$ENDIF}

  if not GetUserAccess(GetFuncID, uaPost) then begin
    ssMessageDlg(rs('Common', 'CantPost'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmInvoices.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.DoOpen') else _udebug := nil;{$ENDIF}

  GetTaxes;
  _ID_ := 'wbillid';
  RefType := rtInvoice;
  EditingClass := TfrmEditInvoice;

  inherited;

  colChecked.Visible := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.UpdateActionList') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.DoPrint(AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.DoPrint') else _udebug := nil;{$ENDIF}

  xRep.ShowRep(rtWBOutInvoice, cdsMain.FieldByName(_ID_).AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    Self.Caption := GetRS('fmInvoices', 'TitleInvoices');
    FindList.Clear;
    FindList.AddObject(GetRS('fmWaybill', 'FiltNum') + ';' + 'num', pointer(1));
    FindList.AddObject(GetRS('fmWaybill', 'FiltDate') + ';' + 'ondate', pointer(2));
    FindList.AddObject(GetRS('fmWaybill', 'FiltKAIn') + ';' + 'kaname', pointer(3));

    inherited;

    irKAgent.Caption := GetRS('fmInvoices', 'Customer');
    irKACertnum.Caption := GetRS('fmWaybill', 'CertNum');
    irKAINN.Caption := GetRS('fmWaybill', 'INN');
    irWhoCreate.Caption := GetRS('fmWaybill', 'WhoCreate');
    irForm.Caption := GetRS('fmWaybill', 'PayForm');

    irEnt.Caption := GetRS('fmKAgent', 'FullName');
    irEntAddr.Caption := GetRS('fmKAgent', 'Address');
    irEntFullName.Caption := GetRS('fmKAgent', 'FullName');
    irEntINN.Caption := GetRS('fmKAgent', 'INN');
    irEntKPP.Caption := GetRS('fmKAgent', 'KPP');

    irShipEnt.Caption := GetRS('fmInvoices', 'ShipEnt');
    irShipEntAddr.Caption := GetRS('fmKAgent', 'Address');
    irShipEntFullName.Caption := GetRS('fmKAgent', 'FullName');
    irShipEntINN.Caption := GetRS('fmKAgent', 'INN');
    irShipEntKPP.Caption := GetRS('fmKAgent', 'KPP');

    irShipKA.Caption := GetRS('fmInvoices', 'ShipKA');
    irShipKAAddr.Caption := GetRS('fmKAgent', 'Address');
    irShipKAFullName.Caption := GetRS('fmKAgent', 'FullName');
    irShipKAINN.Caption := GetRS('fmKAgent', 'INN');
    irShipKAKPP.Caption := GetRS('fmKAgent', 'KPP');
    irWhoCreate.Caption := GetRS('fmWaybill', 'WhoCreate');

    tsInfo.Caption := GetRS('fmInvoices', 'DocInfo');

    colNDS.Caption := GetRS('fmWaybill', 'NDS');
    colPriceWONDS.Caption := RS('fmWaybill', 'Price',1) + RS('fmWaybill', 'outNDS');
    colCountry.Caption := GetRS('fmInvoices', 'Country');
    colType.Caption := '';

    colCountry.Caption := GetRS('fmInvoices', 'Country');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  for i := 0 to pcMain.PageCount - 1 do pcMain.Pages[i].Tag := 1;

  try
    with cdsMain do begin
      FCurrRate := 1;
      //CurKurs := 1;

      if not IsEmpty then begin
        irNum.Text := FieldByName('num').AsString + RS('fmWaybill', 'From',3) +
          ssDateToStr(FieldByName('ondate').AsDateTime) + ' ' + TimeToStr(FieldByName('ondate').AsDateTime);

        irCurr.Text := FormatFloat(MoneyDisplayFormat,FieldByName('summall').AsCurrency) + ' ' + BaseCurrName;
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
      end;
    end;//with cdsTaxWB do begin

  finally
    Screen.Cursor := crDefault;
  end;

  RefreshDetail;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.cdsDetailFetchAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.cdsDetailFetchAfterOpen') else _udebug := nil;{$ENDIF}

  CopyDataSet(cdsDetail, cdsDetailFetch);
  
  UpdateActionList;
  GetSummAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.cdsDetailCalcFields(DataSet: TDataSet);
  var
    SummOutNDS, SummNDS: Extended;
    S, T, TaxID: string;
    i: Integer;
    TaxRate: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.cdsDetailCalcFields') else _udebug := nil;{$ENDIF}

  DataSet.FieldByName('pricewonds').AsFloat := RoundToA(NDSOut(DataSet.FieldByName('price').AsFloat,
      DataSet.fieldbyname('NDS').AsFloat), RoundPrice);

  {DataSet.FieldByName('nds').AsFloat := DataSet.FieldByName('price').AsFloat -
     DataSet.FieldByName('pricewonds').AsFloat;
  }

  NDSCalc(DataSet.FieldByName('amount').AsFloat, DataSet.FieldByName('price').AsFloat,
      DataSet.fieldbyname('NDS').AsFloat, 1, SummOutNDS, SummNDS);

  DataSet.FieldByName('summ').AsFloat := SummOutNDS + SummNDS;

  with DataSet do begin
    S := FieldByName('tax').AsString;

    if S <> '' then begin
      for i := 1 to WordCount(S, [';']) do begin
        T := ExtractWord(i, S, [';']);
        TaxID := Trim(ExtractWord(1, T, [',']));

        try
          TaxRate := StrToFloat(ReplaceStr(ExtractWord(2, T, [',']), '.', DecimalSeparator));
        except
          TaxRate := 0;
        end;

        if TaxRate > 0 then FieldByName('Tax' + TaxID).AsFloat := TaxRate;
      end;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.colNumGetText') else _udebug := nil;{$ENDIF}

  AText := ANode.Values[colNumEx.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.cdsMainCalcFields(DataSet: TDataSet);
  var
    FNum: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.cdsMainCalcFields') else _udebug := nil;{$ENDIF}

  try
    FNum := DataSet.FieldByName('num').AsString;

    if Pos(TaxPrefix, FNum) = 1
      then DataSet.FieldByName('numex').AsInteger :=
             StrToInt(Trim(Copy(FNum, Length(TaxPrefix) + 1, Length(FNum) - Length(TaxPrefix) - Length(TaxSuffix))))
      else DataSet.FieldByName('numex').AsInteger := StrToInt(FNum);

  except
    DataSet.FieldByName('numex').AsInteger := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.cdsRelAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.cdsRelAfterOpen') else _udebug := nil;{$ENDIF}

  AdjustGrid(grdDocRel, colDRTypeName);
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.grdDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := RS('fmWaybill', 'DocInvoice');
  ImgList := dmData.Images;
  AIndex := II_WBINVOICE;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.colNDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.colNDSGetText') else _udebug := nil;{$ENDIF}

  AText := AText + ' %';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.RefreshDetail;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.RefreshDetail') else _udebug := nil;{$ENDIF}

  if pcMain.ActivePage.Tag = 1 then begin
    if pcMain.ActivePage = tsInfo then begin
      //DSRefresh(cdsDetail, 'posid', 0);
      //grdDetNeedAdjust(grdDet);
      RefreshKAInfo;
    end
    else if pcMain.ActivePage = tsPositions then begin
      DSRefresh(cdsDetail, 'posid', 0);
      //grdDetNeedAdjust(grdDet);
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
procedure TfmInvoices.RefreshKAInfo;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.RefreshKAInfo') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  Application.ProcessMessages;

  try
    kaInfo.KAID := cdsMain.FieldByName('kaid').AsInteger;
    irKAgent.Text := kaInfo.Name_;
    irKAFullName.Text := kaInfo.FullName;
    irKAINN.Text := kaInfo.INN;
    irKPP.Text := kaInfo.KPP;

    kaInfo.AddrID := cdsMain.FieldByName('kaaddrid').AsInteger;
    if kaInfo.AddrID > 0
      then irKAAdress.Text := kaInfo.GetAddr
      else irKAAdress.Text := '';

    kaInfo.KAID := cdsMain.FieldByName('entid').AsInteger;
    irEnt.Text := kaInfo.Name_;
    irEntFullName.Text := kaInfo.FullName;
    irEntINN.Text := kaInfo.INN;
    irEntKPP.Text := kaInfo.KPP;

    kaInfo.AddrID := cdsMain.FieldByName('entaddrid').AsInteger;
    if kaInfo.AddrID > 0
      then irEntAddr.Text := kaInfo.GetAddr
      else irEntAddr.Text := '';

    kaInfo.KAID := cdsMain.FieldByName('shipentid').AsInteger;
    irShipEnt.Text := kaInfo.Name_;
    irShipEntFullName.Text := kaInfo.FullName;
    irShipEntINN.Text := kaInfo.INN;
    irShipEntKPP.Text := kaInfo.KPP;

    kaInfo.AddrID := cdsMain.FieldByName('shipentaddrid').AsInteger;
    if kaInfo.AddrID > 0
      then irShipEntAddr.Text := kaInfo.GetAddr
      else irShipEntAddr.Text := '';

    kaInfo.KAID := cdsMain.FieldByName('shipkaid').AsInteger;
    irShipKA.Text := kaInfo.Name_;
    irShipKAFullName.Text := kaInfo.FullName;
    irShipKAINN.Text := kaInfo.INN;
    irShipKAKPP.Text := kaInfo.KPP;

    kaInfo.AddrID := cdsMain.FieldByName('shipkaaddrid').AsInteger;
    if kaInfo.AddrID > 0
      then irShipKAAddr.Text := kaInfo.GetAddr
      else irShipKAAddr.Text := '';

  finally
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtDocs, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmInvoices', 'TitleInvoices');
  ImgList := dmData.Images;
  AIndex := II_WBINVOICE;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.GetSummAll;
  var
    i, j: Integer;
    PriceCurrOutNDS, SummCurrOutNDS, SummCurrNDS, SummCurr, SummTax, PosSummTax,
    PriceDefOutNDS, SummDefOutNDS, SummDefNDS, SummDef: Extended;
    AllSummCurr, AllSummDefOutNDS, AllSummDefNDS, AllSummDef, FAmount :Extended;
    FNorm: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.GetSummAll') else _udebug := nil;{$ENDIF}

  with grdDet do begin
    AllSummCurr := 0;
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;
    FAmount := 0;

    for i := 0 to Count - 1 do begin
      try
        FAmount := ssStrToFloat(Items[i].Values[colAmount.Index]);

        if cdsDetail.FindField('onvalue') <> nil
          then FCurrRate := ssStrToFloat(Items[i].Values[colRate.Index]);

        FNorm := 0;

        try
          if not VarIsNull(Items[i].Values[colNorm.Index])
            then FNorm := ssStrToFloat(Items[i].Values[colNorm.Index])
            else FNorm := 1;

        except
          FNorm := 0;
        end;

        if FNorm > 0 then FAmount := FNorm * FAmount;

        SummCurr := RoundToA(FAmount * ssStrToFloat(Items[i].Values[colPriceInCurr.Index]), -2);

        NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]),
          ssStrToFloat(Items[i].Values[colNDS.Index]), 1, SummDefOutNDS, SummDefNDS);

        SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
        SummDefOutNDS := SummDef - RoundToA(SummDefNDS, -2);
        PosSummTax := 0;

        for j := 0 to ColumnCount - 1 do begin
          if (Pos('colTax', Columns[j].Name) > 0)
             and (Pos('colTaxRate', Columns[j].Name) = 0)
             and (not VarIsNull(Items[i].Values[j]))
          then begin
            SummTax := RoundToA(SummDefOutNDS * ssStrToFloat(Items[i].Values[j]) / 100, -2);
            PosSummTax := PosSummTax + SummTax;
          end;
        end;

        Items[i].Values[colSummCurr.Index] := SummCurr + PosSummTax;
        AllSummCurr := AllSummCurr + SummCurr + PosSummTax;
      except
        Items[i].Values[colSummCurr.Index] := 0;
      end;

      try
        if FCurrRate > 0 then begin
          NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * FCurrRate,
            ssStrToFloat(Items[i].Values[colNDS.Index]), 1, SummDefOutNDS, SummDefNDS);

          SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
          SummDefOutNDS := SummDef - RoundToA(SummDefNDS, -2);

          PosSummTax := 0;
          for j := 0 to ColumnCount - 1 do begin
            if (Pos('colTax', Columns[j].Name) > 0) and
               (Pos('colTaxRate', Columns[j].Name) = 0) and
               (not VarIsNull(Items[i].Values[j]))
            then begin
              SummTax := RoundToA(SummDefOutNDS * ssStrToFloat(Items[i].Values[j]) / 100, -2);
              Items[i].Values[ColumnByName('colTaxRate' + Copy(Columns[j].Name, 7, Length(Columns[j].Name) - 6)).Index] := SummTax;
              PosSummTax := PosSummTax + SummTax;
            end;
          end;

          SummDef := SummDef + PosSummTax;

          AllSummDefOutNDS := AllSummDefOutNDS + SummDefOutNDS;
          AllSummDefNDS := AllSummDefNDS + RoundToA(SummDefNDS, -2);
          AllSummDef := AllSummDef + SummDef;
          Items[i].Values[colSummDef.Index] := SummDef;
          Items[i].Values[colSummDefWONDS.Index] := SummDefOutNDS;
          Items[i].Values[colDetNDS.Index] := RoundToA(SummDefNDS, -2);

          NDSCalc(1, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * FCurrRate,
            ssStrToFloat(Items[i].Values[colNDS.Index]), 1, SummDefOutNDS, SummDefNDS);

          Items[i].Values[colPrice.Index] := RoundToA(SummDefOutNDS + SummDefNDS, -2);
          Items[i].Values[colPriceWONDS.Index] := RoundToA(SummDefOutNDS + SummDefNDS, -2) - RoundToA(SummDefNDS, -2);
         end
         else Items[i].Values[colSummDef.Index] := 0;

      except
        Items[i].Values[colSummDef.Index] := 0;
      end;
    end;

    AllSummDef := RoundToA(AllSummDef, -2);

    stSummCurr.Caption := FormatFloat(MoneyDisplayFormat, AllSummCurr);
    stSummDefNoNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefOutNDS);
    stSummDefNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefNDS);
    stSummDef.Caption := FormatFloat(MoneyDisplayFormat, AllSummDef);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.GetTaxes;
  var
    ACol: TdxDBTreeListColumn;
    FField: TFloatField;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.GetTaxes') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pTaxes_List';
    Open;
    while not Eof do begin
      FField := TFloatField.Create(cdsDetail);
      FField.Name := 'fldTax' + FieldByName('taxid').AsString;
      FField.FieldKind := fkInternalCalc;
      FField.FieldName := 'Tax' + FieldByName('taxid').AsString;
      FField.DataSet := cdsDetail;

      ACol := grdDet.CreateColumnEx(TdxDBGridColumn, grdDet);
      ACol.Name := 'colTax' + FieldByName('taxid').AsString;
      ACol.FieldName := 'Tax' + FieldByName('taxid').AsString;
      ACol.Visible := False;
      ACol.Tag := 1;
      ACol.HeaderAlignment := taCenter;
      ACol.Caption := FieldByName('name').AsString + ', %';
      ACol.Width := 60;
      //ACol.OnGetText := colTaxGetText;

      FField := TFloatField.Create(cdsDetail);
      FField.Name := 'fldTaxRate' + FieldByName('taxid').AsString;
      FField.FieldKind := fkInternalCalc;
      FField.FieldName := 'TaxRate' + FieldByName('taxid').AsString;
      FField.DataSet := cdsDetail;

      ACol := grdDet.CreateColumnEx(TdxDBGridColumn, grdDet);
      ACol.Name := 'colTaxRate' + FieldByName('taxid').AsString;
      ACol.FieldName := 'TaxRate' + FieldByName('taxid').AsString;
      ACol.Visible := False;
      ACol.Tag := 1;
      ACol.HeaderAlignment := taCenter;
      ACol.Caption := FieldByName('name').AsString;
      ACol.Width := 60;
      //ACol.OnGetText := colTaxRateGetText;

      Next;
    end;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.pmDetPopup(Sender: TObject);
  var
    FPosType: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.pmDetPopup') else _udebug := nil;{$ENDIF}

  FPosType := cdsDetail.FieldByName('postype').AsInteger;
  itmMatInfo.Visible := FPosType = 0;
  itmMatMove.Visible := FPosType = 0;
  itmMatRsv.Visible := FPosType = 0;
  itmFindAtMats.Visible := FPosType = 0;
  itmFindAtSvc.Visible := FPosType = 1;
  itmMC.Visible := FPosType = 0;
  //itmSvcInfo.Visible := FPosType = 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.RealignControls;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.RealignControls') else _udebug := nil;{$ENDIF}

  //cbChecked.Left := panFilter.Width - cbChecked.Width - 6;
  //lStatus.Left := cbChecked.Left - lStatus.Width - 4;
  btnKAgent.Left := PanFilter.Width - btnKAgent.Width - 6;
  lcbKAgent.Width := btnKAgent.Left - lcbKAgent.Left - 1;
  lcbKAgent.Anchors := lcbKAgent.Anchors + [akRight];

  stSummDef.Left := panDetFooter.Width - stSummDef.Width - 8;
  lTot.Left := stSummDef.Left - lTot.Width - 4;
  stSummDefNDS.Left := lTot.Left - stSummDefNDS.Width - 6;
  lTotNDS.Left := stSummDefNDS.Left - lTotNDS.Width - 4;
  stSummDefNoNDS.Left := lTotNDS.Left - stSummDefNoNDS.Width - 6;
  lTotNDSOut.Left := stSummDefNoNDS.Left - lTotNDSOut.Width - 4;

  stTotal.Left := panFooter.Width - stTotal.Width - 8;
  lDocsSumm.Left := stTotal.Left - lDocsSumm.Width - 4;
  stCount.Left := lDocsSumm.Left - stCount.Width - 6;
  lDocsCount.Left := stCount.Left - lDocsCount.Width - 4;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.DoCopy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.DoCopy') else _udebug := nil;{$ENDIF}

  grdDet.CopySelectedToClipboard;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInvoices.DoExcel(Grid: TdxDBGrid);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInvoices.DoExcel') else _udebug := nil;{$ENDIF}

  if Grid <> nil then begin
    Grid := grdDet;
    buildExpList(Grid);
  end;

  inherited DoExcel(Grid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fInvoices', @Debugging, DEBUG_group_ID);{$ENDIF}
  
//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
