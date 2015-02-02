{$I ok_sklad.inc}
unit MetaProduct;

interface

uses
  ssMemDS, Classes, Types,
  MetaClass, MetaImage, MetaTax, MetaPrice, apTree, DB, DBClient,
  prFun;

const
  // status codes
  mpscOK = 0;
  mpscLoadEOF = 1;
  mpscNoCat = 2;
  mpscLoadError = 3;
  mpscXMLnoWS = 4;

type
  //------------------------------------------------------------------------------------
  TMetaProdNameMap = class // single NameMap property of product
    protected
      FType: TFieldType;
      FIntName: String; // internal field name
      FExtName: String; // external (class user/DB) field name
      FXMLName: String; // XML export/import field name

    public
      property FieldType: TFieldType read FType write FType;
      property IntName: String read FIntName write FIntName;
      property ExtName: String read FExtName write FExtName;
      property XMLName: String read FXMLName write FXMLName;
  end;

  //------------------------------------------------------------------------------------
  TMetaProdNameMaps = class
    protected
      FFields: TList; // TMetaProdNameMap list

      function GetCount: Integer;
      function GetField(const Index: Integer): TMetaProdNameMap;
      function getExtName(const s: String): String;
      function getXMLName(const s: String): String;

    public
      constructor Create;
      destructor Destroy; override;

      procedure Add(const AType: TFieldType; AIntName: String; AExtName: String = ''; AXMLName: String = '');
      procedure Delete(const AIndex: Integer);

      property Count: Integer read GetCount;
      property Items[const Index: Integer]: TMetaProdNameMap read GetField; default;
      property ExtName[const s: String]: String read getExtName;
      property XMLName[const s: String]: String read getXMLName;
  end;

  //------------------------------------------------------------------------------------
  //------------------------------------------------------------------------------------
  //------------------------------------------------------------------------------------
  TMetaProdGroup = class(TMetaClass)
    protected
    public
  end;

  //------------------------------------------------------------------------------------
  TMetaProdGroups = class(TMetaClassList)
    protected
    public
      function getItem(const idx: Integer): TMetaProdGroup;

      property Items[const idx: Integer]: TMetaProdGroup read getItem; default;
  end;

  //------------------------------------------------------------------------------------
  //------------------------------------------------------------------------------------
  //------------------------------------------------------------------------------------
  TMetaProdRemainsPos = class(TMetaClass)
    protected
      FWID: Integer;
      FRemain, FReserve: Double;

    public
  end;

  //------------------------------------------------------------------------------------
  TMetaProdRemains = class(TMetaClassList)
    protected
    public
      function getItem(const idx: Integer): TMetaProdRemainsPos;
      function getTotalRemain: Double;

      property Items[const idx: Integer]: TMetaProdRemainsPos read getItem; default;
      property TotalRemain: Double read getTotalRemain;
  end;

  //------------------------------------------------------------------------------------
  //------------------------------------------------------------------------------------
  //------------------------------------------------------------------------------------
  TMetaProduct = class(TMetaClass)
    protected
      // taken from Materials
      // MATID      INTEGER NOT NULL, in MetaClass
      // NAME       VARCHAR(255) COLLATE PXW_CYRL,, in MetaClass
      FModel: String;// ARTIKUL    VARCHAR(255) COLLATE PXW_CYRL
      FTypeID: Integer; // DMAK's

      FDefault: Boolean;// DEF        INTEGER NOT NULL,
      FDeleted: Boolean;// DELETED    INTEGER NOT NULL,
      FArchived: Boolean; // ARCHIVED   INTEGER,

      FbySerial: Boolean;// SERIALS    INTEGER,
      //FSerialNumber: String;
      FBarcode: String;// BARCODE    VARCHAR(64),
      FProducer: String;// PRODUCER   VARCHAR(255),

      FMeasureID: Integer;// MID        INTEGER NOT NULL,
      FNotes: String;// NOTES      VARCHAR(255),
      FLabelDescription: String;

      FWeight: Double;// WEIGHT     NUMERIC(15,8),
      FSize: Double;// MSIZE      NUMERIC(15,8),

      FMinReserve: Double; // MINRESERV  NUMERIC(15,8),
      FDemandCategory: Integer;// DEMANDCAT  INTEGER,

      FCF1, FCF2, FCF3, FCF4, FCF5: Integer; // Quick-access custom fields

      {esoteric heritage}
      FWID: Integer; {Warehouse ID}// WID        INTEGER,
      FNUM: Integer; {esoteric products-in-group counter}// NUM        INTEGER NOT NULL,
      FCID: Integer; {simply unknown yet}// CID        INTEGER,

      //-------------------
      FGroups: TMetaProdGroups; {group Objects that prod belongs to} // GRPID      INTEGER,
      FTaxes: TMetaTaxList; // NDS        NUMERIC(15,8),
      FPrices: TMetaPricesList; // list of TPrice objects
      FImages: TList; // list of picture objects
      FRemains: TMetaProdRemains; // list of remains per warehouse

      FFieldNames: TMetaProdNameMaps;
      FTrees: TapWoods; // additional trees of props collection

      FErrNo: Integer;
      FStatusMessage: String;

      // IDs of subcomponents to export
      FWSToExport: Integer;

      procedure setStatus(const EN: Integer = 0);

      // prop support functions
      procedure propSetID(const AID: Integer);
      procedure propSetModel(const AModel: String);
      procedure propSetTypeId(const ATypeID: Integer);

      procedure propSetDefault(const AisDefault: Boolean);
      procedure propSetDeleted(const AisDeleted: Boolean);
      procedure propSetArchived(const AisArchived: Boolean);

      procedure propSetBySerial(const AbySerial: Boolean);
      procedure propSetBarcode(const ABarcode: String);
      procedure propSetProducer(const AProducer: String);

      procedure propSetMeasureID(const AMeasureID: Integer);
      procedure propSetNotes(const ANotes: String);
      procedure propSetLabelDescription(const ALabelDescription: String);

      procedure propSetWeight(const AWeight: Double);
      procedure propSetSize(const ASize: Double);

      procedure propSetMinReserve(const AMinReserve: Double);
      procedure propSetDemandCategory(const ADemandCategory: Integer);

      function propGetCF(const idx: Integer): Integer;
      procedure propSetCF(const idx, ACF: Integer);

    public
      constructor Create(const AParent: TMetaClass); overload;// just inits
      constructor Create(const AParent: TMetaClass; const ds: TClientDataSet; const AID: Integer); overload; // loads data also
      destructor Destroy; override;
      procedure Clear;

      function getImage(const idx: Integer): TMetaImage;
      function getImagesCount: Integer;
      function LoadImages: Integer;
      function LoadData(const ds: TClientDataSet; const AID: Integer; const loadTrees: boolean = False; const doLoadImages: boolean = False): Boolean;

      // common XML export/import
      function ExportXML(var AXML: TStringStream; const closeTag: Boolean = True; const images: Boolean = False): Boolean;
      function ImportXML(const AXML: TStream): Boolean;

      // Web-specific XML export
      function XMLForWeb(out stream: TStringStream; const WSID: Integer; const ProdID: Integer = 0): Boolean;

      //--------------------------------------------------------
      property Trees: TapWoods read FTrees;

      property ID: Integer read FID write propSetID;
      property Model: String read FModel write propSetModel;
      property TypeID: Integer read FTypeID write propSetTypeId;

      property isDefault: Boolean read FDefault write propSetDefault;
      property isDeleted: Boolean read FDeleted write propSetDeleted;
      property isArchived: Boolean read FArchived write propSetArchived;
      property isModified: Boolean read FModified;
      property isNew: Boolean read FNew;

      property bySerial: Boolean read FbySerial write propSetBySerial;
      property Barcode: String read FBarcode write propSetBarcode;
      property Producer: String read FProducer write propSetProducer;

      property MeasureID: Integer read FMeasureID write propSetMeasureID;
      property Notes: String read FNotes write propSetNotes;
      property LabelDescription: String read FLabelDescription write propSetLabelDescription;

      property Weight: Double read FWeight write propSetWeight;
      property Size: Double read FSize write propSetSize;

      property MinReserve: Double read FMinReserve write propSetMinReserve;
      property DemandCategory: Integer read FDemandCategory write propSetDemandCategory;

      property CF[const idx: Integer]: Integer read propGetCF write propSetCF; // Quick-access custom fields

      property Groups: TMetaProdGroups read FGroups;
      property Taxes: TMetaTaxList read FTaxes;
      property Images[const idx: Integer]: TMetaImage read getImage;
      property ImagesCount: Integer read getImagesCount;

      property Remains: TMetaProdRemains read FRemains;

      property FieldNames: TMetaProdNameMaps read FFieldNames;

      property ErrNo: Integer read FErrNo;
      property StatusMessage: String read FStatusMessage;

      // pre-export subcomponents IDs settings
      property WebShopToExport: Integer read FWSToExport write FWSToExport;
  end; // TMetaPos

  // (re)generates tree w product's webShop-related properties
  procedure MakeProductTree(prodTree, langTree: TapTree);
  function FixGroupsTree(var tree, langTree: TapTree): Integer;
  function FixGroupNode(node: TapTreeNode; FixData: boolean; const langTree: TapTree): Integer;

  function DeleteProduct(const AID: Integer): Boolean;

//============================================================================================
//============================================================================================
//============================================================================================
implementation

uses
  SysUtils, DateUtils,
  prConst, udebug,
  fMessageDlg, ClientData;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

//==============================================================================================
// (re)generates tree w product's webShop-related properties
procedure MakeProductTree(prodTree, langTree: TapTree);
  var
    i: Integer;
    pnode, rnode: TapTreeNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaProduct.MakeProductTree') else _udebug := nil;{$ENDIF}

  // creating missing nodes in tree. root->short_lang_name->props_tree_for_this_lang
  prodTree.FindFirst('Post', False, True); // post-to-web state

  rnode := prodTree.FindFirst('Marketing', False, True);
    rnode.FindFirst('PriceCategory', False, True);
    rnode.FindFirst('isSpecial', False, True);   // "Featured product" flag
    rnode.FindFirst('RetailPrice', False, True); // Fake retail price to show the fake save/discount

  rnode := prodTree.FindFirst('CustomBuilds', False, True); // a branch for customized versions of client
    {$IFDEF GOLD}
    rnode.FindFirst('Gold', False, True);
    {$ENDIF}

  for i := 0 to langTree.Count - 1 do begin
    //if nil = langTree.Items[i].Items[0] then Continue; // that lang was not even initialized in webStore editor

    rnode := prodTree.FindFirst(langTree.Items[i].Items[0].Name, False, True);

    rnode.FindFirst('Alias', False, True).FindFirst('Customalias', False, True);

    pnode := rnode.FindFirst('Main', False, True);
      pnode.FindFirst('Name', False, True);
      pnode.FindFirst('Sdescr', False, True);  // short description
      pnode.FindFirst('Ldescr', False, True);  // long description
      pnode.FindFirst('Details', False, True); // detailed info or accessories, etc...

    pnode := rnode.FindFirst('Meta', False, True); // META tags
      pnode.FindFirst('Mtitle', False, True);
      pnode.FindFirst('Mkeyw', False, True);
      pnode.FindFirst('Mdescr', False, True);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
// tries to check and fix if necessary the Groups tree node's structure and data
// returns bitmask:
// 0 - when no errors were detected
// 1 - node mortally damaged and should be erased
// 2 - node internals fixed
// 4 - node data fixed or added missing positions
function FixGroupNode(node: TapTreeNode; FixData: boolean; const langTree: TapTree): Integer;
  var
    i, nType: Integer;
    s: String;
    ln: TapTreeNode;

  //-------------------------------------------------------------------------------------------------------
  procedure FixIntData(const node: TapTreeNode; const cid, val: Integer);
  begin
    if (Node.FindData(0, cid) = nil) or (Node.FindData(0, cid).dataType <> apTreeDTInt) then begin
      node.FindData(0, cid, True).asInteger := val;
      Result := Result or 4;
    end;
  end;

  //-------------------------------------------------------------------------------------------------------
  procedure FixTxtData(const node: TapTreeNode; const cid: Integer; const val: String);
  begin
    if (Node.FindData(0, cid) = nil) or (Node.FindData(0, cid).dataType <> apTreeDTTxt) then begin
      node.FindData(0, cid, True).asString := val;
      Result := Result or 4;
    end;
  end;

  //-------------------------------------------------------------------------------------------------------
  procedure ChopData(const node: TapTreeNode; const MaxCID: Integer);
    var
      i: Integer;
  begin
    node.Sweep(False, True); //strip off nil data pointers

    for i := 0 to node.Datacount - 1 do begin
      if (node.Data[i].CID < 0) or (node.Data[i].CID > MaxCID)
         or (node.FindData(node.Data[i].OwnerID, node.Data[i].CID) <> node.Data[i]) // duplicate
      then begin
        node.Data[i].Delete;
        Result := Result or 4;
        Continue;
      end;
    end;
  end; // procedure ChopData

  //-------------------------------------------------------------------------------------------------------
  procedure FixLangNode(const ln: TapTreeNode; const langID: Integer);
    var i : Integer;
  begin
    ChopData(ln, 8);
    ln.Pos := -LangID; // remember lang ID. minus is for lang nodes to come before subcats

    FixIntData(ln, 0, 1); // type-lang
    ln.FindData(0, 0).asInteger := 1;
    FixTxtData(ln, 1, ''); // <Description>
    FixTxtData(ln, 2, ln.parent.Name); // <Name>
    FixTxtData(ln, 3, ''); // <MetaCharset>
    FixTxtData(ln, 4, ''); // <MetaKeywords>
    FixTxtData(ln, 5, ''); // <MetaTitle>
    FixTxtData(ln, 6, ''); // <MetaDescr>
    FixIntData(ln, 7, 0); // custom Alias
    FixTxtData(ln, 8, ''); // <Alias>
  end;

begin
  Result := 0;

  if (node.isDeleted) or (node.Parent = nil) then Exit;

  if langTree.FindFirst(node.Name, False) = nil
    then nType := 0 // not in languages. probably master-type
    else nType := 1;

  // checking type sanity
  if (Node.FindData(0, 0) = nil) or (Node.FindData(0, 0).dataType <> apTreeDTInt) or not (Node.FindData(0, 0).asInteger in [0, 1])
  then begin
    if ntype = 0 then begin  // checking for signs of master node
      if (Node.FindData(0, 1) = nil) or (Node.FindData(0, 1).dataType <> apTreeDTTxt)    // description text
         or (Node.FindData(0, 2) = nil) or (Node.FindData(0, 2).dataType <> apTreeDTInt) // position index
      then begin
        Result := 1;// nothing we can do.
        Exit;
      end;

      node.pos := 0;
    end // if nType = 0
    else begin // check for lang node
      if (Node.DataCount < 4) // either master node or too much data was lost. better to kill it.
         or (Node.FindData(0, 2) = nil) or (Node.FindData(0, 2).dataType <> apTreeDTTxt) // here should be lang-specific name text
      then begin
        Result := 1;// nothing we can do also.
        Exit;
      end;
    end;
  end; // if Node.FindData(0, 0) = nil

  if nType = 1 then begin // well it's lang node very probably
    FixLangNode(node, langTree.FindFirst(node.Name, False).NodeData);
    Exit;
  end;

  // here is master node
  ChopData(Node, 2);
  FixIntData(node, 0, 0); // just in case
  node.FindData(0, 0).asInteger := 0;
  FixTxtData(node, 1, ''); // <Description>
  FixIntData(node, 2, -1); // <Position>

  // adding stubs for available languages
  for i := 0 to langTree.Count - 1 do begin
    ln := node.FindFirst(langTree[i].Name, False);

    if langTree[i].Data[0].asInteger = 0 then begin // unchecked. this language is not availeble here
      if ln <> nil then begin
        ln.Delete;
        Result := Result or 4;
      end;
      Continue;
    end;

    if ln = nil then begin
      ln := node.AddChild(langTree[i].Name);
      Result := Result or 4;
    end;

    FixLangNode(ln, langTree[i].NodeData);
  end;
end;

//==============================================================================================
function FixGroupsTree(var tree, langTree: TapTree): Integer;
  var
    node: TapTreeNode;
    errcnt,r: Integer;
begin
  errcnt := 0;
  node := Tree.FirstNode;

  while (node <> Tree) and (node <> nil) do begin
    r := FixGroupNode(node, True, langTree);
    tree.BrokenItems := tree.BrokenItems and r;
    
    case r of
      0: ; // nothing happens ;)

      1: begin // node is dead
        node.Delete;
        inc(errcnt);
      end;

      else begin // something was fixed
        inc(errcnt);
      end;
    end; // case

    node := node.NextNode;
  end;

  Result := errcnt;
end;

//==============================================================================================
function DeleteProduct(const AID: Integer): Boolean;
begin
   Result := False;

   with newDataSet do try
     ProviderName := 'pMat_Del';
     FetchParams;

     TrStart;

     Params.ParamByName('matid').AsInteger := AID;
     Execute;

     // trees
     ProviderName := 'pCT_Data_DelAll';
     FetchParams;
     Params.ParamByName('treeid').asInteger    := -1;
     Params.ParamByName('nodeid').asInteger    := -1;
     Params.ParamByName('ownerid').asInteger   := AID;
     Params.ParamByName('ownertype').asInteger := cfOwnerTypeProduct;
     Params.ParamByName('cid').asInteger       := -1;
     Execute;

     // images
     ProviderName := 'Blobs_Del';
     FetchMacros;
     Macros.ParamByName('w').asString := 'ownerid=' + IntTostr(AID) + ' and ownertype=' + IntToStr(cfOwnerTypeProduct);
     Execute;

     // todo: should remove prod from websites even if it is not marked for upload (maybe it was before)
     
     Result := TrCommit;

   except
     on e:exception do begin
       TrRollback;
       ssMessageDlg(rs('Common', 'NoDelete') + e.Message, ssmtError, [ssmbOk]);
       Exit;
     end;
   end;
end;

//==============================================================================================
//==============================================================================================
//== TMetaProdNameMaps ============================================================================
//==============================================================================================
//==============================================================================================
constructor TMetaProdNameMaps.Create;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaProdNameMaps.Create') else _udebug := nil;{$ENDIF}

  FFields := TList.Create;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TMetaProdNameMaps.Destroy;
  var
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    i: integer;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaProdNameMaps.Destroy') else _udebug := nil;{$ENDIF}

  for i := 0 to FFields.Count - 1 do TMetaProdNameMap(FFields[i]).Free;
  FFields.Free;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  inherited;
end;

//==============================================================================================
procedure TMetaProdNameMaps.Delete(const AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaProdNameMaps.Delete') else _udebug := nil;{$ENDIF}

  if (Aindex < 0) or (AIndex >= FFields.Count) then Exit;

  TMetaProdNameMap(FFields[AIndex]).Free;
  FFields.Delete(Aindex);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TMetaProdNameMaps.GetCount: Integer;
begin
  Result := FFields.Count;
end;

//==============================================================================================
function TMetaProdNameMaps.GetField(const Index: Integer): TMetaProdNameMap;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaProdNameMaps.GetField') else _udebug := nil;{$ENDIF}

  if (Index < 0) or (Index >= FFields.Count)
    then Result := nil
    else Result := TMetaProdNameMap(FFields[Index]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TMetaProdNameMaps.Add(const AType: TFieldType; AIntName: String; AExtName: String = ''; AXMLName: String = '');
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaProdNameMaps.Add') else _udebug := nil;{$ENDIF}

  FFields.Add(TMetaProdNameMap.Create);
  with TMetaProdNameMap(FFields.Last) do begin
    FieldType := AType;
    FIntName := AIntName;

    if AExtName = ''
      then ExtName := AIntName
      else ExtName := AExtName;

    if AXMLName = ''
      then XMLName := AIntName
      else XMLName := AXMLName;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TMetaProdNameMaps.getExtName(const s: String): String;
  var
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    i: Integer;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaProdNameMaps.getExtName') else _udebug := nil;{$ENDIF}

  for i := 0 to FFields.Count - 1 do
    if AnsiLowerCase(TMetaProdNameMap(FFields[i]).IntName) = AnsiLowerCase(s) then begin
      Result := TMetaProdNameMap(FFields[i]).ExtName;
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

  Result := '';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TMetaProdNameMaps.getXMLName(const s: String): String;
  var
    i: Integer;
begin
  for i := 0 to FFields.Count - 1 do
    if AnsiLowerCase(TMetaProdNameMap(FFields[i]).IntName) = AnsiLowerCase(s) then begin
      Result := TMetaProdNameMap(FFields[i]).XMLName;
      Exit;
    end;

  Result := '';
end;

//==============================================================================================
//==============================================================================================
//= TMetaProdGroups ============================================================================
//==============================================================================================
//==============================================================================================
function TMetaProdGroups.getItem(const idx: Integer): TMetaProdGroup;
begin
  Result := TMetaProdGroup(FItems[idx]);
end;

//==============================================================================================
//==============================================================================================
//= TMetaProdRemains ===========================================================================
//==============================================================================================
//==============================================================================================
function TMetaProdRemains.getItem(const idx: Integer): TMetaProdRemainsPos;
begin
  Result := TMetaProdRemainsPos(FItems[idx]);
end;

//==============================================================================================
function TMetaProdRemains.getTotalRemain: Double;
  var
    i: Integer;
begin
  Result := 0.0;

  for i := 0 to Count - 1 do
    Result := Result + Items[i].FRemain;
end;

//==============================================================================================
//==============================================================================================
//= TMetaProduct ===============================================================================
//==============================================================================================
//==============================================================================================
procedure TMetaProduct.setStatus(const EN: Integer = 0);
begin
  FErrNo := EN;
  if MetaLangManager <> nil
    then FStatusMessage := rs('MetaProduct', 'Status_' + IntToStr(FErrNo))
    else FStatusMessage := 'ErrNo: ' + IntToStr(FerrNo);
end;

//==============================================================================================
procedure TMetaProduct.propSetID(const AID: Integer);
begin
  if AID = FID then Exit;

  inherited;
  // we're not asking questions as this is the easiest way to duplicate products
  FNew := True;
end;

//==============================================================================================
procedure TMetaProduct.propSetModel(const AModel: String);
begin
  if FModel = Amodel then Exit;

  FModel := Amodel;
  setModified(True);
end;

//==============================================================================================
procedure TMetaProduct.propSetTypeId(const ATypeID: Integer);
begin
  if FTypeID = ATypeId then Exit;

  FTypeID := ATypeId;
  setModified(True);
end;

//==============================================================================================
procedure TMetaProduct.propSetDefault(const AisDefault: Boolean);
begin
  if Fdefault = AisDefault then Exit;

  Fdefault := AisDefault;
  setModified(True);
end;

//==============================================================================================
procedure TMetaProduct.propSetDeleted(const AisDeleted: Boolean);
begin
  if FDeleted = AisDeleted then Exit;

  FDeleted := AisDeleted;
  setModified(True);
end;

//==============================================================================================
procedure TMetaProduct.propSetArchived(const AisArchived: Boolean);
begin
  if FArchived = AisArchived then Exit;

  FArchived := AisArchived;
  setModified(True);
end;

//==============================================================================================
procedure TMetaProduct.propSetBySerial(const AbySerial: Boolean);
begin
  if FbySerial = AbySerial then Exit;

  FbySerial := AbySerial;
  setModified(True);
end;

//==============================================================================================
procedure TMetaProduct.propSetBarcode(const ABarcode: String);
begin
  if FBarcode = ABarcode then Exit;

  FBarcode := ABarcode;
  setModified(True);
end;

//==============================================================================================
procedure TMetaProduct.propSetProducer(const AProducer: String);
begin
  if FProducer = AProducer then Exit;

  FProducer := AProducer;
  setModified(True);
end;

//==============================================================================================
procedure TMetaProduct.propSetMeasureID(const AMeasureID: Integer);
begin
  if FMeasureID = AMeasureID then Exit;

  FMeasureID := AMeasureID;
  setModified(True);
end;

//==============================================================================================
procedure TMetaProduct.propSetNotes(const ANotes: String);
begin
  if trim(FNotes) = trim(Anotes) then Exit;

  FNotes := Anotes;
  setModified(True);
end;

//==============================================================================================
procedure TMetaProduct.propSetLabelDescription(const ALabelDescription: String);
begin
  if trim(FLabelDescription) = trim(ALabelDescription) then Exit;

  FLabelDescription := ALabelDescription;
  setModified(True);
end;

//==============================================================================================
procedure TMetaProduct.propSetWeight(const AWeight: Double);
begin
  if FWeight = Aweight then Exit;

  FWeight := Aweight;
  setModified(True);
end;

//==============================================================================================
procedure TMetaProduct.propSetSize(const ASize: Double);
begin
  if FSize = ASize then Exit;

  FSize := ASize;
  setModified(True);
end;

//==============================================================================================
procedure TMetaProduct.propSetMinReserve(const AMinReserve: Double);
begin
  if FMinReserve = AMinReserve then Exit;

  FMinReserve := AMinReserve;
  setModified(True);
end;

//==============================================================================================
procedure TMetaProduct.propSetDemandCategory(const ADemandCategory: Integer);
begin
  if FDemandCategory = ADemandCategory then Exit;

  FDemandCategory := ADemandCategory;
  setModified(True);
end;

//==============================================================================================
function TMetaProduct.propGetCF(const idx: Integer): Integer;
begin
  case idx of
    1: Result := FCF1;
    2: Result := FCF2;
    3: Result := FCF3;
    4: Result := FCF4;
    5: Result := FCF5;
    else begin
      Result := -1;
      Exit;
    end;
  end;
  setModified(True);
end;

//==============================================================================================
procedure TMetaProduct.propSetCF(const idx, ACF: Integer);
begin
  case idx of
    1:
      if FCF1 = ACF
        then Exit
        else FCF1 := ACF;
    2:
      if FCF2 = ACF
        then Exit
        else FCF2 := ACF;

    3:
      if FCF3 = ACF
        then Exit
        else FCF3 := ACF;
    4:
      if FCF4 = ACF
        then Exit
        else FCF4 := ACF;
    5:
      if FCF5 = ACF
        then Exit
        else FCF5 := ACF;

    else Exit;
  end;

  setModified(True);
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
procedure TMetaProduct.Clear;
  var
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    i: Integer;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaProduct.Clear') else _udebug := nil;{$ENDIF}

  inherited;

  setStatus;
  Ftrees.Clear;

  FTaxes.Clear;
  FPrices.Clear;

  FRemains.Clear;

  FGroups.Clear;

  for i := 0 to FImages.Count - 1 do TMetaImage(FImages[i]).Free;
  FImages.Clear;

  FTrees.Clear;

  FModel  := '';
  FTypeID := -1;

  FDefault  := False;
  FDeleted  := False;
  FArchived := False;
  FbySerial := False;

  FBarcode  := '';
  FProducer := '';
  FNotes := '';
  FLabelDescription := '';

  FWeight := 0.0;
  FSize   := 0.0;
  FMinReserve := 0.0;

  FDemandCategory := -1;
  FMeasureID := -1;

  FCF1 := -1;
  FCF2 := -1;
  FCF3 := -1;
  FCF4 := -1;
  FCF5 := -1;

  FWID := -1;
  FNUM := -1;
  FCID := -1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
constructor TMetaProduct.Create(const AParent: TMetaClass);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaProduct.Create;') else _udebug := nil;{$ENDIF}

  FFieldNames := TMetaProdNameMaps.Create;
  Ftrees := TapWoods.Create(nil);

  FTaxes := TMetaTaxList.Create(Self);
  FPrices := TMetaPricesList.Create(Self);

  FGroups := TMetaProdGroups.Create(Self);
  FImages := TList.Create;

  FRemains := TMetaProdRemains.Create(Self);

  // defining the internal field names
  with FFieldNames do begin
    Add(ftInteger, 'ID', 'MatID', '');
    Add(ftString,  'Name', '', '');
    Add(ftString,  'Model', 'Artikul', '');
    Add(ftInteger, 'TypeID', '', '');

    Add(ftBoolean, 'Default', 'Def', '');
    Add(ftBoolean, 'Deleted', '', '');
    Add(ftBoolean, 'Archived', '', '');

    Add(ftString,  'bySerial', 'Serials', '');
    Add(ftString,  'Barcode', '', '');
    Add(ftString,  'Producer', '', '');

    Add(ftInteger, 'MeasureID', 'MID', '');
    Add(ftString,  'LabelDescription', 'LabelDescr', '');
    Add(ftString,  'Notes', '', '');

    Add(ftFloat,   'Weight', '', '');
    Add(ftFloat,   'Size', 'MSize', '');

    Add(ftInteger, 'Group', 'GrpID', '');
    Add(ftFloat,   'MinReserve', 'MinReserv', '');
    Add(ftInteger, 'DemandCategory', 'DemandCat', '');

    Add(ftFloat,   'Tax', 'NDS', '');

    Add(ftInteger, 'CF1', '', '');
    Add(ftInteger, 'CF2', '', '');
    Add(ftInteger, 'CF3', '', '');
    Add(ftInteger, 'CF4', '', '');
    Add(ftInteger, 'CF5', '', '');
    Add(ftInteger, 'DateAdded', '', '');
    Add(ftInteger, 'DateModified', '', '');

    {esoteric heritage}
    Add(ftInteger, 'WID', '', '');
    Add(ftInteger, 'NUM', '', '');
    Add(ftInteger, 'CID', '', '');
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
constructor TMetaProduct.Create(const AParent: TMetaClass; const ds: TClientDataSet; const AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaProduct.Create(DS)') else _udebug := nil;{$ENDIF}

  Create(AParent);
  LoadData(ds, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TMetaProduct.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaProduct.Free') else _udebug := nil;{$ENDIF}

  Clear;

  FFieldNames.Free;
  Ftrees.Destroy;

  FTaxes.Free;
  FPrices.Free;

  FGroups.Free;
  FImages.Free;

  FRemains.Free;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TMetaProduct.getImagesCount: Integer;
begin
  Result := FImages.Count;
end;

//==============================================================================================
function TMetaProduct.getImage(const idx: Integer): TMetaImage;
begin
  if (idx < 0) or (idx > FImages.Count)
    then Result := nil
    else Result := FImages[idx];
end;

//==============================================================================================
function TMetaProduct.LoadImages: Integer;
  var
    n: Integer;
    img: TMetaImage;
    ds: TClientDataSet;
begin
  if FImages.Count > 0 then begin
    for n := 0 to FImages.Count - 1 do TMetaImage(FImages[n]).Free;
    FImages.Count := 0;
  end;

  n := 0;
  ds := newDataSet;
  with ds do begin
    repeat
      try
        img := TMetaImage.Create(cfOwnerTypeProduct, FID, ds);

        if img.isEmpty
          then img.Free
          else begin
            FImages.add(img);
            inc(n);
          end;

      except
      end;
    until eof;

    Close;
    Free;
  end;

  Result := n;
end;

//==============================================================================================
function TMetaProduct.LoadData(const ds: TClientDataSet; const AID: Integer; const loadTrees: boolean = False; const doLoadImages: boolean = False): Boolean;
  var
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    tax: TMetaTax;
    grp: TMetaProdGroup;
    remain: TMetaProdRemainsPos;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaProduct.LoadData(AID: ' + IntToStr(AID) + ', LoadTrees: ' + BoolToStr(loadTrees) + ', loadImg: ' + BoolToStr(doLoadImages) + ')') else _udebug := nil;{$ENDIF}

  Result := True;
  Clear;

  FID := -1;

  with ds do try
    if AID > 0 then begin
      Close;
      ProviderName := 'pMetaProduct_Get';
      FetchParams;
      Params.ParamByName('matid').asInteger := AID;
    end
    else if not Active // init for sequental reading
         then ProviderName := 'pMetaProduct_GetAll';

    if not Active then Open;

    if eof then begin
      Result := False;
      setStatus(mpscLoadEOF);
      Exit;
    end;

    FName := FieldByName(FFieldNames.ExtName['Name']).asString;
    FModel := FieldByName(FFieldNames.ExtName['Model']).asString;
    FTypeID := FieldByName(FFieldNames.ExtName['TypeID']).asInteger;

    FDefault  := (0 <> FieldByName(FFieldNames.ExtName['Default']).asInteger);
    FDeleted  := (0 <> FieldByName(FFieldNames.ExtName['Deleted']).asInteger);
    FArchived := (0 <> FieldByName(FFieldNames.ExtName['Archived']).asInteger);

    FbySerial := (0 <> FieldByName(FFieldNames.ExtName['bySerial']).asInteger);
    FBarcode := FieldByName(FFieldNames.ExtName['Barcode']).asString;
    FProducer := FieldByName(FFieldNames.ExtName['Producer']).asString;

    FMeasureID := FieldByName(FFieldNames.ExtName['MeasureID']).asInteger;
    FNotes := FieldByName(FFieldNames.ExtName['Notes']).asString;
    FLabelDescription := FieldByName(FFieldNames.ExtName['LabelDescription']).asString;

    FWeight := FieldByName(FFieldNames.ExtName['Weight']).asFloat;
    FSize := FieldByName(FFieldNames.ExtName['Size']).asFloat;

    FMinReserve := FieldByName(FFieldNames.ExtName['MinReserve']).asFloat;
    FDemandCategory := FieldByName(FFieldNames.ExtName['demandCategory']).asInteger;

    // ap: make it simple one group now
    FGroups.Clear;
    Grp := TMetaProdGroup.Create(Self);
    Grp.Id := FieldByName(FFieldNames.ExtName['Group']).asInteger;
    FGroups.add(grp);

    // ap: make it simple one tax now
    Ftaxes.Clear;
    Tax := TMetaTax.Create(Self);
    Tax.Name := 'VAT';
    Tax.Value := FieldByName(FFieldNames.ExtName['Tax']).asFloat;
    FTaxes.add(Tax);

    FCF1 := FieldByName(FFieldNames.ExtName['CF1']).asInteger;
    FCF2 := FieldByName(FFieldNames.ExtName['CF2']).asInteger;
    FCF3 := FieldByName(FFieldNames.ExtName['CF3']).asInteger;
    FCF4 := FieldByName(FFieldNames.ExtName['CF4']).asInteger;
    FCF5 := FieldByName(FFieldNames.ExtName['CF5']).asInteger;

    if FieldByName(FFieldNames.ExtName['DateAdded']).isNull
      then FdateAdded := incMonth(now, -1)
      else FDateAdded := FieldByName(FFieldNames.ExtName['DateAdded']).asInteger;

    if FieldByName(FFieldNames.ExtName['DateModified']).isNull
      then FdateModified := incDay(now, -1)
      else FDateModified := FieldByName(FFieldNames.ExtName['DateModified']).asInteger;

    if loadTrees then begin
      // loading web info if any
      Ftrees.LoadByNames(cfOwnerTypeProduct, [tree_wwwProps]);

      // webshop properties
      Ftrees.byName(tree_wwwProps).ClearData(-1, True); // clear all previous tree
      Ftrees.byName(tree_wwwProps).LoadData(FID);

      //webshops available languages
      if nil = Ftrees.byName(tree_wwwLangs)
        then Ftrees.Add(tree_wwwLangs, cfOwnerTypeWebShop, -1)
        else begin
          Ftrees.byName(tree_wwwLangs).ClearData(-1, True); // clear all previous tree
          Ftrees.byName(tree_wwwLangs).LoadData(-1);
        end;
    end; // if loadTrees

    FID := FieldByName(FFieldNames.ExtName['ID']).asInteger;

    {$IFDEF GOLD}
    // sizes
    Ftrees.LoadByIDs(cfOwnerTypeProduct, [2]);
    Ftrees.byID(2).LoadData(FID);
    {$ENDIF}

    with newDataSet do try
      // getting prices
      FPrices.Clear;
      ProviderName := 'pMetaProduct_Get_Prices';
      FetchParams;
      Params.ParamByName('matid').asInteger := FID;
      Open;
      while not eof do begin
        FPrices.Add(TMetaPrice.Create(Self,
            FieldByName('ptype').asInteger,
            FieldByName('price').AsFloat,
            FieldByName('dis').asFloat,
            FieldByName('currid').asInteger,
            FieldByName('currname').asString
        ));

        Next;
      end;
      Close;

      // gettting remains at warehouses
      remain := nil;
      ProviderName := 'pWHPosRemains';
      FetchParams;
      Params.ParamByName('ProdID').asInteger := FID;
      Params.ParamByName('wid').asInteger := 0; // for all warehouses
      Open;
      while not eof do begin
        if (remain <> nil) and (remain.FWID = FieldByName('wid').asInteger) then begin
          remain.FRemain := remain.FRemain + FieldByName('remain').asFloat;
          remain.FReserve := remain.FReserve + FieldByName('rsv').asFloat;
        end
        else begin // new whouse
          remain := TMetaProdRemainsPos.Create(FRemains);
          Remains.add(remains);
          remain.FWID := FieldByName('wid').asInteger;
          remain.FRemain := FieldByName('remain').asFloat;
          remain.FReserve := FieldByName('rsv').asFloat;
        end;
      end;
      Close;

    finally
      Free;
    end; // with newDataSet do try

    if doLoadImages then LoadImages;

    FNew := False;

    if AID > 0 then Next;

  except
    Result := False;
    setStatus(mpscLoadError);
    raise;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TMetaProduct.ExportXML(var AXML: TStringStream; const closeTag: Boolean = True; const images: Boolean = False): Boolean;
  var
    s, options: string;
    i, ii, count, pricecat: Integer;
    data: TapTreeNodeData;
    tree, ltree: TapTree;
    node: TapTreeNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  //----------------------------------------------------------------------
  function mkLine(xmltag, nodename: String): String;
  begin
    if node = nil then Exit; // in case of tree changes and product were not updated

    Data := node.FindFirst(nodename).FindData( FID, FWSToExport );

    if Data <> nil then begin
      Result := '    <' + xmltag + '>' + Data.asString + '</' + xmltag + '>'#13#10;
      inc(Count);
    end;
  end;
  //----------------------------------------------------------------------

begin
  {$IFNDEF FREE}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaProduct.ExportXML') else _udebug := nil;{$ENDIF}

  setStatus;
  Result := False;
  options := '';

  if FDeleted or (FID = -1) then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  AXML.WriteString('<Product>'#13#10);
  AXML.WriteString('  <Active>1</Active>'#13#10);
  AXML.WriteString('  <Id>' + IntTostr(FID) + '</Id>'#13#10);
  AXML.WriteString('  <Name>' + FName + '</Name>'#13#10);
  AXML.WriteString('  <TypeId>' + IntTostr(FTypeID) + '</TypeId>'#13#10);
  AXML.WriteString('  <Date>' + DateTostr(FDateAdded) + '</DAte>'#13#10);
  AXML.WriteString('  <DateModified>' + DateTostr(FDateModified) + '</DateModified>'#13#10);

  if FModel <> ''     then AXML.WriteString('  <Model>' + FModel + '</Model>'#13#10);
  if FProducer <> ''  then AXML.WriteString('  <ManufId>' + FProducer + '</ManufId>'#13#10);
  if FNotes <> ''     then AXML.WriteString('  <Notes>' + Fnotes + '</Notes>'#13#10);
  if FBarcode <> ''   then AXML.WriteString('  <BarCode>' + FBarcode + '</Barcode>'#13#10);
  if FMeasureID <> -1 then AXML.WriteString('  <MeasureID>' + IntToStr(FMeasureID) + '</MeasureID>'#13#10);

  {$IFDEF GOLD}
  tree := Ftrees.byID(2);
  if tree <> nil then begin
    s := '';
    node := tree.firstNode;
    while node <> nil do begin
      if (node.DataCount > 0) and node.Data[0].asBoolean
        then s := s + '  <Size>' + node.Name + '  </Size>' + crlf;

      node := node.NextNode;
    end;

    if s <> '' then options := options + '<Sizes>' + crlf + s + '</Sizes>';
  end;
  {$ENDIF}

  {***
  collecting data from www tree
  first you must set site ID into data property of FTrees
  ***}
  pricecat := 0;
  s := '';

  if FWSToExport <> 0 then begin
    // getting marketing stuff
    tree := Ftrees.byName(tree_wwwProps);
    node := tree.FindFirst('Marketing', False);
    AXML.WriteString(mkLine('SpecialFeature', 'isSpecial') + mkLine('RetailPrice', 'RetailPrice') + crlf);

    // categories for this webshop
    tree := Ftrees.Add(tree_wwwGroups + IntToStr(FWSToExport), cfOwnerTypeWebShop); //it checks if tree already loaded
    tree.ClearData(-1, True);
    tree.LoadData(0); // master data w node types, etc...
    tree.LoadData(FID);

    node := tree.FirstNode;
    while node <> nil do begin
      if (node.FindData(0, 0).asInteger = 0) and (node.FindData(FID) <> nil) and node.FindData(FID).asBoolean
        then s := s + '    <CategoryId>' + IntToStr(node.ID) + '</CategoryId>'#13#10;

      node := node.NextNode;
    end;

    if s = '' then begin // no categories affiliation - no export ;)
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      setStatus(mpscNoCat);
      Exit;
    end;

    AXML.WriteString('  <Categories>'#13#10 + s + '  </Categories>'#13#10);

    s := '';
    tree := Ftrees.byName(tree_wwwProps);
    // checks the 'Post' node data item with CID=siteID
    data := tree.FindFirst('Post').FindData( FID, FWSToExport );

    // exporting language-dependent info
    if (data <> nil) and data.asBoolean then begin // should be posted
      ltree := Ftrees.byName(tree_wwwLangs);

      for i := 0 to ltree.Count - 1 do begin // cycle trough languages
        data := ltree[i].FindData(FWSToExport);
        
        if (data = nil) or not data.asBoolean then Continue; // not available

        count := 0;
        node := tree.FindFirst(ltree[i].Items[0].Name);
        s := s + '<Text>'
               + '  <LangId>' + ltree[i].Items[0].Name + '</LangId>'#13#10
               + mkLine('Name', 'Name')
               + mkLine('Descr', 'Ldescr')
               + mkLine('ShortDescr', 'SDescr')
               + mkLine('MetaKeywords', 'Mkeyw')
               + mkLine('MetaTitle', 'Mtitle')
               + mkLine('MetaDescr', 'MDescr')
               + mkLine('Details', 'Details')
               + '<Alias>'#13#10 + mkLine('Name', 'Alias') + '</Alias>'#13#10;

        if Count > 0
          then s := s + '</Text>'#13#10
          else s := '';
      end; // for i := 0 to tree.Count - 1
    end; // if should be posted

    try
      pricecat := tree.FindFirst('PriceCategory').FindData( FID, FWSToExport ).asInteger;

    except
      pricecat := -1;
    end;
  end; // if FWSToExport <> 0

  if s <> '' then AXML.WriteString('  <Texts>'#13#10 + s + '  </Texts>'#13#10);

  s := '';
  for i := 0 to FPrices.Count - 1 do begin
    if pricecat <> FPrices[i].TypeID then Continue;

    s := s + '  <Price>'#13#10
           + '    <CustomerStatusId>1</CustomerStatusId>'#13#10
           + '    <TypeId>'   + IntToStr(FPrices[i].TypeID) + '</TypeId>'#13#10
           + '    <CurrId>'   + IntToStr(FPrices[i].CurrencyID) + '</CurrId>'#13#10
           + '    <CurrName>' + FPrices[i].CurrencyName + '</CurrName>'#13#10
           + '    <Value>'    + FloatToStr(FPrices[i].Value) + '</Value>'#13#10;

    if FPrices[i].hasDiscounts
      then for ii := 0 to FPrices[i].Discounts.Count - 1
             do s := s + '    <Discount>' + FloatToStr(FPrices[i].Discounts[ii].Value) + '</Discount>'#13#10;

    s := s + '  </Price>'#13#10;
  end;

  if s <> '' then AXML.WriteString('  <Prices>'#13#10 + s + '  </Prices>'#13#10);

  if options <> '' then AXML.WriteString('<Options>'#13#10 + options + '</Options>'#13#10);

  if images and (FImages.Count > 0) then begin
    AXML.WriteString('  <Images>'#13#10);
    for i := 0 to FImages.Count - 1 do begin
// here we should check if this image is allowed to be uploaded to this site ;)
      AXML.WriteString(TMetaImage(FImages[i]).ExportXML);
    end;
    AXML.WriteString('  </Images>'#13#10);
  end;

  if closeTag then AXML.WriteString('</Product>'#13#10);

  Result := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  {$ENDIF}
end;

//==============================================================================================
function TMetaProduct.ImportXML(const AXML: TStream): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaProduct.ImportXML') else _udebug := nil;{$ENDIF}

  Result := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TMetaProduct.XMLForWeb(out stream: TStringStream; const WSID: Integer; const ProdID: Integer = 0): Boolean;
  var
    ds: TClientDataSet;
    tree: TapTree;
    data: TapTreeNodeData;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaProduct.XMLForWeb(WSID: ' + IntToStr(WSID) + ', ProdID: ' + IntToStr(ProdID) + ')') else _udebug := nil;{$ENDIF}

  stream.Size := 0;
  Result := False;

  try // finally
    if ProdID <> 0 then begin // requested to load specific product
      ds := nil;

      try // finally
        try
          ds := newDataSet;
          if not LoadData(ds, ProdID, True, False) then Exit;

        except
          Exit
        end;

      finally
        ds.Free;
      end
    end;

    // checks if proper web data is set for this product
    tree := Trees.byName(tree_wwwProps);
    data := tree.FindFirst('Post').FindData(ID, WSID);

    if (data = nil) or not (data.asBoolean) then begin
      setStatus(mpscXMLnoWS);
      Exit;
    end;

    FWSToExport := WSID; // set which of webshops to export

    if ProdID <> 0 then LoadImages;

    if not ExportXML(stream, True, True) then Exit;

    Result := True;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('MetaProduct', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.

