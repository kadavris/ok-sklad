{$I ok_sklad.inc}
//UDEBUG code already inserted. Please do not remove this line.
unit apTree;

interface

uses
  Classes, Types, Messages, ssBaseTypes, DB, Variants,
  ssClientDataSet, MetaClass, Serializator;

const
  apTreeDTNull = 0; // not loaded or set yet
  apTreeDTInt  = 1; // Integer
  apTreeDTNum  = 2; // Numeric
  apTreeDTDbl  = 3; // Double
  apTreeDTTxt  = 4; // String
  apTreeDTBlob = 5;

  apTreeDTMax  = 5; // For bounds checking

  apTreeLoadOIDNone = -2;
  apTreeLoadOIDAll  = -1;

  apNodeLoadedNone = 0; // for node that had not loaded any data yet
  apNodeLoadedFull = 1; // all data loaded
  apNodeLoadedPart = 2; // some but not all data loaded
  apNodeLoadedUnknown = 2; // same as above

  // internal error codes
  // data:
  d_err_load_EOF = 100;
  d_err_load = 101;

  // internal error codes
  // node:
  n_err_load = 100; // generic error. exception caught maybe
  n_err_dataload = 101; // some data could not load
  n_err_dataload_children = 102; // child node's data not loaded
  n_err_eof = 103; // eof on load. not a error
  n_err_save = 104;
  n_err_save_children = 105;
  n_err_delete = 106;
  n_err_parent_save = 107;
  n_err_save_upd = 108; // save: update
  n_err_savedata = 109;
  n_err_savedata_children = 110; // children nodes saveData

  // internal error codes
  // tree:
  t_err_Load = 100;
  t_err_newid = 101;
  t_err_del = 102;

type
  TapTree = class;
  TapTreeNode = class;

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
  TSimpleAssociativeArray = class
    private
      FData: TstringList;

      function  getDataInt(const Name: String): Integer;
      procedure setDataInt(const Name: String; const AValue: Integer);
      function  getDataExt(const Name: String): Extended;
      procedure setDataExt(const Name: String; const AValue: Extended);
      function  getDataStr(const Name: String): String;
      procedure setDataStr(const Name: String; const AValue: String);
      function  getDataPtr(const Name: String): Pointer;
      procedure setDataPtr(const Name: String; const AValue: Pointer);

    public
      constructor Create;
      destructor Destroy; override;

      procedure Clear;

      property Int[const Name: String]: Integer  read getDataInt write setDataInt;
      property Ext[const Name: String]: Extended read getDataExt write setDataExt;
      property Str[const Name: String]: String   read getDataStr write setDataStr;
      property Ptr[const Name: String]: Pointer  read getDataPtr write setDataPtr;
      property Data: TStringList read FData;
  end; // TSimpleAssociativeArray

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
  TapTreeNodeData = class(TMetaClass)
    private
      FdataType: Integer; // see const apTreeDT...
      FCID: Integer; // ID in the list of data fields for the owner node
      FOwnerID: Integer; // Application object ID
      FValue: Variant;
      FParent: TapTreeNode;

      function classTechDetails: String; override;
      function ExceptionMsg(const s: String = ''; const getServerError: Boolean = True): String; // for verbose exceptions
      procedure reportError(func, err: String);

      // ------ property write functions
      procedure setDataType(const Adt: Integer);
      procedure setCID(const ACID: Integer);
      procedure setOwnerID(const AOID: Integer);
      //procedure setValue(const AValue: Variant);
      procedure setParent(const AParent: TapTreeNode);
      function getInt: Integer;
      procedure setInt(const AValue: Integer);
      function getBool: Boolean;
      procedure setBool(const AValue: Boolean);
      function getNum: Double;
      procedure setNum(AValue: Double);
      function getDbl: Double;
      procedure setDbl(AValue: Double);
      function getTxt: String;
      procedure setTxt(const AValue: String);
      function getBlob: TStream;
      procedure setBlob(const AValue: TStream);
      //-------

      function getErrorText(const Index: Integer): String; override;

    public
      constructor Create(AParent: TapTreeNode; const ds: TssClientDataSet = nil; const AOwnerID: Integer = -1);
      destructor Destroy; override;

      procedure Clear;
      procedure setDeleted(Adeleted: Boolean);
      procedure Delete;

      function Load(const ds: TssClientDataSet; const AOwnerID: Integer = -1): Boolean;
      function Save: Boolean;

      procedure MCSaveState; override;
      procedure MCRestoreState; override;

      // as this is not independend class then it will be serialized and XML-ed into and from the ready object, not a plain stream
      function Serialize(var SO: TSerializator): Boolean;
      function deSerialize(const SO: TSerializator; const AParent: TapTreeNode): Boolean;

      property dataType: Integer read FdataType write setDataType;
      property CID: Integer read FCID write setCID;
      property OwnerID: Integer read FOwnerID write setOwnerID;
      property Parent: TapTreeNode read FParent write setParent;

      property isNew: Boolean read Fnew;
      property isModified: Boolean read FModified;
      property isDeleted: Boolean read FDeleted write setDeleted;

      //property Value: Variant read FValue write setValue; // too complex checkup code. prop unavailable now
      property asInteger: Integer read getInt write setInt;
      property asBoolean: Boolean read getBool write setBool;
      property asNumeric: Double read getNum write setNum;
      property asDouble: Double read getDbl write setDbl;
      property asText: String read getTxt write setTxt;
      property asString: String read getTxt write setTxt;
      property asBlob: TStream read getBlob write setBlob;
  end; // TapTreeNodeData

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
  TapTreeNode = class(TMetaClassList) // for easy access to data fetched from CustomTree tables
    private
      { that's now inherited from Metaclass
      FID: Integer;
      FItems: TList; // TapTreeNode child items
      Fnew, Fmodified, FDeleted: Boolean;
      }

      FParent: TapTreeNode;
      FTree: TapTree;
      FPos, FNodeData: Integer;
      FLoadedState: Integer; // see consts apNodeLoaded... above
      FRTData: TSimpleAssociativeArray; // run-time user data. will not be saved to db

      FFind: Variant; // used for findNext

      FData: TList; // TapNodeData items

      //FfetchData: Boolean; // special flag. set when newly created Tapnodedata must load data from DB

      function classTechDetails: String; override;
      function ExceptionMsg(const s: String = ''; const getServerError: Boolean = True): String; // for verbose exceptions
      procedure reportError(func, err: String);

      procedure FindClear; // resets Find... state
      function FindNext(const AFind: Variant): TapTreeNode; overload; // find next element (internal)

      function getItemsCount: Integer;
      function getDataCount: Integer;

      // ------ property read/write functions
      procedure setParentNode(const Anode: TapTreeNode);
      procedure setPos(const APos: Integer);
      procedure setNodeData(const Adata: Integer);
      procedure setName(const AName: String);

      procedure setItems(const idx: Integer; Anode: TapTreeNode);
      function getItems(const idx: Integer): TapTreeNode;
      procedure setData(const idx: Integer; AData: TapTreeNodeData);
      function getData(const idx: Integer): TapTreeNodeData;
      // ------

      function getErrorText(const Index: Integer): String; override;

    public
      constructor Create(const AName: String; const ATree: TapTree); overload; // for empty node (special trick)
      constructor Create(const AName: String; const AParent: TapTreeNode); overload; // for empty node too. standard
      constructor Create(const ATree: TapTree); overload; // standard way of node creation
      destructor Destroy; override;
      procedure Clear;

      procedure MCSaveState; override;
      procedure MCRestoreState; override;

      procedure Delete; // marks node and children as deleted, so on save it will be removed from the DB
      // removes deleted and unfilled new nodes and data. returns true if it destroyed itself too
      function Sweep(const doNodes: boolean = True; const doData: boolean = True; const MayDestroyMeToo: Boolean = False): Boolean;

      procedure setDeleted(Adeleted: Boolean); // deletes/undeletes the node and it's offspring
      procedure setModified(AModified: Boolean); // mainly to force node saving to DB

      {user-friendly isModified ;) result is a bit mask with 1/0 at a place according to arg number in reverse
      i.e.
      0x01 = own data is modified
      0x02 = any of sub-nodes is modified
      0x04 = any of sub-nodes data is modified
      }
      function CheckModified(checkData: Boolean = True; checkSubNodes: Boolean = True; checkSubNodesData: Boolean = True): Integer;

      // recursive quering child nodes for their data load state.
      function ChildrenLoadedState(includeMySelf: Boolean = False): Integer;
      procedure Refresh(doOwnData, doSubTree, doSubData: Boolean); // reloads anything _missing_ from DB

      function AddChild(const Aname: String; const Adata: Integer = 0): TapTreeNode;
      function AddSibling(const Aname: String; const Adata: Integer = 0): TapTreeNode;

      function Save(SaveChildren: Boolean): Boolean;
      function Load: Boolean;

      function Serialize(var SO: TSerializator): Boolean;
      function deSerialize(const SO: TSerializator; const AParent: TapTreeNode): Boolean;

      {function Serialize(var Stream: TStream): Boolean;
      function deSerialize(var Stream: TStream): Boolean;
      }

      // dataset is used internally to not waste resources on recreating it in recursions
      function AddData(const AOwnerID: Integer; const ACID: Integer = -1): TapTreeNodeData;
      function LoadData(const AOwnerID: Integer = -1; const LoadChildren: Boolean = False; ds: TssClientDataSet = nil): Boolean;
      function SaveData(const AOwnerID: Integer = -1; const SaveChildren: Boolean = False): Boolean;
      procedure ClearData(const AOwnerID: Integer = -1; const clearChildren: boolean = False);

      function NodeByID(const AID: Integer): TapTreeNode;
      function FindFirst(const AName: String; const inChildren: Boolean = True; const AutoCreate: Boolean = False): TapTreeNode; overload;
      function FindFirst(const AData: Integer; const inChildren: Boolean = True): TapTreeNode; overload;
      function FindNext: TapTreeNode; overload; // find next element (user side)

      // used for walking the tree
      function FirstNode: TapTreeNode; // First sub-tree node
      function LastNode: TapTreeNode; // Last sub-tree node
      function PrevNode: TapTreeNode; // prev node. prev sibling or parent's sibling, and so on
      function NextNode: TapTreeNode; // next node. next child node or next sibling...

      function FirstSibling: TapTreeNode;
      function LastSibling: TapTreeNode;
      function PrevSibling: TapTreeNode;
      function NextSibling: TapTreeNode;

      function FindData(const AOwnerID: Integer; const ACID: Integer = -1; const AutoCreate: Boolean = False): TapTreeNodeData;
      // used to reset some fake Owner Id to real for newly created owner object. That is autorecursive!
      function ChangeOID(const AOIDFrom, AOIDTo: Integer): Integer;
      // makes empty data items for this and each node in subtree.
      procedure MakeData(const AOwnerid, ACID: Integer);

      property Parent: TapTreeNode read FParent write setParentNode;
      property Tree: TapTree read FTree;

      property ID: Integer read FID;
      //property ParentID: Integer read FParentID write setParentID;
      property Pos: Integer read FPos write setPos;
      property NodeData: Integer read FNodeData write setNodeData;
      property Name: String read FName write setName;

      //property fetchData: Boolean read FFetchData;

      property isNew: Boolean read Fnew;
      property isModified: Boolean read FModified write setModified;
      property isDeleted: Boolean read FDeleted write setDeleted;

      property Items[const idx: Integer]: TapTreeNode read getItems write setItems; default;
      property Data[const idx: Integer]: TapTreeNodeData read getData write setData;
      property Count: Integer read getItemsCount;
      property DataCount: Integer read getDataCount;
      property LoadedState: Integer read FloadedState;

      property RTData: TSimpleAssociativeArray read FRTData;
  end; // TapTreeNode

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
  TapTree = class(TapTreeNode)
    protected
      Fds: TssClientDataSet;
      Fmyds: boolean; // indicates that dataset is auto-created and should be disposed later
      FTreeID, FOwnerType: Integer;

      procedure LoadTree(const LoadOwnerID: Integer); // used in constructors to initiate loading by TapTreeNode.Load
      procedure Refresh(doOwnData, doSubTree, doSubData: Boolean); // reloads anything _missing_ from DB

      // ------ property write functions
      procedure setDataSet(Ads: TssClientDataSet);
      procedure setOwnerType(const AOT: Integer);
      procedure setTreeID(const ATID: Integer);
      // ------
      function lastServerError: String; // to get last SQL error if any

      function getErrorText(const Index: Integer): String; override;

    public
      BrokenItems: Integer; // used as a user-defined indicator that something was checked broken and/or fixed at user-side.

      constructor Create; overload; // for blank new tree. you can set the name later, once ;)
      constructor Create(const AtreeID, AOwnerType: Integer; const LoadOwnerID: Integer = apTreeLoadOIDNone); overload; // finds existing tree by ID
      constructor Create(const treeName: String; const AOwnerType: Integer; const LoadOwnerID: Integer = apTreeLoadOIDNone); overload;// finds existing tree by name

      procedure Clear;

      function classTechDetails: String; override;

      procedure MCSaveState; override;
      procedure MCRestoreState; override;

      function Save(SaveChildren: Boolean): Boolean; reintroduce;
      function SaveAs(const DeleteOld: Boolean; const NewID: Integer = -1): Boolean; // to make a fresh full copy of tree w data

      function LoadData(const AOwnerID: Integer = -1): Boolean;
      function SaveData(const AOwnerID: Integer = -1; const SaveChildren: Boolean = False): Boolean; reintroduce;

      function FirstNode: TapTreeNode; // we need to return nil on empty tree

      // export/import
      function Serialize(var SO: TSerializator): Boolean; overload;
      function Serialize(var Stream: TStream): Boolean; overload;

      function deSerialize(const SO: TSerializator): Boolean; overload;
      function deSerialize(const Stream: TStream): Boolean; overload;

      {
      function SaveXML(var Stream: TStream): Boolean;
      function LoadXML(var Stream: TStream): Boolean; overload;
      function LoadXML(var xmlobj: T...): Boolean; overload;
      }

      property DataSet: TssClientDataSet read Fds write setDataSet;
      property TreeID: Integer read FtreeID write setTreeID;
      property OwnerType: Integer read FOwnerType write setOwnerType;
  end; // TapTree

//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
//----------------------------------------------------------------------------------
  TapWoods = class(TMetaClassList) // tree list class
    private
      FData: TList; // FData is optional user data associated with tree

      function getListData(const idx: Integer): Pointer;
      procedure setListData(const idx: Integer; const AValue: Pointer);
      function getDataOf(const AName: String): Pointer;
      procedure setDataOf(const AName: String; const p: Pointer);
      function getItems(const idx: Integer): TapTree;

      function getErrorText(const Index: Integer): String; override;

    public
      constructor Create(const AParent: TMetaClass);
      destructor Destroy; override;

      procedure Clear;
      function byID(const AID: Integer): TapTree;
      function byName(const Aname: String): TapTree;
      function Index(const AName: String): Integer; // returns index of tree in list

      function Add(const Aname: String; const AOwnerType: Integer; const LoadOwnerID: Integer = apTreeLoadOIDNone): TapTree; {overload;} // add/load tree by name
      procedure Delete(const Aname: String; const DestroyTree: Boolean = True); overload;
      procedure Delete(const ATreeId: Integer; const DestroyTree: Boolean = True); overload;

      function LoadByNames(const AOwnerType: Integer; Alist: array of String): Integer; // load many trees by names
      function LoadByIDs(const AOwnerType: Integer; Alist: array of Integer): Integer; // load many trees by ids

      {??? params?????
      function Serialize(var Stream: TStream): Boolean;
      function deSerialize(var Stream: TStream): Boolean;
      }

      property Data[const idx: Integer]: Pointer read getListData write setListData;
      property Items[const idx: Integer]: TapTree read getItems; default;
      property DataOf[const Aname: string]: Pointer read getDataOf write setDataOf;
  end; // TapWoods

//==================================================================================
//==================================================================================
//==================================================================================
implementation

uses
  Forms, Controls, // for Screen.Cursor := crSQLWait; ;)
  {$IFNDEF PKG}
  udebug, ClientData, fMessageDlg,
  {$ENDIF}
  Windows, prConst, sysUtils;

const  
  nodeDataErrorTexts: array[100..101] of String = (
    'TapTreeNodeData.Load: EOF', // d_err_load_EOF
    'TapTreeNodeData.Load: general error' // d_err_load
  );

  nodeErrorTexts: array[100..110] of String = (
    'TapTreeNode.Load: general error', // n_err_load // generic error. exception caught maybe
    'TapTreeNode.Load: node data load error', // n_err_dataload  // some data could not load
    'TapTreeNode.Load: children data load error', // n_err_dataload_children // child node's data not loaded
    'TapTreeNode.Load: EOF', // n_err_eof  // eof on load. not a error
    'TapTreeNode.Save: general error', // n_err_save
    'TapTreeNode.Save: children save error', // n_err_save_children
    'TapTreeNode.Save: delete error',  // n_err_delete
    'TapTreeNode.Save: parent save error', // n_err_parent_save
    'TapTreeNode.Save: update error', // n_err_save - save: update
    'TapTreeNode.SaveData error', // n_err_savedata
    'TapTreeNode.SaveData: child node SaveData error' // n_err_savedata_children
  );

  treeErrorTexts: array[100..102] of String = (
    'TapTree.Load error',
    'TapTree.Save: get new tree id error',
    'TapTree: Delete tree from DB error'
  );

  woodsErrorTexts: array[100..100] of String = (
    '' // stub
  );

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TSimpleAssociativeArray.Create;
begin
  FData := TstringList.Create;
  Clear;
end;

//==============================================================================================
destructor TSimpleAssociativeArray.Destroy;
begin
  FData.Free;
  inherited;
end;

//==============================================================================================
procedure TSimpleAssociativeArray.Clear;
begin
  Fdata.Clear;
end;

//==============================================================================================
function  TSimpleAssociativeArray.getDataInt(const Name: String): Integer;
begin
  try
    Result := StrToInt(FData.Values[Name]);

  except
    Result := 0;
  end;
end;

//==============================================================================================
procedure TSimpleAssociativeArray.setDataInt(const Name: String; const AValue: Integer);
begin
  FData.Values[Name] := IntToStr(AValue);
end;

//==============================================================================================
function  TSimpleAssociativeArray.getDataExt(const Name: String): Extended;
begin
  try
    Result := StrToFloat(FData.Values[Name]);

  except
    Result := 0.0;
  end;
end;

//==============================================================================================
procedure TSimpleAssociativeArray.setDataExt(const Name: String; const AValue: Extended);
begin
  FData.Values[Name] := FloatToStr(AValue);
end;

//==============================================================================================
function  TSimpleAssociativeArray.getDataStr(const Name: String): String;
begin
  Result := FData.Values[Name];
end;

//==============================================================================================
procedure TSimpleAssociativeArray.setDataStr(const Name: String; const AValue: String);
begin
  FData.Values[Name] := AValue;
end;

//==============================================================================================
function  TSimpleAssociativeArray.getDataPtr(const Name: String): Pointer;
begin
  Result := Pointer(StrToInt64(FData.Values[Name]));
end;

//==============================================================================================
procedure TSimpleAssociativeArray.setDataPtr(const Name: String; const AValue: Pointer);
begin
  FData.Values[Name] := IntToStr(Int64(AValue));
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
function newDS(const tree: TapTree): TssClientDataSet;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'apTree newDS') else _udebug := nil;{$ENDIF}

  try
    Result := TssClientDataSet.Create(nil);
    Result.RemoteServer := Tree.DataSet.RemoteServer;

  except
    Result := nil;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
//==============================================================================================
// TapTreeNodeData =============================================================================
//==============================================================================================
//==============================================================================================
function TapTreeNodeData.classTechDetails: String;
begin
  Result := inherited classTechDetails + ', CID: ' + IntToStr(CID) + ', OID: ' + IntToStr(FOwnerID)
            + '; Parent: ' + FParent.classTechDetails;
end;

//==============================================================================================
function TapTreeNodeData.ExceptionMsg(const s: String = ''; const getServerError: Boolean = True): String;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.ExceptionMsg') else _udebug := nil;{$ENDIF}

  Result := classTechDetails;
  if getServerError then Result := Result + '; ' + FParent.Tree.lastServerError;
  if s <> '' then Result := Result + ': ' + s;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNodeData.reportError(func, err: String);
  var
    emsg: String;
begin
  emsg := ExceptionMsg(Format('%s error "%s"', [func, err]));
  debugInstantLog(emsg);
  ssMessageDlg(emsg, ssmtError, [ssmbOk], '', False, True);
end;

//==============================================================================================
constructor TapTreeNodeData.Create(AParent: TapTreeNode; const ds: TssClientDataSet = nil; const AOwnerID: Integer = -1);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.Create') else _udebug := nil;{$ENDIF}

  inherited Create(AParent);

  Clear;
  FParent := AParent;
  FOwnerID := AOwnerID;

  if ds <> nil then Load(ds, FOwnerID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TapTreeNodeData.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.Destroy') else _udebug := nil;{$ENDIF}

  //if Fparent <> nil then FParent.FData.Delete(FParent.FData.IndexOf(Self));// removing myself from parent's list
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNodeData.Clear;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.Clear') else _udebug := nil;{$ENDIF}

  inherited; //FID := -1;
  FCID := -1;
  FdataType := apTreeDTNull;
  FOwnerID := -1;
  VarClear(FValue);
  Fnew := True;
  Fmodified := False;
  FDeleted := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNodeData.getErrorText(const Index: Integer): String;
begin
  if (Index < 100) or (Index > High(nodeDataErrorTexts))
    then Result := inherited getErrorText(Index)
    else Result := nodeDataErrorTexts[Index];
end;

//==============================================================================================
procedure TapTreeNodeData.Delete;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.Delete') else _udebug := nil;{$ENDIF}

  setDeleted(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNodeData.setDeleted(Adeleted: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.setDeleted') else _udebug := nil;{$ENDIF}

  FDeleted := ADeleted;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNodeData.Load(const ds: TssClientDataSet; const AOwnerID: Integer = -1): Boolean; // loads from DB
  var
    OID, tmpCID, tmpOID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.Load') else _udebug := nil;{$ENDIF}

  Result := False;
  Clear;

  OID := AOwnerID;

  with ds do
    try
      if Active // try to fetch next records in sequence for that node and owner
         and ((Params.ParamByName('nodeid').AsInteger <> FParent.ID) or (Params.ParamByName('ownerid').AsInteger <> OID))
      then Close;

      if not Active then begin
        ProviderName := 'pCT_Data_Get';
        FetchParams;
        Params.ParamByName('nodeid').AsInteger := FParent.ID;
        Params.ParamByName('ownerid').AsInteger := OID;
        Open;
      end;

      while not eof do begin
        if FieldbyName('fcid').IsNull
          then tmpCID := -1
          else tmpCID := FieldbyName('fcid').asInteger;

        tmpOID := FieldbyName('fownerid').asInteger;

        if (OID > 0) and (OID <> tmpOID) then begin
          Next;
          Continue;
        end;

        // checking if this data piece already loaded in other data node
        if nil <> FParent.FindData(tmpOID, tmpCID) then begin
          Next;
          Continue;
        end;

        FID := FieldbyName('fid').asInteger;
        FdataType := FieldbyName('fType').asInteger;
        FCID := tmpCID;
        FOwnerID := tmpOID;

        case FdataType of
          apTreeDTInt:  FValue := FieldByName('fint').asInteger;
          apTreeDTNum:  FValue := FieldByName('fnum').asFloat;
          apTreeDTDbl:  FValue := FieldByName('fdbl').asFloat;
          apTreeDTTxt:  FValue := FieldByName('ftxt').asString;
          apTreeDTBlob:
            begin
              raise Exception.Create('CustomTree Blobs processing unavailable');
              // should get blob ID first and then fetch it from blobs table or just run appropriate provider ;)
              //FValue := FieldByName('ftxt').asString;
            end;
        end;

        break;

      end; // while not eof

      if eof then setError(d_err_load_eof); // indicator actually ;)

      Next;

      if FdataType <> apTreeDTNull
        then Result := True;

    except
      on E: Exception do begin
        setError(d_err_load, '', ExceptionMsg(e.Message));
        reportError('load', e.Message);
      end;
    end;

    if Result then begin
      FNew := False;
      FDeleted := False;
      FModified := False;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNodeData.Save: Boolean; // saves to DB
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.Save') else _udebug := nil;{$ENDIF}

  {$IFNDEF PKG}
  Result := True;
  clearError;

  if (FNew and (FDeleted or not FModified)) // new and unmodified goes to dump
     or (not FNew and not (FDeleted or FModified))// not new and Deleted will be physically removed from DB later below
     or (FOwnerID < 0) or (fdataType = apTreeDTNull) // weird case. for cross-checking
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    FModified := False;
    Exit;
  end;

  Result := False;

  with Fparent.Tree.dataSet do begin
    if Active then Close;

    if FDeleted then try
      ProviderName := 'pCT_Data_Del';
      FetchParams;
      Params.ParamByName('ID').AsInteger := FID;
      FetchMacros;
      case FdataType of
        apTreeDTInt: Macros.ParamByName('t').asString := 'ctInt';
        apTreeDTNum: Macros.ParamByName('t').asString := 'ctNumeric';
        apTreeDTDbl: Macros.ParamByName('t').asString := 'ctDouble';
        apTreeDTTxt: Macros.ParamByName('t').asString := 'ctText';
        //apTreeDTBlob:
      end;
      Execute;

      // this will be purged by TapTreeNode.Sweep() lately
      Clear;
      Result := True;

      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;

    except
      on e: exception do begin
        reportError('deletion', e.Message);
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;
    end; // if FDeleted then try

    // new or modified
    try
      ProviderName := 'pCT_Data_Set';
      FetchParams;

      Params.ParamByName('ID').AsInteger := FID;
      Params.ParamByName('CTNodeID').AsInteger := FParent.ID;
      Params.ParamByName('ownerid').AsInteger := FOwnerID;

      Params.ParamByName('cid').DataType := ftInteger;
      Params.ParamByName('cid').Clear;
      if FCID >= 0 then Params.ParamByName('cid').AsInteger := FCID;

      Params.ParamByName('ftype').AsInteger := FdataType;

      Params.ParamByName('fint').DataType := ftInteger;
      Params.ParamByName('fint').Clear;
      Params.ParamByName('fnum').DataType := ftFloat;
      Params.ParamByName('fnum').Clear;
      Params.ParamByName('fdbl').DataType := ftFloat;
      Params.ParamByName('fdbl').Clear;
      Params.ParamByName('ftxt').DataType := ftString;
      Params.ParamByName('ftxt').Clear;

      case FdataType of
        apTreeDTInt: Params.ParamByName('fint').AsInteger := FValue;
        apTreeDTNum: Params.ParamByName('fnum').AsFloat := FValue;
        apTreeDTDbl: Params.ParamByName('fdbl').AsFloat := FValue;
        apTreeDTTxt: Params.ParamByName('ftxt').AsString := FValue;
        apTreeDTBlob: raise Exception.Create('CustomTree Blobs processing unavailable');
      end;

      Open;
      if not eof then FID := FieldByName('id').AsInteger;
      Close;

    except
      on e: exception do begin
        reportError('saving', e.Message);
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;
    end;
  end; // with Fparent.Tree.dataSet do
  {$ENDIF}

  Result := True;
  FModified := False;
  FNew := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNodeData.MCSaveState;
begin
  inherited;

  FSaveState.Add('FdataType=' + IntToStr(FdataType));
  FSaveState.Add('FCID=' + IntToStr(FCID));
  FSaveState.Add('FOwnerID=' + IntToStr(FOwnerID));
  if VarIsNull(FValue)
    then FSaveState.Add('FValue=')
    else FSaveState.Add('FValue=' + VarAsType(FValue, varString));
end;

//==============================================================================================
procedure TapTreeNodeData.MCRestoreState;
begin
  inherited;

  FdataType := StrToInt(FsaveState.Values['FdataType']);
  FCID := StrToInt(FsaveState.Values['FCID']);
  FOwnerID := StrToInt(FsaveState.Values['FOwnerID']);
  case FdataType of
    apTreeDTInt: FValue := StrToInt(FsaveState.Values['FValue']);
    apTreeDTNum: FValue := StrToFloat(FsaveState.Values['FValue']);
    apTreeDTDbl: FValue := StrToFloat(FsaveState.Values['FValue']);
    apTreeDTTxt: FValue := FsaveState.Values['FValue'];
    else FValue := 0;
  end;
end;

//==============================================================================================
procedure TapTreeNodeData.setDataType(const Adt: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.setDataType') else _udebug := nil;{$ENDIF}

  if (Adt < 0) or (Adt > apTreeDTMax)
    then raise Exception.Create(ExceptionMsg('Invalid CT dataType: ' + IntTostr(Adt), False));

  if FdataType = Adt then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FdataType := Adt;
  try
    case FdataType of
      apTreeDTInt: FValue := VarAsType(FValue, varInteger);
      apTreeDTNum: FValue := VarAsType(FValue, varDouble);
      apTreeDTDbl: FValue := VarAsType(FValue, varDouble);
      apTreeDTTxt: FValue := VarAsType(FValue, varString);
      //apTreeDTBlob: raise;
    end;

  except
    VarClear(FValue);
  end;

  setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNodeData.setCID(const ACID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.setCID') else _udebug := nil;{$ENDIF}

  if FCID = ACID then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FCID := ACID;
  setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNodeData.setOwnerID(const AOID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.setOwnerID') else _udebug := nil;{$ENDIF}

  //if not FNew then raise Exception.Create(ExceptionMsg('attempt to re-set the OwnerID'), False);
  FOwnerID := AOID;
  setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
{
procedure TapTreeNodeData.setValue(const AValue: Variant);
begin
  if not VarIsNull(AValue) and not VarIsNull(Fvalue) and (AValue = Value)
  setModified(True);
end;
}

//==============================================================================================
procedure TapTreeNodeData.setParent(const AParent: TapTreeNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.setParent') else _udebug := nil;{$ENDIF}

  try // finally
    if AParent = FParent then Exit;

    if FParent <> nil then begin // removing self from current parent's list
      FParent.FData.Delete(FParent.FData.IndexOf(Self));
    end;

    FParent := AParent;
    FMetaParent := AParent;

    if FParent <> nil then begin // maybe nil should be an exception?
      FParent.FItems.Add(Self);
    end;

    setModified(True);

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TapTreeNodeData.getInt: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.getInt') else _udebug := nil;{$ENDIF}

  Result := 0;

  try // finally
    if FdataType = apTreeDTNull then Exit; // making empty data works

    try
      Result := FValue;
    except
      raise Exception.Create(ExceptionMsg('Variant -> Int cvt error', False));
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TapTreeNodeData.setInt(const AValue: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.setInt') else _udebug := nil;{$ENDIF}

  try // finally
    if (FdataType = apTreeDTInt) and (FValue = AValue) then Exit;

    FdataType := apTreeDTInt;
    FValue := AValue;
    setModified(True);

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TapTreeNodeData.getBool: Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.getBool') else _udebug := nil;{$ENDIF}

  if FdataType = apTreeDTNull then begin // making empty data works
    Result := False;
  end
  else try
    Result := (FValue <> 0);
  except
    raise Exception.Create(ExceptionMsg('Variant -> Bool cvt error', False));
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNodeData.setBool(const AValue: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.setBool') else _udebug := nil;{$ENDIF}

  if (FdataType = apTreeDTInt) and ((not AValue and (FValue = 0)) or (AValue and (FValue <> 0))) then  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FdataType := apTreeDTInt;
  if AValue
    then FValue := 1
    else FValue := 0;
  setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNodeData.getNum: Double;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.getNum') else _udebug := nil;{$ENDIF}

  if FdataType = apTreeDTNull then begin // making empty data works
    Result := 0.0;
  end
  else try
    Result := FValue;
  except
    raise Exception.Create(ExceptionMsg('Variant -> Num cvt error', False));
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNodeData.setNum(AValue: Double);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.setNum') else _udebug := nil;{$ENDIF}

  if (FdataType = apTreeDTNum) and (FValue = AValue) then  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FdataType := apTreeDTNum;
  FValue := AValue;
  setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNodeData.getDbl: Double;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.getDbl') else _udebug := nil;{$ENDIF}

  if FdataType = apTreeDTNull then begin // making empty data works
    Result := 0.0;
  end
  else try
    Result := FValue;
  except
    raise Exception.Create(ExceptionMsg('Variant -> Dbl cvt error', False));
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNodeData.setDbl(AValue: Double);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.setDbl') else _udebug := nil;{$ENDIF}

  if (FdataType = apTreeDTDbl) and (FValue = AValue) then  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FdataType := apTreeDTDbl;
  FValue := AValue;
  setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNodeData.getTxt: String;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.getTxt') else _udebug := nil;{$ENDIF}

  if FdataType = apTreeDTNull then begin // making empty data works
    Result := '';
  end
  else try
    Result := FValue;
  except
    raise Exception.Create(ExceptionMsg('Variant -> Txt cvt error', False));
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNodeData.setTxt(const AValue: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.setTxt') else _udebug := nil;{$ENDIF}

  if (FdataType = apTreeDTTxt) and (FValue = AValue) then  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FdataType := apTreeDTTxt;
  FValue := AValue;
  setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNodeData.getBlob: TStream;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.getBlob') else _udebug := nil;{$ENDIF}

  Result := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNodeData.setBlob(const AValue: TStream);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.setBlob') else _udebug := nil;{$ENDIF}

  setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNodeData.Serialize(var SO: TSerializator): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.Serialize(TSerializator)') else _udebug := nil;{$ENDIF}

  Result := False;

  if not inherited Serialize(SO) then begin // do the base class first
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  //SO.BeginSection('');
  SO.Int := FdataType;
  SO.Int := FCID;
  SO.Int := FOwnerID;

  case FdataType of
    apTreeDTInt: SO.Int := Self.asInteger;

    apTreeDTNum,
    apTreeDTDbl: SO.Ext := Self.asDouble;

    apTreeDTTxt: SO.Str := Self.asString;
  end; // case FdataType

  {SO.Int := FParent.ID; // as data nodes must come right after the parent node then we don't need to put the parent in
  SO.EndSection;
  }

  Result := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNodeData.deSerialize(const SO: TSerializator; const AParent: TapTreeNode): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNodeData.deSerialize(TSerializator)') else _udebug := nil;{$ENDIF}

  try // finally
    Result := False;

    if not inherited deSerialize(SO, nil) then Exit; // do the base class first

    FdataType := SO.Int;
    if SO.Error > 0 then Exit;

    if (FdataType < 0) or (FdataType > apTreeDTMax) then Exit;

    FCID := SO.Int;
    if SO.Error > 0 then Exit;

    FOwnerID := SO.Int;
    if SO.Error > 0 then Exit;


    case FdataType of
      apTreeDTInt:
        begin
          FValue := SO.Int;
          if SO.Error > 0 then Exit;
        end;

      apTreeDTNum,
      apTreeDTDbl:
        begin
          FValue := SO.Ext;
          if SO.Error > 0 then Exit;
        end;

      apTreeDTTxt:
        begin
          FValue := SO.Str;
          if SO.Error > 0 then Exit;
        end;
    end; // case FdataType

    Parent := AParent;
    FMetaParent := AParent;

    Result := True;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
//==============================================================================================
// TapTreeNode =================================================================================
//==============================================================================================
//==============================================================================================
function TapTreeNode.classTechDetails: String;
begin
  Result := inherited classTechDetails + ', Pos: ' + IntToStr(FPos) + ', NodeData: ' + IntToStr(FNodeData);

  if FItems <> nil then Result := Result + ', Child nodes: ' + IntToStr(FItems.Count);
  if FData <> nil then Result := Result + ', Data nodes: ' + IntToStr(FData.Count);

  if FParent <> nil
    then Result := Result + '; Parent: ' + FParent.Name
    else Result := Result + '; *ROOT*';

  if FTree <> nil
    then Result := Result + '; Tree: ' + FTree.Name
    else Result := Result + '; No tree.';
end;

//==============================================================================================
function TapTreeNode.ExceptionMsg(const s: String = ''; const getServerError: Boolean = True): String;
  var
    f: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.ExceptionMsg') else _udebug := nil;{$ENDIF}

  Result := classTechDetails;

  if getServerError then Result := Result + '; ' + Tree.lastServerError;

  if s <> '' then Result := Result + ': ' + s;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNode.reportError(func, err: String);
  var
    emsg: String;
begin
  emsg := ExceptionMsg(Format('%s error "%s"', [func, err]));
  debugInstantLog(emsg);
  ssMessageDlg(emsg, ssmtError, [ssmbOk], '', False, True);
end;

//==============================================================================================
procedure TapTreeNode.Clear;
  var
    i: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.Clear') else _udebug := nil;{$ENDIF}

  // clearing it ourselves as TMetaClassList will try to destroy it his (and wrong) way
  for i := 0 to FItems.Count - 1 do
    if FItems[i] <> nil then TapTreeNode(FItems[i]).Destroy;
  FItems.Clear;

  ClearData;

  FPos := -1;
  FNodeData := 0;
  VarClear(FFind);

  if FRTData = nil
    then FRTData := TSimpleAssociativeArray.Create
    else FRTData.Clear;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNode.ClearData(const AOwnerID: Integer = -1; const clearChildren: boolean = False);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.ClearData') else _udebug := nil;{$ENDIF}

  if FData <> nil then begin
    for i := 0 to FData.Count - 1 do
      if (FData[i] <> nil) and ((AOwnerID = -1) or (TapTreeNodeData(FData[i]).OwnerID = AOwnerID))
      then begin
        if not TapTreeNodeData(FData[i]).Fnew and (FLoadedState = apNodeLoadedFull) then FLoadedState := apNodeLoadedPart;

        TapTreeNodeData(FData[i]).Destroy;
        FData[i] := nil;
      end;

    FData.Pack;
  end
  else FData := TList.Create;

  if FData.Count = 0 then FLoadedState := apNodeLoadedNone;

  if clearChildren and (FItems <> nil)
    then for i := 0 to FItems.Count - 1 do TapTreeNode(FItems[i]).ClearData(AOwnerID, True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
constructor TapTreeNode.Create(const AName: String; const ATree: TapTree); // for empty node (special trick)
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.Create(AName, ATree)') else _udebug := nil;{$ENDIF}

  Create(Aname, TapTreeNode(ATree));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
constructor TapTreeNode.Create(const AName: String; const AParent: TapTreeNode); // for empty node
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.Create(AName, AParent)') else _udebug := nil;{$ENDIF}

  inherited Create(AParent);
  FData := nil;
  FRTData := nil;

  Clear;

  // note: parent for _node_ is always not nil. it can be nil for TapTree, but that case handled elsewhere
  // parent can be set later when loading data from DB
  if AParent <> nil then begin
    FParent := AParent;
    FParent.FItems.Add(Self);
    Ftree := FParent.Tree;
  end;

  FName := trim(Aname);
  if FName <> '' then setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
constructor TapTreeNode.Create(const ATree: TapTree); // standard way of node creation
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.Create(ATree)') else _udebug := nil;{$ENDIF}

  inherited Create(ATree);
  FData := nil;
  FRTData := nil;

  Clear;

  FTree := ATree;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TapTreeNode.Destroy;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.Destroy') else _udebug := nil;{$ENDIF}

  Clear;
  FData.Free;
  FRTData.Destroy;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.getErrorText(const Index: Integer): String;
begin
  if (Index < 100) or (Index > High(nodeErrorTexts))
    then Result := inherited getErrorText(Index)
    else Result := nodeErrorTexts[Index];
end;

//==============================================================================================
procedure TapTreeNode.MCSaveState;
  var
    i: Integer;
begin
  inherited;

  FSaveState.Add('FPos=' + IntToStr(FPos));
  FSaveState.Add('FNodeData=' + IntToStr(FNodeData));
  FSaveState.Add('FLoadedState=' + IntToStr(FLoadedState));

  for i := 0 to FItems.Count - 1 do TapTreeNode(FItems[i]).MCSaveState;
  for i := 0 to FData.Count - 1 do TapTreeNodeData(FData[i]).MCSaveState;
end;

//==============================================================================================
procedure TapTreeNode.MCRestoreState;
  var
    i: Integer;
begin
  inherited;

  FPos := StrToInt(FsaveState.Values['FPos']);
  FNodeData := StrToInt(FsaveState.Values['FNodeData']);
  FLoadedState := StrToInt(FsaveState.Values['FLoadedState']);

  for i := 0 to FItems.Count - 1 do TapTreeNode(FItems[i]).MCRestoreState;
  for i := 0 to FData.Count - 1 do TapTreeNodeData(FData[i]).MCRestoreState;
end;

//==============================================================================================
function TapTreeNode.AddChild(const Aname: String; const Adata: Integer = 0): TapTreeNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.AddChild') else _udebug := nil;{$ENDIF}

  Result := TapTreeNode.Create(AName, Self);
  Result.NodeData := Adata;

  {
  it is necessary to make newly created tree nodes be saved to provide parents for they children nodes
  that is pretty dirty hack as this tree may be empty and useless at all, but I'm lazy to think about the right method now
  On the second though - probably the save() should check for tree modification.
  Or we just use the rula that garbage collection is always a developer's task, so don't left unused nodes on the Save()

  upd:
  in save we'll use new CheckModifed func to determine if there is need-to-be-saved _parent_ nodes
  }
  //setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.AddSibling(const Aname: String; const Adata: Integer = 0): TapTreeNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.AddSibling') else _udebug := nil;{$ENDIF}

  if FParent = nil then begin // attempt on tree's root
    Result := nil;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  Result := FParent.AddChild(AName, AData);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.Save(SaveChildren: Boolean): Boolean;
  var
    i,n: Integer;
    s: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.Save') else _udebug := nil;{$ENDIF}

  Result := True;
  Screen.Cursor := crSQLWait;

  try // finally
    if FDeleted then begin
      if not FNew then begin// removing from DB
        with Ftree.DataSet do
        try
          if Active then Close;
          ProviderName := 'pCT_Node_Del';
          FetchParams;
          Params.ParamByName('nodeid').asInteger := FID;
          Execute;

        except
          on e: Exception do begin
            Result := False;
            setError(n_err_delete, '', ExceptionMsg(e.Message));
            reportError('deletion', e.Message);
            Exit;
          end;
        end;
      end; // if not FNew

      Clear; // pCT_Node_Del erases all children nodes with data. so we just making clear on our side.
      setDeleted(True); // for sweep to remove this node later
    end // if FDeleted

    else if FModified then begin //---------------------------------------------------
      with Ftree.DataSet do begin
        if Active then Close;

        // note: tree root have no parent, so check is here
        if (FParent <> nil) and FParent.isNew then begin // forcing parent(s) to save itself
          FParent.setModified(True);

          if not FParent.Save(False) then begin
            setError(n_err_parent_save, '', ExceptionMsg(Fparent.lastErrorText));
            Result := False;
            Exit;
          end;
        end;

        if Fnew then begin
          try
            ProviderName := 'pCT_Tree_Ins';
            FetchParams;
            Params.ParamByName('treeid').asInteger := FTree.TreeID;
            Params.ParamByName('ownertype').asInteger := FTree.OwnerType;
            Params.ParamByName('name').asString := FName;

            if FParent = nil
              then Params.ParamByName('parentid').asInteger := 0
              else Params.ParamByName('parentid').asInteger := FParent.ID;

            Params.ParamByName('data').asInteger := FNodeData;

            Params.ParamByName('pos').DataType := ftInteger;
            Params.ParamByName('pos').Clear;
            if Pos <> -1 then Params.ParamByName('pos').asInteger := Pos;

            Execute;

            // fetching new node id
            ProviderName := 'pCT_Node_GetLastID';
            Open;
            FID := FieldbyName('id').asInteger;
            Close;

            {ProviderName := 'pCT_Tree_Node_Get';
            FetchParams;
            Params.ParamByName('treeid').asInteger := FTree.TreeID;

            FetchMacros;
            if FParent = nil
              then s := '0'
              else s := IntToStr(FParent.ID);

            Macros.ParamByName('w').asString := ' and name=''' + FName + ''''
                  + ' and parentid=' + s + ' and data=' + IntTostr(FNodeData);

            Open;
            if not eof then FID := FieldbyName('id').asInteger;
            Close;
            }

            Fmodified := False;
            Fnew := False;

          except
            on e: Exception do begin
              Result := False;
              setError(n_err_save, '', ExceptionMsg(e.Message));
              reportError('inserting', e.Message);
              Exit;
            end;
          end; // if FModified then try
        end // if FNew

        else begin // not new, modified
          try // updating
            ProviderName := 'pCT_Tree_Upd';
            FetchParams;
            Params.ParamByName('id').asInteger := FId;
            Params.ParamByName('name').asString := FName;

            if FParent = nil
              then n := 0
              else n := FParent.ID;

            Params.ParamByName('parentid').asInteger := n;

            Params.ParamByName('data').asInteger := FNodeData;

            Params.ParamByName('pos').DataType := ftInteger;
            Params.ParamByName('pos').Clear;
            if Pos <> -1 then Params.ParamByName('pos').asInteger := Pos;

            Execute;

            Fmodified := False;

          except
            on e: Exception do begin
              Result := False;
              setError(n_err_save_upd, '', ExceptionMsg(e.Message));
              reportError('update', e.Message);
              Exit;
            end;
          end;
        end; // if FNew
      end; // with Ftree.DataSet
    end; // not deleted, else if FModified

    if SaveChildren then
      for i := 0 to FItems.Count - 1 do
        if not TapTreeNode(Fitems[i]).Save(SaveChildren) then begin
          Result := False;
          setError(n_err_save_children, '', ExceptionMsg(TapTreeNode(Fitems[i]).lastErrorText));
          Exit;
        end;

  finally
    Screen.Cursor := crDefault;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TapTreeNode.Load: Boolean;
  var
    i: Integer;
    newnode: TapTreeNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.Load') else _udebug := nil;{$ENDIF}

  Result := False;
  Clear;

  try //finally
    with Ftree.DataSet do
      try //except
        if eof then begin
          setError(n_err_eof);
          Exit;
        end;

        FID := FieldbyName('id').asInteger;
        FName := FieldbyName('name').asString;

        i := FieldbyName('ParentID').asInteger;
        if i > 0 then begin // not a tree root
          Parent := Ftree.NodeByID(i); // we need to call it via prop to relocate from parent to parent correctly
          if FParent = nil // checking for hanging nodes after previous crash on save to DB
            then Parent := FTree;
        end;

        if FieldbyName('pos').isNull
          then FPos := -1
          else FPos := FieldbyName('pos').asInteger;

        if FieldbyName('data').isNull
          then FNodeData := 0
          else FNodeData := FieldbyName('data').asInteger;

        Fnew := False;
        FModified := False;
        Result := True;

      except
        on e: Exception do begin
          setError(n_err_load, '', ExceptionMsg(e.Message));
          reportError('Load', e.Message);
        end;
      end; // with Ftree.DataSet do try

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TapTreeNode.AddData(const AOwnerID: Integer; const ACID: Integer = -1): TapTreeNodeData;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.AddData') else _udebug := nil;{$ENDIF}

  Result := TapTreeNodeData.Create(Self, nil, AOwnerID);
  FData.Add(Result);
  Result.CID := ACID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.LoadData(const AOwnerID: Integer = -1; const LoadChildren: Boolean = False; ds: TssClientDataSet = nil): Boolean;
  var
    newitem: TapTreeNodeData;
    myds, res: Boolean;
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  Result := True;
  clearError;

  if FDeleted or FNew or (FLoadedState = apNodeLoadedFull) then Exit; // save the bandwidth

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.LoadData') else _udebug := nil;{$ENDIF}

  myds := (ds = nil);
  if myds then ds := newDS(FTree);

  try // finally
    with ds do try
      repeat
        {nodeData correctly opens ds itself if needed. also it checks for "already loaded" situation
         we just watch the eof

NOTE: we try to skip any errors just to make later analysis and recovery attempts possible
        }
        newitem := TapTreeNodeData.Create(Self, ds, AOwnerID);

        if (newitem.error <> 0) or (newitem.dataType = apTreeDTNull) then begin
          if newitem.error <> d_err_load_EOF then begin
            setError(n_err_dataload, '', ExceptionMsg(newitem.lastErrorText));
            Result := False;
          end;

          newitem.Destroy;
        end
        else FData.Add(newitem);
      until eof;

      Close;

      if LoadChildren
        then for i := 0 to FItems.Count - 1 do begin
          res := TapTreeNode(FItems[i]).LoadData(AOwnerID, LoadChildren, ds);
          Result := res and Result;

          if not res and (TapTreeNode(FItems[i]).lastError <> d_err_load_EOF)
            then setError(n_err_dataload_children, '', ExceptionMsg(TapTreeNode(FItems[i]).lastErrorText), True);
        end; // for i := 0 to FItems.Count - 1

      if AOwnerID = -1
        then FLoadedState := apNodeLoadedFull
        else FLoadedState := apNodeLoadedPart;

    except
      on e: Exception do begin
        Result := False;
        setError(n_err_dataload, '', ExceptionMsg(e.Message));
        reportError('data load', e.Message);
      end;
    end; // with ds do try

  finally
    if myds then ds.Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end; // TapTreeNode.loadData

//==============================================================================================
function TapTreeNode.SaveData(const AOwnerID: Integer = -1; const SaveChildren: Boolean = False): Boolean;
  var
    i: Integer;
    d: TapTreeNodeData;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.SaveData') else _udebug := nil;{$ENDIF}

  Result := False;
  clearError;

  if FNew then Exit; // node itself is not saved yet. so we cannot save data

  // note: deleted items should be handled by sweep()
  for i := 0 to FData.Count - 1 do begin
    d := TapTreeNodeData(FData[i]);

    if (AOwnerID <> -1) and (d.OwnerID <> AOwnerID) then Continue;

    if not d.Save then begin
      setError(n_err_savedata, '', ExceptionMsg(d.lastErrorText));
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;
  end;

  if SaveChildren
  then for i := 0 to FItems.Count - 1
    do if not TapTreeNode(FItems[i]).SaveData(AOwnerID, SaveChildren) then begin
      setError(n_err_savedata_children, '', ExceptionMsg(TapTreeNode(FItems[i]).lastErrorText));
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

  Result := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.NodeByID(const AID: Integer): TapTreeNode;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.NodeByID') else _udebug := nil;{$ENDIF}

  try // finally
    if FID = AID then begin
      Result := Self;
      Exit;
    end;

    // not found here. looking in children's subnodes
    for i := 0 to FItems.Count - 1 do begin
      Result := TapTreeNode(FItems[i]).NodeByID(AID);
      if Result <> nil then Exit;
    end;

    Result := nil;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TapTreeNode.FindClear; // resets  previous Find... mode
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.FindClear') else _udebug := nil;{$ENDIF}

  if not VarIsClear(FFind) then begin
    VarClear(FFind);
    for i := 0 to FItems.Count - 1 do TapTreeNode(FItems[i]).FindClear;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.FindFirst(const AName: String; const inChildren: Boolean = True; const AutoCreate: Boolean = False): TapTreeNode;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.FindFirst') else _udebug := nil;{$ENDIF}

  FindClear;

  FFind := AName;

  if AnsiLowerCase(FName) = AnsiLowerCase(AName) then begin
    Result := Self;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  // not found here. looking in children's subnodes
  for i := 0 to FItems.Count - 1 do begin
    Result := TapTreeNode(FItems[i]);
    if Result.FDeleted then Continue;

    if AnsiLowerCase(Result.Name) = AnsiLowerCase(AName) then  begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if inChildren then begin
      Result := Result.FindFirst(AName, inChildren);

      if Result <> nil then  begin
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    end;
  end;

  if not inChildren and AutoCreate // used to make new tree fast and easy
    then Result := TapTreeNode.Create(AName, Self)
    else Result := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.FindFirst(const AData: Integer; const inChildren: Boolean = True): TapTreeNode;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.FindFirst') else _udebug := nil;{$ENDIF}

  FindClear;

  FFind := Adata;

  if FNodeData = Adata then begin
    Result := Self;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  // not myself. looking in children's subnodes
  for i := 0 to FItems.Count - 1 do begin
    Result := TapTreeNode(FItems[i]);
    if Result.FDeleted then Continue;

    if Result.NodeData = AData then  begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if inChildren then begin
      Result := Result.FindFirst(AData, inChildren);

      if Result <> nil then Break;
    end;
  end;

  Result := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.FindNext: TapTreeNode; // find next element (user-side)
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.FindNext') else _udebug := nil;{$ENDIF}

  Result := FindNext(null);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.FindNext(const AFind: Variant): TapTreeNode; // find next element (internal)
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.FindNext') else _udebug := nil;{$ENDIF}

  Result := nil;

  if VarisNull(AFind) and VarisClear(FFind) then begin // no previous findfirst
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if VarIsClear(FFind) then begin // FindFirst didn't get here
    FFind := AFind;
    if varInteger = VarType(AFind) then begin
      if FNodeData = AFind then Result := Self;
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end
    else begin
      if FName = AFind then Result := Self;
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;
  end; // if VarIsClear(FFind)

  // no match here. trying children
  for i := 0 to FItems.Count - 1 do begin
    Result := TapTreeNode(FItems[i]);
    if Result.FDeleted then Continue;

    Result := Result.FindNext(FFind);
    if Result <> nil then  begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

  end;

  Result := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.FirstNode: TapTreeNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.FirstNode') else _udebug := nil;{$ENDIF}

  if FItems.Count > 0
    then Result := FItems[0]
    else Result := Self;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
// specifically used to find the last node in _this_ branch
function TapTreeNode.LastNode: TapTreeNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.LastNode') else _udebug := nil;{$ENDIF}

  if FItems.Count = 0
    then Result := Self
    else Result := TapTreeNode(FItems.Last).LastNode;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.PrevNode: TapTreeNode;
  var
    node: TapTreeNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.PrevNode') else _udebug := nil;{$ENDIF}

  if FParent = nil then begin
    Result := nil;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  node := Self;
  repeat // climbing up the branch
    Result := node.PrevSibling;
    if Result = nil then node := node.FParent;
    if node = nil then  begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

  until Result <> nil;

  Result := Result.LastNode;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.NextNode: TapTreeNode;
  var
    node: TapTreeNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.NextNode') else _udebug := nil;{$ENDIF}

  try // finally
    if FItems.Count > 0 then begin
      Result := FItems[0];
      Exit;
    end;

    node := Self;
    repeat // climbing up the branch
      Result := node.NextSibling;
      if Result = nil then node := node.FParent;
      if node = nil then Break;
    until Result <> nil;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TapTreeNode.FirstSibling: TapTreeNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.FirstSibling') else _udebug := nil;{$ENDIF}

  Result := FParent[0]; // we not checking bounds as we're exist then something should be up there

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.LastSibling: TapTreeNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.LastSibling') else _udebug := nil;{$ENDIF}

  Result := FParent.FItems.Last; // we not checking bounds as we're exist then something should be up there

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.PrevSibling: TapTreeNode;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.PrevSibling') else _udebug := nil;{$ENDIF}

  Result := nil;

  try //finally
    if FParent = nil then Exit;

    i := FParent.FItems.IndexOf(Self) - 1;
    if i > -1 then Result := FParent.FItems[i];

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TapTreeNode.NextSibling: TapTreeNode;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.NextSibling') else _udebug := nil;{$ENDIF}

  Result := nil;

  try //finally
    if FParent = nil then Exit;

    i := 1 + FParent.FItems.IndexOf(Self);
    if i < FParent.Count then Result := FParent.FItems[i];

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TapTreeNode.setParentNode(const Anode: TapTreeNode);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.setParentNode') else _udebug := nil;{$ENDIF}

  if ANode = FParent then  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if FParent <> nil then begin // removing self from current parent's list
    FParent.FItems.Delete(FParent.FItems.IndexOf(Self));
    FParent.setModified(True);
  end;

  FParent := Anode;

  if FParent <> nil then begin
    FParent.FItems.Add(Self);
    FParent.setModified(True);
  end;

  //setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNode.setPos(const APos: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.setPos') else _udebug := nil;{$ENDIF}

  if FPos = APos then  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FPos := APos;
  setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNode.setNodeData(const Adata: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.setNodeData') else _udebug := nil;{$ENDIF}

  if FNodeData = AData then  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FnodeData := AData;
  setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNode.setName(const AName: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.setName') else _udebug := nil;{$ENDIF}

  if FName = AName then  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FName := AName;
  setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNode.setItems(const idx: Integer; Anode: TapTreeNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.setItems') else _udebug := nil;{$ENDIF}

  if (FItems = nil) or (FItems.Count <= idx) or (idx < 0)
    then Exception.Create(ExceptionMsg('Invalid Items index (' + IntToStr(idx) + ') in setItems', False));

  try
    if FItems[idx] <> nil then TapTreeNode(FItems[idx]).setParentNode(nil);

  except
  end;

  FItems[idx] := Anode;
  Anode.setParentNode(Self);
  //setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.getItems(const idx: Integer): TapTreeNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.getItems') else _udebug := nil;{$ENDIF}

  if (FItems = nil) or (FItems.Count <= idx) or (idx < 0)
    then Result := nil
    else Result := FItems[idx];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNode.setData(const idx: Integer; AData: TapTreeNodeData);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.setData') else _udebug := nil;{$ENDIF}

  if (FData = nil) or (FData.Count <= idx) or (idx < 0)
    then Exception.Create(ExceptionMsg('TapTreeNode.setData: Invalid Data index (' + IntToStr(idx) + ')', False));

  if FData.IndexOF(Adata) > -1
    then Exception.Create(ExceptionMsg('TapTreeNode.setData: Data already in list', False));

  Adata.setParent(Self);

  //setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.getData(const idx: Integer): TapTreeNodeData;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.getData') else _udebug := nil;{$ENDIF}

  if (FData = nil) or (FData.Count <= idx) or (idx < 0)
    then Result := nil
    else Result := FData[idx];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.getItemsCount: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.getItemsCount') else _udebug := nil;{$ENDIF}

  if Fitems = nil
    then Result := 0
    else Result := Fitems.Count;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.getDataCount: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.getDataCount') else _udebug := nil;{$ENDIF}

  if FData = nil
    then Result := 0
    else Result := FData.Count;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.FindData(const AOwnerID: Integer; const ACID: Integer = -1; const AutoCreate: Boolean = False): TapTreeNodeData;
  var
    i: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.FindData') else _udebug := nil;{$ENDIF}

  try // finally
    for i := 0 to FData.Count - 1
      do if (TapTreeNodeData(FData[i]).OwnerID = AOwnerID) and ( (ACID = -1) or (TapTreeNodeData(FData[i]).FCID = ACID) )
      then begin
        Result := FData[i];
        Exit;
      end;

    if not AutoCreate then begin
      Result := nil;
      Exit;
    end;

    Result := TapTreeNodeData.Create(Self, nil, AOwnerID);
    FData.Add(Result);
    Result.CID := ACID;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
// used to reset some fake Owner Id to real for newly created owner object. That is autorecursive!
function TapTreeNode.ChangeOID(const AOIDFrom, AOIDTo: Integer): Integer;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.ChangeOID') else _udebug := nil;{$ENDIF}

  Result := 0;

  for i := 0 to FData.Count - 1 do
    if TapTreeNodeData(FData[i]).OwnerID = AOIDFrom then begin
      TapTreeNodeData(FData[i]).OwnerID := AOIDTo;
      inc(Result);
    end;

  for i := 0 to FItems.Count - 1 do Result := Result + TapTreeNode(FItems[i]).ChangeOID(AOIDFrom, AOIDTo);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNode.MakeData(const AOwnerid, ACID: Integer);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.MakeData') else _udebug := nil;{$ENDIF}

  FindData(AOwnerID, ACID, True); // just create it here if it not exists

  for i := 0 to FItems.Count - 1 do TapTreeNode(FItems[i]).MakeData(AOwnerID, ACID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNode.setDeleted(Adeleted: Boolean);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.setDeleted') else _udebug := nil;{$ENDIF}

  FDeleted := ADeleted;
  for i := 0 to FItems.Count - 1 do TapTreeNode(FItems[i]).setDeleted(ADeleted);
  for i := 0 to FData.Count - 1 do TapTreeNodeData(FData[i]).setDeleted(ADeleted);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNode.Delete; // marks node and children as deleted, so on save it will be removed from the DB
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.Delete') else _udebug := nil;{$ENDIF}

  setDeleted(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNode.setModified(AModified: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.setModified') else _udebug := nil;{$ENDIF}

  FModified := AModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.CheckModified(checkData: Boolean = True; checkSubNodes: Boolean = True; checkSubNodesData: Boolean = True): Integer;
  var
    i,r: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.CheckModified') else _udebug := nil;{$ENDIF}

  Result := 0;

  if CheckData then
    for i := 0 to FData.Count - 1
      do if TapTreeNodeData(FData[i]).FModified then begin Result := Result or 1; Break; end;

  if CheckSubNodes then
    for i := 0 to FItems.Count - 1 do begin
      r := TapTreeNode(FItems[i]).CheckModified(checkSubNodesData, checkSubNodes, checkSubNodesData);
      if (r and 1 = 1) or (r and 4 = 1) then Result := Result or 4;
      if r and 2 = 1 then Result := Result or 2;

      if Result = 7 then Break; // to speed up the process
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.ChildrenLoadedState(includeMySelf: Boolean = False): Integer;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.ChildrenLoadedState') else _udebug := nil;{$ENDIF}

  if includeMySelf
    then Result := FLoadedState
    else Result := apNodeLoadedFull; // assuming there is anything loaded down there by default.

  for i := 0 to FItems.Count - 1 do begin
    if Result = apNodeLoadedPart then Break; // no need to go down, really

    case TapTreeNode(FItems[i]).ChildrenLoadedState(True) of
      apNodeLoadedNone: if Result = apNodeLoadedFull then Result := apNodeLoadedPart;
      apNodeLoadedFull: if Result = apNodeLoadedNone then Result := apNodeLoadedPart;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTreeNode.Refresh(doOwnData, doSubTree, doSubData: Boolean); // reloads anything _missing_ from DB
  var
    i: Integer;
    n: TapTreeNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.Refresh') else _udebug := nil;{$ENDIF}

  //for i := 0 to FItems.Count - 1 do begin
  raise Exception.Create('TapTreeNode.Refresh. ya know it...');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
// removes deleted and unfilled new nodes and data. returns true if it destroyed itself too
function TapTreeNode.Sweep(const doNodes: boolean = True; const doData: boolean = True; const MayDestroyMeToo: Boolean = False): Boolean;
  var
    i: Integer;
    //n: TapTreeNode;
    d: TapTreeNodeData;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTreeNode.Sweep') else _udebug := nil;{$ENDIF}

  // result = true if self-destroyed only
  Result := False;

  if doNodes then
    for i := 0 to FItems.Count - 1
      do if TapTreeNode(FItems[i]).Sweep(True, doData, True) then FItems[i] := nil; // will self-destruct if unused

  FItems.Pack;

  if doData then
    for i := 0 to FData.Count - 1 do begin
      d := TapTreeNodeData(FData[i]);
      if d.FNew and (d.FDeleted or not d.FModified) then begin
        d.Destroy;
        FData[i] := nil;
      end;
    end;
  FData.Pack;

  if MayDestroyMeToo and Fnew and (FDeleted or not fModified) then begin
    Destroy;
    Result := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTreeNode.Serialize(var SO: TSerializator): Boolean;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.Serialize(SO)') else _udebug := nil;{$ENDIF}

  Result := False;

  try // finally
    if not inherited Serialize(SO) then Exit; // this will put a count of data nodes

    SO.Int := FParent.ID;
    SO.Int := FPos;
    SO.Int := FNodeData;
    SO.Int := FData.Count;

    for i := 0 to FData.Count - 1 do
      if not TapTreeNodeData(FData[i]).Serialize(SO) then begin
        // setError(
        Exit;
      end;


    for i := 0 to FItems.Count - 1 do
      if not TapTreeNode(FItems[i]).Serialize(SO) then begin
        // setError(
        Exit;
      end;

    Result := True;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TapTreeNode.deSerialize(const SO: TSerializator; const AParent: TapTreeNode): Boolean;
  var
    i, newItems, newData: Integer;
    data, dataOld: TapTreeNodeData;
    node, nodeOld: TapTreeNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.deSerialize(SO, AParent)') else _udebug := nil;{$ENDIF}

  Result := False;

  try // finally
    newItems := inherited deSerialize(SO, nil); // returns count of new items
    if newItems = -1 then Exit;

    i := SO.Int;
    if SO.Error > 0 then Exit;

    if AParent.ID <> i then Exit;

    FPos := SO.Int;
    if SO.Error > 0 then Exit;

    FNodeData := SO.Int;
    if SO.Error > 0 then Exit;

    newData := SO.Int;
    if SO.Error > 0 then Exit; // additional/replacements for data items


    // MetaClassList deserializator set the expected count for FItems, so we need to fill all these

    for i := 1 to newData do begin
      data := TapTreeNodeData.Create(Self);

      if not data.deSerialize(SO, Self) then Exit;

      // should we add or replace exisitng item?
      dataOld := FindData(data.OwnerID, data.CID);
      if dataOld = nil
        then FData.add(data)
        else begin
          FData[FData.IndexOf(dataOld)] := data;
          dataOld.Destroy;
        end;
    end;

    // todo 5 -cмысли: может на этапе замены старого узла новым нужно ещё проверять поддерево для поиска изменений в нём?
    for i := 1 to newItems do begin
      node := TapTreeNode.Create(Ftree);

      if not node.deSerialize(SO, Self) then Exit;

      // should we add or replace exisiting branch?
      nodeOld := FindFirst(node.Name, False);
      if nodeOld = nil
        then FItems.add(node)
        else begin
          FItems[FItems.IndexOf(nodeOld)] := node;
          nodeOld.Destroy;
        end;
    end;

    Result := True;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
//==============================================================================================
//==== TapTree =================================================================================
//==============================================================================================
//==============================================================================================
function TapTree.getErrorText(const Index: Integer): String;
begin
  if (Index < 200) or (Index > High(treeErrorTexts))
    then Result := inherited getErrorText(Index)
    else Result := treeErrorTexts[Index];
end;

//==============================================================================================
function TapTree.lastServerError: String;
begin
  try
    if (FDS <> nil) and FDS.RemoteServer.Connected
    then begin
      Result := FDS.RemoteServer.AppServer.stat_lastError;

      if Result = ''
        then Result := 'No Server-side errors reported.'
        else Result := 'Server reported the following error: ' + Result;

    end
    else Result := 'Not connected to server.';

  except
    Result := 'Failed to get last server error.';
  end
end;

//==============================================================================================
procedure TapTree.Clear;
begin
  FTreeId := -1;
  FOwnerType := -1;

  BrokenItems := 0;

  inherited;
end;

//==============================================================================================
procedure TapTree.MCSaveState;
begin
  inherited;

  FSaveState.Add('FTreeID=' + IntToStr(FTreeID));
  FSaveState.Add('FOwnerType=' + IntToStr(FOwnerType));
end;

//==============================================================================================
procedure TapTree.MCRestoreState;
begin
  inherited;

  FTreeID := StrToInt(FsaveState.Values['FTreeID']);
  FOwnerType := StrToInt(FsaveState.Values['FOwnerType']);
end;

//==============================================================================================
function TapTree.classTechDetails: String;
begin
  Result := inherited classTechDetails;
  
  if FTreeId = -1
    then Result := Result + ', no Tree Id'
    else Result := Result + ', Tree ID: ' + IntTostr(FtreeID);

  if FOwnerType = -1
    then Result := Result + ', no OwnerType'
    else Result := Result + ', OwnerType: ' + IntTostr(FOwnerType);
end;

//==============================================================================================
constructor TapTree.Create; // for blank new tree. you can set the name later, once ;)
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.Create') else _udebug := nil;{$ENDIF}

  Fmyds := False;
  Fds := nil;

  inherited Create(Self);

  Clear;

  setDataSet(nil);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
// finds existing tree by ID
constructor TapTree.Create(const AtreeID, AOwnerType: Integer; const LoadOwnerID: Integer = apTreeLoadOIDNone);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.Create') else _udebug := nil;{$ENDIF}

  Create;
  FTreeId := ATreeID;
  FOwnerType := AOwnerType;

  LoadTree(LoadOwnerID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
// finds existing tree by name
constructor TapTree.Create(const treeName: String; const AOwnerType: Integer; const LoadOwnerID: Integer = apTreeLoadOIDNone);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.Create') else _udebug := nil;{$ENDIF}

  Create;
  FOwnerType := AOwnerType;
  FName := treeName; // in case of new tree

  with Fds do begin
    ProviderName := 'pCT_Tree_GetID';
    FetchParams;
    Params.ParamByName('ownertype').asInteger := AOwnerType;
    Params.ParamByName('name').asString := TreeName;
    Open;
    if not eof then begin
      FID := FieldByName('id').asInteger;
      FTreeID := FieldByName('treeid').asInteger;
    end;
    Close;
  end;

  if FID > 0 then LoadTree(LoadOwnerID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTree.Refresh(doOwnData, doSubTree, doSubData: Boolean); // reloads anything _missing_ from DB
  var
    i: Integer;
    n: TapTreeNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.Refresh') else _udebug := nil;{$ENDIF}

  // brute-forcing nodes to reload
  for i := 0 to Fitems.Count - 1 do TapTreeNode(FItems[i]).FLoadedState := apNodeLoadedPart;

  LoadData(-1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
//private. used in constructors only
procedure TapTree.LoadTree(const LoadOwnerID: Integer);
  var
    newnode: TapTreeNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.LoadTree') else _udebug := nil;{$ENDIF}

  try // finally
    Screen.Cursor := crSQLWait;

    with Fds do begin
      Close;
      ProviderName := 'pCT_Tree_Get';
      FetchParams;
      Params.ParamByName('ownertype').asInteger := FOwnerType;
      Params.ParamByName('treeid').asInteger := FTreeID;
      Open;
      if not Load then begin // load myself first
        Close;
        Exit;
      end;
      Next;

      while not eof do begin // and all the tree then
        newnode := TapTreeNode.Create(Self);
        if not newnode.Load then begin // and so on... ;)
          newnode.Parent := nil; // just in case
          newnode.Destroy;
          Exit;
        end;

        Next;
      end;

      Close;
    end;

    if LoadOwnerID <> apTreeLoadOIDNone then LoadData(LoadOwnerID);
    //if Fitems.Count = 0 then raise Exception.Create('CustomTree.Create: error loading tree ID: ' + IntToStr(AtreeID));

  finally
    Screen.Cursor := crDefault;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TapTree.setOwnerType(const AOT: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.setOwnerType') else _udebug := nil;{$ENDIF}

  if not Fnew then raise Exception.Create('Attempt to change Owner Type');
  FOwnerType := AOT;
  setModified(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTree.setTreeID(const ATID: Integer);
  var
    node: TapTreeNode;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.setTreeID') else _udebug := nil;{$ENDIF}

  FTreeID := ATID;

  node := Self;
  while node <> nil do begin
    node.FID := -1;
    node.FNew := True;
    node.FModified := not node.FDeleted;

    for i := 0 to node.DataCount - 1 do begin
      node.Data[i].Fnew := True;
      node.Data[i].FModified := not node.Data[i].FDeleted;
      node.Data[i].FID := -1;
    end;

    node := node.NextNode;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapTree.setDataSet(Ads: TssClientDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.setDataSet') else _udebug := nil;{$ENDIF}

  try // finally
    if (Fds <> nil) and (Fds <> Ads) then begin
      Fds.Close;
      if FmyDS then begin
        if Ads = nil then Exit; // own ds is already set and new own ds requested
        FreeAndNil(FDS);
      end;
    end;

    FmyDS := (Ads = nil);

    if FmyDS then begin
      Fds := TssClientDataSet.Create(nil);
      {$IFNDEF PKG}Fds.RemoteServer := dmData.SConnection;{$ENDIF}
    end
    else Fds := Ads;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TapTree.Save(SaveChildren: Boolean): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.Save') else _udebug := nil;{$ENDIF}

  Result := False;
  Screen.Cursor := crSQLWait;

  try //finally
    if FTreeID = -1 then
      with Fds do try
        ProviderName := 'pCT_Tree_NewID';
        Open;
        FTreeID := FieldByName('treeid').AsInteger;
        Close;

      except
        on e: Exception do begin
          setError(t_err_newid, '', ExceptionMsg(e.Message));
          Exit;
        end;
      end;

    Result := inherited Save(SaveChildren); // try to save myself as root node, etc...

    if Result then begin
      Sweep(True, False);
      BrokenItems := 0;
    end;

  finally
    Screen.Cursor := crDefault;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TapTree.SaveAs(const DeleteOld: Boolean; const NewID: Integer = -1): Boolean; // to make a fresh full copy of tree w data
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.SaveAs') else _udebug := nil;{$ENDIF}

  Result := False;
  Screen.Cursor := crSQLWait;

  try // finally
    if not Fnew then
      with Fds do try
        if DeleteOld then begin
          ProviderName := 'pCT_Node_Del';
          FetchParams;
          Params.ParamByName('nodeid').AsInteger := FID;
          Execute;
        end;

      except
        on e: Exception do begin
          setError(t_err_del, '', ExceptionMsg(e.Message));
          Exit;
        end;
      end;

    TreeID := NewID; // it cleans IDs of all tree and sets nodes as new and modified to make sure they will be saved as new

    Sweep(True, True); // removing FDeleted items

    Result := Save(True);

  finally
    Screen.Cursor := crDefault;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TapTree.LoadData(const AOwnerID: Integer = -1): Boolean;
  const
    tables: array [1..4] of string = ('CTINT', 'CTNUMERIC', 'CTDOUBLE', 'CTTEXT'); // the order must be the same as datatypes

  var
    s: String;
    i: Integer;
    n: TapTreeNode;
    d: TapTreeNodeData;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.LoadData') else _udebug := nil;{$ENDIF}

  Result := True;
  Screen.Cursor := crSQLWait;

  try // finally
    if ChildrenLoadedState(True) = apNodeLoadedFull then Exit; // saving bandwidth

    with FDS do try
      Close;
      ProviderName := 'pSQL';
      FetchMacros;

      for i := 1 to 4 do begin // we cycle thru datatypes and load any of them sequentially
        s := 'select d.CTNodeID, d.ID, d.OwnerID, d.cid, d.data from ' + tables[i]
             + ' d, customtree ct where (ct.ID = d.CTNodeID) and (ct.TreeId = ' + IntToStr(FTreeID) + ')';

        if AOwnerID > -1 then s := s + ' and (d.OwnerID = ' + IntToStr(AOwnerID) + ')'; // -1 = load all

        Macros.ParamByName('sql').AsString := s;
        Open;
        while not eof do begin
          n := Self.NodeByID(FieldByName('CTNodeID').AsInteger);

          if n <> nil then begin
            if AOwnerID = -1
              then n.FLoadedState := apNodeLoadedFull // should be so by the end of procedure
              else if n.FLoadedState <> apNodeLoadedFull then n.FLoadedState := apNodeLoadedPart; // apparent substitute.

            d := n.FindData(FieldByName('OwnerID').AsInteger, FieldByName('CID').AsInteger, True); // autocreating if not exist yet

            if d.FNew then begin // not overwriting existing ones. new and deleted will be replaced from DB
              d.FdataType := i;
              d.FValue := FieldByName('data').AsVariant;
              d.FID := FieldByName('ID').asInteger;
              d.FCID := FieldByName('CID').asInteger;
              d.FNew := False;
            end;
          end;

          Next;
        end; // while not eof

        Close;
      end; // for i := 1 to 4

      if AOwnerID = -1
        then FLoadedState := apNodeLoadedFull
        else FLoadedState := apNodeLoadedPart;

    except
      on e: Exception do begin
        Close;
        setError(t_err_load, '', ExceptionMsg(e.Message));
        Result := False;
      end;
    end;

  finally
    Screen.Cursor := crDefault;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TapTree.SaveData(const AOwnerID: Integer = -1; const SaveChildren: Boolean = False): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.SaveData') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  Result := inherited SaveData(AOwnerID, SaveChildren);

  if Result then Sweep(False, True);

  Screen.Cursor := crDefault;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTree.FirstNode: TapTreeNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.FirstNode') else _udebug := nil;{$ENDIF}

  if FItems.Count > 0
    then Result := inherited FirstNode
    else Result := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//----------------------------------------------------------------------------------------------
const
  t_ser_ver = 1; // tree serializator version

//==============================================================================================
function TapTree.Serialize(var SO: TSerializator): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.Serialize(SO)') else _udebug := nil;{$ENDIF}

  Result := False;

  SO.Int := t_ser_ver;

  SO.Int := FTreeID;
  SO.Int := FOwnerType;

  Result := inherited Serialize(SO);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTree.deSerialize(const SO: TSerializator): Boolean;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.deSerialize(SO)') else _udebug := nil;{$ENDIF}

  Result := False;

  FTreeID := SO.Int;
  if SO.Error > 0 then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if FtreeID <> t_ser_ver then begin // versions mismatch
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FTreeID := SO.Int;
  if SO.Error > 0 then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FOwnerType := SO.Int;
  if SO.Error > 0 then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if not inherited deSerialize(SO, Self) then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  Result := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTree.Serialize(var Stream: TStream): Boolean;
  var
    ser: TSerializator;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.Serialize(Stream)') else _udebug := nil;{$ENDIF}

  ser := Tserializator.Create(Stream);
  Result := Serialize(ser);
  ser.Free;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapTree.deSerialize(const Stream: TStream): Boolean;
  var
    ser: TSerializator;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapTree.deSerialize(Stream)') else _udebug := nil;{$ENDIF}

  ser := Tserializator.Create(Stream);
  Result := deSerialize(ser);
  ser.Free;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
//==============================================================================================
//=== TapWoods =================================================================================
//==============================================================================================
//==============================================================================================
constructor TapWoods.Create(const AParent: TMetaClass);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapWoods.Create') else _udebug := nil;{$ENDIF}

  inherited;
  Fdata := TList.Create;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TapWoods.Destroy;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapWoods.Destroy') else _udebug := nil;{$ENDIF}

  Clear;
  FData.Destroy;
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapWoods.Clear;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapWoods.Clear') else _udebug := nil;{$ENDIF}

  for i := 0 to FItems.Count - 1 do TapTree(FItems[i]).Destroy;
  FItems.Clear;
  FData.Clear;
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapWoods.getErrorText(const Index: Integer): String;
begin
  if (Index < 100) or (Index > High(woodsErrorTexts))
    then Result := inherited getErrorText(Index)
    else Result := woodsErrorTexts[Index];
end;

//==============================================================================================
function TapWoods.byID(const AID: Integer): TapTree;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapWoods.byID') else _udebug := nil;{$ENDIF}

  for i := 0 to FItems.Count - 1 do
    if TapTree(FItems[i]).treeID = AID then begin
      Result := FItems[i];
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;
  Result := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapWoods.byName(const Aname: String): TapTree;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapWoods.byName') else _udebug := nil;{$ENDIF}

  i := Index(Aname);
  if i = -1
    then Result := nil
    else Result := FItems[i];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapWoods.LoadByNames(const AOwnerType: Integer; Alist: array of String): Integer; // load many trees by names
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapWoods.LoadByNames') else _udebug := nil;{$ENDIF}

  Result := 0;
  for i := 0 to High(Alist) do begin
    if nil <> byName(Alist[i]) then Continue; // already loaded
    FItems.add(TapTree.Create(Alist[i], AOwnerType));
    FData.add(nil);
    inc(Result);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapWoods.LoadByIDs(const AOwnerType: Integer; Alist: array of Integer): Integer; // load many trees by ids
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapWoods.LoadByIDs') else _udebug := nil;{$ENDIF}

  Result := 0;
  for i := 0 to High(Alist) do begin
    if nil <> byID(Alist[i]) then Continue; // already loaded
    FItems.add(TapTree.Create(Alist[i], AOwnerType));
    FData.add(nil);
    inc(Result);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapWoods.getListData(const idx: Integer): Pointer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapWoods.getListData') else _udebug := nil;{$ENDIF}

  Result := FData[idx];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapWoods.setListData(const idx: Integer; const AValue: Pointer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapWoods.setListData') else _udebug := nil;{$ENDIF}

  FData[idx] := AValue;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapWoods.Index(const AName: String): Integer; // returns index of tree in list
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapWoods.Index') else _udebug := nil;{$ENDIF}

  for i := 0 to FItems.Count - 1 do
    if AnsiLowerCase(TapTree(FItems[i]).Name) = AnsiLowerCase(AName) then begin
      Result := i;
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;
  Result := -1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapWoods.getDataOf(const AName: String): Pointer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapWoods.getDataOf') else _udebug := nil;{$ENDIF}

  Result := FData[Index(AName)];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapWoods.setDataOf(const AName: String; const p: Pointer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapWoods.setDataOf') else _udebug := nil;{$ENDIF}

  FData[Index(AName)] := p;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapWoods.getItems(const idx: Integer): TapTree;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapWoods.getItems') else _udebug := nil;{$ENDIF}

  Result := FItems[idx];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TapWoods.Add(const Aname: String; const AOwnerType: Integer; const LoadOwnerID: Integer = apTreeLoadOIDNone): TapTree; {overload;} // add/load tree by name
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapWoods.Add') else _udebug := nil;{$ENDIF}

  Result := byName(AName);

  if Result = nil then begin
    FItems.Add(TapTree.Create(AName, AOwnerType, LoadOwnerID));
    Result := FItems.Last;
  end
  else if LoadOwnerID <> apTreeLoadOIDNone then Result.LoadData(LoadOwnerID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapWoods.Delete(const Aname: String; const DestroyTree: Boolean = True);
  var
    t: TapTree;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapWoods.Delete(Name)') else _udebug := nil;{$ENDIF}

  t := byName(AName);
  if t = nil then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if DestroyTree then t.Destroy;

  FItems[FItems.IndexOf(t)] := nil;
  FItems.Pack;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TapWoods.Delete(const ATreeId: Integer; const DestroyTree: Boolean = True);
  var
    t: TapTree;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TapWoods.Delete(ID)') else _udebug := nil;{$ENDIF}

  t := byID(ATreeID);
  if t = nil then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if DestroyTree then t.Destroy;

  FItems[FItems.IndexOf(t)] := nil;
  FItems.Pack;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('apTree', @Debugging, DEBUG_group_ID);

  Debugging := False;
  {$ENDIF}

finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.

