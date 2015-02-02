unit ssCalcEdit;

interface

uses
  Windows, SysUtils, Classes, Controls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalc, Graphics, Variants;

var
  ShowCalcOnKeyPress: Boolean = False;

type
  TssCalculator = class(TcxPopupCalculator)
  published
    property Color;
  end;

  //----------------------------------------------------------------------
  TssPopupCalculator = class(TcxPopupCalculator)
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  public
    procedure SetEditorValue(const Value: string); override;
    property AutoFontSize;
    property Edit;
  end;

  //----------------------------------------------------------------------
  TssCalcEdit = class(TcxCalcEdit)
  private
    FDecimalPlaces: Cardinal;
    FOldValue: Extended;
    procedure SetCalcColor(const Value: TColor);
    function GetCalcColor: TColor;
    procedure SetDecimalPlaces(const Value: Cardinal);
    procedure CheckValue;

  protected
    procedure DoInitPopup; override;
    procedure PopupWindowClosed(Sender: TObject); override;
    procedure KeyPress(var Key: Char); override;
    procedure SetEditValue(const Value: TcxEditValue); override;
    procedure ResetValue;

  public
    constructor Create(AOwner: TComponent); override;

  published
    property CalcColor: TColor read GetCalcColor write SetCalcColor;
    property DecimalPlaces: Cardinal read FDecimalPlaces write SetDecimalPlaces;
  end;

//========================================================================
implementation

uses Math, ssStrUtil, Dialogs;

procedure TssCalcEdit.CheckValue;
begin
    if not DroppedDown and (EditText<>'')
     then EditValue:=RoundTo(StrToFloat(EditText), -FDecimalPlaces);
end;

constructor TssCalcEdit.Create(AOwner: TComponent);
begin
  inherited;
  FDecimalPlaces := 2;
  EditValue := 0;
  {$IFNDEF NODESIGN_}
  FCalculator.Free;
  FCalculator := TssPopupCalculator.Create(Self);
  with TssPopupCalculator(FCalculator) do
  begin
    Parent := PopupWindow;
    Edit := Self;
    AutoFontSize := False;
    OnHidePopup := HideCalculator;
  end;
  {$ENDIF}
end;

procedure TssCalcEdit.DoInitPopup;
begin
  inherited;

  FOldValue := Value;
end;

function TssCalcEdit.GetCalcColor: TColor;
begin
  Result:=TssCalculator(Calculator).Color;
end;

procedure TssCalcEdit.KeyPress(var Key: Char);
var
   s: string;
begin
  if CharInSet(Key, [',', '.']) then Key := DecimalSeparator;

  if ShowCalcOnKeyPress and CharInSet(Key, ['0'..'9', '.', ',']) then begin
    {$IFNDEF NODESIGN_}
    TssPopupCalculator(FCalculator).FStatus := csValid;
    if not DroppedDown then DropDown;
    TssPopupCalculator(FCalculator).FStatus := csValid;
    {$ENDIF}
  end;

  if Key = ' ' then begin
    Key := #0;
    if not DroppedDown then DropDown;
    Exit;
  end;

  if (FDecimalPlaces=0) and CharInSet(Key, [',', '.']) then begin
    if Properties.BeepOnError then Beep;
    Key := #0;
    Exit;
  end;

  if IsValidChar(Key) and CharInSet(Key, ['0'..'9', #13, #8, '.', ',']) then begin
    s:=EditText;
    System.Insert(Key, s, CursorPos+1);

    if (WordCount(s, [DecimalSeparator])=2) 
       and (Cardinal(Length(ExtractWord(2, s, [DecimalSeparator])))>FDecimalPlaces) 
       and (SelText='')
    then begin
      if Properties.BeepOnError then Beep;

      Key:=#0;
      Exit;
    end;
  end;

  if key<>#0 then inherited KeyPress(Key);
end;

procedure TssCalcEdit.PopupWindowClosed(Sender: TObject);
begin
  inherited;
  CheckValue;
  SelectAll;
end;

procedure TssCalcEdit.ResetValue;
begin
  Value := FOldValue;
end;

procedure TssCalcEdit.SetCalcColor(const Value: TColor);
begin
  TssCalculator(Calculator).Color:=Value;
end;

procedure TssCalcEdit.SetDecimalPlaces(const Value: Cardinal);
begin
  FDecimalPlaces := Value;
  CheckValue;
end;

procedure TssCalcEdit.SetEditValue(const Value: TcxEditValue);
begin
  inherited SetEditValue(RoundTo(Value, -FDecimalPlaces));
end;

{ TssPopupCalculator }

procedure TssPopupCalculator.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then begin
    Key := 0;
    TssCalcEdit(Edit).ResetValue;
    HidePopup;
  end;

  inherited KeyDown(Key, Shift);;
end;

procedure TssPopupCalculator.SetEditorValue(const Value: string);
begin
  inherited;
end;

end.
