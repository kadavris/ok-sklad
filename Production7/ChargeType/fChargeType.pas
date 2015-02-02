{$I ok_sklad.inc}
unit fChargeType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ssBaseTypes,
  ssClientDataSet, dxDBTLCl6, dxGrClms6, ssBevel, TB2Item, BaseRef, ComCtrls,
  StdCtrls, ExtCtrls, ssDataSource, ssDBGrid, cxPC, cxControls;

type
  TfmChargeType = class(TfmBaseRef)
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem7: TTBItem;
    colImg: TdxDBGridImageColumn;
    colName: TdxDBGridColumn;
    colDef: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    srcAdd: TDataSource;

    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure srcAddDataChange(Sender: TObject; Field: TField);

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
  fmChargeType: TfmChargeType;

implementation

uses 
  EditAccountType, ClientData, prFun, prConst, ssFun,
  Export, prTypes, ssCallbackConst, fMessageDlg, EditChargeType, udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmChargeType.DoDelete;
  var
    i: integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmChargeType.DoDelete') else _udebug := nil;{$ENDIF}

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

       for i := 0 to grdMain.SelectedCount - 1 do begin
         TrStart;
         fProgress.lText.Caption := grdMain.SelectedNodes[i].Values[colName.Index];
         fProgress.pbMain.StepIt;
         Application.ProcessMessages;

         if grdMain.SelectedNodes[i].Values[colID.Index] = 1 then Continue;

         try
           if not DeleteData(dmData.SConnection, 'chargetype', grdMain.SelectedNodes[i].Values[colID.Index])
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

       LocateAfterDel;
       aRefresh.Execute;
       UpdateActionList;
//       if RefreshAllClients
//        then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_ACCOUNTTYPE);

      finally
       fProgress.Hide;
       Free;
      end;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmChargeType.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmChargeType.DoOpen') else _udebug := nil;{$ENDIF}


  _ID_ := 'CTypeID';
  RefType := rtChargeType;
  EditingClass := TfrmEditChargeType;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmChargeType.SetCaptions;
var
  FTitle: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmChargeType.SetCaptions') else _udebug := nil;{$ENDIF}


  with dmData.Lng do begin
    Self.Caption := GetRS(Self.Name, 'Title');
    FTitle := Self.Caption;
    colName.Caption := GetRS(Self.Name, 'Name');

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS(Self.Name, 'NameD') + ';' + 'name', pointer(1));
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmChargeType.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmChargeType.UpdateActionList') else _udebug := nil;{$ENDIF}


  aNew.Enabled := True;
  aPatternInsert.Enabled := True;
  aProperties.Enabled := not cdsMain.IsEmpty and (grdMain.SelectedCount = 1);
  aDel.Enabled := not cdsMain.IsEmpty and (cdsMain.FieldByName(_ID_).AsInteger > 1);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmChargeType.colImgGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmChargeType.colImgGetText') else _udebug := nil;{$ENDIF}


  AText := '1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmChargeType.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmChargeType.DoShow') else _udebug := nil;{$ENDIF}


  inherited;
  
  cdsMain.Locate(_ID_, 1, []);
  try grdMain.SetFocus; except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmChargeType.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmChargeType.SetCurrentID') else _udebug := nil;{$ENDIF}


  inherited;

  grdMain.ClearSelection;
  if Value > 0 then cdsMain.Locate(_ID_, Value, [])
    else cdsMain.Locate(_ID_, 1, []);
  if grdMain.FocusedNode <> nil
    then grdMain.FocusedNode.Selected := True;  

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmChargeType.srcAddDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmChargeType.srcAddDataChange') else _udebug := nil;{$ENDIF}


  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fChargeType', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
