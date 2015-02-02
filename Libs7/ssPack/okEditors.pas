unit okEditors;

interface

uses
  SysUtils, Classes, Controls, cxControls, cxContainer, cxEdit, cxTextEdit,
  ExtCtrls, StdCtrls, Windows, Messages;

const
  OK_DEF_CHANGE_DELAY = 500;
  WM_LAYOUTCHANGED    = WM_USER + 17;

type
  TokTextEdit = class(TcxTextEdit)
  private
    FTimer : TTimer;
    FOnDelayedChange: TNotifyEvent;
    FChangeDelay: Cardinal;
    FLng: TLabel;

    FShowLang: Boolean;

    procedure SetChangeDelay(const Value: Cardinal);
    procedure DoTimer(Sender : TObject);
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure AdjustControls; 
    procedure SetShowLang(const Value: Boolean);

  protected
    procedure ChangeHandler(Sender: TObject); override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property ChangeDelay: Cardinal read FChangeDelay write SetChangeDelay default OK_DEF_CHANGE_DELAY;
    property OnDelayedChange: TNotifyEvent read FOnDelayedChange write FOnDelayedChange;
    property ShowLang: Boolean read FShowLang write setShowLang;
  end;

//===============================================================================
//===============================================================================
//===============================================================================
implementation

uses
  Graphics;

//==============================================================================================
function keyboardIndicator: String;
begin
  case GetKeyboardLayout(0) mod $100 of
    $36: Result := 'AF';
    $1c: Result := 'AL';
    $01: Result := 'AR';
    $2d: Result := 'BA';
    $23: Result := 'BE';
    $02: Result := 'BU';
    $03: Result := 'CA';
    $04: Result := 'CH';
    $1a: Result := 'CR';
    $05: Result := 'CZ';
    $06: Result := 'DA';
    $13: Result := 'DU';
    $09: Result := 'EN';
    $25: Result := 'ES';
    $38: Result := 'FA';
    $29: Result := 'FA';
    $0b: Result := 'FI';
    $0c: Result := 'FR';
    $07: Result := 'GE';
    $08: Result := 'GR';
    $0d: Result := 'HE';
    $0e: Result := 'HU';
    $0f: Result := 'IC';
    $21: Result := 'IN';
    $10: Result := 'IT';
    $11: Result := 'JA';
    $12: Result := 'KO';
    $26: Result := 'LA';
    $27: Result := 'LI';
    $14: Result := 'NO';
    $15: Result := 'PO';
    $16: Result := 'PO';
    $18: Result := 'RO';
    $19: Result := 'RU';
    $1b: Result := 'SL';
    $24: Result := 'SL';
    $0a: Result := 'SP';
    $1d: Result := 'SW';
    $1e: Result := 'TH';
    $1f: Result := 'TU';
    $22: Result := 'UK';
    $2a: Result := 'VI';
	//$422: Result := 'UA';
	//$419: Result := 'RU';
	//$409: Result := 'EN';
    else
      Result := '??';
  end;
end;

{ TokTextEdit }
//===============================================================================
procedure TokTextEdit.ChangeHandler(Sender: TObject);
begin
  inherited;

 if (FTimer.Interval > 0) and Assigned(FOnDelayedChange) then begin
   FTimer.Enabled := False;
   FTimer.Enabled := True;
 end
 else DoTimer(Sender);
end;

//===============================================================================
constructor TokTextEdit.Create(AOwner: TComponent);
begin
  inherited;

  FTimer := TTimer.Create(nil);
  with FTimer do begin
    Enabled := False;
    Interval := OK_DEF_CHANGE_DELAY;
    OnTimer := DoTimer;
  end;

  FChangeDelay := OK_DEF_CHANGE_DELAY;

  FLng := TLabel.Create(Self);
  with FLng do begin
    Font.Style := [fsBold];
    //DisabledDraw := ddUser;
    //DisabledColor := clBtnShadow;
    Parent := Self;
    Caption := keyboardIndicator;
  end;

  FShowLang := True;
  setShowLang(False);
end;

//===============================================================================
destructor TokTextEdit.Destroy;
begin
  FTimer.Free;
  FLng.Destroy;

  inherited;
end;

//===============================================================================
procedure TokTextEdit.AdjustControls;
begin
  FLng.Top := 0;
  FLng.Left := 0;
  inherited;
end;

//===============================================================================
procedure TokTextEdit.DoTimer(Sender: TObject);
begin
  FTimer.Enabled := False;

  if Assigned(FOnDelayedChange) then FOnDelayedChange(Sender);
end;

//===============================================================================
procedure TokTextEdit.SetChangeDelay(const Value: Cardinal);
begin
  FChangeDelay := Value;

  FTimer.Interval := Value;
end;

//===============================================================================
procedure TokTextEdit.SetShowLang(const Value: Boolean);
begin
  if FShowLang = Value then Exit;
  FShowLang := Value;
  FLng.Visible := FShowLang;

  AdjustControls;
end;

//===============================================================================
procedure TokTextEdit.WMLayoutChanged(var M: TMessage);
begin
  FLng.Caption := keyboardIndicator;
end;

end.
