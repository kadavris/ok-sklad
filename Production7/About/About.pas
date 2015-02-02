{$I ok_sklad.inc}
unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseSkinForm, ImgList, ssSpeedButton, ssPanel, ExtCtrls,
  ssGradientPanel, xButton, StdCtrls, JvExControls, JvgLabel;

type
  TfrmAbout = class(TfrmBaseSkin)
    Panel1: TPanel;
    imgMain: TImage;
    lVersion: TLabel;
    lWWW: TLabel;
    lCopyRight: TLabel;
    lRegUserName: TJvgLabel;
    lRegEMail: TJvgLabel;
    lRegCity: TJvgLabel;
    lRegNo: TJvgLabel;

    procedure btnOKClick(Sender: TObject);
    procedure lWWWClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgMainClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  public
    procedure SetCaptions;

  end;

var
  frmAbout: TfrmAbout;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ShellAPI, prConst, Udebug, xLngDefs, prFun, Protection;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmAbout.btnOKClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmAbout.btnOKClick') else _udebug := nil;{$ENDIF}

  ModalResult := mrOk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmAbout.lWWWClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmAbout.lWWWClick') else _udebug := nil;{$ENDIF}

  ShellExecute(Application.Handle, nil, PChar(lWWW.Caption), nil, nil, SW_SHOWNORMAL);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmAbout.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmAbout.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    panTitleBar.Caption := GetRS(Self.Name, 'Title')
                    {$IFDEF BETA} + GetRS('Common', 'BetaVer'){$ENDIF};

    lCopyRight.Caption := OK_CopyRight;
    lWWW.Caption := OK_URL;
    lVersion.Caption := OK_version;

    try
      {$IFNDEF FREE}
      if RegInfo.Values['user'] = ''
        then lRegUserName.Caption := GetRS(Self.Name, 'NotReg')
        else begin
          lRegUserName.Caption := RegInfo.Values['user'];
          lRegNo.Caption := RegInfo.Values['id'];
          lRegEMail.Caption := RegInfo.Values['email'];
          lRegCity.Caption := RegInfo.Values['addr'];
        end;
      {$ENDIF}

      if servMsg.Values['serverVer'] <> '' then begin
        lVersion.Caption := lVersion.Caption + ' (Server: ' + servMsg.Values['serverVer'];

        if servMsg.Values['AType'] = '1'
          then lVersion.Caption := lVersion.Caption + ' {NOT ACTIVATED}';

        lVersion.Caption := lVersion.Caption + ')';
      end;

    except
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmAbout.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmAbout.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;
  SetCaptions;
  panTitleBar.Align := alNone;
  imgMain.Picture.Bitmap.LoadFromResourceName(resDllHandle, 'about');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmAbout.imgMainClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmAbout.imgMainClick') else _udebug := nil;{$ENDIF}

  ModalResult := mrOk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmAbout.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmAbout.FormShow') else _udebug := nil;{$ENDIF}

  inherited;
  Self.ClientHeight := imgMain.Picture.Bitmap.Height;
  Self.ClientWidth := imgMain.Picture.Bitmap.Width;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('About', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
