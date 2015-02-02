{$I ok_sklad.inc}
unit fWriteOff;

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
  TfmWriteOff = class(TfmBaseWBDoc)
    aAddTaxWB: TAction;
    cdsDetailCERTDATE: TDateTimeField;
    cdsDetailCERTNUM: TStringField;
    cdsDetailcurrname: TStringField;
    cdsDetailGRPID: TIntegerField;
    cdsDetailGTD: TStringField;
    cdsDetailPriceTXT: TStringField;
    cdsDetailPRODUCER: TStringField;
    cdsDetailsn: TStringField;
    cdsMainATTDATE: TDateTimeField;
    cdsMainATTNUM: TStringField;
    cdsMainCHECKED: TIntegerField;
    cdsMainCURRID: TIntegerField;
    cdsMainDEFNUM: TIntegerField;
    cdsMainDELETED: TIntegerField;
    cdsMainDOCID: TIntegerField;
    cdsMainKAID: TIntegerField;
    cdsMainNDS: TFloatField;
    cdsMainNOTES: TStringField;
    cdsMainNUM: TStringField;
    cdsMainnumex: TIntegerField;
    cdsMainONDATE: TDateTimeField;
    cdsMainPERSONID: TIntegerField;
    cdsMainREASON: TStringField;
    cdsMainRECEIVED: TStringField;
    cdsMainSUMMALL: TFloatField;
    cdsMainTODATE: TDateTimeField;
    cdsMainWBILLID: TIntegerField;
    cdsMainWHNAME: TStringField;
    cdsMainWID: TIntegerField;
    cdsMainWTYPE: TIntegerField;
    colCName: TdxDBGridColumn;
    colNumEx: TdxDBGridColumn;
    colSN: TdxDBGridColumn;
    irLosses: TdxInspectorTextRow;
    TBItem11: TTBItem;
    TBItem7: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;

    procedure aAddTaxWBExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure btnKagentClick(Sender: TObject);
    procedure cdsDetailFetchAfterOpen(DataSet: TDataSet);
    procedure cdsDetailCalcFields(DataSet: TDataSet);
    procedure cdsKAgentBeforeOpen(DataSet: TDataSet);
    procedure cdsMainAfterOpen(DataSet: TDataSet);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure FrameResize(Sender: TObject);
    procedure grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);

  protected
    procedure GSAllMov;

  public
    procedure SetCaptions; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoDelete; override;
    procedure DoCheck(EditRequest: Boolean); override;
    procedure DoPrint(AParam: integer = 0); override;
    procedure DoShowFilter; override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure NotifyChanged; override;
  end;

var
  fmWriteOff: TfmWriteOff;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ssDateUtils, prRep, EditWriteOff, prConst, ClientData, fMessageDlg, StrUtils,
  ssCallbackConst, prFun, ssFun, ssBaseConst, EditTaxWB, BaseRef, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmWriteOff.DoRefresh(const AID: integer; AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.DoRefresh') else _udebug := nil;{$ENDIF}

  case AParam of
    0:
      begin
        DSRefresh(cdsMain, _ID_, AID);
      end;

    Integer(rtWHouse):
      begin
        DSRefresh(cdsKAgent, 'wid', AID);
        lcbKAgent.KeyValue := AID;
        lcbKAgent.SelStart := 0;
        lcbKAgent.SelLength := 0;
      end;
  end;

  with grdMain do if FocusedNode <> nil then FocusedNode.Selected := True;

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.FrameResize(Sender: TObject);
  var
    AStyle: integer;
    Offset, i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  AdjustGrid(grdMain, colNum);
  AdjustGrid(grdDet, colMatName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.DoShowFilter;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.DoShowFilter') else _udebug := nil;{$ENDIF}

  inherited;
  FrameResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.DoOpen') else _udebug := nil;{$ENDIF}

  _ID_ := 'wbillid';
  EditingClass := TfrmEditWriteOff;
  //irPerson.Visible := False;
  irEmail.Visible := False;
  irWWW.Visible := False;
  RefType := prTypes.rtWriteOff;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    FindList.Clear;
    FindList.AddObject(GetRS('fmWaybill', 'FiltNum') + ';' + 'num', pointer(1));
    FindList.AddObject(GetRS('fmWaybill', 'FiltDate') + ';' + 'ondate', pointer(2));
    FindList.AddObject(GetRS('fmWaybill', 'FiltKAOut') + ';' + 'name', pointer(3));

    inherited;

    Self.Caption := GetRS('fmWaybill', 'TitleWriteOff');
    aAddTaxWB.Caption := GetRS('fmWaybill', 'AddFromOutToTaxWB');
    irPerson.Caption := GetRS('fmWaybill','WHouse');
    irKAgent.Caption := GetRS(Self.Name, 'Comission');
    irKAFullName.Caption := GetRS(Self.Name, 'Chairman');
    irKAAdress.Caption := GetRS(Self.Name, 'Person1');
    irKAPhone.Caption := GetRS(Self.Name, 'Person2');
    irFax.Caption := GetRS(Self.Name, 'Person3');
    irLosses.Caption := GetRS('fmWriteOff', 'Losses');
    {colSummCurr.Caption := GetRS('fmWaybill', 'Summ');
    colNDS.Caption := GetRS('fmWaybill', 'NDS');
    colRate.Caption := GetRS('fmWaybill', 'Kurs');
    }
    colRecNo.Caption := amountPrefix;
    colPrice.Caption := GetRS('fmWaybill', 'Price');
    colSummCurr.Caption:=GetRS('fmWaybill', 'SummCurr');
    //colSummDef.Caption := GetRS('fmWaybill','SummIn') + ' ' + BaseCurrName;
    colName.Caption := GetRS('fmWaybill', 'WHouse');
    colSN.Caption := GetRS('fmWaybill', 'SN');
    lKAgent.Caption := GetRS('fmWaybill', 'WHouse');
    btnKAgent.Hint := GetRS('fmMaterials', 'RefWHouse');
    tsInfo.Caption := GetRS(Self.Name, 'DocWOInfo');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.cdsMainBeforeOpen(DataSet: TDataSet);
  var
    m:string;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  m:='';
  with cdsMain do begin
    if (lcbKAgent.KeyValue <> lcbKAgent.EmptyValue) and (panFilter.Visible)
      then m := m + ' and wbm.sourcewid=' + IntToStr(lcbKAgent.KeyValue);

    if cbChecked.EditValue = 1 then m := m + ' and wblist.checked=1';
    if cbChecked.EditValue = 2 then m := m + ' and wblist.checked=0';
    m := m + WHAccessMacro('wbm.sourcewid');

    FetchMacros;
    Macros.ParamByName('m').AsString := m;
    FetchParams;

    if panFilter.Visible
      then Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate
      else Params.ParamByName('fromdate').AsDateTime := MinDateTime;

    if panFilter.Visible
      then Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate)
      else Params.ParamByName('todate').AsDateTime := MaxDateTime;
  end;//with cdsWaybill

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.DoPrint(AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.DoPrint') else _udebug := nil;{$ENDIF}

  xRep.ShowRep(prRep.rtWriteOff, cdsMain.FieldByName(_ID_).AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.DoDelete;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.DoDelete') else _udebug := nil;{$ENDIF}

  if mrYes = ssMessageDlg(rs(Self.Name, 'DelWriteOff') + ' ' + cdsMain.fieldbyname('num').AsString + '?', ssmtWarning, [ssmbYes, ssmbNo])
  then
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

         //2) Удаляем из COMMISSION
         ProviderName := 'pWOCom_Del';
         FetchParams;
         Params.ParamByName(_ID_).AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;
         Execute;  //Удалили из wmatturn

         //Записываем NULL для цен в waybilldet
         ProviderName := 'pWaybillDet_SetNull';
         FetchParams;
         Params.ParamByName(_ID_).AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;
         Execute;

         if not DeleteDataEx(dmData.SConnection, 'waybilllist', _ID_, cdsMain.fieldbyname(_ID_).AsInteger)
           then raise Exception.Create(rs('Common','DeleteError'));

         if not DelToRecycleBin
           then TrCommit
           else begin
             TrRollback;

             if not AddToRecycleBin(dmData.SConnection, Self.ClassName, cdsMain.fieldbyname(_ID_).AsInteger, GetDelStr(cdsMain.fieldbyname(_ID_).AsInteger), false, Self.FunID)
             then begin
               ssMessageDlg(rs('Common','DeleteError'), ssmtError, [ssmbOk]);
               {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
               Exit;
             end
             else begin
               try
                 TrStart;

                 // 1 )Удаляем из оборотов
                 ProviderName:='pWMatTurn_Del';
                 FetchParams;
                 Params.ParamByName(_ID_).AsInteger:=cdsMain.fieldbyname(_ID_).AsInteger;
                 Execute;  //Удалили из wmatturn

                 //2) Удаляем из COMMISSION
                 ProviderName:='pWOCom_Del';
                 FetchParams;
                 Params.ParamByName(_ID_).AsInteger:=cdsMain.fieldbyname(_ID_).AsInteger;
                 Execute;  //Удалили из wmatturn

                 //Записываем NULL для цен в waybilldet
                 ProviderName:='pWaybillDet_SetNull';
                 FetchParams;
                 Params.ParamByName(_ID_).AsInteger:=cdsMain.fieldbyname(_ID_).AsInteger;
                 Execute;

                 TrCommit;

               except
                 TrRollback;
               end;
             end;
           end;

         DoRefresh(0);
         RefreshFun('TfmInventory', 0);
         SendMessage(ParentHandle, WM_REFRESHBIN, 0, 0);
         UpdateActionList;

         if RefreshAllClients then begin
           dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
           dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
         end;

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
procedure TfmWriteOff.DoCheck(EditRequest: Boolean);
  var
    WBillID: Integer;
    eStr: string;
    mtTmp: TssmdType;
    fCheckRsv: Boolean;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.DoCheck') else _udebug := nil;{$ENDIF}

  fCheckRsv := False;

  with newDataSet do
  try
    WBILLID := cdsMain.fieldbyname('wbillid').AsInteger;

    TrStart;

    try
      if grdMain.FocusedNode.Values[colChecked.Index] = 0
      then begin
        //Проверка резерва позиций
        ProviderName:='pWayBillRsv_Check';
        FetchParams;
        Params.ParamByName('WBILLID').AsInteger:=WBILLID;
        Open;
        fCheckRsv:=IsEmpty;
        Close;

        if fCheckRsv then begin
          if mrYes = ssMessageDlg(rs('Common','CheckConfirm'), ssmtWarning, [ssmbYes,ssmbNo])
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
            {DoRecalcKASaldo(dmData.SConnection,
            cdsMain.FieldByName('kaid').AsInteger,
            cdsMain.FieldByName('ondate').AsDateTime,rs('fmWaybill','RecalcBallance'));
            }
            DoRefresh(0);
            UpdateActionList;

            if RefreshAllClients then begin
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBOUT);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
            end;
          end;
        end
        else begin
          if ssMessageDlg(rs('fmWaybill', 'NotRsv'), ssmtError, [ssmbYes,ssmbNo]) = mrYes
          then begin
            Application.ProcessMessages;
            aProperties.Execute;
          end;
        end;
      end
      else begin
        if cdsMain.fieldbyname('todate').AsFloat > 0 then begin
          Close;
          ProviderName := 'pWaybill_Get';
          FetchParams;
          Params.ParamByName('WBILLID').AsInteger := round(cdsMain.fieldbyname('todate').AsFloat);
          Open;
          estr := rs('fmWaybill', 'UnCheckWBOut1') + crlf;
          eStr := eStr + amountPrefix + FieldByName('num').AsString + rs('fmWaybill','AttDate',3) + FieldByName('ondate').AsString + '.' + crlf;
          eStr := eStr + rs('fmWaybill','UnCheckWBOut2');
          Close;

          mtTmp := ssmtWarning;
        end
        else begin
          eStr := rs('Common', ifThen(EditRequest, 'PostedEditConfirm', 'UncheckConfirm'));
          mtTmp := ssmtWarning;
        end;

        if ssMessageDlg(eStr, mtTmp, [ssmbYes, ssmbNo]) = mrYes
        then begin
          Application.ProcessMessages;
          Screen.Cursor := crSQLWait;

          //1)обновляем wmatturn
          ProviderName:='pWMatTurnType_Upd';
          FetchParams;
          Params.ParamByName('WBILLID').AsInteger:=WBILLID;
          Params.ParamByName('TurnType').AsInteger:=2;
          Execute;

          //2)Запись в CHECKED=0
          {//Отмена проводки счёта
          if cdsMain.fieldbyname('todate').AsFloat>0 then begin
            ProviderName:='pWaybillCheck_Set0';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger:=Round(cdsMain.fieldbyname('todate').AsFloat);
            Execute;
          end;
          }

          //Отмена проводки накладной
          if cdsMain.fieldbyname('todate').AsFloat > 0
            then ProviderName := 'pWaybillCheck_Set00'
            else ProviderName:='pWaybillCheck_Set0';

          FetchParams;
          Params.ParamByName('WBILLID').AsInteger:=WBILLID;
          Execute;
          RefreshFun('TfmAccOut', 0);

          {DoRecalcKASaldo(dmData.SConnection,
          cdsMain.FieldByName('kaid').AsInteger,
          cdsMain.FieldByName('ondate').AsDateTime, rs('fmWaybill','RecalcBallance'));
          }
          DoRefresh(0);
          UpdateActionList;
          if RefreshAllClients then begin
            dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBOUT);
            dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
            dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
          end;
        end;
      end;

      TrCommit;

      dmData.SConnection.AppServer.q_Add(CA_REFRESH,CA_WMAT);

    finally
      Screen.Cursor:=crDefault;
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
procedure TfmWriteOff.aAddTaxWBExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.aAddTaxWBExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  with TfrmEditTaxWB.Create(nil) do
  try
    ID := 0;
    chbCheckNDS.Checked := (cdsMain.fieldbyname('nds').AsFloat > 0);
    edDate.Date := cdsMain.fieldbyname('ondate').AsDateTime;
    edCondition.Text := rs('fmWaybill', 'TitleWaybillOut', 1) + amountPrefix + cdsMain.fieldbyname('num').AsString;
    lcbPersonName.KeyValue := cdsMain.fieldbyname('personid').AsInteger;
    SendMessage(Handle, WM_REFRESH, cdsMain.fieldbyname('kaid').AsInteger, integer(rtkagent));
    SetCaptions;

    //*****************************
    // чтение позиций в mdDet
    with newDataSet do
    try
      ProviderName := 'pTaxWBDet_GetOut';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := cdsMain.fieldbyname('WBILLID').AsInteger;
      Open;
      mdDet.CopyFromDataSet(Fields[0].DataSet);
      Close;

    finally
      Free;
    end;

   //*****************************
   if ShowModal in [mrOK, mrYes] then begin
     //ShowMessage('!!');
   end;

 finally
   Screen.Cursor := crDefault;
   Free;
 end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  var
    i: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  if not cdsMain.IsEmpty then begin
    with cdsMain do begin
      irNum.Text := FieldByName('num').AsString + RS('fmWaybill', 'From', 3) + ssDateToStr(FieldByName('ondate').AsDateTime)
                    + ' ' + TimeToStr(FieldByName('ondate').AsDateTime);
      irReason.Text := FieldByName('reason').AsString;

      if FieldByName('checked').AsInteger = 1
        then irStatus.Text := rs('fmWaybill', 'DocChecked')
        else irStatus.Text := rs('fmWaybill', 'DocUnChecked');

      irCurr.Text := FormatFloat(MoneyDisplayFormat, FieldByName('summall').AsCurrency) + ' ' + BaseCurrName;

      if FieldByName('defnum').AsInteger = 0
        then irLosses.Text := rs('Common', 'No')
        else irLosses.Text := rs('Common', 'Yes');
    end;//with cdsMain

    // Чтение комиссии
    with newDataSet do
    try
      ProviderName:='pWOCom_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger:=cdsMain.FieldByName('wbillid').AsInteger;
      Open;
      if not IsEmpty then begin
        if Locate('num', 0, []) then irKAFullName.Text := fieldbyname('name').AsString;
        if Locate('num', 1, []) then irKAAdress.Text := fieldbyname('name').AsString;
        if Locate('num', 2, []) then irKAPhone.Text := fieldbyname('name').AsString;
        if Locate('num', 3, []) then irFax.Text := fieldbyname('name').AsString;
      end;//if not IsEmpty
      Close;

    finally
      Free;
    end;

    with cdsDetailFetch do begin
      DSRefresh(cdsDetail, 'posid', 0);
      //Чтение склада
      if not IsEmpty
        then irPerson.Text := WHName(dmData.SConnection,cdsDetail.FieldByName('wid').AsInteger)
        else irPerson.Text := '';
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
    irLosses.Text := '';
  end;

  GetSummAll;

  //GSAllMov;

  if tsDocRel.TabVisible then DSRefresh(cdsRel, 'docid', 0);
  AdjustGrid(grdDocRel, colDRTypeName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.cdsDetailFetchAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.cdsDetailFetchAfterOpen') else _udebug := nil;{$ENDIF}

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

  GetSummAll;
  ShowTotalAmountNode;
  FrameResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.GSAllMov;
  var
    i: Integer;
    SummDef,SummDefNDS,SummDefOutNDS,SummCurr, AllSummCurr,
    AllSummDefOutNDS, AllSummDefNDS, AllSummDef: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.GSAllMov') else _udebug := nil;{$ENDIF}

  with grdDet do begin
    AllSummCurr := 0;
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;
    for i := 0 to Count - 1 do begin
      if Items[i].Values[colPrice.Index]<>Null then begin
        try
          SummCurr := RoundToA(Items[i].Values[colAmount.Index] * Items[i].Values[colPrice.Index], -2);
          Items[i].Values[colSummCurr.Index] := FormatFloat(MoneyDisplayFormat, SummCurr) + ' ' + Items[i].Values[colCName.Index];
          AllSummCurr := AllSummCurr + SummCurr;

        except
          Items[i].Values[colSummCurr.Index] := 0;
        end;

        try
          if Items[i].Values[colRate.Index] > 0 then begin
            NDSCalc(Items[i].Values[colAmount.Index], Items[i].Values[colPrice.Index] * Items[i].Values[colRate.Index],
                    Items[i].Values[colNDS.Index], 1, SummDefOutNDS, SummDefNDS);

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
        Items[i].Values[colSummDef.Index]:='';
        Items[i].Values[colSummCurr.Index]:='';
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
procedure TfmWriteOff.cdsDetailCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.cdsDetailCalcFields') else _udebug := nil;{$ENDIF}

  with DataSet do begin
    if not FieldByName('price').IsNull
      then FieldByName('pricetxt').AsString := FormatFloat(MoneyDisplayFormat,FieldByName('price').AsFloat) + ' ' + fieldbyname('currname').AsString
      else FieldByName('pricetxt').AsString := '';
  end;//DataSet

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.btnKagentClick(Sender: TObject);
  var
    intID: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.btnKagentClick') else _udebug := nil;{$ENDIF}

  try
    intID := lcbKAgent.KeyValue;
  except
    intID := 0;
  end;

  ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate, intID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.ActionListUpdate') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.colNumGetText') else _udebug := nil;{$ENDIF}

  try
    AText := ANode.Values[colNumEx.Index];

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.cdsMainCalcFields(DataSet: TDataSet);
  var
    FNum: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.cdsMainCalcFields') else _udebug := nil;{$ENDIF}

  try
    FNum := DataSet.FieldByName('num').AsString;

    if Pos(WriteOffPrefix, FNum) = 1
      then DataSet.FieldByName('numex').AsInteger :=
           StrToInt(Trim(Copy(FNum, Length(WriteOffPrefix) + 1, Length(FNum) - Length(WriteOffPrefix) - Length(WriteOffSuffix))))
      else DataSet.FieldByName('numex').AsInteger := StrToInt(FNum);

  except
    DataSet.FieldByName('numex').AsInteger := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.colPriceGetText') else _udebug := nil;{$ENDIF}

  inherited;

  AText := AText + ' ' + VarToStr(ANode.Values[colCName.Index]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.colSummCurrGetText') else _udebug := nil;{$ENDIF}

  inherited;

  AText := AText + ' ' + VarToStr(ANode.Values[colCName.Index]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.grdDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'DocWriteOff');
  ImgList := dmData.Images;
  AIndex := II_WRITEOFF;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.cdsMainAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.cdsMainAfterOpen') else _udebug := nil;{$ENDIF}

  inherited;
  AdjustGrid(grdMain, colNum);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtWMat, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('frmOptions', 'WriteOff');
  ImgList := dmData.Images;
  AIndex := II_WRITEOFF;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWriteOff.cdsKAgentBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWriteOff.cdsKAgentBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsKAgent.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fWriteOff', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
