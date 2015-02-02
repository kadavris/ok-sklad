{$I ok_sklad.inc}
unit CCCntnr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseSkinForm, ImgList, ssSpeedButton, ssPanel, ExtCtrls,
  ssGradientPanel, CCMain, prTypes, StdCtrls, ssMDIChild;

type
  TfrmCCCntnr = class(TMDIChild)
    procedure Button1Click(Sender: TObject);
  public
    CCForm: TForm;
  end;

var
  frmCCCntnr: TfrmCCCntnr;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses Udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmCCCntnr.Button1Click(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCCntnr.Button1Click') else _udebug := nil;{$ENDIF}

   with TfrmCCMain.Create(nil) do
    try
//     ParentHandle := AParent.Handle;
//     WindowState := wsNormal;
//     OnDate := AOnDate;
//     Param := AParam;
//     ViewType := vtAccountType;
//     if AParam < 0 then
//     Param := AParam;
//     if AID <> 0 then ID := AID;
//     Parent := Self.Panel1;
//     Align := alClient;
//     Show;
    finally
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('CCCntnr', @Debugging, DEBUG_group_ID);{$ENDIF}


//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.

