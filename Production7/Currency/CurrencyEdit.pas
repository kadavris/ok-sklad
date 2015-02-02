{$I ok_sklad.inc}
unit CurrencyEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxEditor, StdCtrls, ssBaseDlg,
  cxLookAndFeelPainters, ActnList, ssFormStorage, cxCalc, cxCheckBox,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxButtons, ssBaseTypes, dxExEdtr, cxCurrencyEdit, ssBevel,
  ImgList, ssSpeedButton, ssPanel, ssGradientPanel, ssCalcEdit, xButton,
  cxGroupBox, ssGroupBox, ssClientDataSet, ssLabel;

type
  TfrmCurrencyEdit = class(TBaseDlg)
    Panel2: TPanel;
    gbMainInfo: TssGroupBox;
    edName: TcxTextEdit;
    edShortName: TcxTextEdit;
    edOnDate: TcxDateEdit;
    edRate: TssCalcEdit;
    gbRep: TssGroupBox;
    edRepShortName: TcxTextEdit;
    edRepFracName: TcxTextEdit;
    bvlSep: TssBevel;
    chbDefault: TcxCheckBox;
    lBase: TssLabel;
    lOneCurr: TssLabel;
    lOneBase: TssLabel;
    edRateEx: TssCalcEdit;
    lCurr: TssLabel;
    lRate: TssLabel;
    lOnDate: TssLabel;
    lName: TssLabel;
    lShortName: TssLabel;
    lRepShortName: TssLabel;
    lRepFracName: TssLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure chbDefaultClick(Sender: TObject);
    procedure edRateChange(Sender: TObject);
    procedure edRatePropertiesEditValueChanged(Sender: TObject);
    procedure edNamePropertiesChange(Sender: TObject);
    procedure edShortNamePropertiesChange(Sender: TObject);
    procedure edOnDatePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edRatePropertiesChange(Sender: TObject);
    procedure edRateExPropertiesChange(Sender: TObject);

  private
    FRate: Extended;
    FLockRate: Boolean;

  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
    procedure SetSubID(const Value: integer); override;

  public
    ParentHandle: HWND;
    SetFocusToRate: boolean;
    procedure SetCaptions; override;
    procedure SetOnDate(const Value: TDateTime); override;
    procedure SetInactive;
  end;

var
  frmCurrencyEdit: TfrmCurrencyEdit;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ssBaseConst, prConst, DbClient, DB, ClientData, prFun,
  ssFun, ssCallbackConst, fMessageDlg, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmCurrencyEdit.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  dmData.i15.GetBitmap(0, edRate.Properties.ButtonGlyph);
  dmData.i15.GetBitmap(0, edRateEx.Properties.ButtonGlyph);

  //gbMainInfo.Font.Style := [fsBold];
  //gbRep.Font.Style := [fsBold];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmCurrencyEdit.setid') else _udebug := nil;{$ENDIF}

  Fid := Value;

  with newDataSet do
  try
    ProviderName := 'pCurrency_GetDef';
    FetchParams;
    Open;

    if IsEmpty then begin
      chbDefault.Checked := True;
      chbDefault.Enabled := False;
    end;

    Close;

    if Value <> 0 then begin
      Self.Caption := rs(ParentNameEx, 'TitleProps');
      ProviderName := 'pCurrency_Get';
      FetchParams;
      Params.ParamByName('currid').AsInteger := Value;
      Open;

      if not IsEmpty then begin
        edName.Text := fieldbyname('Name').AsString;
        edShortName.Text := fieldbyname('ShortName').AsString;
        edRepShortName.Text := fieldbyname('RepShortName').AsString;
        edRepFracName.Text := fieldbyname('RepFracName').AsString;
        chbDefault.Checked := (FieldByName('def').AsInteger = 1);
      end;
      Close;

      chbDefault.Enabled := not chbDefault.Checked;
      edRate.Enabled := not chbDefault.Checked;
      edRateEx.Enabled := edRate.Enabled;

      if edRate.Enabled
        then edRate.Style.BorderColor := clBtnFace
        else edRate.Style.BorderColor := clBtnShadow;

      lRate.Enabled := edRate.Enabled;
      btnApply.Enabled := False;
    end
    else Self.Caption := rs(ParentNameEx, 'TitleAdd'); //new

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
   NewRecord: boolean;
   cdsT: TClientDataSet;
   Err: string;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmCurrencyEdit.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;
    cdsT := newDataSet;

    with cdsT do try
      TrStart;

      try
        NewRecord := (ID = 0);

        if NewRecord then FID := GetMaxID(dmData.SConnection, 'currency', 'currid');

        if chbDefault.Checked then begin
          ProviderName := 'pCurrency_SetDef0';
          FetchParams;
          Execute;
        end;

        if NewRecord
          then ProviderName := 'pCurrency_Ins'
          else ProviderName := 'pCurrency_Upd';

        FetchParams;
        Params.ParamByName('currid').AsInteger := FID;
        Params.ParamByName('name').AsString := edName.Text;
        Params.ParamByName('shortname').AsString := edShortName.Text;
        Params.ParamByName('repshortname').AsString := edRepShortName.Text;
        Params.ParamByName('repfracname').AsString := edRepFracName.Text;
        Params.ParamByName('def').AsInteger := Integer(chbDefault.Checked);
        Execute;

        if SubID = 0 then begin
          ProviderName := 'pCurrency_RateMax';
          Params.Clear;
          Open;
          FSubID := Fields[0].AsInteger + 1;
          Close;

          ProviderName := 'pCurrency_RateIns';
        end
        else ProviderName := 'pCurrency_RateUpd';

        FetchParams;
        Params.ParamByName('currid').AsInteger := FID;
        Params.ParamByName('ondate').AsDateTime := edOnDate.Date;
        Params.ParamByName('onvalue').AsFloat := edRate.Value;
        Params.ParamByName('rateid').AsInteger := FSubID;
        Execute;

        TrCommit;

        if chbDefault.Checked then begin
          BaseCurrName := edShortName.Text;
          BaseCurrID := FID;
          BaseCurrShortName := edRepShortName.Text;
          BaseCurrFracName := edRepFracName.Text;
        end;

        SendMessage(MainHandle, WM_REFRESH, ID, Integer(NewRecord)+1);

        if RefreshAllClients
          then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_CURRENCY);

        if (ModalResult = mrYes) then begin
          if NewRecord then begin
            edName.Text := '';
            edShortName.Text := '';
            edRate.Value := 0;
            chbDefault.Checked := False;
            chbDefault.Enabled := True;
            edName.SetFocus;
            FID := 0;
          end;
        end
        else CanClose := True;

        FModified := False;

      finally
        Free;
      end;

    except
      on e:exception do begin
        TrRollback;

        if ShowErrorText
          then Err := rs(ParentNameEx, 'RateExist') + #10#13 + e.Message
          else Err := rs(ParentNameEx, 'RateExist');

        ssMessageDlg(Err, ssmtError, [ssmbOk]);
      end;
    end;

  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := (Trim(edName.Text)<>'') and
                  (Trim(edShortName.Text)<>'') and
                  (Trim(edOnDate.Text)<>'') and (edRate.Text <> '') and
                  (StrToFloat(edRate.Text) > 0);

  aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.DataModified(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.DataModified') else _udebug := nil;{$ENDIF}
  FModified := True;
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.SetCaptions') else _udebug := nil;{$ENDIF}

  lName.Caption := RS(ParentNameEx, 'Name') + ':';
  lShortName.Caption := RS(ParentNameEx, 'ShortName') + ':';
  lOnDate.Caption := RS(ParentNameEx, 'Date') + ':';
  lRate.Caption := RS(ParentNameEx, 'CurValue') + ':';
  gbRep.Caption := ' ' + RS(ParentNameEx, 'Rep') + ' ';
  gbMainInfo.Caption := ' ' + RS(ParentNameEx, 'MainInfo') + ' ';
  lRepShortName.Caption := RS(ParentNameEx, 'RepShortName') + ':';
  lRepFracName.Caption := RS(ParentNameEx, 'RepFracName') + ':';
  lOneBase.Caption := '1 ' + BaseCurrName + ' =';
  lBase.Caption := BaseCurrName;

  aOK.Caption := RS('Common', 'OK');
  aCancel.Caption := RS('Common', 'Cancel');
  aApply.Caption := RS('Common', 'Apply');
  chbDefault.Properties.Caption := AnsiLowerCase(RS(ParentNameEx, 'Base'));

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  if edOnDate.Text = '' then edOnDate.Date := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.SetSubID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.SetSubID') else _udebug := nil;{$ENDIF}

  inherited;

  if Value = 0 then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with newDataSet do
  try
    ProviderName := 'pCurrency_RateGet';
    FetchParams;
    Params.ParamByName('rateid').AsInteger := Value;
    Open;
    edOnDate.Date := fieldbyname('ondate').AsDateTime;
    edRate.Value := fieldbyname('onvalue').AsFloat;
    FRate := edRate.Value;
    edOnDate.Enabled := False;

    if edOnDate.Enabled
      then edOnDate.Style.BorderColor := clBtnFace
      else edOnDate.Style.BorderColor := clBtnShadow;

    lOnDate.Enabled := False;
    Close;

  finally
    Free;
  end;

  if chbDefault.Checked then edRate.Value := 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.chbDefaultClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.chbDefaultClick') else _udebug := nil;{$ENDIF}

  if chbDefault.Checked then begin
    edRate.Properties.OnChange := nil;
    edRate.Value := 1;
    edRate.Properties.OnChange := edRateChange;
    edRate.Enabled := False;

    if edRate.Enabled
      then edRate.Style.BorderColor := clBtnFace
      else edRate.Style.BorderColor := clBtnShadow;

    lRate.Enabled := False;
  end
  else begin
    edRate.Enabled := True;

    if edRate.Enabled
      then edRate.Style.BorderColor := clBtnFace
      else edRate.Style.BorderColor := clBtnShadow;

    lRate.Enabled := True;
    edRate.Value := FRate;
  end;

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.edRateChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.edRateChange') else _udebug := nil;{$ENDIF}

  FRate := edRate.Value;
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.edRatePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.edRatePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if not edRate.DroppedDown and not VarIsNull(edRate.EditValue)
    then edRate.Value := RoundToA(edRate.EditValue, -3);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.edNamePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.edNamePropertiesChange') else _udebug := nil;{$ENDIF}

  //lWName.Visible := Trim(edName.Text)='';
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.edShortNamePropertiesChange(Sender: TObject);
  var
    s: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.edShortNamePropertiesChange') else _udebug := nil;{$ENDIF}

  s := trim(edShortName.Text);
  if s = '' then s := '___';

  lOneCurr.Caption := '1 ' + s + ' =';
  lCurr.Caption := s;

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.edOnDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.edOnDatePropertiesChange') else _udebug := nil;{$ENDIF}

  //lWOnDate.Visible := Trim(edOnDate.Text)='';
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  if SetFocusToRate then edRate.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.edRatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.edRatePropertiesChange') else _udebug := nil;{$ENDIF}

  if not FLockRate then
    try
      FLockRate := True;
      try
        edRateEx.Value := 1/StrToFloat(edRate.EditText);
      except
      end;

    finally
      FLockRate := False;
    end;

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.edRateExPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.edRateExPropertiesChange') else _udebug := nil;{$ENDIF}

  if not FLockRate then
    try
      FLockRate := True;
      try
        edRate.Value := 1/StrToFloat(edRateEx.EditText);
      except
      end;

    finally
      FLockRate := False;
    end;

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmCurrencyEdit.SetInactive;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCurrencyEdit.SetInactive') else _udebug := nil;{$ENDIF}

  edName.Enabled := False;
  edShortName.Enabled := False;
  edOnDate.Enabled := False;
  chbDefault.Enabled := False;
  edRepShortName.Enabled := False;
  edRepFracName.Enabled := False;
  lName.Enabled := False;
  lShortName.Enabled := False;
  lOnDate.Enabled := False;
  lRepShortName.Enabled := False;
  lRepFracName.Enabled := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('CurrencyEdit', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
