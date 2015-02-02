{$I ok_sklad.inc}
unit EditWBRest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, dxCntner6, dxEditor6, StdCtrls, ActnList, ssBaseTypes,
  dxExEdtr6, ssFormStorage, cxMemo, cxCheckBox, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, ssBaseDlg, cxPC,
  dxTL6, dxDBCtrl6, dxDBGrid6, DB, ssMemDS, Menus, ssImagePanel,
  cxTreeView, ComCtrls, cxListView, cxDBEdit, cxGraphics, ssBaseWBDocDlg,
  cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxMaskEdit, xLngDefs,
  cxButtonEdit, Buttons, DBClient, ssClientDataSet, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox, ssGroupBox,
  cxCalendar, cxSpinEdit, ssDBComboBox, Grids, DBGrids, ssBaseConst, cxCalc,
  FR_DSet, FR_DBSet, FR_Class, FR_Desgn, cxTimeEdit, DBCtrls, dxmdaset,
  ssBevel, ssSpeedButton, ImgList, ssPanel, ssGradientPanel, ssDBGrid,
  ssCalcEdit, ssDBLookupCombo, ssLabel, TB2Item, xButton, prTypes,
  okSearchEdit, dxDBTLCl6, dxGrClms6;

type
  TfrmEditWBRest = class(TfrmBaseWBDocDlg)
    aAddMat: TAction;
    aAddMatList: TAction;
    aCDel: TAction;
    aCIns: TAction;
    aColParams: TAction;
    aCUpd: TAction;
    aFindActivate: TAction;
    aPersonsRef: TAction;
    aSelectAll: TAction;
    aSetKurs: TAction;
    aSetTime: TAction;
    btnAdd: TssSpeedButton;
    btnDel: TssSpeedButton;
    btnPersonName: TssSpeedButton;
    btnProps: TssSpeedButton;
    cdsFind: TssClientDataSet;
    cdsPersonName: TssClientDataSet;
    chbPosting: TcxCheckBox;
    edFind: TokGridSearchEdit;
    edNotes: TcxTextEdit;
    edNum1: TcxTextEdit;
    edReason: TcxTextEdit;
    frDoc: TfrReport;
    fsrcDoc: TfrDBDataSet;
    lcbPersonName: TssDBLookupCombo;
    lcbWH: TokWHouseSearchEdit;
    lNotes: TLabel;
    lNum: TLabel;
    lPersonname: TLabel;
    lReason: TLabel;
    mdReport: TdxMemData;
    mnuAdd: TTBSubmenuItem;
    panPosBar: TPanel;
    pmMain: TTBPopupMenu;
    pmMatSvc: TTBPopupMenu;
    srcPersonName: TDataSource;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;

    procedure aAddMatExecute(Sender: TObject);
    procedure aAddMatListExecute(Sender: TObject);
    procedure aCDelExecute(Sender: TObject);
    procedure aCInsExecute(Sender: TObject);
    procedure aColParamsExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCUpdExecute(Sender: TObject);
    procedure aFindActivateExecute(Sender: TObject);
    procedure aMatInfoExecute(Sender: TObject);
    procedure aPersonsRefExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure btnPersonNameMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cbCurrPropertiesChange(Sender: TObject);
    procedure chbPostingPropertiesChange(Sender: TObject);
    procedure DataModified(Sender: TObject);
    procedure dbgWaybillDetDblClick(Sender: TObject);
    procedure dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
    procedure edNum1PropertiesChange(Sender: TObject);
    procedure edReasonPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure lcbPersonNameKeyPress(Sender: TObject; var Key: Char);
    procedure lcbPersonNamePropertiesChange(Sender: TObject);
    procedure lcbPersonNamePropertiesEditValueChanged(Sender: TObject);
    procedure lcbWHChange(Sender: TObject);
    procedure mdDetAfterDelete(DataSet: TDataSet);
    procedure mdDetAfterPost(DataSet: TDataSet);
    procedure mdMatsAfterDelete(DataSet: TDataSet);
    procedure mdMatsAfterEdit(DataSet: TDataSet);
    procedure mdMatsAfterPost(DataSet: TDataSet);

  private
    DocInfo: TokAddDocInfo;
    FInvID: Integer;
    AllSummDef : Extended;
    defCurrName, defCurrShortName:string;
    defCurrID:integer;
    CurrentNDS:Extended;
    FCurrCtrl: TControl;
    FCurrNum: Integer;

    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;

  protected
    procedure FillMatsFromRef(DS: TssMemoryData);
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;

  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
    procedure GetFromInventory(AID: Integer; const ANum: string);
  end;

var
  frmEditWBRest: TfrmEditWBRest;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ClientData, Login, prFun,
  fKAgent, ssFun, ShellAPI, StdConvs, EditPosition, CurrencyEdit,
  ssCallbackConst, ssRegUtils, fMessageDlg, EditMaterials, ssStrUtil,
  KATurnover, ssBaseIntfDlg, udebug, okMoneyFun;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmEditWBRest.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.WMRefresh') else _udebug := nil;{$ENDIF}

  if M.LParam = 9 then begin
    UpdatePos;
    GetSummAll;
    dbgWaybillDet.ClearSelection;
    dbgWaybillDet.FocusedNode.Selected := True;
  end
  else case TRefType(M.LParam) of
    rtMat: FillMatsFromRef(TssMemoryData(M.WParam));

    rtPersons:
      begin
        DSRefresh(cdsPersonName, 'kaid', 0);
        lcbPersonName.KeyValue := M.WParam;
        lcbPersonName.SelStart := 0;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWBRest.setid') else _udebug := nil;{$ENDIF}

  CurrentNDS := NDS;
  cdsCurr.Open;
  mdDet.Open;

  edDate.Date := OnDate;
  edTime.Time := Time;

  SetRate;
  FID := Value;

  with newDataSet do
  try
    chbPosting.Checked := WBRestChecked;

    if ((Value = 0) or IsPattern) and WBRestAutoNum then begin
      FCurrNum := GetDocNum(dmData.SConnection, dtWBRest, 1);
      edNum1.Text := WBRestPrefix + IntToStr(FCurrNum) + WBRestSuffix;
    end
    else edNum1.Text := '';

    if Value > 0 then begin
      Self.Caption := rs(ParentNameEx, 'EditWB');
      ProviderName := 'pWaybill_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := Value;
      Open;

      if not IsEmpty then begin
        if not IsPattern then begin
          edNum1.Text := FieldByName('num').AsString;
          edNum1.Tag := FieldByName('defnum').AsInteger;
          edDate.Date := FieldByName('ondate').AsDateTime;
          edTime.Time := FieldByName('ondate').AsDateTime;
        end;
        edReason.Text := FieldByName('reason').AsString;
        edNotes.Text := FieldByName('notes').AsString;

        if not FieldByName('personid').IsNull
          then lcbPersonName.KeyValue := FieldByName('personid').AsInteger;

        if cdsCurr.Locate('CURRID', FieldByName('CURRID').AsInteger,[])
          then cbCurr.KeyValue := FieldByName('CURRID').AsInteger;

        edRate.Value := FieldByName('onvalue').AsFloat;
        chbPosting.Checked := fieldbyname('CHECKED').AsInteger=1;
        CurrentNDS := fieldbyname('NDS').AsFloat;
      end;

      if FieldByName('attnum').AsString = ''
        then lcbWH.WID := 0
        else
          try
            lcbWH.WID := StrToInt(FieldByName('attnum').AsString);
          except
          end;
      Close;

      ProviderName := 'pWaybillDet_GetIn';// чтение позиций в mdDet
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FID;
      Open;
      mdDet.Open;
      mdDet.LoadFromDataSet(Fields[0].DataSet);
      mdDet.First;
      while not mdDet.Eof do begin
        UpdatePos;
        mdDet.Next;
      end;
      if not mdDet.IsEmpty then begin
        mdDet.First;
        SelectFocusedNode;
      end;
      Close;

      if IsPattern then FID := 0;
    end //if Value <> 0
    else begin
      Self.Caption := rs(ParentNameEx, 'AddWB');
      with cdsPersonName do begin
        if Locate('userid', UserID, []) then lcbPersonName.KeyValue := FieldByName('kaid').AsInteger;
      end;
    end;

    if UserID <> 0 then begin
      lcbPersonName.Enabled := False;
      btnPersonName.Enabled := False;
      if Value <> 0 then  // editing enabled only for document owner or admin
        with cdsPersonName do
          if Locate('userid', UserID, []) and (lcbPersonName.KeyValue <> FieldByName('kaid').AsInteger)
          then EditingDisabled := True;
    end;


    FModified := False;
    FPosModified := False;
    if IsPattern then FPosModified := True;
    FGridRefresh := True;

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
procedure TfrmEditWBRest.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: boolean;
    BM:TBookmark;
    tmpid:integer;
    FPosID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWBRest.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;
    if not CheckDocDate(edDate.Date) then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    with newDataSet do begin
      try

        TrStart;

        try
          Screen.Cursor := crSQLWait;
          NewRecord := (ID = 0);

          if NewRecord then FID := GetMaxID(dmData.SConnection, 'waybilllist', 'wbillid');

          if NewRecord
            then ProviderName := 'pWaybill_InsEx'
            else ProviderName := 'pWaybill_UpdEx';

          FetchParams;
          Params.ParamByName('WBILLID').AsInteger := FID;
          Params.ParamByName('NUM').AsString := edNum1.Text;

          if edNum1.Tag > 0
            then Params.ParamByName('DEFNUM').AsInteger := edNum1.Tag
            else Params.ParamByName('DEFNUM').AsInteger := GetNextDefNum(dmData.SConnection,5);

          Params.ParamByName('ONDATE').AsDateTime := edDate.Date+edTime.Time;
          Params.ParamByName('KAID').DataType := ftInteger;
          Params.ParamByName('KAID').Clear;
          Params.ParamByName('CURRID').AsInteger := cbCurr.KeyValue;
          Params.ParamByName('onvalue').AsFloat := CurKurs;

          if lcbWH.Combo.EditingText = ''
            then Params.ParamByName('ATTNUM').AsString := ''
            else Params.ParamByName('ATTNUM').AsString := IntToStr(lcbWH.WID);

          Params.ParamByName('ATTDATE').DataType := ftDateTime;
          Params.ParamByName('ATTDATE').Clear;
          Params.ParamByName('entid').DataType := ftInteger;
          Params.ParamByName('entid').Clear;
          Params.ParamByName('REASON').AsString := edReason.Text;
          Params.ParamByName('NOTES').AsString := edNotes.Text;

          if lcbPersonName.EditingText <> ''
            then Params.ParamByName('PERSONID').AsInteger := lcbPersonName.KeyValue
            else begin
              Params.ParamByName('PERSONID').DataType := ftInteger;
              Params.ParamByName('PERSONID').Clear;
            end;

          Params.ParamByName('CHECKED').AsInteger := integer(chbPosting.Checked);
          Params.ParamByName('WTYPE').AsInteger := 5;//тип накладной 5-ввод остатков
          Params.ParamByName('DELETED').AsInteger := 0;
          Params.ParamByName('SUMMALL').AsFloat := RoundToA(ALLSUMM, -2);
          Params.ParamByName('SUMMINCURR').AsFloat := ALLSUMMCurr;
          Params.ParamByName('NDS').AsFloat := roundtoa(CurrentNDS,-2);

          Params.ParamByName('RECEIVED').DataType := ftString;
          Params.ParamByName('RECEIVED').Clear;

          Params.ParamByName('TODATE').DataType := ftDateTime;
          Params.ParamByName('TODATE').Clear;

          Execute;//Записали в waybilllist

          if FPosModified then begin // Запись позиций в накладную
            ProviderName := 'pWaybillDet_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := ID;
            Execute;  //Удалили позиции

            BM := mdDet.GetBookmark;
            mdDet.DisableControls;
            mdDet.First; // Запись позиций из mdDet в waybilldet
            
            while not mdDet.Eof do begin
              ProviderName := 'pWaybillDet_Ins';
              FetchParams;
              FPosID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
              Params.ParamByName('POSID').AsInteger := FPosID;
              if Params.ParamByName('POSID').AsInteger<0 then raise Exception.Create(rs('fmWaybill', 'ErrorAddPos'));
              tmpid := Params.ParamByName('POSID').AsInteger;
              Params.ParamByName('WBILLID').AsInteger := FID;
              Params.ParamByName('MATID').AsInteger := mdDet.fieldbyname('MATID').AsInteger;
              Params.ParamByName('WID').AsInteger := mdDet.fieldbyname('WID').AsInteger;
              Params.ParamByName('AMOUNT').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('AMOUNT').AsString),MatDisplayDigits);
              Params.ParamByName('PRICE').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('PRICE').AsString),-6);
              Params.ParamByName('DISCOUNT').DataType := ftFloat;
              Params.ParamByName('DISCOUNT').Clear;
              Params.ParamByName('NDS').AsFloat := CurrentNDS;
              Params.ParamByName('CurrId').AsInteger := cbCurr.KeyValue;
              Params.ParamByName('onvalue').AsFloat := CurKurs;
              Params.ParamByName('OnDate').AsDateTime := edDate.Date+edTime.Time;
              Params.ParamByName('PTypeID').DataType := ftInteger;
              Params.ParamByName('PTypeID').Clear;
              Params.ParamByName('NUM').AsInteger := mdDet.RecNo;

              Execute;//Записываем очередную позицию

              //write s/n
              if not mdDet.fieldbyname('SN').IsNull then begin
                ProviderName := 'rSN_Ins';
                FetchParams;
                Params.ParamByName('sid').AsInteger := GetMaxID(dmData.SConnection,'serials','sid');
                Params.ParamByName('posid').AsInteger := tmpid;
                Params.ParamByName('serialno').AsString := mdDet.fieldbyname('SN').AsString;
                Execute;
              end;//if

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

                Execute;
              end;

              mdDet.Next;
            end;//while not mdDet.Eof
            mdDet.GotoBookmark(BM);
            FreeBookmark(BM);
            mdDet.EnableControls;

            FPosModified := false;//Сбрасываем флаг изменения позиций
          end;//if FPosModified

          if chbPosting.Checked then begin  //Если документ проведён то
            //1)Удаление из оборотов        //записываем позиции на склад
            ProviderName := 'pWMatTurn_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Execute;

            //4)Запись в обороты
            ProviderName := 'pWMatTurn_InsEx';
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

          if FInvID > 0 then begin
            ProviderName := 'pDocsRel_Inv_WBRest_Ins';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FID;
            Params.ParamByName('invid').AsInteger := FInvID;
            Execute;
          end;
          TrCommit;
          FModified := False;//флаг изменения документа false

          if ModalResult = mrYes then
            if NewRecord then begin
              edDate.Date := Date;
              chbPosting.Checked := false;
              edNum1.SetFocus;
              mdDet.Close;
              SendMessage(MainHandle, WM_REFRESH, ID, 0); //?????
              FInvID := 0;
              ID := 0;
            end//if NewRecord
            else begin
              if chbPosting.Checked then CanClose := true
              else begin
                mdDet.Close;
                cdsCurr.Close;
                ID := ID;
              end;
            end//else NewRecord
          else CanClose := True;

          FGridRefresh := true;

          SendMessage(MainHandle, WM_REFRESH, ID, 0);

        finally
          Free;
          Screen.Cursor := crDefault;
        end;

      except
        on e:exception do begin
          TrRollback;
          raise;
        end;
      end;
    end;// with newDataSet
  end // modalresult ok,yes
  else begin
    if GetDocNum(dmData.SConnection, dtWBRest, 0) = FCurrNum
      then GetDocNum(dmData.SConnection, dtWBRest, -1);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;//FormCloseQuery

//==============================================================================================
procedure TfrmEditWBRest.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.ActionListUpdate') else _udebug := nil;{$ENDIF}

  if FGridRefresh then begin
    dbgWaybillDet.BeginUpdate;
    try
      GetSummAll;
      dbgWaybillDet.Tag := dbgWaybillDet.Tag + 1;
    finally
      dbgWaybillDet.EndUpdate;
    end;
  end;
  lSummCurr.Visible := colSummDef.Visible;
  lTotalCurr.Visible := colSummDef.Visible;

  aOk.Enabled := (Trim(edNum1.Text) <> '')
    and (edDate.Text <> '') and (cbCurr.KeyValue > 0)
    and (not mdDet.IsEmpty);

  aSelectAll.Enabled := not mdDet.IsEmpty;
  aApply.Enabled := aOk.Enabled and (FModified or FPosModified);

  aCIns.Enabled := True;
  aCDel.Enabled := not mdDet.IsEmpty;
  aCUpd.Enabled := aCDel.Enabled and (dbgWaybillDet.SelectedCount = 1);
  mnuAdd.Enabled := aCIns.Enabled;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.DataModified') else _udebug := nil;{$ENDIF}

  FPosModified := True;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    edFind.SetLng;

    lcbWH.InitRes;

    aSelectAll.Caption := GetRS('Common', 'SelectAll');

    aAddMat.Caption := GetRS('fmWaybill', 'MatName');
    aAddMatList.Caption := GetRS('fmWaybill', 'AddMatList');
    aColParams.Caption := GetRS('Common', 'ColOptions') + '...';
    aCIns.Caption := GetRS('Common', 'Add');
    aCIns.Hint := GetRS('fmWaybill', 'NewPos');
    aCUpd.Caption := GetRS('Common', 'Properties');
    aCUpd.Hint := GetRS('fmWaybill', 'EditPos');
    aCDel.Caption := GetRS('Common', 'Del');
    aCDel.Hint := GetRS('fmWaybill', 'DelPos');

    btnPersonName.Hint := GetRS('fmWaybill', 'aPersons');
    chbPosting.Properties.Caption := GetRS('fmWaybill', 'Posting');
    colRecNo.Caption := GetRS('fmWaybill', 'NumEx');

    lNum.Caption := GetRS('fmWaybill', 'Num') + ':';

    lReason.Caption := GetRS('fmWaybill', 'Reason') + ':';
    lNotes.Caption := GetRS('fmWaybill', 'Notes') + ':';
    lPersonname.Caption := GetRS('fmWaybill', 'RespShort') + ':';
    lTotal.Caption := GetRS('fmWaybill', 'TotalIn') + ' ' + BaseCurrName;
    lTotNDSOut.Caption := GetRS('Common', 'WithoutNds');
    lTotNDS.Caption := GetRS('Common', 'VAT');
    lTot.Caption := GetRS('Common', 'WithNDS');

    mnuAdd.Caption := GetRS('Common', 'Add');
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.aCInsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.aCInsExecute') else _udebug := nil;{$ENDIF}

  case WBInDefAction of
    aaMatList: aAddMatList.Execute;
    else aAddMat.Execute;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.aCDelExecute(Sender: TObject);
  var
    FItem: TListItem;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.aCDelExecute') else _udebug := nil;{$ENDIF}

  if ((dbgWaybillDet.SelectedCount = 1)
     and (ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo])<>mrYes))
     or
     ((dbgWaybillDet.SelectedCount > 1)
       and (ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [dbgWaybillDet.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo])<>mrYes))
  then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  Screen.Cursor := crSQLWait;
  mdDet.DisableControls;
  try
    for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
      if mdDet.Locate('posid', dbgWaybillDet.SelectedNodes[i].Values[colPosID.Index], [])
        then mdDet.Delete;
    end;

    if dbgWaybillDet.SelectedCount = 1 then begin
      if dbgWaybillDet.FocusedNode.AbsoluteIndex < dbgWaybillDet.Count - 1
        then mdDet.Locate('posid', dbgWaybillDet.FocusedNode.GetNext.Values[colPosId.Index], [])
      else if dbgWaybillDet.FocusedNode.AbsoluteIndex > 0
        then mdDet.Locate('posid', dbgWaybillDet.FocusedNode.GetPrev.Values[colPosId.Index], []) else
    end
    else mdDet.First;
    FGridRefresh := True;

  finally
    Screen.Cursor := crDefault;
    mdDet.EnableControls;
    SelectFocusedNode;
    RealignGrid;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.edNum1PropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.edNum1PropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.chbPostingPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.chbPostingPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.mdMatsAfterPost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.mdMatsAfterPost') else _udebug := nil;{$ENDIF}

  FPosModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.mdMatsAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.mdMatsAfterDelete') else _udebug := nil;{$ENDIF}

  FPosModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.mdMatsAfterEdit(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.mdMatsAfterEdit') else _udebug := nil;{$ENDIF}

  FPosModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  btnAdd.ImageIndex := 0;
  btnProps.ImageIndex := 1;
  btnDel.ImageIndex := 2;
  FormResize(Self);
  Screen.Cursor := crDefault;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.aCUpdExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.aCUpdExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditPosition.Create(frmEditPosition) do
  try
    ParentNameEx := 'fmWaybill';
    OnDate := Self.OnDate;
    dbgWaybillDet.SetFocus;
    NDSPayer := CurrEnt.NDSPayer;
    PosNDS := CurrentNDS;
    ParentHandle := Self.Handle;
    CurrID := cbCurr.KeyValue;
    Kurs := CurKurs;
    parentMdDet := mdDet; //Tag := Integer(mdDet);
    CurrName := cdsCurr.fieldbyname('shortname').AsString;
    CurrDefName := BaseCurrName;
    CurrShortName := defCurrShortName;
    ID := mdDet.FieldByName('posid').AsInteger;
    Caption := rs('fmWaybill', 'PosEdit');
    Screen.Cursor := crDefault;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.mdDetAfterPost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.mdDetAfterPost') else _udebug := nil;{$ENDIF}

  FPosModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.mdDetAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.mdDetAfterDelete') else _udebug := nil;{$ENDIF}

  FPosModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.cbCurrPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.cbCurrPropertiesChange') else _udebug := nil;{$ENDIF}

  lTotalCurr.Caption := rs('fmWaybill', 'TotalIn') + ' ' + cbCurr.EditingText + ':';

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  edFind.SetLng;
  dbgWaybillDet.LoadFromRegistry(MainRegKey + '\' + Self.Name);

  cdsPersonName.Open;
  lcbPersonName.KeyValue := -1;
  lcbPersonName.Text := '';

  lcbWH.RefreshItemsDS;

  chbPosting.Checked := DefCheckWB;

  edFind.LoadFromRegistry(MainRegKey + '\' + Self.Name + '\PosFind');
  colPosType.Visible := False;
  colStatus.Visible := False;;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.lcbPersonNameKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.lcbPersonNameKeyPress') else _udebug := nil;{$ENDIF}

  if dbgWaybillDet.Enabled then begin
    if Key = #13 then begin
      Key := #0;
      dbgWaybillDet.SetFocus;
    end;
  end
  else GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.lcbPersonNamePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.lcbPersonNamePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.edReasonPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.edReasonPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.FormDestroy') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.SaveToRegistry(MainRegKey + '\' + Self.Name);
  edFind.SaveToRegistry(MainRegKey + '\' + Self.Name + '\PosFind');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  edFind.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.aPrintExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.aPrintExecute') else _udebug := nil;{$ENDIF}

  if mdDet.IsEmpty then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  mdReport.CopyFromDataSet(mdDet);

  SmartShowRep(frDoc, 'Waybill_Rest.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.aMatInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.aMatInfoExecute') else _udebug := nil;{$ENDIF}

  if dbgWaybillDet.SelectedCount <> 1 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := dbgWaybillDet.FocusedNode.Values[colMatID.Index];
      CanModify := False;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.frDocGetValue(const ParName: String; var ParValue: Variant);
  var
    FSumm, FWONDS, FNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.frDocGetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := edNum1.Text
  else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := edDate.Text
  else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
  else if 0 = AnsiCompareText(ParName, 'rate') then ParValue := CurKurs
  else if 0 = AnsiCompareText(ParName, 'PriceDisplayFormatEx') then ParValue := PriceDisplayFormatEx
  else if 0 = AnsiCompareText(ParName, 'possumwonds') then begin
    NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price').AsFloat *
      mdReport.FieldByName('onvalue').AsFloat, mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);

    ParValue := RoundToA(FWONDS + FNDS, -2);
    FNDS := RoundToA(FNDS, -2);
    ParValue := ParValue - FNDS;
  end
  else if 0 = AnsiCompareText(ParName, 'reason') then ParValue := edReason.Text
  else if 0 = AnsiCompareText(ParName, 'possum') then begin
    NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
            mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);

    ParValue := RoundToA(FWONDS + FNDS, -2);
  end
  else if 0 = AnsiCompareText(ParName, 'curnds') then ParValue := NDS
  else if 0 = AnsiCompareText(ParName, 'propis') then begin
    FSumm := StrToFloat(DelChars(lSummDef.Caption, [ThousandSeparator]));
    ParValue := MoneyToStr(FSumm);
  end
  else if 0 = AnsiCompareText(ParName, 'sumnds') then ParValue := StrToFloat(DelChars(lSummDefNDS.Caption, [ThousandSeparator]))
  else if 0 = AnsiCompareText(ParName, 'sumall') then ParValue := StrToFloat(DelChars(lSummDef.Caption, [ThousandSeparator]));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.GetFromInventory(AID: Integer; const ANum: string);
  var
    FAmount: Extended;
    FPosID, FMatID, FWID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.GetFromInventory') else _udebug := nil;{$ENDIF}

  edReason.Text := rs('fmWaybill', 'DocInv') + amountPrefix + ANum;

  with newDataSet do
  try
    ProviderName := 'pWaybillDet_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AID;
    Open;

    if not mdDet.Active then mdDet.Open;

    while not Eof do begin
      FAmount := RoundToA(FieldByName('discount').AsFloat - FieldByName('amount').AsFloat, MatDisplayDigits);

      if FAmount > 0 then begin
        FMatID := FieldByName('matid').AsInteger;
        FWID := FieldByName('wid').AsInteger;
        FPosID := dsNextPosID(mdDet);
        mdDet.Append;
        mdDet.FieldByName('posid').AsInteger := FPosID;
        mdDet.FieldByName('matid').AsInteger := FMatID;
        mdDet.FieldByName('matname').AsString := FieldByName('matname').AsString;
        mdDet.FieldByName('wid').AsInteger := FWID;
        mdDet.FieldByName('whname').AsString := FieldByName('whname').AsString;
        mdDet.FieldByName('amount').AsFloat := FAmount;
        mdDet.FieldByName('price').AsFloat := FieldByName('nds').AsFloat;
        mdDet.FieldByName('msrname').AsString := FieldByName('msrname').AsString;
        mdDet.FieldByName('currid').AsInteger := BaseCurrID;
        mdDet.FieldByName('nds').AsFloat := NDS;
        mdDet.FieldByName('onvalue').AsFloat := 1;
        mdDet.FieldByName('artikul').AsString := FieldByName('artikul').AsString;
        mdDet.Post;
        UpdatePos;
      end;
      Next;
    end;

    Close;
    mdDet.First;
    SelectFocusedNode;

  finally
    Free;
  end;
  FInvID := AID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.lcbPersonNamePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.lcbPersonNamePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  with Sender as TcxComboBox do begin
    SelStart := 0;
    SelLength := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.aPersonsRefExecute(Sender: TObject);
  var
    aid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.aPersonsRefExecute') else _udebug := nil;{$ENDIF}

  if lcbWH.Combo.Focused
    then lcbWH.ShowRef
    else begin
      try aid := lcbPersonName.KeyValue; except aid := 0; end;
      lcbPersonName.SetFocus;
      ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.aColParamsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.aColParamsExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.aAddMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.aAddMatExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditPosition.Create(frmEditPosition) do
  try
    ParentNameEx := 'fmWaybill';
    OnDate := edDate.Date + edTime.Time;
    NDSPayer := CurrEnt.NDSPayer;
    PosNDS := CurrentNDS;
    WID := lcbWH.WID;
    ParentHandle := Self.Handle;
    CurrID := Self.cbCurr.KeyValue;
    Kurs := CurKurs;
    parentMdDet := mdDet; //Tag := Integer(mdDet);
    ID := 0;
    CurrDefName := BaseCurrName;
    CurrShortName := defCurrShortName;
    CurrName := cdsCurr.fieldbyname('shortname').AsString;
    Caption := rs('fmWaybill', 'PosAdd');
    Screen.Cursor := crDefault;
    ShowModal;

  finally
    Free;
    SelectFocusedNode;
  end;//try

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.aAddMatListExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.aAddMatListExecute') else _udebug := nil;{$ENDIF}

  DocInfo.CurrName := cbCurr.Text;
  DocInfo.CurrID := cbCurr.KeyValue;
  DocInfo.CurrRate := edRate.Value;
  DocInfo.OnDate := edDate.Date;

  if CurrEnt.NDSPayer
    then DocInfo.NDS := CurrentNDS
    else DocInfo.NDS := 0;

  DocInfo.PTypeID := GetDefPriceType;
  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, 0, Integer(@DocInfo));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.FillMatsFromRef(DS: TssMemoryData);
  var
    FPosID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.FillMatsFromRef') else _udebug := nil;{$ENDIF}

  with mdDet do begin
    if not mdDet.Active then mdDet.Open;
    DS.First;
    mdDet.DisableControls;

    while not DS.Eof do begin
      FPosID := dsNextPosID(mdDet);
      Append;
      FieldByName('posid').AsInteger := FPosID;
      FieldByName('matid').AsInteger := DS.FieldByName('matid').AsInteger;
      FieldByName('matname').AsString := DS.FieldByName('name').AsString;
      FieldByName('msrname').AsString := DS.FieldByName('msrname').AsString;
      FieldByName('artikul').AsString := DS.FieldByName('artikul').AsString;
      FieldByName('amount').AsFloat := DS.FieldByName('amount').AsFloat;
      FieldByName('price').AsFloat := DS.FieldByName('price').AsFloat;

      if CurrEnt.NDSPayer
        then FieldByName('nds').AsFloat := CurrentNDS
        else FieldByName('nds').AsFloat := 0;

      FieldByName('currid').AsInteger := cbCurr.KeyValue;
      FieldByName('wid').AsInteger := lcbWH.WID;
      FieldByName('whname').AsString := lcbWH.Combo.Text;
      FieldByName('currname').AsString := cbCurr.Text;
      FieldByName('onvalue').AsFloat := edRate.Value;
      FieldByName('producer').AsString := DS.FieldByName('producer').AsString;
      FieldByName('barcode').AsString := DS.FieldByName('barcode').AsString;
      Post;
      UpdatePos;
      DS.Next;
    end;
  end;
  mdDet.EnableControls;
  GetSummAll;
  dbgWaybillDet.Adjust(nil, [colRecNo]);
  SelectFocusedNode;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.lcbWHChange(Sender: TObject);
  var
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.lcbWHChange') else _udebug := nil;{$ENDIF}

  if not mdDet.IsEmpty and (mrYes = ssMessageDlg(Format(rs('fmWaybill', 'WHChanged'), [lcbWH.Combo.Text]), ssmtConfirmation, [ssmbYes, ssmbNo]))
  then begin
    BM := mdDet.GetBookmark;
    mdDet.DisableControls;
    fProgress.Caption := rs('Common', 'Executing');
    fProgress.UpDate;
    fProgress.pbMain.Max := mdDet.RecordCount;
    fProgress.Show;

    try
      mdDet.First;
      while not mdDet.Eof do begin
        fProgress.lText.Caption := mdDet.FieldByName('matname').AsString;
        mdDet.Edit;
        mdDet.FieldByName('whname').AsString := lcbWH.Combo.Text;
        mdDet.FieldByName('wid').AsInteger := lcbWH.WID;
        mdDet.Post;
        mdDet.Next;
        fProgress.pbMain.StepIt;
        Application.ProcessMessages;
      end;

    finally
      mdDet.GotoBookmark(BM);
      mdDet.FreeBookmark(BM);
      mdDet.EnableControls;
      fProgress.Hide;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.aFindActivateExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.aFindActivateExecute') else _udebug := nil;{$ENDIF}

  edFind.Editor.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.dbgWaybillDetDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.dbgWaybillDetDblClick') else _udebug := nil;{$ENDIF}

  if aCUpd.Enabled then aCUpd.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.dbgWaybillDetKeyPress') else _udebug := nil;{$ENDIF}

  GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.dbgWaybillDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'DocWBRest');
  ImgList := dmData.Images;
  AIndex := II_WBREST;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.btnPersonNameMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.btnPersonNameMouseDown') else _udebug := nil;{$ENDIF}

  lcbPersonName.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBRest.FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBRest.FormConstrainedResize') else _udebug := nil;{$ENDIF}

  inherited;
  MinWidth := 700;
  MinHeight := 370;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditWBRest', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
