{$I ok_sklad.inc}
unit EditDiscCards;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner6, dxEditor6, StdCtrls, cxTL, ssBaseConst,
  ActnList, ssBaseTypes, ssFormStorage, cxCheckBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, ssBaseDlg,
  ssBevel, ImgList, ssSpeedButton, ssPanel, ssGradientPanel, xButton,
  okSearchEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, ComCtrls,
  cxRadioGroup, cxCalc, ssCalcEdit, dxTL6, dxDBCtrl6, dxDBGrid6, 
  ssDBGrid, DB, ssMemDS, TB2Item, Menus, dxDBTLCl6, dxGrClms6, cxPC,
  ssPopupTreeEdit, ssLabel, cxSpinEdit, DBClient, ssClientDataSet;

type
  TfrmEditDiscCards = class(TBaseDlg)
    aAdd: TAction;
    aDCG: TAction;
    aDCInfo: TAction;
    aDel: TAction;
    aEdit: TAction;
    btnDCInfo: TssSpeedButton;
    btnDel: TssSpeedButton;
    btnGrp: TssSpeedButton;
    btnNew: TssSpeedButton;
    btnProps: TssSpeedButton;
    bvlMain: TssBevel;
    bvlSep: TssBevel;
    cbDiscType: TcxComboBox;
    cbLimit: TcxComboBox;
    cdsParent: TssClientDataSet;
    chbAutoNum: TcxCheckBox;
    colOnValue: TdxDBGridColumn;
    colRecNo: TdxDBGridColumn;
    colTreshold: TdxDBGridColumn;
    edCurrNum: TcxSpinEdit;
    edExpireDate: TcxDateEdit;
    edKAgent: TokKASearchEdit;
    edName: TcxTextEdit;
    edNum: TcxTextEdit;
    edOnValue: TssCalcEdit;
    edPrefix: TcxTextEdit;
    edStartSaldo: TssCalcEdit;
    edSuffix: TcxTextEdit;
    grdAccum: TssDBGrid;
    lAccum: TLabel;
    lcbGrpParent: TssPopupTreeEdit;
    lcbParent: TssPopupTreeEdit;
    lCurrNum: TssLabel;
    lDiscType: TLabel;
    lLimit: TLabel;
    lName: TLabel;
    lNum: TLabel;
    lParent: TLabel;
    lPercent: TLabel;
    lPrefix: TssLabel;
    lStartSaldo: TssLabel;
    lStat: TLabel;
    lSuffix: TssLabel;
    lTotalPos: TssLabel;
    lTotalSumm: TssLabel;
    mdAccum: TssMemoryData;
    mdAccumid: TIntegerField;
    mdAccumonvalue: TFloatField;
    mdAccumtreshold: TFloatField;
    pcMain: TcxPageControl;
    pmMain: TTBPopupMenu;
    rbtNoParent: TcxRadioButton;
    rbtParent: TcxRadioButton;
    srcAccum: TDataSource;
    srcParent: TDataSource;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    tsCard: TcxTabSheet;
    tsGroup: TcxTabSheet;
    txtCurr: TssBevel;
    txtTotalPos: TssBevel;
    txtTotalSumm: TssBevel;
    
    procedure aAddExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aDCGExecute(Sender: TObject);
    procedure aDCInfoExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure cbDiscTypePropertiesEditValueChanged(Sender: TObject);
    procedure cbLimitPropertiesEditValueChanged(Sender: TObject);
    procedure chbAutoNumClick(Sender: TObject);
    procedure colOnValueGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTresholdValidate(Sender: TObject; var ErrorText: String; var Accept: Boolean);
    procedure DataModified(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure grdAccumColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
    procedure grdAccumCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdAccumKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lcbGrpParentGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure lcbParentPropertiesEditValueChanged(Sender: TObject);
    procedure mdAccumBeforePost(DataSet: TDataSet);
    procedure mdAccumCalcFields(DataSet: TDataSet);
    procedure rbtParentClick(Sender: TObject);
    procedure tsCardShow(Sender: TObject);
    procedure tsGroupShow(Sender: TObject);

  private
    FOldValue: Extended;
    FGen: string;

    procedure CheckField(AFName: string);
    function  GetNewDiscValue(AValue: Extended): Extended;
    function  DatesAreCorrect: Boolean;
    procedure GetFromGroup;
    procedure GetNextNum;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
    procedure SetGrpID(const Value: integer); override;

  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
  end;

var
  frmEditDiscCards: TfrmEditDiscCards;

implementation

uses
  prConst, ClientData, prFun, ssCallbackConst, xLngManager,
  fMessageDlg, prTypes, DateUtils, DCTurnover, ssFun, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmEditDiscCards.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditDiscCards.setid') else _udebug := nil;{$ENDIF}

  mdAccum.Open;
  edOnValue.Value := DefDiscountValue;

  if not IsPattern then FID := Value;

  with newDataSet do
  try
    if Value <> 0 then begin
      if tsGroup.Visible then begin
        if not IsPattern
          then Self.Caption := dmData.Lng.GetRS('fmDiscCards', 'GrpTitleEdit')
          else Self.Caption := dmData.Lng.GetRS('fmDiscCards', 'GrpTitleAdd');
      end
      else begin
        if not IsPattern
          then Self.Caption := dmData.Lng.GetRS('fmDiscCards', 'TitleEdit')
          else Self.Caption := dmData.Lng.GetRS('fmDiscCards', 'TitleAdd');
      end;

      if tsCard.Visible then begin
        //Self.ActiveControl := edNum;
        ProviderName := 'pDiscCards_Get';
        FetchParams;
        Params.ParamByName('cardid').AsInteger := Value;
        Open;

        if not IsEmpty then begin
          edNum.Text := FieldByName('num').AsString;
          edKAgent.KAID := FieldByName('kaid').AsInteger;
          lcbParent.Value := FieldByName('grpid').AsInteger;

          if FieldByName('expiredate').IsNull then begin
            edExpireDate.EditValue := Null;
            cbLimit.ItemIndex := 1;
          end
          else begin
            edExpireDate.Date := FieldByName('expiredate').AsDateTime;
            cbLimit.ItemIndex := 0;
          end;

          cbDiscType.ItemIndex := FieldByName('disctype').AsInteger;
          edOnValue.Value := FieldByName('onvalue').AsFloat;
          FOldValue := FieldByName('onvalue').AsFloat;
          edStartSaldo.Value := FieldByName('startsaldo').AsFloat;

          txtTotalPos.Caption := IntToStr(FieldByName('poscount').AsInteger);
          txtTotalSumm.Caption := FormatFloat(MoneyDisplayFormat, FieldByName('total').AsFloat);
        end;
        Close;

        if cbDiscType.ItemIndex = 1 then begin
          ProviderName := 'pDiscCards_AccumGet';
          FetchParams;
          Params.ParamByName('cardid').AsInteger := Value;
          Open;

          while not Eof do begin
            mdAccum.Append;
            mdAccum.FieldByName('treshold').AsFloat := FieldByName('treshold').AsFloat;
            mdAccum.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
            mdAccum.Post;
            Next;
          end;

          Close;
          mdAccum.SortOnFields('treshold');
          mdAccum.First;
        end;
      end
      else begin
        //Self.ActiveControl := edName;
        ProviderName := 'pDCG_Get';
        FetchParams;
        Params.ParamByName('grpid').AsInteger := Value;
        Open;

        if not IsEmpty then begin
          edName.Text := FieldByName('name').AsString;

          if FieldByName('expiredate').IsNull then begin
            edExpireDate.EditValue := Null;
            cbLimit.ItemIndex := 1;
          end
          else begin
            edExpireDate.Date := FieldByName('expiredate').AsDateTime;
            cbLimit.ItemIndex := 0;
          end;

          cbDiscType.ItemIndex := FieldByName('disctype').AsInteger;
          edOnValue.Value := FieldByName('onvalue').AsFloat;
          chbAutoNum.Checked := FieldByName('autonum').AsInteger = 1;

          if FieldByName('pid').AsInteger <> Value then begin
            rbtParent.Checked := True;
            lcbGrpParent.Value := FieldByName('pid').AsInteger;
          end
          else rbtNoParent.Checked := True;

          edPrefix.Text := FieldByName('prefix').AsString;
          edSuffix.Text := FieldByName('suffix').AsString;
          edCurrNum.Value := Gen_ID(dmData.SConnection, FieldByName('genname').AsString, 0);
        end;
        Close;

        if cbDiscType.ItemIndex = 1 then begin
          ProviderName := 'pDCG_AccumGet';
          FetchParams;
          Params.ParamByName('grpid').AsInteger := Value;
          Open;

          while not Eof do begin
            mdAccum.Append;
            mdAccum.FieldByName('treshold').AsFloat := FieldByName('treshold').AsFloat;
            mdAccum.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
            mdAccum.Post;
            Next;
          end;
          Close;
          mdAccum.SortOnFields('treshold');
          mdAccum.First;
        end;
      end;

      if not IsPattern then begin
        btnApply.Enabled := False;
      end;
    end
    else begin
      if tsGroup.Visible
        then Self.Caption := dmData.Lng.GetRS('fmDiscCards', 'GrpTitleAdd')
        else begin
          Self.Caption := dmData.Lng.GetRS('fmDiscCards', 'TitleAdd');
          GetFromGroup;
          GetNextNum;
        end;

      if mdAccum.IsEmpty then begin
        mdAccum.Append;
        mdAccum.FieldByName('onvalue').AsFloat := 5;
        mdAccum.FieldByName('treshold').AsFloat := 0;
        mdAccum.Post;
      end;  
    end;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
  NewRecord: boolean;
  BM: TBookmark;
  FInfo: TGrpInfo;
  FTotal: Extended;
  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.FormCloseQuery') else _udebug := nil;{$ENDIF}


  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    if mdAccum.State <> dsBrowse then mdAccum.Post;

    FTotal := 0;
    
    with newDataSet do
    try
      TrStart;

      try
        NewRecord := (ID = 0);

        if tsCard.Visible then begin
          if ID = 0 then FID := GetMaxID(dmData.SConnection, 'disccards', 'cardid');

          if not NewRecord then begin
            ProviderName := 'pDC_Stat_Get';
            FetchParams;
            Params.ParamByName('cardid').AsInteger := FID;
            Open;
            FTotal := FieldByName('total').AsFloat;
            Close;
          end;

          if NewRecord
            then ProviderName := 'pDiscCards_Ins'
            else ProviderName := 'pDiscCards_Upd';

          FetchParams;
          Params.ParamByName('cardid').AsInteger := FID;
          Params.ParamByName('num').AsString := edNum.Text;
          Params.ParamByName('kaid').AsInteger := edKAgent.KAID;
          Params.ParamByName('grpid').AsInteger := lcbParent.Value;
          Params.ParamByName('startsaldo').AsFloat := edStartSaldo.Value;
          Params.ParamByName('notes').AsString := '';

          if cbLimit.ItemIndex = 1 then begin
            Params.ParamByName('expiredate').DataType := ftDateTime;
            Params.ParamByName('expiredate').Clear;
          end
          else Params.ParamByName('expiredate').AsDateTime := edExpireDate.Date;

          Params.ParamByName('disctype').AsInteger := cbDiscType.ItemIndex;

          if cbDiscType.ItemIndex = 0 then begin
            Params.ParamByName('onvalue').AsFloat := edOnValue.EditValue;
          end
          else begin
            if not NewRecord then begin
              Params.ParamByName('onvalue').AsFloat := GetNewDiscValue(FTotal);
            end
            else begin
              if mdAccum.Locate('treshold', 0, [])
                then Params.ParamByName('onvalue').AsFloat := mdAccum.FieldByName('onvalue').AsFloat
                else Params.ParamByName('onvalue').AsFloat := 0;
             end;
          end;
          Execute;

          if not NewRecord then begin
            ProviderName := 'pDC_Accum_Del';
            FetchParams;
            Params.ParamByName('cardid').AsInteger := FID;
            Execute;
          end;

          if cbDiscType.ItemIndex = 1 then begin
            ProviderName := 'pDC_Accum_Ins';
            FetchParams;
            Params.ParamByName('cardid').AsInteger := FID;
            BM := mdAccum.GetBookmark;
            mdAccum.DisableControls;
            try
              mdAccum.First;
              while not mdAccum.Eof do begin
                Params.ParamByName('treshold').AsFloat := mdAccum.FieldByName('treshold').AsFloat;
                Params.ParamByName('onvalue').AsFloat := mdAccum.FieldByName('onvalue').AsFloat;
                Execute;
                mdAccum.Next;
              end;
            finally
              mdAccum.GotoBookmark(BM);
              mdAccum.FreeBookmark(BM);
              mdAccum.EnableControls;
            end;
          end;

          if NewRecord then begin
            ProviderName := 'pDC_Stat_Ins';
            FetchParams;
            Params.ParamByName('cardid').AsInteger := FID;
            Params.ParamByName('poscount').AsInteger := 0;
            Params.ParamByName('total').AsFloat := 0;
            Execute;
          end;
        end
        else begin
          if ID = 0 then begin
            FID := GetMaxID(dmData.SConnection, 'disccardgrp', 'grpid');
          end;

          if NewRecord
            then ProviderName := 'pDCG_Ins'
            else ProviderName := 'pDCG_Upd';
          FetchParams;
          Params.ParamByName('grpid').AsInteger := FID;
          Params.ParamByName('name').AsString := edName.Text;

          if not rbtParent.Checked
            then Params.ParamByName('pid').AsInteger := FID
            else Params.ParamByName('pid').AsInteger := lcbGrpParent.Value;

          Params.ParamByName('notes').AsString := '';

          if cbLimit.ItemIndex = 1 then begin
            Params.ParamByName('expiredate').DataType := ftDateTime;
            Params.ParamByName('expiredate').Clear;
          end
          else Params.ParamByName('expiredate').AsDateTime := edExpireDate.Date;

          Params.ParamByName('disctype').AsInteger := cbDiscType.ItemIndex;
          Params.ParamByName('autonum').AsInteger := Integer(chbAutoNum.Checked);
          Params.ParamByName('prefix').AsString := edPrefix.Text;
          Params.ParamByName('suffix').AsString := edSuffix.Text;
          Params.ParamByName('currnum').AsInteger := edCurrNum.Value;

          if cbDiscType.ItemIndex = 0
            then Params.ParamByName('onvalue').AsFloat := edOnValue.EditValue
            else Params.ParamByName('onvalue').AsFloat := 0;

          Execute;

          if NewRecord then begin
            ProviderName := 'pSQL';
            FetchMacros;
            Params.Clear;
            Macros.ParamByName('sql').AsString := 'create generator gen_dcg' + IntToStr(FID);
            Execute;
          end;

          ProviderName := 'pSQL';
          FetchMacros;
          Params.Clear;

          Macros.ParamByName('sql').AsString := 'set generator gen_dcg' + IntToStr(FID) + ' to ' + IntToStr(edCurrNum.Value);

          Execute;

          if not NewRecord then begin
            ProviderName := 'pDCG_Accum_Del';
            FetchParams;
            Params.ParamByName('grpid').AsInteger := FID;
            Execute;
          end;

          if cbDiscType.ItemIndex = 1 then begin
            ProviderName := 'pDCG_Accum_Ins';
            FetchParams;
            Params.ParamByName('grpid').AsInteger := FID;
            BM := mdAccum.GetBookmark;
            mdAccum.DisableControls;

            try
              mdAccum.First;
              while not mdAccum.Eof do begin
                Params.ParamByName('treshold').AsFloat := mdAccum.FieldByName('treshold').AsFloat;
                Params.ParamByName('onvalue').AsFloat := mdAccum.FieldByName('onvalue').AsFloat;
                Execute;
                mdAccum.Next;
              end;

            finally
              mdAccum.GotoBookmark(BM);
              mdAccum.FreeBookmark(BM);
              mdAccum.EnableControls;
            end;
          end;
        end;

        TrCommit;

        if pcMain.ActivePage = tsCard
          then DoRecalcDC(dmData.SConnection, FID);

        if tsCard.Visible
          then SendMessage(MainHandle, WM_REFRESH, ID, GrpID + 10)
          else begin
            FInfo.ID := FID;

            if rbtParent.Checked
              then FInfo.PID := lcbGrpParent.Value
              else FInfo.PID := ID;

            if NewRecord
              then SendMessage(MainHandle, WM_REFRESH, Integer(@FInfo), -1)
              else SendMessage(MainHandle, WM_REFRESH, Integer(@FInfo), -2);
          end;
        {frmMainForm.ExecRefresh('WH', 0);
        if RefreshAllClients
          then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_ACCOUNTTYPE);
        }
        if (ModalResult = mrYes) then begin
          if NewRecord then begin
            if not IsPattern then begin
              edNum.Text := EmptyStr;
              edKAgent.KAID := 0;
              mdAccum.Close;
              mdAccum.Open;
            end;

            edNum.SetFocus;
            ID := 0;
          end;
        end
        else CanClose := True;

        FModified := False;

      finally
        Free;
      end;

    except
      on E: EAbort do begin
        TrRollback;
      end
      else begin
        TrRollback;
        raise;
      end;
    end;
  end
  else if FGen <> '' then Gen_ID(dmData.SConnection, FGen, -1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.ActionListUpdate') else _udebug := nil;{$ENDIF}

  if tsCard.Visible then begin
    aOk.Enabled := (Trim(edNum.Text) <> EmptyStr) and (edKAgent.KAID > 0)
      and DatesAreCorrect
      and (lcbParent.EditText <> '')
      and (lcbParent.Value <> 0)
      and (((cbDiscType.ItemIndex = 1) and not mdAccum.IsEmpty)
       or (cbDiscType.ItemIndex = 0));
  end
  else begin
    aOk.Enabled := (Trim(edName.Text) <> EmptyStr)
      and DatesAreCorrect
      and (((cbDiscType.ItemIndex = 1) and not mdAccum.IsEmpty)
       or (cbDiscType.ItemIndex = 0))
      and ((rbtParent.Checked and (lcbGrpParent.EditingText <> ''))
        or
          rbtNoParent.Checked);
  end;

  aApply.Enabled := aOk.Enabled and FModified;
  aDel.Enabled := not mdAccum.IsEmpty;
  aDCInfo.Visible := tsCard.Visible;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.DataModified') else _udebug := nil;{$ENDIF}


  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with dmData.Lng do begin
    //lName.Caption := GetRS(ParentNameEx, 'Name') + ':';

    lTotalPos.Caption := GetRS('fmDiscCards', 'TotalPos') + ':';
    lTotalSumm.Caption := GetRS('fmDiscCards', 'TotalSumm') + ':';

    lName.Caption := GetRS('fmDiscCards', 'GrpName') + ':';
    lStartSaldo.Caption := GetRS('fmDiscCards', 'StartSaldo') + ':';
    rbtParent.Caption := GetRS('fmDiscCards', 'BelongTo') + ':';
    rbtNoParent.Caption := GetRS('fmDiscCards', 'NotBelongTo');
    chbAutoNum.Properties.Caption := GetRS('fmDiscCards', 'AutoNum');
    lPrefix.Caption := GetRS('frmOptions', 'Prefix') + ':';
    lSuffix.Caption := GetRS('frmOptions', 'Suffix') + ':';
    lCurrNum.Caption := GetRS('frmOptions', 'CurrNum') + ':';
    lParent.Caption := GetRS('fmDiscCards', 'DependTo') + ':';
    btnGrp.Hint := GetRS('fmDiscCards', 'RefDCG');

    btnDCInfo.Hint := GetRS('fmDiscCards', 'DCInfo');

    lNum.Caption := GetRS('fmDiscCards', 'Num') + ':';
    lDiscType.Caption := GetRS('fmDiscCards', 'DiscType') + ':';
    lLimit.Caption := GetRS('fmDiscCards', 'ValidPeriod') + ':';
    lAccum.Caption := GetRS('fmDiscCards', 'DefineDisc') + ':';
    lStat.Caption := GetRS('fmDiscCards', 'Stat') + ':';
    colTreshold.Caption := GetRS('fmDiscCards', 'TresholdValue');
    colOnValue.Caption := GetRS('fmDiscCards', 'DiscPercent');
    with cbDiscType do begin
      Properties.Items.Add(GetRS('fmDiscCards', 'Simple'));
      Properties.Items.Add(GetRS('fmDiscCards', 'Accum'));
      ItemIndex := 0;
    end;

    with cbLimit do begin
      Properties.Items.Add(GetRS('fmDiscCards', 'ExpireDate'));
      Properties.Items.Add(GetRS('fmDiscCards', 'Unlimited'));
      ItemIndex := 0;
    end;

    aAdd.Caption := GetRS('Common', 'Add');
    aDel.Caption := GetRS('Common', 'Del');
    aEdit.Caption := GetRS('Common', 'Edit');

    edKAgent.InitRes;
    edKAgent.Caption.Caption := LangMan.GetRS('fmDiscCards', 'Holder') + ':';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.cbDiscTypePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.cbDiscTypePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if cbDiscType.ItemIndex = 0 then begin
    if grdAccum.Visible then begin
      edOnValue.Visible := True;
      lPercent.Visible := True;
      grdAccum.Visible := False;
      lAccum.Visible := False;
      aAdd.Visible := False;
      aEdit.Visible := False;
      aDel.Visible := False;
      Self.ClientHeight := cbDiscType.Top + cbDiscType.Height + BaseHeight + 8;
    end;
  end
  else begin
    edOnValue.Visible := False;
    lPercent.Visible := False;
    grdAccum.Visible := True;
    lAccum.Visible := True;
    aAdd.Visible := True;
    aEdit.Visible := True;
    aDel.Visible := True;
    Self.ClientHeight := grdAccum.Top + grdAccum.Height + BaseHeight + 8;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.cbLimitPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.cbLimitPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  edExpireDate.Visible := cbLimit.ItemIndex = 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.mdAccumCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.mdAccumCalcFields') else _udebug := nil;{$ENDIF}

  DataSet.FieldByName('id').AsInteger := DataSet.RecNo + 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.grdAccumCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.grdAccumCustomDrawCell') else _udebug := nil;{$ENDIF}

  try
    if Odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

    if ASelected and ((AColumn.ColIndex <> grdAccum.FocusedColumn) or not AFocused)
      then AColor := $00BEBEBE;

    if ASelected and AFocused and AColumn.DisableEditor then AColor := grdAccum.HighlightColor;

    if not ASelected or not AFocused then AFont.Color := clWindowText;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.colRecNoGetText') else _udebug := nil;{$ENDIF}

  AText := IntToStr(ANode.Index + 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.colOnValueGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.colOnValueGetText') else _udebug := nil;{$ENDIF}

  AText := AText + ' %';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.mdAccumBeforePost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.mdAccumBeforePost') else _udebug := nil;{$ENDIF}

  CheckField('treshold');
  CheckField('onvalue');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.CheckField(AFName: string);
  var
    FCol: TdxDBTreeListColumn;
    FErr: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.CheckField') else _udebug := nil;{$ENDIF}

  FErr := False;
  FCol := grdAccum.ColumnByFieldName(AFName);

  if mdAccum.FieldByName(AFName).IsNull or (mdAccum.FieldByName(AFName).AsFloat < 0)
  then begin
    ssMessageDlg(Format(LangMan.GetRS('fmDiscCards', 'DefineValue'), [FCol.Caption]), ssmtError, [ssmbOk]);
    FErr := True;
  end;

  if FErr then begin
    grdAccum.FocusedColumn := FCol.ColIndex;
    grdAccum.ShowEditor;
    Abort;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.aAddExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.aAddExecute') else _udebug := nil;{$ENDIF}

  if mdAccum.IsEmpty
    then mdAccum.Append
    else mdAccum.Insert;

  grdAccum.FocusedColumn := colTreshold.ColIndex;
  grdAccum.ShowEditor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.aDelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.aDelExecute') else _udebug := nil;{$ENDIF}

  mdAccum.Delete;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.aEditExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.aEditExecute') else _udebug := nil;{$ENDIF}


  grdAccum.ShowEditor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.grdAccumColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.grdAccumColumnSorting') else _udebug := nil;{$ENDIF}

  Allow := (Column = colTreshold);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.grdAccumKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.grdAccumKeyDown') else _udebug := nil;{$ENDIF}

  if (grdAccum.FocusedNode = grdAccum.LastNode) and (Key = VK_DOWN) then begin
    mdAccum.Append;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditDiscCards.GetNewDiscValue(AValue: Extended): Extended;
 var
   BM: TBookmark;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.GetNewDiscValue') else _udebug := nil;{$ENDIF}

  Result := 0;

  with mdAccum do begin
    DisableControls;
    BM := GetBookmark;
    try
      SortOnFields('treshold');
      First;

      while not Eof do begin
        if AValue < FieldByName('treshold').AsFloat then begin
          Prior;
          Result := FieldByName('onvalue').AsFloat;
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;

        Next;
      end;

      Result := FieldByName('onvalue').AsFloat;

    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
      EnableControls;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditDiscCards.DatesAreCorrect: Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.DatesAreCorrect') else _udebug := nil;{$ENDIF}

  Result := True;
  try
    if cbLimit.ItemIndex = 0 then StrToDate(edExpireDate.EditingText);
  except
    Result := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  setFontStyle(lcbParent.InnerTree.Font);
  edExpireDate.Date := IncYear(Date, DC_Expire_Period);
  cbDiscTypePropertiesEditValueChanged(cbDiscType);
  pcMain.ActivePage := tsCard;
  cdsParent.Open;
  lcbGrpParent.Value := cdsParent.FieldByName('grpid').AsInteger;
  lcbParent.Value := cdsParent.FieldByName('grpid').AsInteger;
  txtCurr.Caption := BaseCurrName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.colTresholdValidate(Sender: TObject; var ErrorText: String; var Accept: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.colTresholdValidate') else _udebug := nil;{$ENDIF}

  try
    StrToFloat(grdAccum.EditingText);

  except
    grdAccum.EditingText := '';
    grdAccum.ShowEditor;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.chbAutoNumClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.chbAutoNumClick') else _udebug := nil;{$ENDIF}

  lPrefix.Enabled := chbAutoNum.Checked;
  edPrefix.Enabled := chbAutoNum.Checked;
  lSuffix.Enabled := chbAutoNum.Checked;
  edSuffix.Enabled := chbAutoNum.Checked;
  lCurrNum.Enabled := chbAutoNum.Checked;
  edCurrNum.Enabled := chbAutoNum.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.rbtParentClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.rbtParentClick') else _udebug := nil;{$ENDIF}

  lcbGrpParent.Enabled := rbtParent.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.lcbGrpParentGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.lcbGrpParentGetNodeImageIndex') else _udebug := nil;{$ENDIF}

  if ANode.Expanded
    then AIndex := 49
    else AIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.tsGroupShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.tsGroupShow') else _udebug := nil;{$ENDIF}

  edName.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.tsCardShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.tsCardShow') else _udebug := nil;{$ENDIF}

  edNum.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.SetGrpID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.SetGrpID') else _udebug := nil;{$ENDIF}

  inherited;

  if Value <> 0 then begin
    rbtParent.Checked := True;
    lcbParent.Value := Value;
    lcbGrpParent.Value := Value;
  end
  else rbtNoParent.Checked := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.lcbParentPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.lcbParentPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if not Self.Visible then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  lcbParent.CloseUp(False);

  if FID <> 0 then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if mrYes = ssMessageDlg(Format(LangMan.GetRS('fmDiscCards', 'SetFromGroup'), [lcbParent.EditingText]), ssmtConfirmation, [ssmbYes, ssmbNo])
  then begin
    if FGen <> '' then Gen_ID(dmData.SConnection, FGen, -1);
    GetFromGroup;
    GetNextNum;
  end
  else begin
    if FGen <> '' then Gen_ID(dmData.SConnection, FGen, -1);
    FGen := '';
  end;

  DataModified(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.GetFromGroup;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.GetFromGroup') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  Application.ProcessMessages;

  with newDataSet do
  try
    if lcbParent.Locate(lcbParent.EditingText, 0, [])
      then lcbParent.Value := lcbParent.InnerTree.FocusedNode.Values[1];

    ProviderName := 'pDCG_Get';
    FetchParams;
    Params.ParamByName('grpid').AsInteger := lcbParent.Value;
    Open;
    if FieldByName('expiredate').IsNull then begin
      edExpireDate.EditValue := Null;
      cbLimit.ItemIndex := 1;
    end
    else begin
      edExpireDate.Date := FieldByName('expiredate').AsDateTime;
      cbLimit.ItemIndex := 0;
    end;
    cbDiscType.ItemIndex := FieldByName('disctype').AsInteger;
    edOnValue.Value := FieldByName('onvalue').AsFloat;
    Close;

    if cbDiscType.ItemIndex = 1 then begin
      ProviderName := 'pDCG_AccumGet';
      FetchParams;
      Params.ParamByName('grpid').AsInteger := lcbParent.Value;
      Open;
      mdAccum.Close;
      mdAccum.Open;
      while not Eof do begin
        mdAccum.Append;
        mdAccum.FieldByName('treshold').AsFloat := FieldByName('treshold').AsFloat;
        mdAccum.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
        mdAccum.Post;
        Next;
      end;

      Close;
      mdAccum.SortOnFields('treshold');
      mdAccum.First;
    end;

  finally
    Free;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.GetNextNum;
  var
    FSuffix, FPrefix: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.GetNextNum') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pDCG_Get';
    FetchParams;
    Params.ParamByName('grpid').AsInteger := lcbParent.Value;
    Open;
    if FieldByName('autonum').AsInteger = 1 then begin
      FGen := 'gen_dcg' + IntToStr(lcbParent.Value);
      FSuffix := FieldByName('suffix').AsString;
      FPrefix := FieldByName('prefix').AsString;
      edNum.Text := FPrefix + IntToStr(Gen_ID(dmData.SConnection, FGen, 1)) + FSuffix;
    end
    else FGen := '';
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.aDCInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.aDCInfoExecute') else _udebug := nil;{$ENDIF}

  if (FID = 0) then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmDCTurnover.Create(nil) do
  try
    ID := Self.ID;
    OnDate := Self.OnDate;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.aDCGExecute(Sender: TObject);
  var
    AID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.aDCGExecute') else _udebug := nil;{$ENDIF}

  try
    AID := lcbParent.Value;

  except
    AID := 0;
  end;

  ShowModalRef(Self, rtDiscCardGroup, vtDiscCardGroup, 'TfmDCG', Self.OnDate, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDiscCards.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDiscCards.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtDiscCardGroup:
      begin
        DSRefresh(cdsParent, 'grpid', M.WParam);
        lcbParent.Value := M.WParam;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditDiscCards', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
