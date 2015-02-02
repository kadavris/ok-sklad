{$I ok_sklad.inc}
unit SetCols;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseDlg, ActnList, ssFormStorage, ImgList, xButton, ssPanel,
  ssGradientPanel, ssSpeedButton, ExtCtrls, cxControls, cxContainer,
  cxCheckListBox, DB, ssMemDS, dxCntner6, dxTL6, dxDBCtrl6, dxDBGrid6,
  dxDBTLCl6, dxGrClms6, Grids, DBGrids;

type
  TfrmSetCols = class(TBaseDlg)
    colAlign: TdxDBGridImageColumn;
    colColumn: TdxDBGridMaskColumn;
    colFieldName: TdxDBGridColumn;
    colInd: TdxDBGridMaskColumn;
    colName: TdxDBGridColumn;
    colVsb: TdxDBGridCheckColumn;
    dbgCols: TdxDBGrid;
    dsCols: TDataSource;
    ImgAlign: TImageList;
    mdCols: TssMemoryData;
    mdColsalign: TIntegerField;
    mdColscolumn: TStringField;
    mdColsfieldname: TStringField;
    mdColsind: TIntegerField;
    mdColsname: TStringField;
    mdColsvisb: TIntegerField;

    procedure colAlignCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgColsCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgColsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgColsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  end;

var
  frmSetCols: TfrmSetCols;

implementation

uses
  ClientData,ssBaseConst, ssBaseIntfDlg, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmSetCols.dbgColsCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetCols.dbgColsCustomDrawCell') else _udebug := nil;{$ENDIF}

  if odd(ANode.AbsoluteIndex) and not ASelected then AColor:=GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetCols.colAlignCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);

  var
    Btm:TBitmap;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetCols.colAlignCustomDrawCell') else _udebug := nil;{$ENDIF}

  Btm := TBitmap.Create;
  case ANode.Values[colAlign.Index] of
    -1: dmData.Images.GetBitmap(120,Btm);
     0: dmData.Images.GetBitmap(121,Btm);
     1: dmData.Images.GetBitmap(122,Btm);
  end;
  ACanvas.Draw(ARect.Left,ARect.Top,Btm);
  ADone := True;
  //ACanvas.BrushCopy(ARect,Btm,ARect,clblack);
  //dmdata.Images.Draw(acanvas,ARect.Left, ARect.Top, 1);
  //ACanvas.CopyRect(ARect,Btm.Canvas,ARect);
  Btm.Free;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetCols.dbgColsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetCols.dbgColsDragOver') else _udebug := nil;{$ENDIF}

  Accept:=true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetCols.dbgColsDragDrop(Sender, Source: TObject; X, Y: Integer);
  var
    i, tmpID:integer;
    BM:TBookmark;
    FCh:boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetCols.dbgColsDragDrop') else _udebug := nil;{$ENDIF}

  if Source = Sender then begin
    try
      mdCols.DisableControls;
      BM := mdCols.GetBookmark;
      tmpID := mdCols.FieldByName('ind').AsInteger+1;
      //Всё что ниже сдвигаем вниз
      mdCols.First;
      while not mdCols.Eof do begin
        FCh:=true;
        for i:=0 to dbgCols.Count-1 do begin
          if dbgCols.Items[i].Selected
             and dbgCols.Items[i].Values[dbgCols.ColumnByFieldName('ind').Index] = mdCols.FieldByName('ind').AsInteger
          then FCh := False;
        end;

        if FCh and (mdCols.FieldByName('ind').AsInteger>=tmpID) then begin
          mdCols.Edit;
          mdCols.FieldByName('ind').AsInteger:=mdCols.FieldByName('ind').AsInteger+mdCols.RecordCount;
          mdCols.Post;
        end;//if FCh then begin

        mdCols.Next;
      end;

      for i := 0 to dbgCols.Count - 1 do begin
        if dbgCols.Items[i].Selected then begin
          if mdCols.Locate('ind',dbgCols.Items[i].Values[dbgCols.ColumnByFieldName('ind').Index],[]) then begin
            mdCols.Edit;
            mdCols.FieldByName('ind').AsInteger:=tmpID;
            mdCols.Post;
            tmpID := tmpID + 1;
          end;
        end;
      end;

      mdCols.SortOnFields('ind');
      mdCols.First;
      while not mdCols.Eof do begin
        mdCols.Edit;
        mdCols.FieldByName('ind').AsInteger:=mdCols.RecNo;
        mdCols.Post;
        mdCols.Next;
      end;

      mdCols.GotoBookmark(BM);
      mdCols.FreeBookmark(BM);
    finally
      mdCols.EnableControls;
    end;
  end;//else;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('SetCols', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
