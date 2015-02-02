{$I ok_sklad.inc}
unit Bundling;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseDlg, ActnList, ssFormStorage, ImgList, xButton,
  ssSpeedButton, ssPanel, ssGradientPanel, ExtCtrls, okSearchEdit,
  cxDropDownEdit, ssDBLookupCombo, cxTextEdit, cxCheckBox, cxSpinEdit,
  cxTimeEdit, cxContainer, cxEdit, cxMaskEdit, cxCalendar, ssBevel,
  ssLabel, StdCtrls, cxControls, cxGroupBox, ssGroupBox, cxGraphics,
  cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxTLData, cxDBTL, Menus,
  ClientData, cxDBExtLookupComboBox, DB, ssMemDS, ssDataSource, cxCalc,
  xBarCode, TreeSelector, ssBaseConst, DBClient, ssClientDataSet,
  ComCtrls, dxDBTLCl6, dxTL6, dxDBCtrl6, dxCntner6, dxDBTL6, ssDBGrid, Grids, DBGrids,
  dxGrClms6, dxDBGrid6;

type
  TfrmBundling = class(TBaseDlg)
    btnPrint: TssSpeedButton;
    gbHeader: TssGroupBox;
    lOndate: TLabel;
    btnSetTime: TssSpeedButton;
    lMiddlePerson: TLabel;
    btnMiddlePerson: TssSpeedButton;
    lNum: TLabel;
    lReason: TLabel;
    edDate: TcxDateEdit;
    edTime: TcxTimeEdit;
    chbPosting: TcxCheckBox;
    edNum: TcxTextEdit;
    edReason: TcxTextEdit;
    lcbRespPerson: TssDBLookupCombo;
    gbPos: TssGroupBox;
    btnNew: TssSpeedButton;
    btnDel: TssSpeedButton;
    pmAdd: TPopupMenu;
    srcDet: TssDataSource;
    mdDet: TssMemoryData;
    mnuAddBundle: TMenuItem;
    mnuAddBundleWAFill: TMenuItem;
    chbAssignSerial: TcxCheckBox;
    aAddBundleWFill: TAction;
    aAddBundle: TAction;
    aAddProd: TAction;
    edSearch: TcxTextEdit;
    btnSearch: TssSpeedButton;
    btnShowWMat: TssSpeedButton;
    lcbWHouse: TokWHouseSearchEdit;
    aDel: TAction;
    grdDet: TssDBGrid;
    colDetID: TdxDBGridColumn;
    colDetPOSID: TdxDBGridColumn;
    colDetPID: TdxDBGridColumn;
    colDetType: TdxDBGridColumn;
    colDetBName: TdxDBGridColumn;
    colDetIName: TdxDBGridColumn;
    colDetModel: TdxDBGridColumn;
    colDetQuantity: TdxDBGridCalcColumn;
    colDetMsrName: TdxDBGridColumn;
    colDetBySN: TdxDBGridCheckColumn;
    colDetSerial: TdxDBGridColumn;
    lNotes: TLabel;
    edNotes: TcxTextEdit;

    procedure aAddBundleExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure lcbWHouseChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aAddProdExecute(Sender: TObject);
    procedure colDetQuantityGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDetQuantityChange(Sender: TObject);
    procedure grdDetKeyPress(Sender: TObject; var Key: Char);
    procedure colDetQuantityValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure btnSetTimeClick(Sender: TObject);

  private
    FTreeSel: TfmTreeSelector;
    FtmpPOSID: Integer; // PosID for newly added items. counts from -1 and down

    procedure WMTreeSelect(var M: TMessage); message WM_TREESELECT;

  protected
    procedure SetID(const Value: integer); override;

  public
    property ID;
  end;

var
  frmBundling: TfrmBundling;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  Udebug, prFun, Math, ssStrUtil, ssDateUtils, prConst, prTypes;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmBundling.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBundling.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  with TIntegerField.Create(mdDet) do begin
    FieldName := 'posid'; DataSet := mdDet; mdDet.FieldDefs.Add(FieldName, ftInteger);
  end;

  with TIntegerField.Create(mdDet) do begin
    FieldName := 'srcposid'; DataSet := mdDet; mdDet.FieldDefs.Add(FieldName, ftInteger);
  end;

  with TIntegerField.Create(mdDet) do begin
    FieldName := 'id'; DataSet := mdDet; mdDet.FieldDefs.Add(FieldName, ftInteger);
  end;

  with TIntegerField.Create(mdDet) do begin
    FieldName := 'type'; DataSet := mdDet; mdDet.FieldDefs.Add(FieldName, ftInteger);
  end;

  with TIntegerField.Create(mdDet) do begin
    FieldName := 'pid'; DataSet := mdDet; mdDet.FieldDefs.Add(FieldName, ftInteger);
  end;

  with TIntegerField.Create(mdDet) do begin
    FieldName := 'pos'; DataSet := mdDet; mdDet.FieldDefs.Add(FieldName, ftInteger);
  end;

  with TIntegerField.Create(mdDet) do begin
    FieldName := 'bysn'; DataSet := mdDet; mdDet.FieldDefs.Add(FieldName, ftInteger);
  end;

  with TStringField.Create(mdDet) do begin
    FieldName := 'serial'; DataSet := mdDet; Size := 256; mdDet.FieldDefs.Add(FieldName, ftString);
  end;

  with TStringField.Create(mdDet) do begin
    FieldName := 'bname'; DataSet := mdDet; Size := 255; mdDet.FieldDefs.Add(FieldName, ftString);
  end;

  with TStringField.Create(mdDet) do begin
    FieldName := 'iname'; DataSet := mdDet; Size := 255; mdDet.FieldDefs.Add(FieldName, ftString);
  end;

  with TStringField.Create(mdDet) do begin
    FieldName := 'msrname'; DataSet := mdDet; Size := 20; mdDet.FieldDefs.Add(FieldName, ftString);
  end;

  with TFloatField.Create(mdDet) do begin
    FieldName := 'quantity'; DataSet := mdDet; mdDet.FieldDefs.Add(FieldName, ftFloat);
  end;

  FtmpPOSID := -1;

  FTreeSel := TfmTreeSelector.Create(nil);

  SetCaptions;

  lcbWhouse.InitRes;
  lcbWhouse.RefreshItemsDS; // to load warehouse list into popup.

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
{$IFDEF QWEQWE}
procedure TfrmEditWaybillOut.setid(const Value: integer);
  var
    intTmp: Integer;
    FTaxSumm, FPosNDS, FSumWONDS, FNDS, FPrice: Extended;
    APreffix, ASuffix: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWaybillOut.setid') else _udebug := nil;{$ENDIF}

  CloseMode := false;
  Screen.Cursor := crSQLWait;
  mdTmpIds.Close;
  mdTmpIds.Open;
  mdWMatTurn.Close;
  mdWMatTurn.Open;
  mdWMatTurnOld.Close;
  mdWMatTurnOld.Open;
  mdDet.Open;

  cdsPersonName.Open;
  lcbPersonName.KeyValue := 0;
  lcbPersonName.Text := '';

  edDate.Date := OnDate;
  edTime.Time := Time;
  edReason.Text := '';

  Fid := Value;

  //********** Чтение оборотов ***********************
  if (Value > 0) and not IsPattern then begin
    with newDataSet do
    try
      ProviderName := 'pWMatTurnOut_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FID;
      Open;
      mdWMatTurn.CopyFromDataSet(Fields[0].DataSet);
      Close;
      mdWMatTurnOld.CopyFromDataSet(mdWMatTurn.Fields[0].DataSet);

    finally
      Free;
    end;
  end;//if Value>0

  //*****************************
  with newDataSet do
  try
    chbPosting.Checked := optBundlingPostChecked;

    if ((Value = 0) or IsPattern) and optBundlingAutoNum
    then begin
      APreffix := optBundlingPrefix;
      ASuffix := optBundlingSuffix;
      FLastGen := '';

      FCurrNum := GetDocNumEx(dmData.SConnection, dtBundling, 1, APreffix, ASuffix, FLastGen, cdsEnts.FieldByName('kaid').AsInteger);

      edNum1.Text := APreffix + IntToStr(FCurrNum) + ASuffix;
    end
    else edNum1.Text := '';

    if Value > 0 then begin
      Self.Caption := rs('fmWaybill', 'TitleEditOut');

      ProviderName := 'pWaybill_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := Value;
      Open;
      if not IsEmpty then begin
        if not IsPattern then begin
          edNum1.Text := fieldbyname('num').AsString;
          edNum1.Tag := fieldbyname('defnum').AsInteger;
          edDate.Date := fieldbyname('ondate').AsDateTime;
          edTime.Time := fieldbyname('ondate').AsDateTime;
        end;

        if not fieldbyname('personid').IsNull then lcbPersonName.KeyValue := fieldbyname('personid').AsInteger;

        edReason.Text := fieldbyname('reason').asstring;

        if not FieldByName('entid').IsNull then cdsEnts.Locate('kaid', FieldByName('entid').AsInteger, []);

        edNotes.Text := FieldByName('notes').AsString;

        chbPosting.Checked := (Fieldbyname('CHECKED').AsInteger = 1);
        FPrevChecked := chbPosting.Checked;
      end;
      Close;

      // loading positions
      ProviderName := 'pWaybillDet_GetOut';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FID;
      Open;
      mdDet.LoadFromDataSet(Fields[0].DataSet);
      if not mdDet.IsEmpty then mdDet.First;
      Close;

      // service positions
      ProviderName := 'pWaybillSvc_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FID;
      Open;
      mdDet.LoadFromDataSet(Fields[0].DataSet);
      Close;

      if not mdDet.IsEmpty then begin
        mdDet.First;
        while not mdDet.Eof do begin
          if (mdDet.FieldByName('bySN').AsInteger = 1) and (mdDet.FieldByName('sn').AsString = '')
              and mdWMatTurn.Locate('sourceid', mdDet.FieldByName('posid').AsInteger,[])
          then begin
            mdDet.Edit;
            mdWMatTurn.First;

            while not mdWMatTurn.Eof do begin
              if (mdWMatTurn.FieldByName('sourceid').AsInteger = mdDet.FieldByName('posid').AsInteger)
                 and (not mdWMatTurn.FieldByName('SN').IsNull)
              then mdDet.FieldByName('SN').AsString := mdDet.FieldByName('SN').AsString + mdWMatTurn.FieldByName('SN').AsString + '; ';

              mdWMatTurn.Next;
            end;

            mdDet.FieldByName('SN').AsString := System.Copy(mdDet.FieldByName('SN').AsString,1,Length(mdDet.FieldByName('SN').AsString)-2);
            mdDet.Post;
          end;

          mdDet.Next;
        end;//while
      end;

      with dbgWaybillDet do if FocusedNode <> nil then FocusedNode.Selected := True;
    end // if Value > 0

    else begin
      Self.Caption := RS('fmWaybill','TitleAddOut');
      mdDet.Open;
      mdWMatTurn.Open;
      mdWMatTurnOld.CopyFromDataSet(mdWMatTurn);
    end;

    with cdsPersonName do begin
      if UserID <> 0 then begin
        Open;
        if Value <> 0 then begin // editing enabled only for document owner or admin
            if Locate('userid', UserID, []) and (lcbPersonName.KeyValue <> FieldByName('kaid').AsInteger)
            then EditingDisabled := True;
        end
        else if Locate('userid', UserID, []) then lcbPersonName.KeyValue := FieldByName('kaid').AsInteger;

        lcbPersonName.Enabled := False;
        btnPersonName.Enabled := False;
      end;
    end;

    FModified := False;

    if IsPattern then begin
      FPosModified := True;
      FID := 0;
      mdWMatTurn.Open;
      mdWMatTurnOld.CopyFromDataSet(mdWMatTurn);
      FShowRsvMsgs := False;
      aSetRsvAll.Execute;
      FShowRsvMsgs := True;
      dbgWaybillDet.ClearSelection;
      mdDet.First;

      with dbgWaybillDet do
        if FocusedNode <> nil then FocusedNode.Selected := True;
    end
    else FPosModified := False;

    if Value > 0 then begin
      mdDet.AfterPost := nil;
      mdDet.OnCalcFields := nil;
      mdDet.DisableControls;
      mdDet.First;
      while not mdDet.Eof do begin
        mdDet.Edit;
        if mdWMatTurn.Locate('sourceid', mdDet.FieldByName('posid').AsInteger, [])
          then mdDet.FieldByName('status').AsInteger := 1;
        mdDet.Post;

        UpdatePos;

        mdDet.Next;
      end; //while not mdDet.Eof

      mdDet.First;
      mdDet.AfterPost := mdDetAfterPost;
      mdDet.OnCalcFields := mdDetCalcFields;
      mdDet.EnableControls;

      FGridRefresh := True;
      FPosModified := True;
    end; // if Value > 0

    FPayDocModified := False;

  finally
    Free;
  end;

  SetAtt;

  if not GetUserAccessByClass(Self.ParentNameEx, uaPost) then begin
    chbPosting.Hint := rs('Common', 'noRights');
    chbPosting.Checked := False;
    chbPosting.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybillOut.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
   NewRecord: boolean;
   posList: String;
   BM:TBookmark;
   cdsTemp: TssClientDataSet;
   FPosID, FWDocID: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWaybillOut.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if (ModalResult = mrCancel) and (FID > 0) and CheckModified
    then ModalResult := mrOK;

  if ModalResult in [mrOK, mrYes] then begin
    CloseMode := True;
    CanClose := False;

    if chbPosting.Checked and not CheckOrdered(posList) then begin
      ssMessageDlg(Format(RS('fmWaybill', 'CantShipOrderedPos'), [posList]), ssmtError, [ssmbOk]);
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if not CheckDocDate(edDate.Date) then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    if CheckDatesIn then begin
      cdsTemp := newDataSet;

      with newDataSet do begin
        try
          //TrStart;

          try
            Screen.Cursor := crSQLWait;

            NewRecord := (ID=0);

            if NewRecord then FID := GetMaxID(dmData.SConnection, 'waybilllist', 'wbillid');

            if NewRecord
              then ProviderName := 'pWaybill_InsEx'
              else ProviderName := 'pWaybill_UpdEx';

            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Params.ParamByName('NUM').AsString := edNum1.Text;
            Params.ParamByName('DEFNUM').AsInteger := Integer(chbRetNDS.Checked);
            Params.ParamByName('ONDATE').AsDateTime := edDate.Date+edTime.Time;
            Params.ParamByName('KAID').AsInteger := edKAgent.KAID;
            Params.ParamByName('CURRID').AsInteger := cbCurr.KeyValue;
            Params.ParamByName('ONVALUE').AsFloat := edRate.Value;
            Params.ParamByName('ATTNUM').AsString := FAttNum;
            Params.ParamByName('ATTDATE').AsDate := FAttDate;
            Params.ParamByName('REASON').AsString := edReason.Text;
            Params.ParamByName('notes').AsString := edNotes.Text;

            if (lcbPersonName.EditText = '') or (lcbPersonName.KeyValue <= 0) then begin
              Params.ParamByName('PERSONID').DataType := ftInteger;
              Params.ParamByName('PERSONID').Clear;
            end
            else Params.ParamByName('PERSONID').AsInteger := lcbPersonName.KeyValue;

            Params.ParamByName('CHECKED').AsInteger := integer(chbPosting.Checked);
            Params.ParamByName('WTYPE').AsInteger := -1; // тип накладной 1-приходная; -1-расходная;
            Params.ParamByName('DELETED').AsInteger := 0;
            Params.ParamByName('SUMMALL').AsFloat := RoundToA(ALLSUMM,-2);
            Params.ParamByName('SUMMINCURR').AsFloat := AllSummCurr;

            Params.ParamByName('NDS').DataType := ftFloat;
            Params.ParamByName('NDS').Clear;

            Params.ParamByName('RECEIVED').AsString := FAttRcv;

            Params.ParamByName('TODATE').DataType := ftDateTime;
            Params.ParamByName('TODATE').Clear;

            if cdsEnts.IsEmpty then begin
              Params.ParamByName('entid').DataType := ftInteger;
              Params.ParamByName('entid').Clear;
            end
            else Params.ParamByName('entid').AsInteger := cdsEnts.FieldByName('kaid').AsInteger;

            Execute;//Записали в waybilllist

            if FPosModified then begin // Запись позиций в накладную
              // 2 Удаляем позиции
              ProviderName := 'pWaybillDet_Del';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := FID;
              Execute;

              ProviderName := 'pWaybillSvc_Del';
              FetchParams;
              Params.ParamByName('wbillid').AsInteger := FID;
              Execute;

              // 3 Запись позиций из mdDet в waybilldet
              BM := mdDet.GetBookmark;
              mdDet.DisableControls;
              mdDet.First;

              while not mdDet.Eof do begin
                if mdDet.FieldByName('postype').AsInteger = 0 then begin
                  ProviderName := 'pWaybillDet_Ins';
                  FetchParams;
                  FPosID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
                  Params.ParamByName('POSID').AsInteger := FPosID;

                  //3.1 Ставим реальные Sourceid для оборотов
                  mdWMatTurn.First;
                  while not mdWMatTurn.Eof do begin
                    if mdWMatTurn.FieldByName('sourceid').AsInteger = mdDet.fieldbyname('posid').AsInteger then begin
                      mdWMatTurn.Edit;
                      mdWMatTurn.FieldByName('sourceid').AsInteger := Params.ParamByName('POSID').AsInteger;
                      mdWMatTurn.Post;
                    end;
                    mdWMatTurn.Next;
                  end;

                  mdDet.Edit;
                  mdDet.FieldByName('realposid').AsInteger := FPosID;
                  mdDet.Post;
                  //**************************

                  if Params.ParamByName('POSID').AsInteger < 0
                    then raise Exception.Create(rs('fmWaybill', 'ErrorAddPos'));

                  Params.ParamByName('WBILLID').AsInteger := FID;
                  Params.ParamByName('MATID').AsInteger := mdDet.fieldbyname('MATID').AsInteger;
                  Params.ParamByName('WID').AsInteger := mdDet.fieldbyname('WID').AsInteger;
                  Params.ParamByName('AMOUNT').AsFloat := RoundToA(StrToFloat(mdDet.fieldbyname('AMOUNT').AsString), MatDisplayDigits);
                  Params.ParamByName('PRICE').AsFloat := StrToFloat(mdDet.fieldbyname('PRICE').AsString);
                  Params.ParamByName('onvalue').AsFloat := StrToFloat(mdDet.fieldbyname('onvalue').AsString);
                  Params.ParamByName('DISCOUNT').AsFloat := StrToFloat(mdDet.fieldbyname('DISCOUNT').AsString);
                  Params.ParamByName('NDS').AsFloat := StrToFloat(mdDet.fieldbyname('NDS').AsString);
                  Params.ParamByName('CurrId').AsInteger := cbCurr.KeyValue;
                  Params.ParamByName('OnDate').AsDateTime := edDate.Date+edTime.Time;

                  if mdDet.fieldbyname('PTypeID').IsNull then begin
                    Params.ParamByName('PTypeID').DataType := ftInteger;
                    Params.ParamByName('PTypeID').Clear;
                  end
                  else Params.ParamByName('PTypeID').AsInteger := mdDet.fieldbyname('PTypeID').AsInteger;

                  Params.ParamByName('NUM').AsInteger := mdDet.RecNo;
                  Params.ParamByName('total').AsFloat := mdDet.fieldbyname('total').AsFloat;
                  Execute; //Записываем очередную позицию

                  SaveAddProps(FPosID);
                  SaveTaxes(FPosID);
                  SaveSerial(FPosID);
                end
                else begin
                  ProviderName := 'pWaybillSvc_Ins';
                  FetchParams;
                  FPosID := GetMaxID(dmData.SConnection, 'waybillsvc', 'posid');
                  Params.ParamByName('posid').AsInteger := FPosID;
                  Params.ParamByName('wbillid').AsInteger := FID;
                  Params.ParamByName('svcid').AsInteger := mdDet.fieldbyname('matid').AsInteger;
                  Params.ParamByName('amount').AsFloat := RoundToA(StrToFloat(mdDet.fieldbyname('amount').AsString), MatDisplayDigits);
                  Params.ParamByName('price').AsFloat := StrToFloat(mdDet.fieldbyname('price').AsString);
                  Params.ParamByName('norm').AsFloat := StrToFloat(mdDet.fieldbyname('norm').AsString);
                  Params.ParamByName('discount').AsFloat := StrToFloat(mdDet.fieldbyname('discount').AsString);
                  Params.ParamByName('nds').AsFloat := StrToFloat(mdDet.fieldbyname('NDS').AsString);
                  Params.ParamByName('currid').AsInteger := cbCurr.KeyValue;
                  Params.ParamByName('num').AsInteger := mdDet.RecNo;

                  if not mdDet.FieldByName('personid').IsNull
                    then Params.ParamByName('personid').AsInteger := mdDet.FieldByName('personid').AsInteger
                    else begin
                      Params.ParamByName('personid').DataType := ftInteger;
                      Params.ParamByName('personid').Clear;
                    end;

                  Execute;

                  mdDet.Edit;
                  mdDet.FieldByName('realposid').AsInteger := FPosID;
                  mdDet.Post;
                end;

                mdDet.Next;
              end;//while not mdDet.Eof

              mdDet.GotoBookmark(BM);
              FreeBookmark(BM);
              mdDet.EnableControls;

              //2)Запись в обороты
              mdWMatTurn.First;
              while not mdWMatTurn.Eof do begin
                ProviderName := 'pWMatTurnOut_Ins';
                FetchParams;
                Params.ParamByName('PosID').AsInteger := mdWMatTurn.fieldbyname('posid').AsInteger;
                Params.ParamByName('MatID').AsInteger := mdWMatTurn.fieldbyname('matid').AsInteger;
                Params.ParamByName('WID').AsInteger := mdWMatTurn.fieldbyname('wid').AsInteger;
                Params.ParamByName('SOURCEID').AsInteger := mdWMatTurn.fieldbyname('SOURCEID').AsInteger;

                if chbPosting.Checked
                  then Params.ParamByName('TurnType').AsInteger := -1
                  else Params.ParamByName('TurnType').AsInteger := 2;

                Params.ParamByName('OnDate').AsDateTime := edDate.Date+edTime.Time;
                Params.ParamByName('Amount').AsFloat := RoundToA(strtofloat(mdWMatTurn.fieldbyname('amount').AsString), MatDisplayDigits);

                Execute;

                mdWMatTurn.Next;
              end;

            end;//if FPosModified

            FPosModified := False; //Сбрасываем флаг изменения позиций

            FModified := False;//флаг изменения документа false

            //TrCommit;

            if chbPosting.Checked then begin
              DoRecalcDCByWB(dmData.SConnection, FID);
              DoRecalcKASaldo(dmData.SConnection, edKAgent.KAID, edDate.Date, RS('fmWaybill', 'RecalcBallance'));
            end;

            if (ModalResult = mrYes) then begin
              if NewRecord then begin
                mdDet.Close;
                mdWMatTurn.Close;
                mdTmpIds.Close;
                dmData.SConnection.AppServer.Rsv_Delete(-1);

                ID := 0;

                if WBOutAutoNum
                  then edKAgent.SetFocus
                  else edNum1.SetFocus;
              end//if NewRecord
             else begin
                if chbPosting.Checked
                  then CanClose := true
                  else dmData.SConnection.AppServer.Rsv_Delete(-1);
              end//else NewRecord
            end // if (ModalResult = mrYes)
            else begin
              dmData.SConnection.AppServer.Rsv_Delete(-1);
              CanClose := True;
            end;

            FGridRefresh := true;
            FPaySummChange := true;

            RefreshFun('TfmPayDoc', 0);

            RefreshFun('TfmWMat', 0);

            RefreshFun('TfmFinance', 0);
            RefreshFun('TfmDiscCards', 0);

            case CountryRules.AR of
              accRul_UA: RefreshFun('TfmTaxWB', 0);
            end;

          finally
            Free;
            cdsTemp.Free;
            Screen.Cursor := crDefault;
          end;

        except
          on e:exception do begin
            TrRollback;
            raise;
          end;
        end;
      end;// with TClientDataSet.Create(nil)
    end;//if CheckDatesIn then begin
  end // modalresult ok,yes

  else begin
    if FLastGen = '' then begin
      if GetDocNum(dmData.SConnection, dtWBOut, 0) = FCurrNum
        then GetDocNum(dmData.SConnection, dtWBOut, -1);
    end
    else begin
      if Gen_ID(dmData.SConnection, FLastGen, 0) = FCurrNum
        then Gen_ID(dmData.SConnection, FLastGen, -1);
    end;

    if GetDocNum(dmData.SConnection, dtPDIn, 0) = FCurrPayNum
      then GetDocNum(dmData.SConnection, dtPDIn, -1);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;//FormCloseQuery


//==============================================================================================
procedure TfrmEditWaybill.setid(const Value: integer);
  var
    FItem: TcxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWaybill.setid') else _udebug := nil;{$ENDIF}

  {$IFDEF LIMITED}if Value = 0 then CheckDocumentsCountLimit(wbtWaybillIn);{$ENDIF}

  Screen.Cursor := crSQLWait;

  cdsPersonName.Open;
  lcbPersonName.KeyValue := 0;
  lcbPersonName.Text := '';

  //Установка валюты по умолчанию
  edDate.Date := OnDate;
  edTime.Time := Time;

  mdDet.Open;
  Fid := Value;

  with newDataSet do
    try
      //Установка номера по умолчанию
      chbPosting.Checked := WBInChecked;

      if ((Value = 0) or IsPattern) and WBInAutoNum then begin
        FCurrNum := GetDocNum(dmData.SConnection, dtWBIn, 1);
        edNum1.Text := WBInPrefix + IntToStr(FCurrNum) + WBInSuffix;
      end
      else edNum1.Text := '';

      if Value <> 0 then begin // existing record
       if IsPattern
         then Self.Caption := rs('fmWaybill', 'TitleAdd')
         else Self.Caption := rs('fmWaybill', 'TitleEdit');

        ProviderName := 'pWaybill_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := Value;
        Open;

        if not IsEmpty then begin
          if not IsPattern then edNum1.Text := fieldbyname('num').AsString;

          edNum1.Tag := fieldbyname('defnum').AsInteger;

          if not IsPattern then begin
            eddate.Date := fieldbyname('ondate').AsDateTime;
            edTime.Time := fieldbyname('ondate').AsDateTime;
          end;

          edKAgent.OnChange := nil;
          edKAgent.KAID := fieldbyname('kaid').AsInteger;
          edKAgent.OnChange := edKAgentEnter;

          if not fieldbyname('personid').IsNull
           then lcbPersonName.KeyValue := fieldbyname('personid').AsInteger;

          oldkaid := fieldbyname('kaid').AsInteger;
          edReason.Text := fieldbyname('REASON').asstring;
          edNotes.Text := FieldByName('notes').AsString;

          chbPosting.Checked := fieldbyname('CHECKED').AsInteger = 1;
        end; // if not IsEmpty
        Close;

        ProviderName := prvDet; // pWaybillDet_GetIn (1.4.9)
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := FID;
        Open;
        mdDet.LoadFromDataSet(Fields[0].DataSet);
        mdDet.First;

        while not mdDet.Eof do begin
          mdDet.Edit;
          UpdatePos; // update service-positions list in mdSvc
          mdDet.Next;
        end;

        if not mdDet.IsEmpty then mdDet.First;

        if not mdDet.IsEmpty then begin
          if dbgWaybillDet.FocusedNode = nil then dbgWaybillDet.FocusedAbsoluteIndex := 0;
          dbgWaybillDet.FocusedNode.Selected := True;
        end;
        Close;

        if IsPattern then begin
          FID := 0;
          FPosModified := True;
        end;
      end//if Value<>0
      else begin
        Self.Caption := rs('fmWaybill', 'TitleAdd');

        with cdsPayMPersons do begin
          if Locate('userid', UserID, []) then lcbPersonName.KeyValue := FieldByName('kaid').AsInteger;
        end;
      end;

      if UserID <> 0 then begin
        lcbPersonName.Enabled := False;
        btnPersonName.Enabled := False;

        if Value <> 0 then  // editing enabled only for document owner or admin
          with cdsPayMPersons do
            if Locate('userid', UserID, []) and (lcbPersonName.KeyValue <> FieldByName('kaid').AsInteger)
            then EditingDisabled := True;
      end;

      FModified := false;

      if IsPattern
        then FPosModified := True
        else FPosModified := False;

      FGridRefresh := true;

    finally
      Free;
    end;

  if not GetUserAccessByClass(Self.ParentNameEx, uaPost) then begin
    chbPosting.Hint := rs('Common', 'noRights');
    chbPosting.Checked := False;
    chbPosting.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWaybill.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: boolean;
    BM: TBookmark;
    tmpid:integer;
    FPosID, intTmp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWaybill.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    if not CheckDocDate(edDate.Date) then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    with newDataSet do begin
      try
        Screen.Cursor := crSQLWait;
        NewRecord := (ID = 0);

        if NewRecord then FID := GetMaxID(dmData.SConnection, 'waybilllist', 'wbillid');

        TrStart;

        try
          if NewRecord
            then ProviderName := 'pWaybill_InsEx'
            else ProviderName := 'pWaybill_UpdEx';

          FetchParams;
          Params.ParamByName('WBILLID').AsInteger := FID;
          Params.ParamByName('NUM').AsString := edNum1.Text;

          if edNum.Tag > 0
            then Params.ParamByName('DEFNUM').AsInteger := edNum.Tag
            else Params.ParamByName('DEFNUM').AsInteger := GetNextDefNum(dmData.SConnection, 1);

          Params.ParamByName('ONDATE').AsDateTime := edDate.Date + edTime.Time;
          Params.ParamByName('KAID').AsInteger := edKAgent.KAID;
          Params.ParamByName('CURRID').AsInteger := cbCurr.KeyValue;
          Params.ParamByName('ONVALUE').AsFloat := edRate.Value;

          if lcbWH.Combo.EditingText = ''
            then Params.ParamByName('ATTNUM').AsString := ''
            else Params.ParamByName('ATTNUM').AsString := IntToStr(lcbWH.WID);

          Params.ParamByName('ATTDATE').AsDate := 0;
          Params.ParamByName('REASON').AsString := edReason.EditingText;
          Params.ParamByName('notes').AsString := edNotes.EditingText;

          if (lcbPersonName.EditText = '') or (lcbPersonName.KeyValue = 0) then begin
            Params.ParamByName('PERSONID').DataType := ftInteger;
            Params.ParamByName('PERSONID').Clear;
          end
          else Params.ParamByName('PERSONID').AsInteger := lcbPersonName.KeyValue;

          Params.ParamByName('CHECKED').AsInteger := integer(chbPosting.Checked);
          Params.ParamByName('WTYPE').AsInteger := wbtBundling;
          Params.ParamByName('DELETED').AsInteger := 0;
          Params.ParamByName('SUMMALL').AsFloat := 0.0;
          Params.ParamByName('SUMMINCURR').AsFloat := 0.0;
          Params.ParamByName('NDS').AsFloat := 0.0;
          Params.ParamByName('RECEIVED').AsString := '';
          Params.ParamByName('TODATE').DataType := ftDateTime;
          Params.ParamByName('TODATE').Clear;
          Params.ParamByName('entid').DataType := ftInteger;
          Params.ParamByName('entid').Clear;

          Execute;//Записали в waybilllist

          if FPosModified then begin // Запись позиций в накладную
            ProviderName := 'pWaybillDet_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := ID;
            Execute;  //Удалили позиции

            ProviderName := 'pWaybillSvc_Del';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FID;
            Execute;

            BM := mdDet.GetBookmark;
            mdDet.DisableControls;
            mdDet.First; // Запись позиций из mdDet в waybilldet

            while not mdDet.Eof do begin
              if mdDet.FieldByName('postype').AsInteger = 0 then begin
                ProviderName := 'pWaybillDet_InsIn';
                FetchParams;

                FPosID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');

                Params.ParamByName('posid').AsInteger := FPosID;

                if FPosID < 0 then raise Exception.Create(rs('fmWaybill', 'ErrorAddPos'));

                tmpid := Params.ParamByName('POSID').AsInteger;

                Params.ParamByName('wbillid').AsInteger := FID;

                Params.ParamByName('MATID').AsInteger := mdDet.fieldbyname('MATID').AsInteger;
                Params.ParamByName('WID').AsInteger := mdDet.fieldbyname('WID').AsInteger;
                Params.ParamByName('AMOUNT').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('AMOUNT').AsString), MatDisplayDigits);
                Params.ParamByName('onvalue').AsFloat := StrToFloat(mdDet.fieldbyname('onvalue').AsString);
                Params.ParamByName('PRICE').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('PRICE').AsString), -6);
                Params.ParamByName('baseprice').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('fullprice').AsString), -6);
                Params.ParamByName('DISCOUNT').DataType := ftFloat;
                Params.ParamByName('DISCOUNT').Clear;
                Params.ParamByName('NDS').AsFloat := StrToFloat(mdDet.FieldByName('nds').AsString);
                Params.ParamByName('CurrId').AsInteger := cbCurr.KeyValue;
                Params.ParamByName('OnDate').AsDateTime := edDate.Date + edTime.Time;
                Params.ParamByName('PTypeID').DataType := ftInteger;
                Params.ParamByName('PTypeID').Clear;
                Params.ParamByName('NUM').AsInteger := mdDet.RecNo;
                Params.ParamByName('total').AsFloat := 0;

                Execute; //Записываем очередную позицию

                //write s/n
                if not mdDet.fieldbyname('sn').IsNull then begin
                  ProviderName := 'rSN_Ins';
                  FetchParams;
                  Params.ParamByName('sid').AsInteger := GetMaxID(dmData.SConnection, 'serials', 'sid');
                  Params.ParamByName('posid').AsInteger := FPosID;
                  Params.ParamByName('serialno').AsString := mdDet.fieldbyname('sn').AsString;
                  Execute;
                end;

                ProviderName := 'pWaybillDetAP_Del';
                FetchParams;
                Params.ParamByName('posid').AsInteger := FPosID;
                Execute;

                if (mdDet.FieldByName('producer').AsString <> '') or (mdDet.FieldByName('certnum').AsString <> '')
                   or (mdDet.FieldByName('gtd').AsString <> '') or (mdDet.FieldByName('certdate').AsDateTime <> 0)
                then begin
                  ProviderName := 'pWaybillDetAP_Ins';
                  FetchParams;
                  Params.ParamByName('posid').AsInteger := FPosID;
                  Params.ParamByName('producer').AsString := mdDet.FieldByName('producer').AsString;
                  Params.ParamByName('certnum').AsString := mdDet.FieldByName('certnum').AsString;
                  Params.ParamByName('gtd').AsString := mdDet.FieldByName('gtd').AsString;

                  if mdDet.FieldByName('certdate').AsDateTime = 0 then begin
                    Params.ParamByName('certdate').DataType := ftDateTime;
                    Params.ParamByName('certdate').Clear;
                  end
                  else Params.ParamByName('certdate').AsDateTime := mdDet.FieldByName('certdate').AsDateTime;

                  Params.ParamByName('cardid').DataType := ftInteger;
                  Params.ParamByName('cardid').Clear;
                  Execute;
                end;
              end // if mdDet.FieldByName('postype').AsInteger = 0
              else begin
                ProviderName := 'pWaybillSvc_InsIn';
                FetchParams;
                FPosID := GetMaxID(dmData.SConnection, 'waybillsvc', 'posid');
                Params.ParamByName('posid').AsInteger := FPosID;
                Params.ParamByName('wbillid').AsInteger := FID;
                Params.ParamByName('svcid').AsInteger := mdDet.fieldbyname('matid').AsInteger;
                Params.ParamByName('amount').AsFloat := RoundToA(StrToFloat(mdDet.fieldbyname('amount').AsString), MatDisplayDigits);
                Params.ParamByName('price').AsFloat := StrToFloat(mdDet.fieldbyname('price').AsString);
                Params.ParamByName('norm').AsFloat := StrToFloat(mdDet.fieldbyname('norm').AsString);
                Params.ParamByName('discount').AsFloat := StrToFloat(mdDet.fieldbyname('discount').AsString);
                Params.ParamByName('nds').AsFloat := StrToFloat(mdDet.fieldbyname('NDS').AsString);
                Params.ParamByName('currid').AsInteger := cbCurr.KeyValue;
                Params.ParamByName('num').AsInteger := mdDet.RecNo;
                Params.ParamByName('svctoprice').AsInteger := mdDet.FieldByName('svctoprice').AsInteger;

                if not mdDet.FieldByName('personid').IsNull
                  then Params.ParamByName('personid').AsInteger := mdDet.FieldByName('personid').AsInteger
                  else begin
                    Params.ParamByName('personid').DataType := ftInteger;
                    Params.ParamByName('personid').Clear;
                  end;
                Execute;
              end;

              mdDet.Next;
            end;//while not mdDet.Eof

            mdDet.GotoBookmark(BM);
            FreeBookmark(BM);
            mdDet.EnableControls;

            FPosModified := False;
          end;//if FPosModified

          if chbPosting.Checked then begin  //Если документ проведён то
            //1)Удаление из оборотов        //записываем позиции на склад
            ProviderName := 'pWMatTurn_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Execute;

            //4)Запись в обороты
            ProviderName := 'pWMatTurn_Ins';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Execute;
          end//if chbPosting.Checked
          else begin //Если документ не проведён, то удаляем позиции со склада
            //1)Удаление из оборотов
            ProviderName := 'pWMatTurn_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Execute;
          end;//else if chbPosting.Checked

          FModified := False;

          TrCommit;

        except
          on e:exception do begin
            TrRollback;
            raise;
          end;
        end;

        if (ModalResult = mrYes) then
          if NewRecord then begin
            edDate.Date := Date;
            edReason.Text := '';
            chbPosting.Checked := false;
            mdDet.Close;

            ID := 0;

            if WBInAutoNum
              then edKAgent.Editor.SetFocus
              else edNum1.SetFocus;
          end//if NewRecord
          else begin
            if chbPosting.Checked then CanClose := true;
          end//else NewRecord
        else CanClose := True;

        FGridRefresh := true;

        SendMessage(MainHandle, WM_REFRESH, ID, 0);

        RefreshFun('TfmWMat', 0);
        RefreshFun('TfmFinance', 0);

      finally
        Free;
        Screen.Cursor := crDefault;
      end;
    end;// with TClientDataSet.Create(nil)
  end;// if ModalResult in [mrOK, mrYes]

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end; //FormCloseQuery
{$ENDIF}

//==============================================================================================
//==============================================================================================
//==============================================================================================
procedure TfrmBundling.SetID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBundling.setID') else _udebug := nil;{$ENDIF}

  if Value <> 0 then begin
  end // Value <> 0 (existing document)
  else begin // new document
    mdDet.Open;
    btnSetTimeClick(btnSetTime);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBundling.aAddBundleExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBundling.aAddBunleExecute') else _udebug := nil;{$ENDIF}

  with FtreeSel do begin
    if SessionID <> -1 then begin
      SessionID := -1;
      Provider := 'pBundles_GetForTreeSel';
      TreeMode := True;
      SelectableType(1);
      AddColumn('name', rs('fmMaterials', 'Name'));
      AddColumn('model', rs('fmMaterials', 'Artikul'));
      AddColumn('bysn', '', False);
    end;
  end;

  FtreeSel.Open(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBundling.WMTreeSelect(var M: TMessage);
  var
    bundleid, i, n: Integer;
    BM: TBookMark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBundling.WMTreeSelect') else _udebug := nil;{$ENDIF}

  if FtreeSel.SessionID = -1 then begin
    bundleid := Ftreesel.DataSet.FieldByName('ID').AsInteger;

    grdDet.BeginUpdate;

    with Ftreesel.DataSet do begin
      mdDet.Append;
      // for new items POSID is negative number. it is needed to be set to be referenced by items in bundle
      mdDet.FieldByName('POSID').asInteger  := FTmpPOSID;
      mdDet.FieldByName('ID').AsInteger     := bundleid;
      mdDet.FieldByName('PID').AsInteger    := 0;
      mdDet.FieldByName('Type').AsInteger   := -1;
      mdDet.FieldByName('BName').AsString   := FieldByName('Name').AsString + ' / ' + FieldByName('Model').AsString;
      mdDet.FieldByName('bysn').AsString    := FieldByName('bysn').AsString;
      mdDet.FieldByName('serial').AsString  := '';
      mdDet.FieldByName('Msrname').AsString := '';
      mdDet.FieldByName('Quantity').AsFloat := 1.0;
      mdDet.Post;
    end;

    // adding products from bundle
    with newDataSet do try
      ProviderName := 'pBundle_Get';
      FetchParams;
      Params.ParamByName('bundleid').asInteger := Ftreesel.DataSet.FieldByName('ID').AsInteger;

      Open;
      while not eof do begin
        // separate items with S/N
        n := ifThen(1 = FieldByName('bysn').asInteger, floor(FieldByName('quantity').asFloat), 1);

        for i := 1 to n do begin
          mdDet.Append;
          mdDet.FieldByName('POSID').asInteger  := -1;
          mdDet.FieldByName('SRCPOSID').asInteger := -1;
          mdDet.FieldByName('ID').AsInteger     := FieldByName('ItemID').AsInteger;
          mdDet.FieldByName('PID').AsInteger    := FtmpPOSID;
          mdDet.FieldByName('Type').AsInteger   := FieldByName('ItemType').AsInteger;
          mdDet.FieldByName('IName').AsString   := FieldByName('Name').AsString + ' / ' + FieldByName('Model').AsString;
          mdDet.FieldByName('Msrname').AsString := FieldByName('Msrname').AsString;

          if 1 = FieldByName('bysn').asInteger
            then mdDet.FieldByName('Quantity').AsFloat := 1.0
            else mdDet.FieldByName('Quantity').AsFloat := FieldByName('Quantity').AsFloat;

          mdDet.FieldByName('bysn').asInteger    := FieldByName('bysn').asInteger;
          mdDet.FieldByName('serial').AsString  := '';
          mdDet.Post;
        end; // for i : = 1 to n

        Next;
      end;
      Close;

    finally
      Free;
    end; //with newDataSet

    grdDet.EndUpdate;

    dec(FTmpPOSID);
  end //if FtreeSel.SessionID = -1 (bundle adding)

  else if FtreeSel.SessionID > 0 then begin // select item for bundle
    mdDet.Edit;
    with Ftreesel.DataSet do begin
      mdDet.FieldByName('SRCPOSID').asInteger := FieldByName('POSID').AsInteger;
      mdDet.FieldByName('serial').AsString    := FieldByName('Serial').AsString;
    end; // with Ftreesel.DataSet
    mdDet.Post;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBundling.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBundling.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  lcbWhouse.Enabled := (grdDet.Count = 0);

  btnNew.Enabled := (lcbWhouse.WID > 0);
  btnShowWmat.enabled := btnNew.Enabled;
  btnDel.Enabled := btnNew.Enabled;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBundling.colDetQuantityGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  var
    v: extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBundling.colDetQuantityGetText') else _udebug := nil;{$ENDIF}

  try
    v := ssStrToFloat(Atext);
    if floor(v) = v then Atext := IntTostr(floor(v)); // strip unnecessary fractional data

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBundling.grdDetKeyPress(Sender: TObject; var Key: Char);
  var
    ANode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBundling.colDetQuantityGetText') else _udebug := nil;{$ENDIF}

  Anode := grdDet.FocusedNode;

  if (key <> #13) or (mdDet.FieldByName('type').asInteger <> -1) or (mdDet.FieldByName('bysn').asInteger <> 1)
     or (mdDet.FieldByName('quantity').asFloat <= 1)
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;
  // duplicate S/N bearing bundles according to the new quantity number

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBundling.colDetQuantityChange(Sender: TObject);
  var
    ANode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBundling.colDetQuantityChange') else _udebug := nil;{$ENDIF}

  Anode := grdDet.FocusedNode;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBundling.colDetQuantityValidate(Sender: TObject; var ErrorText: String; var Accept: Boolean);
  var
    ANode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBundling.colDetQuantityValidate') else _udebug := nil;{$ENDIF}

  Anode := grdDet.FocusedNode;

  try
    // no fractions for bundles
    if (mdDet.FieldByName('type').asInteger = -1) and (
        (frac(Anode.Values[colDetQuantity.Index]) <> 0.0)
        or (Anode.Values[colDetQuantity.Index] < 1.0)
       )
    then begin
      Accept := False;
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

  except
    Accept := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBundling.lcbWHouseChange(Sender: TObject);
  var
    h: boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBundling.lcbWHouseChange') else _udebug := nil;{$ENDIF}

  ActionListUpdate(nil, h);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBundling.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FTreeSel.Destroy;
end;

//==============================================================================================
procedure TfrmBundling.aAddProdExecute(Sender: TObject);
  var
    matids: String;
    itemID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBundling.aAddProdExecute') else _udebug := nil;{$ENDIF}

  if grdDet.FocusedNode = nil then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  itemId := grdDet.FocusedNode.Values[colDetID.Index];

  if -1 = grdDet.FocusedNode.Values[colDetType.Index] then begin // bundle
  end
  else begin // product
    matids := IntToStr(itemId);
  end;

  with FtreeSel do begin
    if SessionID <> itemID then begin
      SessionID := itemID;
      Provider := 'pBundle_Get_ProdRemains';
      ListMode := True;

      SelectableType(1);

      AddColumn('id', '', False);
      AddColumn('posid', '', False);
      AddColumn('isserial', '', False); // S/N on/off
      AddColumn('num', '', False); // don't remember what it is ;)
      AddColumn('invnumb', '', False); // unused now
      AddColumn('posdate', '', False);
      AddColumn('matname',   rs('fmMaterials', 'Name'),      True, 100);
      AddColumn('model',     rs('fmMaterials', 'Artikul'),   True, 100);
      AddColumn('grpname',   rs('fmMaterials', 'GrpDepend'), True,  50);
      AddColumn('serial',    rs('fmWmat', 'SN'),             True,  50);
      AddColumn('remain',    rs('fmWmat', 'remainAtWH'),     True,  40);
      AddColumn('rsv',       rs('fmWmat', 'reserved'),       True,  40);
      AddColumn('msrname',   rs('fmMaterials', 'Measure'),   True,  50);
      AddColumn('avgprice',  rs('fmWmat', 'AvgPrice'),       True,  50);
      AddColumn('minreserv', rs('fmMaterials', 'MinReserv'), True,  50);
      AddColumn('ordered',   rs('fmWmat', 'Ordered'),        True,  50);
      AddColumn('orsv',      rs('fmWmat', 'reserved'),       True,  50);
      AddColumn('barcode',   rs('fmWmat', 'Barcode'),        True, 100);
      AddColumn('country',   rs('fmMaterials', 'Country'),   True, 100);
      AddColumn('producer',  rs('fmMaterials', 'Producer'),  True, 100);

      dsParams.ParamByName('matids').asString := matids;
      dsParams.ParamByName('wid').asInteger := lcbWhouse.WID;
      dsParams.ParamByName('ondate').asDateTime := now;
    end;
  end;

  FtreeSel.Open(Self, 'posdate', (ChargeType <> ctFIFO));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBundling.btnSetTimeClick(Sender: TObject);
begin
  edDate.Date := now;
  edTime.Time := now;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Bundling', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.

