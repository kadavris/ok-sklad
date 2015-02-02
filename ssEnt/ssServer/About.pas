{$I ok_server.inc}
//UDEBUG code already inserted. Please do not remove this line.
unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmAbout = class(TForm)
    imageStd: TImage;
    lWWW: TLabel;
    lRegUserName: TLabel;
    lRegEMail: TLabel;
    lRegInfo1: TLabel;
    lRegNo: TLabel;
    lVersion: TLabel;
    lCopyright: TLabel;
    procedure imageStdClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lWWWClick(Sender: TObject);
  private
    procedure SetCaptions;
  end;

var
  frmAbout: TfrmAbout;

//==================================================================================
//==================================================================================
//==================================================================================
//==================================================================================
implementation

uses
  {$IFDEF UDEBUG}udebug,{$ENDIF}
  ShellAPI, ssSrvConst, ServerData, Protection, xLngDefs;

{$IFDEF UDEBUG}
var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

{$R *.dfm}

//==============================================================================================
procedure TfrmAbout.imageStdClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmAbout.imageStdClick') else _udebug := nil;{$ENDIF}

  ModalResult := mrOk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmAbout.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmAbout.FormCreate') else _udebug := nil;{$ENDIF}


  imageStd.Picture.Bitmap.LoadFromResourceName(resDllHandle, 'splash');
  Self.Height := imageStd.Height;
  Self.Width := imageStd.Width;
  SetCaptions;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmAbout.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmAbout.SetCaptions') else _udebug := nil;{$ENDIF}
    
  with dmData.Lng do begin
    try
      lRegUserName.Caption := '';
      lRegNo.Caption := '';
      lRegEMail.Caption := '';
      lRegInfo1.Caption := '';

      {$IFNDEF FREE}
      if RegInfo.Text = ''
        then lRegUserName.Caption := GetRS(Self.Name, 'rs_NotReg')
        else begin
          lRegUserName.Caption := Getrs(Self.Name, 'rs_user') + ' ' + RegInfo.Values['user'];
          lRegNo.Caption := Getrs(Self.Name, 'rs_id') + ' ' + RegInfo.Values['id'];

          if RegInfo.Values['email'] <> ''
            then lRegEMail.Caption := Getrs(Self.Name, 'rs_email') + ' ' + RegInfo.Values['email']
            else lRegEMail.Caption := '';

          lRegInfo1.Caption := Getrs(Self.Name, 'rs_maxclients') + ' ' + RegInfo.Values['maxclients'];

          if RegInfo.Values['barcodes'] <> ''
            then lRegInfo1.Caption := lRegInfo1.Caption + ', ' + Getrs(Self.Name, 'rs_BarC');
        end;
      {$ENDIF}

    except
    end;

    lVersion.Caption := OK_Version;
  end;

  lCopyRight.Caption := OK_CopyRight;
  lWWW.Caption := OK_URL;



  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmAbout.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmAbout.FormShow') else _udebug := nil;{$ENDIF}


  Self.ClientWidth  := imageStd.Width - 1;
  Self.ClientHeight := imageStd.Height - 1;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmAbout.lWWWClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmAbout.lWWWClick') else _udebug := nil;{$ENDIF}

  ShellExecute(Application.Handle, nil, PChar(lWWW.Caption), nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('About', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  {$IFDEF UDEBUG}
  //debugUnregisterUnit(DEBUG_unit_ID);
  {$ENDIF}

end.
