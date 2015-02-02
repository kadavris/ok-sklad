{$I ok_sklad.inc}
unit SetWMat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseDlg, ActnList, ssFormStorage, ImgList, xButton, ssPanel,
  ssGradientPanel, ssSpeedButton, ExtCtrls, cxControls, cxContainer,
  cxCheckListBox, DB, ssMemDS, dxCntner6, dxTL6, dxDBCtrl6, dxDBGrid6,
  dxDBTLCl6, dxGrClms6, Grids, DBGrids, cxEdit, cxCheckBox, TB2Item, Menus,
  DBClient, ssClientDataSet, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  ssPopupTreeEdit, StdCtrls, cxTL, ssBaseConst;

type
  TfrmSetWMat = class(TBaseDlg)
    aSelAll: TAction;
    btnAddMG: TssSpeedButton;
    btnDrillDown: TssSpeedButton;
    cdsMatGroup: TssClientDataSet;
    chbColAmount: TcxCheckBox;
    colDel: TdxDBGridColumn;
    colName: TdxDBGridColumn;
    colVsb: TdxDBGridCheckColumn;
    dbgWHouse: TdxDBGrid;
    dsMatGroup: TDataSource;
    dsWHouse: TDataSource;
    edMatGroup: TssPopupTreeEdit;
    lMatGroup: TLabel;
    mdWHouse: TssMemoryData;
    pmGrid: TTBPopupMenu;
    TBItem1: TTBItem;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aSelAllExecute(Sender: TObject);
    procedure btnAddMGClick(Sender: TObject);
    procedure dbgWHouseCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgWHouseKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgWHouseMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure FormCreate(Sender: TObject);

  private
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    function IsSelected: boolean;//Фукция провери выбора складов

  public
    procedure SetCaptions; override;
  end;

var
  frmSetWMat: TfrmSetWMat;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ClientData,ssBaseIntfDlg, Math, prConst, prTypes, ssFun, prFun, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
function TfrmSetWMat.IsSelected: boolean;
  var
    i:Integer;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetWMat.IsSelected') else _udebug := nil;{$ENDIF}

  Result := False;

  with dbgWHouse do begin
    for i := 0 to Count - 1 do begin
      if Items[i].Values[colVsb.Index] = 1 then begin
        Result := True;
        Break;
      end;
    end;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetWMat.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetWMat.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    aSelAll.Caption := GetRS('Common','SelectAll');
    lMatGroup.Caption := GetRS('fmAllReports','matgrp') + ':';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetWMat.dbgWHouseCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetWMat.dbgWHouseCustomDrawCell') else _udebug := nil;{$ENDIF}

 if (ANode.Values[colDel.Index] = 1) and not ASelected then AFont.Color := DefaultColor;
 if odd(ANode.AbsoluteIndex) and not ASelected then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetWMat.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetWMat.FormCreate') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pWHouse_List';
    FetchMacros;
    Macros.ParamByName('m').AsString := WHAccessMacro;
    Open;
    if not IsEmpty then begin
      mdWHouse.CopyStructure(Fields[0].DataSet);
      mdWHouse.LoadFromDataSet(Fields[0].DataSet, 0, lmAppend);
      mdWHouse.FieldByName('name').ReadOnly := True;
      if mdWHouse.Locate('def',1,[]) then begin
        mdWHouse.Edit;
        mdWHouse.FieldByName('deleted').AsInteger:=1;
        mdWHouse.Post;
      end;
    end;
    Close;

  finally
    Free;
  end;
  cdsMatGroup.Open;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetWMat.dbgWHouseMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetWMat.dbgWHouseMouseDown') else _udebug := nil;{$ENDIF}

  if (dbgWHouse.GetColumnAt(x,y) = colVsb) and (Button = mbLeft) and (not mdWHouse.IsEmpty) then begin
    mdWHouse.Edit;
    if mdWHouse.FieldByName('def').AsInteger = 1
      then mdWHouse.FieldByName('def').AsInteger := 0
      else mdWHouse.FieldByName('def').AsInteger := 1;
    mdWHouse.Post;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetWMat.dbgWHouseKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetWMat.dbgWHouseKeyDown') else _udebug := nil;{$ENDIF}

  if (Key = VK_SPACE) and (not mdWHouse.IsEmpty) then begin
    mdWHouse.Edit;
    if mdWHouse.FieldByName('def').AsInteger = 1
      then mdWHouse.FieldByName('def').AsInteger := 0
      else mdWHouse.FieldByName('def').AsInteger := 1;
    mdWHouse.Post;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetWMat.aSelAllExecute(Sender: TObject);
  var
    bm:TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetWMat.aSelAllExecute') else _udebug := nil;{$ENDIF}

  bm := mdWHouse.GetBookmark;
  mdWHouse.DisableControls;

  try
    mdWHouse.First;
    while not mdWHouse.Eof do begin
      mdWHouse.Edit;
      mdWHouse.FieldByName('def').AsInteger := 1;
      mdWHouse.Post;
      mdWHouse.Next;
    end;

  finally
    mdWHouse.GotoBookmark(bm);
    mdWHouse.FreeBookmark(bm);
    mdWHouse.EnableControls;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetWMat.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetWMat.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOK.Enabled := IsSelected;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetWMat.edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetWMat.edMatGroupGetNodeImageIndex') else _udebug := nil;{$ENDIF}

  inherited;
  
  if ANode.Expanded
    then AIndex := 49
    else AIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetWMat.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetWMat.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    {rtWHouse: begin
      DSRefresh(cdsWhouse, 'wid', M.WParam);
      lcbWhouse.KeyValue:=M.WParam;
    end;}

    rtMatGroup: begin
      if M.WParam > 0 then begin
        DSRefresh(cdsMatGroup, 'grpid', M.WParam);
        edMatGroup.Value := M.WParam;
      end;
    end;

    //rtKAgent: edKA.KAID := M.WParam;
    //rtMat: edMat.MatID := M.WParam;
    //rtServices: edSvc.SvcID := M.WParam;
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetWMat.btnAddMGClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetWMat.btnAddMGClick') else _udebug := nil;{$ENDIF}

  inherited;
  ShowModalRef(Self, rtMatGroup, vtMatGroup, 'TfmMatGroup', Self.OnDate,edMatGroup.Value);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('SetWMat', @Debugging, DEBUG_group_ID);
  {$ENDIF}
  
//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
