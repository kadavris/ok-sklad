{$I ok_sklad.inc}
unit EditCashDesk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxEditor, StdCtrls,
  ActnList, ssBaseTypes, ssFormStorage, cxCheckBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, ssBaseDlg,
  ssBevel, ImgList, ssSpeedButton, ssPanel, ssGradientPanel, xButton;

type
  TfrmEditCashDesk = class(TBaseDlg)
    bvlMain: TssBevel;
    edName: TcxTextEdit;
    lName: TLabel;
    bvlSep: TssBevel;
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
  frmEditCashDesk: TfrmEditCashDesk;

implementation

uses ssBaseConst, prConst, DbClient, DB, ClientData, prFun,
  ssCallbackConst, ssClientDataSet, xLngManager, prTypes, Udebug;

  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}
//==============================================================================================
procedure TfrmEditCashDesk.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditCashDesk.setid') else _udebug := nil;{$ENDIF}

  if not IsPattern then FID := Value;

  with newDataSet do
   try
    if Value <> 0 then begin
      if not IsPattern
        then Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleEdit')
        else Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleAdd');

      ProviderName := 'pCashDesks_Get';
      FetchParams;
      Params.ParamByName('CashID').AsInteger := Value;
      Open;

      if not IsEmpty then begin
        edName.Text := FieldByName('Name').asstring;
        chbDefault.Checked := FieldByName('def').AsInteger=1;
      end;

      Close;

      if not IsPattern then begin
        chbDefault.Enabled := not chbDefault.Checked;
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
procedure TfrmEditCashDesk.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
  NewRecord: boolean;
  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashDesk.FormCloseQuery') else _udebug := nil;{$ENDIF}


  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    with newDataSet do
    try
      TrStart;
      try
        NewRecord := (ID = 0);

        if NewRecord then FID := GetMaxID(dmData.SConnection, 'cashdesks', 'cashid');

        if chbDefault.Checked then begin
          ProviderName := 'pCashDesks_SetDef';
          Execute;
          chbDefault.Enabled := False;
        end;

        if NewRecord
          then ProviderName := 'pCashDesks_Ins'
          else ProviderName := 'pCashDesks_Upd';

        FetchParams;
        Params.ParamByName('cashid').AsInteger := FID;
        Params.ParamByName('name').AsString := edName.Text;
        Params.ParamByName('def').AsInteger := Integer(chbDefault.Checked);
        Execute;

        TrCommit;

        SendMessage(MainHandle, WM_REFRESH, ID, 0);
        frmMainForm.ExecRefresh('TfmFinance', FID, Integer(rtCashDesks));
        //if RefreshAllClients
        //  then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_ACCOUNTTYPE);
        if ModalResult = mrYes then begin
          if NewRecord then begin
            if not IsPattern then edName.Text := EmptyStr;
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
procedure TfrmEditCashDesk.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashDesk.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := (Trim(edName.Text) <> EmptyStr);
  aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashDesk.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashDesk.DataModified') else _udebug := nil;{$ENDIF}


  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashDesk.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashDesk.SetCaptions') else _udebug := nil;{$ENDIF}


  inherited;

  with dmData.Lng do begin
    lName.Caption := GetRS(ParentNameEx, 'Name') + ':';
    chbDefault.Properties.Caption := GetRS('Common', 'Default');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashDesk.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashDesk.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditCashDesk', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
