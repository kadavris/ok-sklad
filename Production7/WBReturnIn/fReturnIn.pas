{$I ok_sklad.inc}
unit fReturnIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWBDoc, dxExEdtr6, DB, ssDataSource, DBClient,
  ssClientDataSet, TB2Item, Menus, ActnList, dxInspRw, dxInspct, dxCntner6,
  cxPC, cxDropDownEdit, ssDBLookupCombo, cxImageComboBox,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxCalendar,
  ssSpeedButton, StdCtrls, ssDBGrid, dxTL6, dxDBCtrl6, dxDBTLCl6, dxGrClms6,
  prTypes, ssBevel, ExtCtrls, dxDBGrid6, ssPeriod, okPeriod,
  ssMemDS, dxExEdtr, dxCntner;

type
  TfmWBReturnIn = class(TfmBaseWBDoc)
    cdsDetailcurrname: TStringField;
    cdsDetailDPOSID: TIntegerField;
    cdsDetailGRPID: TIntegerField;
    cdsDetailGTD: TStringField;
    cdsDetailPPOSID: TIntegerField;
    cdsDetailpricetxt: TStringField;
    cdsDetailPRODUCER: TStringField;
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
    TBItem8: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;

    procedure aColParamsExecute(Sender: TObject);
    procedure aFindAtWHExecute(Sender: TObject);
    procedure cdsDetailFetchAfterOpen(DataSet: TDataSet);
    procedure cdsDetailCalcFields(DataSet: TDataSet);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);

  private
    procedure GSAllMov;

  public
    procedure DoOpen(AParam: Variant); override;
    procedure DoCheck(EditRequest: Boolean); override;
    procedure DoPrint(AParam: integer = 0); override;
    procedure UpdateActionList; override;
    procedure SetCaptions; override;
    procedure DoDelete; override;
    procedure NotifyChanged; override;
  end;

var
  fmWBReturnIn: TfmWBReturnIn;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ssDateUtils, ClientData, fMessageDlg, prFun, prConst,
  ssCallbackConst, DocsList, BaseFrame, EditWBReturnIn,
  StrUtils, prRep, ssBaseConst, ssFun, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}
//==============================================================================================
procedure TfmWBReturnIn.GSAllMov;
  var
    i: Integer;
    SummCurr,PriceDefOutNDS, SummDefOutNDS, SummDefNDS, SummDef,
    AllSummCurr, AllSummDefOutNDS, AllSummDefNDS, AllSummDef, FAmount :Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.GSAllMov') else _udebug := nil;{$ENDIF}

  with grdDet do begin
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;
    AllSummCurr :=0;
    
    for i := 0 to Count - 1 do begin
      try
        SummCurr := RoundToA(Items[i].Values[colAmount.Index] * Items[i].Values[colPrice.Index], -2);
        Items[i].Values[colSummCurr.Index] := SummCurr;
        AllSummCurr := AllSummCurr + SummCurr;

      except
        Items[i].Values[colSummCurr.Index] := 0;
      end;

      try
        FCurrRate := Items[i].Values[colRate.Index];

        if FCurrRate > 0 then begin
          NDSCalc(Items[i].Values[colAmount.Index], Items[i].Values[colPrice.Index] * FCurrRate,
                  Items[i].Values[colNDS.Index], 1, SummDefOutNDS, SummDefNDS);

          SummDef := RoundToA(SummDefNDS + SummDefOutNDS, -2);
          AllSummDefOutNDS := AllSummDefOutNDS + SummDefOutNDS;
          AllSummDefNDS := AllSummDefNDS + RoundToA(SummDefNDS, -2);
          AllSummDef := AllSummDef + SummDef;
          Items[i].Values[colSummDef.Index] := SummDef;
        end
        else Items[i].Values[colSummDef.Index] := 0;

      except
        Items[i].Values[colSummDef.Index] := 0;
      end;
    end;

    AllSummDef := RoundToA(AllSummDef, -2);
    AllSummDefOutNDS := AllSummDef - AllSummDefNDS;
    stSummCurr.Caption := ''; //FormatFloat(MoneyDisplayFormat, AllSummCurr);
    stSummDefNoNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefOutNDS);
    stSummDefNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefNDS);
    stSummDef.Caption := FormatFloat(MoneyDisplayFormat, AllSummDef);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfmWBReturnIn.DoDelete;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.DoDelete') else _udebug := nil;{$ENDIF}

  if not GetUserAccessByClass(Self.ClassName, uaDelete) then begin
    ssMessageDlg(rs('Common', 'CantDelete'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if ssMessageDlg(rs('Common','DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with newDataSet do
  try
    Application.ProcessMessages;
    TrStart;

    try
      RemoteServer := dmData.SConnection;
  //Удаляем из returnrel
      {ProviderName := 'pRetRel_Del';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;
      Execute;
      }

      if not DeleteDataEx(dmData.SConnection, 'waybilllist', _ID_, cdsMain.fieldbyname(_ID_).AsInteger)
        then raise Exception.Create(rs('Common','DeleteError'));

      if not DelToRecycleBin
         then TrCommit
         else begin
           TrRollback;

           if not AddToRecycleBin(dmData.SConnection, Self.ClassName, cdsMain.fieldbyname(_ID_).AsInteger,GetDelStr(cdsMain.fieldbyname(_ID_).AsInteger),False, Self.FunID)
           then begin
             ssMessageDlg(rs('Common','ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
             {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
             Exit;
           end;
         end;
      LocateAfterDel;
      DoRefresh(0);
      UpdateActionList;
      {if RefreshAllClients then begin
        dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
        dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
      end;}

    except
      on e:exception do begin
        TrRollback;
        ssMessageDlg(rs('Common','NoDelete'), ssmtError, [ssmbOk]);
      end;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnIn.cdsMainBeforeOpen(DataSet: TDataSet);
  var
    M: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

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
    Params.ParamByName('in_wtype').AsInteger := 6;

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
procedure TfmWBReturnIn.DoCheck(EditRequest: Boolean);
  var
    WBillID, tmpid: Integer;
    eStr: string;
    cdsWBDet:TssClientDataSet;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.DoCheck') else _udebug := nil;{$ENDIF}

  if not GetUserAccessByClass(Self.ClassName, uaPost) then begin
    ssMessageDlg(rs('Common', 'CantPost'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with newDataSet do
    try
      eStr := '';
      WBillID := cdsMain.fieldbyname(_ID_).AsInteger;

      if grdMain.FocusedNode.Values[colChecked.Index] = 0 then begin
        if ssMessageDlg(rs('Common','CheckConfirm'), ssmtWarning,[ssmbYes, ssmbNo]) = mrYes
        then begin
          Application.ProcessMessages;

          TrStart;

          try
            //1)Дублируем позиции из waybilldet
            cdsWBDet := newDataSet;
            try
              cdsWBDet.ProviderName := 'pRetInDet_GetEx';
              cdsWBDet.FetchParams;
              cdsWBDet.Params.ParamByName('WBILLID').AsInteger := WBILLID;
              cdsWBDet.Open;
              cdsWBDet.First;
              while not cdsWBDet.Eof do begin
                ProviderName := 'pWaybillDet_Ins';
                FetchParams;
                tmpid := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');

                if tmpid < 0 then raise Exception.Create(rs('fmWaybill', 'ErrorAddPos'));

                Params.ParamByName('POSID').AsInteger := tmpid;
                Params.ParamByName('WBILLID').AsInteger := cdsWBDet.fieldbyname('WBILLID').AsInteger;
                Params.ParamByName('MATID').AsInteger := cdsWBDet.fieldbyname('MATID').AsInteger;
                Params.ParamByName('WID').AsInteger := cdsWBDet.fieldbyname('WID').AsInteger;
                Params.ParamByName('AMOUNT').AsFloat := cdsWBDet.fieldbyname('AMOUNT').AsFloat;
                Params.ParamByName('PRICE').AsFloat := cdsWBDet.fieldbyname('PRICE').AsFloat;
                Params.ParamByName('NDS').AsFloat := cdsWBDet.fieldbyname('NDS').AsFloat;
                Params.ParamByName('CurrId').AsInteger := cdsWBDet.fieldbyname('currid').AsInteger;
                Params.ParamByName('OnDate').AsDateTime := cdsWBDet.fieldbyname('ondate').AsDateTime;
                Params.ParamByName('DISCOUNT').DataType := ftFloat;
                Params.ParamByName('DISCOUNT').Clear;
                Params.ParamByName('PTypeID').DataType := ftInteger;
                Params.ParamByName('PTypeID').Clear;
                Params.ParamByName('NUM').AsInteger := cdsWBDet.fieldbyname('num').AsInteger;
                Execute;//Записываем очередную позицию

                //2)Обновляем returnrel
                ProviderName := 'pRetRel_Upd';
                FetchParams;
                Params.ParamByName('posid').AsInteger := cdsWBDet.fieldbyname('posid').AsInteger;
                Params.ParamByName('dposid').AsInteger := tmpid;
                Execute;

                cdsWBDet.Next;
              end;//while not mdDet.Eof do begin

            finally
              cdsWBDet.Free;
            end;
            //3)Запись в обороты
            ProviderName := 'pRetWMT_Ins';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Execute;

            //4)Запись в CHECKED=1
            ProviderName := 'pWaybillCheck_Set1';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Execute;

            TrCommit;

            DoRefresh(0);

            DoRecalcKASaldo(dmData.SConnection, cdsMain.FieldByName('kaid').AsInteger,
                            cdsMain.FieldByName('ondate').AsDateTime, rs('fmKAgent', 'RecalcBallance'));

            DoRecalcDCByWB(dmData.SConnection, WBillID);
            RefreshFun('TfmDiscCards', 0);

            UpdateActionList;

            if RefreshAllClients then begin
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
            end;

          except
            on E: Exception do begin
              TrRollback;
              ssMessageDlg(E.Message, ssmtError, [ssmbOK]);
            end;
          end;
        end;
      end
      else begin//Отмена проводки
        Screen.Cursor := crSQLWait;
        //проверка расхода
        ProviderName := 'pWayBill_CheckOut1';
        FetchParams;
        Params.ParamByName('WBILLID').AsInteger := WBILLID;
        Open;

        if Fields[0].AsInteger>0 then begin
          Screen.Cursor := crDefault;

          if ssMessageDlg(rs('fmWaybill','CheckOut')+#13+rs(Self.Name,'CheckOut2'), ssmtError, [ssmbYes, ssmbCancel]) = mrYes then begin
            Close;
            Screen.Cursor := crSQLWait;
            ProviderName := 'pWayBill_CheckOut';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Open;

            if not IsEmpty then begin
              with TfrmDocsList.Create(nil) do
              try
                mdDocsList.CopyFromDataSet(Fields[0].DataSet);
                GetCounts;
                mdDocsList.First;
                dbgListDet.FullExpand;
                Caption := RS(Name,'DocsList_Title')+' "'+RS(Self.Name,'TitleWaybill')+amountPrefix+cdsMain.fieldbyname('num').AsString+' '+RS(Self.Name,'AttDate')+' '+cdsMain.FieldByName('ondate').AsString+'"';
                Screen.Cursor := crDefault;
                ShowModal;

              finally
                Free;
              end;
            end;//if not IsEmpty then begin
          end;
        end
        else begin//если ничего не держит
          Close;
          Screen.Cursor := crDefault;

          if mrYes = ssMessageDlg(rs('Common', ifThen(EditRequest, 'PostedEditConfirm', 'UncheckConfirm')),ssmtWarning, [ssmbYes, ssmbNo])
          then begin
            Screen.Cursor := crSQLWait;
            Application.ProcessMessages;

            TrStart;
            try
              //1)Удаление из оборотов
              ProviderName := 'pWMatTurn_Del';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := WBILLID;
              Execute;

              //2)Запись в dposid null для returnrell
              ProviderName := 'pRetRelD_SetNull';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := WBILLID;
              Execute;

              //3)Удаление из waybilldet дублирующих позиций
              ProviderName := 'pRetDDet_Del';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := WBILLID;
              Execute;

              //4)Запись в CHECKED=0
              ProviderName := 'pWaybillCheck_Set0';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := WBILLID;
              Execute;
              TrCommit;

              DoRefresh(0);

              DoRecalcKASaldo(dmData.SConnection, cdsMain.FieldByName('kaid').AsInteger,
                cdsMain.FieldByName('ondate').AsDateTime, rs(Self.Name,'RecalcBallance'));

              DoRecalcDCByWB(dmData.SConnection, WBillID);
              RefreshFun('TfmDiscCards', 0);
              UpdateActionList;

              if RefreshAllClients then begin
                dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
                dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
                dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
              end;

            except
              on E: Exception do begin
                TrRollback;
                ssMessageDlg(E.Message, ssmtError, [ssmbOk]);
              end;
            end;
          end;
        end;//проверка расхода
      end;

    finally
      Free;
      Screen.Cursor := crDefault;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnIn.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.DoOpen') else _udebug := nil;{$ENDIF}

  _ID_ := 'wbillid';
  EditingClass := TfrmEditWBReturnIn;
  RefType := prTypes.rtWBRetIn;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnIn.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.UpdateActionList') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnIn.DoPrint(AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.DoPrint') else _udebug := nil;{$ENDIF}

  xRep.ShowRep(rtReturnIn,cdsMain.FieldByName(_ID_).AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnIn.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    FindList.Clear;
    FindList.AddObject(GetRS('fmWaybill', 'FiltNum') + ';' + 'num', pointer(1));
    FindList.AddObject(GetRS('fmWaybill', 'FiltDate') + ';' + 'ondate', pointer(2));
    FindList.AddObject(GetRS('fmWaybill', 'FiltKAOut') + ';' + 'name', pointer(3));

    inherited;

    Self.Caption := GetRS('fmWaybill', 'TitleRetIn');
    irKAgent.Caption := GetRS('fmWaybill', 'KANameOut');
    irPerson.Caption := GetRS('fmWaybill','PersonnameIn');

    colPrice.Caption := GetRS('fmWaybill', 'Price');
    colSummCurr.Caption := GetRS('fmWaybill','SummCurr');
    colSummDef.Caption := GetRS('fmWaybill','SummIn')+' '+BaseCurrName;
    colSN.Caption := GetRS('fmWaybill', 'SN');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnIn.cdsMainCalcFields(DataSet: TDataSet);
  var
    FNum: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.cdsMainCalcFields') else _udebug := nil;{$ENDIF}

  try
    FNum := DataSet.FieldByName('num').AsString;

    if Pos(WBInPrefix, FNum) = 1
      then DataSet.FieldByName('numex').AsInteger :=
           StrToInt(Trim(Copy(FNum, Length(WBInPrefix) + 1, Length(FNum) -
           Length(WBInPrefix) - Length(WBInSuffix))))
      else DataSet.FieldByName('numex').AsInteger := StrToInt(FNum);

  except
    DataSet.FieldByName('numex').AsInteger := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnIn.colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.colNumGetText') else _udebug := nil;{$ENDIF}

  AText := ANode.Values[colNumEx.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnIn.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  if not cdsMain.IsEmpty then begin
    with cdsMain do begin
      irNum.Text := FieldByName('num').AsString + RS('fmWaybill', 'From',3) +
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
procedure TfmWBReturnIn.cdsDetailCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.cdsDetailCalcFields') else _udebug := nil;{$ENDIF}

  DataSet.FieldByName('pricetxt').AsString := FormatFloat(MoneyDisplayFormat,DataSet.FieldByName('price').AsFloat)+' '+
                                              DataSet.fieldbyname('currname').AsString;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnIn.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.colPriceGetText') else _udebug := nil;{$ENDIF}

  inherited;
  AText := AText + ' ' + ANode.Values[colCname.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnIn.colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.colSummCurrGetText') else _udebug := nil;{$ENDIF}

  inherited;
  AText := AText + ' ' + ANode.Values[colCname.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnIn.cdsDetailFetchAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.cdsDetailFetchAfterOpen') else _udebug := nil;{$ENDIF}

  CopyDataSet(cdsDetail, cdsDetailFetch);

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
procedure TfmWBReturnIn.grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.grdDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'DocWBRetIn');
  ImgList := dmData.Images;
  AIndex := II_WBRETIN;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnIn.aFindAtWHExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.aFindAtWHExecute') else _udebug := nil;{$ENDIF}

  frmMainForm.ExecLocate(vtWMat, 'TfmWMat', cdsDetail.FieldByName('matid').AsInteger,
    cdsDetail.FieldByName('dposid').AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReturnIn.aColParamsExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.aColParamsExecute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmWBReturnIn.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReturnIn.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtDocs, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fReturnIn', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
