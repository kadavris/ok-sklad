{$I ok_sklad.inc}
unit fNA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, TB2Item, Menus, ActnList, ssBevel;

type
  TfmNA = class(TssBaseFrame)
    txtNA: TssBevel;
  public
    procedure SetCaptions; override;
    procedure UpdateActionList; override;
    procedure DoShow; override;
  end;

var
  fmNA: TfmNA;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, udebug, prFun;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmNA.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmNA.DoShow') else _udebug := nil;{$ENDIF}

  inherited;

  UpdateActionList;

  setFontStyle(txtNA.Font);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmNA.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmNA.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  txtNA.Caption := LangMan.GetRS('Common', 'NotInThisVer');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmNA.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmNA.UpdateActionList') else _udebug := nil;{$ENDIF}

  aNew.Enabled := False;
  aProperties.Enabled := False;
  aDel.Enabled := False;
  aRefresh.Enabled := False;
  aFind.Enabled := False;
  aPatternInsert.Enabled := False;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fNA', @Debugging, DEBUG_group_ID);
  {$ENDIF}

finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
