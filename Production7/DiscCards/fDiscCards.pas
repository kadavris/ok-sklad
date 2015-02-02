{$I ok_sklad.inc}
unit fDiscCards;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ssBaseTypes, prTypes,
  ssClientDataSet, dxDBTLCl6, dxGrClms6, ssBevel, TB2Item, BaseRef, ComCtrls,
  StdCtrls, ExtCtrls, ssDataSource, ssDBGrid, cxPC, cxControls;

type
  TfmDiscCards = class(TfmBaseRef)
    aDiscCardInfo: TAction;
    aNewGrp: TAction;
    colDiscType: TdxDBGridColumn;
    colExpireDate: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colImg: TdxDBGridImageColumn;
    colName: TdxDBGridColumn;
    colNum: TdxDBGridColumn;
    colOnValue: TdxDBGridColumn;
    colPhone: TdxDBGridColumn;
    colPosCount: TdxDBGridColumn;
    colTotal: TdxDBGridColumn;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;

    procedure aColParamsExecute(Sender: TObject);
    procedure aDiscCardInfoExecute(Sender: TObject);
    procedure aNewGrpExecute(Sender: TObject);
    procedure cdsMainAfterOpen(DataSet: TDataSet);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure colDiscTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colExpireDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colOnValueGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTotalGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure FrameResize(Sender: TObject);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdMainStartDrag(Sender: TObject; var DragObject: TDragObject);

  private
    DI: TDragInfo;

  protected
    procedure SetCurrentID(const Value: integer); override;

  public
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoDelete; override;
    procedure SetCaptions; override;
    procedure DoShow; override;
    procedure UpdateActionList; override;
  end;

var
  fmDiscCards: TfmDiscCards;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ClientData, prFun, prConst, ssFun,
  Export, ssCallbackConst, fMessageDlg, EditDiscCards, DCTurnover, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmDiscCards.DoDelete;
  var
    id_, i: integer;
    ResetDef: boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.DoDelete') else _udebug := nil;{$ENDIF}

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

       fProgress.lText.Caption := grdMain.SelectedNodes[i].Values[colNum.Index];

       try
         if not DeleteDataEx(dmData.SConnection, 'disccards', 'cardid', grdMain.SelectedNodes[i].Values[colID.Index])
           then raise Exception.Create(dmData.Lng.GetRS('Common', 'DeleteError'));

         if not DelToRecycleBin
           then TrCommit
           else begin
             TrRollback;

             if not AddToRecycleBin(dmData.SConnection, Self.ClassName, grdMain.SelectedNodes[i].Values[colID.Index],
                                    grdMain.SelectedNodes[i].Values[colNum.Index], False, Self.FunID)
             then begin
               ssMessageDlg(LangMan.GetRS('Common', 'ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
               {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
               Exit;
             end;
           end;

       except
         on E: Exception do begin
           TrRollback;

           if (grdMain.SelectedCount = 1)
             then ssMessageDlg(LangMan.GetRS('Common', 'NoDelete') + #10#13 + e.Message, ssmtError, [ssmbOk])
             else if ssMessageDlg(Format(LangMan.GetRS('Common', 'NoDeleteEx'),
                     [grdMain.SelectedNodes[i].Values[colNum.Index]]), ssmtError, [ssmbYes, ssmbNo]) <> mrYes
             then begin
               TrRollback;
               Break;
             end;
         end;
       end;

       fProgress.pbMain.StepIt;
       Application.ProcessMessages;
     end;

     LocateAfterDel;
     aRefresh.Execute;
     UpdateActionList;

    finally
      fProgress.Hide;
      Free;
    end;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.DoOpen') else _udebug := nil;{$ENDIF}

  _ID_ := 'CardID';
  RefType := rtDiscCards;
  EditingClass := TfrmEditDiscCards;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.SetCaptions;
  var
    FTitle: string;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.SetCaptions') else _udebug := nil;{$ENDIF}

  with dmData.Lng do begin
    Self.Caption := GetRS('fmDiscCards', 'Title');
    FTitle := Self.Caption;
    colName.Caption := GetRS('fmDiscCards', 'Holder');
    colNum.Caption := GetRS('fmDiscCards', 'Num');
    colOnValue.Caption := GetRS('fmDiscCards', 'Disc');
    colDiscType.Caption := GetRS('fmDiscCards', 'DiscType');
    colExpireDate.Caption := GetRS('fmDiscCards', 'ExpireDate');
    colPhone.Caption := GetRS('fmKAgent', 'Phone');
    colPosCount.Caption := GetRS('fmDiscCards', 'PosCount');
    colTotal.Caption := GetRS('fmDiscCards', 'Total') + ', ' + BaseCurrName;

    aDiscCardInfo.Caption := GetRS('fmDiscCards', 'DCInfo');

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS(Self.Name, 'NumD') + ';' + 'num', pointer(1));
    FindList.AddObject(GetRS(Self.Name, 'NameD') + ';' + 'name', pointer(2));
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.UpdateActionList') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF LIMITED}
    limited := cdsMain.Active and (cdsMain.recordCount >= limitDiscCardsCount);
  {$ELSE}
    limited := False;
  {$ENDIF}

  aNew.Enabled := True;
  aPatternInsert.Enabled := True;
  aProperties.Enabled := not cdsMain.IsEmpty and (grdMain.SelectedCount = 1);
  aDel.Enabled := not cdsMain.IsEmpty;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.colImgGetText') else _udebug := nil;{$ENDIF}

  AText := '1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.DoShow') else _udebug := nil;{$ENDIF}

  inherited;
  try grdMain.SetFocus; except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.SetCurrentID') else _udebug := nil;{$ENDIF}

  inherited;

  if Value > 0 then cdsMain.Locate(_ID_, Value, []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.grdMainKeyDown') else _udebug := nil;{$ENDIF}

  if Key = 13 then begin
    grdMainDblClick(grdMain);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.cdsMainAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.cdsMainAfterOpen') else _udebug := nil;{$ENDIF}

  inherited;

  grdMain.Adjust(nil, [colImg]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  grdMain.Adjust(nil, [colImg]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.colExpireDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.colExpireDateGetText') else _udebug := nil;{$ENDIF}

  if AText = '' then AText := LangMan.GetRS('fmDiscCards', 'Unlimited');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.colDiscTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.colDiscTypeGetText') else _udebug := nil;{$ENDIF}

  if AText = '0'
    then AText := LangMan.GetRS('fmDiscCards', 'Simple')
    else AText := LangMan.GetRS('fmDiscCards', 'Accum');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.colOnValueGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.colOnValueGetText') else _udebug := nil;{$ENDIF}

  AText := AText + ' %';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.colTotalGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.colTotalGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.aColParamsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.aColParamsExecute') else _udebug := nil;{$ENDIF}

  grdMain.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := Self.Caption;
  ImgList := dmData.Images;
  AIndex := II_DISC_CARDS;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.aDiscCardInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.aDiscCardInfoExecute') else _udebug := nil;{$ENDIF}

  with TfrmDCTurnover.Create(nil) do
  try
    ID := cdsMain.FieldByName('cardid').AsInteger;
    OnDate := Self.OnDate;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.aNewGrpExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.aNewGrpExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditDiscCards.Create(nil) do
  try
    MainHandle := Self.Handle;
    tsGroup.Show;
    ParentNameEx := 'fmDiscCards';
    OnDate := Self.OnDate;
    GrpID := Self.GrpID;
    ID := 0;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.DoRefresh(const AID: integer; AParam: integer);
  var
    FLastIndex: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.DoRefresh') else _udebug := nil;{$ENDIF}

  FLastIndex := grdMain.TopIndex;
  case AParam of
  -1: begin
        GrpID := PGrpInfo(Pointer(AID))^.ID;
        SendMessage(ParentHandle, WM_SETTREEITEM, PGrpInfo(Pointer(AID))^.ID,
          PGrpInfo(Pointer(AID))^.PID);
        DSRefresh(cdsMain, _ID_, 0);
      end;

   1: begin
        GrpID := AID;
        DSRefresh(cdsMain, _ID_, 0);
      end;

   2: begin
        GrpID := 0;
        DSRefresh(cdsMain, _ID_, 0);
      end;

   3: begin
        GrpID := -1;
        DSRefresh(cdsMain, _ID_, 0);
      end;

   0: begin
        DSRefresh(cdsMain, _ID_, AID);
      end;

    else begin
      if GrpID <> AParam - 10 then begin
        GrpID := AParam - 10;
        SendMessage(ParentHandle, WM_SETTREEITEM, GrpID, -2);
      end;

      DSRefresh(cdsMain, _ID_, AID);
    end;
  end;

  UpdateActionList;
  cdsMain.Locate(_ID_, AID, []);
  grdMain.TopIndex := FLastIndex;

  with grdMain do begin
    ClearSelection;
    if FocusedNode <> nil then FocusedNode.Selected := True;
  end;
  grdMain.Update;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.cdsMainBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsMain.Params.ParamByName('pid').AsInteger := GrpID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDiscCards.grdMainStartDrag(Sender: TObject; var DragObject: TDragObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDiscCards.grdMainStartDrag') else _udebug := nil;{$ENDIF}

  DI.ID := grdMain.FocusedNode.Values[colID.Index];
  DI.GrpID := GrpID;

  if grdMain.SelectedCount = 1
    then DI.Name := grdMain.FocusedNode.Values[colNum.Index]
    else DI.Name := IntToStr(grdMain.SelectedCount) + ' ' + LangMan.GetRS('fmDiscCards', 'DCExR');

  DI.IsGrp := 0;
  DI.Sender := grdMain;
  DI.RefType := Self.RefType;
  grdMain.Tag := Integer(@DI);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fDiscCards', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
