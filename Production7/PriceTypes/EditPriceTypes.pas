{$I ok_sklad.inc}
unit EditPriceTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxEditor, StdCtrls,
  ActnList, ssBaseTypes, ssFormStorage, cxCheckBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, ssBaseDlg,
  ssBevel, ImgList, ssSpeedButton, ssPanel, ssGradientPanel, cxMaskEdit,
  cxDropDownEdit, cxCalc, ssCalcEdit, xButton, cxRadioGroup, cxGroupBox,
  ssGroupBox, DB, DBClient, ssClientDataSet, ssDBLookupCombo, ssLabel;

type
  TfrmEditPriceTypes = class(TBaseDlg)
    bvlMain: TssBevel;
    edName: TcxTextEdit;
    lName: TLabel;
    chbDefault: TcxCheckBox;
    gbType: TssGroupBox;
    edExtra: TssCalcEdit;
    rbtExtra: TcxRadioButton;
    rbtDisc: TcxRadioButton;
    cdsPriceTypes: TssClientDataSet;
    dsPriceTypes: TDataSource;
    lcbPriceTypes: TssDBLookupCombo;
    lDiscText: TssLabel;
    edDisc: TssCalcEdit;
    imgExtra: TImage;
    imgDisc: TImage;
    cbExtra: TcxComboBox;
    lcbPTExtra: TssDBLookupCombo;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure bvlMainMouseEnter(Sender: TObject);
    procedure bvlMainMouseLeave(Sender: TObject);
    procedure rbtExtraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbExtraPropertiesEditValueChanged(Sender: TObject);
  private
    procedure GetImages;
    function CheckParent: Boolean;
  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
    { Public declarations }
  end;

var
  frmEditPriceTypes: TfrmEditPriceTypes;

implementation

uses ssBaseConst, prConst, ClientData, prFun, ssCallbackConst, fMessageDlg, udebug;

  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}
//==============================================================================================
procedure TfrmEditPriceTypes.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditPriceTypes.setid') else _udebug := nil;{$ENDIF}

  if not IsPattern then FID := Value;

  with newDataSet do
  try
    if Value <> 0 then begin
     if not IsPattern
       then Self.Caption := rs(ParentNameEx, 'TitleEdit')
       else Self.Caption := rs(ParentNameEx, 'TitleAdd');

     ProviderName := 'pPriceTypes_Get';
     FetchParams;
     Params.ParamByName('PTypeID').AsInteger := Value;
     Open;

     if not IsEmpty then begin
      edName.Text := fieldbyname('Name').asstring;
      chbDefault.Checked := FieldByName('def').AsInteger = 1;
      if FieldByName('pptypeid').IsNull then begin
        rbtExtra.Checked := True;
        edExtra.Value := FieldByName('onvalue').AsFloat;
      end else
      if FieldByName('extratype').AsInteger = 2 then begin
        rbtExtra.Checked := True;
        cbExtra.ItemIndex := 1;
        edExtra.Value := FieldByName('onvalue').AsFloat;
        lcbPTExtra.KeyValue := FieldByName('pptypeid').AsInteger;
      end
      else begin
        rbtDisc.Checked := True;
        edDisc.Value := FieldByName('onvalue').AsFloat;
        lcbPriceTypes.KeyValue := FieldByName('pptypeid').AsInteger;
      end;
     end;
     Close;
     
     if not IsPattern then begin
       btnApply.Enabled := False;
       chbDefault.Enabled := not chbDefault.Checked;
     end;
    end
    else Self.Caption := rs(ParentNameEx, 'TitleAdd');

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceTypes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditPriceTypes.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    if not CheckParent then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    with newDataSet do
    try
      TrStart;

      try
        NewRecord := (ID = 0);
        if NewRecord then FID := GetMaxID(dmData.SConnection, 'pricetypes', 'ptypeid');

        if chbDefault.Checked then begin
          ProviderName := 'pPriceTypes_SetDef';
          Execute;
          chbDefault.Enabled := false;
        end;

        if NewRecord
          then ProviderName := 'pPriceTypes_Ins'
          else ProviderName := 'pPriceTypes_Upd';

        FetchParams;
        Params.ParamByName('ptypeid').AsInteger := FID;
        Params.ParamByName('num').AsInteger := FID;

        if rbtExtra.Checked and (cbExtra.ItemIndex = 1)
          then Params.ParamByName('extratype').AsInteger := 2
          else Params.ParamByName('extratype').AsInteger := 0;

        Params.ParamByName('name').AsString := edName.Text;

        if rbtExtra.Checked then begin
          Params.ParamByName('onvalue').AsFloat := edExtra.Value;
          if cbExtra.ItemIndex = 0 then begin
            Params.ParamByName('pptypeid').DataType := ftInteger;
            Params.ParamByName('pptypeid').Clear;
          end
          else Params.ParamByName('pptypeid').AsInteger := lcbPTExtra.KeyValue;
        end
        else begin
          Params.ParamByName('onvalue').AsFloat := edDisc.Value;
          Params.ParamByName('pptypeid').AsInteger := lcbPriceTypes.KeyValue;
        end;
        Params.ParamByName('def').AsInteger := Integer(chbDefault.Checked);
        Execute;

        TrCommit;

        SendMessage(MainHandle, WM_REFRESH, ID, 0);

        if RefreshAllClients
          then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_PRICETYPES);

        if ModalResult = mrYes then begin
          if NewRecord then begin
            if not IsPattern then begin
              edName.Text := EmptyStr;
              edExtra.Value := 0;
            end;
            edName.SetFocus;
            FID := 0;
          end
        end
        else CanClose := True;

        FModified := False;

      finally
        Free;
      end;

    except
      on e:exception do begin
        TrRollback;
        ssMessageDlg(e.Message, ssmtError, [ssmbOk]);
      end;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceTypes.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceTypes.ActionListUpdate') else _udebug := nil;{$ENDIF}


  aOk.Enabled := Trim(edName.Text) <> EmptyStr;

  aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceTypes.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceTypes.DataModified') else _udebug := nil;{$ENDIF}


  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceTypes.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceTypes.SetCaptions') else _udebug := nil;{$ENDIF}


  inherited;

  with LangMan do begin
    lName.Caption := GetRS(ParentNameEx, 'Name') + ':';
    chbDefault.Properties.Caption := GetRS('Common', 'Default');

    with cbExtra do begin
      Properties.Items.Add(GetRS('fmMaterials', 'ExtraIn'));
      Properties.Items.Add(GetRS('fmMaterials', 'ExtraPT'));
      ItemIndex := 0;
    end;

    //lExtraText.Caption := GetRS(ParentNameEx, 'ExtraText');
    lDiscText.Caption := GetRS(ParentNameEx, 'DiscText');

    rbtDisc.Caption := GetRS(ParentNameEx, 'Disc') + ', %:';
    rbtExtra.Caption := GetRS(ParentNameEx, 'Extra') + ', %:';

    gbType.Caption := ' ' + GetRS(ParentNameEx, 'Type') + ' ';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceTypes.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceTypes.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceTypes.bvlMainMouseEnter(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceTypes.bvlMainMouseEnter') else _udebug := nil;{$ENDIF}

  with Sender as TssBevel do
    if HotTrack then bvlSep.ColorOuter := HotTrackColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPriceTypes.bvlMainMouseLeave(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceTypes.bvlMainMouseLeave') else _udebug := nil;{$ENDIF}

  with Sender as TssBevel do
    if HotTrack then bvlSep.ColorOuter := clBtnShadow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPriceTypes.rbtExtraClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceTypes.rbtExtraClick') else _udebug := nil;{$ENDIF}

  edExtra.Enabled := rbtExtra.Checked;
  lcbPriceTypes.Enabled := rbtDisc.Checked;
  cbExtra.Enabled := edExtra.Enabled;
  lcbPTExtra.Enabled := cbExtra.Enabled;
  lDiscText.Enabled := rbtDisc.Checked;
  edDisc.Enabled := lcbPriceTypes.Enabled;
  GetImages; 

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceTypes.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceTypes.FormCreate') else _udebug := nil;{$ENDIF}


  inherited;

  cdsPriceTypes.Open;

  GetImages; 

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceTypes.GetImages;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceTypes.GetImages') else _udebug := nil;{$ENDIF}


  if rbtExtra.Checked then begin
    dmData.Images.GetBitmap(107, imgExtra.Picture.Bitmap);
    dmData.Images.GetBitmap(161, imgDisc.Picture.Bitmap);
  end
  else begin
    dmData.Images.GetBitmap(162, imgExtra.Picture.Bitmap);
    dmData.Images.GetBitmap(108, imgDisc.Picture.Bitmap);
  end;
  imgDisc.Repaint;
  imgExtra.Repaint;  

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceTypes.cbExtraPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceTypes.cbExtraPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}


  lcbPTExtra.Visible := cbExtra.ItemIndex = 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditPriceTypes.CheckParent: Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceTypes.CheckParent') else _udebug := nil;{$ENDIF}


  Result := True;
  if FID = 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if (rbtExtra.Checked and (cbExtra.ItemIndex = 1) and (lcbPTExtra.KeyValue = FID))
     or
     (rbtDisc.Checked and (lcbPriceTypes.KeyValue = FID))
  then begin
    Result := False;
    ssMessageDlg(Format(rs('fmMaterials', 'WrongPType'), [edName.Text]), ssmtError, [ssmbOk]);
  end;   

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditPriceTypes', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
