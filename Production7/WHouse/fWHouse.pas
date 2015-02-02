{$I ok_sklad.inc}
unit fWHouse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ssBaseTypes,
  ssClientDataSet, dxDBTLCl6, dxGrClms6, ssBevel, TB2Item, BaseRef,
  ssDataSource, ssDBGrid, ExtCtrls, cxPC, cxControls;

type
  TfmWhouse = class(TfmBaseRef)
    colAddr: TdxDBGridColumn;
    colDef: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colImg: TdxDBGridImageColumn;
    colName: TdxDBGridColumn;
    colNotes: TdxDBGridColumn;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;

    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);

  protected
    procedure SetCurrentID(const Value: integer); override;

  public
    procedure DoClose; override;
    procedure DoDelete; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure DoShow; override;
    procedure SetCaptions; override;
    procedure UpdateActionList; override;
  end;

var
  fmWhouse: TfmWhouse;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ClientData, prFun, EditWHouse, prConst, ssFun, prTypes,
  ssCallbackConst, fMessageDlg, Export, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

const
     _ID_ = 'wid';

//==============================================================================================
procedure TfmWhouse.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWhouse.DoClose') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWhouse.DoDelete;
  var
    id_, i: integer;
    ResetDef: boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWhouse.DoDelete') else _udebug := nil;{$ENDIF}
    
  if ((grdMain.SelectedCount = 1)
   and (ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes))
   or
   ((grdMain.SelectedCount > 1)
    and
    (mrYes = ssMessageDlg(Format(rs('Common', 'DelConfirmEx'),[grdMain.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo]))
   )
  then begin
     fProgress.Show;

     with newDataSet do
     try
       Application.ProcessMessages;
       fProgress.Caption := rs('Common', 'Deleting');
       fProgress.UpDate;
       fProgress.pbMain.Max := grdMain.SelectedCount;

       ResetDef := False;

       for i := 0 to grdMain.SelectedCount - 1 do begin
         TrStart;

         try
           if not DeleteDataEx(dmData.SConnection, 'warehouse', 'wid', grdMain.SelectedNodes[i].Values[colID.Index])
             then raise Exception.Create(dmData.Lng.GetRS('Common', 'DeleteError'));

           if cdsMain.FieldByName('def').AsInteger = 1 then ResetDef := True;

           if not DelToRecycleBin
             then TrCommit
             else begin
               TrRollback;

               if not AddToRecycleBin(dmData.SConnection, Self.ClassName, grdMain.SelectedNodes[i].Values[colID.Index], grdMain.SelectedNodes[i].Values[colName.Index], ResetDef, FunID) then begin
                 ssMessageDlg(rs('Common', 'ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
                 {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
                 Exit;
               end;
             end;

         except
           on e:exception do begin
             TrRollback;

             if (grdMain.SelectedCount = 1)
               then ssMessageDlg(rs('Common', 'NoDelete') + #10#13 + e.Message, ssmtError, [ssmbOk])
               else if mrYes <> ssMessageDlg(Format(rs('Common', 'NoDeleteEx'), [grdMain.SelectedNodes[i].Values[colName.Index]]), ssmtError, [ssmbYes, ssmbNo])
                 then begin
                   TrRollback;
                   Break;
                 end;
           end;
         end;
       end;

       if ResetDef then begin
         ProviderName := 'pWHouse_Min';
         Open;
         if not IsEmpty then begin
           id_ := Fields[0].AsInteger;
           Close;
           ProviderName := 'pWHouse_SetDef1';
           FetchParams;
           Params.ParamByName(_ID_).AsInteger := id_;
           Execute;
         end else Close;
       end;
       LocateAfterDel;
       aRefresh.Execute;
       UpdateActionList;

       if RefreshAllClients then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WHOUSE);

       frmMainForm.ExecRefresh('TfmWMat', -1);

      finally
        fProgress.Hide;
        Free;
      end;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWhouse.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWhouse.DoOpen') else _udebug := nil;{$ENDIF}

  _ID_ := 'wid';

  RefType := rtWHouse;
  EditingClass := TfrmEditWHouse;
  cdsMain.Open;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWhouse.SetCaptions;
  var
    FTitle: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWhouse.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    Self.Caption := GetRS(Self.Name, 'TitleWHouse');
    colName.Caption := GetRS(Self.Name, 'Name');
    colAddr.Caption := GetRS(Self.Name, 'Adr');
    colNotes.Caption := GetRS(Self.Name, 'Notes');
    FTitle := Self.Caption;

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS(Self.Name, 'NameD') + ';' + 'name', pointer(1));
    FindList.AddObject(GetRS(Self.Name, 'AdrD') + ';'+'addr', pointer(2));
  end;
    
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWhouse.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWhouse.UpdateActionList') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF LIMITED}
    limited := cdsMain.Active and (cdsMain.recordCount > limitWarehousesCount);
  {$ELSE}
    limited := False;
  {$ENDIF}

  aNew.Enabled := not limited;
  aPatternInsert.Enabled := not limited;
  aProperties.Enabled := not cdsMain.IsEmpty and (grdMain.SelectedCount = 1);
  aDel.Enabled := not cdsMain.IsEmpty;
  aDynamic.Enabled := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWhouse.DoRefresh(const AID: integer; AParam: integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWhouse.DoRefresh') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWhouse.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWhouse.SetCurrentID') else _udebug := nil;{$ENDIF}

  inherited;
  grdMain.ClearSelection;
  cdsMain.Locate(_ID_, Value, []);

  with grdMain do if FocusedNode <> nil then FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWhouse.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWhouse.DoShow') else _udebug := nil;{$ENDIF}

  inherited;
  
  try grdMain.SetFocus; except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWhouse.colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWhouse.colImgGetText') else _udebug := nil;{$ENDIF}

  AText := '1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWhouse.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWhouse.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  inherited;

  if (ANode.Values[colDef.Index] = 1) and not ASelected
    then AFont.Color := DefaultColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWhouse.cdsMainBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWhouse.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsMain.FetchMacros;
  cdsMain.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fWHouse', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
