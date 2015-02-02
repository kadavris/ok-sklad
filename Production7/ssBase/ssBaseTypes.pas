{$IFNDEF PKG}
{$I ok_sklad.inc}
{$ENDIF}
{$WARNINGS OFF}
{$HINTS OFF}

{$IFDEF PKG}
{$UNDEF UDEBUG}
{$ENDIF}
unit ssBaseTypes;

interface

uses Windows, Forms, Classes, ssMDIChild;

type
  TButtonState = (bsInsert, bsProperties, bsRefresh, bsDelete, bsDynamic,
                  bsDynChecked, bsUp, bsFind, bsPrint, bsExcel, bsCheck,
                  bsDrillDown, bsPatternInsert);

  TButtonsState = set of TButtonState;
  PButtonsState = ^TButtonsState;

  TFindType = (ftMat, ftMeasures);
  TLocateType = (ltFull, ltSubstr, ltBegin);

  TActionType = (atInsert, atUpdate, atPatternInsert);

  TssInfo = record
    ID      : integer;
    Name    : string[64];
    AddInfo : string[128];
    Param   : integer;
  end;
  PssInfo = ^TssInfo;

  TFormRef = class(TForm)
    protected
      FSection: string;

    public
      constructor Create(AOwner: TComponent; const ASection: string); overload;
  end;

  TMDIChildRef = class(TMDIChild)
    protected
      FSection: string;

    public
      constructor Create(AOwner: TComponent; const ASection: string); overload;
  end;

//=========================================================================
//=========================================================================
//=========================================================================
implementation

{$IFDEF UDEBUG}
uses
  Udebug;
var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

{ TMDIChildRef }
//=========================================================================
constructor TMDIChildRef.Create(AOwner: TComponent; const ASection: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMDIChildRef.Create') else _udebug := nil;{$ENDIF}

  FSection := ASection;
  inherited Create(AOwner);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{ TFormRef }
//=========================================================================
constructor TFormRef.Create(AOwner: TComponent; const ASection: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TFormRef.Create') else _udebug := nil;{$ENDIF}

  FSection := ASection;
  inherited Create(AOwner);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ssBaseTypes', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//=========================================================================
finalization
  {$IFDEF UDEBUG}
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}
  {$ENDIF}

end.
