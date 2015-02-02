{$I ok_sklad.inc}
unit Serials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseDlg, ActnList, ssFormStorage, ImgList, xButton, ssPanel,
  ssGradientPanel, ssSpeedButton, ExtCtrls, ClientData, dxTL6, dxDBCtrl6,
  dxDBGrid6, DB, dxCntner6, ssDBGrid, ssMemDS, StdCtrls;

type
  TfrmSerials = class(TBaseDlg)
      colNum: TdxDBGridMaskColumn;
      colSN: TdxDBGridMaskColumn;
      dbgSN: TssDBGrid;
      dsSN: TDataSource;
      lblLimit: TLabel;
      mdSN: TssMemoryData;
      mdSNNum: TIntegerField;
      mdSNSN: TStringField;

      procedure dbgSNEdited(Sender: TObject; Node: TdxTreeListNode);
      procedure dbgSNKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure showLimit; // displays how many of snumbers can we add

    private
      placesLeft: Integer; // how many places left;

    public
      procedure SetCaptions; override;
  end;

var
  frmSerials: TfrmSerials;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses 
  prConst, fMessageDlg, ssBaseIntfDlg, prFun, udebug;

var 
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
  
{$R *.dfm}

//==============================================================================================
procedure TfrmSerials.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSerials.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    Self.Caption := GetRS('fmWaybill', 'SNs');
    colNum.Caption := amountPrefix(False);
    colSN.Caption := GetRS('fmWaybill', 'SN');
    lblLimit.Caption := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSerials.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSerials.FormCreate') else _udebug := nil;{$ENDIF}

  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSerials.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    BM: TBookmark;
    iSN: integer;
    errStr: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSerials.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if not colSN.DisableEditor and ( ModalResult = mrOK ) then begin
    CanClose := False;

    BM := nil;

    with mdSN do
    try
      DisableControls;
      BM := GetBookmark;
      iSN := 0;
      First;
      while not Eof do begin
        if (not FieldByName('SN').IsNull) and (Trim(FieldByName('SN').AsString) <> '')
          then Inc(iSN);

        Next;
      end;//while

      if iSN <> RecordCount then begin
        errStr := Format(rs('fmWaybill','SNErr1'), [isn, RecordCount]);
        CanClose := (ssMessageDlg(errStr,ssmtWarning,[ssmbYes,ssmbCancel]) = mrYes);
      end
      else CanClose := True;

    finally
      if BM <> nil then begin
        GotoBookmark(BM);
        FreeBookmark(BM);
      end;

      EnableControls;
    end;
  end;//if ModalResult=mrOK

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSerials.showLimit;
  var
    snLength, filledIn: Integer;
    bm: Tbookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSerials.showLimit') else _udebug := nil;{$ENDIF}

  snLength := 0;
  filledIn := 0;

  bm := mdSN.GetBookmark;
  mdSN.First;
  while not mdSN.eof do begin
    if not mdSN.FieldByName('sn').isNull and ('' <> trim(mdSN.FieldByName('sn').AsString))
      then begin
        snLength := snLength + 1 + length(trim(mdSN.FieldByName('sn').AsString));
        inc(filledIn);
      end;

    mdSN.Next;
  end;
  mdSN.GotoBookmark(bm);
  mdSN.FreeBookmark(bm);

  if snLength = 0 then begin
    placesLeft := mdSN.RecordCount;
    lblLimit.Caption := '';
  end
  else begin
    placesLeft := (255 - snLength) div (snLength div filledIn);

    if placesLeft = 0
      then lblLimit.Font.Style := [fsBold]
      else lblLimit.Font.Style := [];

    lblLimit.Caption := RS('fmWaybill', 'SNLimitPrefix', 1) + IntToStr(placesLeft) + RS('fmWaybill', 'SNLimitSuffix', 2);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSerials.dbgSNEdited(Sender: TObject; Node: TdxTreeListNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSerials.dbgSNEdited') else _udebug := nil;{$ENDIF}

  if (placesLeft = 0) and (mdSN.FieldByName('sn').AsString <> '') then begin // no space left on new sn
    mdSN.FieldByName('sn').AsString := '';
    Exit;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;

  showLimit;

  dbgSN.GotoNext(False);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSerials.dbgSNKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSerials.dbgSNKeyDown') else _udebug := nil;{$ENDIF}

  if (Key = 13) and (dbgSN.FocusedNode = dbgSN.LastNode)
    then btnOk.SetFocus
    else GoNextKeyDown(Sender, Key, Shift);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSerials.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSerials.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  dbgSN.FocusedColumn := 1;

  showLimit;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Serials', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
