{$I ok_sklad.inc}
unit fReturnOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWBDoc, dxExEdtr6, DB, ssDataSource, DBClient,
  ssClientDataSet, TB2Item, Menus, ActnList, dxInspRw, dxInspct, dxCntner6,
  cxPC, cxDropDownEdit, ssDBLookupCombo, cxImageComboBox,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxCalendar,
  ssSpeedButton, StdCtrls, dxDBGrid6, dxTL6, dxDBCtrl6, dxDBTLCl6, dxGrClms6,
  ssBevel, ExtCtrls, ssDBGrid, Grids, DBGrids, ssPeriod,
  prTypes, okPeriod, ssMemDS, dxExEdtr, dxCntner;

type
  TfmWBReturnOut = class(TfmBaseWBDoc)
    aAddTaxWB: TAction;
    cdsDetailcurrname: TStringField;
    cdsDetailGRPID: TIntegerField;
    cdsDetailpricetxt: TStringField;
    cdsDetailsn: TStringField;
    cdsMainADDRESS: TStringField;
    cdsMainATTDATE: TDateTimeField;
    cdsMainATTNUM: TStringField;
    cdsMainCHECKED: TIntegerField;
    cdsMainCITY: TStringField;
    cdsMainCOUNTRY: TStringField;
    cdsMainCURRID: TIntegerField;
    cdsMainDEFNUM: TIntegerField;
    cdsMainDISTRICT: TStringField;
    cdsMainDOCID: TIntegerField;
    cdsMainEMAIL: TStringField;
    cdsMainFAX: TStringField;
    cdsMainKAFULLNAME: TStringField;
    cdsMainKAID: TIntegerField;
    cdsMainKANAME: TStringField;
    cdsMainKAPHONE: TStringField;
    cdsMainKATYPE: TIntegerField;
    cdsMainNDS: TFloatField;
    cdsMainNOTES: TStringField;
    cdsMainNUM: TStringField;
    cdsMainnumex: TIntegerField;
    cdsMainONDATE: TDateTimeField;
    cdsMainPERSONID: TIntegerField;
    cdsMainPERSONNAME: TStringField;
    cdsMainPOSTINDEX: TStringField;
    cdsMainREASON: TStringField;
    cdsMainRECEIVED: TStringField;
    cdsMainSUMMALL: TFloatField;
    cdsMainSUMMPAY: TFloatField;
    cdsMainTODATE: TDateTimeField;
    cdsMainWBILLID: TIntegerField;
    cdsMainWTYPE: TIntegerField;
    cdsMainWWW: TStringField;
    colCName: TdxDBGridColumn;
    colNumEx: TdxDBGridColumn;
    colSN: TdxDBGridColumn;
    TBItem7: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;

    procedure aColParamsExecute(Sender: TObject);
    procedure cdsDetailFetchAfterOpen(DataSet: TDataSet);
    procedure cdsDetailCalcFields(DataSet: TDataSet);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);

  protected
    procedure GSAllMov;

  public
    procedure SetCaptions; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoDelete; override;
    procedure DoCheck(EditRequest: Boolean); override;
    procedure DoPrint(AParam: integer = 0); override;
    procedure NotifyChanged; override;
  end;

var
  fmWBReturnOut: TfmWBReturnOut;

implementation

uses
  ssDateUtils, prRep, EditWBReturnOut, prConst, ClientData, fMessageDlg,
  ssCallbackConst, prFun, ssFun, ssBaseConst, StrUtils, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

{ TfmWBReturnOut }
//==============================================================================================
procedure TfmWBReturnOut.GSAllMov;
  var
    i: Integer;
    SummDef,SummDefNDS,SummDefOutNDS,SummCurr,AllSummCurr,
    AllSummDefOutNDS, AllSummDefNDS, AllSummDef:Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.GSAllMov') else _udebug := nil;{$ENDIF}

  with grdDet do begin
    AllSummCurr := 0;
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;

    for i := 0 to Count - 1 do begin
      if Items[i].Values[colPrice.Index]<>Null then begin
        try
          SummCurr := RoundToA(Items[i].Values[colAmount.Index]*Items[i].Values[colPrice.Index], -2);

          Items[i].Values[colSummCurr.Index] := FormatFloat(MoneyDisplayFormat, SummCurr)+' '+
                                            Items[i].Values[colCname.Index];

          AllSummCurr := AllSummCurr + SummCurr;

        except
          Items[i].Values[colSummCurr.Index] := 0;
        end;

        try
          if Items[i].Values[colRate.Index] > 0 then begin
            NDSCalc(Items[i].Values[colAmount.Index],
              Items[i].Values[colPrice.Index] * Items[i].Values[colRate.Index],
              Items[i].Values[colNDS.Index], 1,
              SummDefOutNDS, SummDefNDS);

            SummDef := RoundToA(SummDefNDS + SummDefOutNDS, -2);
            AllSummDefOutNDS := AllSummDefOutNDS + SummDefOutNDS;
            AllSummDefNDS := AllSummDefNDS + RoundToA(SummDefNDS, -2);
            AllSummDef := AllSummDef + SummDef;
            Items[i].Values[colSummDef.Index] := FormatFloat(MoneyDisplayFormat, SummDef);
          end
          else Items[i].Values[colSummDef.Index] := 0;

        except
          Items[i].Values[colSummDef.Index] := 0;
        end;
      end//if
      else begin
        Items[i].Values[colSummDef.Index] := '';
        Items[i].Values[colSummCurr.Index] := '';
      end;
    end;//for

    AllSummDefOutNDS := AllSummDef - AllSummDefNDS;
    stSummCurr.Caption := FormatFloat(MoneyDisplayFormat, AllSummCurr);
    stSummDefNoNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefOutNDS);
    stSummDefNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefNDS);
    stSummDef.Caption := FormatFloat(MoneyDisplayFormat, AllSummDef);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnOut.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.DoOpen') else _udebug := nil;{$ENDIF}

  _ID_ := 'wbillid';
  EditingClass := TfrmEditWBReturnOut;
  RefType := rtWBRetOut;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnOut.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.SetCaptions') else _udebug := nil;{$ENDIF}


  with LangMan do begin
    FindList.Clear;
    FindList.AddObject(GetRS('fmWaybill', 'FiltNum') + ';' + 'num', pointer(1));
    FindList.AddObject(GetRS('fmWaybill', 'FiltDate') + ';' + 'ondate', pointer(2));
    FindList.AddObject(GetRS('fmWaybill', 'FiltKAOut') + ';' + 'name', pointer(3));

    inherited;

    Self.Caption := GetRS('fmWaybill', 'TitleRetOut');
    irKAgent.Caption := GetRS('fmWaybill', 'KANameIn');
    irPerson.Caption := GetRS('fmWaybill','PersonnameOut');

    colSN.Caption := GetRS('fmWaybill', 'SN');
    colPrice.Caption := GetRS('fmWaybill', 'Price');
    colPriceInCurr.Caption := GetRS('fmWaybill', 'PriceInCurr');
    colSummCurr.Caption := GetRS('fmWaybill', 'SummCurr');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnOut.cdsMainBeforeOpen(DataSet: TDataSet);
  var
    M: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  M := '';

  with cdsMain do begin
    if (lcbKAgent.KeyValue <> lcbKAgent.EmptyValue) and panFilter.Visible
      then Params.ParamByName('in_kaid').AsInteger := lcbKAgent.KeyValue
      else Params.ParamByName('in_kaid').AsInteger := 0;

    case cbChecked.EditValue of
      0: Params.ParamByName('in_checked').AsInteger := -1;
      1: Params.ParamByName('in_checked').AsInteger := 1;
      2: Params.ParamByName('in_checked').AsInteger := 0;
    end;
    Params.ParamByName('wh').AsString := AllowedWH;
    Params.ParamByName('in_entid').AsInteger := 0;

    Params.ParamByName('shownullbalance').AsInteger := Integer(aShowNullBallance.Checked);
    Params.ParamByName('in_wtype').AsInteger := -6;//Возврат поставщику

    if panFilter.Visible
      then Params.ParamByName('in_fromdate').AsDateTime := prdMain.FromDate
      else Params.ParamByName('in_fromdate').AsDateTime := MinDateTime;
      
    if panFilter.Visible
      then Params.ParamByName('in_todate').AsDateTime := LastSecondInDay(prdMain.ToDate)
      else Params.ParamByName('in_todate').AsDateTime := MaxDateTime;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnOut.DoPrint(AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.DoPrint') else _udebug := nil;{$ENDIF}

  xRep.ShowRep(prRep.rtReturnOut,cdsMain.FieldByName(_ID_).AsInteger);
  //xRep.ShowRep(prRep.rtWBMove ,cdsMain.FieldByName(_ID_).AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnOut.DoDelete;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.DoDelete') else _udebug := nil;{$ENDIF}

  if not GetUserAccessByClass(Self.ClassName, uaDelete) then begin
    ssMessageDlg(rs('Common', 'CantDelete'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if mrYes <> ssMessageDlg(rs('fmWaybill', 'WBDelConfirm') + ' ' + cdsMain.fieldbyname('num').AsString + '?', ssmtWarning, [ssmbYes, ssmbNo])
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

   with newDataSet do
   try
     Application.ProcessMessages;

     TrStart;

     try
       // 1 )Удаляем из оборотов
       ProviderName := 'pWMatTurn_Del';
       FetchParams;
       Params.ParamByName(_ID_).AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;
       Execute;  //Удалили из wmatturn
       //Записываем NULL для цен в waybilldet
       ProviderName := 'pWaybillDet_SetNull';
       FetchParams;
       Params.ParamByName(_ID_).AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;
       Execute;

       if not DeleteDataEx(dmData.SConnection, 'waybilllist',_ID_, cdsMain.fieldbyname(_ID_).AsInteger)
         then raise Exception.Create(rs('Common','DeleteError'));

       if not DelToRecycleBin
         then TrCommit
         else begin
           TrRollback;

           if not AddToRecycleBin(dmData.SConnection, Self.ClassName, cdsMain.fieldbyname(_ID_).AsInteger, GetDelStr(cdsMain.fieldbyname(_ID_).AsInteger), false, Self.FunID) then
           begin
             ssMessageDlg(rs('Common','DeleteError'), ssmtError, [ssmbOk]);
             {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
             Exit;
           end
           else begin
             try
               TrStart;

               // 1 )Удаляем из оборотов
               ProviderName := 'pWMatTurn_Del';
               FetchParams;
               Params.ParamByName(_ID_).AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;
               Execute;  //Удалили из wmatturn
               //Записываем NULL для цен в waybilldet
               ProviderName := 'pWaybillDet_SetNull';
               FetchParams;
               Params.ParamByName(_ID_).AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;
               Execute;
               TrCommit
             except
               TrRollback;
             end;
           end;
         end;

       LocateAfterDel;
       DoRefresh(0);
       SendMessage(ParentHandle, WM_REFRESHBIN, 0, 0);
       UpdateActionList;

       {if RefreshAllClients then begin
         dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
         dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
       end;}

     except
       on e:exception do begin
         TrRollback;
         ssMessageDlg(rs('Common','NoDelete')+#10#13+e.Message, ssmtError, [ssmbOk]);
       end;
     end;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnOut.DoCheck(EditRequest: Boolean);
  var
    WBillID: Integer;
    eStr: string;
    mtTmp: TssmdType;
    fCheckRsv: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.DoCheck') else _udebug := nil;{$ENDIF}

  if not GetUserAccessByClass(Self.ClassName, uaPost) then begin
    ssMessageDlg(rs('Common', 'CantPost'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  fCheckRsv := False;

  with newDataSet do
  try
    WBILLID := cdsMain.fieldbyname('wbillid').AsInteger;

    TrStart;

    try
      if grdMain.FocusedNode.Values[colChecked.Index] = 0 then begin // doing post
        //Проверка резерва позиций
        ProviderName := 'pWayBillRsv_Check';
        FetchParams;
        Params.ParamByName('WBILLID').AsInteger := WBILLID;
        Open;
        fCheckRsv := IsEmpty;
        Close;

        if fCheckRsv then begin
          if mrYes = ssMessageDlg(rs('Common','CheckConfirm'),ssmtWarning,[ssmbYes,ssmbNo])
          then begin
            Application.ProcessMessages;
            Screen.Cursor := crSQLWait;

            //1)обновляем wmatturn
            ProviderName := 'pWMatTurnType_Upd';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Params.ParamByName('TurnType').AsInteger := -1;
            Execute;

            //2)Запись в CHECKED=1
            ProviderName := 'pWaybillCheck_Set1';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Execute;

            TrCommit;

            DoRecalcKASaldo(dmData.SConnection,
              cdsMain.FieldByName('kaid').AsInteger,
              cdsMain.FieldByName('ondate').AsDateTime,rs('fmWaybill','RecalcBallance'));

            DoRefresh(0);
            UpdateActionList;

            if RefreshAllClients then begin
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBOUT);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
            end;
          end;
        end // if fCheckRsv
        else begin
          if ssMessageDlg(rs('fmWaybill','NotRsv'),ssmtError ,[ssmbYes,ssmbNo]) = mrYes then begin
            Application.ProcessMessages;
            aProperties.Execute;
          end;
        end;
      end // if grdMain.FocusedNode.Values[colChecked.Index] = 0
      else begin  // doing UnPost
        if cdsMain.fieldbyname('todate').AsFloat > 0 then begin
          Close;
          ProviderName := 'pWaybill_Get';
          FetchParams;
          Params.ParamByName('WBILLID').AsInteger := round(cdsMain.fieldbyname('todate').AsFloat);
          Open;

          estr := rs('fmWaybill','UnCheckWBOut1') + crlf
            + amountPrefix + FieldByName('num').AsString + ' ' + rs('fmWaybill','AttDate')
            + ' ' + FieldByName('ondate').AsString + '.' + crlf
            + rs('fmWaybill','UnCheckWBOut2');

          Close;
          mtTmp := ssmtWarning;
        end
        else begin
          eStr := rs('Common', ifThen(EditRequest, 'PostedEditConfirm', 'UncheckConfirm'));
          mtTmp := ssmtWarning;
        end;

        if mrYes = ssMessageDlg(eStr, mtTmp, [ssmbYes, ssmbNo])
        then begin
          Application.ProcessMessages;
          Screen.Cursor := crSQLWait;

          //1)обновляем wmatturn
          ProviderName := 'pWMatTurnType_Upd';
          FetchParams;
          Params.ParamByName('WBILLID').AsInteger := WBILLID;
          Params.ParamByName('TurnType').AsInteger := 2;
          Execute;

          //2)Запись в CHECKED=0
          //Отмена проводки счёта
          if cdsMain.fieldbyname('todate').AsFloat>0 then begin
            ProviderName := 'pWaybillCheck_Set0';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := Round(cdsMain.fieldbyname('todate').AsFloat);
            Execute;
          end;

          //Отмена проводки накладной
          if cdsMain.fieldbyname('todate').AsFloat > 0
            then ProviderName := 'pWaybillCheck_Set00'
            else ProviderName := 'pWaybillCheck_Set0';

          FetchParams;
          Params.ParamByName('WBILLID').AsInteger := WBILLID;
          Execute;

          TrCommit;

          RefreshFun('TfmAccOut', 0);

          DoRecalcKASaldo(dmData.SConnection,
            cdsMain.FieldByName('kaid').AsInteger,
            cdsMain.FieldByName('ondate').AsDateTime, rs('fmWaybill','RecalcBallance'));

          DoRefresh(0);
          UpdateActionList;

          if RefreshAllClients then begin
            dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBOUT);
            dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
            dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
          end;
        end;
      end;

      dmData.SConnection.AppServer.q_Add(CA_REFRESH,CA_WMAT);

    finally
      Screen.Cursor := crDefault;
      Free;
    end;

  except
    on e:exception do begin
      TrRollback;
      ssmessagedlg(e.Message, ssmtError, [ssmbOk]);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnOut.colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.colNumGetText') else _udebug := nil;{$ENDIF}

  AText := ANode.Values[colNumEx.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnOut.cdsMainCalcFields(DataSet: TDataSet);
  var
    FNum: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.cdsMainCalcFields') else _udebug := nil;{$ENDIF}

  try
    FNum := DataSet.FieldByName('num').AsString;

    if Pos(WBOutPrefix, FNum) = 1
      then DataSet.FieldByName('numex').AsInteger :=
        StrToInt(Trim(Copy(FNum, Length(WBOutPrefix) + 1, Length(FNum) - Length(WBOutPrefix) - Length(WBOutSuffix))))
      else DataSet.FieldByName('numex').AsInteger := StrToInt(FNum);

  except
    DataSet.FieldByName('numex').AsInteger := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnOut.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  if not cdsMain.IsEmpty then begin
    with cdsMain do begin
      irNum.Text := FieldByName('num').AsString + rs('fmWaybill', 'From',3) +
                     ssDateToStr(FieldByName('ondate').AsDateTime) + ' ' +
                     TimeToStr(FieldByName('ondate').AsDateTime);

      irReason.Text := FieldByName('reason').AsString;

      if FieldByName('checked').AsInteger = 1
        then irStatus.Text := rs('fmWaybill', 'DocChecked')
        else irStatus.Text := rs('fmWaybill', 'DocUnChecked');

      irCurr.Text := FormatFloat(MoneyDisplayFormat, FieldByName('summall').AsCurrency) + ' ' + BaseCurrName;
      irPerson.Text := FieldByName('personname').AsString;


      irKAgent.Text := FieldByName('kaname').AsString;
      irKAFullName.Text := FieldByName('kafullname').AsString;
      irKAPhone.Text := FieldByName('kaphone').AsString;
      irFax.Text := FieldByName('fax').AsString;

      if Trim(FieldByName('email').AsString) <> ''
        then irEmail.Text := 'mailto:' + FieldByName('email').AsString
        else irEmail.Text := '';

      irWWW.Text := FieldByName('www').AsString;

      irKAAdress.Text := FieldByName('postindex').AsString;

      if (Trim(irKAAdress.Text) <> '') and (Trim(FieldByName('country').AsString) <> '')
        then irKAAdress.Text := FieldByName('country').AsString + ', ' + irKAAdress.Text
        else irKAAdress.Text := FieldByName('country').AsString + irKAAdress.Text;

      if (Trim(irKAAdress.Text) <> '') and (Trim(FieldByName('district').AsString) <> '')
        then irKAAdress.Text := FieldByName('district').AsString + ', ' +irKAAdress.Text
        else irKAAdress.Text := FieldByName('district').AsString + irKAAdress.Text;

      if (Trim(irKAAdress.Text) <> '') and (Trim(FieldByName('city').AsString) <> '')
        then irKAAdress.Text := FieldByName('city').AsString + ', ' + irKAAdress.Text
        else irKAAdress.Text := FieldByName('city').AsString + irKAAdress.Text;

      if (Trim(irKAAdress.Text) <> '') and (Trim(FieldByName('address').AsString) <> '')
        then irKAAdress.Text := FieldByName('address').AsString + ', ' + irKAAdress.Text
        else irKAAdress.Text := FieldByName('address').AsString + irKAAdress.Text;
    end;//with cdsMain

    LoadPayment;

    with cdsDetailFetch do begin
      Close;
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := cdsMain.FieldByName(_ID_).AsInteger;
      Open;
    end;//with
  end
  else begin
    irNum.Text := '';
    irReason.Text := '';
    irStatus.Text := '';
    irCurr.Text := '';
    irKAFullName.Text := '';
    irKAAdress.Text := '';
    irKAPhone.Text := '';
    irFax.Text := '';
    irPerson.Text := '';
    if cdsDetail.Active then cdsDetail.EmptyDataSet;
  end;

  GetSummAll;

  if tsDocRel.TabVisible then DSRefresh(cdsRel, 'docid', 0);

  AdjustGrid(grdDocRel, colDRTypeName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfmWBReturnOut.cdsDetailCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.cdsDetailCalcFields') else _udebug := nil;{$ENDIF}

  with DataSet do begin
    if not FieldByName('price').IsNull
      then FieldByName('pricetxt').AsString := FormatFloat(MoneyDisplayFormat,FieldByName('price').AsFloat) + ' '
             + fieldbyname('currname').AsString
      else FieldByName('pricetxt').AsString := '';
  end;//DataSet

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnOut.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.colPriceGetText') else _udebug := nil;{$ENDIF}

  inherited;

  AText := AText + ' ' + BaseCurrName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnOut.colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.colSummCurrGetText') else _udebug := nil;{$ENDIF}

  inherited;

  AText := AText + ' ' + ANode.Values[colCname.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnOut.cdsDetailFetchAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.cdsDetailFetchAfterOpen') else _udebug := nil;{$ENDIF}

  CopyDataSet(cdsDetail, cdsDetailfetch);

  with cdsDetail do begin
    DisableControls;
    First;
    while not Eof do begin
      UpdatePos;
      Next;
    end;
    First;
    EnableControls;
  end;

  ShowTotalAmountNode;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnOut.grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.grdDetGetOptionsTitle') else _udebug := nil;{$ENDIF}
    
  AText := rs('fmWaybill', 'DocWBRetOut');
  ImgList := dmData.Images;
  AIndex := II_WBRETOUT;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnOut.aColParamsExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.aColParamsExecute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmWBReturnOut.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnOut.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtDocs, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fReturnOut', @Debugging, DEBUG_group_ID);{$ENDIF}
    
//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
