unit ssSpeedButton;

interface

uses
  SysUtils, Classes, Controls, Buttons, Windows, Types, Graphics, CommCtrl,
  Messages, ImgList, ActnList;

const
  cl_HotTrack = 550944437;
  cl_HotBorder = 543892488;
  
type
  TssSpeedButton = class;

  TssButtonStyle = (ssbsFlat, ssbsUser);
  TssButtonState = (ssbsUp, ssbsDown, ssbsDisabled);
  TssButtonType = (ssbtStandard, ssbtChecked);
  TssButtonViewStyle = (ssvsCaptionGlyph, ssvsCaptionOnly, ssvsGlyphOnly);

  TssSpeedButtonActionLink = class(TControlActionLink)
    protected
      FClient: TssSpeedButton;
      procedure AssignClient(AClient: TObject); override;
      function  IsCheckedLinked: Boolean; override;
      function  IsGroupIndexLinked: Boolean; override;
      procedure SetGroupIndex(Value: Integer); override;
      procedure SetChecked(Value: Boolean); override;
      procedure SetCaption(const Value: string); override;
  end;

  TssSpeedButton = class(TGraphicControl)
    private
      FActive: Boolean;
      FAlignment: TAlignment;
      FAllwaysShowFrame: boolean;
      FButtonType: TssButtonType;
      FChecked: boolean;
      FColor: TColor;
      FDisabledImages: TImageList;
      FDisImageIndex: TImageIndex;
      FDisImagesChangeLink: TChangeLink;
      FDropped: Boolean;
      FDroppedDown: Boolean;
      FDroppedDownArrowRange: Integer;
      FGlyph: TBitmap;
      FGrEndColor: TColor;
      FGroupIndex: Integer;
      FGrStartColor: TColor;
      FHotBorderColor: TColor;
      FHotTrackColor: TColor;
      FImageIndex: TImageIndex;
      FImageRect: TRect;
      FImages: TImageList;
      FImagesChangeLink: TChangeLink;
      FLeftMargin: integer;
      FOffset: integer;
      FOver: boolean;
      FParentColorEx: Boolean;
      FPopupYOffset: Integer;
      FShowSeparator: Boolean;
      FStyle: TssButtonStyle;
      FTextRect: TRect;
      FUseGlyph: Boolean;
      FViewStyle: TssButtonViewStyle;

      function  GetGlyph: TBitmap;
      procedure CMMouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
      procedure CMMouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
      procedure DrawImage;
      procedure Get_Glyph;
      procedure ImageListChange(Sender: TObject);
      procedure PaintFrame;
      procedure SetActive(const Value: Boolean);
      procedure SetAlignment(const Value: TAlignment);
      procedure SetAllwaysShowFrame(const Value: boolean);
      procedure SetBorderColor(const Value: TColor);
      procedure SetButtonType(const Value: TssButtonType);
      procedure SetChecked(const Value: boolean);
      procedure SetColor(const Value: TColor);
      procedure SetDisabledImages(const Value: TImageList);
      procedure SetDisImageIndex(const Value: TImageIndex);
      procedure SetDroppedDown(const Value: Boolean);
      procedure SetDroppedDownArrowRange(const Value: Integer);
      procedure SetGrEndColor(const Value: TColor);
      procedure SetGroupIndex(const Value: Integer);
      procedure SetGrStartColor(const Value: TColor);
      procedure SetHotTrackColor(const Value: TColor);
      procedure SetImageIndex(const Value: TImageIndex);
      procedure SetImages(const Value: TImageList);
      procedure SetLeftMargin(const Value: integer);
      procedure SetOffset(const Value: integer);
      procedure SetParentColorEx(const Value: Boolean);
      procedure SetShowSeparator(const Value: Boolean);
      procedure SetStyle(const Value: TssButtonStyle);
      procedure SetUseGlyph(const Value: Boolean);
      procedure SetViewStyle(const Value: TssButtonViewStyle);

    protected
      FState: TssButtonState;

      function  GetActionLinkClass: TControlActionLinkClass; override;
      procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;
      procedure Click; override;
      procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
      procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
      procedure Paint; override;
      procedure SetEnabled(Value: Boolean); override;

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure Loaded; override;

      property Glyph: TBitmap read GetGlyph;
      property GrEndColor: TColor read FGrEndColor write SetGrEndColor;
      property GrStartColor: TColor read FGrStartColor write SetGrStartColor;
      property UseGlyph: Boolean read FUseGlyph write SetUseGlyph default False;

    published
      property Action;
      property Active: Boolean read FActive write SetActive default False;
      property Alignment: TAlignment read FAlignment write SetAlignment;
      property AllwaysShowFrame: boolean read FAllwaysShowFrame write SetAllwaysShowFrame;
      property Anchors;
      property BiDiMode;
      property ButtonType: TssButtonType read FButtonType write SetButtonType;
      property Checked: boolean read FChecked write SetChecked;
      property Constraints;
      property Caption;
      property Color: TColor read FColor write SetColor default clBtnFace;
      property DisabledImages: TImageList read FDisabledImages write SetDisabledImages;
      property DisabledImageIndex: TImageIndex read FDisImageIndex write SetDisImageIndex default -1;
      property DroppedDown: Boolean read FDroppedDown write SetDroppedDown default False;
      property DroppedDownArrowRange: Integer read FDroppedDownArrowRange write SetDroppedDownArrowRange default 15;
      property Enabled;
      property Font;
      property GroupIndex: Integer read FGroupIndex write SetGroupIndex;
      property Height default 25;
      property HotBorderColor: TColor read FHotBorderColor write SetBorderColor default cl_HotBorder;
      property HotTrackColor: TColor read FHotTrackColor write SetHotTrackColor default cl_HotTrack;
      property ImageIndex: TImageIndex read FImageIndex write SetImageIndex;
      property Images: TImageList read FImages write SetImages;
      property LeftMargin: integer read FLeftMargin write SetLeftMargin;
      property Offset: integer read FOffset write SetOffset default 1;
      property ParentFont;
      property ParentColorEx: Boolean read FParentColorEx write SetParentColorEx default True;
      property ParentShowHint;
      property ParentBiDiMode;
      property PopupMenu;
      property PopupYOffset: Integer read FPopupYOffset write FPopupYOffset default 0;
      property ShowHint;
      property ShowSeparator: Boolean read FShowSeparator write SetShowSeparator default True;
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

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ExtCtrls, ssGraphUtil;

//==============================================================================================
procedure TssSpeedButton.ActionChange(Sender: TObject; CheckDefaults: Boolean);
begin
  inherited ActionChange(Sender, CheckDefaults);

  if Sender is TCustomAction then
    with TCustomAction(Sender) do begin
      if Self.ImageIndex <> ImageIndex then Self.ImageIndex := ImageIndex;
      if Self.Checked <> Checked then Self.Checked := Checked;
      if Self.GroupIndex <> GroupIndex then Self.GroupIndex := GroupIndex;
      Invalidate;
    end;
end;

//==============================================================================================
procedure TssSpeedButton.Click;
begin
  if (FButtonType = ssbtChecked) then begin
    if Assigned(Action) then begin
      if not FChecked or (GroupIndex = 0) then TCustomAction(Action).Checked := not FChecked;
    end
    else begin
      if not Checked or (GroupIndex = 0) then Checked := not Checked;
    end;
  end;

  inherited;
end;

//==============================================================================================
procedure TssSpeedButton.CMMouseEnter(var Msg: TMessage);
begin
  inherited;
  FOver := True;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.CMMouseLeave(var Msg: TMessage);
begin
  inherited;
  FOver := False;
  FState := ssbsUp;
  Invalidate;
end;

//==============================================================================================
constructor TssSpeedButton.Create(AOwner: TComponent);
begin
  inherited;

  FGrStartColor := $00F6F6F6;
  FGrEndColor := $00F2D8B8;
  FShowSeparator := True;
  FParentColorEx := True;
  FImagesChangeLink := TChangeLink.Create;
  FImagesChangeLink.OnChange := ImageListChange;
  FDisImagesChangeLink := TChangeLink.Create;
  FDisImagesChangeLink.OnChange := ImageListChange;
  FDisImageIndex := -1;
  FColor := clBtnFace;
  Width := 25;
  Height := 25;
  FOffset := 1;
  FDroppedDownArrowRange := 15;
  FHotBorderColor := cl_HotBorder;
  FHotTrackColor := cl_HotTrack;
  FViewStyle := ssvsGlyphOnly;
  FLeftMargin := 4;

  FGlyph := TBitmap.Create;
  FGlyph.Transparent := True;
  FGlyph.TransparentMode := tmAuto;
end;

//==============================================================================================
destructor TssSpeedButton.Destroy;
begin
  FImagesChangeLink.Free;
  FDisImagesChangeLink.Free;
  FGlyph.Free;

  inherited;
end;

//==============================================================================================
procedure TssSpeedButton.DrawImage;
  var
    //FX, FY: Integer;
    FIndex: Integer;
begin
  if FImages <> nil then begin
    {if FOver and Enabled and not (csDesigning in ComponentState) then begin
      FImages.Draw(Canvas, FImageRect.Left, FImageRect.Top, FImageIndex, False);
      OffsetRect(FImageRect, -1, -1);
    end;
    }

    if (FState = ssbsDown) and not FChecked and not FDropped
      then OffsetRect(FImageRect, FOffset, FOffset);

    FIndex := FImageIndex;

    if not Enabled and (FDisImageIndex <> -1)
      then FIndex := FDisImageIndex;

    if not UseGlyph then begin
      if not Enabled and (FDisabledImages <> nil)
        then FDisabledImages.Draw(Canvas, FImageRect.Left, FImageRect.Top, FIndex, True)
        else FImages.Draw(Canvas, FImageRect.Left, FImageRect.Top, FIndex, Enabled);
    end
    else begin
      with Canvas do begin
        FGlyph.TransparentMode := tmAuto;
        Draw(FImageRect.Left, FImageRect.Top, FGlyph);
      end;
    end;
  end
  else if UseGlyph then begin
    with Canvas do begin
      FGlyph.TransparentMode := tmAuto;
      Draw(FImageRect.Left, FImageRect.Top, FGlyph);
    end;
  end;
end;

//==============================================================================================
function TssSpeedButton.GetActionLinkClass: TControlActionLinkClass;
begin
  Result := TssSpeedButtonActionLink;
end;

//==============================================================================================
function TssSpeedButton.GetGlyph: TBitmap;
begin
  Result := FGlyph;
end;

//==============================================================================================
procedure TssSpeedButton.Get_Glyph;
begin
  if not Enabled and (FDisabledImages <> nil) then begin
    if FDisImageIndex >= 0
      then FDisabledImages.GetBitmap(FDisImageIndex, FGlyph)
      else if FImageIndex >= 0
        then FDisabledImages.GetBitmap(FImageIndex, FGlyph)
        else FGlyph.Height := 0;
  end
  else begin
    if (FImageIndex >= 0) and (FImages <> nil)
      then FImages.GetBitmap(FImageIndex, FGlyph)
      else FGlyph.Height := 0;
  end;
  FGlyph.Transparent := True;
  //FGlyph.TransparentColor := clFuchsia;
end;

//==============================================================================================
procedure TssSpeedButton.ImageListChange(Sender: TObject);
begin
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.Loaded;
begin
  inherited;
end;

//==============================================================================================
procedure TssSpeedButton.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
    P: TPoint;
begin
  inherited MouseDown(Button, Shift, X, Y);

  FOver := True;

  if Button = mbLeft then begin
    FState := ssbsDown;

    if FDroppedDown and (X > Width - FDroppedDownArrowRange)
      then FDropped := True;

    Invalidate;

    if FDroppedDown and (X > Width - FDroppedDownArrowRange) and Assigned(PopupMenu)
    then begin
      P := ClientToScreen(Point(0, Height));
      PopupMenu.Popup(P.X, P.Y + FPopupYOffset);
      FState := ssbsUp;
      FOver := False;
      FDropped := False;
    end;

    Invalidate;
  end;
end;

//==============================================================================================
procedure TssSpeedButton.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FOver and (Button = mbLeft) then FState := ssbsUp;

  FDropped := False;
  Invalidate;

  inherited MouseUp(Button, Shift, X, Y);
end;

//==============================================================================================
procedure TssSpeedButton.Paint;
  var
    R: TRect;
    TH, TW: integer;
    clTemp: TColor;
    FArrowRange: Integer;
    FX, FY: Integer;
begin
  R := GetClientRect;

  if not Enabled
    then FState := ssbsDisabled
    else if Checked and Enabled then FState := ssbsDown;

  with Canvas do begin
    Font.Assign(Self.Font);
    TH := TextHeight('H');
    TW := TextWidth(Caption);

    Brush.Bitmap := AllocPatternBitmap(clBtnFace, clBtnHighlight);

    if not FDropped and (not FChecked or (not Enabled)) then begin
      Brush.Color := FColor;
    end;

    if FParentColorEx then Brush.Style := bsClear;

    if not (csDesigning in ComponentState) and (FStyle = ssbsUser) and FOver and not FDropped and Enabled
    then begin
      //DrawGradient(Canvas, R, FGrStartColor, FGrEndColor, gdVertical);
      Brush.Color := FHotTrackColor;
    end;

    FillRect(R);
    Brush.Style := bsSolid;

    if not (csDesigning in ComponentState) and not (FState = ssbsDisabled)
    then begin
     if (FStyle = ssbsUser) and FOver and not FDropped then begin
       Brush.Color := FHotTrackColor;

       if FState = ssbsDown then InflateRect(R, -1, -1);
       //DrawGradient(Canvas, R, FGrStartColor, FGrEndColor, gdVertical);
       FillRect(R);
     end
     else if (FStyle = ssbsUser) and FActive and not FDropped then begin
       InflateRect(R, -1, -1);
       DrawGradient(Canvas, R, FGrStartColor, clBtnFace{FGrEndColor}, gdVertical);
     end
     else if (FStyle in [ssbsFlat, ssbsUser]) and FChecked and not FOver then begin
       Brush.Bitmap := AllocPatternBitmap(clBtnFace, clBtnHighlight);
       //Brush.Color := clBtnHighlight;
       //Brush.Style := bsDiagCross;
       FillRect(R);
     end;
    end;

    clTemp := Brush.Color;
    PaintFrame;

    if csDesigning in ComponentState then begin
      Brush.Color := clBlack;
      FrameRect(R);
    end;

    if DroppedDown
      then FArrowRange := FDroppedDownArrowRange
      else FArrowRange := 0;

    if FViewStyle in [ssvsCaptionGlyph, ssvsGlyphOnly] then begin
      if FImages <> nil then begin
        case FViewStyle of
          ssvsGlyphOnly:
            begin
              case FAlignment of
               taLeftJustify: FImageRect.Left := FLeftMargin;
               taCenter:      FImageRect.Left := (Width - FArrowRange - FImages.Width) div 2;
               taRightJustify:FImageRect.Left := Width - FArrowRange -  FImages.Width - FLeftMargin;
              end;

              FImageRect.Right := FImageRect.Left + FImages.Width;
              FImageRect.Top := (Height - FImages.Height) div 2;
              FImageRect.Bottom := FImageRect.Top + FImages.Height;
            end;

          ssvsCaptionGlyph:
            begin
              case FAlignment of
               taLeftJustify: FImageRect.Left := FLeftMargin;
               taCenter:      FImageRect.Left := (Width - FArrowRange - FImages.Width - TW - 4) div 2;
               taRightJustify:FImageRect.Left := Width - FArrowRange - FImages.Width - TW - 4 - FLeftMargin;
              end;

              FImageRect.Right := FImageRect.Left + FImages.Width;
              FImageRect.Top := (Height - FImages.Height) div 2;
              FImageRect.Bottom := FImageRect.Top + FImages.Height;
            end;
        end;
      end; // if FImages <> nil

      if FChecked and not FDropped then OffsetRect(FImageRect, Offset, Offset);

      DrawImage;
    end; // if FViewStyle in [ssvsCaptionGlyph, ssvsGlyphOnly]

    if FDroppedDown
    then with Canvas do begin
      Pen.Color := clBlack;
      FX := Width - FDroppedDownArrowRange + (FDroppedDownArrowRange - 5) div 2;
      FY := (Height - 3) div 2;

      if FState = ssbsDown then begin
        Inc(FX);
        Inc(FY);
      end;

      MoveTo(FX, FY);
      LineTo(FX + 5, FY);
      MoveTo(FX + 1, FY + 1);
      LineTo(FX + 3, FY + 1);
      LineTo(FX + 2, FY + 3);
    end;

    if (FViewStyle in [ssvsCaptionGlyph, ssvsCaptionOnly]) and (Length(Caption) > 0) then begin
      Brush.Color := clTemp;
      Font := Self.Font;

      if not Enabled then Font.Color := clGray;

      FTextRect.Top := (Self.Height - TH) div 2;

      if FViewStyle = ssvsCaptionOnly then begin
        case FAlignment of
          taLeftJustify: FTextRect.Left := FLeftMargin;
          taCenter:      FTextRect.Left := (Self.Width - FArrowRange - TW) div 2;
          taRightJustify:FTextRect.Left := Self.Width - FArrowRange - TW - FLeftMargin;
        end;
      end
      else FTextRect.Left := FImageRect.Right + 3;

      if ((FState = ssbsDown)) and not FDropped and not Checked then begin
        FTextRect.Top := FTextRect.Top + FOffset;
        FTextRect.Left := FTextRect.Left + FOffset;
      end;

      Brush.Style := bsClear;
      TextOut(FTextRect.Left, FTextRect.Top, Caption);
    end;
  end;
end;

//==============================================================================================
procedure TssSpeedButton.PaintFrame;
  var
    R, R1: TRect;
begin
  R := GetClientRect;

  if csDesigning in ComponentState then begin
    Frame3D(Canvas, R, clBtnHighLight, clBtnShadow, 1);
    Exit;
  end;

  if (not Enabled) and (not FAllwaysShowFrame) then Exit;

  if FOver or FChecked or FAllwaysShowFrame then begin
    case FStyle of
      ssbsFlat:
        begin
          if (FState = ssbsDown) or FChecked
            then Frame3D(Canvas, R, clBtnShadow, clBtnHighLight, 1)
            else Frame3D(Canvas, R, clBtnHighLight, clBtnShadow, 1);
        end;

      ssbsUser:
        begin
          if not FDropped then begin
            Canvas.Brush.Color := FHotBorderColor;
            Canvas.Pen.Color := FHotBorderColor;
          end
          else begin
            Canvas.Pen.Color := clBtnShadow;
            Canvas.Brush.Color := clBtnShadow;
          end;

          Canvas.FrameRect(R);

          if FShowSeparator and FDroppedDown and not FDropped then begin
            Canvas.MoveTo(Self.Width - FDroppedDownArrowRange, 0);
            Canvas.LineTo(Self.Width - FDroppedDownArrowRange, Self.Height);
          end;
        end;//ssbsUser:
    end; // case FStyle
  end
  else if FActive and (FStyle = ssbsUser) then begin
    Canvas.Brush.Color := clBtnShadow;
    Canvas.Pen.Color := clBtnShadow;
    Canvas.MoveTo(R.Left, R.Top);
    Canvas.LineTo(R.Right, R.Top);
    R1 := R;
    R1.Right := R1.Left + 1;
    DrawGradient(Canvas, R1, clBtnShadow, clBtnFace, gdVertical);
    R1 := R;
    R1.Left := R1.Right - 1;
    DrawGradient(Canvas, R1, clBtnShadow, clBtnFace, gdVertical);
  end;
end;

//==============================================================================================
procedure TssSpeedButton.SetActive(const Value: Boolean);
begin
  FActive := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetAlignment(const Value: TAlignment);
begin
  FAlignment := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetAllwaysShowFrame(const Value: boolean);
begin
  FAllwaysShowFrame := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetBorderColor(const Value: TColor);
begin
  FHotBorderColor := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetButtonType(const Value: TssButtonType);
begin
  if Value <> FButtonType then begin
    if (Value = ssbtStandard) and FChecked then FChecked := False;
    FButtonType := Value;
    Invalidate;
  end;
end;

//==============================================================================================
procedure TssSpeedButton.SetChecked(const Value: boolean);
  var
    i: Integer;
begin
  if Value <> FChecked then begin
    if (FButtonType = ssbtStandard) and Value
      then FChecked := False
      else FChecked := Value;

    Invalidate;

    if Value and (FButtonType = ssbtChecked) and (GroupIndex > 0) then begin
      for i := 0 to Parent.ControlCount - 1 do
        if (Parent.Controls[i] is TssSpeedButton) and
           (TssSpeedButton(Parent.Controls[i]).GroupIndex = Self.GroupIndex) and
           (Parent.Controls[i] <> Self)
        then TssSpeedButton(Parent.Controls[i]).Checked := False;
    end;
  end;
end;

//==============================================================================================
procedure TssSpeedButton.SetColor(const Value: TColor);
begin
  FColor := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetDisabledImages(const Value: TImageList);
begin
  if FDisabledImages <> nil then FDisabledImages.UnRegisterChanges(FDisImagesChangeLink);

  FDisabledImages := Value;

  if FDisabledImages <> nil then FDisabledImages.RegisterChanges(FDisImagesChangeLink);

  Get_Glyph;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetDisImageIndex(const Value: TImageIndex);
begin
  FDisImageIndex := Value;

  Get_Glyph;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetDroppedDown(const Value: Boolean);
begin
  FDroppedDown := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetDroppedDownArrowRange(const Value: Integer);
begin
  FDroppedDownArrowRange := Value;
end;

//==============================================================================================
procedure TssSpeedButton.SetEnabled(Value: Boolean);
begin
  inherited;

  if Value <> Enabled then begin
    Get_Glyph;
    Invalidate;
  end;
end;

//==============================================================================================
procedure TssSpeedButton.SetGrEndColor(const Value: TColor);
begin
  FGrEndColor := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetGroupIndex(const Value: Integer);
begin
  FGroupIndex := Value;
end;

//==============================================================================================
procedure TssSpeedButton.SetGrStartColor(const Value: TColor);
begin
  FGrStartColor := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetHotTrackColor(const Value: TColor);
begin
  FHotTrackColor := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetImageIndex(const Value: TImageIndex);
begin
  if FImageIndex <> Value then begin
    FImageIndex := Value;
    Get_Glyph;
    Invalidate;
  end;
end;

//==============================================================================================
procedure TssSpeedButton.SetImages(const Value: TImageList);
begin
  if FImages <> nil then FImages.UnRegisterChanges(FImagesChangeLink);

  FImages := Value;

  if FImages <> nil then FImages.RegisterChanges(FImagesChangeLink);

  Get_Glyph;

  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetLeftMargin(const Value: integer);
begin
  FLeftMargin := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetOffset(const Value: integer);
begin
  FOffset := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetParentColorEx(const Value: Boolean);
begin
  FParentColorEx := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetShowSeparator(const Value: Boolean);
begin
  FShowSeparator := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetStyle(const Value: TssButtonStyle);
begin
  FStyle := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetUseGlyph(const Value: Boolean);
begin
  FUseGlyph := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssSpeedButton.SetViewStyle(const Value: TssButtonViewStyle);
begin
  if Value <> FViewStyle then begin
   FViewStyle := Value;
   Invalidate;
  end;
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
{ TssSpeedButtonActionLink }
procedure TssSpeedButtonActionLink.AssignClient(AClient: TObject);
begin
  inherited AssignClient(AClient);
  FClient := AClient as TssSpeedButton;
end;

//==============================================================================================
function TssSpeedButtonActionLink.IsCheckedLinked: Boolean;
begin
  Result := inherited IsCheckedLinked and (FClient.GroupIndex <> 0)
    and {FClient.AllowAllUp and }(FClient.Checked = (Action as TCustomAction).Checked);
end;

//==============================================================================================
function TssSpeedButtonActionLink.IsGroupIndexLinked: Boolean;
begin
  Result := (FClient is TssSpeedButton)
    and (TssSpeedButton(FClient).GroupIndex = (Action as TCustomAction).GroupIndex);
end;

//==============================================================================================
procedure TssSpeedButtonActionLink.SetCaption(const Value: string);
begin
  FClient.Caption := Value;
  FClient.Invalidate;
end;

//==============================================================================================
procedure TssSpeedButtonActionLink.SetChecked(Value: Boolean);
begin
  if IsCheckedLinked then begin
    TssSpeedButton(FClient).Checked := Value;
    TssSpeedButton(FClient).Invalidate;
  end;
end;

//==============================================================================================
procedure TssSpeedButtonActionLink.SetGroupIndex(Value: Integer);
begin
  if IsGroupIndexLinked then TssSpeedButton(FClient).GroupIndex := Value;
end;

end.
