{$I ok_sklad.inc}
unit EditMeasure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxEditor, StdCtrls,
  ActnList, ssBaseTypes, ssFormStorage, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxLookAndFeelPainters, cxCheckBox, cxButtons, ssBaseDlg,
  ssBevel, ImgList, ssSpeedButton, ssGradientPanel, xButton, ssPanel;

type
  TfrmEditMeasure = class(TBaseDlg)
    bvlMain: TssBevel;
    lName: TLabel;
    lShortName: TLabel;
    edShortName: TcxTextEdit;
    edName: TcxTextEdit;
    chbDefault: TcxCheckBox;
    bvlSep: TssBevel;
    lCode: TLabel;
    edCode: TcxTextEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure edNamePropertiesChange(Sender: TObject);
    procedure edShortNamePropertiesChange(Sender: TObject);
  protected
    procedure setid(const Value: integer); override;
  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
    { Public declarations }
  end;

var
  frmEditMeasure: TfrmEditMeasure;

implementation

uses
  ssBaseConst, prConst, DbClient, DB, ClientData, Login, prFun,
  ssCallbackConst, fMessageDlg, ssClientDataSet, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}
//==============================================================================================
procedure TfrmEditMeasure.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditMeasure.setid') else _udebug := nil;{$ENDIF}

  if not IsPattern then FID := Value;

  with newDataSet do
  try
    ProviderName := 'pMeasures_GetDef';
    FetchParams;
    Open;
    if IsEmpty then begin
      chbDefault.Checked := True;
      chbDefault.Enabled := False;
    end;
    Close;

    if Value <> 0 then begin
      if not IsPattern
        then Self.Caption := LangMan.GetRS('fmMeasures', 'TitleEdit')
        else Self.Caption := LangMan.GetRS('fmMeasures', 'TitleAdd');

      ProviderName := 'pMeasures_Get';
      FetchParams;
      Params.ParamByName('mid').AsInteger := Value;
      Open;

      if not IsEmpty then begin
        edName.Text := FieldByName('name').AsString;
        edCode.Text := FieldByName('code').AsString;
        edShortName.Text := FieldByName('shortname').asstring;
        if not IsPattern
          then chbDefault.Checked := FieldByName('def').AsInteger = 1;
      end;

      Close;

      if not IsPattern then begin
        chbDefault.Enabled := not chbDefault.Checked;
        btnApply.Enabled := False;
      end;
    end
    else Self.Caption := LangMan.GetRS('fmMeasures', 'TitleAdd');

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMeasure.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMeasure.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;
    with newDataSet do
    try
      TrStart;

      try
        NewRecord := (ID = 0);
        if NewRecord then FID := GetMaxID(dmData.SConnection, 'measures', 'mid');

        if chbDefault.Checked then begin
          ProviderName := 'pMeasures_SetDef';
          Execute;
        end;

        if NewRecord
          then ProviderName := 'pMeasures_Ins'
          else ProviderName := 'pMeasures_Upd';

        FetchParams;
        Params.ParamByName('mid').AsInteger := ID;
        Params.ParamByName('name').AsString := edName.Text;
        Params.ParamByName('code').AsString := edCode.Text;
        Params.ParamByName('shortname').AsString := edShortName.Text;
        Params.ParamByName('def').AsInteger := Integer(chbDefault.Checked);
        Execute;

        TrCommit;

        SendMessage(MainHandle, WM_REFRESH, ID, SourceID);
        //if RefreshAllClients
        //  then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_MEASURES);
        if ModalResult = mrYes then begin
          if NewRecord then begin
            if not IsPattern then begin
              edName.Text := EmptyStr;
              edShortName.Text := EmptyStr;
            end;

            chbDefault.Checked := False;
            chbDefault.Enabled := True;
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
      on E: Exception do begin
        TrRollback;
        ssMessageDlg(E.Message, ssmtError, [ssmbOk]);
      end;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMeasure.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMeasure.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := (Trim(edName.Text) <> EmptyStr) and (Trim(edShortName.Text) <> EmptyStr);
  aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMeasure.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMeasure.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMeasure.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMeasure.SetCaptions') else _udebug := nil;{$ENDIF}


  with LangMan do begin
    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aApply.Caption := GetRS('Common', 'Apply');

    lName.Caption := GetRS('fmMeasures', 'Name') + ':';
    lCode.Caption := GetRS('fmMeasures', 'Code') + ':';
    lShortName.Caption := GetRS('fmMeasures', 'ShortName') + ':';
    chbDefault.Properties.Caption := GetRS('Common', 'Default');
  end;
  
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMeasure.edNamePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMeasure.edNamePropertiesChange') else _udebug := nil;{$ENDIF}


  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMeasure.edShortNamePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMeasure.edShortNamePropertiesChange') else _udebug := nil;{$ENDIF}


  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditMeasure', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
