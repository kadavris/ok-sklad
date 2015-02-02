{$I ok_sklad.inc}
unit SetPanels;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseDlg, ActnList, ssFormStorage, ImgList, xButton, ssPanel,
  ssGradientPanel, ssSpeedButton, ExtCtrls, ssBevel, cxControls,
  cxContainer, cxEdit, cxCheckBox;

type
  TfrmSetPanels = class(TBaseDlg)
    bvlMain: TssBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    FModified: Boolean;
    procedure DataModified(Sender: TObject);

  public
    FList: TStringList;
    procedure SetPanels;
    procedure SetCaptions; override;
    procedure LoadSkin; override;
  end;

var
  frmSetPanels: TfrmSetPanels;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ssBaseConst, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmSetPanels.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetPanels.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetPanels.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetPanels.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  FList := TStringList.Create;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetPanels.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetPanels.FormDestroy') else _udebug := nil;{$ENDIF}

  FList.Free;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetPanels.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetPanels.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    Self.Caption := GetRS('fmWaybill', 'SetPanels');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetPanels.SetPanels;
  var
    i: Integer;
    Fchb: TcxCheckBox;
    Y: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetPanels.SetPanels') else _udebug := nil;{$ENDIF}

  Y := 5;
  for i := 0 to FList.Count - 1 do begin
    Fchb := TcxCheckBox.Create(Self);
    Fchb.Parent := panMain;
    Fchb.Properties.Caption := FList.Strings[i];
    Fchb.Style.Color := clokDlgBk;
    Fchb.Left := 12;
    Fchb.Top := Y;
    Fchb.Width := Self.Width - 24;
    Fchb.Checked := TPanel(FList.Objects[i]).Visible;
    Fchb.Enabled := TPanel(FList.Objects[i]).Tag = 0;

    if Fchb.Enabled and not Assigned(Self.ActiveControl)
      then Self.ActiveControl := Fchb;

    Fchb.Tag := Integer(FList.Objects[i]);
    Fchb.OnKeyDown := GoNextKeyDown;
    Fchb.OnKeyPress := GoNext;
    Fchb.Properties.OnEditValueChanged := DataModified;
    Inc(Y, 24);

    if i > 0 then Self.Height := Self.Height + 24;
  end;
  FModified := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetPanels.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetPanels.ActionListUpdate') else _udebug := nil;{$ENDIF}


  aOk.Enabled := FModified;
  aApply.Enabled := aOk.Enabled;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetPanels.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  i: Integer;
  FchbList: TStringList;  
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetPanels.FormCloseQuery') else _udebug := nil;{$ENDIF}


  if ModalResult in [mrOk, mrYes] then begin
    CanClose := False;
    FchbList := TStringList.Create;
    try
      for i := 0 to Self.ComponentCount - 1 do
        if Self.Components[i] is TcxCheckBox
          then FchbList.AddObject(IntToStr(Integer(TcxCheckBox(Self.Components[i]).Checked)), 
            TPanel(TcxCheckBox(Self.Components[i]).Tag));
      SendMessage(MainHandle, WM_REALIGNPANELS, Integer(FchbList), 0);
    finally
      FchbList.Free;
    end;

    if ModalResult = mrOk then CanClose := True
      else FModified := False; 
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetPanels.LoadSkin;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetPanels.LoadSkin') else _udebug := nil;{$ENDIF}


  inherited;

  bvlMain.Color := clokDlgBk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('SetPanels', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
