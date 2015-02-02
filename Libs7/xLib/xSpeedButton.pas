unit xSpeedButton;

interface

uses
  SysUtils, Classes, Controls, Buttons, Windows, Types, Graphics, CommCtrl,
  Messages, ImgList, ActnList;

type
  TxSpeedButton = class;

  TssButtonStyle = (ssbsFlat, ssbsUser);
  TssButtonState = (ssbsUp, ssbsDown, ssbsDisabled);
  TssButtonType = (ssbtStandard, ssbtChecked);
  TssButtonViewStyle = (ssvsCaptionGlyph, ssvsCaptionOnly, ssvsGlyphOnly);

  TxSpeedButtonActionLink = class(TControlActionLink)
  protected
    FClient: TxSpeedButton;
    procedure AssignClient(AClient: TObject); override;
    function IsCheckedLinked: Boolean; override;
    function IsGroupIndexLinked: Boolean; override;
    procedure SetGroupIndex(Value: Integer); override;
    procedure SetChecked(Value: Boolean); override;
  end;

  TxSpeedButton = class(TGraphicControl)
  private
   FColor: TColor;
   FHotBorderColor: TColor;
   FImageRect: TRect;
   FTextRect: TRect;
   FOver: boolean;
   FHotTrackColor: TColor;
   FStyle: TssButtonStyle;
   FImages: TImageList;
   FImagesChangeLink: TChangeLink;
   FImageIndex: TImageIndex;
   FOffset: integer;
   FButtonType: TssButtonType;
   FChecked: boolean;
   FGroupIndex: Integer;
   FAllwaysShowFrame: boolean;
   FViewStyle: TssButtonViewStyle;
   procedure PaintFrame;
   procedure SetColor(const Value: TColor);
   procedure SetBorderColor(const Value: TColor);
   procedure CMMouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
   procedure CMMouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
   procedure SetHotTrackColor(const Value: TColor);
   procedure SetStyle(const Value: TssButtonStyle);
   procedure SetImages(const Value: TImageList);
   procedure ImageListChange(Sender: TObject);
   procedure SetImageIndex(const Value: TImageIndex);
   procedure DrawImage;
   procedure SetButtonType(const Value: TssButtonType);
   procedure SetChecked(const Value: boolean);
   procedure SetGroupIndex(const Value: Integer);
   procedure SetAllwaysShowFrame(const Value: boolean);
   procedure SetViewStyle(const Value: TssButtonViewStyle);
  protected
   FState: TssButtonState;
   procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;
   function GetActionLinkClass: TControlActionLinkClass; override;
   procedure Paint; override;
   procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
   procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
   procedure Loaded; override;
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
  published
   property Action;
   property AllwaysShowFrame: boolean read FAllwaysShowFrame write SetAllwaysShowFrame;
   property Anchors;
   property BiDiMode;
   property ButtonType: TssButtonType read FButtonType write SetButtonType;
   property Checked: boolean read FChecked write SetChecked;
   property Constraints;
   property Caption;
   property Color: TColor read FColor write SetColor default clBtnFace;
   property Enabled;
   property Font;
   property GroupIndex: Integer read FGroupIndex write SetGroupIndex;
   property Height default 25;
   property HotBorderColor: TColor read FHotBorderColor write SetBorderColor;
   property HotTrackColor: TColor read FHotTrackColor write SetHotTrackColor;
   property ImageIndex: TImageIndex read FImageIndex write SetImageIndex;
   property Images: TImageList read FImages write SetImages;
   property Offset: integer read FOffset write FOffset;
   property ParentFont;
   property ParentShowHint;
   property ParentBiDiMode;
   property PopupMenu;
   property ShowHint;
   property Style: TssButtonStyle read FStyle write SetStyle;
   property ViewStyle: TssButtonViewStyle read FViewStyle write SetViewStyle;
   property Visible;
   property Width default 25;
   property OnClick;
   property OnDblClick;
   property OnMouseDown;
   property OnMouseMove;
   property OnMouseUp;
  end;

  TflSpeedButton = class(TxSpeedButton)
  end;

implementation

uses ExtCtrls;

{ TxSpeedButton }

procedure TxSpeedButton.ActionChange(Sender: TObject;
  CheckDefaults: Boolean);
begin
  inherited ActionChange(Sender, CheckDefaults);
  if Sender is TCustomAction then
    with TCustomAction(Sender) do begin
     if Self.ImageIndex<>ImageIndex then Self.ImageIndex:=ImageIndex;
     if Self.Checked<>Checked then Self.Checked:=Checked;
     if Self.GroupIndex<>GroupIndex then Self.GroupIndex:=GroupIndex;
     Invalidate;
    end;
end;

procedure TxSpeedButton.CMMouseEnter(var Msg: TMessage);
begin
     inherited;
     FOver:=True;
     Invalidate;
end;

procedure TxSpeedButton.CMMouseLeave(var Msg: TMessage);
begin
     inherited;
     FOver:=False;
     FState:=ssbsUp;
     Invalidate;
end;

constructor TxSpeedButton.Create(AOwner: TComponent);
begin
  inherited;
  FImagesChangeLink:=TChangeLink.Create;
  FImagesChangeLink.OnChange:=ImageListChange;
  FColor:=clBtnFace;
  Width:=25;
  Height:=25;
  FOffset:=1;
  FHotBorderColor:=clGray;
  FHotTrackColor:=clSkyBlue;
  FViewStyle:=ssvsGlyphOnly;
end;

destructor TxSpeedButton.Destroy;
begin
  FImagesChangeLink.Free;

  inherited;
end;

procedure TxSpeedButton.DrawImage;
begin
 if FImages<>nil then begin
  if FOver and Enabled and not (csDesigning in ComponentState) then begin
//   FImages.Draw(Canvas, FImageRect.Left, FImageRect.Top, FImageIndex, False);
//   OffsetRect(FImageRect, -1, -1);
  end;
  if (FState=ssbsDown) and not FChecked then OffsetRect(FImageRect, FOffset, FOffset);
  FImages.Draw(Canvas, FImageRect.Left, FImageRect.Top, FImageIndex, Enabled);
 end;
end;

function TxSpeedButton.GetActionLinkClass: TControlActionLinkClass;
begin
  Result := TxSpeedButtonActionLink;
end;

procedure TxSpeedButton.ImageListChange(Sender: TObject);
begin
  Invalidate;
end;

procedure TxSpeedButton.Loaded;
begin
  inherited;
end;

procedure TxSpeedButton.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if FOver and (Button = mbLeft) then begin
   FState:=ssbsDown;
  end;
  Invalidate;
end;

procedure TxSpeedButton.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  if FOver and (Button=mbLeft) then begin
   FState:=ssbsUp;
   if (FButtonType=ssbtChecked) then begin
    if Assigned(Action) then begin
     if not FChecked or (GroupIndex=0)
      then TCustomAction(Action).Checked:=not FChecked;
    end
    else begin
     if not FChecked or (GroupIndex=0)
      then FChecked:=not FChecked;
    end;
   end;
  end;
  Invalidate;
end;

procedure TxSpeedButton.Paint;
var
  R: TRect;
  TH, TW: integer;
  clTemp: TColor;
begin
  R := GetClientRect;
  if not Enabled then FState:=ssbsDisabled;

  with Canvas do begin
    TH:=TextHeight(Caption);
    TW:=TextWidth(Caption);

    Brush.Color:=FColor;
    if FChecked and (FState<>ssbsDisabled) then begin
     Brush.Bitmap := AllocPatternBitmap(clBtnFace, clBtnHighlight);
    end;
    FillRect(R);
    Brush.Style:=bsSolid;
    if not (csDesigning in ComponentState) and not (FState=ssbsDisabled) then begin
     if (FStyle=ssbsUser) and FOver then begin
      Brush.Color:=FHotTrackColor;
      if FState=ssbsDown then InflateRect(R, -1, -1);
      FillRect(R);
     end
     else if (FStyle in [ssbsFlat]) and FChecked and FOver then begin
      Brush.Color:=FColor;
      FillRect(R);
     end;
    end;
    clTemp:=Brush.Color;

    if csDesigning in ComponentState then
    begin
      Brush.Color := clBlack;
      FrameRect(R);
    end;

    if FViewStyle in [ssvsCaptionGlyph, ssvsGlyphOnly] then begin
     if FImages<>nil then begin
      case FViewStyle of
       ssvsGlyphOnly:    begin
                          FImageRect.Left := (Width-FImages.Width) div 2;
                          FImageRect.Right := FImageRect.Left + FImages.Width;
                          FImageRect.Top := (Height-FImages.Height) div 2;
                          FImageRect.Bottom := FImageRect.Top + FImages.Height;
                         end;
       ssvsCaptionGlyph: begin
                          FImageRect.Left := (Width-FImages.Width-TW) div 2;
                          FImageRect.Right := FImageRect.Left + FImages.Width;
                          FImageRect.Top := (Height-FImages.Height) div 2;
                          FImageRect.Bottom := FImageRect.Top + FImages.Height;
                         end;
      end;
     end;
     if FChecked then OffsetRect(FImageRect, Offset, Offset);
     DrawImage;
    end;

    if (FViewStyle in [ssvsCaptionGlyph, ssvsCaptionOnly]) and (Length(Caption)>0) then begin
     Brush.Color:=clTemp;
     Font:=Self.Font;
     FTextRect.Top:=(Self.Height-TH) div 2;
     if FViewStyle=ssvsCaptionGlyph then FTextRect.Left:=FImageRect.Right+4
      else FTextRect.Left:=(Self.Width-TW) div 2;
     if FChecked or (FState=ssbsDown) then begin
      FTextRect.Top:=FTextRect.Top+1;
      FTextRect.Left:=FTextRect.Left+1;
     end;
     TextOut(FTextRect.Left, FTextRect.Top, Caption);
    end;
  end;

  PaintFrame;
  { draw text }
{  if Length(Caption) > 0 then
  begin
    if FOver then
      Canvas.Font := FHighlightFont
    else
      Canvas.Font := Font;

    //    W := FSpacing  + W;
    SetBkMode(Canvas.Handle, Windows.Transparent);
    R := GetClientRect;
    if (ImageSize = isLarge) and Assigned(FLargeImages) then
      R.Top := R.Top + FLargeImages.Height + (FSpacing * 2)
    else
    if (ImageSize = isSmall) and Assigned(FSmallImages) then
      R.Left := R.Left + FSmallImages.Width + (FSpacing * 3)
    else
      Flags := DT_END_ELLIPSIS or DT_EDITCONTROL or DT_WORDBREAK or DT_CENTER or DT_VCENTER;
    if FDown then
      OffsetRect(R, FOffset, FOffset);
    FTextRect := R;
    H := DrawText(Canvas.Handle, PChar(Caption), -1, FTextRect, Flags or DT_CALCRECT);
    if ImageSize = isLarge then
    begin
      FTextRect.Top := R.Top;
      FTextRect.Bottom := FTextRect.Top + H;
      FTextRect.Right := R.Left + Canvas.TextWidth(Caption);
    end
    else
    begin
      FTextRect.Top := (Height - Canvas.TextHeight(Caption)) div 2;
      FTextRect.Bottom := FTextRect.Top + Canvas.TextHeight(Caption);
      FTextRect.Right := R.Left + Canvas.TextWidth(Caption);
    end;
    DrawText(Canvas.Handle, PChar(Caption), -1, R, Flags);
  end;
}

end;

procedure TxSpeedButton.PaintFrame;
var
  R: TRect;
begin
  R := GetClientRect;

  if csDesigning in ComponentState then
  begin
   Frame3D(Canvas, R, clBtnHighLight, clBtnShadow, 1);
   Exit;
  end;

  if not Enabled then Exit;

  if FOver or FChecked or FAllwaysShowFrame then begin
   case FStyle of
    ssbsFlat: begin
               if (FState=ssbsDown) or FChecked
                then Frame3D(Canvas, R, clBtnShadow, clBtnHighLight, 1)
                else Frame3D(Canvas, R, clBtnHighLight, clBtnShadow, 1);
              end;
    ssbsUser: begin
               if FState=ssbsDown then InflateRect(R, -1, -1);
               Canvas.Brush.Color:=FHotBorderColor;
               Canvas.FrameRect(R);
              end;
   end;
  end;
end;

procedure TxSpeedButton.SetAllwaysShowFrame(const Value: boolean);
begin
  FAllwaysShowFrame := Value;
  Invalidate;
end;

procedure TxSpeedButton.SetBorderColor(const Value: TColor);
begin
  FHotBorderColor := Value;
  Invalidate;
end;

procedure TxSpeedButton.SetButtonType(const Value: TssButtonType);
begin
  if Value<>FButtonType then begin
   if (Value=ssbtStandard) and FChecked then FChecked:=False;
   FButtonType := Value;
   Invalidate;
  end;
end;

procedure TxSpeedButton.SetChecked(const Value: boolean);
begin
  if Value<>FChecked then begin
   if (FButtonType=ssbtStandard) and Value then begin
    FChecked:=False;
   end
   else begin
    FChecked := Value;
   end;
   Invalidate; 
  end;
end;

procedure TxSpeedButton.SetColor(const Value: TColor);
begin
  FColor := Value;
  Invalidate;
end;

procedure TxSpeedButton.SetGroupIndex(const Value: Integer);
begin
  FGroupIndex := Value;
end;

procedure TxSpeedButton.SetHotTrackColor(const Value: TColor);
begin
  FHotTrackColor := Value;
  Invalidate;
end;

procedure TxSpeedButton.SetImageIndex(const Value: TImageIndex);
begin
  if FImageIndex <> Value then begin
    FImageIndex := Value;
    Invalidate;
  end;
end;

procedure TxSpeedButton.SetImages(const Value: TImageList);
begin
  if FImages <> nil then
    FImages.UnRegisterChanges(FImagesChangeLink);
  FImages := Value;

  if FImages <> nil then
    FImages.RegisterChanges(FImagesChangeLink);
  Invalidate;
end;

procedure TxSpeedButton.SetStyle(const Value: TssButtonStyle);
begin
  FStyle := Value;
  Invalidate;
end;

procedure TxSpeedButton.SetViewStyle(const Value: TssButtonViewStyle);
begin
  if Value<>FViewStyle then begin
   FViewStyle:=Value;
   Invalidate;
  end;
end;

{ TxSpeedButtonActionLink }

procedure TxSpeedButtonActionLink.AssignClient(AClient: TObject);
begin
  inherited AssignClient(AClient);
  FClient := AClient as TxSpeedButton;
end;

function TxSpeedButtonActionLink.IsCheckedLinked: Boolean;
begin
  Result := inherited IsCheckedLinked and (FClient.GroupIndex <> 0) and
    {FClient.AllowAllUp and }(FClient.Checked = (Action as TCustomAction).Checked);
end;

function TxSpeedButtonActionLink.IsGroupIndexLinked: Boolean;
begin
  Result := (FClient is TxSpeedButton) and
    (TxSpeedButton(FClient).GroupIndex = (Action as TCustomAction).GroupIndex);
end;

procedure TxSpeedButtonActionLink.SetChecked(Value: Boolean);
begin
  if IsCheckedLinked then TxSpeedButton(FClient).Checked := Value;
end;

procedure TxSpeedButtonActionLink.SetGroupIndex(Value: Integer);
begin
  if IsGroupIndexLinked then TxSpeedButton(FClient).GroupIndex := Value;
end;

end.
