{$I ok_sklad.inc}
unit EditWHouse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxEditor, StdCtrls,
  ActnList, ssBaseTypes, ssFormStorage, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxLookAndFeelPainters, cxCheckBox, cxButtons, ssBaseDlg,
  cxMemo, cxDBEdit, ssBevel, ImgList, ssSpeedButton, ssPanel,
  ssGradientPanel, xButton;

type
  TfrmEditWHouse = class(TBaseDlg)
    ssBevel2: TssBevel;
    lName: TLabel;
    edName: TcxTextEdit;
    lAdr: TLabel;
    edAdr: TcxMemo;
    lNotes: TLabel;
    edNotes: TcxMemo;
    chbDefault: TcxCheckBox;
    bvlSep: TssBevel;

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
  end;

var
  frmEditWHouse: TfrmEditWHouse;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ssBaseConst, prConst, DbClient, DB, ClientData, Login, prFun,
  ssCallbackConst, ssClientDataSet, fMessageDlg, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmEditWHouse.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWHouse.setid') else _udebug := nil;{$ENDIF}

  if not IsPattern then FID := Value;

  with newDataSet do
  try
    ProviderName := 'pWHouse_GetDef';
    FetchParams;
    Open;
    if IsEmpty then begin
      chbDefault.Checked := True;
      chbDefault.Enabled := False;
    end;
    Close;

    if Value <> 0 then begin
      if not IsPattern
        then Self.Caption := LangMan.GetRS(ParentNameEx, 'TitleEdit')
        else Self.Caption := LangMan.GetRS(ParentNameEx, 'TitleAdd');

      ProviderName := 'pWHouse_Get';
      FetchParams;
      Params.ParamByName('wid').AsInteger := Value;
      Open;

      if not IsEmpty then begin
        edName.Text := fieldbyname('Name').asstring;
        edAdr.Text := fieldbyname('Addr').asstring;
        edNotes.Text := fieldbyname('Notes').asstring;
        chbDefault.Checked := (FieldByName('def').AsInteger = 1);
      end;
      Close;

      FModified := false;

      if IsPattern then chbDefault.Enabled := not chbDefault.Checked;
    end
    else Self.Caption := LangMan.GetRS(ParentNameEx, 'TitleAdd');

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWHouse.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWHouse.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    with newDataSet do
       try
         TrStart;

         try
           NewRecord := (ID = 0);

           if NewRecord then FID := GetMaxID(dmData.SConnection, 'warehouse', 'wid');

           if chbDefault.Checked then begin
             ProviderName := 'pWHouse_SetDef';
             Execute;
           end;

           if NewRecord
            then ProviderName := 'pWHouse_Ins'
            else ProviderName := 'pWHouse_Upd';

           FetchParams;
           Params.ParamByName('wid').AsInteger := ID;
           Params.ParamByName('name').AsString := edName.Text;
           Params.ParamByName('Addr').AsString := edAdr.Text;
           Params.ParamByName('Notes').AsString := edNotes.Text;
           Params.ParamByName('Deleted').AsInteger := 0;
           Params.ParamByName('def').AsInteger := Integer(chbDefault.Checked);
           Execute;

           if NewRecord then begin
             ProviderName := 'pWHouse_UsersIns';
             FetchParams;
             Params.ParamByName('wid').AsInteger := FID;
             Params.ParamByName('userid').AsInteger := UserID;
             Execute;

             if AllowedWH <> '*' then AllowedWH := AllowedWH + ',' + IntToStr(FID);
           end;

           TrCommit;

           SendMessage(MainHandle, WM_REFRESH, ID, SourceID);
           frmMainForm.ExecRefresh('TfmWMat', -1);

           if RefreshAllClients then begin
             dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WHOUSE);
             dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
           end;

           if ModalResult = mrYes then begin
             if NewRecord then begin
               if not IsPattern then begin
                 edName.Text := '';
                 edAdr.Text := '';
                 edNotes.Text := '';
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
         on e:exception do begin
           TrRollback;
           ssMessageDlg(e.Message, ssmtError, [ssmbOk]);
         end;
       end;
     end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWHouse.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWHouse.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := (Trim(edName.Text) <> '');
  aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWHouse.DataModified(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWHouse.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWHouse.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWHouse.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aApply.Caption := GetRS('Common', 'Apply');

    lName.Caption := GetRS(ParentNameEx, 'Name') + ':';
    lAdr.Caption := GetRS(ParentNameEx, 'Adr') + ':';
    lNotes.Caption := GetRS(ParentNameEx, 'Notes') + ':';
    chbDefault.Properties.Caption := GetRS(ParentNameEx, 'Def');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWHouse.edNamePropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWHouse.edNamePropertiesChange') else _udebug := nil;{$ENDIF}

  //lWName.Visible := Trim(edName.Text)='';
  DataModified(Sender);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWHouse.edShortNamePropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWHouse.edShortNamePropertiesChange') else _udebug := nil;{$ENDIF}

  DataModified(Sender);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditWHouse', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
