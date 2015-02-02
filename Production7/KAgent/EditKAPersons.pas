{$I ok_sklad.inc}
unit EditKAPersons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, StdCtrls, cxButtons,
  ssFormStorage, ActnList, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMemo, ssMemDS, ssBaseIntfDlg, ssBevel, ImgList, ssSpeedButton, ssPanel,
  ssGradientPanel, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxDBEdit, ssDBLookupCombo, DB,
  DBClient, ssClientDataSet, ssDBComboBox, Buttons, xButton;

type
  TfrmEditKAPersons = class(TfrmBaseIntfDlg)
    panMain: TPanel;
    bvlMain: TssBevel;
    ssBevel4: TssBevel;
    lKAName: TLabel;
    imgKAgent: TImage;
    lFIO: TLabel;
    lJob: TLabel;
    lPhone: TLabel;
    lEmail: TLabel;
    lNotes: TLabel;
    edFIO: TcxTextEdit;
    cbJob: TcxComboBox;
    edPhone: TcxTextEdit;
    edEMail: TcxTextEdit;
    memNotes: TcxMemo;
    btnEMail: TssSpeedButton;
    FormStorage: TssFormStorage;
    btnLock: TssSpeedButton;
    btnHelp: TssSpeedButton;
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnEMailClick(Sender: TObject);
    procedure btnLockClick(Sender: TObject);
  private
    FOnDate: TDateTime;
    FModified: boolean;
  protected
    FParentName: string;
    FID: integer;
    procedure SetID(const Value: integer); 
    procedure SetParentName(const Value: string);
    procedure SetOnDate(const Value: TDateTime);
    procedure DoCreate; override;
    procedure GetJob;
  public
    MainHandle: HWND;
    mdC: TssMemoryData;
    UseMemDS: boolean;
    PID: integer;
    property ParentNameEx: string read FParentName write SetParentName;
    property ID: integer read FID write SetID;
    property OnDate: TDateTime read FOnDate write SetOnDate;
    procedure SetCaptions;
  end;

var
  frmEditKAPersons: TfrmEditKAPersons;

implementation

uses
  prConst, prFun, ssBaseConst, ClientData, prTypes, ShellAPI, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmEditKAPersons.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAPersons.SetOnDate') else _udebug := nil;{$ENDIF}


  FOnDate := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAPersons.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAPersons.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAPersons.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAPersons.SetCaptions') else _udebug := nil;{$ENDIF}


  with LangMan do begin
    aOk.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aApply.Caption := GetRS('Common', 'Apply');

    btnLock.Hint := LangMan.GetRS('Common', 'Lock');
    btnHelp.Hint := LangMan.GetRS('Common', 'Help');

    lFIO.Caption := GetRS(ParentNameEx, 'FIO') + ':';
    lNotes.Caption := GetRS(ParentNameEx, 'Notes') + ':';
    lJob.Caption := GetRS(ParentNameEx, 'PersonPost') + ':';
    lEmail.Caption := GetRS(ParentNameEx, 'EMail') + ':';
    lPhone.Caption := GetRS(ParentNameEx, 'Phone') + ':';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAPersons.DoCreate;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAPersons.DoCreate') else _udebug := nil;{$ENDIF}

  inherited;

  FormStorage.IniFileName:=PrRegKey;
  FormStorage.IniSection:=Self.Name;
  FormStorage.Active:=True;

  SetCaptions;

  //SetStyle(Self, IStyle);

  dmData.Images.GetBitmap(18, imgKAgent.Picture.Bitmap);
  //dmData.Images.GetBitmap(46, btnEMail.Glyph);
  GetJob;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAPersons.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAPersons.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := (Trim(edFIO.Text) <> '') and FModified;
  aApply.Enabled := aOk.Enabled and FModified and (ID=0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAPersons.SetID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditKAPersons.SetID') else _udebug := nil;{$ENDIF}

  FID := Value;

  if Value <> 0 then begin
    panTitleBar.Caption := LangMan.GetRS(ParentNameEx, 'PersonEdit');
    aApply.Enabled := False;

    with newDataSet do
      try
         ProviderName := 'pAgentPersons_GetEx';
         FetchParams;
         Params.ParamByName('personid').AsInteger:=Value;
         Open;
         edFIO.Text := fieldbyname('name').AsString;
         edPhone.Text := fieldbyname('phone').AsString;
         edEMail.Text := fieldbyname('email').AsString;
         cbJob.Text := fieldbyname('post').AsString;
         memNotes.Text := fieldbyname('notes').AsString;
         Close;
         FModified := False;

      finally
         Free;
      end;
  end
  else panTitleBar.Caption := LangMan.GetRS(ParentNameEx, 'PersonAdd');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAPersons.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAPersons.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAPersons.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    Maxx: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAPersons.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrYes, mrOK] then begin
    CanClose := False;
    with newDataSet do
      try
        if ID = 0
          then Maxx:=GetMaxID(dmData.SConnection, 'agentpersons', 'personid')
          else Maxx:=ID;

        if ID = 0
          then ProviderName:='pAgentPersons_Ins'
          else ProviderName:='pAgentPersons_Upd';

        FetchParams;
        Params.ParamByName('personid').AsInteger:=Maxx;
        Params.ParamByName('name').AsString:=edFIO.Text;
        Params.ParamByName('phone').AsString:=edPhone.Text;
        Params.ParamByName('post').AsString:=cbJob.Text;
        Params.ParamByName('email').AsString:=edEMail.Text;
        Params.ParamByName('notes').AsString:=memNotes.Text;
        Params.ParamByName('kaid').AsInteger:=PID;
        Execute;

        SendMessage(MainHandle, WM_REFRESH, Maxx, 4);

      finally
        Free;
      end;

    if ModalResult = mrOk
      then CanClose:=True
      else begin
        cbJob.Clear;
        edEMail.Clear;
        edPhone.Clear;
        edFIO.Clear;
        memNotes.Clear;
        edFIO.SetFocus;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAPersons.GetJob;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAPersons.GetJob') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName:='pAgentPersons_Posts';
    Open;
    cbJob.Clear;
    while not Eof do begin
      cbJob.Properties.Items.Add(fieldbyname('post').AsString);
      Next;
    end;

    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAPersons.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAPersons.FormCreate') else _udebug := nil;{$ENDIF}


     GetJob;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAPersons.btnEMailClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAPersons.btnEMailClick') else _udebug := nil;{$ENDIF}


  if trim(edEMail.Text)<>EmptyStr then
   ShellExecute(Application.Handle, nil, PChar('mailto:'+Trim(edEMail.Text)),nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditKAPersons.btnLockClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditKAPersons.btnLockClick') else _udebug := nil;{$ENDIF}


  LockScreen;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditKAPersons', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
