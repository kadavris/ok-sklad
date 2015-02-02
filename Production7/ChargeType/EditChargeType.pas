{$I ok_sklad.inc}
unit EditChargeType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxEditor, StdCtrls, ActnList, ssBaseTypes,
  ssFormStorage, cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxButtons, ssBaseDlg, ssBevel, ImgList, ssSpeedButton,
  ssPanel, ssGradientPanel, xButton;

type
  TfrmEditChargeType = class(TBaseDlg)
    bvlMain: TssBevel;
    edName: TcxTextEdit;
    lName: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
  public
    procedure SetCaptions; override;
    { Public declarations }
  end;

var
  frmEditChargeType: TfrmEditChargeType;

implementation

uses ssBaseConst, prConst, DbClient, DB, ClientData, prFun,
  ssCallbackConst, ssClientDataSet, xLngManager, fMessageDlg, udebug;

  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}
//==============================================================================================
procedure TfrmEditChargeType.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditChargeType.setid') else _udebug := nil;{$ENDIF}

  if not IsPattern then FID := Value;

  with newDataSet do
    try
      if Value <> 0 then begin
        if not IsPattern
          then Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleEdit')
          else Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleAdd');

        ProviderName := 'pChargeType_Get';
        FetchParams;
        Params.ParamByName('ctypeid').AsInteger := Value;
        Open;

        if not IsEmpty then edName.Text := Fieldbyname('name').asstring;
        Close;
        if not IsPattern then btnApply.Enabled := False;
      end
      else Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleAdd');

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditChargeType.FormCloseQuery(Sender: TObject;var CanClose: Boolean);
  var
    NewRecord: boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditChargeType.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    with newDataSet do
      try
        TrStart;

        try
          NewRecord := (ID = 0);
          if NewRecord then FID := GetMaxID(dmData.SConnection, 'chargetype', 'ctypeid');

          if NewRecord
            then ProviderName := 'pChargeType_Ins'
            else ProviderName := 'pChargeType_Upd';

          FetchParams;
          Params.ParamByName('ctypeid').AsInteger := ID;
          Params.ParamByName('name').AsString := edName.Text;
          Params.ParamByName('deleted').AsInteger := 0;
          Execute;

          TrCommit;

          SendMessage(MainHandle, WM_REFRESH, ID, 0);

          //if RefreshAllClients
          //  then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_ACCOUNTTYPE);

          if ModalResult = mrYes then begin
            if NewRecord then begin
              if not IsPattern then edName.Text := EmptyStr;
              edName.SetFocus;
              FID := 0;
            end
          end
          else CanClose := True;
          FModified:=False;
        finally
         Free;
        end;

      except
        on E: Exception do begin
          TrRollback;
          ssMessageDlg(e.Message, ssmtError, [ssmbOk]);
        end;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditChargeType.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditChargeType.ActionListUpdate') else _udebug := nil;{$ENDIF}


  aOk.Enabled := (Trim(edName.Text) <> EmptyStr);
  aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditChargeType.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditChargeType.DataModified') else _udebug := nil;{$ENDIF}


  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditChargeType.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditChargeType.SetCaptions') else _udebug := nil;{$ENDIF}


  inherited;

  with dmData.Lng do begin
    lName.Caption := GetRS(ParentNameEx, 'NameD') + ':';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditChargeType.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditChargeType.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditChargeType', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
