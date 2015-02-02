{$IFNDEF PKG}
{$I ok_sklad.inc}
{$ENDIF}
unit BaseFrame;

interface

uses
  dxDBTL6, dxDBGrid6,
  TB2Item, Menus, ActnList, Windows, Messages, SysUtils, Classes,
  ssBaseConst, ssBaseDlg, ssBaseTypes, prTypes,
  Graphics, Controls, Forms, Dialogs;

type
  TssBaseFrame = class(TFrame)
    aArchive: TAction;
    aCheck: TAction;
    aColParams: TAction;
    aCopy: TAction;
    ActionList: TActionList;
    aCut: TAction;
    aDel: TAction;
    aDrillDown: TAction;
    aDynamic: TAction;
    aExcel: TAction;
    aFind: TAction;
    aNew: TAction;
    aPaste: TAction;
    aPatternInsert: TAction;
    aPrint: TAction;
    aProperties: TAction;
    aRefresh: TAction;
    aSelectAll: TAction;
    aShowArchived: TAction;
    aShowFilter: TAction;
    pmMain: TTBPopupMenu;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;

    procedure aArchiveExecute(Sender: TObject);
    procedure aCheckExecute(Sender: TObject);
    procedure aColParamsExecute(Sender: TObject);
    procedure aCopyExecute(Sender: TObject);
    procedure aCutExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aDrillDownExecute(Sender: TObject);
    procedure aDynamicExecute(Sender: TObject);
    procedure aExcelExecute(Sender: TObject);
    procedure aFindExecute(Sender: TObject);
    procedure aNewExecute(Sender: TObject);
    procedure aPasteExecute(Sender: TObject);
    procedure aPatternInsertExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aPropertiesExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aShowArchivedExecute(Sender: TObject);
    procedure aShowFilterExecute(Sender: TObject);
    procedure FrameResize(Sender: TObject);

  private
    fbState: TButtonsState;
    FCurrentSearchID: Integer;
    FFindType: TFindType;
    FGrpID: integer;
    FOnDate: TDateTime;
    FViewType: TCCViewType;

    procedure DoAction(AAction: TActionType);
    procedure SetBState(const Value: TButtonsState);
    procedure SetLocateType(const Value: TLocateType);
    property bState: TButtonsState read fbState write SetBState;

  protected
    AllowUp: boolean;
    ExportLIst: TStringList;
    FCurrentID: integer;
    FFindStr: string;
    FindCodes: TStringList;
    FindIndex: integer;
    FindList: TStringList;
    FParam: Integer;
    NeedToIns: boolean;
    SearchInfo: TSearchInfo;
    limited: boolean;

    function GetIDForUpdate: integer; virtual;
    function GetSubID(EdClass: TBaseDlg; AAction: TActionType): integer; virtual;
    function LoadExpParams: boolean;
    procedure LoadGrids; virtual;
    procedure SaveGrids; virtual;
    procedure SetCurrentID(const Value: integer); virtual;
    procedure SetCurrentSearchID(const Value: Integer); virtual;
    procedure SetFindStr(const Value: string); virtual;
    procedure SetGrpID(const Value: integer); virtual;
    procedure SetOnDate(const Value: TDateTime); virtual;
    procedure SetParam(const Value: Integer); virtual;
    procedure SetViewType(const Value: TCCViewType); virtual;
    procedure UpdateButtonStates; virtual;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMResetStyle(var M: TMessage); message WM_RESETSTYLE;

  public
    CanRefresh: Boolean;
    CheckSrvLocked: Boolean;
    EditingClass: TClass;
    FDrillDown: Boolean;
    FLocateType: TLocateType;
    FunID: Integer;
    ImageIndex: integer;
    ModalView: boolean;
    NeedRefresh: Boolean;
    ParentCCForm: TForm;
    ParentHandle: HWND;
    RefType: TRefType;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure DoActivate; virtual;
    procedure DoAfterFind(AParam: Integer = 0); virtual;
    procedure DoArchive; virtual;
    procedure DoCheck(EditRequest: Boolean); virtual;
    procedure DoCheckPopup(X, Y: Integer); virtual;
    procedure DoClose; virtual;
    procedure DoColParams; virtual;
    procedure DoCopy; virtual;
    procedure DoCut; virtual;
    procedure DoDelete; virtual;
    procedure DoDetRefresh(const APID, AID: integer); virtual; abstract;
    procedure DoDown; virtual;
    procedure DoDrillDown; virtual;
    procedure DoDynamic; virtual;
    procedure DoExcel(Grid: TdxDBGrid); virtual;
    procedure DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True); virtual;
    procedure DoGrpInsert; virtual;
    procedure DoHelp; virtual;
    procedure DoInsert; virtual;
    procedure DoLocate(const AID: Integer; ASubID: Integer = 0); virtual;
    procedure DoOpen(AParam: Variant); virtual;
    procedure DoPaste; virtual;
    procedure DoPatternInsert; virtual;
    procedure DoPrint(AParam: integer = 0); virtual;
    procedure DoPrintPopup(X, Y: Integer); virtual;
    procedure DoProperties; virtual;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); virtual;
    procedure DoRefreshFindParams; virtual;
    procedure DoSetFocus; virtual;
    procedure DoShow; virtual;
    procedure DoShowFilter; virtual;
    procedure DoShowModal; virtual;
    procedure DoSomething; virtual;
    procedure DoUp; virtual;

    procedure LoadSkin; virtual;
    procedure NotifyChanged; virtual;
    procedure SelectRecord(AHandle: HWND); virtual;
    procedure SetCaptions; virtual;
    procedure SetCurrIDToBuffer(AID, ASubID: Integer); virtual;
    procedure StartProcess; virtual;
    procedure StopProcess; virtual;
    procedure UpdateActionList; virtual;

    property CurrentID: integer read FCurrentID write SetCurrentID;
    property CurrentSearchID: Integer read FCurrentSearchID write SetCurrentSearchID;
    property FindStr: string read FFindStr write SetFindStr;
    property FindType: TFindType read FFindType write FFindType;
    property GrpID: integer read FGrpID write SetGrpID;
    property OnDate: TDateTime read FOnDate write SetOnDate;
    property Param: Integer read FParam write SetParam;
    property SearchLocateType: TLocateType read FLocateType write SetLocateType;
    property ViewType: TCCViewType read FViewType write SetViewType;

  end;

  TssBaseFrameClass = class of TssBaseFrame;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFDEF UDEBUG}Udebug,{$ENDIF}
  {$IFNDEF PKG}prFun,{$ENDIF}
  prConst,
  ClientData, ssClientDataSet, DBClient, DB, ssRegUtils, fMessageDlg;

{$IFDEF UDEBUG}
var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

{$R *.dfm}

//==============================================================================================
procedure TssBaseFrame.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoClose') else _udebug := nil;{$ENDIF}

  FindList.Free;
  FindCodes.Free;
  ExportList.Free;
  SaveGrids;
  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'UseFilter', Integer(aShowFilter.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'ShowArchived', Integer(aShowArchived.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'SearchID', FCurrentSearchID);
  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'LocateType', Integer(FLocateType));
  SetUserActivity(dmData.SConnection, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoDelete;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoDelete') else _udebug := nil;{$ENDIF}

  SendMessage(ParentHandle, WM_REFRESHBIN, 0, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoInsert;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoInsert') else _udebug := nil;{$ENDIF}

  DoAction(atInsert);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoOpen(AParam: Variant);
  var
    uf: integer;
    i, intTmp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoOpen') else _udebug := nil;{$ENDIF}

  FindList := TStringList.Create;
  FindCodes := TStringList.Create;
  ExportList := TStringList.Create;
  //SetStyle(Self, IStyle);
  SetUserActivity(dmData.SConnection, FunID);

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'SearchID', intTmp)
    then CurrentSearchID := intTmp;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'LocateType', intTmp)
    then SearchLocateType := TLocateType(intTmp)
    else SearchLocateType := ltBegin;

  SetCaptions;

  LoadGrids;
  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'ShowArchived', intTmp)
    then aShowArchived.Checked := (intTmp = 1);

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'UseFilter', uf)
    then aShowFilter.Checked := (uf=1)
    else aShowFilter.Checked := True;

  for i := 0 to ComponentCount - 1 do
   if Components[i] is TdxDBGrid then
     with (Components[i] as TdxDBGrid) do begin
       HighlightColor := GridHighlightColor;
       HighlightTextColor := clWindow;
       HideSelectionColor := GridHideSelColor;
       HideSelectionTextColor := clWindow;
       HideFocusRect := True;
       HeaderColor := clokGridHeader;
       GroupPanelFontColor := clWindow;
       GroupNodeTextColor := clWindowText;
       setFontStyle(Font, True);
       setFontStyle(HeaderFont, True);
       setFontStyle(BandFont, True);
       //GridLineColor := $00FFDFDE;
     end;

  aNew.Enabled := True;
  UpdateActionList;
  LoadSkin;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoProperties;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoProperties') else _udebug := nil;{$ENDIF}

  if not aProperties.Enabled then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  DoAction(atUpdate);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoRefresh(const AID: integer; AParam: integer = 0);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoRefresh') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.UpdateActionList') else _udebug := nil;{$ENDIF}

  UpdateButtonStates;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.aRefreshExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aRefreshExecute') else _udebug := nil;{$ENDIF}

  DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoAction(AAction: TActionType);
  var
    EdClass: TBaseDlg;
    FLck: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoAction') else _udebug := nil;{$ENDIF}

  EdClass := TBaseDlgClass(EditingClass).Create(nil);

  with EdClass do
    try
      GrpID := Self.GrpID;
      MainHandle := Self.Handle;
      ParentNameEx := Self.Name;
      OnDate := Self.OnDate;

      case AAction of
        atUpdate:
          begin
            ID := GetIDForUpdate;

            if CheckSrvLocked then begin
              FLck := dmData.SConnection.AppServer.doclck_Check(ID, Ord(RefType));

              if FLck <> EmptyStr then begin
                ssMessageDlg(LangMan.GetRS('Common', 'DocLocked') + ': ' + FLck, ssmtError, [ssmbOk]);
                Screen.Cursor := crDefault;
                {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
                Exit;
              end;
            end;
          end;

        atInsert:
          ID := 0;

        atPatternInsert:
          begin
            IsPattern := True;
            ID := GetIDForUpdate;
          end;
      end; // case Aaction

      SubID := GetSubID(EdClass, AAction);

      if CheckSrvLocked and (AAction = atUpdate)
        then dmData.SConnection.AppServer.doclck_Add(ID, Ord(RefType));

      ShowModal;

      if CheckSrvLocked and (AAction = atUpdate)
        then dmData.SConnection.AppServer.doclck_Delete(ID, Ord(RefType));

      UpdateActionList;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TssBaseFrame.GetIDForUpdate: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.GetIDForUpdate') else _udebug := nil;{$ENDIF}

  Result := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.SetBState(const Value: TButtonsState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.SetBState') else _udebug := nil;{$ENDIF}

   fbState := Value;
   SendMessage(ParentHandle, WM_CHANGEBSTATE, integer(@fbState), Integer(Self));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.WMRefresh') else _udebug := nil;{$ENDIF}

  DoRefresh(M.WParam, M.LParam);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    aCheck.Caption := GetRS('Common', 'Check');
    aColParams.Caption := GetRS('Common', 'ColOptions') + '...';
    aCopy.Caption := GetRS('Common', 'Copy');
    aCut.Caption := GetRS('Common', 'Cut');
    aDel.Caption := GetRS('Common', 'Del');
    aDel.Hint := GetRS('Common', 'Del');
    aDynamic.Caption := GetRS('Common', 'Dynamic');
    aExcel.Caption := GetRS('Common', 'Excel') + '...';
    aNew.Caption := GetRS('Common', 'Add');
    aNew.Hint := GetRS('Common', 'Add');
    aPaste.Caption := GetRS('Common', 'Paste');
    aPatternInsert.Caption := GetRS('Common', 'PatternAdd');
    aPatternInsert.Hint := GetRS('Common', 'PatternAdd');
    aPrint.Caption := GetRS('Common', 'Print');
    aProperties.Caption := GetRS('Common', 'Properties');
    aProperties.Hint := GetRS('Common', 'Properties');
    aRefresh.Caption := GetRS('Common', 'Refresh');
    aRefresh.Hint := GetRS('Common', 'Refresh');
    aSelectAll.Caption := GetRS('Common', 'SelectAll');
    aShowFilter.Caption := GetRS('Common', 'UseFilter');
  end;

  DoRefreshFindParams;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.LoadGrids;
  var
     i: integer;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.LoadGrids') else _udebug := nil;{$ENDIF}

  for i := 0 to Self.ComponentCount - 1 do
    if (Self.Components[i] is TdxDBGrid) and (edgoStoreToRegistry in TdxDBGrid(Self.Components[i]).OptionsBehavior)
      then TdxDBGrid(Self.Components[i]).LoadFromRegistry(MainRegKey + '\' + Self.ClassName + '\' + Self.Components[i].Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.SaveGrids;
  var
     i: integer;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.SaveGrids') else _udebug := nil;{$ENDIF}

  for i := 0 to Self.ComponentCount - 1 do
    if (Self.Components[i] is TdxDBGrid) and (edgoStoreToRegistry in TdxDBGrid(Self.Components[i]).OptionsBehavior)
      then TdxDBGrid(Self.Components[i]).SaveToRegistry(MainRegKey + '\' + Self.ClassName + '\' + Self.Components[i].Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.aDelExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aDelExecute') else _udebug := nil;{$ENDIF}

  DoDelete;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.aNewExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aNewExecute') else _udebug := nil;{$ENDIF}

  DoInsert;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.aPropertiesExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aPropertiesExecute') else _udebug := nil;{$ENDIF}

  DoProperties;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoDynamic;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoDynamic') else _udebug := nil;{$ENDIF}

  aDynamic.Checked := not aDynamic.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.aDynamicExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aDynamicExecute') else _udebug := nil;{$ENDIF}

  DoDynamic;
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoUp;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoUp') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.DoDown;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoDown') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.SetOnDate(const Value: TDateTime);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.SetOnDate') else _udebug := nil;{$ENDIF}

  NeedRefresh := True;
  FOnDate := Value;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TssBaseFrame.GetSubID(EdClass: TBaseDlg; AAction: TActionType): integer;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.GetSubID') else _udebug := nil;{$ENDIF}

  Result := 0;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.StartProcess;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.StartProcess') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.StopProcess;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.StopProcess') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.WMResetStyle(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.WMResetStyle') else _udebug := nil;{$ENDIF}

  SetStyle(Self, IStyle);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.DoGrpInsert;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoGrpInsert') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoFind') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.aFindExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aFindExecute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.DoRefreshFindParams;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoRefreshFindParams') else _udebug := nil;{$ENDIF}

  if SearchInfo.SearchID <> -1
    then SendMessage(ParentHandle, WM_SETFINDPARAMS, Integer(FindList), Integer(@SearchInfo));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.SetFindStr(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.SetFindStr') else _udebug := nil;{$ENDIF}

  if FFindStr <> Value then begin
    FFindStr := Value;
    FindCodes.Clear;
  end;

  SearchInfo.FindStr := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.aPrintExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aPrintExecute') else _udebug := nil;{$ENDIF}

  DoPrint;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoPrint(AParam: integer = 0);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoPrint') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.DoExcel(Grid: TdxDBGrid);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoExcel') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.aExcelExecute(Sender: TObject);
  var
    Grid: TdxDBGrid;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aExcelExecute') else _udebug := nil;{$ENDIF}

  if TAction(Sender).Tag = 0
    then DoExcel(nil)
    else begin
      Grid := nil;
      DoExcel(Grid);
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TssBaseFrame.LoadExpParams: boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.LoadExpParams') else _udebug := nil;{$ENDIF}

  NeedToIns := True;
  Result := False;
  ExportList.Clear;

  with newDataSet do
  try
    ProviderName := 'pExp_Get';
    FetchParams;
    Params.ParamByName('profid').AsInteger := ProfID;
    Params.ParamByName('classname').AsString := Self.ClassName;
    Open;

    if IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    while not Eof do begin
      ExportList.AddObject(fieldbyname('fieldname').AsString, pointer(fieldbyname('checked').asinteger));
      Next;
    end;
    Close;
    Result := True;
    NeedToIns := False;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.aCheckExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aCheckExecute') else _udebug := nil;{$ENDIF}

  DoCheck(False);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoCheck(EditRequest: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoCheck') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoShow;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoShow') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.SetCurrentID(const Value: integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.SetCurrentID') else _udebug := nil;{$ENDIF}

  FCurrentID := Value;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoDrillDown;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoDrillDown') else _udebug := nil;{$ENDIF}

  FDrillDown := not FDrillDown;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.aDrillDownExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aDrillDownExecute') else _udebug := nil;{$ENDIF}

  aDrillDown.Checked := not aDrillDown.Checked;
  DoDrillDown;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoSomething;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoSomething') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.aShowFilterExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aShowFilterExecute') else _udebug := nil;{$ENDIF}

  aShowFilter.Checked := not aShowFilter.Checked;
  DoShowFilter;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoShowFilter;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoShowFilter') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.SetGrpID(const Value: integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.SetGrpID') else _udebug := nil;{$ENDIF}

  FGrpID := Value;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoAfterFind(AParam: Integer = 0);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoAfterFind') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.SetCurrentSearchID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.SetCurrentSearchID') else _udebug := nil;{$ENDIF}

  FCurrentSearchID := Value;
  SearchInfo.SearchID := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.SelectRecord(AHandle: HWND);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.SelectRecord') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.DoPatternInsert;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoPatternInsert') else _udebug := nil;{$ENDIF}

  DoAction(atPatternInsert);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.aPatternInsertExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aPatternInsertExecute') else _udebug := nil;{$ENDIF}

  DoPatternInsert;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoHelp;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoHelp') else _udebug := nil;{$ENDIF}

  ShowHelpTopic(Self.ClassName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoCut;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoCut') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.DoCopy;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoCopy') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.DoPaste;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoPaste') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.aCutExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aCutExecute') else _udebug := nil;{$ENDIF}

  DoCut;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.aCopyExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aCopyExecute') else _udebug := nil;{$ENDIF}

  DoCopy;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.aPasteExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aPasteExecute') else _udebug := nil;{$ENDIF}

  DoPaste;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.aSelectAllExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aSelectAllExecute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.DoSetFocus;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoSetFocus') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.SetParam(const Value: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.SetParam') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.DoActivate;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoActivate') else _udebug := nil;{$ENDIF}

  CanRefresh := True;

  if NeedRefresh then begin
    Application.ProcessMessages;
    DoRefresh(0);
    NeedRefresh := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoLocate(const AID: Integer; ASubID: Integer = 0);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoLocate') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.DoPrintPopup(X, Y: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoPrintPopup') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.SetViewType(const Value: TCCViewType);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.SetViewType') else _udebug := nil;{$ENDIF}

  FViewType := Value;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.aColParamsExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aColParamsExecute') else _udebug := nil;{$ENDIF}

  DoColParams;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoColParams;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoColParams') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.SetLocateType(const Value: TLocateType);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.SetLocateType') else _udebug := nil;{$ENDIF}

  FLocateType := Value;
  Self.SearchInfo.LocateType := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.LoadSkin;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.LoadSkin') else _udebug := nil;{$ENDIF}

  Self.Color := clokMainBk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.aShowArchivedExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aShowArchivedExecute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.DoArchive;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoArchive') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.aArchiveExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.aArchiveExecute') else _udebug := nil;{$ENDIF}

  DoArchive;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoCheckPopup(X, Y: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoCheckPopup') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TssBaseFrame.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFNDEF PKG}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer and not ModalView and Assigned(prconst.frmMainForm)
    then frmMainForm.AddToBuffer(vtRefs, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  {$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.SetCurrIDToBuffer(AID, ASubID: Integer);
  {$IFNDEF PKG}{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}{$ENDIF}
begin
  {$IFNDEF PKG}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.SetCurrIDToBuffer') else _udebug := nil;{$ENDIF}

  with frmMainForm.bufMain do
    if Current <> nil then begin
      Current.ID := AID;
      Current.SubID := ASubID;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  {$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.DoShowModal;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.DoShowModal') else _udebug := nil;{$ENDIF}

  PostMessage(Self.Handle, WM_OK_SHOWMODAL, 0, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.UpdateButtonStates;
 var
   bTemp: TButtonsState;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.UpdateButtonStates') else _udebug := nil;{$ENDIF}

  bTemp := [];

  aNew.Enabled := Self.Enabled and aNew.Enabled and GetUserAccessByClass(Self.ClassName, uaInsert);
  aProperties.Enabled := Self.Enabled and aProperties.Enabled and GetUserAccessByClass(Self.ClassName, uaModify);
  aDel.Enabled := Self.Enabled and aDel.Enabled and GetUserAccessByClass(Self.ClassName, uaDelete);
  aPatternInsert.Enabled := Self.Enabled and aPatternInsert.Enabled and GetUserAccessByClass(Self.ClassName, uaInsert);
  aPrint.Enabled := Self.Enabled and aPrint.Enabled;
  aCheck.Enabled := Self.Enabled and aCheck.Enabled and GetUserAccessByClass(Self.ClassName, uaModify);

  if aExcel.Enabled then bTemp := bTemp + [bsExcel];
  if aRefresh.Enabled then bTemp := bTemp + [bsRefresh];
  if aPatternInsert.Enabled then bTemp := bTemp + [bsPatternInsert];
  if aDrillDown.Enabled then bTemp := bTemp + [bsDrillDown];
  if aCheck.Enabled then bTemp := bTemp + [bsCheck];
  if aPrint.Enabled then bTemp := bTemp + [bsPrint];
  if aNew.Enabled then bTemp := bTemp + [bsInsert];
  if aFind.Enabled then bTemp := bTemp + [bsFind];
  if aProperties.Enabled then bTemp := bTemp + [bsProperties];
  if aDel.Enabled then bTemp := bTemp + [bsDelete];
  if aDynamic.Enabled then bTemp := bTemp + [bsDynamic];
  if aDynamic.Checked then bTemp := bTemp + [bsDynChecked];
  if AllowUp then bTemp := bTemp + [bsUp];

  bState := bTemp;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
constructor TssBaseFrame.Create(AOwner: TComponent);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.Create') else _udebug := nil;{$ENDIF}
  inherited;
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TssBaseFrame.Destroy;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TssBaseFrame.Destroy') else _udebug := nil;{$ENDIF}
  inherited;
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TssBaseFrame.FrameResize(Sender: TObject);
begin
  Realign;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('BaseFrame', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  {$IFDEF UDEBUG}
  //debugUnregisterUnit(DEBUG_unit_ID);
  {$ENDIF}
end.
