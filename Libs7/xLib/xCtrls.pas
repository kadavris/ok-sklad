unit xCtrls;

interface

uses
  SysUtils, Classes, Controls, Forms, Messages, Graphics, Windows, Contnrs;

var
  Delims: set of char = [' '];

type
  TxLabelExClickEvent = procedure (Sender: TObject; Index: Integer) of object;
  TxOnGetHintTextEvent = procedure (Sender: TObject; Index: Integer;
    var AText: string) of object;

  TxLabelEx = class;
  
  TxRgnType = (rgtRect);

  TxRegion = class
  private
    FRect: TRect;
    FHandle: HRGN;
    FType: TxRgnType;
  public
    procedure Add(ARect: TRect);
    constructor CreateRectRgn(ARect: TRect); virtual;
    destructor Destroy; override;
    function PointInRegion(const X, Y: Integer): Boolean;
    property Handle: HRGN read FHandle;
    property Rect: TRect read FRect;
  end;

  TxLabItem = class
  private
    FRegion: TxRegion;
    FCaption: TCaption;
    FActive: Boolean;
    FLabel: TxLabelEx;
    procedure SetActive(const Value: Boolean);
  public
    constructor Create(ACaption: string; AParent: TxLabelEx); virtual;
    destructor Destroy; override;
    procedure CreateRegion(ARect: TRect);

    property Region: TxRegion read FRegion;
    property Caption: TCaption read FCaption write FCaption;
    property Active: Boolean read FActive write SetActive;
  end;

  TxLabelEx = class(TGraphicControl)
  private
    FAlignment: TAlignment;
    FCaptions: TStrings;
    FHotTrack: Boolean;
    FHotTrackColor: TColor;
    FList: TObjectList;
    FOnItemClick: TxLabelExClickEvent;
    FTransparent: Boolean;
    FAutoSize: Boolean;
    FInResize: Boolean;
    FCurrItem: TxLabItem;
    FOnGetHintText: TxOnGetHintTextEvent;
    procedure SetAlignment(const Value: TAlignment);
    procedure SetCaptions(const Value: TStrings);
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure SetHotTrack(const Value: Boolean);
    procedure SetHotTrackColor(const Value: TColor);
    function GetItem(Index: Integer): TxLabItem;
    procedure CaptionsChange(Sender: TObject);
    procedure SetTransparent(const Value: Boolean);
    procedure SetAutoSize(const Value: Boolean); reintroduce;
    procedure DoAutoResize;
  protected
    FOver: Boolean;
    procedure Paint; override;
    procedure Loaded; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure Click; override;
    procedure Resize; override;
    procedure ResetRegions; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ResetItems; virtual;

    property Items[Index: Integer]: TxLabItem read GetItem;
  published
    property Anchors;
    property Alignment: TAlignment read FAlignment write SetAlignment
      default taLeftJustify;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default False;
    property Captions: TStrings read FCaptions write SetCaptions;
    property Color;
    property Font;
    property HotTrack: Boolean read FHotTrack write SetHotTrack default True;
    property HotTrackColor: TColor read FHotTrackColor write SetHotTrackColor
      default clBlue;
    property ShowHint;
    property Transparent: Boolean read FTransparent write SetTransparent
      default True;
    property OnItemClick: TxLabelExClickEvent read FOnItemClick write FOnItemClick;
    property OnGetHintText: TxOnGetHintTextEvent read FOnGetHintText write FOnGetHintText;
  end;

implementation

uses Types, xStrUtils;

//uses Windows;

procedure TxLabelEx.CaptionsChange(Sender: TObject);
begin
  ResetItems;
end;

procedure TxLabelEx.Click;
var
  i: Integer;
begin
  inherited;

  if Assigned(FOnItemClick) then begin
    for i := 0 to FList.Count - 1 do
      if Items[i].Active then begin
        FOnItemClick(Self, i);
        Exit;
      end;
  end;
end;

procedure TxLabelEx.CMMouseEnter(var Message: TMessage);
var
  i: Integer;
begin
  FOver := True;
  for i := 0 to FList.Count - 1 do
    Items[i].Active := False;
  if FHotTrack and not (csDesigning in ComponentState)
    then Cursor := crHandPoint;
end;

procedure TxLabelEx.CMMouseLeave(var Message: TMessage);
var
  i: Integer;
begin
  FOver := False;
  for i := 0 to FList.Count - 1 do
    Items[i].Active := False;
  FCurrItem := nil;  
end;

constructor TxLabelEx.Create(AOwner: TComponent);
begin
  inherited;

  FCaptions := TStringList.Create;
  (FCaptions as TStringList).OnChange := CaptionsChange;
  FHotTrack := True;
  FHotTrackColor := clBlue;
  FTransparent := True;

  FList := TObjectList.Create;

  Height := 13;
  Width := 100;
end;

destructor TxLabelEx.Destroy;
begin
  FCaptions.Free;
  FList.Free;

  inherited;
end;

procedure TxLabelEx.DoAutoResize;
var
  R: TRect;
  Flags: Longint;
  S: string;
begin
  FInResize := True;
  try
    S := DelCharsEx(FCaptions.Text, [#10, #13]);
    R := Self.ClientRect;
    R.Right := R.Left + Screen.Width;
    with Self.Canvas do begin
      Font := Self.Font;
      Flags := DT_CALCRECT or DT_EXPANDTABS;
      Flags := DrawTextBiDiModeFlags(Flags);
      DrawText(Handle, PChar(S), -1, R, Flags);
    end;  
    Self.Width := R.Right - R.Left;
  finally
    FInResize := False;
  end;
end;

function TxLabelEx.GetItem(Index: Integer): TxLabItem;
begin
  Result := TxLabItem(FList[Index]);
end;

procedure TxLabelEx.Loaded;
begin
  inherited;

  ResetItems;
end;

procedure TxLabelEx.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  i: Integer;
  FTxt: string;
begin
  inherited;

  for i := 0 to FList.Count - 1 do
    if Items[i].Region.PointInRegion(X, Y)
      then begin
        Items[i].Active := True;
        if ShowHint and (FCurrItem <> Items[i]) then begin
          Application.CancelHint;
          FTxt := '';
          if Assigned(FOnGetHintText) then FOnGetHintText(Self, i, FTxt);
          if FTxt <> '' then Self.Hint := FTxt;
          FCurrItem := Items[i];
        end;
      end
      else Items[i].Active := False;
//  Invalidate;
end;

procedure TxLabelEx.Paint;
const
  Alignments: array[TAlignment] of Longint = (DT_LEFT, DT_RIGHT, DT_CENTER);
var
  R, RR: TRect;
  Flags: Longint;
  S, SS, SrcS: string;
  i, j: Integer;
  X, Y, TW, TWW, TH, C, WIndex: Integer;
  FDone: Boolean;

  procedure LocalDrawText(ACanvas: TCanvas; const AText: string; R: TRect;
    AItem: TxLabItem);
  begin
    with ACanvas do begin
      if FOver and AItem.Active and FHotTrack then Font.Color := FHotTrackColor
        else Font.Color := Self.Font.Color;
      Flags := DT_EXPANDTABS or DT_VCENTER or Alignments[taLeftJustify];
      Flags := DrawTextBiDiModeFlags(Flags);
      DrawText(Handle, PChar(AText), -1, R, Flags);
    end;
  end;

begin
  R := ClientRect;
  with Canvas do begin
    if not FTransparent then begin
      Brush.Color := Self.Color;
      FillRect(R);
    end;
    Font := Self.Font;
    Brush.Style := bsClear;
    S := 'T';
    X := 0;
    Y := 0;

    R := Self.ClientRect;
    Flags := DT_CALCRECT or DT_EXPANDTABS;
    Flags := DrawTextBiDiModeFlags(Flags);
    DrawText(Handle, PChar(S), -1, R, Flags);
    TH := R.Bottom - R.Top;

    for i := 0 to FList.Count - 1 do begin
      FDone := False;
      SrcS := Items[i].Caption;

      while not FDone do begin
        C := WordCount(Trim(SrcS), Delims);
        TW := TextWidth(SrcS);
        if X + TW <= Self.ClientRect.Right then begin
          RR.Left := X; RR.Top := Y;
          RR.Right := X + TW; RR.Bottom := Y + TH;
          LocalDrawText(Canvas, SrcS, RR, Items[i]);
          X := X + TW;
          FDone := True;
          Break;
        end
        else begin
          if (C = 1) and (X = 0) then begin
            FDone := True;
            Break;
          end;

          SS := '';
          for j := C downto 1 do begin
            if (C = 1) then begin
              X := 0;
              Y := Y + TH;
              Break;
            end;
            if SS = ''
              then SS := ExtractWord(j, SrcS, Delims) + ' '
              else SS := ExtractWord(j, SrcS, Delims) + ' ' + SS;
            S := Copy(SrcS, 1, Length(SrcS) - Length(SS));
            TWW := TextWidth(S);

            if (X + TWW <= Self.ClientRect.Right) then begin
              //влезла
              RR.Left := X; RR.Top := Y;
              RR.Right := X + TWW; RR.Bottom := Y + TH;
              LocalDrawText(Canvas, S, RR, Items[i]);
              X := 0;
              Y := Y + TH;
              SrcS := SS;
              Break;
            end

          end; //for j
        end;
      end; //while
    end; //for i
  end;
end;

procedure TxLabelEx.ResetItems;
var
  i: Integer;
begin
  FList.Clear;
  for i := 0 to FCaptions.Count - 1 do
    FList.Add(TxLabItem.Create(FCaptions[i], Self));
  if FAutoSize then DoAutoResize;  
  ResetRegions;

  Invalidate;
end;

procedure TxLabelEx.ResetRegions;
var
  i, j, C: Integer;
  S, SrcS, SS: string;
  R, RR: TRect;
  X, Y, TW, TWW, TH: Integer;
  FDone: Boolean;
  Flags: Longint;
begin
  S := '';

  with Canvas do begin
    Font := Self.Font;

{    XL := 0; YL := 0;
    XB := 0; YB := 0;
    for i := 0 to FList.Count - 1 do begin
      R := Self.ClientRect;
      TW := TextWidth(Items[i].Caption);
      XB := XB + TW;
      YB := R.Bottom - R.Top;
      Items[i].CreateRegion(Rect(XL, YL, XB, YB));
      XL := XL + TW;
    end;}
    S := 'T';
    X := 0;
    Y := 0;

    R := Self.ClientRect;
    Flags := DT_CALCRECT or DT_EXPANDTABS;
    Flags := DrawTextBiDiModeFlags(Flags);
    DrawText(Handle, PChar(S), -1, R, Flags);
    TH := R.Bottom - R.Top;

    for i := 0 to FList.Count - 1 do begin
      Items[i].CreateRegion(Rect(0, 0, 0, 0));
      FDone := False;
      SrcS := Items[i].Caption;

      while not FDone do begin
        C := WordCount(Trim(SrcS), Delims);
        TW := TextWidth(SrcS);
        if X + TW <= Self.ClientRect.Right then begin
          RR.Left := X; RR.Top := Y;
          RR.Right := X + TW; RR.Bottom := Y + TH;
          Items[i].Region.Add(RR);
          X := X + TW;
          FDone := True;
          Break;
        end
        else begin
          if (C = 1) and (X = 0) then begin
            FDone := True;
            Break;
          end;

          SS := '';
          for j := C downto 1 do begin
            if (C = 1) then begin
              X := 0;
              Y := Y + TH;
              Break;
            end;
            if SS = ''
              then SS := ExtractWord(j, SrcS, Delims) + ' '
              else SS := ExtractWord(j, SrcS, Delims) + ' ' + SS;
            S := Copy(SrcS, 1, Length(SrcS) - Length(SS));
            TWW := TextWidth(S);

            if (X + TWW <= Self.ClientRect.Right) then begin
              //влезла
              RR.Left := X; RR.Top := Y;
              RR.Right := X + TWW; RR.Bottom := Y + TH;
              Items[i].Region.Add(RR);
              X := 0;
              Y := Y + TH;
              SrcS := SS;
              Break;
            end

          end; //for j
        end;
      end; //while
    end; //for i


  end;
end;

procedure TxLabelEx.Resize;
begin
  inherited;

  if FAutoSize and not FInResize then DoAutoResize;
  if Assigned(Parent) then ResetRegions;
end;

procedure TxLabelEx.SetAlignment(const Value: TAlignment);
begin
  FAlignment := Value;
  Invalidate;
end;

procedure TxLabelEx.SetAutoSize(const Value: Boolean);
begin
  FAutoSize := Value;
  DoAutoResize; 
end;

procedure TxLabelEx.SetCaptions(const Value: TStrings);
begin
  FCaptions.Assign(Value);
  ResetItems;
end;

procedure TxLabelEx.SetHotTrack(const Value: Boolean);
begin
  FHotTrack := Value;
  Invalidate;
end;

procedure TxLabelEx.SetHotTrackColor(const Value: TColor);
begin
  FHotTrackColor := Value;
  Invalidate;
end;

{ TxRegion }

procedure TxRegion.Add(ARect: TRect);
var
  FH: HRGN;
begin
  FH := CreateRectRgnIndirect(ARect);
  CombineRgn(FHandle, FH, FHandle, RGN_OR);
  DeleteObject(FH);
end;

constructor TxRegion.CreateRectRgn(ARect: TRect);
begin
  FRect := ARect;
  FHandle := CreateRectRgnIndirect(ARect);
  FType := rgtRect;
end;

destructor TxRegion.Destroy;
begin
  DeleteObject(FHandle);

  inherited;
end;

function TxRegion.PointInRegion(const X, Y: Integer): Boolean;
begin
  Result := PtInRegion(FHandle, X, Y);
end;

{ TxLabItem }

constructor TxLabItem.Create(ACaption: string; AParent: TxLabelEx);
begin
  Caption := ACaption;
  FLabel := AParent;
end;

procedure TxLabItem.CreateRegion(ARect: TRect);
begin
  if Assigned(FRegion) then FRegion.Free;
  FRegion := TxRegion.CreateRectRgn(ARect);
end;

destructor TxLabItem.Destroy;
begin
  if Assigned(FRegion) then FreeAndNil(FRegion);

  inherited;
end;

procedure TxLabItem.SetActive(const Value: Boolean);
begin
  if FActive <> Value then begin
    FActive := Value;
    FLabel.Invalidate;
  end;
end;

procedure TxLabelEx.SetTransparent(const Value: Boolean);
begin
  FTransparent := Value;
  Invalidate;
end;

end.
