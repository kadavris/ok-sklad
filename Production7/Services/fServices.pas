{$I ok_sklad.inc}
unit fServices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ssBaseTypes, prTypes,
  ssClientDataSet, dxDBTLCl6, dxGrClms6, ssBevel, TB2Item, BaseRef, ComCtrls,
  StdCtrls, ExtCtrls, ssDataSource, ssDBGrid, dxExEdtr6, cxContainer,
  cxEdit, cxTextEdit, cxMemo, dxInspct, cxPC, cxControls,
  ssMemDS, dxExEdtr, dxCntner;

type
  TfmServices = class(TfmBaseRef)
    aAddColOptions: TAction;
    aAddDel: TAction;
    aAddSelectAll: TAction;
    aNewGrp: TAction;
    colAddAmount: TdxDBGridColumn;
    colAddArtikul: TdxDBGridColumn;
    colAddID: TdxDBGridColumn;
    colAddName: TdxDBGridColumn;
    colAddPrice: TdxDBGridColumn;
    colAddRecNo: TdxDBGridColumn;
    colArtikul: TdxDBGridColumn;
    colCurrID: TdxDBGridColumn;
    colDef: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colImg: TdxDBGridImageColumn;
    colMID: TdxDBGridColumn;
    colMsrName: TdxDBGridColumn;
    colName: TdxDBGridColumn;
    colPrice: TdxDBGridColumn;
    colShortName: TdxDBGridColumn;
    grdAdd: TssDBGrid;
    inspMain: TdxInspector;
    irArtikul: TdxInspectorTextRow;
    irGrp: TdxInspectorTextRow;
    irIsTrans: TdxInspectorTextRow;
    irMeasure: TdxInspectorTextRow;
    irName: TdxInspectorTextRow;
    irNorm: TdxInspectorTextRow;
    irPrice: TdxInspectorTextRow;
    irType: TdxInspectorTextRow;
    lCount: TLabel;
    mdAdd: TssMemoryData;
    mdAddamount: TFloatField;
    mdAddartikul: TStringField;
    mdAddbarcode: TStringField;
    mdAddmatid: TIntegerField;
    mdAddmid: TIntegerField;
    mdAddmsrname: TStringField;
    mdAddname: TStringField;
    mdAddposid: TIntegerField;
    mdAddprice: TFloatField;
    mdAddproducer: TStringField;
    memNotes: TcxMemo;
    panFooter: TPanel;
    pcMain: TcxPageControl;
    pmAdd: TTBPopupMenu;
    srcAdd: TDataSource;
    ssBevel11: TssBevel;
    ssBevel15: TssBevel;
    ssBevel16: TssBevel;
    ssBevel17: TssBevel;
    ssBevel18: TssBevel;
    ssBevel1: TssBevel;
    ssBevel2: TssBevel;
    ssBevel4: TssBevel;
    ssBevel5: TssBevel;
    ssBevel6: TssBevel;
    stCount: TssBevel;
    TBItem19: TTBItem;
    TBItem20: TTBItem;
    TBItem21: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    tsAdd: TcxTabSheet;
    tsMain: TcxTabSheet;
    tsNotes: TcxTabSheet;

    procedure aAddColOptionsExecute(Sender: TObject);
    procedure aAddDelExecute(Sender: TObject);
    procedure aAddSelectAllExecute(Sender: TObject);
    procedure aNewGrpExecute(Sender: TObject);
    procedure cdsMainAfterOpen(DataSet: TDataSet);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure colAddRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure FrameResize(Sender: TObject);
    procedure grdAddCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdAddDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure grdAddDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure grdAddGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdAddKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdMainStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure inspMainDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure inspMainDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);
    procedure tsNotesShow(Sender: TObject);

  private
    DI: TDragInfo;
    DocInfo: TokAddDocInfo;

    procedure WMLocateID(var M: TMessage); message WM_LOCATEID;
    function SetNewSvcGroupParent(AID, APID: integer): integer;

  protected
    procedure SetCurrentID(const Value: integer); override;
    procedure AddMatToDoc;

  public
    procedure DoCut; override;
    procedure DoDrillDown; override;
    procedure DoPaste; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoDelete; override;
    procedure SetCaptions; override;
    procedure DoShow; override;
    procedure UpdateActionList; override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure DoSomething; override;
    procedure DoSetFocus; override;
    procedure NotifyChanged; override;
    procedure SetParam(const Value: Integer); override;
  end;

var
  fmServices: TfmServices;

implementation

uses 
  EditAccountType, ClientData, prFun, prConst, ssFun, Clipbrd,
  Export, ssCallbackConst, fMessageDlg, EditServices, ssStrUtil, Udebug;

  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}


//==============================================================================================
procedure TfmServices.DoDelete;
var
   id_, i: integer;
   ResetDef: boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.DoDelete') else _udebug := nil;{$ENDIF}


  if ((grdMain.SelectedCount = 1) and (ssMessageDlg(LangMan.GetRS('Common', 'DelConfirm'), ssmtWarning,
    [ssmbYes, ssmbNo]) = mrYes))
   or
     ((grdMain.SelectedCount > 1) and
     (ssMessageDlg(Format(LangMan.GetRS('Common', 'DelConfirmEx'),
       [grdMain.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes)) then begin
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
           if not DeleteDataEx(dmData.SConnection, 'services', 'svcid', grdMain.SelectedNodes[i].Values[colID.Index])
             then raise Exception.Create(dmData.Lng.GetRS('Common', 'DeleteError'));
           if not DelToRecycleBin
             then TrCommit
             else begin
               TrRollback;
               if not AddToRecycleBin(dmData.SConnection, Self.ClassName, grdMain.SelectedNodes[i].Values[colID.Index], grdMain.SelectedNodes[i].Values[colName.Index], False, Self.FunID) then begin
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
         fProgress.pbMain.StepIt;
         Application.ProcessMessages;
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
procedure TfmServices.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.DoOpen') else _udebug := nil;{$ENDIF}


  _ID_ := 'SvcID';
  RefType := rtServices;
  EditingClass := TfrmEditServices;

  pcMain.ActivePageIndex := 0;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.SetCaptions;
var
  FTitle: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.SetCaptions') else _udebug := nil;{$ENDIF}


  with dmData.Lng do begin
    Self.Caption := GetRS(Self.Name, 'Title');
    FTitle := Self.Caption;
    colName.Caption := GetRS(Self.Name, 'Name');
    colArtikul.Caption := GetRS(Self.Name, 'Artikul');
    colPrice.Caption := GetRS(Self.Name, 'Price');
    colShortName.Caption := GetRS(Self.Name, 'Currency');
    colMsrName.Caption := GetRS(Self.Name, 'Measure');
    lCount.Caption := GetRS(Self.Name, 'TotalCount') + ':';
    tsNotes.Caption := GetRS(Self.Name, 'Notes');
    tsMain.Caption := GetRS(Self.Name, 'MainInfo');
    tsAdd.Caption := GetRS('fmServices', 'SvcList');
    irArtikul.Caption := GetRS(Self.Name, 'Artikul');
    irName.Caption := GetRS(Self.Name, 'Name');
    irGrp.Caption := GetRS(Self.Name, 'Grp');
    irPrice.Caption := GetRS(Self.Name, 'Price');
    irIsTrans.Caption := GetRS(Self.Name, 'IsTrans');
    irType.Caption := GetRS(Self.Name, 'SvcType');
    irMeasure.Caption := GetRS(Self.Name, 'Measure');
    irNorm.Caption := GetRS(Self.Name, 'Norm');

    colAddName.Caption := GetRS(Self.Name, 'Name');
    colAddArtikul.Caption := GetRS(Self.Name, 'Artikul');
    colAddPrice.Caption := GetRS('fmServices', 'Price');
    colAddAmount.Caption := GetRS('fmWaybill', 'Amount');

    aAddDel.Caption := GetRS('Common', 'Del');
    aAddSelectAll.Caption := GetRS('Common', 'SelectAll');
    aAddColOptions.Caption := GetRS('Common', 'ColOptions') + '...';

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, Integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS(Self.Name, 'NameD') + ';' + 'name', Pointer(1));
    FindList.AddObject(GetRS(Self.Name, 'ArtikulD') + ';' + 'artikul', Pointer(2));

    DoRefreshFindParams;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.UpdateActionList') else _udebug := nil;{$ENDIF}


  aNew.Enabled := True;
  aPatternInsert.Enabled := True;
  aProperties.Enabled := not cdsMain.IsEmpty and (grdMain.SelectedCount = 1);
  aDel.Enabled := not cdsMain.IsEmpty;
  aDrillDown.Enabled := True;

  aAddDel.Enabled := grdAdd.SelectedCount > 0;
  if (mdAdd.IsEmpty and (Param > 0))
    then FCurrentID := -1
    else FCurrentID := 1;

  aPaste.Enabled := GrpID > 0;
  aCut.Enabled := grdMain.SelectedCount > 0;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.colImgGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.colImgGetText') else _udebug := nil;{$ENDIF}


  AText := '1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.DoShow') else _udebug := nil;{$ENDIF}


  inherited;
  try grdMain.SetFocus; except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.SetCurrentID') else _udebug := nil;{$ENDIF}


  inherited;

  if Value > 0 then cdsMain.Locate(_ID_, Value, []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.grdMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.grdMainKeyDown') else _udebug := nil;{$ENDIF}


  if Key = 13 then begin
    grdMainDblClick(grdMain);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.cdsMainBeforeOpen(DataSet: TDataSet);
var
  m: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}


  m := '';
  if FDrillDown and (GrpID > 0)
    then m := ' and s.pid in (' +
      GetDrillDownList(dmData.SConnection, 'services', 'svcid', 'pid', GrpID) + ')'
    else
  if GrpID > 0
    then m := ' and s.pid=' + IntToStr(GrpID);
  cdsMain.Macros.ParamByName('m').AsString := m;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.DoRefresh(const AID: integer; AParam: integer);
var
  FLastIndex: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.DoRefresh') else _udebug := nil;{$ENDIF}


  FLastIndex := grdMain.TopIndex;
//  cdsMain.DisableControls;
  case AParam of
  -1: begin
        GrpID := AID;
        SendMessage(ParentHandle, WM_SETTREEITEM, PGrpInfo(pointer(AID))^.ID, PGrpInfo(pointer(AID))^.PID);
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
       SendMessage(ParentHandle, WM_SETTREEITEM, GrpID, -1);
      end;
      DSRefresh(cdsMain, _ID_, AID);
    end;
  end;

  UpdateActionList;
  cdsMain.Locate(_ID_, AID, []);
  grdMain.TopIndex := FLastIndex;
//  cdsMain.EnableControls;
  SelectFocusedNode;
  grdMain.Update;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  grdMain.Adjust(nil, [colImg]);
  grdAdd.Adjust(nil, [colAddRecNo]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.colPriceGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.colPriceGetText') else _udebug := nil;{$ENDIF}


  try
    AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText)) + ' ' +
      ANode.Values[colShortName.Index];
  except
  end;    

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.cdsMainAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.cdsMainAfterOpen') else _udebug := nil;{$ENDIF}


  stCount.Caption := IntToStr(cdsMain.RecordCount);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.tsNotesShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.tsNotesShow') else _udebug := nil;{$ENDIF}


  tsNotes.Color := clWindow;
  memNotes.Width := tsNotes.Width - memNotes.Left - 8;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.srcMainDelayedDataChange(Sender: TObject;
  Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}


  FCurrentID := cdsMain.FieldByName(_ID_).AsInteger;
  if not cdsMain.IsEmpty then begin
    irName.Text := cdsMain.FieldByName('name').AsString;
    irArtikul.Text := cdsMain.FieldByName('artikul').AsString;
    irGrp.Text := cdsMain.FieldByName('grpname').AsString;
    irPrice.Text := FormatFloat(MoneyDisplayFormat,
      cdsMain.FieldByName('price').AsFloat) + ' ' +
      cdsMain.FieldByName('shortname').AsString;
    if cdsMain.FieldByName('istransport').AsInteger = 0
      then irIsTrans.Text := LangMan.GetRS('Common', 'No')
      else irIsTrans.Text := LangMan.GetRS('Common', 'Yes');
    if cdsMain.FieldByName('isnormed').AsInteger = 0 then begin
      irType.Text := LangMan.GetRS(Self.Name, 'SvcNotNormed');
      irNorm.Text := EmptyStr;
    end
    else begin
      irType.Text := LangMan.GetRS(Self.Name, 'SvcNormed');
      irNorm.Text := cdsMain.FieldByName('norm').AsString;
    end;
    irMeasure.Text := cdsMain.FieldByName('msrname').AsString;
    memNotes.Text := cdsMain.FieldByName('notes').AsString;
  end
  else begin
    irName.Text := EmptyStr;
    irArtikul.Text := EmptyStr;
    irGrp.Text := EmptyStr;
    irPrice.Text := EmptyStr;
    irIsTrans.Text := EmptyStr;
    irType.Text := EmptyStr;
    irMeasure.Text := EmptyStr;
    irNorm.Text := EmptyStr;
    memNotes.Text := EmptyStr;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.aNewGrpExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.aNewGrpExecute') else _udebug := nil;{$ENDIF}


  with TfrmEditServices.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmServices';
    OnDate := Self.OnDate;
    GrpID := Self.GrpID;
    cbType.ItemIndex := 1;
    cbType.Enabled := False;
    ID := 0;
    ShowModal;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.grdMainStartDrag(Sender: TObject;
  var DragObject: TDragObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.grdMainStartDrag') else _udebug := nil;{$ENDIF}


  DI.ID := grdMain.FocusedNode.Values[colID.Index];
  DI.GrpID := GrpID;
  if grdMain.SelectedCount = 1
    then DI.Name := grdMain.FocusedNode.Values[colName.Index]
    else DI.Name := IntToStr(grdMain.SelectedCount) + ' ' +
      LangMan.GetRS(Self.Name, 'MatREx');
  DI.IsGrp := 0;
  DI.Sender := grdMain;
  DI.RefType := Self.RefType;
  grdMain.Tag := Integer(@DI);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.WMLocateID(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.WMLocateID') else _udebug := nil;{$ENDIF}


  cdsMain.Locate(_ID_, M.WParam, []);
  with grdMain do begin
    ClearSelection;
    FocusedNode.Selected := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.DoCut;
var
  i: Integer;
  strClip: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.DoCut') else _udebug := nil;{$ENDIF}


  inherited;

  with Clipboard do begin
    Open;
    Clear;
    strClip := ClipText + 'svc:';
    for i := 0 to grdMain.SelectedCount - 1 do begin
      strClip := strClip + VarToStr(grdMain.SelectedNodes[i].Values[colID.Index]) + ';'
    end;
    Delete(strClip, Length(strClip), 1);
    SetTextBuf(PChar(strClip));
    Close;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.DoPaste;
var
  strClip: string;
  i, FCount, FID: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.DoPaste') else _udebug := nil;{$ENDIF}

  inherited;

  with Clipboard do begin
    strClip := AsText;
    if Pos(ClipText + 'svc:', strClip) <> 1 then begin
      ssMessageDlg(LangMan.GetRS('Common', 'ClipboardError'), ssmtError, [ssmbOk]);
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;
  end;

  Delete(strClip, 1, Length(ClipText + 'svc:'));
  FCount := WordCount(strClip, [';']);
  fProgress.Caption := LangMan.GetRS('Common', 'Moving');
  fProgress.pbMain.Max := FCount;

  FID := -1;
  
  try
    fProgress.Show;
    fProgress.Update;
    for i := 1 to FCount do begin
      FID := StrToInt(ExtractWord(i, strClip, [';']));
      if SetNewSvcGroupParent(FID, GrpID) <> 0 then begin
        ssMessageDlg('Error!', ssmtError, [ssmbOk]);
          begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

      end;
      fProgress.pbMain.StepIt;
      Application.ProcessMessages;
    end;

    DoRefresh(FID);

  finally
    fProgress.Hide;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmServices.SetNewSvcGroupParent(AID, APID: integer): integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.SetNewSvcGroupParent') else _udebug := nil;{$ENDIF}

  Result := 0;
  with newDataSet do
  try
    try
      ProviderName := 'pSvcGroup_UpdParent';
      FetchParams;
      Params.ParamByName('svcid').AsInteger := AID;
      Params.ParamByName('pid').AsInteger := APID;
      Execute;
    except
      Result := -1;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.DoSomething;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.DoSomething') else _udebug := nil;{$ENDIF}


  inherited;

  if Param = 0 then pcMain.Visible := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.DoSetFocus;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.DoSetFocus') else _udebug := nil;{$ENDIF}


  inherited;

  if grdMain.Visible then grdMain.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.inspMainDrawCaption(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.inspMainDrawCaption') else _udebug := nil;{$ENDIF}


  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor
    else AColor := clWindow;
  AFont.Color := clWindowText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.inspMainDrawValue(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.inspMainDrawValue') else _udebug := nil;{$ENDIF}


  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.NotifyChanged') else _udebug := nil;{$ENDIF}


  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtRefs, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.AddMatToDoc;
var
  FPrice: Extended;
  i: Integer;
  ANode: TdxTreeListNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.AddMatToDoc') else _udebug := nil;{$ENDIF}


  fProgress.Caption := LangMan.GetRS('Common', 'Executing');
  fProgress.pbMain.Max := grdMain.SelectedCount;
  if grdMain.SelectedCount > 1 then fProgress.Show;
  try
    mdAdd.DisableControls;
    for i := 0 to grdMain.SelectedCount - 1 do begin
      ANode := grdMain.SelectedNodes[i];
      fProgress.lText.Caption := ANode.Values[colName.Index];
      Application.ProcessMessages;
      with mdAdd do begin
        FPrice := ANode.Values[colPrice.Index] * CurrToCurr(dmData.SConnection,
          ANode.Values[colCurrID.Index], DocInfo.CurrID, Self.OnDate);
        Append;
        FieldByName('posid').AsInteger := RecordCount + 1;
        FieldByName('matid').AsInteger := ANode.Values[colID.Index];
        FieldByName('mid').AsInteger := ANode.Values[colMID.Index];
        FieldByName('name').AsString := ANode.Values[colName.Index];
        FieldByName('amount').AsFloat := 1;
        FieldByName('artikul').AsString := ANode.Values[colArtikul.Index];
        FieldByName('msrname').AsString := ANode.Values[colMsrName.Index];
        FieldByName('price').AsFloat := FPrice;
        Post;
      end;
      fProgress.pbMain.StepIt;
      Application.ProcessMessages;
    end;
  finally
    if fProgress.Visible then fProgress.Hide;
    mdAdd.EnableControls;
    grdAdd.Adjust(colAddName, []);
  end;
  grdAdd.SetFocus;
  grdAdd.ClearSelection;
  if grdAdd.FocusedNode <> nil
    then grdAdd.FocusedNode.Selected := True;
  UpdateActionList;
  grdAdd.FocusedColumn := colAddAmount.ColIndex;
  grdAdd.ShowEditor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.SetParam(const Value: Integer);
var
  i: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.SetParam') else _udebug := nil;{$ENDIF}


  inherited;

  FParam := Value;
  pcMain.Visible := not (ModalView and (Value = 0));
//  splMain.Visible := pcMain.Visible;
  if Value <> 0 then begin
    DocInfo := TokAddDocInfo(Pointer(Value)^);
    colPrice.Caption := LangMan.GetRS('fmWaybill', 'Price') + ', ' + DocInfo.CurrName;
    for i := 0 to pcMain.PageCount - 1 do
      if pcMain.Pages[i] = tsAdd
        then tsAdd.TabVisible := True
        else pcMain.Pages[i].TabVisible := False;
    pcMain.ActivePage := tsAdd;
    case DocInfo.Tag of
      0: tsAdd.ImageIndex := II_WBIN;
      1: tsAdd.ImageIndex := II_WBOUT;
      2: tsAdd.ImageIndex := II_ACCOUT;
      3: tsAdd.ImageIndex := II_ORDEROUT;
    end;
  end;

  mdAdd.Open;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.grdAddDragDrop(Sender, Source: TObject; X,
  Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.grdAddDragDrop') else _udebug := nil;{$ENDIF}


  AddMatToDoc;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.grdAddDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.grdAddDragOver') else _udebug := nil;{$ENDIF}


  Accept := Source = grdMain;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.grdAddCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.grdAddCustomDrawCell') else _udebug := nil;{$ENDIF}


  try
    if odd(ANode.Index) and not ASelected
      then AColor := GridOddLinesColor;
    if ASelected then
      if (AColumn.ColIndex <> grdAdd.FocusedColumn) or not AFocused
        then begin
          AColor := $00BEBEBE;
        end;
    if ASelected and AFocused and AColumn.DisableEditor then AColor := grdAdd.HighlightColor;
    if not ASelected or not AFocused
      then AFont.Color := clWindowText;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.grdAddKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.grdAddKeyDown') else _udebug := nil;{$ENDIF}


  if (Key = 13) and (grdAdd.FocusedColumn = colAddAmount.ColIndex) then begin
    grdMain.SetFocus;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.grdMainDblClick') else _udebug := nil;{$ENDIF}


  with grdMain do
    if Count > 0 then begin
      if ModalView then begin
        if Param = 0 then begin
          FCurrentID := cdsMain.FieldByName(_ID_).AsInteger;
          SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);
        end
        else AddMatToDoc;  
      end
      else DoProperties;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.colAddRecNoGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.colAddRecNoGetText') else _udebug := nil;{$ENDIF}


  AText := IntToStr(ANode.AbsoluteIndex + 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.aAddSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.aAddSelectAllExecute') else _udebug := nil;{$ENDIF}


  grdAdd.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.aAddDelExecute(Sender: TObject);
var
  i: Integer;
  ANode: TdxTreeListNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.aAddDelExecute') else _udebug := nil;{$ENDIF}


  fProgress.Caption := LangMan.GetRS('Common', 'Deleting');
  fProgress.pbMain.Max := grdAdd.SelectedCount;
  if grdAdd.SelectedCount > 1 then fProgress.Show;
  try
    mdAdd.DisableControls;
    for i := 0 to grdAdd.SelectedCount - 1 do begin
      ANode := grdAdd.SelectedNodes[i];
      fProgress.lText.Caption := ANode.Values[colAddName.Index];
      fProgress.pbMain.StepIt;
      mdAdd.Locate('matid', ANode.Values[colAddID.Index], []);
      mdAdd.Delete;
      Application.ProcessMessages;
    end;
  finally
    if fProgress.Visible then fProgress.Hide;
    mdAdd.EnableControls;
    grdAdd.Adjust(nil, [colAddRecNo]);
  end;
  if grdAdd.FocusedNode <> nil
    then grdAdd.FocusedNode.Selected := True;
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.aAddColOptionsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.aAddColOptionsExecute') else _udebug := nil;{$ENDIF}


  grdAdd.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.grdAddGetOptionsTitle(Sender: TObject;
  var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.grdAddGetOptionsTitle') else _udebug := nil;{$ENDIF}


  ImgList := dmData.Images;
  AIndex := tsAdd.ImageIndex;
  AText := LangMan.GetRS('fmServices', 'SvcList');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmServices.DoDrillDown;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmServices.DoDrillDown') else _udebug := nil;{$ENDIF}


  inherited;

  DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fServices', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
