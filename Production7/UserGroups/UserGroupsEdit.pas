{$I ok_sklad.inc}
unit UserGroupsEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxEditor, StdCtrls,
  ActnList, ssBaseTypes, ssFormStorage, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, ssbaseDlg, ImgList,
  ssSpeedButton, ssBevel, xButton, ssPanel, ssGradientPanel;

type
  TfrmUserGroupsEdit = class(TBaseDlg)
    edName: TcxTextEdit;
    lName: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure aApplyExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
  end;

var
  frmUserGroupsEdit: TfrmUserGroupsEdit;

implementation

uses ssBaseConst, prConst, DbClient, DB, prFun, ClientData, Udebug;

  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmUserGroupsEdit.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmUserGroupsEdit.setid') else _udebug := nil;{$ENDIF}

  Fid := Value;
  with newDataSet do
  try
    ProviderName := prvTemp;
    if Value<>0 then begin
      Caption := rs(Self.Name,'TitleEdit');
      ProviderName := 'pUserGroups_Get';
      FetchParams;
      Params.ParamByName('grpid').AsInteger := Value;
      Open;
      if not IsEmpty then edName.Text := fieldbyname('Name').asstring;
      Close;
      btnApply.Enabled := False;
    end
    else Self.Caption := rs(Self.Name,'TitleAdd');

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUserGroupsEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
   NewRecord: boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmUserGroupsEdit.FormCloseQuery') else _udebug := nil;{$ENDIF}


     if ModalResult in [mrOK, mrYes] then begin
      CanClose := False;
      with TClientDataSet.Create(nil) do
       try
        TrStart;
       try
        RemoteServer := dmData.SConnection;
        ProviderName := prvTemp;

        NewRecord := ID=0;
        if ID=0 then begin
         ProviderName := 'pUserGroups_Max';
         Open;
         FID := Fields[0].AsInteger+1;
         Close;
        end;

        if NewRecord
         then ProviderName := 'pUserGroups_Ins'
         else ProviderName := 'pUserGroups_Upd';
        FetchParams;
        Params.ParamByName('grpid').AsInteger := ID;
        Params.ParamByName('name').AsString := edName.Text;
        Execute;

        TrCommit;

        SendMessage(MainHandle, WM_REFRESH, ID, 0);
        if (ModalResult=mrYes) then
         if NewRecord then begin
          edName.Text := EmptyStr;
          edName.SetFocus;
          FID := 0;
         end
         else
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
procedure TfrmUserGroupsEdit.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUserGroupsEdit.ActionListUpdate') else _udebug := nil;{$ENDIF}


     aOk.Enabled := (Trim(edName.Text)<>EmptyStr);
     aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUserGroupsEdit.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUserGroupsEdit.DataModified') else _udebug := nil;{$ENDIF}


     FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUserGroupsEdit.aApplyExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUserGroupsEdit.aApplyExecute') else _udebug := nil;{$ENDIF}


     ModalResult := mrYes;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUserGroupsEdit.aOKExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUserGroupsEdit.aOKExecute') else _udebug := nil;{$ENDIF}


     ModalResult := mrOK;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUserGroupsEdit.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUserGroupsEdit.aCancelExecute') else _udebug := nil;{$ENDIF}


     ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUserGroupsEdit.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUserGroupsEdit.SetCaptions') else _udebug := nil;{$ENDIF}


     inherited;

     lName.Caption := rs(Self.Name,'Name');

     aOK.Caption := rs('common','OK');
     aCancel.Caption := rs('common','Cancel');
     aApply.Caption := rs('common','Apply');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUserGroupsEdit.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUserGroupsEdit.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('UserGroupsEdit', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
