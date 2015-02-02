{$I ok_sklad.inc}
unit EditAccountType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxEditor, StdCtrls,
  ActnList, ssBaseTypes, ssFormStorage, cxCheckBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, ssBaseDlg,
  ssBevel, ImgList, ssSpeedButton, ssPanel, ssGradientPanel, xButton;

type
  TfrmEditAccountType = class(TBaseDlg)
    bvlMain: TssBevel;
    edName: TcxTextEdit;
    lName: TLabel;
    chbDefault: TcxCheckBox;
    bvlSep: TssBevel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);

  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;

  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
  end;

var
  frmEditAccountType: TfrmEditAccountType;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ssBaseConst, prConst, DbClient, DB, ClientData, prFun,
  ssCallbackConst, ssClientDataSet, xLngManager, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmEditAccountType.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditAccountType.setid') else _udebug := nil;{$ENDIF}

  if not IsPattern then FID := Value;

  with newDataSet do
  try
    if Value <> 0 then begin
      if not IsPattern
        then Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleEdit')
        else Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleAdd');

      ProviderName := 'pAccountType_Get';
      FetchParams;
      Params.ParamByName('TypeID').AsInteger := Value;
      Open;

      if not IsEmpty then begin
        edName.Text := fieldbyname('Name').asstring;
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
procedure TfrmEditAccountType.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
   NewRecord: boolean;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccountType.FormCloseQuery') else _udebug := nil;{$ENDIF}


  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;
    with TClientDataSet.Create(nil) do
       try
        TrStart;
       try
        RemoteServer := dmData.SConnection;

        NewRecord := (ID = 0);
        if NewRecord then begin
          FID := GetMaxID(dmData.SConnection, 'accounttype', 'typeid');
        end;

        if chbDefault.Checked then begin
          ProviderName := 'pAccountType_SetDef';
          Execute;
          chbDefault.Enabled := false;
        end;

        if NewRecord
          then ProviderName := 'pAccountType_Ins'
          else ProviderName := 'pAccountType_Upd';

        FetchParams;
        Params.ParamByName('TYPEID').AsInteger := ID;
        Params.ParamByName('name').AsString := edName.Text;
        Params.ParamByName('def').AsInteger := Integer(chbDefault.Checked);
        Params.ParamByName('deleted').AsInteger := 0;
        Execute;

        TrCommit;

        SendMessage(MainHandle, WM_REFRESH, ID, 0);
        if RefreshAllClients
          then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_ACCOUNTTYPE);

        if (ModalResult = mrYes) then begin
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
procedure TfrmEditAccountType.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccountType.ActionListUpdate') else _udebug := nil;{$ENDIF}


     aOk.Enabled := (Trim(edName.Text)<>EmptyStr);
     aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccountType.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccountType.DataModified') else _udebug := nil;{$ENDIF}


     FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccountType.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccountType.SetCaptions') else _udebug := nil;{$ENDIF}


  inherited;

  with dmData.Lng do begin
    lName.Caption := GetRS(ParentNameEx, 'Name') + ':';
    chbDefault.Properties.Caption := GetRS('Common', 'Default');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccountType.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccountType.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditAccountType', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
