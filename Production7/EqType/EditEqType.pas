{$I ok_sklad.inc}
unit EditEqType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxEditor, StdCtrls,
  ActnList, ssBaseTypes, ssFormStorage, cxLookAndFeelPainters, cxButtons,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, ssBaseDlg,
  ImgList, xButton, ssPanel, ssGradientPanel, ssSpeedButton;

type
  TfrmEditEqType = class(TBaseDlg)
    lName: TLabel;
    edName: TcxTextEdit;
    chbDefault: TcxCheckBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
    { Public declarations }
  end;

var
  frmEditEqType: TfrmEditEqType;

implementation

uses ssBaseConst, prConst, DbClient, DB, ClientData, prFun, Udebug;

  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}
//==============================================================================================
procedure TfrmEditEqType.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditEqType.setid') else _udebug := nil;{$ENDIF}

  Fid := Value;
  with newDataSet do
  try
    ProviderName := 'pEqType_GetDef';
    FetchParams;
    Open;

    if IsEmpty then chbDefault.Checked := True; chbDefault.Enabled := False;

    Close;

    if Value <> 0 then begin
      Self.Caption := rs(Self.Name,'TitleEdit');
      ProviderName := 'pEqType_Get';
      FetchParams;
      Params.ParamByName('etypeid').AsInteger := Value;
      Open;
      if not IsEmpty then begin
        edName.Text := fieldbyname('Name').asstring;
        chbDefault.Checked := FieldByName('def').AsInteger=1;
      end;
      Close;
      chbDefault.Enabled := not chbDefault.Checked;
      btnApply.Enabled := False;
    end
    else Self.Caption := rs(Self.Name,'TitleAdd');

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditEqType.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
   NewRecord: boolean;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditEqType.FormCloseQuery') else _udebug := nil;{$ENDIF}


     if ModalResult in [mrOK, mrYes] then begin
      CanClose := False;
      with TClientDataSet.Create(nil) do
       try
        TrStart;
       try
        RemoteServer := dmData.SConnection;
        ProviderName := prvTemp;

        NewRecord := (ID = 0);

        if NewRecord then begin
          ProviderName := 'pEqType_Max';
          Open;
          FID := Fields[0].AsInteger+1;
          Close;
        end;

        if chbDefault.Checked then begin
          ProviderName := 'pEqType_SetDef';
          Execute;
          chbDefault.Enabled := false;
        end;

        if NewRecord
         then ProviderName := 'pEqType_Ins'
         else ProviderName := 'pEqType_Upd';

        FetchParams;
        Params.ParamByName('ETypeID').AsInteger := ID;
        Params.ParamByName('name').AsString := edName.Text;
        Params.ParamByName('def').AsInteger := Integer(chbDefault.Checked);
        Params.ParamByName('deleted').AsInteger := 0;
        Execute;

        TrCommit;

        SendMessage(MainHandle, WM_REFRESH, ID, 0);
        if ModalResult = mrYes then begin
          if NewRecord then begin
            edName.Text := EmptyStr;
            chbDefault.Enabled := True;
            chbDefault.Checked := False;
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
          MessageDlg(e.Message, mtError, [mbOk], 0);
        end;
       end;

     end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditEqType.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditEqType.ActionListUpdate') else _udebug := nil;{$ENDIF}


  aOk.Enabled := (Trim(edName.Text)<>EmptyStr);
  aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditEqType.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditEqType.DataModified') else _udebug := nil;{$ENDIF}


  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditEqType.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditEqType.SetCaptions') else _udebug := nil;{$ENDIF}


  inherited;
  lName.Caption := rs(Self.Name,'Name');
  chbDefault.Properties.Caption := rs(Self.Name,'Default');
  aOK.Caption := rs(Self.Name,'OK');
  aCancel.Caption := rs(Self.Name,'Cancel');
  aApply.Caption := rs(Self.Name,'Apply');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditEqType.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditEqType.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditEqType', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
