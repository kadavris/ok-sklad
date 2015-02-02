{$I ok_sklad.inc}
unit Waybill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWBDoc, dxExEdtr6, DB, ssDataSource, DBClient,
  ssClientDataSet, TB2Item, Menus, ActnList, dxInspRw, dxInspct, dxCntner6,
  cxPC, cxDropDownEdit, ssDBLookupCombo, cxImageComboBox,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxCalendar,
  ssSpeedButton, StdCtrls, ssDBGrid, dxTL6, dxDBCtrl6, dxDBTLCl6, dxGrClms6,
  ssBevel, ExtCtrls, dxDBGrid6, ssBaseTypes, Grids, DBGrids,
  prTypes, ssPeriod, okPeriod, ssMemDS, dxExEdtr, dxCntner;

type
  TfmWaybill = class(TfmBaseWBDoc)
    aPosProps: TAction;
    cdsDetailARCHIVED: TIntegerField;
    cdsDetailCERTDATE: TDateTimeField;
    cdsDetailCERTNUM: TStringField;
    cdsDetailGRPID: TIntegerField;
    cdsDetailGTD: TStringField;
    cdsDetailPOSTYPE: TIntegerField;
    cdsDetailproducer: TStringField;
    cdsDetailSN: TStringField;
    cdsDetailsvctoprice: TIntegerField;
    cdsFind: TssClientDataSet;
    cdsMainADDRESS: TStringField;
    cdsMainATTDATE: TDateTimeField;
    cdsMainATTNUM: TStringField;
    cdsMainCHECKED: TIntegerField;
    cdsMainCITY: TStringField;
    cdsMainCOUNTRY: TStringField;
    cdsMainCURRID: TIntegerField;
    cdsMainCURRNAME: TStringField;
    cdsMainCURRRATE: TFloatField;
    cdsMainDEFNUM: TIntegerField;
    cdsMainDISTRICT: TStringField;
    cdsMainDOCID: TIntegerField;
    cdsMaindocsaldo: TFloatField;
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
    cdsMainPOSTINDEX: TStringField;
    cdsMainREASON: TStringField;
    cdsMainRECEIVED: TStringField;
    cdsMainSUMMALL: TFloatField;
    cdsMainSUMMINCURR: TFloatField;
    cdsMainSUMMPAY: TFloatField;
    cdsMainTODATE: TDateTimeField;
    cdsMainWBILLID: TIntegerField;
    cdsMainWTYPE: TIntegerField;
    cdsMainWWW: TStringField;
    colNumEx: TdxDBGridColumn;
    colSN: TdxDBGridColumn;
    colSvcToPrice: TdxDBGridColumn;
    TBItem10: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;

    procedure aAddPayDocExecute(Sender: TObject);
    procedure aPosPropsExecute(Sender: TObject);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure colDetNDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummInCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure srcDetailDataChange(Sender: TObject; Field: TField);

  public
    procedure DoOpen(AParam: Variant); override;
    procedure GetSummAll; override;
    procedure DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True); override;
    procedure DoCheck(EditRequest: Boolean); override;
    procedure DoPrint(AParam: integer = 0); override;
    procedure UpdateActionList; override;
    procedure SetCaptions; override;
    procedure NotifyChanged; override;
    procedure DoDelete; override;
  end;

var
  fmWaybill: TfmWaybill;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ssDateUtils, ClientData, strUtils, fMessageDlg, prFun, prConst,
  ssCallbackConst, DocsList, BaseFrame, EditWaybill, prRep, ssBaseConst,
  EditPosition, EditPayDoc, ssBaseDlg, ssStrUtil, ssFun, BaseRef, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmWaybill.cdsMainBeforeOpen(DataSet: TDataSet);
  var
    M: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

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
    Params.ParamByName('in_wtype').AsInteger := 1;

    if panFilter.Visible
      then Params.ParamByName('in_fromdate').AsDateTime := prdMain.FromDate
      else Params.ParamByName('in_fromdate').AsDateTime := 0;

    if panFilter.Visible
      then Params.ParamByName('in_todate').AsDateTime := LastSecondInDay(prdMain.ToDate)
      else Params.ParamByName('in_todate').AsDateTime := MaxDateTime;
  end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.DoCheck(EditRequest: Boolean);
  var
    WBillID, OrderID: Integer;
    eStr: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.DoCheck') else _udebug := nil;{$ENDIF}

  if not GetUserAccessByClass(Self.ClassName, uaPost) then begin
    ssMessageDlg(rs('Common', 'CantPost'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with newDataSet do
    try
      eStr := '';
      WBillID := cdsMain.fieldbyname(_ID_).AsInteger;

      ProviderName := 'pDocsRel_WB_WB_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := WBillID;
      Params.ParamByName('doctype').AsInteger := wbtOrderIn;
      Open;
      if not IsEmpty
        then OrderID := FieldByName('wbillid').AsInteger
        else OrderID := 0;
      Close;

      if grdMain.FocusedNode.Values[colChecked.Index] = 0 then begin 

        // *********** Posting **********

        if ssMessageDlg(rs('Common', 'CheckConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes
        then begin
          Application.ProcessMessages;

          TrStart;

          try
            if OrderID = 0 then begin
              ProviderName := 'pWMatTurn_Del';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := WBILLID;
              Execute;

              //4)Запись в обороты
              ProviderName := 'pWMatTurn_Ins';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := WBILLID;
              Execute;
            end
            else begin
              ProviderName := 'pWMatTurn_Upd';
              FetchParams;
              Params.ParamByName('wbillid').AsInteger := WBillID;
              Params.ParamByName('turntype').AsInteger := 1;
              Execute;

              ProviderName := 'pOrder_UpdStatus';
              FetchParams;
              Params.ParamByName('wbillid').AsInteger := OrderID;
              Params.ParamByName('checked').AsInteger := 1;
              Execute;
            end;

            //5)Запись в CHECKED=1
            ProviderName := 'pWaybillCheck_Set1';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Execute;

            TrCommit;
            
            DoRefresh(0);

            RefreshFun('TfmWMat', 0);

            if OrderID > 0 then RefreshFun('TfmOrders', 16);

            DoRecalcKASaldo(dmData.SConnection, cdsMain.FieldByName('kaid').AsInteger,
                    cdsMain.FieldByName('ondate').AsDateTime, rs('fmKAgent', 'RecalcBallance'));

            if pcMain.ActivePage <> tsDocRel then DSRefresh(cdsRel, 'docid', 0);

            if cdsRel.Locate('doctype', 8, []) then DoRecalcContract(dmData.SConnection,cdsRel.FieldByName('docid').AsInteger);

            UpdateActionList;

            {
            if RefreshAllClients then begin
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
            end;
            }

          except
            on E: Exception do begin
              TrRollback;
              ssMessageDlg(E.Message, ssmtError, [ssmbOK]);
            end;
          end;
        end;
      end // if grdMain.FocusedNode.Values[colChecked.Index] = 0 then begin // Posting

      else begin 

        // ************ Un-posting *****************

        Screen.Cursor := crSQLWait;
        //проверка расхода
        ProviderName := 'pWayBill_CheckOut1';
        FetchParams;
        Params.ParamByName('WBILLID').AsInteger := WBILLID;
        Open;

        if Fields[0].AsInteger > 0 then begin // has child documents
          Screen.Cursor := crDefault;

          if mrYes = ssMessageDlg(rs('fmWaybill','CheckOut') + #13 + rs('fmWaybill','CheckOut2'), ssmtError, [ssmbYes, ssmbCancel]) then begin
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

                Caption := rs(Name,'DocsList_Title') + ' "' + rs('fmWaybill','TitleWaybill') + amountPrefix
                        + cdsMain.fieldbyname('num').AsString + rs('fmWaybill','AttDate', 3)
                        + cdsMain.FieldByName('ondate').AsString + '"';

                Screen.Cursor := crDefault;
                ShowModal;

              finally
                Free;
              end;
            end;//if not IsEmpty
          end;
        end // if Fields[0].AsInteger > 0 (has child documents)

        else begin // no child docs - can un-post freely
          Close;
          Screen.Cursor := crDefault;

          if mrYes = ssMessageDlg(rs('Common', ifThen(EditRequest, 'PostedEditConfirm', 'UncheckConfirm')), ssmtWarning, [ssmbYes, ssmbNo])
          then begin
            Screen.Cursor := crSQLWait;
            Application.ProcessMessages;

            TrStart;

            try
              if OrderID = 0 then begin
                //1)Удаление из оборотов
                ProviderName := 'pWMatTurn_Del';
                FetchParams;
                Params.ParamByName('WBILLID').AsInteger := WBILLID;
                Execute;
              end
              else begin
                ProviderName := 'pWMatTurn_Upd';
                FetchParams;
                Params.ParamByName('wbillid').AsInteger := WBillID;
                Params.ParamByName('turntype').AsInteger := matTurnOrdered;
                Execute;

                ProviderName := 'pOrder_UpdStatus';
                FetchParams;
                Params.ParamByName('wbillid').AsInteger := OrderID;
                Params.ParamByName('checked').AsInteger := matTurnReserved;
                Execute;
              end;

              //3)Запись в CHECKED=0
              ProviderName := 'pWaybillCheck_Set0';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := WBILLID;
              Execute;

              TrCommit;

              DoRefresh(0);
              RefreshFun('TfmWMat', 0);

              if OrderID > 0 then RefreshFun('TfmOrders', 16);
              if pcMain.ActivePage <> tsDocRel then DSRefresh(cdsRel, 'docid', 0);
              if cdsRel.Locate('doctype',8,[]) then DoRecalcContract(dmData.SConnection,cdsRel.FieldByName('docid').AsInteger);

              DoRecalcKASaldo(dmData.SConnection, cdsMain.FieldByName('kaid').AsInteger, cdsMain.FieldByName('ondate').AsDateTime, rs('fmWaybill','RecalcBallance'));

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
        end; // unpost - no child docs
      end;

    finally
      Free;
      Screen.Cursor := crDefault;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.DoOpen') else _udebug := nil;{$ENDIF}

  _ID_ := 'wbillid';
  EditingClass := TfrmEditWaybill;
  RefType := prTypes.rtWBIn;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if FNoALUpdate then Exit;
  
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.UpdateActionList') else _udebug := nil;{$ENDIF}

  inherited;

  aPosProps.Enabled := not cdsDetail.IsEmpty
    and GetUserAccessByClass(Self.ClassName, uaModify)
    and (cdsDetail.FieldByName('archived').AsInteger <> 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.DoPrint(AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.DoPrint') else _udebug := nil;{$ENDIF}

  xRep.ShowRep(rtWBIn, cdsMain.FieldByName(_ID_).AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    FindList.Clear;
    FindList.AddObject(GetRS('fmWaybill', 'FiltNum')  + ';' + 'num', pointer(1));
    FindList.AddObject(GetRS('fmWaybill', 'FiltDate') + ';' + 'ondate', pointer(2));
    FindList.AddObject(GetRS('fmWaybill', 'FiltKAIn') + ';' + 'kaname', pointer(3));
    FindList.AddObject(GetRS('fmWaybill', 'SerialD')  + ';' + 'serialno', pointer(4));

    inherited;

    Self.Caption := GetRS('fmWaybill', 'TitleWaybills');

    //colDRSum.Caption := GetRS('fmWaybill', 'Summ');
    colSN.Caption := GetRS('fmWaybill', 'SN');
    colName.Caption := GetRS('Common', 'Supplier');
    irKAgent.Caption := GetRS('Common', 'Supplier');

    aPosProps.Caption := GetRS('fmWaybill', 'PosProps');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.cdsMainCalcFields(DataSet: TDataSet);
 var
   FNum: string;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.cdsMainCalcFields') else _udebug := nil;{$ENDIF}

  try
    FNum := DataSet.FieldByName('num').AsString;

    if Pos(WBInPrefix, FNum) = 1
      then DataSet.FieldByName('numex').AsInteger :=
           StrToInt(Trim(Copy(FNum, Length(WBInPrefix) + 1, Length(FNum) - Length(WBInPrefix) - Length(WBInSuffix))))
      else DataSet.FieldByName('numex').AsInteger := StrToInt(FNum);

  except
    DataSet.FieldByName('numex').AsInteger := 0;
  end;

  DataSet.FieldByName('docsaldo').AsCurrency := DataSet.FieldByName('summall').AsFloat - DataSet.FieldByName('summpay').AsFloat;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.colNumGetText') else _udebug := nil;{$ENDIF}

  try
    AText := ANode.Values[colNumEx.Index];
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.grdDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'DocWBIn');
  ImgList := dmData.Images;
  AIndex := II_WBIN;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.aPosPropsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.aPosPropsExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditPosition.Create(frmEditPosition) do
  try
    ParentNameEx := 'fmWaybill';
    OnDate := Self.OnDate;
    ParentHandle := Self.Handle;
    Mode := 1;
    id := cdsDetail.FieldByName('posid').AsInteger;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('frmOptions', 'WBIn');
  ImgList := dmData.Images;
  AIndex := II_WBIN;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.aAddPayDocExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.aAddPayDocExecute') else _udebug := nil;{$ENDIF}

  if cdsMain.FieldByName('docsaldo').AsCurrency <= 0 then begin
    ssMessageDlg(rs('fmWaybill', 'CantAddPay'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmEditPayDoc.Create(nil) do
  try
    ParentNameEx := 'fmPayDoc';
    MainHandle := Self.Handle;
    GrpID := -1;
    WType := 1;
    ID := 0;
    edTotal.Value := cdsMain.FieldByName('docsaldo').AsCurrency;
    WBillID := Self.cdsMain.FieldByName(_ID_).AsInteger;
    edReason.Text := rs('fmWaybill', 'DocWBIn') + amountPrefix + Self.cdsMain.FieldByName('num').AsString;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.colSummInCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.colSummInCurrGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MoneyDisplayFormat,
      StrToFloat(DelChars(AText, [ThousandSeparator]))) + ' ' + ANode.Values[colCurrName.Index];
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtDocs, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True);
  var
    FNode: TdxTreeListNode;
    FChar, s: string;
    BySN: Boolean;
    FFromDate, FToDate: TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.DoFind') else _udebug := nil;{$ENDIF}

  if AFName <> 'serialno' then begin
    inherited;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  BySN := AFName = 'serialno';
  SearchInfo.Failed := False;

  if FindStr <> AStr then begin
    {if FilterOnSearch then begin
     case ALocateType of
       ltSubstr: FChar := '%';
      else FChar := '';
     end;
     if AStr = ''
       then cdsMain.Filter := ''
       else cdsMain.Filter := AFName + ' like ''' + FChar + AStr + '%''';
     cdsMain.Filtered := True;
    end;
    }

    cdsFind.Close;

    if BySN
      then s := 'select wbl.wbillid, wbl.num, wbl.ondate, wbl.kaid, wbl.checked, wbd.posid ' +
        ' from waybilldet wbd, waybilllist wbl, serials s ' +
        '  where wbl.wtype=1 and wbd.wbillid=wbl.wbillid ' +
        '  and s.posid=wbd.posid and s.serialno';

    case ALocateType of
      ltBegin:  s := s + ' like ''' + QuotedStrEx(AnsiUpperCaseEx(AStr), '''') + '%''';
      ltFull:   s := s + '=''' + QuotedStrEx(AnsiUpperCaseEx(AStr), '''') + '''';
      ltSubstr: s := s + ' like ''%' + QuotedStrEx(AnsiUpperCaseEx(AStr), '''') + '%''';
    end;

    s := s + ' order by 2';
    cdsFind.Macros.ParamByName('sql').AsString := s;
    cdsFind.Open;
  end;

  FindStr := AStr;
  if AStr = '' then begin
    if FilterOnSearch then cdsMain.Filtered := False;
    SearchInfo.PrevFindStr := '';
    DoRefreshFindParams;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if not cdsFind.Eof then begin
    srcMain.OnDelayedDataChange := nil;

    if not cdsMain.Locate('wbillid', cdsFind.FieldByName('wbillid').AsInteger, []) then
      try
         CanRefresh := False;
         FFromDate := prdMain.FromDate;

         if FFromDate > cdsFind.FieldByName('ondate').AsDateTime
           then begin
             prdMain.PeriodType := ptCustom;
             prdMain.FromDate := cdsFind.FieldByName('ondate').AsDateTime;
           end;

         if prdMain.ToDate = 0
           then FToDate := MaxDateTime
           else FToDate := prdMain.ToDate;

         if FToDate < cdsFind.FieldByName('ondate').AsDateTime
           then begin
             prdMain.PeriodType := ptCustom;
             prdMain.ToDate := cdsFind.FieldByName('ondate').AsDateTime;
           end;

         if (lcbKAgent.KeyValue <> lcbKAgent.EmptyValue) and
           (lcbKAgent.KeyValue <> cdsFind.FieldByName('kaid').AsInteger)
           then lcbKAgent.KeyValue := cdsFind.FieldByName('kaid').AsInteger;

         if (cbChecked.EditValue > 0) and (cbChecked.EditValue - 1 <> cdsFind.FieldByName('checked').AsInteger)
           then cbChecked.EditValue := 0;

         DSRefresh(cdsMain, 'wbillid', cdsFind.fieldbyname('wbillid').AsInteger);

       finally
         CanRefresh := True;
       end;

     if BySN then begin
       if pcMain.ActivePage <> tsPositions then pcMain.ActivePage := tsPositions;
       srcMainDelayedDataChange(srcMain, nil);
       cdsDetail.Locate('posid', cdsFind.FieldByName('posid').AsInteger, [])
     end;
     srcMain.OnDelayedDataChange := srcMainDelayedDataChange;

     {if FilterOnSearch then begin
      case ALocateType of
        ltSubstr: FChar := '%';
       else FChar := '';
      end;
      if AStr = ''
        then cdsMain.Filter := ''
        else cdsMain.Filter := 'wbillid in (' + GetDSStr(cdsMain, 'wbillid') + ')';
      cdsMain.Filtered := True;
    end;}

    FNode := grdMain.FocusedNode;
    grdMain.ClearSelection;
    grdMain.TopIndex := FNode.AbsoluteIndex;

    if grdMain.FocusedNode <> nil
      then grdMain.FocusedNode.Selected := True;

    SearchInfo.PrevFindStr := FindStr;
    cdsFind.Next;
  end
  else begin
    SearchInfo.Failed := True;
    if FilterOnSearch then cdsMain.Filtered := False;
    SendMessage(ParentHandle, WM_SEARCHFAILED, 0, 0);
    //ssMessageDlg(RS('Common', 'FindError') + ', ' + RS('Common', 'DSEnd'), ssmtInformation, [ssmbOk]);
  end;

  DoRefreshFindParams;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.srcDetailDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.srcDetailDataChange') else _udebug := nil;{$ENDIF}

  inherited;

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.DoDelete;
  var
    OrderID: Integer;
    FCurID, FLastIndex: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.DoDelete') else _udebug := nil;{$ENDIF}

  if not GetUserAccessByClass(Self.ClassName, uaDelete) then begin
    ssMessageDlg(rs('Common', 'CantDelete'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes
  then with newDataSet do
    try
      Application.ProcessMessages;
      TrStart;

      try
        ProviderName := 'pDocsRel_WB_WB_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := cdsMain.FieldByName(_ID_).AsInteger;
        Params.ParamByName('doctype').AsInteger := 16;
        Open;

        if not IsEmpty
          then OrderID := FieldByName('wbillid').AsInteger
          else OrderID := 0;

        Close;

        if OrderID > 0 then begin
          ProviderName := 'pOrder_UpdRsv';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := cdsMain.FieldByName(_ID_).AsInteger;
          Execute;
        end;

        if not DeleteDataEx(dmData.SConnection, 'waybilllist', 'wbillid', cdsMain.fieldbyname(_ID_).AsInteger)
          then raise Exception.Create(rs('Common', 'DeleteError'));

        if OrderID > 0 then begin
          ProviderName := 'pOrder_UpdStatus';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := OrderID;
          Params.ParamByName('checked').AsInteger := 0;
          Execute;
        end;

        if not DelToRecycleBin or (OrderID > 0)
           then TrCommit
           else begin

             TrRollback;

             if not AddToRecycleBin(dmData.SConnection, Self.ClassName, cdsMain.fieldbyname(_ID_).AsInteger, GetDelStr(cdsMain.fieldbyname(_ID_).AsInteger), False, Self.FunID)
             then begin
               ssMessageDlg(rs('Common', 'ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
               {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
               Exit;
             end;
           end;

        LocateAfterDel;
        DoRefresh(0);

        if OrderID > 0 then begin
          RefreshFun('TfmOrders', 16);
          RefreshFun('TfmWMat', 16);
        end;

        UpdateActionList;

        {if RefreshAllClients then begin
  dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
          dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
        end;
        }

      except
        on e:exception do begin
          TrRollback;
          ssMessageDlg(rs('Common','NoDelete'), ssmtError, [ssmbOk]);
        end;
      end;

    finally
      Free;
    end;

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.GetSummAll;
  var
    i: Integer;
    PriceCurrOutNDS, SummCurrOutNDS, SummCurrNDS, SummCurr,
    PriceDefOutNDS, SummDefOutNDS, SummDefNDS, SummDef: Extended;
    AllSummCurr, AllSummDefOutNDS, AllSummDefNDS, AllSummDef, FAmount :Extended;
    FNorm: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.GetSummAll') else _udebug := nil;{$ENDIF}

  with grdDet do begin
    AllSummCurr := 0;
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;
    FAmount := 0;

    for i := 0 to Count - 1 do begin
      if VarToInt(Items[i].Values[colSvcToPrice.Index]) = 1 then Continue;

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
        AllSummCurr := AllSummCurr + SummCurr;

      except
      end;

      try
        if FCurrRate > 0 then begin
          NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * FCurrRate,
                  ssStrToFloat(Items[i].Values[colNDS.Index]), 1, SummDefOutNDS, SummDefNDS);

          SummDef := RoundToA(SummDefNDS + SummDefOutNDS, -2);
          AllSummDefOutNDS := AllSummDefOutNDS + SummDefOutNDS;
          AllSummDefNDS := AllSummDefNDS + RoundToA(SummDefNDS, -2);
          AllSummDef := AllSummDef + SummDef;

          NDSCalc(1, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * FCurrRate,
            ssStrToFloat(Items[i].Values[colNDS.Index]), 1, SummDefOutNDS, SummDefNDS);
        end
        else Items[i].Values[colSummDef.Index] := 0;

      except
      end;
    end;

    AllSummDef := RoundToA(AllSummDef, -2);
    AllSummDefOutNDS := AllSummDef - AllSummDefNDS;

    stSummCurr.Caption := FormatFloat(MoneyDisplayFormat, AllSummCurr);
    stSummDefNoNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefOutNDS);
    stSummDefNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefNDS);
    stSummDef.Caption := FormatFloat(MoneyDisplayFormat, AllSummDef);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.colSummDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.colSummDefGetText') else _udebug := nil;{$ENDIF}

  if VarToInt(ANode.Values[colSvcToPrice.Index]) = 1
    then AText := ''
    else if AText <> ''
         then AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybill.colDetNDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybill.colDetNDSGetText') else _udebug := nil;{$ENDIF}

  try
    {if VarToInt(ANode.Values[colSvcToPrice.Index]) = 1
      then AText := ''
    else if AText <> ''
      then AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));
    }
    AText := '';
  except
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Waybill', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
