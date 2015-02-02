{$I ok_sklad.inc}
unit fTaxes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ssBaseTypes,
  ssClientDataSet, dxDBTLCl6, dxGrClms6, ssBevel, TB2Item, BaseRef, ComCtrls,
  StdCtrls, ExtCtrls, ssDataSource, ssDBGrid, cxPC, cxControls;

type
  TfmTaxes = class(TfmBaseRef)
    colID: TdxDBGridColumn;
    colImg: TdxDBGridImageColumn;
    colName: TdxDBGridColumn;
    colOnValue: TdxDBGridColumn;
    colType: TdxDBGridColumn;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;

    procedure cdsMainAfterOpen(DataSet: TDataSet);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTypeCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);

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
  fmTaxes: TfmTaxes;

implementation

uses 
  EditTaxes, ClientData, prFun, prConst, ssFun,
  Export, prTypes, ssCallbackConst, fMessageDlg,Udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}


//==============================================================================================
procedure TfmTaxes.DoDelete;
  var
    id_, i: integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxes.DoDelete') else _udebug := nil;{$ENDIF}

  if ((grdMain.SelectedCount = 1) and (ssMessageDlg(LangMan.GetRS('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes))
     or
     ((grdMain.SelectedCount > 1) and
     (ssMessageDlg(Format(LangMan.GetRS('Common', 'DelConfirmEx'), [grdMain.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes)) then begin

     fProgress.Show;

     with newDataSet do
      try
       Application.ProcessMessages;
       fProgress.Caption := LangMan.GetRS('Common', 'Deleting');
       fProgress.UpDate;
       fProgress.pbMain.Max := grdMain.SelectedCount;
       for i := 0 to grdMain.SelectedCount - 1 do begin
         TrStart;
         fProgress.lText.Caption := grdMain.SelectedNodes[i].Values[colName.Index];
         try
           if not DeleteDataEx(dmData.SConnection, 'taxes', 'taxid', grdMain.SelectedNodes[i].Values[colID.Index])
             then raise Exception.Create(dmData.Lng.GetRS('Common', 'DeleteError'));

           if not DelToRecycleBin
             then TrCommit
             else begin
               TrRollback;
               if not AddToRecycleBin(dmData.SConnection, Self.ClassName, grdMain.SelectedNodes[i].Values[colID.Index], grdMain.SelectedNodes[i].Values[colName.Index], False, Self.FunID) then begin
                 ssMessageDlg(LangMan.GetRS('Common', 'ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
                 {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
                 Exit;
               end;
             end;

         except
           on e:exception do begin
             TrRollback;
             if (grdMain.SelectedCount = 1)
               then ssMessageDlg(LangMan.GetRS('Common', 'NoDelete') + #10#13 + e.Message, ssmtError, [ssmbOk])
               else if mrYes <> ssMessageDlg(Format(LangMan.GetRS('Common', 'NoDeleteEx'), [grdMain.SelectedNodes[i].Values[colName.Index]]), ssmtError, [ssmbYes, ssmbNo])
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
procedure TfmTaxes.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxes.DoOpen') else _udebug := nil;{$ENDIF}


  _ID_ := 'TaxID';
  RefType := rtTaxes;
  EditingClass := TfrmEditTaxes;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxes.SetCaptions;
var
  FTitle: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxes.SetCaptions') else _udebug := nil;{$ENDIF}


  with dmData.Lng do begin
    Self.Caption := GetRS('fmTaxes', 'Title');
    FTitle := Self.Caption;
    colName.Caption := GetRS('fmTaxes', 'Name');
    colType.Caption := GetRS('fmTaxes', 'Type');
    colOnValue.Caption := GetRS('fmTaxes', 'Rate');

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS(Self.Name, 'NameD') + ';' + 'name', pointer(1));
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxes.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxes.UpdateActionList') else _udebug := nil;{$ENDIF}

  aNew.Enabled := True;
  aPatternInsert.Enabled := True and not cdsMain.IsEmpty and (cdsMain.FieldByName('taxid').AsInteger > 0);
  aProperties.Enabled := not cdsMain.IsEmpty and (grdMain.SelectedCount = 1)
    and (cdsMain.FieldByName('taxid').AsInteger > 0);
  aDel.Enabled := not cdsMain.IsEmpty and (cdsMain.FieldByName('taxid').AsInteger > 0);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxes.colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxes.colImgGetText') else _udebug := nil;{$ENDIF}


  AText := '1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxes.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxes.DoShow') else _udebug := nil;{$ENDIF}


  inherited;
  try grdMain.SetFocus; except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxes.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxes.SetCurrentID') else _udebug := nil;{$ENDIF}


  inherited;

  if Value > 0 then cdsMain.Locate(_ID_, Value, []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxes.grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxes.grdMainKeyDown') else _udebug := nil;{$ENDIF}


  if Key = 13 then begin
    grdMainDblClick(grdMain);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxes.colTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxes.colTypeGetText') else _udebug := nil;{$ENDIF}


  if AText = '' then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  case StrToInt(AText) of
    0: AText := LangMan.GetRS('fmTaxes', 'AllKA');
    1: AText := LangMan.GetRS('fmTaxes', 'Persons');
    2: AText := LangMan.GetRS('fmTaxes', 'Firms');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxes.colTypeCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
  ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
  var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
  var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxes.colTypeCustomDrawCell') else _udebug := nil;{$ENDIF}


  AAlignment := taLeftJustify;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxes.cdsMainAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxes.cdsMainAfterOpen') else _udebug := nil;{$ENDIF}


  inherited;

  with cdsMain do begin
    Append;
    FieldByName('taxid').AsInteger := -1;
    FieldByName('name').AsString := LangMan.GetRS('fmWaybill', 'NDS');
    FieldByName('taxtype').AsInteger := 0;
    FieldByName('onvalue').AsFloat := NDS;
    FieldByName('deleted').AsInteger := 0;
    Post;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxes.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
  ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
  var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
  var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxes.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}


  inherited;

  if (ANode.Values[colID.Index] = -1) and not ASelected
    then AFont.Color := clBtnShadow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmTaxes.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmTaxes.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}


  inherited;
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fTaxes', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
