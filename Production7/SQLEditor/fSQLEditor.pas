{$I ok_sklad.inc}
unit fSQLEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, TB2Item, Menus, ActnList, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMemo, dxCntner6, dxTL6, dxDBCtrl6, dxDBGrid6,
  ssDBGrid, ExtCtrls, StdCtrls, ssBevel, ssSpeedButton, DB, DBClient,
  ssClientDataSet, cxPC;

type
  TfmSQLEditor = class(TssBaseFrame)
    aExecute: TAction;
    btnExecute: TssSpeedButton;
    cdsSQL: TssClientDataSet;
    grdMain: TssDBGrid;
    MemoMessages: TMemo;
    memSQL: TMemo;
    panExec: TPanel;
    panRes: TPanel;
    panTop: TPanel;
    pcMain: TcxPageControl;
    Splitter1: TSplitter;
    srcSQL: TDataSource;
    ssBevel12: TssBevel;
    ssBevel1: TssBevel;
    ssBevel2: TssBevel;
    ssBevel3: TssBevel;
    ssBevel4: TssBevel;
    ssBevel5: TssBevel;
    ssBevel8: TssBevel;
    ssBevel9: TssBevel;
    tsMessages: TcxTabSheet;
    tsRes: TcxTabSheet;

    procedure aExecuteExecute(Sender: TObject);
    procedure cdsSQLAfterClose(DataSet: TDataSet);
    procedure cdsSQLAfterOpen(DataSet: TDataSet);
    procedure memSQLKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  public
    procedure UpdateActionList; override;
    procedure SetCaptions; override;
    procedure NotifyChanged; override;
    procedure DoHelp; override;
  end;

var
  fmSQLEditor: TfmSQLEditor;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses 
  ClientData, ssStrUtil, fMessageDlg, prConst, prTypes, ssFun, prFun, Udebug, strUtils;

var 
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmSQLEditor.aExecuteExecute(Sender: TObject);
  var
    strSQL: string;
    FErr: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSQLEditor.aExecuteExecute') else _udebug := nil;{$ENDIF}
    
  if Trim(memSQL.SelText) <> ''
    then strSQL := Trim(memSQL.SelText)
    else strSQL := Trim(memSQL.Text);

  if strSQL = '' then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  //strSQL := AnsiLowerCase(strSQL);

  MemoMessages.Lines.Clear;

  if AnsiStartsText('select', strSQL) and (WordCount(strSQl, [';', '^']) = 1) then begin
    cdsSQL.Close;
    cdsSQL.FetchMacros;
    cdsSQL.Macros.ParamByName('sql').AsString := DelChars(strSQL, ['^', ';']);
    cdsSQL.Open;
  end
  else begin
    cdsSQL.Close;
    panRes.Caption := ' ' + LangMan.GetRS(Self.Name, 'ScriptExecuting') + '...';
    Application.ProcessMessages;
    FErr := dmData.SConnection.AppServer.db_ExecScript(strSQL);

    if FErr <> '' then begin
      pcMain.ActivePage := tsMessages;
      panRes.Caption := ' ' + LangMan.GetRS(Self.Name, 'ScriptError');
      MemoMessages.Lines.Add(lastServerError);
      MemoMessages.Lines.Add(FErr);
    end
    else begin
      pcMain.ActivePage := tsRes;
      panRes.Caption := ' ' + LangMan.GetRS(Self.Name, 'ScriptSuccess');
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSQLEditor.cdsSQLAfterOpen(DataSet: TDataSet);
  var
    i: Integer;
    ACol: TdxDBTreeListColumn;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSQLEditor.cdsSQLAfterOpen') else _udebug := nil;{$ENDIF}
    
  with grdMain do begin
    for i := 0 to cdsSQL.FieldCount - 1 do begin
      ACol := CreateColumnEx(TdxDBGridColumn, grdMain);
      ACol.Name := 'col' + cdsSQL.Fields[i].FieldName;
      ACol.FieldName := cdsSQL.Fields[i].FieldName;
      ACol.HeaderAlignment := taCenter;
      ACol.Visible := True;
    end;

    ShowGrid := True;
    ShowHeader := True;

    KeyField := cdsSQL.Fields[0].FieldName;
  end;

  panRes.Caption := ' ' + Format(LangMan.GetRS(Self.Name, 'SelectedRecords'), [cdsSQL.RecordCount]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSQLEditor.cdsSQLAfterClose(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSQLEditor.cdsSQLAfterClose') else _udebug := nil;{$ENDIF}

  with grdMain do begin
    while ColumnCount > 0 do Columns[0].Free;

    ShowGrid := False;
    ShowHeader := False;
  end;
  panRes.Caption := '';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSQLEditor.memSQLKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSQLEditor.memSQLKeyDown') else _udebug := nil;{$ENDIF}

  if (ssCtrl in Shift)
    then memSQL.PasteFromClipboard;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmSQLEditor.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSQLEditor.UpdateActionList') else _udebug := nil;{$ENDIF}
    
  aNew.Enabled := False;
  aPatternInsert.Enabled := False;
  aProperties.Enabled := False;
  aDel.Enabled := False;
  aRefresh.Enabled := False;
  aPrint.Enabled := False;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSQLEditor.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSQLEditor.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    Self.Caption := GetRS('fmSQLEditor', 'Title');
    tsRes.Caption := GetRS('fmSQLEditor', 'Result');
    btnExecute.Caption := GetRS('fmSQLEditor', 'Execute');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSQLEditor.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSQLEditor.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtService, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSQLEditor.DoHelp;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSQLEditor.DoHelp') else _udebug := nil;{$ENDIF}

  ShowHelpTopic('fmSQLEditor');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fSQLEditor', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
