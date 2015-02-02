{$I ok_sklad.inc}
unit fWBRest;

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
  TfmWBRest = class(TfmBaseWBDoc)
    aPosProps: TAction;
    cdsDetailARCHIVED: TIntegerField;
    cdsDetailCERTDATE: TDateTimeField;
    cdsDetailCERTNUM: TStringField;
    cdsDetailGRPID: TIntegerField;
    cdsDetailGTD: TStringField;
    cdsDetailPRODUCER: TStringField;
    cdsDetailsn: TStringField;
    cdsMainCHECKED: TIntegerField;
    cdsMainCURRID: TIntegerField;
    cdsMainCURRNAME: TStringField;
    cdsMainCURRRATE: TFloatField;
    cdsMainDOCID: TIntegerField;
    cdsMainKAID: TIntegerField;
    cdsMainNDS: TFloatField;
    cdsMainNOTES: TStringField;
    cdsMainNUM: TStringField;
    cdsMainnumex: TIntegerField;
    cdsMainONDATE: TDateTimeField;
    cdsMainPERSONID: TIntegerField;
    cdsMainPERSONNAME: TStringField;
    cdsMainREASON: TStringField;
    cdsMainSUMMALL: TFloatField;
    cdsMainSUMMINCURR: TFloatField;
    cdsMainWBILLID: TIntegerField;
    cdsMainWTYPE: TIntegerField;
    colNumEx: TdxDBGridColumn;
    colReason: TdxDBGridColumn;
    colSN: TdxDBGridColumn;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aPosPropsExecute(Sender: TObject);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummInCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure FrameResize(Sender: TObject);
    procedure grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);

  public
    procedure DoOpen(AParam: Variant); override;
    procedure DoCheck(EditRequest: Boolean); override;
    procedure DoDelete; override;
    procedure DoPrint(AParam: integer = 0); override;
    procedure UpdateActionList; override;
    procedure SetCaptions; override;
    procedure DoShowFilter; override;
    procedure NotifyChanged; override;

  end;

var
  fmWBRest: TfmWBRest;

implementation

uses
  ssDateUtils, ClientData, fMessageDlg, prFun, prConst, StrUtils,
  ssCallbackConst, DocsList, BaseFrame, EditWBRest, prRep, ssBaseConst, ssFun,
  BaseRef, EditPosition, ssStrUtil, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmWBRest.DoShowFilter;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.DoShowFilter') else _udebug := nil;{$ENDIF}

  inherited;
  FrameResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBRest.cdsMainBeforeOpen(DataSet: TDataSet);
  var
    M: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  M := '';

  with cdsMain do begin
    case cbChecked.EditValue of
      0: Params.ParamByName('in_checked').AsInteger := -1;
      1: Params.ParamByName('in_checked').AsInteger := 1;
      2: Params.ParamByName('in_checked').AsInteger := 0;
    end;

    Params.ParamByName('wh').AsString := AllowedWH;
    Params.ParamByName('allwh').AsInteger := 0; // allwh sp param. forgot to remove... ;)

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
procedure TfmWBRest.DoCheck(EditRequest: Boolean);
  var
    WBillID: Integer;
    eStr: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.DoCheck') else _udebug := nil;{$ENDIF}

  with newDataSet do
    try
      eStr := '';
      WBillID := cdsMain.fieldbyname('wbillid').AsInteger;

      if grdMain.FocusedNode.Values[colChecked.Index] = 0 then begin
        if ssMessageDlg(rs('Common','CheckConfirm'),ssmtWarning, [ssmbYes, ssmbNo]) = mrYes then begin

          Application.ProcessMessages;
          TrStart;

          try
          //1)Удаление из оборотов
            ProviderName := 'pWMatTurn_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Execute;

            //4)Запись в обороты
            ProviderName := 'pWMatTurn_InsEx';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Execute;

            //5)Запись в CHECKED=1
            ProviderName := 'pWaybillCheck_Set1';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Execute;
            TrCommit;
            DoRefresh(0);
            UpdateActionList;

            if RefreshAllClients then begin
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
            end;

          except
            on E: Exception do begin
              TrRollback;
              ssMessageDlg(E.Message,ssmtError, [ssmbOK]);
            end;
          end;
        end;
      end
      else begin
        Screen.Cursor := crSQLWait;
        //проверка расхода
        ProviderName := 'pWayBill_CheckOut1';
        FetchParams;
        Params.ParamByName('WBILLID').AsInteger := WBILLID;
        Open;
        if Fields[0].AsInteger > 0 then begin
          Screen.Cursor := crDefault;

          if ssMessageDlg(rs('fmWaybill','CheckOut')+#13+rs('fmWaybill','CheckOut2'), ssmtError, [ssmbYes, ssmbCancel]) = mrYes then begin
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
                Caption := rs(Name, 'DocsList_Title') + ' "' + rs(Self.Name,'TitleWB') + amountPrefix
                           + cdsMain.fieldbyname('num').AsString + rs('fmWaybill','AttDate' ,3) + cdsMain.FieldByName('ondate').AsString + '"';
                Screen.Cursor := crDefault;
                ShowModal;

              finally
                Free;
              end;
            end;//if not IsEmpty then begin
          end;
        end
        else begin
          Close;
          Screen.Cursor := crDefault;

          if mrYes = ssMessageDlg(rs('Common', ifThen(EditRequest, 'PostedEditConfirm', 'UncheckConfirm')), ssmtWarning, [ssmbYes, ssmbNo])
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

              //3)Запись в CHECKED=0
              ProviderName := 'pWaybillCheck_Set0';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := WBILLID;
              Execute;

              TrCommit;
              
              DoRefresh(0);
              UpdateActionList;
              if RefreshAllClients then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);

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
procedure TfmWBRest.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.DoOpen') else _udebug := nil;{$ENDIF}

  _ID_ := 'wbillid';
  EditingClass := TfrmEditWBRest;
  RefType := prTypes.rtWBRest;
  irKAgent.Buttons[0].Visible := False;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBRest.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.UpdateActionList') else _udebug := nil;{$ENDIF}

  inherited;

  aPosProps.Enabled := not cdsDetail.IsEmpty
    and GetUserAccessByClass(Self.ClassName, uaModify)
    and (cdsDetail.FieldByName('archived').AsInteger <> 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBRest.DoPrint(AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.DoPrint') else _udebug := nil;{$ENDIF}

  xRep.ShowRep(rtWBRest, cdsMain.FieldByName(_ID_).AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBRest.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    Self.Caption := GetRS('fmWaybill' ,'TitleWBRest');
    FindList.Clear;
    FindList.AddObject(GetRS('fmWaybill', 'FiltNum') + ';' + 'num', pointer(1));
    FindList.AddObject(GetRS('fmWaybill', 'FiltDate') + ';' + 'ondate', pointer(2));

    inherited;

    tsInfo.Caption := GetRS('fmWriteOff', 'DocWOInfo');
    irPerson.Caption := GetRS('fmWaybill', 'Responsible');

    colReason.Caption := GetRS('fmWaybill', 'Reason');
    colSN.Caption := GetRS('fmWaybill', 'SN');

    aPosProps.Caption := GetRS('fmWaybill', 'PosProps');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBRest.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  for i := 0 to pcMain.PageCount - 1 do pcMain.Pages[i].Tag := 1;

  UpdateActionList;

  with cdsMain do begin
    if not IsEmpty then begin
      irNum.Text := FieldByName('num').AsString + RS('fmWaybill', 'From',3) +
          ssDateToStr(FieldByName('ondate').AsDateTime) + ' ' +
          TimeToStr(FieldByName('ondate').AsDateTime);

      FCurrRate := FieldByName('currrate').AsFloat;
      irReason.Text := FieldByName('reason').AsString;
      irNotes.Text := FieldByName('notes').AsString;
      irPerson.Text := FieldByName('personname').AsString;

      if FieldByName('checked').AsInteger = 1
        then irStatus.Text := rs('fmWaybill', 'DocChecked')
        else irStatus.Text := rs('fmWaybill', 'DocUnChecked');

      colSummCurr.Caption := rs('fmWaybill', 'SummIn',1) + fieldbyname('currname').AsString;

      //colSummDef.Caption := rs('fmWaybill', 'SummIn',1) + BaseCurrName;

      lTotalCurr.Caption := rs('fmWaybill', 'TotalIn',1) + cdsMain.FieldByName('currname').AsString;
      colSummDef.Visible := (BaseCurrID <> FieldByName('currid').AsInteger) and not IsEmpty;

      {if colSummDef.Visible
        then colPrice.Caption := rs('fmWaybill', 'PriceIn',1) + FieldByName('currname').AsString
        else colPrice.Caption := rs('fmWaybill', 'PriceIn',1) + BaseCurrName + rs('fmWaybill', 'outNDS',2);
      }
      bvlCurrSep.Visible := colSummDef.Visible;
      stSummCurr.Visible := colSummDef.Visible;
      lTotalCurr.Visible := colSummDef.Visible;
    end
    else begin
      irNum.Text := '';
      irKAgent.Text := '';
      irKAPhone.Text := '';
      irKAFullName.Text := '';
      irKAAdress.Text := '';
      irCurr.Text := '';
      irReason.Text := '';
      irNotes.Text := '';
      irPerson.Text := '';
      irFax.Text := '';
      irEmail.Text := '';
      irWWW.Text := '';
      irStatus.Text := '';
    end;
  end;

  RefreshDetail;
  GetSummAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBRest.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.ActionListUpdate') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBRest.cdsMainCalcFields(DataSet: TDataSet);
  var
    FNum: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.cdsMainCalcFields') else _udebug := nil;{$ENDIF}

  try
    FNum := DataSet.FieldByName('num').AsString;

    if Pos(WBRestPrefix, FNum) = 1
      then DataSet.FieldByName('numex').AsInteger :=
        StrToInt(Trim(Copy(FNum, Length(WBRestPrefix) + 1, Length(FNum) -
        Length(WBRestPrefix) - Length(WBRestSuffix))))
      else DataSet.FieldByName('numex').AsInteger := StrToInt(FNum);

  except
    DataSet.FieldByName('numex').AsInteger := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBRest.colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.colNumGetText') else _udebug := nil;{$ENDIF}

  AText := ANode.Values[colNumEx.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBRest.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  AdjustGrid(grdMain, colNum);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBRest.grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.grdDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'DocWBRest');
  ImgList := dmData.Images;
  AIndex := II_WBREST;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBRest.aPosPropsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.aPosPropsExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditPosition.Create(frmEditPosition) do
  try
    ParentNameEx := Self.Name;
    OnDate := Self.OnDate;
    ParentHandle := Self.Handle;
    Mode := 1;
    ID := cdsDetail.FieldByName('posid').AsInteger;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBRest.DoDelete;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.DoDelete') else _udebug := nil;{$ENDIF}

  if ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes
  then with newDataSet do
    try
      Application.ProcessMessages;
      TrStart;

      try
        if not DeleteDataEx(dmData.SConnection, 'waybilllist', 'wbillid', cdsMain.fieldbyname(_ID_).AsInteger)
          then raise Exception.Create(rs('Common','DeleteError'));

        if not DelToRecycleBin
           then TrCommit
           else begin
             TrRollback;

             if not AddToRecycleBin(dmData.SConnection, Self.ClassName, cdsMain.fieldbyname(_ID_).AsInteger, GetDelStr(cdsMain.fieldbyname(_ID_).AsInteger), False, Self.FunID) then
             begin
               ssMessageDlg(rs('Common', 'ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
               {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
               Exit;
             end;
           end;

        LocateAfterDel;
        DoRefresh(0);
        UpdateActionList;

        if RefreshAllClients then begin
          RefreshFun('TfmInventory', 0);
          //dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
        end;

      except
        on e:exception do begin
          TrRollback;
          ssMessageDlg(rs('Common', 'NoDelete'), ssmtError, [ssmbOk]);
        end;
      end;

    finally
      Free;
    end;

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBRest.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('frmOptions', 'WBRest');
  ImgList := dmData.Images;
  AIndex := II_WBREST;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBRest.colSummInCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.colSummInCurrGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MoneyDisplayFormat, StrToFloat(DelChars(AText, [ThousandSeparator]))) + ' ' + ANode.Values[colCurrName.Index];

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBRest.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBRest.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtWMat, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fWBRest', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
