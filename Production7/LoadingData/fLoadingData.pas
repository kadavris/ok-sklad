{$I ok_sklad.inc}
unit fLoadingData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TfmLoadingData = class(TFrame)
    panWait: TPanel;
    lWait: TLabel;
    aviWait: TAnimate;

  public
    ParentWND: TWinControl;

    procedure Show(AParent: TWinControl = nil);
    procedure Hide;
  end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmLoadingData.Hide;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmLoadingData.Hide') else _udebug := nil;{$ENDIF}

  aviWait.Active := False;
  Self.Parent := nil;
  Self.Visible := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmLoadingData.Show(AParent: TWinControl = nil);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmLoadingData.Show') else _udebug := nil;{$ENDIF}

  lWait.Caption := LangMan.GetRS('Common', 'LoadingData') + '...';

  if AParent = nil
    then Self.Parent := ParentWND
    else Self.Parent := AParent;

  Self.Align := alClient;
  lWait.Left := aviWait.Left + aviWait.Width + 8;
  Self.Visible := True;
  aviWait.Active := True;
  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fLoadingData', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
