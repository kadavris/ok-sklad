{$I ok_sklad.inc}
unit fEqType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ssBaseTypes, TB2Item;

type
  TfmEqType = class(TssBaseFrame)
    cdsEqType: TClientDataSet;
    colDEF: TdxDBGridColumn;
    colName: TdxDBGridColumn;
    dbgEqType: TdxDBGrid;
    dbgEqTypeColumn3: TdxDBGridColumn;
    dsEqType: TDataSource;

    procedure dbgEqTypeDblClick(Sender: TObject);
    procedure dbgEqTypeCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);

  protected
    function GetIDForUpdate: integer; override;

  public
    procedure UpdateActionList; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoClose; override;
    procedure DoDelete; override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure SetCaptions; override;
    procedure DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True); override;
    procedure DoExcel(Grid: TdxDBGrid); override;
  end;

var
  fmEqType: TfmEqType;

implementation

uses 
  EditEqType, ClientData, prFun, prConst, ssFun, Export, Udebug;
  
var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

const
     _ID_ = 'ETYPEID';

//==============================================================================================
procedure TfmEqType.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmEqType.DoClose') else _udebug := nil;{$ENDIF}


  cdsEqType.Close;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmEqType.DoDelete;
var
   id_: integer;
   ResetDef: boolean;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmEqType.DoDelete') else _udebug := nil;{$ENDIF}



  if MessageDlg(rs('common','DelConfirm'), mtWarning, [mbYes, mbNo], 0) = mrYes
  then with TClientDataSet.Create(nil) do
    try
     TrStart;
    try
     RemoteServer := dmData.SConnection;
     if not DeleteData(dmData.SConnection, 'equiptype', cdsEqType.fieldbyname(_ID_).AsInteger)
       then raise Exception.Create(rs('common','DeleteError'));

     ResetDef := cdsEqType.FieldByName('def').AsInteger=1;
     if cdsEqType.FieldByName('def').AsInteger=1 then begin
       ProviderName := 'pEqType_Min';
       Open;
       if not IsEmpty then begin
         id_ := Fields[0].AsInteger;
         Close;
         ProviderName := 'pEqType_SetDef1';
         FetchParams;
         Params.ParamByName(_ID_).AsInteger := id_;
         Execute;
       end 
       else Close;
     end;

     if not DelToRecycleBin
      then TrCommit
      else begin
        TrRollback;

        if not AddToRecycleBin(dmData.SConnection, Self.ClassName, cdsEqType.fieldbyname(_ID_).AsInteger, cdsEqType.fieldbyname('name').AsString,ResetDef, Self.FunID) then begin
          MessageDlg(rs('common','ErrorInsToRecycleBin'), mtError, [mbOk], 0);
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;
      end;

     aRefresh.Execute;
     UpdateActionList;

    except
      on e:exception do begin
        TrRollback;
        MessageDlg(rs('common','NoDelete')+#10#13+e.Message, mtError, [mbOk], 0);
      end;
    end;

    finally
      Free;
    end;

  inherited;    

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmEqType.DoOpen(AParam: Variant);
  var 
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmEqType.DoOpen') else _udebug := nil;{$ENDIF}


  EditingClass := TfrmEditEqType;
  cdsEqType.Open;

  inherited;

  if not LoadExpParams
   then with ExportList do
    for i := 0 to dbgEqType.VisibleColumnCount-1 do
     AddObject(dbgEqType.VisibleColumns[i].Name, pointer(1));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmEqType.SetCaptions;
  var t:String;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmEqType.SetCaptions') else _udebug := nil;{$ENDIF}


  Self.Caption := rs(Self.Name,'TitleEqType');
  colName.Caption := rs(Self.Name,'Name');

  t := rs(Self.Name, 'TitleEqType');
  SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@t), 0);

  FindList.Clear;
  FindList.AddObject(rs(Self.Name,'Name')+';name', pointer(1));

  SendMessage(ParentHandle, WM_SETFINDPARAMS, Integer(FindList), 0);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmEqType.dbgEqTypeDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmEqType.dbgEqTypeDblClick') else _udebug := nil;{$ENDIF}

  if dbgEqType.Count > 0 then DoProperties;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmEqType.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmEqType.UpdateActionList') else _udebug := nil;{$ENDIF}

  aProperties.Enabled := not cdsEqType.IsEmpty;
  aDel.Enabled := aProperties.Enabled;
  aDynamic.Enabled := False;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmEqType.DoRefresh(const AID: integer; AParam: integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmEqType.DoRefresh') else _udebug := nil;{$ENDIF}


     DSRefresh(cdsEqType, _ID_, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmEqType.GetIDForUpdate: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmEqType.GetIDForUpdate') else _udebug := nil;{$ENDIF}


     Result := cdsEqType.fieldbyname(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmEqType.dbgEqTypeCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmEqType.dbgEqTypeCustomDrawCell') else _udebug := nil;{$ENDIF}


     if (ANode.Values[1]=1) and not ASelected then AFont.Color := DefaultColor;
     if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex) then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmEqType.DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True);
  var
    FNode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmEqType.DoFind') else _udebug := nil;{$ENDIF}

  inherited;

  if FindStr<>AStr then FindIndex := -1;
  FindStr := AStr;
  if AStr=EmptyStr then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  FNode := FindNode(dbgEqType, AFName, AStr, ALocateType, FindIndex);
  if FNode<>nil then begin
    FindIndex := FNode.Index;
    cdsEqType.Locate(_ID_, FNode.Values[2], []);
  end 
  else MessageDlg(rs('common','FindError')+','+#13#10+rs('common','DSEnd'), mtInformation, [mbOk], 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmEqType.DoExcel(Grid: TdxDBGrid);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmEqType.DoExcel') else _udebug := nil;{$ENDIF}

  inherited;
  with TfrmExport.Create(nil) do
   try
     if cdsFunc.Locate('classname', Self.ClassName, [])
       then FunID := cdsFunc.fieldbyname('funid').AsInteger
       else FunID := 0;
     grdExp := dbgEqType;
     lName.Caption := Self.Caption;
     FList := ExportList;
     if ShowModal <> mrOk then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

   finally
    Free;
   end;

  ExportToExcel(dbgEqType, ExportList);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fEqType', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
