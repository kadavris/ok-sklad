{$I ok_sklad.inc}
unit fMeasures;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ssClientDataSet, ssBaseTypes,
  FR_DSet, FR_DBSet, FR_Class, FR_Desgn, dxDBTLCl6, dxGrClms6,
  ssBevel, TB2Item, BaseRef, ssDataSource, ssDBGrid, ExtCtrls, cxPC,
  cxControls;

type
  TfmMeasures = class(TfmBaseRef)
    colCode: TdxDBGridColumn;
    colDef: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colImg: TdxDBGridImageColumn;
    colName: TdxDBGridColumn;
    colShortName: TdxDBGridColumn;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;

    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);

  public
    procedure UpdateActionList; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoDelete; override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure SetCaptions; override;
    procedure DoShow; override;
    procedure DoActivate; override;
  end;

var
  fmMeasures: TfmMeasures;

implementation

uses
  EditMeasure, ClientData, prFun, prConst, ssFun, Export,
  prTypes, ssCallbackConst, fMessageDlg, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmMeasures.DoDelete;
 var
   id_, i: integer;
   ResetDef: boolean;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMeasures.DoDelete') else _udebug := nil;{$ENDIF}


  if ((grdMain.SelectedCount = 1) and (mrYes = ssMessageDlg(LangMan.GetRS('Common', 'DelConfirm'), ssmtWarning,[ssmbYes, ssmbNo])))
     or
     ((grdMain.SelectedCount > 1) and (mrYes = ssMessageDlg(Format(LangMan.GetRS('Common', 'DelConfirmEx'), [grdMain.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo])))
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
           if not DeleteData(dmData.SConnection, 'measures', grdMain.SelectedNodes[i].Values[colID.Index])
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
               else if ssMessageDlg(Format(LangMan.GetRS('Common', 'NoDeleteEx'),
                       [grdMain.SelectedNodes[i].Values[colName.Index]]), ssmtError,
                       [ssmbYes, ssmbNo]) <> mrYes 
                    then begin
                      TrRollback;
                      Break;
                    end;
           end;
         end;
       end;

       if ResetDef then begin
         ProviderName := 'pMeasures_Min';
         Open;
         if not IsEmpty then begin
           id_:=Fields[0].AsInteger;
           Close;
           ProviderName := 'pMeasures_SetDef1';
           FetchParams;
           Params.ParamByName(_ID_).AsInteger:=id_;
           Execute;
         end
         else Close;
       end;
       LocateAfterDel;
       aRefresh.Execute;
       UpdateActionList;

       if RefreshAllClients
        then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_MEASURES);

      finally
       fProgress.Hide;
       Free;
      end;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMeasures.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMeasures.DoOpen') else _udebug := nil;{$ENDIF}


  _ID_ := 'mid';

  FindType := ftMeasures;
  RefType := rtMeasures;
  EditingClass := TfrmEditMeasure;
  cdsMain.Open;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMeasures.SetCaptions;
 var
  FTitle: string;
  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMeasures.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    FTitle := GetRS(Self.Name, 'TitleMeasure');
    Self.Caption := FTitle;
    colCode.Caption := GetRS('fmMeasures', 'Code');
    colName.Caption := GetRS('fmMeasures', 'Name');
    colShortName.Caption := GetRS('fmMeasures', 'ShortName');

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS('fmMeasures', 'NameD') + ';' + 'name', Pointer(1));
    FindList.AddObject(GetRS('fmMeasures', 'ShortNameD') + ';' + 'shortname', Pointer(2));
  end;
  
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMeasures.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMeasures.UpdateActionList') else _udebug := nil;{$ENDIF}


  aNew.Enabled := True;
  aPatternInsert.Enabled := True;
  aProperties.Enabled := not cdsMain.IsEmpty and (grdMain.SelectedCount = 1);
  aDel.Enabled := not cdsMain.IsEmpty;
  aDynamic.Enabled := False;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMeasures.DoRefresh(const AID: integer; AParam: integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMeasures.DoRefresh') else _udebug := nil;{$ENDIF}


  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMeasures.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMeasures.DoShow') else _udebug := nil;{$ENDIF}


  inherited;

  try 
    grdMain.SetFocus; 
  except 
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMeasures.DoActivate;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMeasures.DoActivate') else _udebug := nil;{$ENDIF}


  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMeasures.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMeasures.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}


  inherited;

  if (ANode.Values[colDef.Index] = 1) and not ASelected
    then AFont.Color := DefaultColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMeasures.colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMeasures.colImgGetText') else _udebug := nil;{$ENDIF}


  AText := '1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fMeasures', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
