{$I ok_sklad.inc}
unit fBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, TB2Item, DB, DBClient, StdCtrls, 
  ExtCtrls, ShellAPI, Grids, DBGrids,
  cxPC, cxControls, 
  dxDBTLCl6, dxGrClms6, dxExEdtr6, dxEditor6, dxInspct, dxDBInsp, dxInspRw, dxDBInRw,
  dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  ssBaseConst, ssBaseTypes, ssBevel, ssClientDataSet, dxExEdtr, dxCntner;

type
  TfmBank = class(TssBaseFrame)
    cdsBank: TClientDataSet;
    cdsContact: TssClientDataSet;
    colAddr: TdxDBGridColumn;
    colBankID: TdxDBGridColumn;
    colCEMail: TdxDBGridColumn;
    colCJob: TdxDBGridColumn;
    colCName: TdxDBGridColumn;
    colCPhone: TdxDBGridColumn;
    colDef: TdxDBGridColumn;
    colImg: TdxDBGridImageColumn;
    colMFO: TdxDBGridColumn;
    colName: TdxDBGridColumn;
    colWWW: TdxDBGridColumn;
    dbgBank: TdxDBGrid;
    dsBank: TDataSource;
    grdContact: TdxDBGrid;
    inspMain: TdxInspector;
    irAddr: TdxInspectorTextMemoRow;
    irCorAcc: TdxInspectorTextRow;
    irWWW: TdxInspectorTextHyperLinkRow;
    panGrid: TPanel;
    pcMain: TcxPageControl;
    srcContact: TDataSource;                      
    ssBevel12: TssBevel;
    ssBevel1: TssBevel;
    ssBevel2: TssBevel;
    ssBevel3: TssBevel;
    ssBevel4: TssBevel;
    ssBevel5: TssBevel;
    ssBevel6: TssBevel;
    ssBevel9: TssBevel;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    tsAddr: TcxTabSheet;
    tsContact: TcxTabSheet;

    procedure aSelectAllExecute(Sender: TObject);
    procedure cdsContactBeforeOpen(DataSet: TDataSet);
    procedure colCNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure dbgBankCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgBankDblClick(Sender: TObject);
    procedure dbgBankKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgBankSelectedCountChange(Sender: TObject);
    procedure dsBankDataChange(Sender: TObject; Field: TField);
    procedure edEmailClick(Sender: TObject);
    procedure edEmailMouseLeave(Sender: TObject);
    procedure edEmailMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FrameResize(Sender: TObject);
    procedure grdContactCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure inspMainDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure inspMainDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure irEmailStartClick(Sender: TObject);
    procedure lWWWOpenClick(Sender: TObject);
    procedure lWWWOpenMouseLeave(Sender: TObject);
    procedure lWWWOpenMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure pcMainChange(Sender: TObject);

  private
    procedure RefreshDetail;

  protected
    function GetIDForUpdate: integer; override;
    procedure SetCurrentID(const Value: integer); override;
    procedure LocateAfterDel;

  public
    procedure DoOpen(AParam: Variant); override;
    procedure DoClose; override;
    procedure DoProperties; override;
    procedure DoInsert; override;
    procedure DoDelete; override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure SetCaptions; override;
    procedure UpdateActionList; override;
    procedure DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True); override;
    procedure DoExcel(Grid: TdxDBGrid); override;
    procedure DoShow; override;
  end;

var
  fmBank: TfmBank;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  EditBank, ClientData, prFun, prConst, BankPersonsEdit, ssFun,
  Export, prTypes, ssCallbackConst, fMessageDlg, Udebug, xLngDefs;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}


const
     _ID_ = 'BankID';

//==============================================================================================
procedure TfmBank.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.DoClose') else _udebug := nil;{$ENDIF}


  cdsBank.Close;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.DoDelete;
var
   id_, i: integer;
   ResetDef: boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.DoDelete') else _udebug := nil;{$ENDIF}


  if ((dbgBank.SelectedCount = 1) and (ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes))
     or
     ((dbgBank.SelectedCount > 1) and
     (ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [dbgBank.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes))
  then begin
     fProgress.Show;

     with newDataSet do
     try
       Application.ProcessMessages;
       fProgress.Caption := rs('Common', 'Deleting');
       fProgress.UpDate;
       fProgress.pbMain.Max := dbgBank.SelectedCount;
       ResetDef := False;
       for i := 0 to dbgBank.SelectedCount - 1 do begin
         TrStart;

         try
           fProgress.lText.Caption := dbgBank.SelectedNodes[i].Values[colName.Index];

           if not DeleteData(dmData.SConnection, 'banks', dbgBank.SelectedNodes[i].Values[colBankID.Index])
             then raise Exception.Create(dmData.Lng.GetRS('Common', 'DeleteError'));

           if not DelToRecycleBin
             then TrCommit
             else begin
               TrRollback;
               if not AddToRecycleBin(dmData.SConnection, Self.ClassName, dbgBank.SelectedNodes[i].Values[colBankID.Index], dbgBank.SelectedNodes[i].Values[colName.Index], False, Self.FunID) then begin
                 ssMessageDlg(rs('Common', 'ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
                   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

               end;
             end;
         except
           on e:exception do begin
             TrRollback;
             if (dbgBank.SelectedCount = 1)
               then ssMessageDlg(rs('Common', 'NoDelete') + #10#13 +
                 e.Message, ssmtError, [ssmbOk])
               else if ssMessageDlg(Format(rs('Common', 'NoDeleteEx'),
                   [dbgBank.SelectedNodes[i].Values[colName.Index]]), ssmtError,
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
       if RefreshAllClients
        then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_BANKS);

      finally
       fProgress.Hide;
       Free;
      end;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.DoOpen(AParam: Variant);
var
   i: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.DoOpen') else _udebug := nil;{$ENDIF}


  RefType := rtBank;
  EditingClass := TfrmEditBank;
  cdsBank.Open;

  inherited;

  if not LoadExpParams
   then with ExportList do
    for i := 0 to dbgBank.ColumnCount-1 do
     if dbgBank.Columns[i].Tag=1 then AddObject(dbgBank.Columns[i].Name, pointer(1));

  with dbgBank do
    if FocusedNode <> nil
      then FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.SetCaptions;
  var
    FTitle: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    Self.Caption := GetRS(Self.Name, 'TitleBank');
    FTitle := Self.Caption;
    colName.Caption := GetRS(Self.Name, 'Name');

    case CountryRules.AR of
      accRul_RU: colMFO.Caption := rs(Self.Name, 'BIC');
      accRul_UA: colMFO.Caption := rs(Self.Name,'MFO');
      else colMFO.Caption := rs(Self.Name, 'ABA');
    end;

    colWWW.Caption := GetRS(Self.Name, 'WWW');
    colAddr.Caption := GetRS(Self.Name, 'Address');
    tsContact.Caption := GetRS(Self.Name, 'gbKontakt');
    tsAddr.Caption := GetRS(Self.Name, 'Address');
    irAddr.Caption := GetRS(Self.Name, 'Address');
    irWWW.Caption := GetRS(Self.Name, 'WWW');
    irCorAcc.Caption := GetRS(Self.Name, 'CorAcc');

    colCEMail.Caption := GetRS(Self.Name, 'EMail');
    colCJob.Caption := GetRS(Self.Name, 'Job');
    colCName.Caption := GetRS(Self.Name, 'FIO');
    colCPhone.Caption := GetRS(Self.Name, 'Phone');

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS(Self.Name, 'Name') + ';' + 'name', pointer(1));
    FindList.AddObject(colMFO.Caption + ';' + 'mfo', pointer(2));
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.dbgBankDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.dbgBankDblClick') else _udebug := nil;{$ENDIF}


  with dbgBank do
    if Count>0 then begin
     if ModalView then SendMessage(ParentHandle, WM_SELECTITEM, 0, 0)
      else DoProperties;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.UpdateActionList') else _udebug := nil;{$ENDIF}


     aNew.Enabled := True;
     aPatternInsert.Enabled := True;
     aProperties.Enabled := not cdsBank.IsEmpty and (dbgBank.SelectedCount = 1);
     aDel.Enabled := not cdsBank.IsEmpty;

     inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.DoRefresh(const AID: integer; AParam: integer = 0);
var
  FLastIndex: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.DoRefresh') else _udebug := nil;{$ENDIF}


  FLastIndex := dbgBank.TopIndex;
  if (AParam = 1) or grdContact.Focused
    then DSRefresh(cdsContact, 'personid', AID)
    else DSRefresh(cdsBank, _ID_, AID);
  dbgBank.TopIndex := FLastIndex;  
  UpdateActionList;
  if dbgBank.FocusedNode <> nil
    then dbgBank.FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmBank.GetIDForUpdate: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.GetIDForUpdate') else _udebug := nil;{$ENDIF}


     Result := cdsBank.fieldbyname(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.lWWWOpenClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.lWWWOpenClick') else _udebug := nil;{$ENDIF}


//if Trim(lWWWOpen.Caption)<>EmptyStr then
//begin
//  ShellExecute(Application.Handle, nil,PChar(lWWWOpen.Caption), nil, nil, SW_SHOWNORMAL);
//end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.lWWWOpenMouseLeave(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.lWWWOpenMouseLeave') else _udebug := nil;{$ENDIF}


  inherited;
//  if Trim(lWWWOpen.Caption)<>EmptyStr then
//  begin
//  lWWWOpen.Font.Color := clNavy;
//  lWWWOpen.Cursor := crDefault;
//  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.lWWWOpenMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
 
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.lWWWOpenMouseMove') else _udebug := nil;{$ENDIF}


//  if Trim(lWWWOpen.Caption)<>EmptyStr then
//  begin
//  lWWWOpen.Font.Color := clBlue;
//  lWWWOpen.Cursor := crHandPoint
//  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
//==============================================================================================
procedure TfmBank.edEmailClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.edEmailClick') else _udebug := nil;{$ENDIF}


  inherited;
//  if trim(edEmail.Text)<>EmptyStr then
//  ShellExecute(Application.Handle, nil,PChar('mailto:'+edEmail.Text),nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.edEmailMouseLeave(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.edEmailMouseLeave') else _udebug := nil;{$ENDIF}


  inherited;
{ if trim(edEmail.Text)<>EmptyStr then
  begin
  edEmail.Cursor := crDefault;
  edEmail.Font.Color := clBlack;
  end;
}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.edEmailMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.edEmailMouseMove') else _udebug := nil;{$ENDIF}


  inherited;
{ if trim(edEmail.Text)<>EmptyStr then
  begin
  edEmail.Cursor := crHandPoint;
  edEmail.Font.Color := clBlue;
  edEmail.Hint := 'Mail to:'+edEmail.Text;
  end
  else edEmail.Hint := '';}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.irEmailStartClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.irEmailStartClick') else _udebug := nil;{$ENDIF}


//  if trim(irEmail.EditText)<>EmptyStr then
//   ShellExecute(Application.Handle, nil, PChar('mailto:'+irEmail.EditText), nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.cdsContactBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.cdsContactBeforeOpen') else _udebug := nil;{$ENDIF}


     cdsContact.Params.ParamByName('bankid').AsInteger := cdsBank.fieldbyname('bankid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.RefreshDetail;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.RefreshDetail') else _udebug := nil;{$ENDIF}


     if pcMain.ActivePage.Tag=1 then begin
      if pcMain.ActivePage=tsContact then begin
       DSRefresh(cdsContact, 'personid', 0);
      end;
      pcMain.ActivePage.Tag := 0;
     end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.pcMainChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.pcMainChange') else _udebug := nil;{$ENDIF}


     RefreshDetail;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.dsBankDataChange(Sender: TObject; Field: TField);
var
  i: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.dsBankDataChange') else _udebug := nil;{$ENDIF}


     for i := 0 to pcMain.PageCount-1 do
      pcMain.Pages[i].Tag := 1;
     RefreshDetail;

     if not cdsBank.IsEmpty then begin
      irWWW.Text := cdsBank.fieldbyname('www').AsString;
      irAddr.Text := cdsBank.fieldbyname('address').AsString;
      irCorAcc.Text := cdsBank.fieldbyname('coracc').AsString;
     end
     else begin
      irWWW.Text := EmptyStr;
      irAddr.Text := EmptyStr;
      irCorAcc.Text := EmptyStr;
     end;
     FCurrentID := cdsBank.fieldbyname(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.dbgBankCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
  ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
  var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
  var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.dbgBankCustomDrawCell') else _udebug := nil;{$ENDIF}


     if (ANode.Values[colDef.Index]=1) and not ASelected then AFont.Color := DefaultColor;
     if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex) then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.DoProperties;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.DoProperties') else _udebug := nil;{$ENDIF}


{  if grdContact.Focused then begin
   with TfrmBankPersonsEdit.Create(nil) do
    try
     UseMemDS := False;
     MainHandle := Self.Handle;
     PID := cdsBank.fieldbyname('bankid').AsInteger;
     ID := cdsContact.fieldbyname('personid').AsInteger;
     ParentNameEx := Self.Name;
     ShowModal;
    finally
     Free;
    end;
  end
  else} inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.DoInsert;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.DoInsert') else _udebug := nil;{$ENDIF}


  if grdContact.Focused then begin
   with TfrmBankPersonsEdit.Create(nil) do
    try
     UseMemDS := False;
     MainHandle := Self.Handle;
     PID := cdsBank.fieldbyname('bankid').AsInteger;
     ID := 0;
     ParentNameEx := Self.Name;
     ShowModal;
    finally
     Free;
    end;
  end
  else inherited;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True);
  var
    FNode: TdxTreeListNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.DoFind') else _udebug := nil;{$ENDIF}


   inherited;

   if FindStr<>AStr then FindIndex := -1;
   FindStr := AStr;
   if AStr=EmptyStr then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;


   FNode := FindNode(dbgBank, AFName, AStr, ALocateType, FindIndex, AFwd);
   if FNode <> nil then begin
     FindIndex := FNode.Index;
     cdsBank.Locate(_ID_, FNode.Values[colBankID.Index], []);
     dbgBank.ClearSelection;
     if dbgBank.FocusedNode <> nil then dbgBank.FocusedNode.Selected := True;
   end else ssMessageDlg(rs('Common', 'FindError') +', ' +
     rs('Common', 'DSEnd'), ssmtInformation, [ssmbOk]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.inspMainDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.inspMainDrawCaption') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor
    else AColor := clWindow;

  AFont.Color := clWindowText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.DoExcel(Grid: TdxDBGrid);
  var
    FShowExcel: Boolean;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.DoExcel') else _udebug := nil;{$ENDIF}

  inherited;

  with TfrmExport.Create(nil) do
  try
    if cdsFunc.Locate('classname', Self.ClassName, [])
      then FunID := cdsFunc.fieldbyname('funid').AsInteger
      else FunID := 0;

    grdExp := dbgBank;
    lName.Caption := self.Caption;
    FList := ExportList;
    if ShowModal <> mrOk
      then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end
      else FShowExcel := chbShowExcel.Checked;
   finally
    Free;
   end;

  ExportToExcel(dbgBank, ExportList, FShowExcel);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.grdContactCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.grdContactCustomDrawCell') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex) then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.colImgGetText') else _udebug := nil;{$ENDIF}

  AText := '1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.DoShow') else _udebug := nil;{$ENDIF}

  inherited;

  if ModalView then begin
   pcMain.Visible := False;
   panGrid.Align := alClient;
   try dbgBank.SetFocus; except end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.FrameResize(Sender: TObject);
  var
    AStyle: integer;
    Offset: integer;
   {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  AStyle := GetWindowLong(dbgBank.Handle, GWL_STYLE);

  if AStyle and WS_VSCROLL = WS_VSCROLL
    then Offset := 19
    else Offset := 2;

  colName.Width := dbgBank.Width-colImg.Width-colMFO.Width-Offset;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.SetCurrentID') else _udebug := nil;{$ENDIF}
   
  inherited;
  cdsBank.Locate(_ID_, Value, []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.dbgBankKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.dbgBankKeyDown') else _udebug := nil;{$ENDIF}


  if Key=13 then begin
   dbgBankDblClick(dbgBank);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.aSelectAllExecute') else _udebug := nil;{$ENDIF}


  dbgBank.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.dbgBankSelectedCountChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.dbgBankSelectedCountChange') else _udebug := nil;{$ENDIF}


  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.inspMainDrawValue(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.inspMainDrawValue') else _udebug := nil;{$ENDIF}


  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.colCNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.colCNameGetText') else _udebug := nil;{$ENDIF}


  AText := '    ' + AText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBank.LocateAfterDel;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBank.LocateAfterDel') else _udebug := nil;{$ENDIF}

  with dbgBank do
    if SelectedCount > 1 then begin
      cdsBank.First;
    end
    else if cdsBank.RecordCount > 1 then
      if (FocusedNode.Index = Count - 1) and (FocusedNode.Index > 0)
        then cdsBank.Locate(_ID_, FocusedNode.GetPrev.Values[ColumnByFieldName(KeyField).Index], [])
        else cdsBank.Locate(_ID_, FocusedNode.GetNext.Values[ColumnByFieldName(KeyField).Index], []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fBank', @Debugging, DEBUG_group_ID);{$ENDIF}

finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
