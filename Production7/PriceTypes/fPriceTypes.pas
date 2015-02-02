{$I ok_sklad.inc}
unit fPriceTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ssBaseTypes,
  ssClientDataSet, dxDBTLCl6, dxGrClms6, ssBevel, TB2Item, prTypes, BaseRef,
  ssDataSource, ssDBGrid, ExtCtrls, cxPC, cxControls;

type
  TfmPriceTypes = class(TfmBaseRef)
    cdsMainDEF: TIntegerField;
    cdsMainDELETED: TIntegerField;
    cdsMainextratype: TIntegerField;
    cdsMainNAME: TStringField;
    cdsMainNUM: TIntegerField;
    cdsMainnumex: TIntegerField;
    cdsMainONVALUE: TFloatField;
    cdsMainPNAME: TStringField;
    cdsMainPPTYPEID: TIntegerField;
    cdsMainPTYPEID: TIntegerField;
    colDef: TdxDBGridColumn;
    colExtra: TdxDBGridColumn;
    colExtraDisc: TdxDBGridColumn;
    colExtraType: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colImg: TdxDBGridImageColumn;
    colName: TdxDBGridColumn;
    colNum: TdxDBGridColumn;
    colPName: TdxDBGridColumn;
    colRealNum: TdxDBGridColumn;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;

    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure colExtraDiscGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colExtraGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNumCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure FrameResize(Sender: TObject);
    procedure grdMainColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMainGetNodeDragText(Sender: TObject; Node: TdxTreeListNode; Column: TdxTreeListColumn; var AText: String);
    procedure grdViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure grdViewDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure grdViewStartDrag(Sender: TObject; var DragObject: TDragObject);

  private
    DI: TDragInfo;

  protected
    procedure SetCurrentID(const Value: integer); override;

  public
    procedure DoOpen(AParam: Variant); override;
    procedure DoDelete; override;
    procedure SetCaptions; override;
    procedure DoShow; override;
    procedure UpdateActionList; override;
  end;

var
  fmPriceTypes: TfmPriceTypes;

implementation

uses 
  EditPriceTypes, ClientData, prFun, prConst, ssFun, Export, ssCallbackConst, fMessageDlg, udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfmPriceTypes.DoDelete;
  var
    id_, i: integer;
    ResetDef: boolean;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.DoDelete') else _udebug := nil;{$ENDIF}

  if ((grdMain.SelectedCount = 1) and (ssMessageDlg(LangMan.GetRS('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes))
     or
     ((grdMain.SelectedCount > 1) and
     (ssMessageDlg(Format(LangMan.GetRS('Common', 'DelConfirmEx'), [grdMain.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes))
  then begin
     fProgress.Show;
     with newDataSet do
      try
       Application.ProcessMessages;
       fProgress.Caption := LangMan.GetRS('Common', 'Deleting');
       fProgress.UpDate;
       fProgress.pbMain.Max := grdMain.SelectedCount;
       ResetDef := False;
       for i := 0 to grdMain.SelectedCount - 1 do begin
         TrStart;
         try
           if not DeleteData(dmData.SConnection, 'pricetypes', grdMain.SelectedNodes[i].Values[colID.Index])
             then raise Exception.Create(dmData.Lng.GetRS('Common', 'DeleteError'));

           if cdsMain.FieldByName('def').AsInteger = 1 then ResetDef := True;

           if not DelToRecycleBin
             then TrCommit
             else begin
               TrRollback;
               if not AddToRecycleBin(dmData.SConnection, Self.ClassName, grdMain.SelectedNodes[i].Values[colID.Index], grdMain.SelectedNodes[i].Values[colName.Index], ResetDef, Self.FunID) then begin
                 ssMessageDlg(LangMan.GetRS('Common', 'ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
                   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

               end;
             end;
         except
           on e:exception do begin
             TrRollback;
             if (grdMain.SelectedCount = 1)
               then ssMessageDlg(LangMan.GetRS('Common', 'NoDelete') + #10#13 +
                 e.Message, ssmtError, [ssmbOk])
               else if ssMessageDlg(Format(LangMan.GetRS('Common', 'NoDeleteEx'),
                   [grdMain.SelectedNodes[i].Values[colName.Index]]), ssmtError,
                   [ssmbYes, ssmbNo]) <> mrYes then begin
                    TrRollback;
                    Break;
                  end;
           end;
         end;
       end;

       if ResetDef then begin
         ProviderName := 'pPriceTypes_Min';
         Open;
         if not IsEmpty then begin
          id_:=Fields[0].AsInteger;
          Close;
          ProviderName:='pPriceTypes_SetDef1';
          FetchParams;
          Params.ParamByName(_ID_).AsInteger:=id_;
          Execute;
         end else Close;
       end;
       LocateAfterDel;
       aRefresh.Execute;
       UpdateActionList;
       if RefreshAllClients
        then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_PRICETYPES);

      finally
       fProgress.Hide;
       Free;
      end;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.DoOpen') else _udebug := nil;{$ENDIF}


  _ID_ := 'ptypeid';

  RefType := rtPriceTypes;
  EditingClass := TfrmEditPriceTypes;
  cdsMain.Open;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.SetCaptions;
var
  FTitle: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.SetCaptions') else _udebug := nil;{$ENDIF}


  with LangMan do begin
    FTitle := GetRS(Self.Name, 'Title');
    Self.Caption := FTitle;
    colName.Caption := GetRS(Self.Name, 'Name');
    colNum.Caption := GetRS(Self.Name, 'Num');
    colExtraDisc.Caption := GetRS(Self.Name, 'Type');
    colExtra.Caption := GetRS(Self.Name, 'ExtraDisc');

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS(Self.Name, 'NameD') + ';' + 'name', pointer(1));
  end;  
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.UpdateActionList') else _udebug := nil;{$ENDIF}


  aNew.Enabled := True;
  aPatternInsert.Enabled := True;
  aProperties.Enabled := not cdsMain.IsEmpty and (grdMain.SelectedCount = 1);
  aDel.Enabled := not cdsMain.IsEmpty;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.DoShow') else _udebug := nil;{$ENDIF}


  inherited;
  try grdMain.SetFocus; except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.SetCurrentID') else _udebug := nil;{$ENDIF}


  inherited;
  cdsMain.Locate(_ID_, Value, []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  AdjustGrid(grdMain, colName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.grdViewStartDrag(Sender: TObject; var DragObject: TDragObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.grdViewStartDrag') else _udebug := nil;{$ENDIF}

  DI.ID := grdMain.FocusedNode.Values[colID.Index];
  DI.Name := grdMain.FocusedNode.Values[colName.Index];
  DI.Num := grdMain.FocusedNode.Values[colNum.Index];
  DI.Sender := grdMain;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.grdViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  FNode: TdxTreeListNode;  
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.grdViewDragOver') else _udebug := nil;{$ENDIF}


  FNode := grdMain.GetNodeAt(X, Y);
  Accept := (FNode <> nil) and (FNode.Values[colID.Index] <> DI.ID)
    and colNum.Visible;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.grdViewDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  FNode: TdxTreeListNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.grdViewDragDrop') else _udebug := nil;{$ENDIF}

  FNode := grdMain.GetNodeAt(X, Y);
  Screen.Cursor := crSQLWait;
  with newDataSet do
    try
      TrStart;
      try
        ProviderName := 'pPriceTypes_UpdNum';
        FetchParams;
        Params.ParamByName('ptypeid').AsInteger := DI.ID;
        Params.ParamByName('num').AsInteger := -1;
        Execute;

        if DI.Num > FNode.Values[colNum.Index]
          then ProviderName := 'pPriceTypes_UpdNumUp'
          else ProviderName := 'pPriceTypes_UpdNumDown';
        FetchParams;
        Params.ParamByName('num').AsInteger := FNode.Values[colRealNum.Index];
        Execute;

        ProviderName:='pPriceTypes_UpdNum';
        FetchParams;
        Params.ParamByName('ptypeid').AsInteger := DI.ID;
        Params.ParamByName('num').AsInteger := FNode.Values[colRealNum.Index];
        Execute;

        TrCommit;
        aRefresh.Execute;
      except
        TrRollback;
        raise;
      end;
  finally
    Free;
    Screen.Cursor:=crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.colImgGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.colImgGetText') else _udebug := nil;{$ENDIF}


  AText := '1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.colNumCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.colNumCustomDrawCell') else _udebug := nil;{$ENDIF}


  with ACanvas do begin
    if not ASelected then AFont.Color := clBtnShadow;
    AFont.Name := 'Small Fonts';
    AFont.Size := 7;
    ACanvas.Brush.Color := AColor;
    FillRect(ARect);
    ACanvas.Font := AFont;
    TextOut(ARect.Left + 2, ARect.Top + (ARect.Bottom - ARect.Top - TextHeight('H')) div 2, AText );
    ADone := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.cdsMainCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.cdsMainCalcFields') else _udebug := nil;{$ENDIF}


  cdsMain.FieldByName('numex').AsInteger := cdsMain.RecNo;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.grdMainCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}


  inherited;

  if (ANode.Values[colDef.Index] = 1) and not ASelected
    then AFont.Color := DefaultColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.grdMainColumnSorting(Sender: TObject;
  Column: TdxDBTreeListColumn; var Allow: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.grdMainColumnSorting') else _udebug := nil;{$ENDIF}


  Allow := Column = colNum;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.grdMainGetNodeDragText(Sender: TObject;
  Node: TdxTreeListNode; Column: TdxTreeListColumn; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.grdMainGetNodeDragText') else _udebug := nil;{$ENDIF}


  AText := Node.Values[colName.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.colExtraGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.colExtraGetText') else _udebug := nil;{$ENDIF}


  if VarToStr(ANode.Values[colPName.Index]) = EmptyStr then begin
    AText := AText + '% ' + LangMan.GetRS(Self.Name, 'ExtraText');
  end
  else if VarToInt(ANode.Values[colExtraType.Index]) = 2 then begin
    AText := AText + '% ' + LangMan.GetRS('fmMaterials', 'On') + ' ' +
      VarToStr(ANode.Values[colPName.Index]);
  end
  else begin
    AText := AText + '% ' + LangMan.GetRS(Self.Name, 'From') + ' ' +
      VarToStr(ANode.Values[colPName.Index]);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceTypes.colExtraDiscGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceTypes.colExtraDiscGetText') else _udebug := nil;{$ENDIF}


  if (AText = EmptyStr) or (VarToInt(ANode.Values[colExtraType.Index]) = 2)
    then AText := LangMan.GetRS(Self.Name, 'Extra')
    else AText := LangMan.GetRS(Self.Name, 'Disc');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fPriceTypes', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
