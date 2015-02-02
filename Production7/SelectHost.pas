{$I ok_sklad.inc}
unit SelectHost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseIntfDlg, cxLookAndFeelPainters, ActnList, ImgList,
  StdCtrls, cxButtons, ssSpeedButton, ssPanel, ExtCtrls, ssGradientPanel,
  cxControls, cxContainer, cxListView, ComCtrls, xButton;

type
  TfrmSelectHost = class(TfrmBaseIntfDlg)
    lvMain: TcxListView;
    procedure FormCreate(Sender: TObject);
    procedure lvMainDblClick(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);

  public
    procedure SetCaptions;
  end;

var
  frmSelectHost: TfrmSelectHost;

//==============================================================================================
implementation

uses
  ClientData, xNetUtils, ssStrUtil, prConst, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmSelectHost.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSelectHost.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  aOK.Caption := LangMan.GetRS('Common', 'OK');
  aCancel.Caption := LangMan.GetRS('Common', 'Cancel');
  aApply.Caption := LangMan.GetRS('Common', 'Apply');

  Self.Caption := LangMan.GetRS('frmLogin', 'SelectHost');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSelectHost.FormCreate(Sender: TObject);
 var
   FList: TStringList;
   FItem: TListItem;
   i: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSelectHost.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  SetCaptions;

  Screen.Cursor := crHourGlass;
  FList := xNetUtils.GetNetHosts;
  Screen.Cursor := crDefault;

  try
    if FList.Count > 0 then
      for i := 0 to FList.Count - 1 do begin
        FItem := lvMain.Items.Add;
        FItem.Caption := DelChars(FList[i], ['\']);
        FItem.ImageIndex := 86;
      end
      else begin
        FItem := lvMain.Items.Add;
        FItem.Caption := 'LOCALHOST';
        FItem.ImageIndex := 86;
      end;

  finally
    FList.Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSelectHost.lvMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSelectHost.lvMainDblClick') else _udebug := nil;{$ENDIF}

  if lvMain.Selected <> nil then aOk.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSelectHost.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSelectHost.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  aOk.Enabled := lvMain.Selected <> nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('SelectHost', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
