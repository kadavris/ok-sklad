{$I ok_sklad.inc}
unit EditContr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner6, dxEditor6, StdCtrls, xLngDefs,
  ActnList, ssBaseTypes, ssFormStorage, cxCheckBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, ssBaseDlg,
  ssBevel, ImgList, ssSpeedButton, ssPanel, ssGradientPanel, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ssBaseConst, xButton, prTypes, okSearchEdit,
  ssDBLookupCombo, cxCalc, ssCalcEdit, ssLabel, DB, DBClient,
  ssClientDataSet, ssBaseWBDocOut, dxmdaset, dxDBGrid6, dxTL6, dxDBCtrl6,
  dxDBTLCl6, dxGrClms6, ssDBGrid, cxGroupBox, ssGroupBox,
  ssBaseWBDocDlg, ssMemDS, FR_DSet, FR_DBSet, FR_Class, TB2Item, Menus,
  cxPC, ssPageControl, cxSpinEdit, cxTimeEdit, Grids, DBGrids;

type
  TfrmEditContr = class(TfrmBaseWBDocOut)
    aPrintF: TAction;
    btnAddFPath: TssSpeedButton;
    btnPersonName: TssSpeedButton;
    chbAllAmount: TcxCheckBox;
    chbExport: TcxCheckBox;
    chbSumm: TcxCheckBox;
    edAmount: TssCalcEdit;
    edFindKA: TokKASearchEdit;
    edFPath: TcxTextEdit;
    edSumm: TssCalcEdit;
    edToDate: TcxDateEdit;
    lcbPersonName: TssDBLookupCombo;
    lFPath: TLabel;
    lPersonname: TLabel;
    lToDate: TLabel;
    mdDetshippedamount: TFloatField;
    OpenDlg: TOpenDialog;
    ssBevel1: TssBevel;
    ssBevel2: TssBevel;
    ssSpeedButton1: TssSpeedButton;
    stCurrShortName: TssBevel;
    stMeasureName: TssBevel;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure CtrlEnter(Sender: TObject);
    procedure CtrlExit(Sender: TObject);
    procedure DataModified(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aAddFPathExecute(Sender: TObject);
    procedure aBallanceExecute(Sender: TObject);
    procedure aCDelExecute(Sender: TObject);
    procedure aCInsExecute(Sender: TObject);
    procedure aCUpdExecute(Sender: TObject);
    procedure aCurActionExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aPrintFExecute(Sender: TObject);
    procedure btnPersonNameClick(Sender: TObject);
    procedure cbCurrPropertiesChange(Sender: TObject);
    procedure cbCurrPropertiesEditValueChanged(Sender: TObject);
    procedure chbAllAmountPropertiesEditValueChanged(Sender: TObject);
    procedure chbExportPropertiesEditValueChanged(Sender: TObject);
    procedure chbSummPropertiesEditValueChanged(Sender: TObject);
    procedure dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure edDatePropertiesChange(Sender: TObject);
    procedure edFindKARefButtonClick(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure mdDetBeforePost(DataSet: TDataSet);

  private
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  protected
    Procedure LastFocus(var Mess : TMessage) ; message  WM_ACTIVATE;
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
    procedure GetSummAll; override;

  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
    procedure DoHelp; override;
  end;

var
  frmEditContr: TfrmEditContr;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ClientData, prFun, ssCallbackConst, ssFun,
  KATurnover, ShellAPI, fMessageDlg, EditPosition,ssDateUtils,
  ssBaseWBDocDlgWithPayment, Math, xLngManager, ssBaseSkinForm, DateUtils, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmEditContr.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.WMRefresh') else _udebug := nil;{$ENDIF}

  inherited;

  if M.LParam = 9 then begin
    GetSummAll;
    dbgWaybillDet.ClearSelection;
    dbgWaybillDet.FocusedNode.Selected := True;
    DataModified(Self);
  end
  else case TRefType(M.LParam) of
    rtKAgent: begin
      edFindKA.KAID := M.WParam;
      FModified := true;
    end;//rtKAgent: begin

    rtPersons: begin
      cdsPayMPersons.DisableControls;
      DSRefresh(cdsPayMPersons, 'kaid', M.WParam);
      cdsPayMPersons.EnableControls;

      with lcbPersonName do begin
        Tag := KeyValue;
        ReloadData;
        KeyValue := Tag;

        if Tag = 0
          then Text := ''
          else Tag := 0;
      end;

      if FCurrCtrl = lcbPersonName then
        with (FCurrCtrl as TssDBLookupCombo) do begin
          Tag := 1;
          KeyValue := M.WParam;
          Tag := 0;
        end;
    end;//rtPersons:begin
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.setid(const Value: integer);
  var
    FNeedCheck, FAutoNum: Boolean;
    FPrefix, FSuffix: String;
    tmpId: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditContr.setid') else _udebug := nil;{$ENDIF}

  if GrpID > 0 then begin
    FDocType := dtDogIn;
    FPrefix := DogInPrefix;
    FSuffix := DogInSuffix;
  end
  else begin
    FDocType := dtDogOut;
    FPrefix := DogOutPrefix;
    FSuffix := DogOutSuffix;
  end;

  inherited;

  edToDate.Date := IncYear(edDate.Date);
  edFPath.Text := '';
  cbCurr.Tag := 1;
  cdsCurr.Open;
  cbCurr.KeyValue := BaseCurrID;
  cbCurr.Tag := 0;
  stCurrShortName.Caption := cbCurr.Text;
  stMeasureName.Caption := '';
  cdsPayMPersons.Open;
  lcbPersonName.KeyValue := lcbPersonName.EmptyValue;
  chbSumm.Checked := False;
  edSumm.Enabled := False;
  edSumm.Text := '';
  chbAllAmount.Checked := False;
  edAmount.Enabled := False;
  edAmount.Text := '';
  chbExport.Checked := False;
  mdDet.Close;
  mdDet.Open;

  case FDocType of
    dtDogIn  : chbExport.Properties.Caption := rs(ParentNameEx,'ByImport');
    dtDogOut : chbExport.Properties.Caption := rs(ParentNameEx,'ByExport');
  end;

  if Value = 0 then begin
    case FDocType of
      dtDogIn : Self.Caption := rs(ParentNameEx, 'TitleAddIn');
      dtDogOut: Self.Caption := rs(ParentNameEx, 'TitleAddOut');
    end;

    edNum1.Text := FPrefix + IntToStr(GetDocNum(dmData.SConnection, FDocType, 1)) + FSuffix;
  end
  else begin
    case FDocType of
      dtDogIn : Self.Caption := rs(ParentNameEx, 'TitleEditIn');
      dtDogOut: Self.Caption := rs(ParentNameEx, 'TitleEditOut');
    end;

    with newDataSet do
    try
      ProviderName := 'pContr_Get';
      FetchParams;
      Params.ParamByName('docid').AsInteger := Value;
      Open;
      if not IsEmpty then begin
        chbPosting.Checked := FieldByName('checked').AsInteger=1;
        edNum1.Text := FieldByName('num').AsString;
        edDate.Date := FieldByName('ondate').AsDateTime;
        edFindKA.KAID := FieldByName('kaid').AsInteger;

        if FieldByName('notes').IsNull
          then edNotes.Text := ''
          else edNotes.Text := FieldByName('notes').AsString;

        cbCurr.Tag := 1;
        cbCurr.KeyValue := FieldByName('currid').AsInteger;
        cbCurr.Tag := 0;

        if not FieldByName('personid').IsNull
          then lcbPersonName.KeyValue := FieldByName('personid').AsInteger;

        edToDate.Date := FieldByName('todate').AsDateTime;
        if FieldByName('summ').IsNull
          then edSumm.Text := ''
          else edSumm.Value := FieldByName('summ').AsFloat;

        if FieldByName('amount').IsNull
          then edAmount.Text := ''
          else edAmount.Value := FieldByName('amount').AsFloat;

        chbAllAmount.Checked := (FieldByName('ismanualamount').AsInteger = 1);
        chbExport.Checked := (FieldByName('isexternal').AsInteger = 1);
        chbSumm.Checked := (FieldByName('ismanualsumm').AsInteger = 1);
        edFPath.Text := FieldByName('fpath').AsString;
      end;
      Close;

      ProviderName := 'pContrDet_Get';// чтение позиций в mdDet
      FetchParams;
      Params.ParamByName('docid').AsInteger := FID;
      Open;
      mdDet.Open;
      mdDet.LoadFromDataSet(Fields[0].DataSet);

      if not mdDet.IsEmpty then begin
        mdDet.First;
        while not mdDet.Eof do begin
          tmpId := dsNextPosID(mdDet.Fields[0].DataSet);
          mdDet.Edit;
          mdDet.FieldByName('posid').AsInteger := tmpId;
          mdDet.Post;
          mdDet.Next;
        end;

        mdDet.First;

        if dbgWaybillDet.FocusedNode = nil then dbgWaybillDet.FocusedAbsoluteIndex := 0;

        dbgWaybillDet.FocusedNode.Selected := True;
      end;
      Close;

    finally
      free;
    end;
  end;

  FModified := false;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    BM:TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    with newDataSet do
    try
      TrStart;

      try
        ProviderName := 'pContr_Upd';
        FetchParams;
        Params.ParamByName('DOCID').AsInteger := FID;

        if (FDocType in [dtDogIn, dtDogOut]) then begin
          Params.ParamByName('PDOCID').DataType := ftInteger;
          Params.ParamByName('PDOCID').Clear;
        end;

        Params.ParamByName('KAID').AsInteger := edFindKA.KAID;
        Params.ParamByName('ONDATE').AsDateTime := edDate.Date + edTime.Time;
        Params.ParamByName('NUM').AsString := edNum1.Text;
        Params.ParamByName('CHECKED').AsInteger := Integer(chbPosting.Checked);
        Params.ParamByName('DELETED').AsInteger := 0;

        if Trim(edFPath.Text) <> ''
          then Params.ParamByName('FPATH').AsString := Trim(edFPath.Text)
          else begin
            Params.ParamByName('FPATH').DataType := ftString;
            Params.ParamByName('FPATH').Clear;
          end;

        if Trim(edNotes.Text) <> ''
          then Params.ParamByName('NOTES').AsString := edNotes.Text
          else begin
            Params.ParamByName('NOTES').DataType := ftString;
            Params.ParamByName('NOTES').Clear;
          end;

        Params.ParamByName('CURRID').AsInteger := cbCurr.KeyValue;

        if (lcbPersonName.EditText = '') or (lcbPersonName.KeyValue = 0) then begin
          Params.ParamByName('PERSONID').DataType := ftInteger;
          Params.ParamByName('PERSONID').Clear;
        end
        else Params.ParamByName('PERSONID').AsInteger := lcbPersonName.KeyValue;

        case FDocType of
          dtDogIn: Params.ParamByName('DOCTYPE').AsInteger := 8;
          dtDogOut:Params.ParamByName('DOCTYPE').AsInteger := -8;
        end;//case

        Params.ParamByName('SHIPPEDSUMM').DataType := ftFloat;
        Params.ParamByName('SHIPPEDSUMM').Clear;
        Params.ParamByName('PAIDSUMM').DataType := ftFloat;
        Params.ParamByName('PAIDSUMM').Clear;
        Params.ParamByName('SHIPPEDAMOUNT').DataType := ftFloat;
        Params.ParamByName('SHIPPEDAMOUNT').Clear;
        Params.ParamByName('TODATE').AsDateTime := LastSecondInDay(edToDate.Date);

        if Trim(edSumm.Text) <> ''
          then Params.ParamByName('SUMM').AsFloat := edSumm.Value
          else begin
            Params.ParamByName('SUMM').DataType := ftFloat;
            Params.ParamByName('SUMM').Clear;
          end;

        if Trim(edAmount.Text) <> ''
          then Params.ParamByName('AMOUNT').AsFloat := edAmount.Value
          else begin
            Params.ParamByName('AMOUNT').DataType := ftFloat;
            Params.ParamByName('AMOUNT').Clear;
          end;

        Params.ParamByName('ISMANUALSUMM').AsInteger := Integer(chbSumm.Checked);
        Params.ParamByName('ISMANUALAMOUNT').AsInteger := Integer(chbAllAmount.Checked);
        Params.ParamByName('ISEXTERNAL').AsInteger := Integer(chbExport.Checked);

        Open;
        FID := FieldByName('docid').AsInteger;
        Close;

        if FPosModified then begin
          ProviderName := 'pSQL';
          FetchMacros;
          Macros.ParamByName('sql').AsString := 'delete from contrdet where docid=' + IntToStr(ID);
          Execute;

          BM := mdDet.GetBookmark;
          mdDet.DisableControls;
          mdDet.First; // Запись позиций из mdDet в waybilldet
          ProviderName := 'pContrDet_Ins';
          FetchParams;

          while not mdDet.Eof do begin
            Params.ParamByName('cdid').AsInteger := 0;
            Params.ParamByName('docid').AsInteger := FID;
            Params.ParamByName('matid').AsInteger := mdDet.FieldByName('matid').AsInteger;

            if mdDet.FieldByName('amount').IsNull then begin
              Params.ParamByName('amount').DataType := ftFloat;
              Params.ParamByName('amount').Clear;
            end
            else Params.ParamByName('amount').AsFloat := RoundToA(mdDet.FieldByName('amount').AsFloat, MatDisplayDigits);

            if mdDet.FieldByName('price').IsNull then begin
              Params.ParamByName('price').DataType := ftFloat;
              Params.ParamByName('price').Clear;
            end
            else Params.ParamByName('price').AsFloat := RoundToA(mdDet.FieldByName('price').AsFloat, -6);

            if mdDet.FieldByName('currid').IsNull then begin
              Params.ParamByName('currid').DataType := ftInteger;
              Params.ParamByName('currid').Clear;
            end
            else Params.ParamByName('currid').AsInteger := mdDet.FieldByName('currid').AsInteger;

            Params.ParamByName('shippedamount').DataType := ftFloat;
            Params.ParamByName('shippedamount').Clear;

            if mdDet.FieldByName('nds').IsNull then begin
              Params.ParamByName('nds').DataType := ftFloat;
              Params.ParamByName('nds').Clear;
            end
            else Params.ParamByName('nds').AsFloat := RoundToA(mdDet.FieldByName('nds').AsFloat,-6);

            Open;//Записываем очередную позицию

            if IsEmpty then raise Exception.Create(rs('fmWaybill','ErrorAddPos'));

            Close;
            mdDet.Next;
          end;//while not mdDet.Eof
          mdDet.GotoBookmark(BM);
          mdDet.FreeBookmark(BM);
          mdDet.EnableControls;

          FPosModified := False;
        end;

        DoRecalcContract(dmData.SConnection,FID);

        TrCommit;

        SendMessage(MainHandle, WM_REFRESH, ID, 0);

        if ModalResult = mrYes then begin
          if ID = 0
            then setID(0) // resetting
            else begin
              if chbPosting.Checked
                then CanClose := true
                else setID(ID);
            end //else NewRecord
        end
        else CanClose := True;

      finally
        Free;
      end;

    except
      on e:exception do begin
        TrRollback;
        MessageDlg(e.Message, mtError, [mbOk], 0);
      end;
    end;
  end//if ModalResult in [mrOK, mrYes] then
  else begin
    if GetDocNum(dmData.SConnection,FDocType, 0) = FCurrNum
      then GetDocNum(dmData.SConnection, FDocType, -1);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;
  aCDel.Enabled := (not mdDet.IsEmpty);
  aCUpd.Enabled := aCDel.Enabled;// and (dbgWaybillDet.SelectedCount = 1);
  aOk.Enabled := (Trim(edNum1.Text) <> '') and (edFindKA.KAID > 0);
  aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.DataModified(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    edFindKA.InitRes;
    edFindKA.SearchNames[0] := GetRS('fmWaybill','KAgent') + ';name';

    if edFindKA.CurrentSearchIndex = 0 then edFindKA.Caption.Caption := GetRS('fmWaybill','KAgent') + ':';

    gbPos.Caption := ' '+GetRS('fmContr','Specification')+' ';
    lCurr.Caption := GetRS('fmWaybill', 'Curr') + ':';
    lPersonname.Caption := GetRS('fmContr','Responsible')+':';
    lToDate.Caption := GetRS('fmContr','ToDate') + ':';
    chbSumm.Properties.Caption := GetRS('fmContr','ContrSum');
    chbAllAmount.Properties.Caption := GetRS('fmContr','AllAmmount');
    lFPath.Caption := GetRS('fmContr','FPath')+':';
    aPrint.Hint := GetRS('fmContr','PrintFRF');
    aPrintF.Hint := GetRS('fmContr','PrintF');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.aAddFPathExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.aAddFPathExecute') else _udebug := nil;{$ENDIF}

  edFPath.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.CtrlEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.CtrlEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.CtrlExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.CtrlExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.aCurActionExecute(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.aCurActionExecute') else _udebug := nil;{$ENDIF}

  inherited;

  if FCurrCtrl = edFindKA then begin
    try aid := edFindKA.KAID;  except aid := 0; end;
    ShowModalRef(Self, rtKAgent, vtKAgent, 'TfmKAgent', Self.OnDate, aid, 1);
  end
  else if FCurrCtrl = lcbPersonName then begin
    try aid := lcbPersonName.KeyValue; except aid := 0; end;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
  end
  else if FCurrCtrl = edFPath then begin
    if trim(edFPath.Text) <> '' then OpenDlg.InitialDir := Trim(edFPath.Text);

    if OpenDlg.Execute then edFPath.Text := OpenDlg.FileName;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.edFindKARefButtonClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.edFindKARefButtonClick') else _udebug := nil;{$ENDIF}

  inherited;

  edFindKA.Editor.SetFocus;
  FCurrCtrl := edFindKA;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.aPrintExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.aPrintExecute') else _udebug := nil;{$ENDIF}

  if mdDet.IsEmpty then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  mdReport.CopyFromDataSet(mdDet);

  SmartShowRep(frDoc, 'Contr.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.aBallanceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.aBallanceExecute') else _udebug := nil;{$ENDIF}

  try //finally
    if not ShowBallance then begin
      AccessDenied;
      Exit;
    end;

    if edFindKA.KAID <= 0 then Exit;

    with TfrmKATurnover.Create(nil) do
    try
      ParentNameEx := 'fmKAgent';
      OnDate := Self.OnDate;
      ID := edFindKA.KAID;
      ShowModal;

    finally
      Free;
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfrmEditContr.aCInsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.aCInsExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  with TfrmEditPosition.Create(frmEditPosition) do
  try
    ParentNameEx := 'fmWaybill';
    OnDate := edDate.Date + edTime.Time;
    ParentHandle := Self.Handle;
    CurrID := Self.cbCurr.KeyValue;
    Kurs := CurKurs;
    parentMdDet := mdDet; //Tag := integer(mdDet);
    lWHouse.Hide;
    cbWHouse.Hide;
    sbAddWHouse.Hide;
    panSN.Tag := 1;
    DocType := Self.FDocType;
    PanAddProps.Tag := 1;
    PanAddProps.Hide;

    Kurs := 1; //!!!!!!!!

    edAmount.Enabled := (not Self.chbAllAmount.Checked);
    edPrice.Enabled := (not Self.chbSumm.Checked);
    edPriceNoNDS.Enabled := edPrice.Enabled;
    FDocType := Self.FDocType;
    edNDS.Enabled := (not chbExport.Checked);
    FNoNDS := chbExport.Checked;

    id := 0;

    CurrDefName := BaseCurrName;
    CurrShortName := BaseCurrShortName;
    CurrName := cdsCurr.fieldbyname('shortname').AsString;
    Caption := rs(ParentNameEx, 'PosAdd');
    Screen.Cursor := crDefault;

    ShowModal;

  finally
    if not mdDet.IsEmpty then dbgWaybillDet.SetFocus;
    Free;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.aCUpdExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.aCUpdExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  with TfrmEditPosition.Create(frmEditPosition) do
  try
    ParentNameEx := 'fmWaybill';
    OnDate := Self.OnDate;
    dbgWaybillDet.SetFocus;
    PosNDS := mdDet.FieldByName('nds').AsFloat;
    ParentHandle := Self.Handle;
    CurrID := cbCurr.KeyValue;

    Kurs := CurKurs;

    parentMdDet := mdDet; //Tag := integer(mdDet);
    CurrName := cdsCurr.fieldbyname('shortname').AsString;
    CurrDefName := BaseCurrName;
    CurrShortName := BaseCurrShortName;
    lWHouse.Hide;
    cbWHouse.Hide;
    sbAddWHouse.Hide;
    panSN.Tag := 1;
    panSN.Hide;
    PanAddProps.Tag := 1;
    PanAddProps.Hide;
    DocType := Self.FDocType;

    Kurs := 1; //??????????

    edAmount.Enabled := (not Self.chbAllAmount.Checked);
    edPrice.Enabled := (not Self.chbSumm.Checked);
    edPriceNoNDS.Enabled := edPrice.Enabled;
    FDocType := Self.FDocType;
    edNDS.Enabled := (not chbExport.Checked);
    FNoNDS := chbExport.Checked;

    id := mdDet.FieldByName('posid').AsInteger;

    Caption := rs(ParentNameEx, 'PosEdit');
    Screen.Cursor := crDefault;

    ShowModal;

  finally
    Free;
    Screen.Cursor := crDefault;
  end;//try

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.mdDetBeforePost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.mdDetBeforePost') else _udebug := nil;{$ENDIF}

  DataSet.FieldByName('postype').AsInteger := 0;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.GetSummAll;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.GetSummAll') else _udebug := nil;{$ENDIF}

  inherited;

  if not chbSumm.Checked then edSumm.Value := AllSumm;

  if not chbPay.Checked then edAmount.Value := GetDSSumm(mdDet,'amount');

  if mdDet.IsEmpty
    then stMeasureName.Caption := ''
    else stMeasureName.Caption := mdDet.FieldByName('msrname').AsString;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.dbgWaybillDetCustomDrawCell') else _udebug := nil;{$ENDIF}

  if Odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.chbSummPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.chbSummPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  edSumm.Enabled := chbSumm.Checked;
  chbAllAmount.Enabled := chbSumm.Checked;

  if not chbSumm.Checked then chbAllAmount.Checked := chbSumm.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.chbAllAmountPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.chbAllAmountPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  edAmount.Enabled := chbAllAmount.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.cbCurrPropertiesEditValueChanged(Sender: TObject);
  var
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.cbCurrPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if mdDet.IsEmpty then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if cbCurr.Tag = 0 then begin
    stCurrShortName.Caption := cbCurr.Text;
    mdDet.DisableControls;
    BM := mdDet.GetBookmark;

    try
      mdDet.First;
      while not mdDet.Eof do begin
        mdDet.Edit;
        mdDet.FieldByName('currid').AsInteger := cbCurr.KeyValue;
        mdDet.FieldByName('currname').AsString := cbCurr.Text;
        mdDet.Post;
        mdDet.Next;
      end;

    finally
      mdDet.GotoBookmark(BM);
      mdDet.FreeBookmark(BM);
      mdDet.EnableControls;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.aCDelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.aCDelExecute') else _udebug := nil;{$ENDIF}

  mdWMatTurn.Open;
  inherited;
  mdWMatTurn.Close;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.btnPersonNameClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.btnPersonNameClick') else _udebug := nil;{$ENDIF}

  inherited;
  lcbPersonName.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.chbExportPropertiesEditValueChanged(Sender: TObject);
  var
    BM:TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.chbExportPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if chbExport.Tag = 0 then begin
    with mdDet do begin
      DisableControls;
      BM := GetBookmark;

      try
        First;
        while not Eof do begin
          Edit;
          FieldByName('nds').Clear;
          Post;
          Next;
        end;

      finally
        GotoBookmark(BM);
        FreeBookmark(BM);
        EnableControls;
      end;
    end;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.LastFocus(var Mess: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.LastFocus') else _udebug := nil;{$ENDIF}

  if Mess.wParam = WA_INACTIVE then begin
    panTitleBar.GrStartColor := clBlack;
    panTitleBar.GrEndColor := clWhite;
  end
  else begin
    panTitleBar.GrStartColor := clHighlight;
    panTitleBar.GrEndColor := clSkyBlue;
  end;

  panTitleButtons.Repaint;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  edAmount.DecimalPlaces := abs(MatDisplayDigits);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  AdjustGrid(dbgWaybillDet, colMatName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.DoHelp;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.DoHelp') else _udebug := nil;{$ENDIF}

  case (GrpID > 0) of
    True: ShowHelpTopic('fmContrIn');
    False: ShowHelpTopic('fmContrOut');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.aPrintFExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.aPrintFExecute') else _udebug := nil;{$ENDIF}

  if trim(edFPath.Text) <> '' then begin
    if FileExists(trim(edFPath.Text)) then begin
      if ShellExecute(Application.Handle, nil, PChar(trim(edFPath.Text)), nil, nil, SW_SHOWNORMAL) < 32
        then ssMessageDlg(rs('fmContr','FileOpenError') + trim(edFPath.Text), ssmtError, [ssmbOK]);
    end
    else ssMessageDlg(rs('fmContr', 'FileNotFound') + trim(edFPath.Text), ssmtError, [ssmbOK]);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.frDocGetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.frDocGetValue') else _udebug := nil;{$ENDIF}

  inherited;

  if 0 = AnsiCompareText(ParName, 'DOCNUM') then ParValue := edNum1.Text
  else if 0 = AnsiCompareText(ParName, 'DOCDATE') then ParValue := edDate.Date
  else if 0 = AnsiCompareText(ParName, 'NOTES') then ParValue := edNotes.Text
  else if 0 = AnsiCompareText(ParName, 'KAIN') then begin
     case FDocType of
        dtDogOut:ParValue := edFindKA.Obj.FullName;
        dtDogIn: ParValue := EntName;
      end;
  end
  else if 0 = AnsiCompareText(ParName, 'KAOUT') then begin
    case FDocType of
      dtDogOut:ParValue := EntName;
      dtDogIn: ParValue := edFindKA.Obj.FullName;
    end;
  end
  else if 0 = AnsiCompareText(ParName, 'SUMMALL') then ParValue := edSumm.Value
  else if 0 = AnsiCompareText(ParName, 'SUMMAMOUNT') then ParValue := edAmount.Value
  else if 0 = AnsiCompareText(ParName, 'SHIPPEDAMOUNT') then ParValue := 0
  else if 0 = AnsiCompareText(ParName, 'SHIPPEDSUMM') then ParValue := 0
  else if 0 = AnsiCompareText(ParName, 'PAIDSUMM') then ParValue := 0
  else if 0 = AnsiCompareText(ParName, 'PERSONNAME') then ParValue := lcbPersonName.Text
  else if 0 = AnsiCompareText(ParName, 'TODATE') then ParValue := edToDate.Date
  else if 0 = AnsiCompareText(ParName, 'CURRNAME') then ParValue := cbCurr.Text
  else if 0 = AnsiCompareText(ParName, 'PriceDisplayFormatEx') then ParValue := PriceDisplayFormatEx;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditContr.cbCurrPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.cbCurrPropertiesChange') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditContr.edDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditContr.edDatePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := True;
  FPosModified := True;
  FGridRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditContr', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
