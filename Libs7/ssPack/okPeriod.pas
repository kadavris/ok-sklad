unit okPeriod;

interface

uses
  SysUtils, Classes, Controls, ssPeriod, xLngManager;

type
  TokPeriod = class(TssPeriod)
    private
      FLangManager: TxLngManager;
      procedure SetLangManager(const Value: TxLngManager);

    protected
      procedure Loaded; override;
      procedure ReloadTypes; override;

    public
      procedure InitRes; virtual;

    published
      property LangManager: TxLngManager read FLangManager write SetLangManager;
  end;

implementation

//==============================================================================================
procedure TokPeriod.InitRes;
  var i: Integer;
begin
  if not Assigned(FLangManager) then Exit;

  Lock;

  with FLangManager do begin
    CapType := GetRS('Period', 'Period') + ':';
    CapFrom := GetRS('Period', 'From') + ':';
    CapTo := GetRS('Period', 'To') + ':';
    CapMonth := GetRS('Period', 'Month') + ':';
    CapYear := GetRS('Period', 'Year') + ':';
    CapQuarter := GetRS('Period', 'Quarter') + ':';

    ReloadTypes;

    with FcbMonth do begin
      Properties.Items.Clear;
      for i := 1 to 12 do Properties.Items.Add(Getrs('ssPeriod', 'Month' + IntToStr(i)));
    end;

    with FcbQuarter do begin
      Properties.Items.Clear;
      for i := 1 to 4 do Properties.Items.Add(Getrs('Period', 'quarter' + IntToStr(i)));
    end;

    CapSelPeriod := GetRS('Period', 'SelPeriod');
  end;

  RealignControls;
  Unlock;
end;

//==============================================================================================
procedure TokPeriod.Loaded;
begin
  inherited;
  InitRes;
end;

//==============================================================================================
procedure TokPeriod.ReloadTypes;
begin
  if not Assigned(LangManager) then Exit;

  with FcbType do begin
    Properties.Items.Clear;

    if ptMonth in PeriodTypes
      then Properties.Items.AddObject(LangManager.GetRS('Period', 'ByMonth'), Pointer(ptMonth));

    if ptQuarter in PeriodTypes
      then Properties.Items.AddObject(LangManager.GetRS('Period', 'ByQuarter'), Pointer(ptQuarter));

    if ptYear in PeriodTypes
      then Properties.Items.AddObject(LangManager.GetRS('Period', 'ByYear'), Pointer(ptYear));

    if ptCustom in PeriodTypes
      then Properties.Items.AddObject(LangManager.GetRS('Period', 'ByCustom'), Pointer(ptCustom));
  end;

  RebuildMenu;

  FcbType.Properties.OnEditValueChanged := nil;
  FcbType.ItemIndex := FcbType.Properties.Items.IndexOfObject(TObject(Pointer(PeriodType)));

  if FTypeMenu.Items.Count > 0 then FTypeMenu.Items.Items[FcbType.ItemIndex + 2].Checked := True;

  FcbType.Properties.OnEditValueChanged := cbTypeChange;
end;

//==============================================================================================
procedure TokPeriod.SetLangManager(const Value: TxLngManager);
begin
  if Value = FLangManager then Exit;
  if Assigned(Value) then Value.FreeNotification(Self);
  FLangManager := Value;
end;

end.
