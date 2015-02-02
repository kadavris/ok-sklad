{$I ok_sklad.inc}
unit OperHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseDlg, ActnList, ssFormStorage, ImgList, xButton, ssPanel,
  ssGradientPanel, ssSpeedButton, ExtCtrls, dxDBTLCl6, dxGrClms6, dxTL6,
  dxDBCtrl6, dxDBGrid6, dxCntner6, DB, DBClient, ssClientDataSet;

type
  TfrmOperHistory = class(TBaseDlg)
    cdsMain: TssClientDataSet;
    cdsMainafter: TStringField;
    cdsMainbefore: TStringField;
    cdsMainDATAAFTER: TStringField;
    cdsMainDATABEFORE: TStringField;
    cdsMainONDATE: TDateTimeField;
    cdsMainondate_: TStringField;
    cdsMainOPCODE: TStringField;
    cdsMainOPID: TIntegerField;
    cdsMainUSERNAME: TStringField;
    cdsUsers: TssClientDataSet;
    colAfter: TdxDBGridMemoColumn;
    colBefore: TdxDBGridMemoColumn;
    colDocType: TdxDBGridImageColumn;
    colID: TdxDBGridColumn;
    colOnDate: TdxDBGridColumn;
    colUser: TdxDBGridColumn;
    grdMain: TdxDBGrid;
    srcMain: TDataSource;

    procedure FormResize(Sender: TObject);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure cdsMainAfterOpen(DataSet: TDataSet);
    procedure colUserGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure FormCreate(Sender: TObject);

  protected
    procedure SetID(const Value: Integer); override;

  public
    TabID: Integer;

    procedure SetCaptions; override;
  end;

var
  frmOperHistory: TfrmOperHistory;

implementation

uses
  prConst, ssFun, ssStrUtil, prFun, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmOperHistory.FormResize(Sender: TObject);
  var
   AStyle: integer;
   Offset, W, i: integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOperHistory.FormResize') else _udebug := nil;{$ENDIF}

  AStyle := GetWindowLong(grdMain.Handle, GWL_STYLE);
  if AStyle and WS_VSCROLL = WS_VSCROLL
    then Offset := 19
    else Offset := 2;

  W := grdMain.Width - Offset;

  for i := 0 to grdMain.VisibleColumnCount - 1 do
    if (grdMain.VisibleColumns[i] <> colBefore) and (grdMain.VisibleColumns[i] <> colAfter)
      then W := W - grdMain.VisibleColumns[i].Width;

  colBefore.Width := W div 2;
  colAfter.Width := W div 2;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOperHistory.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOperHistory.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    Self.Caption := GetRS(ParentNameEx, 'DocHistory');

    colDocType.Caption := '';
    colOnDate.Caption := GetRS(ParentNameEx, 'OperDate');
    colUser.Caption := GetRS(ParentNameEx, 'User');
    colBefore.Caption := GetRS(ParentNameEx, 'DataBefore');
    colAfter.Caption := GetRS(ParentNameEx, 'DataAfter');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOperHistory.SetID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmOperHistory.SetID') else _udebug := nil;{$ENDIF}

  FID := Value;
  DSRefresh(cdsMain, 'opid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOperHistory.cdsMainBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOperHistory.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsMain.Params.ParamByName('tabid').AsInteger := TabID;
  cdsMain.Params.ParamByName('id').AsInteger := FID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOperHistory.cdsMainCalcFields(DataSet: TDataSet);
 var
   FStrDB, FStrDA, FStr, FSumRes, FSum: string;
   FRes: string;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOperHistory.cdsMainCalcFields') else _udebug := nil;{$ENDIF}

  FStrDB := cdsMain.FieldByName('databefore').AsString;
  FStrDA := cdsMain.FieldByName('dataafter').AsString;
  case TabID of
    24, 27: begin
          if FStrDB <> '' then begin
            FStr := ExtractWord(2, FstrDB, [';']);
            FSumRes := FStr;

            if Pos(':', FStr) <> -1 then Delete(FStr, Length(FStr) - 4, 5);

            FRes := rs(ParentNameEx, 'DocNum') + ': ' + ExtractWord(1, FstrDB, [';']) + ' ' + rs(ParentNameEx,
                    'DocDate') + ' ' + FStr + #13#10;

            FRes := FRes + rs(ParentNameEx, 'KAgent') + ': ' + ExtractWord(5, FstrDB, [';']) + #13#10;
            FSum := ExtractWord(4, FstrDB, [';']);
            FSumRes := FloatToStr(StrToFloat(ReplaceStr(Trim(ExtractWord(4, FstrDb, [';'])), '.', DecimalSeparator)));
            FRes := FRes + rs(ParentNameEx, 'Summ') + ': ' + FSumRes + ' ' + BaseCurrName;
            FStrDB := FRes;
          end;

          if FStrDA <> '' then begin
            FStr := ExtractWord(2, FstrDA, [';']);
            FSumRes := FStr;

            if Pos(':', FStr) <> -1 then Delete(FStr, Length(FStr) - 4, 5);

            FRes := rs(ParentNameEx, 'DocNum') + ': ' +
              ExtractWord(1, FstrDA, [';']) + ' ' + rs(ParentNameEx, 'DocDate') + ' ' + FStr + #13#10;

            FRes := FRes + rs(ParentNameEx, 'KAgent') + ': ' + ExtractWord(5, FstrDA, [';']) + #13#10;
            FSum := ExtractWord(4, FstrDA, [';']);
            FSumRes := FloatToStr(StrToFloat(ReplaceStr(Trim(ExtractWord(4, FstrDA, [';'])), '.', DecimalSeparator)));
            FRes := FRes + rs(ParentNameEx, 'Summ') + ': ' + FSumRes + ' ' + BaseCurrName;
            FStrDA := FRes;
          end;
        end;

    33: begin
          if FstrDB <> '' then begin
            FStr := (rs(ParentNameEx, 'DocNum') + ': ' +
              ExtractWord(1, FstrDB, [';']) + ' ' + rs(ParentNameEx, 'DocDate') + ' ' + ExtractWord(2, FstrDB, [';'])) + #13#10;

            FStr := FStr + rs(ParentNameEx, 'KAgent') + ': ' + ExtractWord(4, FstrDB, [';']) + #13#10;
            FStr := FStr + rs(ParentNameEx, 'Summ') + ': ' + Trim(ExtractWord(3, FstrDB, [';'])) + ' ' + BaseCurrName;
            FStrDB := FStr;
          end;

          if FStrDA <> '' then begin
            FStr := (rs(ParentNameEx, 'DocNum') + ': ' +
              ExtractWord(1, FstrDA, [';']) + ' ' + rs(ParentNameEx, 'DocDate') + ' ' + ExtractWord(2, FstrDA, [';'])) + #13#10;

            FStr := FStr + rs(ParentNameEx, 'KAgent') + ': ' + ExtractWord(4, FstrDA, [';']) + #13#10;
            FStr := FStr + rs(ParentNameEx, 'Summ') + ': ' + Trim(ExtractWord(3, FstrDA, [';'])) + ' ' + BaseCurrName;
            FStrDA := FStr;
          end;
        end;

    6: begin
         if FstrDB <> '' then begin
           FStr := rs(ParentNameEx, 'Name') + ': ' + ExtractWord(2, FstrDB, [';']) + #13#10;
           FStr := FStr + rs(ParentNameEx, 'Artikul') + ': ' + ExtractWord(1, FstrDB, [';']);
           FStrDB := FStr;
         end;

         if FstrDA <> '' then begin
           FStr := rs(ParentNameEx, 'Name') + ': ' +
             ExtractWord(2, FstrDA, [';']) + #13#10;
           FStr := FStr + rs(ParentNameEx, 'Artikul') + ': ' +
             ExtractWord(1, FstrDA, [';']);
           FStrDA := FStr;
         end;
       end;

    1: begin
         if FstrDB <> '' then begin
           FStr := rs(ParentNameEx, 'Name') + ': ' + ExtractWord(2, FstrDB, [';']) + #13#10;
           FStr := FStr + rs(ParentNameEx, 'ShortName') + ': ' + ExtractWord(1, FstrDB, [';']);
           FStrDB := FStr;
         end;

         if FstrDA <> '' then begin
           FStr := rs(ParentNameEx, 'Name') + ': ' + ExtractWord(2, FstrDA, [';']) + #13#10;
           FStr := FStr + rs(ParentNameEx, 'ShortName') + ': ' + ExtractWord(1, FstrDA, [';']);
           FStrDB := FStr;
         end;
       end;

    31: begin
          if FstrDB <> '' then begin
            FStr := rs(ParentNameEx, 'Name') + ': ' + ExtractWord(1, FstrDB, [';']) + #13#10;
            FSum := ExtractWord(2, FstrDB, [';']);
            FSumRes := FloatToStr(StrToFloat(ReplaceStr(ExtractWord(2, FstrDB, [';']), '.', DecimalSeparator)));
            FStr := FStr + rs(ParentNameEx, 'Extra') + ': ' + FSumRes + '%';
            FStrDB := FStr;
          end;

          if FstrDA <> '' then begin
            FStr := rs(ParentNameEx, 'Name') + ': ' + ExtractWord(1, FstrDA, [';']) + #13#10;
            FSum := ExtractWord(2, FstrDA, [';']);
            FSumRes := FloatToStr(StrToFloat(ReplaceStr(ExtractWord(2, FstrDA, [';']), '.', DecimalSeparator)));
            FStr := FStr + rs(ParentNameEx, 'Extra') + ': ' + FSumRes + '%';
            FStr := FStrDA;
          end;
        end

     else begin
       if FstrDB <> '' then begin
         FStr := rs(ParentNameEx, 'Name') + ': ' + FstrDB;
         FStrDB := FStr;
       end;

       if FstrDA <> '' then begin
         FStr := rs(ParentNameEx, 'Name') + ': ' + FstrDA;
         FStrDA := FStr;
       end;
     end;
  end;
  cdsMain.FieldByName('before').AsString := FStrDB;
  cdsMain.FieldByName('after').AsString := FStrDA;
  //  cdsMain.FieldByName('ondate_').AsString := DateTimeToStr(cdsMain.FieldByName('ondate').AsDateTime);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOperHistory.cdsMainAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOperHistory.cdsMainAfterOpen') else _udebug := nil;{$ENDIF}

  cdsMain.Last;
  FormResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOperHistory.colUserGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOperHistory.colUserGetText') else _udebug := nil;{$ENDIF}

  if cdsUsers.Locate('sysname', AText, [])
    then AText := cdsUsers.FieldByName('name').AsString
    else AText := '?';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOperHistory.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOperHistory.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  cdsUsers.Open;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('OperHistory', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
