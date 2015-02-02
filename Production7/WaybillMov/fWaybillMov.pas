{$I ok_sklad.inc}
unit fWaybillMov;

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
  TfmWaybillMov = class(TfmBaseWBDoc)
    aAddTaxWB: TAction;
    aWBMovPrint: TAction;
    aWBMovPrintPT: TAction;
    aWBMovPrintW: TAction;
    cdsDetailCERTDATE: TDateTimeField;
    cdsDetailCERTNUM: TStringField;
    cdsDetailcurrname: TStringField;
    cdsDetailGRPID: TIntegerField;
    cdsDetailGTD: TStringField;
    cdsDetailpricetxt: TStringField;
    cdsDetailPRODUCER: TStringField;
    cdsDetailrsv: TIntegerField;
    cdsDetailsn: TStringField;
    cdsMainATTDATE: TDateTimeField;
    cdsMainATTNUM: TStringField;
    cdsMainCHECKED: TIntegerField;
    cdsMainCURRID: TIntegerField;
    cdsMainDEFNUM: TIntegerField;
    cdsMainDELETED: TIntegerField;
    cdsMainDESTWID: TIntegerField;
    cdsMainDOCID: TIntegerField;
    cdsMainKAID: TIntegerField;
    cdsMainMIDDLEPERSON: TStringField;
    cdsMainNDS: TFloatField;
    cdsMainnotes: TStringField;
    cdsMainNUM: TStringField;
    cdsMainnumex: TIntegerField;
    cdsMainONDATE: TDateTimeField;
    cdsMainPERSONID: TIntegerField;
    cdsMainPERSONIN: TStringField;
    cdsMainPERSONOUT: TStringField;
    cdsMainREASON: TStringField;
    cdsMainRECEIVED: TStringField;
    cdsMainSOURCEWID: TIntegerField;
    cdsMainSUMMALL: TFloatField;
    cdsMainTODATE: TDateTimeField;
    cdsMainWBILLID: TIntegerField;
    cdsMainWHIN: TStringField;
    cdsMainWHOUT: TStringField;
    cdsMainWTYPE: TIntegerField;
    colCName: TdxDBGridColumn;
    colNumEx: TdxDBGridColumn;
    colRsv: TdxDBGridImageColumn;
    colSN: TdxDBGridColumn;
    colwhIn: TdxDBGridColumn;
    irPersonIn1: TdxInspectorTextRow;
    irWHouseIn1: TdxInspectorTextRow;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    tbPrint: TTBSubmenuItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aWBMovPrintExecute(Sender: TObject);
    procedure aWBMovPrintPTExecute(Sender: TObject);
    procedure aWBMovPrintWExecute(Sender: TObject);
    procedure cdsDetailFetchAfterOpen(DataSet: TDataSet);
    procedure cdsDetailCalcFields(DataSet: TDataSet);
    procedure cdsMainAfterOpen(DataSet: TDataSet);// override;
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceWONDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
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
    procedure NotifyChanged; override;
  end;

var
  fmWaybillMov: TfmWaybillMov;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ssDateUtils, prRep, EditWaybillMov, prConst, ClientData, fMessageDlg,
  ssCallbackConst, prFun, ssFun, ssBaseConst, BaseRef,
  StrUtils, DocsList, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmWaybillMov.GSAllMov;
  var
    i: Integer;
    SummDef,SummDefNDS,SummDefOutNDS,SummCurr,AllSummCurr,
    AllSummDefOutNDS, AllSummDefNDS, AllSummDef:Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.GSAllMov') else _udebug := nil;{$ENDIF}

  with grdDet do begin
    AllSummCurr := 0;
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;

    for i := 0 to Count - 1 do begin
      if Items[i].Values[colPrice.Index] <> Null then begin
        try
          SummCurr := RoundToA(Items[i].Values[colAmount.Index] * Items[i].Values[colPrice.Index], -2);
          Items[i].Values[colSummCurr.Index] := FormatFloat(MoneyDisplayFormat, SummCurr) + ' ' + Items[i].Values[colCname.Index];
          AllSummCurr := AllSummCurr + SummCurr;

        except
          Items[i].Values[colSummCurr.Index] := 0;
        end;

        try
          if Items[i].Values[colRate.Index] > 0 then begin
            NDSCalc(Items[i].Values[colAmount.Index],
              Items[i].Values[colPrice.Index] * Items[i].Values[colRate.Index],
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
      end // if Items[i].Values[colPrice.Index] <> Null
      else begin
        Items[i].Values[colSummDef.Index] := '';
        Items[i].Values[colSummCurr.Index] := '';
      end;
    end; // for i := 0 to Count - 1

    AllSummDefOutNDS := AllSummDef - AllSummDefNDS;
    stSummCurr.Caption := FormatFloat(MoneyDisplayFormat, AllSummCurr);
    stSummDefNoNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefOutNDS);
    stSummDefNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefNDS);
    stSummDef.Caption := FormatFloat(MoneyDisplayFormat, AllSummDef);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.DoShowFilter;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.DoShowFilter') else _udebug := nil;{$ENDIF}

  inherited;
  FrameResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  grdDetNeedAdjust(grdDet);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.DoOpen') else _udebug := nil;{$ENDIF}

  _ID_ := 'wbillid';
  EditingClass := TfrmEditWaybillMov;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    FindList.Clear;
    FindList.AddObject(GetRS('fmWaybill', 'FiltNum') + ';' + 'num', pointer(1));
    FindList.AddObject(GetRS('fmWaybill', 'FiltDate') + ';' + 'ondate', pointer(2));

    inherited;

    Self.Caption := GetRS('fmWaybill', 'TitleWaybillMov');
    //aAddTaxWB.Caption := GetRS('fmWaybill', 'AddFromOutToTaxWB');
    colName.Caption := GetRS('fmWaybill', 'WHouseOut');
    colwhIn.Caption := GetRS('fmWaybill', 'WHouseIn');
    aWBMovPrint.Caption := GetRS('fmWaybill', 'WBMovPrint');
    aWBMovPrintW.Caption := GetRS('fmWaybill', 'WBMovPrintW');
    aWBMovPrintPT.Caption := GetRS('fmWaybill', 'WBMovPrintPT');

    irKAFullName.Caption := GetRS('fmWaybill', 'PersonnameOut');
    irPersonIn1.Caption := GetRS('fmWaybill', 'PersonnameIn');
    irKAgent.Caption := GetRS('fmWaybill', 'WHouseOut');
    irWHouseIn1.Caption := GetRS('fmWaybill', 'WHouseIn');
    irPerson.Caption := GetRS('fmWaybill', 'RecvName');

    //colPriceTXT.Caption := GetRS('fmWaybill','Price');

    colSummCurr.Caption := GetRS('fmWaybill', 'SummCurr');
    colRsv.Caption := GetRS('fmWMat', 'Reserved');
    colSN.Caption := GetRS('fmWaybill', 'SN');
    //colSummDef.Caption := GetRS('fmWaybill','SummIn')+' '+BaseCurrName;
  end;//with LangMan do begin

  tbPrint.Caption := aPrint.Caption;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.cdsMainBeforeOpen(DataSet: TDataSet);
  var
    M: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  M := '';
  with cdsMain do begin
    //if (lcbKAgent.KeyValue <> lcbKAgent.EmptyValue) and panFilter.Visible
    //  then M := M + ' and wblist.kaid=' + IntToStr(lcbKAgent.KeyValue);

    if cbChecked.EditValue = 1 then M := M + ' and wblist.checked=1'
    else if cbChecked.EditValue = 2 then M := M + ' and wblist.checked=0';

    M := M + WHAccessMacro('whouseout.wid') + WHAccessMacro('whousein.wid');

    Macros.ParamByName('m').AsString := M;
    Params.ParamByName('wtype').AsInteger := 4 ;//перемещение

    if panFilter.Visible
      then Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate
      else Params.ParamByName('fromdate').AsDateTime := MinDateTime;

    if panFilter.Visible
      then Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate)
      else Params.ParamByName('todate').AsDateTime := MaxDateTime;
  end;//with

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.DoPrint(AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.DoPrint') else _udebug := nil;{$ENDIF}

  xRep.ShowRep(prRep.rtWBMove, cdsMain.FieldByName(_ID_).AsInteger, AParam);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.DoDelete;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.DoDelete') else _udebug := nil;{$ENDIF}

  if not GetUserAccessByClass(Self.ClassName, uaDelete) then begin
    ssMessageDlg(rs('Common', 'CantDelete'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes,ssmbNo]) = mrYes then
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
                 ProviderName := 'pWMatTurn_Del';
                 FetchParams;
                 Params.ParamByName(_ID_).AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;
                 Execute;  //Удалили из wmatturn

                 //Записываем NULL для цен в waybilldet
                 ProviderName := 'pWaybillDet_SetNull';
                 FetchParams;
                 Params.ParamByName(_ID_).AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;
                 Execute;

                 TrCommit;

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

  {if ssMessageDlg(rs('Common','DelConfirm'), ssmtWarning, [ssmbYes,ssmbNo])=mrYes then
  with newDataSet do
  try
    Application.ProcessMessages;
    TrStart;
    try
      // 1 )Удаляем из оборотов
      ProviderName := 'pWMatTurn_DelS';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := cdsMain.fieldbyname('wbillid').AsInteger;
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
      if not AddToRecycleBin(dmData.SConnection, Self.ClassName, cdsMain.fieldbyname(_ID_).AsInteger, cdsMain.fieldbyname('num').AsString, false, Self.FunID) then
            begin
               ssMessageDlg(rs('Common','ErrorInsToRecycleBin'),ssmtError,[ssmbOk]);
               Exit;
             end else begin
               try
                 TrStart;
                 RemoteServer := dmData.SConnection;
                 // 1 )Удаляем из оборотов
                 ProviderName := 'pWMatTurn_DelS';
                 FetchParams;
                 Params.ParamByName('WBILLID').AsInteger := cdsMain.fieldbyname('wbillid').AsInteger;
                 Execute;  //Удалили из wmatturn

                 //Записываем NULL для цен в waybilldet
                 ProviderName := 'pWaybillDet_SetNull';
                 FetchParams;
                 Params.ParamByName(_ID_).AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;
                 Execute;

                 TrCommit;

               except
                 TrRollback;
               end;
             end;
           end;
         DoRefresh(0);

         if Logging then RefreshLog;

         UpdateActionList;

         if RefreshAllClients then begin
           dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
           dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
         end;

       except
         on e:exception do begin
         TrRollback;
         ssMessageDlg(rs('Common','NoDelete')+#10#13+e.Message,ssmtError,[ssmbOk]);
       end;
     end;
     finally
       Free;
     end;}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.DoCheck(EditRequest: Boolean);
  var
    cdsWMatTurn:TssClientDataSet;
    WBILLID, tmpPosId:integer;
    eStr: string;
    fCheckRsv: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.DoCheck') else _udebug := nil;{$ENDIF}

  if not GetUserAccessByClass(Self.ClassName, uaPost) then begin
    ssMessageDlg(rs('Common', 'CantPost'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with newDataSet do
  try
    WBILLID := cdsMain.fieldbyname(_ID_).AsInteger;

    TrStart;

    try
      if grdMain.FocusedNode.Values[colChecked.Index]=0 then begin
        ProviderName := 'pWayBillRsv_Check';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := WBILLID;
        Open;
        fCheckRsv := IsEmpty;
        Close;

        if fCheckRsv then begin
          if ssMessageDlg(rs('Common','CheckConfirm'),ssmtWarning,[ssmbYes,ssmbNo]) = mrYes
          then begin
            Application.ProcessMessages;
            Screen.Cursor := crSQLWait;
            //1)обновляем wmatturn
            ProviderName := 'pWMatTurnType_Upd';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Params.ParamByName('TurnType').AsInteger := -1;
            Execute;

            cdsWMatTurn := newDataSet;
            try
              cdsWMatTurn.ProviderName := 'pWMatTurnOut_Get';
              cdsWMatTurn.FetchParams;
              cdsWMatTurn.Params.ParamByName('WBILLID').AsInteger := WBILLID;

              cdsWMatTurn.Open;
              cdsWMatTurn.First;

              ProviderName := 'pWMatTurnOut_Ins';

              while not cdsWMatTurn.Eof do begin
                FetchParams;
                Params.ParamByName('PosID').AsInteger := cdsWMatTurn.fieldbyname('SOURCEID').AsInteger;
                Params.ParamByName('SOURCEID').AsInteger := cdsWMatTurn.fieldbyname('SOURCEID').AsInteger;
                Params.ParamByName('MatID').AsInteger := cdsWMatTurn.fieldbyname('matid').AsInteger;
                Params.ParamByName('WID').AsInteger := cdsMain.FieldByName('DESTWID').AsInteger;
                Params.ParamByName('TurnType').AsInteger := 1;
                Params.ParamByName('OnDate').AsDateTime := cdsWMatTurn.fieldbyname('ondate').AsDateTime;
                Params.ParamByName('Amount').AsFloat := RoundToA(strtofloat(cdsWMatTurn.fieldbyname('amount').AsString),MatDisplayDigits);

                Execute;
                cdsWMatTurn.Next;
              end;//while

              cdsWMatTurn.Close

            finally
              cdsWMatTurn.Free;
            end;

            //2)Запись в CHECKED=1
            ProviderName := 'pWaybillCheck_Set1';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Execute;
            DoRefresh(0);

            if Logging then RefreshLog;

            UpdateActionList;

            if RefreshAllClients then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
          end;// =mrYes
        end//if dbgWaybill.FocusedNode.Values[colPost.Index]=0 then
        else begin
          if ssMessageDlg(rs('fmWaybill','NotRsv'), ssmtError, [ssmbYes,ssmbNo]) = mrYes then begin
            Application.ProcessMessages;
            aProperties.Execute;
          end;
        end
      end
      else begin
        //******************
        //проверка расхода

        ProviderName := 'pWayBill_CheckOut';
        FetchParams;
        Params.ParamByName('WBILLID').AsInteger := WBILLID;
        Open;

        if not IsEmpty then begin
          if mrYes = ssMessageDlg(rs('fmWaybill','CheckOut') + #13 + rs('fmWaybill', 'CheckOut2'), ssmtError, [ssmbYes, ssmbCancel])
          then begin
            with TfrmDocsList.Create(nil) do
            try
              mdDocsList.CopyFromDataSet(Fields[0].DataSet);
              GetCounts;
              mdDocsList.First;
              dbgListDet.FullCollapse;
              colWBILLID.Caption := '';
              colCheked.Caption := '';
              Caption := rs(Name,'DocsList_Title') + ' "' + rs('fmWaybill', 'TitleWaybillMov') + amountPrefix
                        + cdsMain.fieldbyname('num').AsString + ' ' + rs('fmWaybill','AttDate', 1)
                        + cdsMain.FieldByName('ondate').AsString + '"';
              aPrinDoc.Hint := rs(Name,'ViewDoc');
              aPrintAll.Hint := rs(Name,'PrintAll');
              colName.Caption := rs('fmMaterials','Name');
              colAmount.Caption := rs('fmWaybill','Amount');
              ShowModal;

            finally
              Free;
            end;
          end;
        end
        else begin
          Close;

          if mrYes = ssMessageDlg(rs('Common', ifThen(EditRequest, 'PostedEditConfirm', 'UncheckConfirm')), ssmtWarning, [ssmbYes, ssmbNo])
          then begin
            Application.ProcessMessages;
            Screen.Cursor := crSQLWait;

            //Удаляем из wmatturn для DestWid
            ProviderName := 'pWMat_TurnDel4';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Execute;

            //Удалаем из WayBillDet для DestWid
            {ProviderName := 'pWayBillMoveDet_Del4';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Params.ParamByName('WID').AsInteger := cdsMain.fieldbyname('destwid').AsInteger;
            Execute;
            }

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
            DoRefresh(0);

            if Logging then RefreshLog;

            UpdateActionList;

            if RefreshAllClients then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
          end;
        end;
      end;//Проверка расхода

      TrCommit;

    finally
      Screen.Cursor := crDefault;
      Free;
    end;

  except
    on e:exception do begin
     TrRollback;
     ssMessageDlg(e.Message,ssmtError,[ssmbOk]);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  if not cdsMain.IsEmpty then begin
    with cdsMain do begin
      irNum.Text := FieldByName('num').AsString + rs('fmWaybill', 'From',3) + ssDateToStr(FieldByName('ondate').AsDateTime) + ' ' + TimeToStr(FieldByName('ondate').AsDateTime);
      irReason.Text := FieldByName('reason').AsString;
      irPersonIn1.Text := FieldByName('personin').AsString;
      irKAFullName.Text := FieldByName('personout').AsString;
      irWHouseIn1.Text := FieldByName('whin').AsString;
      irKAgent.Text := FieldByName('whout').AsString;
      irPerson.Text := FieldByName('middleperson').AsString;

      if FieldByName('checked').AsInteger = 1
        then irStatus.Text := rs('fmWaybill', 'DocChecked')
        else irStatus.Text := rs('fmWaybill', 'DocUnChecked');

      irCurr.Text := FormatFloat(MoneyDisplayFormat, FieldByName('summall').AsCurrency) + ' ' + BaseCurrName;
      irNotes.Text := FieldByName('notes').AsString;
    end;//with cdsMain

    DSRefresh(cdsDetail, 'posid', 0);
    grdDetNeedAdjust(grdDet);
    {
    with cdsDetailFetch do begin
      Close;
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := cdsMain.FieldByName(_ID_).AsInteger;
      Open;
    end;//with
    }
  end
  else begin
    irNum.Text := '';
    irReason.Text := '';
    irPersonIn1.Text := '';
    irKAFullName.Text := '';
    irWHouseIn1.Text := '';
    irKAgent.Text := '';
    irPerson.Text := '';
    irStatus.Text := '';
    irCurr.Text := '';

    if cdsDetail.Active then cdsDetail.EmptyDataSet;
  end;

  GetSummAll;
  //GSAllMov;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.aWBMovPrintExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.aWBMovPrintExecute') else _udebug := nil;{$ENDIF}

  DoPrint(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.aWBMovPrintWExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.aWBMovPrintWExecute') else _udebug := nil;{$ENDIF}

  DoPrint(1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.aWBMovPrintPTExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.aWBMovPrintPTExecute') else _udebug := nil;{$ENDIF}

  DoPrint(2);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.cdsDetailFetchAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.cdsDetailFetchAfterOpen') else _udebug := nil;{$ENDIF}

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
procedure TfmWaybillMov.cdsDetailCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.cdsDetailCalcFields') else _udebug := nil;{$ENDIF}

  with DataSet do begin
    if not FieldByName('price').IsNull then begin
      FieldByName('pricetxt').AsString := FormatFloat(MoneyDisplayFormat, FieldByName('price').AsFloat) + ' ' + fieldbyname('currname').AsString;
    end
    else begin
      FieldByName('pricetxt').AsString := '';
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.ActionListUpdate') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.cdsMainCalcFields(DataSet: TDataSet);
  var
    FNum: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.cdsMainCalcFields') else _udebug := nil;{$ENDIF}

  try
    FNum := DataSet.FieldByName('num').AsString;

    if Pos(WBMovePrefix, FNum) = 1
      then DataSet.FieldByName('numex').AsInteger :=
              StrToInt(Trim(Copy(FNum, Length(WBMovePrefix) + 1, Length(FNum) - Length(WBMovePrefix) - Length(WBMoveSuffix))))
      else DataSet.FieldByName('numex').AsInteger := StrToInt(FNum);

  except
    DataSet.FieldByName('numex').AsInteger := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.colNumGetText') else _udebug := nil;{$ENDIF}

  AText := ANode.Values[colNumEx.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.colPriceGetText') else _udebug := nil;{$ENDIF}

  inherited;

  //AText := AText +  ' ' + ANode.Values[colCurrname.Index];
  AText := AText + ' ' + BaseCurrName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.colPriceWONDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.colPriceWONDSGetText') else _udebug := nil;{$ENDIF}

  inherited;

  //AText := AText + ' ' + ANode.Values[colCurrname.Index];
  AText := AText + ' ' + BaseCurrName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.colSummCurrGetText') else _udebug := nil;{$ENDIF}

  inherited;

  AText := AText + ' ' + ANode.Values[colCname.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.grdDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'DocWBMove');
  ImgList := dmData.Images;
  AIndex := II_WBMOVE;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtWMat, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('frmOptions', 'WBMove');
  ImgList := dmData.Images;
  AIndex := II_WBMOVE;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillMov.cdsMainAfterOpen(DataSet: TDataSet);
  var
    i: Integer;
    FSum: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillMov.cdsMainAfterOpen') else _udebug := nil;{$ENDIF}

  inherited;

  cdsMain.EnableControls;
  FSum := 0;

  with grdMain do
    for i := 0 to Count - 1 do begin
      try
        FSum := FSum + RoundToA(Items[i].Values[colSummAll.Index], -2);
      except
      end;
    end;

  stTotal.Caption := FormatFloat(MoneyDisplayFormat, FSum) + ' ' + BaseCurrName;
  stCount.Caption := IntToStr(grdMain.Count);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fWaybillMov', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
