unit ssPeriod;

interface

uses
  SysUtils, Classes, Controls, cxDropDownEdit, StdCtrls, cxSpinEdit, cxCalendar,
  TB2Item, ssSpeedButton, TBSkinPlus, ssBevel, Graphics, ssGraphUtil, xLngManager;

const
  DefEdOffset = 80;
  DefEdInterval = 4;

type
  TssPeriodType = (ptMonth, ptQuarter, ptYear, ptCustom);
  TssPeriodTypeSet = set of TssPeriodType;
  TssPeriodViewType = (vtNormal, vtShort);

  TssPeriod = class(TWinControl)
    private
      FEditorsOffset: Cardinal;
      FCapType: TCaption;
      FPeriodType: TssPeriodType;
      FEditorsInterval: Cardinal;
      FCapMonth: TCaption;
      FCapYear: TCaption;
      FCapQuarter: TCaption;
      FFromDate: TDateTime;
      FToDate: TDateTime;
      FCapFrom: TCaption;
      FCapTo: TCaption;
      FOnChange: TNotifyEvent;
      FGoNextOnEnter: Boolean;
      FRegistryPath: string;
      FPeriodTypes: TssPeriodTypeSet;
      FViewType: TssPeriodViewType;
      FDDArrow: TssSpeedButton;
      FAutoAlign: Boolean;
      FBaseDate: TDateTime;
      FCapSelPeriod: TCaption;
      FBvl: TssBevel;
      FFont: TFont;
      //FlangMan: TxLngManager;

      function  ValidDate(const ADate: string): Boolean;
      procedure SetEditorsOffset(const Value: Cardinal);
      procedure SetCapType(const Value: TCaption);
      procedure SetPeriodType(const Value: TssPeriodType);
      procedure SetEditorsInterval(const Value: Cardinal);
      procedure SetCapMonth(const Value: TCaption);
      procedure EditorsKeyPress(Sender: TObject; var Key: Char);
      procedure DateKeyPress(Sender: TObject; var Key: Char);
      procedure DateExit(Sender: TObject);
      procedure EditorsChange(Sender: TObject);
      procedure DateChange(Sender: TObject);
      procedure fontChange(Sender: TObject);
      procedure ResetPeriod;
      procedure CalcBounds;
      procedure SetCapQuarter(const Value: TCaption);
      procedure SetCapYear(const Value: TCaption);
      procedure SetFromDate(const Value: TDateTime);
      procedure SetToDate(const Value: TDateTime);
      procedure SetCapFrom(const Value: TCaption);
      procedure SetCapTo(const Value: TCaption);
      procedure SetPeriodTypes(const Value: TssPeriodTypeSet);
      procedure SetViewType(const Value: TssPeriodViewType);
      procedure SetAutoAlign(const Value: Boolean);
      function  GetSkin: TTBBaseSkin;
      procedure SetSkin(const Value: TTBBaseSkin);
      procedure MnuItemClick(Sender: TObject);
      procedure SetCapSelPeriod(const Value: TCaption);
      //function rs(s,r:String; spmode: Integer = 0): String;

    protected
      F: Boolean;
      FTypeMenu: TTBPopupMenu;
      FlType: TLabel;
      FcbType: TcxComboBox;
      FcbMonth: TcxComboBox;
      FcbQuarter: TcxComboBox;
      FedYear: TcxSpinEdit;
      FedFromDate: TcxDateEdit;
      FedToDate: TcxDateEdit;
      FlPeriod: TLabel;
      FlPeriod2: TLabel;
      FLocked: Boolean;

      procedure cbTypeChange(Sender: TObject);
      procedure Loaded; override;
      procedure RebuildMenu;
      procedure RealignControls;
      procedure ReloadTypes; virtual;
      procedure DoChange; virtual;
      procedure Lock;
      procedure Unlock;

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure SaveToRegistry;
      procedure LoadFromRegistry;

      property FromDate: TDateTime read FFromDate write SetFromDate;
      property ToDate: TDateTime read FToDate write SetToDate;
      property BaseDate: TDateTime read FBaseDate write FBaseDate;
      property edFromDate: TcxDateEdit read FedFromDate;
      property edToDate: TcxDateEdit read FedToDate;

    published
      property AutoAlign: Boolean read FAutoAlign write SetAutoAlign default False;
      property CapType: TCaption read FCapType write SetCapType;
      property CapMonth: TCaption read FCapMonth write SetCapMonth;
      property CapYear: TCaption read FCapYear write SetCapYear;
      property CapQuarter: TCaption read FCapQuarter write SetCapQuarter;
      property CapFrom: TCaption read FCapFrom write SetCapFrom;
      property CapTo: TCaption read FCapTo write SetCapTo;
      property CapSelPeriod: TCaption read FCapSelPeriod write SetCapSelPeriod;
      property EditorsOffset: Cardinal read FEditorsOffset write SetEditorsOffset default DefEdOffset;
      property EditorsInterval: Cardinal read FEditorsInterval write SetEditorsInterval default DefEdInterval;
      //property Font: TFont read FFont;
      property GoNextOnEnter: Boolean read FGoNextOnEnter write FGoNextOnEnter default True;
      property RegistryPath: string read FRegistryPath write FRegistryPath;
      property PeriodType: TssPeriodType read FPeriodType write SetPeriodType default ptCustom;
      property PeriodTypes: TssPeriodTypeSet read FPeriodTypes write SetPeriodTypes default [ptMonth..ptCustom];
      property PopupSkin: TTBBaseSkin read GetSkin write SetSkin;

      property OnChange: TNotifyEvent read FOnChange write FOnChange;

      property TabOrder;
      property TabStop;

      property ViewType: TssPeriodViewType read FViewType write SetViewType default vtNormal;
      //property langMan: TxLngManager read FlangMan write FlangMan;
  end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  Windows, Messages, ssDateUtils, DateUtils, ssRegUtils, Menus,
  cxTextEdit, Variants;

//==============================================================================================
procedure TssPeriod.CalcBounds;
  var
    y, m: Word;
begin
  try
    case FPeriodType of
      ptYear:
        begin
          y := StrToInt(FedYear.EditText);
          FFromDate := EncodeDate(y, 1, 1);
          FToDate := EncodeDate(y, 12, 31);
        end;

      ptMonth:
        begin
          y := StrToInt(FedYear.EditText);
          m := FcbMonth.ItemIndex + 1;
          FFromDate := EncodeDate(y, m, 1);
          FToDate := EncodeDate(y, m, DaysInAMonth(y, m));
        end;

      ptQuarter:
        begin
          y := StrToInt(FedYear.EditText);
          m := FcbQuarter.ItemIndex * 3 + 1;
          FFromDate := EncodeDate(y, m, 1);
          FToDate := EncodeDate(y, m + 2, DaysInAMonth(y, m + 2));
        end;

      ptCustom:
        begin
          if not ValidDate(FedFromDate.EditText) 
            then FFromDate := MinDateTime
            else FFromDate := StrToDate(FedFromDate.EditText);

          if not ValidDate(FedToDate.EditText) 
            then FToDate := MaxDateTime
            else FToDate := StrToDate(FedToDate.EditText);
        end;
    end;

  except
    if not ValidDate(FedFromDate.EditText) then FFromDate := MinDateTime;
    if not ValidDate(FedToDate.EditText) then FToDate := MaxDateTime;
  end;
end;

//==============================================================================================
procedure TssPeriod.cbTypeChange(Sender: TObject);
begin
  FLocked := True;

  try
    FPeriodType := TssPeriodType(FcbType.Properties.Items.Objects[FcbType.ItemIndex]);
    ResetPeriod;
    //RealignControls;
    FromDate := FromDate;
    ToDate := ToDate;
    CalcBounds;

  finally
    FLocked := False;
  end;

  DoChange;
end;

//==============================================================================================
constructor TssPeriod.Create(AOwner: TComponent);
  var
    i: Integer;
begin
  //FlangMan := nil;
  inherited;

  Width := 286;
  Height := 50;

  FEditorsOffset := DefEdOffset;
  FEditorsInterval := DefEdInterval;
  FCapType := 'Period Type ';
  FCapMonth := 'Month:';
  FCapQuarter := 'Quarter:';
  FCapYear := 'Year:';
  FCapFrom := 'From:';
  FCapTo := 'To:';
  FCapSelPeriod := 'Period select';
  FPeriodType := ptCustom;
  FViewType := vtNormal;
  FPeriodTypes := [ptMonth..ptCustom];
  FGoNextOnEnter := True;

  FcbType := TcxComboBox.Create(Self);
  with FcbType do begin
    Parent := Self;
    Left := DefEdOffset;
    Anchors := Anchors + [akRight];

    ReloadTypes;

    Properties.OnEditValueChanged := cbTypeChange;
    Properties.DropDownListStyle := lsFixedList;

    OnKeyPress := EditorsKeyPress;
  end;

  FlType := TLabel.Create(Self);
  with FlType do begin
    Parent := Self;
    Top := 4;
    Caption := FCapType;
  end;

  FcbMonth := TcxComboBox.Create(Self);
  with FcbMonth do begin
    Parent := Self;
    Left := DefEdOffset;
    Top := FcbType.Height + Integer(FEditorsInterval);
    Width := 80;

    for i := 1 to 12 do Properties.Items.Add('Month ' + IntToStr(i));

    ItemIndex := 0;
    Properties.DropDownRows := 12;
    Properties.DropDownListStyle := lsFixedList;
    Properties.OnEditValueChanged := EditorsChange;
    OnKeyPress := EditorsKeyPress;
  end;

  FcbQuarter := TcxComboBox.Create(Self);
  with FcbQuarter do begin
    Parent := Self;
    Left := DefEdOffset;
    Top := FcbType.Height + Integer(FEditorsInterval);
    Width := 80;

    for i := 1 to 4 do Properties.Items.Add('Quarter ' + IntToStr(i));

    ItemIndex := 0;
    Properties.DropDownRows := 4;
    Properties.DropDownListStyle := lsFixedList;
    Properties.OnEditValueChanged := EditorsChange;
    OnKeyPress := EditorsKeyPress;
  end;

  FedYear := TcxSpinEdit.Create(Self);
  with FedYear do begin
    Width := 40;
    Parent := Self;
    Properties.ImmediatePost := True;
    Properties.OnEditValueChanged := EditorsChange;
    OnKeyPress := EditorsKeyPress;
    BeepOnEnter := False;
  end;

  FedFromDate := TcxDateEdit.Create(Self);
  with FedFromDate do begin
    Parent := Self;
    Width := 90;
    Properties.OnChange := DateChange;
    Properties.OnEditValueChanged := EditorsChange;
    OnKeyPress := DateKeyPress;
    OnExit := DateExit;
    BeepOnEnter := False;
  end;

  FedToDate := TcxDateEdit.Create(Self);
  with FedToDate do begin
    Parent := Self;
    Width := 90;
    Anchors := [akTop, akRight];
    Properties.OnChange := DateChange;
    Properties.OnEditValueChanged := EditorsChange;
    OnKeyPress := DateKeyPress;
    OnExit := DateExit;
    BeepOnEnter := False;
  end;

  FlPeriod := TLabel.Create(Self);
  with FlPeriod do begin
    Parent := Self;
  end;

  FlPeriod2 := TLabel.Create(Self);
  with FlPeriod2 do begin
    Parent := Self;
    Caption := FCapYear;
  end;

  FTypeMenu := TTBPopupMenu.Create(Self);
  with FTypeMenu do begin
    Alignment := paRight;
  end;

  FDDArrow := TssSpeedButton.Create(Self);
  with FDDArrow do begin
    //AllwaysShowFrame := True;
    Anchors := [akRight, akTop];
    Visible := False;
    Style := ssbsUser;
    DroppedDown := True;
    PopupYOffset := 4;
    Width := 15;
    Top := -100;
    ShowHint := True;
    Hint := FCapSelPeriod;
    Height := FedYear.Height - 2;
    PopupMenu := FTypeMenu;
    Parent := Self;
  end;

  FBvl := TssBevel.Create(Self);
  with FBvl do begin
    Alignments.Horz := taCenter;
    GradientDirection := gdVertical;
    UseGradient := True;
    ColorGrBegin := clWindow;
    ColorGrEnd := clWindow;
    ColorOuter := clBtnShadow;
    Color := clWindow;
    Style := bsSingle;
    Top := -1000;
    Height := FedYear.Height - 2;
    Parent := Self;
  end;

  FcbType.ItemIndex := Ord(FPeriodType);
  RealignControls;
  PeriodType := PeriodType;
  FromDate := IncYear(Date, -5); // to make it show some old documents by default
  ToDate := Date;

  FFont := TFont.Create;
  FFont.OnChange := fontChange;
end;

//==============================================================================================
procedure TssPeriod.fontChange(Sender: TObject);
begin
  try
    FlType.Font := FFont;
    FlPeriod.Font := FFont;
    FlPeriod2.Font := FFont;
    FcbType.Style.Font := FFont;;
    FcbMonth.Style.Font := FFont;
    FcbQuarter.Style.Font := FFont;
    FedYear.Style.Font := FFont;
    FedFromDate.Style.Font := FFont;
    FedToDate.Style.Font := FFont;
  except
  end;
end;

//==============================================================================================
procedure TssPeriod.DateChange(Sender: TObject);
begin
  if Sender is TcxDateEdit then begin
    if not F then begin
      F := True;
      with TcxDateEdit(Sender) do
        if Text = '' then begin
          Lock;
          EditValue := 0;
          EditText := '';
          Unlock;
          EditorsChange(Sender);
        end;
      F := False;
    end;
  end;
end;

//==============================================================================================
procedure TssPeriod.DateExit(Sender: TObject);
begin
  {with Sender as TcxDateEdit do begin
    if DateToStr(Date) <> DateToStr(EditValue) then DoChange;
  end;
  }
end;

//==============================================================================================
procedure TssPeriod.DateKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    if FGoNextOnEnter then begin
      Key := #0;
      SendMessage(Self.Parent.Handle, WM_NEXTDLGCTL, 0, 0);
    end
    else if Sender is TcxDateEdit then begin
      with TcxDateEdit(Sender) do begin
        try
          Date := StrToDate(Text);
        except
          //Date := 0;
        end;

        EditValue := Date;
        if Sender = FedFromDate
          then if Text = ''
            then FFromDate := MinDateTime
            else FFromDate := Date
        else if Sender = FedToDate
          then if Text = ''
            then FToDate := MaxDateTime
            else FToDate := Date;
      end;
      DoChange;
    end;
end;

//==============================================================================================
destructor TssPeriod.Destroy;
begin
  FcbType.Free;
  FcbMonth.Free;
  FcbQuarter.Free;
  FedYear.Free;
  FlType.Free;
  FlPeriod.Free;
  FlPeriod2.Free;
  FTypeMenu.Free;
  FDDArrow.Free;
  FBvl.Free;

  inherited;
end;

//==============================================================================================
procedure TssPeriod.DoChange;
begin
  if not FLocked and Assigned(FOnChange) then FOnChange(Self);
end;

//==============================================================================================
procedure TssPeriod.EditorsChange(Sender: TObject);
begin
  CalcBounds;
  DoChange;
end;

//==============================================================================================
procedure TssPeriod.EditorsKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then begin
    if FGoNextOnEnter then begin
      Key := #0;
      SendMessage(Self.Parent.Handle, WM_NEXTDLGCTL, 0, 0);
    end
  end
  else if Sender is TcxDateEdit then begin
    with TcxDateEdit(Sender) do begin
      //Date := StrToDate(Text);
      //EditValue := Date;
    end;
    //DoChange;
  end;
end;

//==============================================================================================
function TssPeriod.GetSkin: TTBBaseSkin;
begin
  Result := FTypeMenu.Skin;
end;

//==============================================================================================
procedure TssPeriod.Loaded;
begin
  inherited;

  ReloadTypes;
  RealignControls;
  ResetPeriod;
end;

//==============================================================================================
procedure TssPeriod.LoadFromRegistry;
  var
    intTmp: Integer;
    intDT: TDateTime;
begin
  if FRegistryPath <> '' then begin
    if ReadFromRegInt(FRegistryPath, Self.Name + '_PeriodType', intTmp)
      then PeriodType := TssPeriodType(intTmp);

    if (PeriodType = ptCustom) and ReadFromRegDate(FRegistryPath, Self.Name + '_FromDate', intDT)
      then begin
        if intDT > 0
          then FromDate := intDT
          else begin
            Lock;
            FromDate := 0;
            FedFromDate.Date := 0;
            FedFromDate.EditText := '';
            Unlock;
          end;
      end;
  end;
end;

//==============================================================================================
procedure TssPeriod.Lock;
begin
  FLocked := True;
end;

//==============================================================================================
procedure TssPeriod.MnuItemClick(Sender: TObject);
begin
  (Sender as TTBItem).Checked := True;
  FcbType.ItemIndex := FTypeMenu.Items.IndexOf(Sender as TTBItem) - 2;
end;

//==============================================================================================
procedure TssPeriod.RealignControls;
begin
  FcbType.Left := FEditorsOffset;

  case FViewType of
    vtShort:
      begin
        FcbType.Top := -100;
        FlType.Top := -100;
        FcbType.Width := Self.Width - FcbType.Left - FDDArrow.Width - 2;
        FcbMonth.Top := 0;
        FDDArrow.Visible := True;
        FDDArrow.Top := 1;
        FDDArrow.Left := Self.Width - FDDArrow.Width;
        FBvl.Top := 1;
        FBvl.Left := FlPeriod.Left;
      end;

    vtNormal:
      begin
        FcbType.Width := Self.Width - FcbType.Left;
        FcbMonth.Top := FcbType.Height + Integer(FEditorsInterval);
        FcbType.Top := 0;
        FlType.Top := 0;
        FDDArrow.Top := -100;
        FBvl.Top := -1000;
      end;
  end;

  if not FAutoAlign then begin
    FcbMonth.Left := FEditorsOffset;
  end
  else begin
    FcbMonth.Left := FlPeriod.Left + FlPeriod.Width + 4;
  end;

  FcbQuarter.Left := FcbMonth.Left;
  FedFromDate.Left := FcbMonth.Left;
  FcbQuarter.Top := FcbMonth.Top;
  FedFromDate.Top := FcbMonth.Top;
  FlPeriod2.Left := FcbMonth.Width + FcbMonth.Left + 8;

  FlPeriod.Top := FcbMonth.Top + 4;

  FlPeriod2.Top := FlPeriod.Top;

  FedToDate.Left := FcbType.Left + FcbType.Width - FedToDate.Width;
  FedToDate.Top := FcbMonth.Top;

  FedYear.Top := FcbMonth.Top;
  FedYear.Width := 50;
  if (FPeriodType = ptYear) and (FViewType = vtNormal)
    then begin
      FedYear.Left := FcbMonth.Left;
      FedYear.Anchors := [akTop, akLeft];
      FlPeriod2.Anchors := [akTop, akLeft];
    end
    else begin
      FedYear.Left := FcbType.Left + FcbType.Width - FedYear.Width;

      if FPeriodType = ptCustom
        then FlPeriod2.Left := FedToDate.Left - FlPeriod2.Width - 4
        else FlPeriod2.Left := FedYear.Left - FlPeriod2.Width - 4;

      FedYear.Anchors := [akTop, akRight];
      FlPeriod2.Anchors := [akTop, akRight];
    end;

  FBvl.Width := FlPeriod2.Left - 6 - FBvl.Left;
  Self.invalidate;
end;

//==============================================================================================
procedure TssPeriod.RebuildMenu;
  var
    FItem: TTBItem;
    i: Integer;
begin
  if FTypeMenu = nil then Exit;
  FTypeMenu.Items.Clear;

  FItem := TTBItem.Create(FTypeMenu);
  FItem.Caption := FCapSelPeriod;
  FItem.Options := [tboDefault];
  FTypeMenu.Items.Insert(0, FItem);

  FTypeMenu.Items.Add(TTBSeparatorItem.Create(FTypeMenu));
  for i := 0 to FcbType.Properties.Items.Count - 1 do begin
    FItem := TTBItem.Create(FTypeMenu);
    FItem.GroupIndex := 10;
    //FItem.AutoCheck := True;
    FItem.Caption := FcbType.Properties.Items[i];
    FItem.OnClick := MnuItemClick;
    if i = FcbType.ItemIndex then FItem.Checked := True;
    FTypeMenu.Items.Insert(i + 2, FItem);
  end;
end;

//==============================================================================================
procedure TssPeriod.ReloadTypes;
begin
  with FcbType do begin
    Properties.Items.Clear;
    if ptMonth in FPeriodTypes   then Properties.Items.AddObject('For Month', Pointer(ptMonth));
    if ptQuarter in FPeriodTypes then Properties.Items.AddObject('For Quarter', Pointer(ptQuarter));
    if ptYear in FPeriodTypes    then Properties.Items.AddObject('For Year', Pointer(ptYear));
    if ptCustom in FPeriodTypes  then Properties.Items.AddObject('Custom Period', Pointer(ptCustom));
  end;

  RebuildMenu;

  FcbType.ItemIndex := FcbType.Properties.Items.IndexOfObject(TObject(Pointer(FPeriodType)));
end;

//==============================================================================================
procedure TssPeriod.SetPeriodType(const Value: TssPeriodType);
begin
  FPeriodType := Value;

  FcbType.ItemIndex := FcbType.Properties.Items.IndexOfObject(TObject(Pointer(Value)));

  if FTypeMenu.Items.Count > 0 then FTypeMenu.Items.Items[FcbType.ItemIndex + 2].Checked := True;

  ResetPeriod;
  RealignControls;
  FromDate := FromDate;
  ToDate := ToDate;
end;

//==============================================================================================
procedure TssPeriod.SetPeriodTypes(const Value: TssPeriodTypeSet);
begin
  if (Value = []) or (Value = FPeriodTypes) then Exit;

  FPeriodTypes := Value;

  if not (FPeriodType in Value) then begin
    if ptMonth in Value then PeriodType := ptMonth
    else if ptQuarter in Value then PeriodType := ptQuarter
    else if ptYear in Value then PeriodType := ptYear
    else if ptCustom in Value then PeriodType := ptCustom;
  end
  else PeriodType := PeriodType;
end;

//==============================================================================================
procedure TssPeriod.ResetPeriod;
begin
  FBvl.Visible := False;
  FlPeriod.Visible := True;

  case FPeriodType of
    ptMonth:
      begin
        FcbMonth.Visible := True;
        FlPeriod2.Visible := True;
        FedYear.Visible := True;
        FcbQuarter.Visible := False;
        FedFromDate.Visible := False;
        FedToDate.Visible := False;
        if csDesigning in ComponentState then begin
          FcbMonth.Parent := Self;
          FlPeriod2.Parent := Self;
          FedYear.Parent := Self;
          FcbQuarter.Parent := nil;
          FedFromDate.Parent := nil;
          FedToDate.Parent := nil;
        end;

        FlPeriod.Caption := FCapMonth;
        FlPeriod2.Caption := FCapYear;
      end;

    ptQuarter:
      begin
        FcbMonth.Visible := False;
        FlPeriod2.Visible := True;
        FedYear.Visible := True;
        FcbQuarter.Visible := True;
        FedFromDate.Visible := False;
        FedToDate.Visible := False;
        if csDesigning in ComponentState then begin
          FcbMonth.Parent := nil;
          FlPeriod2.Parent := Self;
          FedYear.Parent := Self;
          FcbQuarter.Parent := Self;
          FedFromDate.Parent := nil;
          FedToDate.Parent := nil;
        end;

        FlPeriod.Caption := FCapQuarter;
        FlPeriod2.Caption := FCapYear;
      end;

    ptYear:
      begin
        FcbMonth.Visible := False;

        if FViewType = vtNormal then begin
          FlPeriod2.Visible := False;
          FlPeriod.Caption := FCapYear;
        end
        else begin
          FlPeriod2.Visible := True;
          FlPeriod.Visible := False;
          FlPeriod2.Caption := FCapYear;
          FBvl.Visible := True;
          FBvl.Caption := FcbMonth.Properties.Items[0] + ' - ' + FcbMonth.Properties.Items[11];
        end;

        FedYear.Visible := True;
        FcbQuarter.Visible := False;
        FedFromDate.Visible := False;
        FedToDate.Visible := False;

        if csDesigning in ComponentState then begin
          FcbMonth.Parent := nil;
          FlPeriod2.Parent := nil;
          FedYear.Parent := Self;
          FcbQuarter.Parent := nil;
          FedFromDate.Parent := nil;
          FedToDate.Parent := nil;
        end;
      end;

    ptCustom:
      begin
        FcbMonth.Visible := False;
        FedYear.Visible := False;
        FcbQuarter.Visible := False;
        FlPeriod2.Visible := True;
        FedFromDate.Visible := True;
        FedToDate.Visible := True;
        if csDesigning in ComponentState then begin
          FcbMonth.Parent := nil;
          FedYear.Parent := nil;
          FcbQuarter.Parent := nil;
          FlPeriod2.Parent := Self;
          FedFromDate.Parent := Self;
          FedToDate.Parent := Self;
        end;
        FlPeriod.Caption := FCapFrom;
        FlPeriod2.Caption := FCapTo;
      end;
  end;

  RealignControls;
end;

//==============================================================================================
procedure TssPeriod.SaveToRegistry;
begin
  if FRegistryPath <> '' then begin
    WriteToRegInt(FRegistryPath, Self.Name + '_PeriodType', Ord(FPeriodType));
    WriteToRegDate(FRegistryPath, Self.Name + '_FromDate', FromDate);
  end;
end;

//==============================================================================================
procedure TssPeriod.SetAutoAlign(const Value: Boolean);
begin
  FAutoAlign := Value;
  RealignControls;
end;

//==============================================================================================
procedure TssPeriod.SetCapFrom(const Value: TCaption);
begin
  FCapFrom := Value;
  ResetPeriod;
end;

//==============================================================================================
procedure TssPeriod.SetCapMonth(const Value: TCaption);
begin
  FCapMonth := Value;
  ResetPeriod;
end;

//==============================================================================================
procedure TssPeriod.SetCapQuarter(const Value: TCaption);
begin
  FCapQuarter := Value;
  ResetPeriod;
end;

//==============================================================================================
procedure TssPeriod.SetCapSelPeriod(const Value: TCaption);
begin
  FCapSelPeriod := Value;
  ResetPeriod;
  if FTypeMenu = nil then Exit;

  if FTypeMenu.Items.Count > 0 then FTypeMenu.Items.Items[0].Caption := Value;

  FDDArrow.Hint := Value;
end;

//==============================================================================================
procedure TssPeriod.SetCapTo(const Value: TCaption);
begin
  FCapTo := Value;
  ResetPeriod;
end;

//==============================================================================================
procedure TssPeriod.SetCapType(const Value: TCaption);
begin
  FCapType := Value;
  FlType.Caption := Value;
end;

//==============================================================================================
procedure TssPeriod.SetCapYear(const Value: TCaption);
begin
  FCapYear := Value;
  ResetPeriod;
end;

//==============================================================================================
procedure TssPeriod.SetEditorsInterval(const Value: Cardinal);
begin
  FEditorsInterval := Value;
  RealignControls;
end;

//==============================================================================================
procedure TssPeriod.SetEditorsOffset(const Value: Cardinal);
begin
  FEditorsOffset := Value;
  RealignControls;
end;

//==============================================================================================
procedure TssPeriod.SetFromDate(const Value: TDateTime);
  var
    d, m, y: Word;
begin
  DecodeDate(Value, y, m, d);

  case FPeriodType of
    ptYear:
      begin
        DecodeDate(BaseDate, y, m, d);
        FedYear.Value := y;
        FFromDate := EncodeDate(y, 1, 1);
        FToDate := EncodeDate(y, 12, 31);
      end;

    ptQuarter:
      begin
        DecodeDate(BaseDate, y, m, d);
        FedYear.Value := y;
        m := m - 1;
        FcbQuarter.ItemIndex := m div 3;
        FFromDate := EncodeDate(y, (m div 3) * 3 + 1, 1);
        FToDate := EncodeDate(y, (m div 3) * 3 + 3, DaysInAMonth(y, (m div 3) * 3 + 3));
      end;

    ptMonth:
      begin
        DecodeDate(BaseDate, y, m, d);
        FedYear.Value := y;
        FcbMonth.ItemIndex := m - 1;
        FFromDate := EncodeDate(y, m, 1);
        FToDate := EncodeDate(y, m, DaysInAMonth(y, m));
      end;

    ptCustom:
      begin
        FedFromDate.Date := Value;
        FFromDate := Value;
      end;
  end;
end;

//==============================================================================================
procedure TssPeriod.SetSkin(const Value: TTBBaseSkin);
begin
  FTypeMenu.Skin := Value;
end;

//==============================================================================================
procedure TssPeriod.SetToDate(const Value: TDateTime);
begin
  case FPeriodType of
    ptCustom:
      begin
        FedToDate.Date := Value;
        FToDate := Value;
      end;
  end;
end;

//==============================================================================================
procedure TssPeriod.SetViewType(const Value: TssPeriodViewType);
begin
  if FViewType = Value then Exit;

  FViewType := Value;

  case Value of
    vtNormal:
      begin
        Self.Height := FedYear.Height * 2 + Integer(FEditorsInterval);
      end;

    vtShort:
      begin
        Self.Height := FedYear.Height;
      end;
  end;

  RealignControls;
end;

//==============================================================================================
procedure TssPeriod.Unlock;
begin
  FLocked := False;
end;

//==============================================================================================
function TssPeriod.ValidDate(const ADate: string): Boolean;
begin
  Result := True;

  try
    StrToDate(ADate);
  except
    Result := False;
  end;
end;

//==============================================================================================
{function TssPeriod.rs(s,r:String; spmode: Integer = 0): String;
begin
  if FlangMan = nil then begin Result := r; Exit; end;
  if (spmode and 2) = 2
    then Result := ' '
    else Result := '';
  Result := Result + Flangman.getrs(s,r);
  if (spmode and 1) = 1 then Result := Result + ' ';
end;
}

end.
