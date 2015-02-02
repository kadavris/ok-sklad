{$I ok_sklad.inc}
unit fCountries;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ssBaseTypes,
  ssClientDataSet, dxDBTLCl6, dxGrClms6, ssBevel, TB2Item, BaseRef,
  ssDataSource, ssDBGrid, ExtCtrls, cxPC, cxControls;

type
  TfmCountries = class(TfmBaseRef)
    TBItem5: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    colImg: TdxDBGridImageColumn;
    colShortName: TdxDBGridColumn;
    colName: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);

  protected
    procedure UpdateActionList; override;
    procedure SetCurrentID(const Value: integer); override;

  public
    procedure DoOpen(AParam: Variant); override;
    procedure DoDelete; override;
    procedure SetCaptions; override;
    procedure DoShow; override;
  end;

var
  fmCountries: TfmCountries;

implementation

uses 
  EditCountry, ClientData, prFun, prConst, ssFun,
  Export, prTypes, ssCallbackConst, fMessageDlg, udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmCountries.DoDelete;
  var
    id_, i: integer;
    ResetDef: boolean;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCountries.DoDelete') else _udebug := nil;{$ENDIF}


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
           if not DeleteData(dmData.SConnection, 'countries', grdMain.SelectedNodes[i].Values[colID.Index])
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
               else if ssMessageDlg(Format(LangMan.GetRS('Common', 'NoDeleteEx'), [grdMain.SelectedNodes[i].Values[colName.Index]]), ssmtError,
                   [ssmbYes, ssmbNo]) <> mrYes
             then begin
               TrRollback;
               Break;
             end;
           end;
         end;
       end;

       LocateAfterDel;
       aRefresh.Execute;
       UpdateActionList;

       if RefreshAllClients
        then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_COUNTRIES);

     finally
       fProgress.Hide;
       Free;
     end;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCountries.DoOpen(AParam: Variant);
var
  i: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCountries.DoOpen') else _udebug := nil;{$ENDIF}


  _ID_ := 'cid';

  RefType := rtCountries;
  EditingClass := TfrmEditCountry;
  cdsMain.Open;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCountries.SetCaptions;
var
  FTitle: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCountries.SetCaptions') else _udebug := nil;{$ENDIF}


  with dmData.Lng do begin
    Self.Caption := GetRS(Self.Name, 'Title');
    FTitle := Self.Caption;
    colName.Caption := GetRS(Self.Name, 'Name');
    colShortName.Caption := GetRS(Self.Name, 'ShortName');

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS(Self.Name, 'NameD') + ';' + 'name', pointer(1));
    FindList.AddObject(GetRS(Self.Name, 'ShortNameD') + ';' + 'shortname', pointer(2));
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCountries.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCountries.UpdateActionList') else _udebug := nil;{$ENDIF}


  aNew.Enabled := True;
  aPatternInsert.Enabled := True;
  aProperties.Enabled:= not cdsMain.IsEmpty and (grdMain.SelectedCount = 1);
  aDel.Enabled:= not cdsMain.IsEmpty;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCountries.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCountries.DoShow') else _udebug := nil;{$ENDIF}


  inherited;
  try grdMain.SetFocus; except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCountries.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCountries.SetCurrentID') else _udebug := nil;{$ENDIF}


  inherited;
  cdsMain.Locate(_ID_, Value, []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCountries.colImgGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCountries.colImgGetText') else _udebug := nil;{$ENDIF}


  AText := '1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fCountries', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
