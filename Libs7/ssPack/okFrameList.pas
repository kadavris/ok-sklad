{$IFNDEF PKG}
{$I ok_sklad.inc}
{$ENDIF}
unit okFrameList;

interface

uses 
  {$IFDEF MAIN}BaseFrame,{$ENDIF}
  Classes, Forms;

type
  {$IFDEF MAIN}
  TokBaseFrame = TssBaseFrame;
  {$ELSE}
  TokBaseFrame = TFrame;
  {$ENDIF}

type
  TokFrameList = class(TComponent)
    private
      FList: TList;
      FCurrentFrame: string;
      FOnChange: TNotifyEvent;

      procedure SetCurrFrame(const Value: string; GType: integer);
      function  GetItem(Index: integer): TokBaseFrame;
      function  GetFramesCount: integer;
      procedure SetCurrentFrame(const Value: string);

    public
      FcurrFrame: TokBaseFrame;

      constructor Create(AOwner: TComponent); override;
      destructor  Destroy; override;
      procedure Clear;
      procedure FreeAndClear;
      procedure Add(AFrame: TFrame; const MakeCurrent: boolean = false);
      procedure Delete(const AFrame: string);
      function  FrameInList(const AFrameName: string; GType: integer): boolean;
      procedure SetCaptions;
      procedure SetOnDate(const ADate: TDateTime);
      procedure SetFrame(const AFrame: string; GType: integer);

      property CurrentFrame: string read FCurrentFrame write SetCurrentFrame;
      property Items[Index: integer]: TokBaseFrame read GetItem;
      property FramesCount: integer read GetFramesCount;

    published
      property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

implementation

uses
  SysUtils;

//==============================================================================================
procedure TokFrameList.Add(AFrame: TFrame; const MakeCurrent: Boolean = False);
begin
  if not FrameInList(AFrame.ClassName, AFrame.Tag) then begin
    FList.Add(AFrame);

    if MakeCurrent
      then SetFrame(AFrame.ClassName, AFrame.Tag)
      else AFrame.Visible := False;
  end;
end;

//==============================================================================================
procedure TokFrameList.Clear;
begin
  while FList.Count > 0 do FList.Delete(0);
  FcurrFrame := nil;
  FCurrentFrame := '';
end;

//==============================================================================================
constructor TokFrameList.Create(AOwner: TComponent);
begin
  inherited;

  FList := TList.Create;
end;

//==============================================================================================
procedure TokFrameList.Delete(const AFrame: string);
  var
    i: Integer;
begin
  for i := 0 to FList.Count - 1 do
    if AFrame = TFrame(FList.Items[i]).ClassName then begin
      if TokBaseFrame(FList.Items[i]) = FcurrFrame then CurrentFrame := '';
      FList.Delete(i);
      Exit;
    end;
end;

//==============================================================================================
destructor TokFrameList.Destroy;
begin
  FreeAndClear;
  FList.Free;

  inherited;
end;

//==============================================================================================
function TokFrameList.FrameInList(const AFrameName: string; GType: integer): boolean;
  var
    i: Integer;
begin
  Result := False;

  for i := 0 to FList.Count - 1 do
    if (TFrame(FList.Items[i]).ClassName = AFrameName) and (TFrame(FList.Items[i]).Tag = GType)
    then begin
      Result := True;
      Exit;
    end;
end;

//==============================================================================================
procedure TokFrameList.FreeAndClear;
  var
    i: Integer;
begin
  if FList.Count > 0 then
    for i := 0 to FList.Count - 1 do begin
      {$IFNDEF PKG}
      TokBaseFrame(FList.Items[i]).DoClose;
      {$ENDIF}
      TokBaseFrame(FList.Items[i]).Free;
      FList.Items[i] := nil;
    end;
  Clear;
end;

//==============================================================================================
function TokFrameList.GetFramesCount: integer;
begin
  Result := FList.Count;
end;

//==============================================================================================
function TokFrameList.GetItem(Index: integer): TokBaseFrame;
begin
  Result := TokBaseFrame(FList[Index]);
end;

//==============================================================================================
procedure TokFrameList.SetCaptions;
  {$IFNDEF PKG}
  var i: Integer;
  {$ENDIF}
begin
  {$IFNDEF PKG}
  for i := 0 to FList.Count - 1 do
    TokBaseFrame(FList.Items[i]).SetCaptions;
  {$ENDIF}
end;

//==============================================================================================
procedure TokFrameList.SetCurrentFrame(const Value: string);
begin
 {$IFNDEF PKG}
  if (FCurrentFrame <> Value) then begin
    if FcurrFrame <> nil then FcurrFrame.Visible := False;
    SetCurrFrame(Value, 0);
    FCurrentFrame := Value;
    if Value <> '' then begin
      FcurrFrame.CanRefresh := True;
      FcurrFrame.Visible := True;
    end;
  end;
 {$ENDIF}
end;

//==============================================================================================
procedure TokFrameList.SetCurrFrame(const Value: string; GType: integer);
  {$IFNDEF PKG}
  var i: Integer;
  {$ENDIF}
begin
  {$IFNDEF PKG}
  if Value = ''
    then FcurrFrame := nil
    else begin
      for i := 0 to FList.Count - 1 do
        if (TFrame(FList.Items[i]).ClassName = Value) and ((TFrame(FList.Items[i]).Tag = GType) or (Value = 'TfmWMat') or (Value = 'TfmMaterials') or (Value = 'TfmKAgent') or (Value = 'TfmFinance')) then begin
          if FcurrFrame is TokBaseFrame then begin
            FcurrFrame.Enabled := False;
            FcurrFrame.UpdateActionList;
          end;
          FcurrFrame := FList.Items[i];
          FcurrFrame.Enabled := True;
          FcurrFrame.UpdateActionList;
          if Assigned(FOnChange) then FOnChange(Self);
          Exit;
        end;
      end;
  {$ENDIF}
end;

//==============================================================================================
procedure TokFrameList.SetFrame(const AFrame: string; GType: integer);
begin
  {$IFNDEF PKG}
  if (FCurrentFrame <> AFrame) or ((FCurrentFrame = AFrame) and (FcurrFrame.Tag <> GType)) then begin
    if FcurrFrame <> nil then begin
      FcurrFrame.Visible := False;
      FcurrFrame.CanRefresh := False;
    end;
    SetCurrFrame(AFrame, GType);
    FCurrentFrame := AFrame;
    if AFrame <> '' then FcurrFrame.Visible := True;
  end;
  {$ENDIF}
end;

//==============================================================================================
procedure TokFrameList.SetOnDate(const ADate: TDateTime);
  {$IFNDEF PKG}
  var i: integer;
  {$ENDIF}
begin
  {$IFNDEF PKG}
  for i := 0 to FList.Count - 1 do TokBaseFrame(FList.Items[i]).OnDate := ADate;
  {$ENDIF}
end;

end.
