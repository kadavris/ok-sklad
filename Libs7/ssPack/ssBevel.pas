unit ssBevel;

interface

uses
  SysUtils, Classes, Controls, ExtCtrls, Graphics, Messages,
  ssGraphUtil, ImgList, Windows;

const
  clXPHotTrack = $206B2408;

type
  TssMouseMoveEvent = procedure(Sender: TObject) of object;
  TssVertAlignment = (vaTop, vaCenter, vaBottom);

  TssMargins = class(TPersistent)
  private
    FControl: TControl;
    FRightMargin: Integer;
    FTopMargin: Integer;
    FLeftMargin: Integer;
    FBottomMargin: Integer;
    procedure SetBottomMargin(const Value: Integer);
    procedure SetLeftMargin(const Value: Integer);
    procedure SetRightMargin(const Value: Integer);
    procedure SetTopMargin(const Value: Integer);
  public
    constructor Create(AOwner: TControl); virtual;
  published
    property Bottom: Integer read FBottomMargin write SetBottomMargin default 0;
    property Left: Integer read FLeftMargin write SetLeftMargin default 4;
    property Right: Integer read FRightMargin write SetRightMargin default 4;
    property Top: Integer read FTopMargin write SetTopMargin default 0;
  end;

  TssAlignments = class(TPersistent)
  private
    FControl: TControl;
    FHorz: TAlignment;
    FVert: TssVertAlignment;
    procedure SetHorz(const Value: TAlignment);
    procedure SetVert(const Value: TssVertAlignment);
  public
    constructor Create(AOwner: TControl); virtual;
  published
    property Horz: TAlignment read FHorz write SetHorz default taLeftJustify;
    property Vert: TssVertAlignment read FVert write SetVert default vaCenter;
  end;

  TssBevelStyle = (bsLowered, bsRaised, bsSingle);
  TssBevelEdge = (beLeft, beRight, beTop, beBottom);
  TssBevelEdges = set of TssBevelEdge;

  TssBevel = class(TGraphicControl)
  private
    FShape: TBevelShape;
    FStyle: TssBevelStyle;
    FColorInner: TColor;
    FColorOuter: TColor;
    FColorGrBegin: TColor;
    FColorGrEnd: TColor;
    FGradientDirection: TGradientDirection;
    FCaption: TCaption;
    FEdges: TssBevelEdges;
    FUseGradient: boolean;
    FImages: TImageList;
    FImageIndex: TImageIndex;
    FImagesChangeLink: TChangeLink;
    //FAlignment: TAlignment;
    FMargins: TssMargins;
    FAlignments: TssAlignments;
    FHotTrack: Boolean;
    FHotTrackColor: TColor;
    FOver: Boolean;
    FOnMouseLeave: TssMouseMoveEvent;
    FOnMouseEnter: TssMouseMoveEvent;
    FWordBreak: Boolean;

    procedure SetShape(const Value: TBevelShape);
    procedure SetStyle(const Value: TssBevelStyle);
    procedure SetColorInner(const Value: TColor);
    procedure SetColorOuter(const Value: TColor);
    procedure SetColorGrBegin(const Value: TColor);
    procedure SetColorGrEnd(const Value: TColor);
    procedure SetGradientDirection(const Value: TGradientDirection);
    procedure SetCaption(const Value: TCaption);
    procedure SetEdges(const Value: TssBevelEdges);
    procedure SetUseGradient(const Value: boolean);
    procedure SetImages(const Value: TImageList);
    procedure ImageListChange(Sender: TObject);
    procedure SetImageIndex(const Value: TImageIndex);
    procedure SetAlignments(const Value: TssAlignments);
    procedure SetMargins(const Value: TssMargins);
    procedure SetHotTrack(const Value: Boolean);
    procedure SetHotTrackColor(const Value: TColor);
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure SetWordBreak(const Value: Boolean);

  protected
    procedure Paint; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure PaintFrame;

  published
    property Align;
    property Alignments: TssAlignments read FAlignments write SetAlignments;
    property Anchors;
    property Caption: TCaption read FCaption write SetCaption;
    property Color;
    property ColorGrBegin: TColor read FColorGrBegin write SetColorGrBegin;
    property ColorGrEnd: TColor read FColorGrEnd write SetColorGrEnd;
    property ColorInner: TColor read FColorInner write SetColorInner;
    property ColorOuter: TColor read FColorOuter write SetColorOuter;
    property Constraints;
    property Edges: TssBevelEdges read FEdges write SetEdges;
    property Font;
    property GradientDirection: TGradientDirection read FGradientDirection write SetGradientDirection;
    property HotTrack: Boolean read FHotTrack write SetHotTrack;
    property HotTrackColor: TColor read FHotTrackColor write SetHotTrackColor default clXPHotTrack;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex;
    property Images: TImageList read FImages write SetImages;
    property Margins: TssMargins read FMargins write SetMargins;
    property ParentShowHint;
    property ParentColor;
    property Shape: TBevelShape read FShape write SetShape default bsBox;
    property ShowHint;
    property Style: TssBevelStyle read FStyle write SetStyle default bsLowered;
    property UseGradient: boolean read FUseGradient write SetUseGradient;
    property Visible;
    property WordBreak: Boolean read FWordBreak write SetWordBreak default True;

    property OnClick;
    property OnDblClick;
    property OnMouseEnter: TssMouseMoveEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TssMouseMoveEvent read FOnMouseLeave write FOnMouseLeave;
  end;

implementation

uses Types;

procedure TssBevel.CMMouseEnter(var Message: TMessage);
  var
    FControl: TControl;
begin
  if not FHotTrack then Exit;

  if Assigned(FOnMouseEnter) then FOnMouseEnter(Self);

  FControl := Self.Parent.ControlAtPos(Self.Parent.ScreenToClient(Mouse.CursorPos), False, False);

  if (FControl = Self) and not FOver then begin
    FOver := True;
    //Invalidate;
    PaintFrame;
  end;
end;

procedure TssBevel.CMMouseLeave(var Message: TMessage);
var
  FControl: TControl;
  R: TRect;
  //pinr: string;
  mr: tpoint;

begin
  if not FHotTrack then Exit;
  if Assigned(FOnMouseLeave) then FOnMouseLeave(Self);
  GetCursorPos(mr);
  //sleep(20);
  FControl := Self.Parent.ControlAtPos(Self.Parent.ScreenToClient(Mouse.CursorPos), False, False);
  R := Rect(Left, Top, Left + Width, Top + Height);

  {if PointInRect(Self.Parent.ScreenToClient(Mouse.CursorPos), R)
   then pinr:='true'
   else pinr:='false';
  Self.Caption := 'ClRect: (' + IntToStr(R.Left) + ',' + IntToStr(R.Top)+')-('+
      IntToStr(R.Right) + ',' + IntToStr(R.Bottom)+') ;'+
      IntToStr(Self.Parent.ScreenToClient(Mouse.CursorPos).X) + ',' +
      IntToStr(Self.Parent.ScreenToClient(Mouse.CursorPos).Y) + '   '+
      IntToStr(Self.Parent.ScreenToClient(mr).X) + ',' +
      IntToStr(Self.Parent.ScreenToClient(mr).Y) + '   '+
      pinr +
      '   LParam: ' + IntToStr(message.lparam)+
      '   WParam: ' + IntToStr(message.wparam);
  }

  if (FControl <> Self) and not PointInRect(Self.Parent.ScreenToClient(Mouse.CursorPos), R) 
  then begin
    FOver := False;
    //Invalidate;
    PaintFrame;
  end;
end;

constructor TssBevel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FImagesChangeLink:=TChangeLink.Create;
  FImagesChangeLink.OnChange:=ImageListChange;
  ControlStyle := ControlStyle + [csReplicatable];
  FStyle := bsLowered;
  FShape := bsBox;
  FColorInner:=clBtnShadow;
  FColorOuter:=clBtnHighlight;
  Width := 50;
  Height := 50;
  FColorGrBegin:=clBtnFace;
  FColorGrEnd:=clBtnFace;
  Edges:=[beLeft, beRight, beTop, beBottom];
  FHotTrack := False;
  FHotTrackColor := clXPHotTrack;
  FWordBreak := True;

  FMargins:=TssMargins.Create(Self);
  FAlignments:=TssAlignments.Create(Self);
end;

destructor TssBevel.Destroy;
begin
  FImagesChangeLink.Free;
  FMargins.Free;
  FAlignments.Free;

  inherited;
end;

procedure TssBevel.ImageListChange(Sender: TObject);
begin
  Invalidate;
end;

procedure TssBevel.Paint;
  const
    XorColor = $00FFD8CE;
    Als: array[TAlignment] of Longint = (DT_LEFT, DT_RIGHT, DT_CENTER);

  var
    th: integer;
    R, IR: TRect;
    Flags: Longint;

begin
  R := ClientRect;

  with Canvas do begin
    if UseGradient then begin
      if not DrawGradient(Canvas, R, FColorGrBegin, FColorGrEnd, FGradientDirection) then begin
        Canvas.Brush.Color:=FColorGrBegin;
        Canvas.FillRect(R);
      end;
    end
    else if not ParentColor then begin
      Canvas.Brush.Color := Color;
      Canvas.FillRect(R);
    end;

    if (csDesigning in ComponentState) then begin
      if (FShape = bsSpacer) then begin
        Pen.Style := psDot;
        Pen.Mode := pmXor;
        Pen.Color := XorColor;
        Brush.Style := bsClear;
        Rectangle(0, 0, ClientWidth, ClientHeight);
      end
      else begin
        Pen.Style := psSolid;
        Pen.Mode  := pmCopy;
        Pen.Color := clBlack;
        Brush.Style := bsSolid;
      end;
    end;

    PaintFrame;

    Font:=Self.Font;
    Brush.Style:=bsClear;

    with R do begin
      Top := Top + FMargins.Top;
      Bottom := Bottom - FMargins.Bottom;
      Left := Left + FMargins.Left;
      Right := Right - FMargins.Right;
    end;

    if Assigned(FImages) and (FImageIndex<>-1) then begin
     IR := R;
     IR.Top := ClientRect.Top+FMargins.Top;
     IR.Right := IR.Left+FImages.Width;
     IR.Bottom := IR.Top+FImages.Height;
     R.Left := R.Left + FImages.Width + 4;
     FImages.Draw(Canvas, IR.Left, IR.Top, FImageIndex, True);
    end;

    Flags:=DT_CALCRECT or DT_EXPANDTABS or Als[FAlignments.Horz];
    if FWordBreak then Flags := Flags or DT_WORDBREAK;
    Flags := DrawTextBiDiModeFlags(Flags);
    DrawText(Handle, PChar(FCaption), -1, R, Flags);
    th:=R.Bottom-R.Top;

    case FAlignments.Vert of
     vaCenter: R.Top := ClientRect.Top + FMargins.Top+((ClientRect.Bottom-ClientRect.Top-th) div 2);
     vaTop:    R.Top := ClientRect.Top + FMargins.Top;
     vaBottom: R.Top := ClientRect.Bottom - FMargins.Bottom - th;
    end;

    R.Bottom:=R.Top+th;
    R.Left:=ClientRect.Left+FMargins.Left;
    R.Right:=ClientRect.Right-FMargins.Right;

    Flags := DT_EXPANDTABS or Als[FAlignments.Horz];
    if FWordBreak then Flags := Flags or DT_WORDBREAK;
    Flags := DrawTextBiDiModeFlags(Flags);
    DrawText(Handle, PChar(FCaption), -1, R, Flags);
  end;
end;

procedure TssBevel.PaintFrame;
var
  Color1, Color2, Temp: TColor;

  procedure BevelRect(const R: TRect);
  begin
    with Canvas do begin
      Pen.Color := Color1;
      PolyLine([Point(R.Left, R.Bottom), Point(R.Left, R.Top), Point(R.Right, R.Top)]);
      Pen.Color := Color2;
      PolyLine([Point(R.Right, R.Top), Point(R.Right, R.Bottom), Point(R.Left, R.Bottom)]);
    end;
  end;

  procedure BevelLine(C: TColor; X1, Y1, X2, Y2: Integer);
  begin
    with Canvas do
    begin
      Pen.Color := C;
      MoveTo(X1, Y1);
      LineTo(X2, Y2);
    end;
  end;

begin
  with Canvas do begin
    Pen.Width := 1;

    if FStyle = bsLowered then begin
      Color1 := FColorInner;
      Color2 := FColorOuter;
    end
    else begin
      Color1 := FColorOuter;
      Color2 := FColorInner;
    end;
    if not (csDesigning in ComponentState) and FHotTrack and FOver then begin
      Color1 := FHotTrackColor;
      Color2 := FHotTrackColor;
    end;

    case FShape of
      bsBox:
        begin
          if FStyle<>bsSingle then BevelRect(Rect(0, 0, Width - 1, Height - 1))
           else begin
             if beLeft in FEdges then BevelLine(Color1, 0, 0, 0, Height);
             if beRight in FEdges then BevelLine(Color1, Width-1, 0, Width-1, Height);
             if beTop in FEdges then BevelLine(Color1, 0, 0, Width, 0);
             if beBottom in FEdges then BevelLine(Color1, 0, Height-1, Width, Height-1);
           end;
        end;

      bsFrame:
        begin
          Temp := Color1;
          Color1 := Color2;
          BevelRect(Rect(1, 1, Width - 1, Height - 1));
          Color2 := Temp;
          Color1 := Temp;
          BevelRect(Rect(0, 0, Width - 2, Height - 2));
        end;

      bsTopLine:
        begin
          BevelLine(Color1, 0, 0, Width, 0);
          if FStyle <> bsSingle then BevelLine(Color2, 0, 1, Width, 1);
        end;

      bsBottomLine:
        begin
          BevelLine(Color1, 0, Height - 2, Width, Height - 2);
          if FStyle <> bsSingle then BevelLine(Color2, 0, Height - 1, Width, Height - 1);
        end;
      bsLeftLine:
        begin
          BevelLine(Color1, 0, 0, 0, Height);
          if FStyle <> bsSingle then BevelLine(Color2, 1, 0, 1, Height);
        end;
      bsRightLine:
        begin
          BevelLine(Color1, Width - 2, 0, Width - 2, Height);
          if FStyle <> bsSingle then BevelLine(Color2, Width - 1, 0, Width - 1, Height);
        end;
    end;
  end;
end;

procedure TssBevel.SetAlignments(const Value: TssAlignments);
begin
  FAlignments.Assign(Value);
end;

procedure TssBevel.SetCaption(const Value: TCaption);
begin
  FCaption := Value;
  Invalidate;
end;

procedure TssBevel.SetColorGrBegin(const Value: TColor);
begin
  FColorGrBegin := Value;
  Invalidate;
end;

procedure TssBevel.SetColorGrEnd(const Value: TColor);
begin
  FColorGrEnd := Value;
  Invalidate;
end;

procedure TssBevel.SetColorInner(const Value: TColor);
begin
  if Value <> FColorInner then begin
    FColorInner := Value;
    Invalidate;
  end;
end;

procedure TssBevel.SetColorOuter(const Value: TColor);
begin
  if Value <> FColorOuter then begin
    FColorOuter := Value;
    Invalidate;
  end;
end;

procedure TssBevel.SetEdges(const Value: TssBevelEdges);
begin
  FEdges := Value;
  Invalidate;
end;

procedure TssBevel.SetGradientDirection(const Value: TGradientDirection);
begin
  FGradientDirection := Value;
  Invalidate;
end;

procedure TssBevel.SetHotTrack(const Value: Boolean);
begin
  FHotTrack := Value;
  Invalidate;
end;

procedure TssBevel.SetHotTrackColor(const Value: TColor);
begin
  FHotTrackColor := Value;
  Invalidate;
end;

procedure TssBevel.SetImageIndex(const Value: TImageIndex);
begin
  if FImageIndex <> Value then begin
    FImageIndex := Value;
    Invalidate;
  end;
end;

procedure TssBevel.SetImages(const Value: TImageList);
begin
  if FImages <> nil then
    FImages.UnRegisterChanges(FImagesChangeLink);
  FImages := Value;

  if FImages <> nil then
    FImages.RegisterChanges(FImagesChangeLink);
  Invalidate;
end;

procedure TssBevel.SetMargins(const Value: TssMargins);
begin
  FMargins.Assign(Value);
end;

procedure TssBevel.SetShape(const Value: TBevelShape);
begin
  if Value <> FShape then begin
    FShape := Value;
    Invalidate;
  end;
end;

procedure TssBevel.SetStyle(const Value: TssBevelStyle);
begin
  if Value <> FStyle then begin
    FStyle := Value;
    Invalidate;
  end;
end;

procedure TssBevel.SetUseGradient(const Value: boolean);
begin
  FUseGradient := Value;
  Invalidate;
end;

{ TssMargins }

constructor TssMargins.Create(AOwner: TControl);
begin
  inherited Create;

  FControl:=AOwner;
  FLeftMargin:=4;
  FRightMargin:=4;
  FTopMargin:=0;
  FBottomMargin:=0;
end;

procedure TssMargins.SetBottomMargin(const Value: Integer);
begin
  FBottomMargin := Value;
  FControl.Invalidate;
end;

procedure TssMargins.SetLeftMargin(const Value: Integer);
begin
  FLeftMargin := Value;
  FControl.Invalidate;
end;

procedure TssMargins.SetRightMargin(const Value: Integer);
begin
  FRightMargin := Value;
  FControl.Invalidate;
end;

procedure TssMargins.SetTopMargin(const Value: Integer);
begin
  FTopMargin := Value;
  FControl.Invalidate;
end;

{ TssAlignments }

constructor TssAlignments.Create(AOwner: TControl);
begin
  FControl:=AOwner;
  FHorz:=taLeftJustify;
  FVert:=vaCenter;
end;

procedure TssAlignments.SetHorz(const Value: TAlignment);
begin
  FHorz := Value;
  FControl.Invalidate;
end;

procedure TssAlignments.SetVert(const Value: TssVertAlignment);
begin
  FVert := Value;
  FControl.Invalidate;
end;

procedure TssBevel.SetWordBreak(const Value: Boolean);
begin
  FWordBreak := Value;
  Invalidate;
end;

end.
