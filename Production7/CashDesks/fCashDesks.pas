{$I ok_sklad.inc}
unit fCashDesks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ssBaseTypes,
  ssClientDataSet, dxDBTLCl6, dxGrClms6, ssBevel, TB2Item, BaseRef, ComCtrls,
  StdCtrls, ExtCtrls, ssDataSource, ssDBGrid, cxPC, cxControls;

type
  TfmCashDesks = class(TfmBaseRef)
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem7: TTBItem;
    colImg: TdxDBGridImageColumn;
    colName: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colDef: TdxDBGridColumn;

    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);

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
  fmCashDesks: TfmCashDesks;

implementation

uses 
  ClientData, prFun, prConst, ssFun,
  Export, prTypes, ssCallbackConst, fMessageDlg, EditCashDesk, Udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfmCashDesks.DoDelete;
  var
    id_, i: integer;
    ResetDef: boolean;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCashDesks.DoDelete') else _udebug := nil;{$ENDIF}

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
         fProgress.lText.Caption := grdMain.SelectedNodes[i].Values[colName.Index];
         try
           if not DeleteData(dmData.SConnection, 'cashdesks', grdMain.SelectedNodes[i].Values[colID.Index])
             then raise Exception.Create(dmData.Lng.GetRS('Common', 'DeleteError'));

           if cdsMain.FieldByName('def').AsInteger = 1 then ResetDef := True;

           if not DelToRecycleBin
             then TrCommit
             else begin
               TrRollback;
               if not AddToRecycleBin(dmData.SConnection, Self.ClassName, grdMain.SelectedNodes[i].Values[colID.Index], grdMain.SelectedNodes[i].Values[colName.Index], ResetDef, Self.FunID) then begin
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
               else if ssMessageDlg(Format(LangMan.GetRS('Common', 'NoDeleteEx'), [grdMain.SelectedNodes[i].Values[colName.Index]]), ssmtError,
                       [ssmbYes, ssmbNo]) <> mrYes 
                    then begin
                      TrRollback;
                      Break;
                    end;
           end;
         end;
         fProgress.pbMain.StepIt;
         Application.ProcessMessages;
       end;

       if ResetDef then begin
         ProviderName := 'pCashDesks_Min';
         Open;
         if not IsEmpty then begin
           id_ := Fields[0].AsInteger;
           Close;
           ProviderName:='pCashDesks_SetDef1';
           FetchParams;
           Params.ParamByName(_ID_).AsInteger:=id_;
           Execute;
         end 
         else Close;
       end;

       LocateAfterDel;
       aRefresh.Execute;
       frmMainForm.ExecRefresh('TfmFinance', 0, Integer(rtCashDesks));
       UpdateActionList;
       //if RefreshAllClients then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_ACCOUNTTYPE);

      finally
       fProgress.Hide;
       Free;
      end;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCashDesks.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCashDesks.DoOpen') else _udebug := nil;{$ENDIF}


  _ID_ := 'CashID';
  RefType := rtCashDesks;
  EditingClass := TfrmEditCashDesk;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCashDesks.SetCaptions;
var
  FTitle: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCashDesks.SetCaptions') else _udebug := nil;{$ENDIF}
    
  with dmData.Lng do begin
    Self.Caption := GetRS(Self.Name, 'Title');
    FTitle := Self.Caption;
    colName.Caption := GetRS(Self.Name, 'Name');

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, Integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS(Self.Name, 'NameD') + ';' + 'name', pointer(1));
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCashDesks.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCashDesks.UpdateActionList') else _udebug := nil;{$ENDIF}


  aNew.Enabled := True;
  aPatternInsert.Enabled := True;
  aProperties.Enabled := not cdsMain.IsEmpty and (grdMain.SelectedCount = 1);
  aDel.Enabled := not cdsMain.IsEmpty;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCashDesks.colImgGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCashDesks.colImgGetText') else _udebug := nil;{$ENDIF}


  AText := '1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCashDesks.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCashDesks.DoShow') else _udebug := nil;{$ENDIF}


  inherited;
  try grdMain.SetFocus; except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCashDesks.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCashDesks.SetCurrentID') else _udebug := nil;{$ENDIF}


  inherited;

  if Value > 0 then begin
    grdMain.ClearSelection;
    cdsMain.Locate(_ID_, Value, []);
    if grdMain.FocusedNode <> nil then grdMain.FocusedNode.Selected := True;
  end;  

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCashDesks.grdMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCashDesks.grdMainKeyDown') else _udebug := nil;{$ENDIF}


  if Key = 13 then begin
    grdMainDblClick(grdMain);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCashDesks.grdMainCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCashDesks.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}


  if (ANode.Values[colDef.Index] = 1) and not ASelected
    then AFont.Color := DefaultColor;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fCashDesks', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
