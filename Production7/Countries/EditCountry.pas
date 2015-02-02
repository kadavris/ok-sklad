{$I ok_sklad.inc}
unit EditCountry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxEditor, StdCtrls,
  ActnList, ssBaseTypes, ssFormStorage, cxCheckBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, ssBaseDlg,
  ssBevel, ImgList, ssSpeedButton, ssPanel, ssGradientPanel, xButton;

type
  TfrmEditCountry = class(TBaseDlg)
    ssBevel1: TssBevel;
    lName: TLabel;
    edName: TcxTextEdit;
    edShortName: TcxTextEdit;
    lShortName: TLabel;
    btnCopy: TssSpeedButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
    { Public declarations }
  end;

var
  frmEditCountry: TfrmEditCountry;

implementation

uses ssBaseConst, prConst, DbClient, DB, ClientData, prFun,
  ssCallbackConst, ssClientDataSet, xLngManager, udebug;

  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}
//==============================================================================================
procedure TfrmEditCountry.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditCountry.setid') else _udebug := nil;{$ENDIF}

  if not IsPattern then FID := Value;

  with newDataSet do
  try
    if Value <> 0 then begin
      if not IsPattern
        then Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleProps')
        else Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleNew');

      ProviderName:='pCountries_Get';
      FetchParams;
      Params.ParamByName('cid').AsInteger:=Value;
      Open;

      if not IsEmpty then begin
        edName.Text := fieldbyname('name').asstring;
        edShortName.Text := fieldbyname('shortname').asstring;
      end;

      Close;

      if not IsPattern then btnApply.Enabled := False;
    end
    else Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleNew');

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCountry.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCountry.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose:=False;

    with newDataSet do
    try
      //TrStart;

      try
        ProviderName:=prvTemp;

        NewRecord := (ID = 0);
        if NewRecord then FID := GetMaxID(dmData.SConnection, 'countries', 'cid');

        if NewRecord
          then ProviderName:='pCountries_Ins'
          else ProviderName:='pCountries_Upd';

        FetchParams;
        Params.ParamByName('cid').AsInteger := FID;
        Params.ParamByName('name').AsString := edName.Text;
        Params.ParamByName('shortname').AsString := edShortName.Text;
        Execute;

        //TrCommit;

        SendMessage(MainHandle, WM_REFRESH, ID, 0);

        if RefreshAllClients
          then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_COUNTRIES);

        if ModalResult = mrYes then begin
          if NewRecord then begin
            if not IsPattern then begin
              edName.Text := EmptyStr;
              edShortName.Text := EmptyStr;
            end;
            edName.SetFocus;
            FID := 0;
          end
        end
        else CanClose:=True;

        FModified:=False;

      finally
        Free;
      end;

    except
      on e:exception do begin
        //TrRollback;
        MessageDlg(e.Message, mtError, [mbOk], 0);
      end;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCountry.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCountry.ActionListUpdate') else _udebug := nil;{$ENDIF}


  aOk.Enabled:=(Trim(edName.Text)<>EmptyStr);
  aApply.Enabled:=aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCountry.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCountry.DataModified') else _udebug := nil;{$ENDIF}


  FModified:=True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCountry.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCountry.SetCaptions') else _udebug := nil;{$ENDIF}


  inherited;

  with dmData.Lng do begin
    lName.Caption := GetRS('fmCountries', 'Name') + ':';
    lShortName.Caption := GetRS('fmCountries', 'ShortName') + ':';
    btnCopy.Hint := GetRS('fmCountries', 'CopyTo') + ':';

    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aApply.Caption := GetRS('Common', 'Apply');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCountry.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCountry.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCountry.btnCopyClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCountry.btnCopyClick') else _udebug := nil;{$ENDIF}


  edShortName.Text := edName.Text;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditCountry', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
