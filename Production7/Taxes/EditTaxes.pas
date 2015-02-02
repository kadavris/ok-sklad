{$I ok_sklad.inc}
unit EditTaxes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxEditor, StdCtrls,
  ActnList, ssBaseTypes, ssFormStorage, cxCheckBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, ssBaseDlg,
  ssBevel, ImgList, ssSpeedButton, ssPanel, ssGradientPanel, xButton,
  ssLabel, cxMaskEdit, cxDropDownEdit, cxCalc, ssCalcEdit, cxRadioGroup,
  cxGroupBox, ssGroupBox;

type
  TfrmEditTaxes = class(TBaseDlg)
    bvlMain: TssBevel;
    edName: TcxTextEdit;
    lName: TLabel;
    edOnValue: TssCalcEdit;
    lOnValue: TssLabel;
    gbType: TssGroupBox;
    rbtPersons: TcxRadioButton;
    rbtFirms: TcxRadioButton;
    rbtAll: TcxRadioButton;

    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;

  public
    ParentHandle: HWND;
    procedure SetCaptions; override;

  end;

var
  frmEditTaxes: TfrmEditTaxes;

implementation

uses
  ssBaseConst, prConst, DbClient, DB, ClientData, prFun,
  ssCallbackConst, ssClientDataSet, xLngManager, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmEditTaxes.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditTaxes.setid') else _udebug := nil;{$ENDIF}

  if not IsPattern then FID := Value;

  with newDataSet do
  try
    if Value <> 0 then begin
      if not IsPattern
        then Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleProps')
        else Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleAdd');

      ProviderName := 'pTaxes_Get';
      FetchParams;
      Params.ParamByName('taxid').AsInteger := Value;
      Open;

      if not IsEmpty then begin
        edName.Text := FieldByName('Name').AsString;
        edOnValue.Value := FieldByName('onvalue').AsFloat;
        case FieldByName('taxtype').AsInteger of
          0: rbtAll.Checked := True;
          1: rbtPersons.Checked := True;
          2: rbtFirms.Checked := True;
        end;
      end;

      Close;
      if not IsPattern then begin
        btnApply.Enabled := False;
      end;
    end
    else Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleAdd');

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: boolean;
    FRate: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditTaxes.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    with newDataSet do
    try
      TrStart;

      try
        NewRecord := (ID = 0);
        if NewRecord then FID := GetMaxID(dmData.SConnection, 'taxes', 'taxid');

        if NewRecord
          then ProviderName := 'pTaxes_Ins'
          else ProviderName := 'pTaxes_Upd';

        FetchParams;
        Params.ParamByName('taxid').AsInteger := FID;
        Params.ParamByName('name').AsString := edName.Text;

        if rbtAll.Checked then Params.ParamByName('taxtype').AsInteger := 0 else

        if rbtPersons.Checked
          then Params.ParamByName('taxtype').AsInteger := 1
          else Params.ParamByName('taxtype').AsInteger := 2;

        try
          FRate := StrToFloat(edOnValue.EditingText);
        except
          FRate := 0;
        end;

        Params.ParamByName('onvalue').AsFloat := FRate;
        Execute;

        TrCommit;

        SendMessage(MainHandle, WM_REFRESH, ID, 0);

        if ModalResult = mrYes then begin
          if NewRecord then begin
            if not IsPattern then begin
              edName.Text := EmptyStr;
              edOnValue.Value := 0;
            end;

            edName.SetFocus;
            FID := 0;
          end
        end
        else CanClose:=True;

        FModified := False;

      finally
        Free;
      end;

    except
      on e:exception do begin
        TrRollback;
        MessageDlg(e.Message, mtError, [mbOk], 0);
      end;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxes.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxes.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := (Trim(edName.Text) <> EmptyStr);
  aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxes.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxes.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxes.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxes.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with dmData.Lng do begin
    lName.Caption := GetRS(ParentNameEx, 'Name') + ':';
    lOnValue.Caption := GetRS(ParentNameEx, 'Rate') + ':';

    gbType.Caption := ' ' + GetRS('fmTaxes', 'Type') + ' ';
    rbtAll.Caption := AnsiLowerCase(GetRS('fmTaxes', 'AllKA'));
    rbtPersons.Caption := AnsiLowerCase(GetRS('fmTaxes', 'Persons'));
    rbtFirms.Caption := AnsiLowerCase(GetRS('fmTaxes', 'Firms'));
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxes.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxes.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxes.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxes.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  dmData.i15.GetBitmap(0, edOnValue.Properties.ButtonGlyph);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditTaxes', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
