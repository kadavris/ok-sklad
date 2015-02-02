{$I ok_sklad.inc}
unit OperProps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxEditor, StdCtrls, xLngDefs,
  ActnList, ssBaseTypes, ssFormStorage, cxCheckBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, ssBaseDlg,
  ssBevel, ImgList, ssSpeedButton, ssPanel, ssGradientPanel, xButton,
  ComCtrls, DB, DBClient, ssClientDataSet;

type
  TfrmOperProps = class(TBaseDlg)
    bvlMain: TssBevel;
    lUser: TLabel;
    txtUser: TssBevel;
    lOperDate: TLabel;
    txtOnDate: TssBevel;
    lFunction: TLabel;
    txtFunction: TssBevel;
    lOperTime: TLabel;
    txtOnTime: TssBevel;
    lOperType: TLabel;
    txtOpCode: TssBevel;
    lDataBefore: TLabel;
    lDataAfter: TLabel;
    bvlDataAfter: TssBevel;
    txtDataBefore: TRichEdit;
    ssBevel1: TssBevel;
    txtDataAfter: TRichEdit;
    imgOpCode: TImage;
    aPrint: TAction;
    aDocHistory: TAction;
    cdsUsers: TssClientDataSet;
    btnPrint: TssSpeedButton;
    btnDocHistory: TssSpeedButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aDocHistoryExecute(Sender: TObject);
  private
    FDocID: Integer;
    FOpCode: string;
    FstrDB, FstrDA, FClassName_: string;
    TabID: Integer;
    ID_: Integer;
    procedure FormatLogData(AMemo: TRichEdit; const AStr: string);
  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
    { Public declarations }
  end;

var
  frmOperProps: TfrmOperProps;

implementation

uses ssBaseConst, prConst, ClientData, prFun,
  ssCallbackConst, xLngManager, ssStrUtil, StrUtils,
  prRep, OperHistory, udebug;

  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}
//==============================================================================================
procedure TfrmOperProps.setid(const Value: integer);
  var
    Str: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmOperProps.setid') else _udebug := nil;{$ENDIF}

  if not IsPattern then FID := Value;

  with newDataSet do
  try
    if Value<>0 then begin

     if not IsPattern
       then Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleEdit')
       else Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleAdd');

     ProviderName := 'pOperLog_Get';
     FetchParams;
     Params.ParamByName('opid').AsInteger := Value;
     Params.ParamByName('shortname').AsString := LangName;
     Open;

     if not IsEmpty then begin
      if cdsUsers.Locate('sysname', FieldByName('username').AsString, [])
        then txtUser.Caption := cdsUsers.FieldByName('name').AsString
        else txtUser.Caption := '?';
      txtOnDate.Caption := DateToStr(FieldByName('ondate').AsDateTime);
      txtOnTime.Caption := TimeToStr(FieldByName('ondate').AsDateTime);

      FOpCode := FieldByName('opcode').AsString;
      TabID := FieldByName('tabid').AsInteger;
      ID_ := FieldByName('id').AsInteger;
      if FieldByName('opcode').AsString = 'I' then begin
        txtOpCode.Caption := LangMan.GetRS(ParentNameEx, 'Insert');
        dmData.Images.GetBitmap(3, imgOpCode.Picture.Bitmap);
      end else
      if FieldByName('opcode').AsString = 'U' then begin
        txtOpCode.Caption := LangMan.GetRS(ParentNameEx, 'Update');
        dmData.Images.GetBitmap(4, imgOpCode.Picture.Bitmap);
      end else
      if FieldByName('opcode').AsString = 'D' then begin
        txtOpCode.Caption := LangMan.GetRS(ParentNameEx, 'Delete');
        dmData.Images.GetBitmap(5, imgOpCode.Picture.Bitmap);
      end;

      txtFunction.Caption := FieldByName('name').AsString;
      FDocID := FieldByName('id').AsInteger;

      FstrDB := FieldByName('databefore').AsString;
      FstrDA := FieldByName('dataafter').AsString;
      FClassName_ := FieldByName('classname').AsString;

      //txtDataAfter.Caption := FieldByName('dataafter').AsString;
     end;
     Close;
    end
    else Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleAdd');
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOperProps.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  (*var
    NewRecord: boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmOperProps.FormCloseQuery') else _udebug := nil;{$ENDIF}

   if ModalResult in [mrOK, mrYes] then begin
      CanClose:=False;
      with TClientDataSet.Create(nil) do
       try
        TrStart;
       try
        RemoteServer:=dmData.SConnection;
        ProviderName:=prvTemp;

        NewRecord:=ID=0;
        if ID=0 then begin
         ProviderName:='pAccountType_Max';
         Open;
         FID:=Fields[0].AsInteger+1;
         Close;
        end;

        if NewRecord
         then ProviderName:='pAccountType_Ins'
         else ProviderName:='pAccountType_Upd';
        FetchParams;
        Params.ParamByName('TYPEID').AsInteger:=ID;
//        Params.ParamByName('name').AsString:=edName.Text;
//        Params.ParamByName('def').AsInteger:=Integer(chbDefault.Checked);
        Params.ParamByName('deleted').AsInteger:=0;
        Execute;

        TrCommit;

        SendMessage(MainHandle, WM_REFRESH, ID, 0);
        if RefreshAllClients
          then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_ACCOUNTTYPE);
        if (ModalResult=mrYes) then
         if NewRecord then begin
//          chbDefault.Enabled:=True;
//          chbDefault.Checked:=False;
//          edName.SetFocus;
          FID := 0;
         end
         else
        else CanClose:=True;
        FModified:=False;
       finally
        Free;
       end;
       except
        on e:exception do begin
         TrRollback;
         MessageDlg(e.Message, mtError, [mbOk], 0);
        end;
       end;

     end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmOperProps.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOperProps.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOperProps.DataModified(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOperProps.DataModified') else _udebug := nil;{$ENDIF}
  FModified:=True;
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOperProps.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOperProps.SetCaptions') else _udebug := nil;{$ENDIF}
    
  inherited;

  with dmData.Lng do begin
    btnPrint.Hint := GetRS(ParentNameEx, 'PrintDoc');
    lUser.Caption := GetRS(ParentNameEx, 'User') + ':';
    lOperDate.Caption := GetRS(ParentNameEx, 'OperDate') + ':';
    lOperTime.Caption := GetRS(ParentNameEx, 'OperTime') + ':';
    lOperType.Caption := GetRS(ParentNameEx, 'OperType') + ':';
    lFunction.Caption := GetRS(ParentNameEx, 'Function') + ':';
    lDataBefore.Caption := GetRS(ParentNameEx, 'DataBefore') + ':';
    lDataAfter.Caption := GetRS(ParentNameEx, 'DataAfter') + ':';

    btnDocHistory.Hint := GetRS(ParentNameEx, 'DocHistory');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOperProps.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOperProps.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOperProps.FormShow(Sender: TObject);
var
  FPosNum, FPosDate, FLNum, FLDate, FStart: Integer;
  FStr, FSum, FSumRes: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOperProps.FormShow') else _udebug := nil;{$ENDIF}


  inherited;

  txtDataAfter.Lines.Clear;
  txtDataBefore.Lines.Clear;
  txtDataBefore.DefAttributes.Color := clMaroon;
  if FstrDB <> EmptyStr then
    with txtDataBefore do begin
      if FClassName_ = 'TfmTaxWB' then begin
        Lines.Add(LangMan.GetRS(ParentNameEx, 'DocNum') + ': ' +
          ExtractWord(1, FstrDB, [';']) + ' ' + LangMan.GetRS(ParentNameEx,
          'DocDate') + ' ' + ExtractWord(2, FstrDB, [';']));
        Lines.Add(LangMan.GetRS(ParentNameEx, 'KAgent') + ': ' +
          ExtractWord(4, FstrDB, [';']));
        Text := Text + LangMan.GetRS(ParentNameEx, 'Summ') + ': ' +
          Trim(ExtractWord(3, FstrDB, [';'])) + ' ' + BaseCurrName;
        FormatLogData(txtDataBefore, FstrDB);
      end else
      if FClassName_ = 'TfmMaterials' then begin
        Lines.Add(LangMan.GetRS(ParentNameEx, 'Name') + ': ' +
          ExtractWord(2, FstrDB, [';']));
        Text := Text + LangMan.GetRS(ParentNameEx, 'Artikul') + ': ' +
          ExtractWord(1, FstrDB, [';']);
        FormatLogData(txtDataBefore, FstrDB);
      end else
      if (FClassName_ = 'TfmMeasures') or (FClassName_ = 'TfmCurrency') then begin
        Lines.Add(LangMan.GetRS(ParentNameEx, 'Name') + ': ' +
          ExtractWord(2, FstrDB, [';']));
        Text := Text + LangMan.GetRS(ParentNameEx, 'ShortName') + ': ' +
          ExtractWord(1, FstrDB, [';']);
        FormatLogData(txtDataBefore, FstrDB);
      end else
      if FClassName_ = 'TfmPriceTypes' then begin
        Lines.Add(LangMan.GetRS(ParentNameEx, 'Name') + ': ' +
          ExtractWord(1, FstrDB, [';']));
        FSum := ExtractWord(2, FstrDB, [';']);
        FSumRes := FloatToStr(StrToFloat(ReplaceStr(ExtractWord(2, FstrDB, [';']), '.', DecimalSeparator)));
        FstrDB := AnsiReplaceStr(FstrDB, FSum, FSumRes);
        Text := Text + LangMan.GetRS(ParentNameEx, 'Extra') + ': ' + FSumRes + '%';
        FormatLogData(txtDataBefore, FstrDB);
      end else
      if (FClassName_ = 'TfmPayDoc') or (FClassName_ = 'TfmWaybill') or
        (FClassName_ = 'TfmWaybillOut') or (FClassName_ = 'TfmWaybillMov') or
        (FClassName_ = 'TfmAccOut') then begin
        FStr := ExtractWord(2, FstrDB, [';']);
        FSumRes := FStr;
        if Pos(':', FStr) <> 0 then Delete(FStr, Length(FStr) - 4, 5);
        FStrDB := AnsiReplaceStr(FstrDB, FSumRes, FStr);
        Lines.Add(LangMan.GetRS(ParentNameEx, 'DocNum') + ': ' +
          ExtractWord(1, FstrDB, [';']) + ' ' + LangMan.GetRS(ParentNameEx,
          'DocDate') + ' ' + FStr);
        Lines.Add(LangMan.GetRS(ParentNameEx, 'KAgent') + ': ' +
          ExtractWord(5, FstrDB, [';']));
        FSum := ExtractWord(4, FstrDB, [';']);
        FSumRes := FloatToStr(StrToFloat(ReplaceStr(Trim(ExtractWord(4, FstrDB, [';'])), '.', DecimalSeparator)));
        FstrDB := AnsiReplaceStr(FstrDB, FSum, FSumRes);
        Text := Text + LangMan.GetRS(ParentNameEx, 'Summ') + ': ' +
         FSumRes + ' ' + BaseCurrName;
        FormatLogData(txtDataBefore, FstrDB);
      end
      else begin
        Lines.Add(LangMan.GetRS(ParentNameEx, 'Name') + ': ' + FstrDB);
        FormatLogData(txtDataBefore, FstrDB);
      end;
    end;
  txtDataAfter.DefAttributes.Color := clMaroon;
  if FstrDA <> EmptyStr then
    with txtDataAfter do begin
      if FClassName_ = 'TfmTaxWB' then begin
        Lines.Add(LangMan.GetRS(ParentNameEx, 'DocNum') + ': ' +
          ExtractWord(1, FstrDA, [';']) + ' ' + LangMan.GetRS(ParentNameEx,
          'DocDate') + ' ' + ExtractWord(2, FstrDA, [';']));
        Lines.Add(LangMan.GetRS(ParentNameEx, 'KAgent') + ': ' +
          ExtractWord(4, FstrDA, [';']));
         Text := Text + LangMan.GetRS(ParentNameEx, 'Summ') + ': ' +
          Trim(ExtractWord(3, FstrDA, [';'])) + ' ' + BaseCurrName;
        FormatLogData(txtDataAfter, FstrDA);
      end else
      if FClassName_ = 'TfmMaterials' then begin
        Lines.Add(LangMan.GetRS(ParentNameEx, 'Name') + ': ' +
          ExtractWord(2, FstrDA, [';']));
        Text := Text + LangMan.GetRS(ParentNameEx, 'Artikul') + ': ' +
          ExtractWord(1, FstrDA, [';']);
        FormatLogData(txtDataAfter, FstrDA);
      end else
      if (FClassName_ = 'TfmMeasures') or (FClassName_ = 'TfmCurrency') then begin
        Lines.Add(LangMan.GetRS(ParentNameEx, 'Name') + ': ' +
          ExtractWord(2, FstrDA, [';']));
        Text := Text + LangMan.GetRS(ParentNameEx, 'ShortName') + ': ' +
          ExtractWord(1, FstrDA, [';']);
        FormatLogData(txtDataAfter, FstrDA);
      end else
      if FClassName_ = 'TfmPriceTypes' then begin
        Lines.Add(LangMan.GetRS(ParentNameEx, 'Name') + ': ' +
          ExtractWord(1, FstrDA, [';']));
        FSum := ExtractWord(2, FstrDA, [';']);
        FSumRes := FloatToStr(StrToFloat(ReplaceStr(ExtractWord(2, FstrDA, [';']), '.', DecimalSeparator)));
        FstrDA := AnsiReplaceStr(FstrDA, FSum, FSumRes);
        Text := Text + LangMan.GetRS(ParentNameEx, 'Extra') + ': ' + FSumRes + '%';
        FormatLogData(txtDataAfter, FstrDA);
      end else
      if (FClassName_ = 'TfmPayDoc') or (FClassName_ = 'TfmWaybill') or
        (FClassName_ = 'TfmWaybillOut') or (FClassName_ = 'TfmWaybillMov') or
        (FClassName_ = 'TfmAccOut') then begin
        FStr := ExtractWord(2, FstrDA, [';']);
        FSumRes := FStr;
        if Pos(':', FStr) <> 0 then Delete(FStr, Length(FStr) - 4, 5);
        FStrDA := AnsiReplaceStr(FstrDA, FSumRes, FStr);
        Lines.Add(LangMan.GetRS(ParentNameEx, 'DocNum') + ': ' +
          ExtractWord(1, FstrDA, [';']) + ' ' + LangMan.GetRS(ParentNameEx,
          'DocDate') + ' ' + FStr);
        Lines.Add(LangMan.GetRS(ParentNameEx, 'KAgent') + ': ' +
          ExtractWord(5, FstrDA, [';']));
        FSum := ExtractWord(4, FstrDA, [';']);
        FSumRes := FloatToStr(StrToFloat(ReplaceStr(Trim(ExtractWord(4, FstrDA, [';'])), '.', DecimalSeparator)));
        FstrDA := AnsiReplaceStr(FstrDA, FSum, FSumRes);
        Text := Text + LangMan.GetRS(ParentNameEx, 'Summ') + ': ' +
         FSumRes + ' ' + BaseCurrName;
        FormatLogData(txtDataAfter, FstrDA);
      end
      else begin
        Lines.Add(LangMan.GetRS(ParentNameEx, 'Name') + ': ' + FstrDA);
        FormatLogData(txtDataAfter, FstrDA);
      end;
    end
  else txtDataAfter.Lines.Add(LangMan.GetRS(ParentNameEx, 'Deleted'));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOperProps.FormatLogData(AMemo: TRichEdit;
  const AStr: string);
var
  i, j: Integer;
  FPos: Integer;
  FStr: string;
  Offs: Integer;  
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOperProps.FormatLogData') else _udebug := nil;{$ENDIF}


  for i := 1 to WordCount(AStr, [';']) do begin
    FStr := Trim(ExtractWord(i, AStr, [';']));
    Offs := 1;
    FPos := PosEx(FStr, AMemo.Text, Offs);
    while FPos > 0 do begin
      Offs := FPos + Length(FStr);
      AMemo.SelStart := FPos - 1;
      AMemo.SelLength := Length(FStr);
      AMemo.SelAttributes.Style := [fsBold];
      FPos := PosEx(FStr, AMemo.Text, Offs);
    end;
  end;
  AMemo.SelStart := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOperProps.aPrintExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOperProps.aPrintExecute') else _udebug := nil;{$ENDIF}


  if FOpCode <> 'D' then begin
    if (FClassName_ = 'TfmWaybillOut') then xRep.ShowRep(rtWBOut, FDocID) else
    if (FClassName_ = 'TfmWaybill') then xRep.ShowRep(rtWBIn, FDocID) else
    if (FClassName_ = 'TfmAccOut') then xRep.ShowRep(rtAccOut, FDocID) else
    if (FClassName_ = 'TfmWaybillMov') then xRep.ShowRep(rtWBMove, FDocID) else
    if (FClassName_ = 'TfmTaxWB') then xRep.ShowRep(rtTaxWB, FDocID);
  end;  

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOperProps.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOperProps.FormCreate') else _udebug := nil;{$ENDIF}


  inherited;
  
  btnPrint.ImageIndex := 9;

  cdsUsers.Open;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOperProps.aDocHistoryExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOperProps.aDocHistoryExecute') else _udebug := nil;{$ENDIF}


  with TfrmOperHistory.Create(nil) do
    try
      ParentNameEx := Self.ParentNameEx;
      TabID := Self.TabID;
      ID := Self.ID_;
      ShowModal;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('OperProps', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
