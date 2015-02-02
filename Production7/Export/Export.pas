{$I ok_sklad.inc}
unit Export;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxCheckListBox, dxDBGrid6, Buttons, cxCheckBox,
  xButton, ssSpeedButton, ssBevel, cxEdit, dxDBTLCl6, dxGrClms6, dxTL6,
  dxDBCtrl6, dxCntner6, ssDBGrid, DB, ssMemDS;

type
  TfrmExport = class(TForm)
    aApply: TAction;
    aCancel: TAction;
    ActionList: TActionList;
    aDown: TAction;
    aOK: TAction;
    aUp: TAction;
    btnCancel: TxButton;
    btnDown: TssSpeedButton;
    btnHelp: TssSpeedButton;
    btnLock: TssSpeedButton;
    btnOK: TxButton;
    btnSendErrMessage: TssSpeedButton;
    btnUp: TssSpeedButton;
    bvlMain: TssBevel;
    chbShowExcel: TcxCheckBox;
    colColName2: TdxDBGridColumn;
    colColName: TdxDBGridColumn;
    colIndex: TdxDBGridColumn;
    colName: TdxDBGridColumn;
    colVisible: TdxDBGridImageColumn;
    grdE: TssDBGrid;
    imgFun: TImage;
    lName: TLabel;
    mdCols: TssMemoryData;
    mdColscolindex: TIntegerField;
    mdColscolname2: TStringField;
    mdColscolname: TStringField;
    mdColsen: TIntegerField;
    mdColsname: TStringField;
    mdColsvis: TIntegerField;
    panButtons: TPanel;
    panMain: TPanel;
    srcCols: TDataSource;

    procedure aCancelExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aDownExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aUpExecute(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnLockClick(Sender: TObject);
    procedure btnSendErrMessageClick(Sender: TObject);
    procedure colIndexGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure grdEColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
    procedure grdEMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  private
    FFList: TStringList;
    FModified: boolean;
    procedure SetFList(Value: TStringList);

  public
    grdExp: TdxDBGrid;
    FunID: integer;
    NeedToIns: boolean;

    property FList: TStringList read FFList write SetFList;
    procedure SetCaptions;
  end;

var
  frmExport: TfrmExport;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ClientData, prConst, ssBaseConst, ssClientDataSet, DBClient, ssFun, prFun,
  xLngManager, Udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmExport.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExport.SetCaptions') else _udebug := nil;{$ENDIF}
    
  with LangMan do begin
    aOK.Caption := GetRS(Self.Name, 'Export');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aApply.Caption := GetRS('Common', 'Apply');
    Self.Caption := ' ' + GetRS('Common', 'Excel');

    chbShowExcel.Properties.Caption := GetRS(Self.Name, 'ShowExcel');

    colName.Caption := GetRS('Common', 'ColName');
    colVisible.Caption := GetRS('Common', 'ColVis');

    btnLock.Hint := GetRS('Common', 'Lock');
    btnHelp.Hint := GetRS('Common', 'Help');
    btnSendErrMessage.Hint := GetRS('Common', 'SendErrMessage');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExport.SetFList(Value: TStringList);
  var i: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExport.SetFList') else _udebug := nil;{$ENDIF}


  FFList := Value;

  with mdCols do begin
    for i := 0 to Value.Count - 1 do begin
      Append;
      FieldByName('name').AsString :=
        Self.grdExp.ColumnByName(Value.Strings[i]).Caption;
      FieldByName('colname2').AsString :=
        Self.grdExp.ColumnByName(Value.Strings[i]).Name;
      FieldByName('colname').AsString := Value.Strings[i];
      FieldByName('vis').AsInteger := Integer(Value.Objects[i]);
      FieldByName('en').AsInteger := 1;
      FieldByName('colindex').AsInteger := i;
      Post;
    end;
    First;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExport.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExport.FormCreate') else _udebug := nil;{$ENDIF}

  setFontStyle(Self.Font);
  setFontStyle(lName.Font);

  dmData.Images.GetBitmap(II_EXCEL, imgFun.Picture.Bitmap);
  SetCaptions;
  mdCols.Open;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExport.aOKExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExport.aOKExecute') else _udebug := nil;{$ENDIF}


  ModalResult := mrOk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExport.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExport.aCancelExecute') else _udebug := nil;{$ENDIF}


  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExport.aUpExecute(Sender: TObject);
  var I1, I2: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExport.aUpExecute') else _udebug := nil;{$ENDIF}


  with mdCols do begin
    if RecNo <> 0 then begin
      DisableControls;
      try
        I1 := FieldByName('colindex').AsInteger;
        Prior;
        I2 := FieldByName('colindex').AsInteger;
        Edit;
        FieldByName('colindex').AsInteger := I1;
        Post;
        Next;
        Edit;
        FieldByName('colindex').AsInteger := I2;
        Post;
        SortOnFields('colindex');
        FFList.Exchange(I1, I2);
      finally
        EnableControls;
      end;
    end;
    FModified := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExport.aDownExecute(Sender: TObject);
  var I1, I2: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExport.aDownExecute') else _udebug := nil;{$ENDIF}


  with mdCols do begin
    if RecNo <> mdCols.RecordCount - 1 then begin
      DisableControls;
      try
        I1 := FieldByName('colindex').AsInteger;
        Next;
        I2 := FieldByName('colindex').AsInteger;
        Edit;
        FieldByName('colindex').AsInteger := I1;
        Post;
        Prior;
        Edit;
        FieldByName('colindex').AsInteger := I2;
        Post;
        SortOnFields('colindex');
        FFList.Exchange(I1, I2);
      finally
        EnableControls;
      end;
    end;
    FModified := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExport.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExport.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aUp.Enabled := (lbMain.ItemIndex>0);
  aDown.Enabled := (lbMain.ItemIndex<lbMain.Count-1);
  Self.Caption := 'MouseDown='+IntToStr(Integer(MouseDown))+'; FDrag= '+IntToStr(Integer(FDrag));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmExport.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    ExpID, i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExport.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if (ModalResult = mrOk) and FModified and (FunID <> 0) then begin
    CanClose := False;
    with newDataSet do
    try
      TrStart;

      try
        ProviderName := 'pExp_GetEx';
        FetchParams;
        Params.ParamByName('funid').AsInteger := FunID;
        Open;
        if IsEmpty then begin
          Close;
          ProviderName := 'pExp_Max';
          Params.Clear;
          Open;
          ExpID := Fields[0].AsInteger + 1;
          Close;

          ProviderName := 'pExp_Ins';
          FetchParams;
          Params.ParamByName('expid').AsInteger := ExpID;
          Params.ParamByName('profid').AsInteger := ProfID;
          Params.ParamByName('funid').AsInteger := FunID;
          Execute;
        end
        else begin
          ExpID := FieldByName('expid').AsInteger;
          Close;
        end;

        ProviderName := 'pExpDet_Del';
        FetchParams;
        Params.ParamByName('expid').AsInteger := ExpID;
        Execute;

        ProviderName := 'pExpDet_Ins';
        FetchParams;
        Params.ParamByName('expid').AsInteger := ExpID;
        for i := 0 to FFList.Count - 1 do begin
          Params.ParamByName('num').AsInteger := i + 1;
          if mdCols.Locate('colname', FFList.Strings[i], []) then begin
            Params.ParamByName('checked').AsInteger := mdCols.FieldByName('vis').AsInteger;
            FFList.Objects[i] := TObject(Pointer(mdCols.FieldByName('vis').AsInteger));
            Params.ParamByName('fieldname').AsString := FFList.Strings[i];
            Execute;
          end;  
        end;

        TrCommit;
      finally
        Free;
      end;
    except
      TrRollback;
      raise;
    end;
    CanClose := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExport.btnLockClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExport.btnLockClick') else _udebug := nil;{$ENDIF}


  LockScreen;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExport.btnHelpClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExport.btnHelpClick') else _udebug := nil;{$ENDIF}


  ShowHelpTopic('Title');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExport.btnSendErrMessageClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExport.btnSendErrMessageClick') else _udebug := nil;{$ENDIF}


  SendMsg;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExport.colIndexGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExport.colIndexGetText') else _udebug := nil;{$ENDIF}


  AText := IntToStr(ANode.Index + 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExport.grdEColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExport.grdEColumnSorting') else _udebug := nil;{$ENDIF}


  Allow := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmExport.grdEMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
   FNode: TdxTreeListNode;
   FCol: TdxTreeListColumn;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmExport.grdEMouseDown') else _udebug := nil;{$ENDIF}


  if Button = mbLeft then begin
    FNode := grdE.GetNodeAt(X, Y);
    FCol := grdE.GetColumnAt(X, Y);
    if Assigned(FNode) and Assigned(FCol) and (FCol = colVisible) then begin
      if mdCols.Locate('colname2', FNode.Values[colColName2.Index], []) and
        (mdCols.FieldByName('en').AsInteger = 1) then begin
        mdCols.Edit;
        mdCols.FieldByName('vis').AsInteger := 1 - mdCols.FieldByName('vis').AsInteger;
        mdCols.Post;
        FModified := True;
      end;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Export', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
