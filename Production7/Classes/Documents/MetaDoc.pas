{$I ok_sklad.inc}
unit MetaDoc; // Document meta-class consisting of common to all doc types things

interface

uses
  DB, ssMemDS, MetaClass, Classes, SysUtils, XMLDoc, XMLIntf;

const
  // validation result bits:
  TMDVNoNumber = 1;
  TMDVNoDocType = 2;

type
  TMetaDocType = (TMetaDocTypeNone = -1);

  TWMatTurnType = (WmatTurnIn = 1, WmatTurnOut = -1, WMatTurnOrdered = 2, WMatTurnReserved = 3);

  TMetaDoc = class(TMetaClass)
    protected
      FPosted: Boolean;
      FNumber: String; // doc number/name
      FNotes, FReason: String;
      FPersonID: Integer;
      FDocType: TMetaDocType;

      function LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;

    public
      constructor Create(const AParent: TMetaClass);
      destructor Destroy; override;

      //function Validate: Cardinal; // return a bit set of found problems or 0 if all is OK

      {
      function ImportXML(AFileName: String): boolean; overload;
      function ImportXML(AXML: String): boolean; overload;
      function ImportXML(AStream: TStream): boolean; overload;
      function ExportXML(const fieldList: string = ''): boolean; // maybe array of strings ???

      procedure Recalculate; virtual; //???
      }
  end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

//==============================================================================================
constructor TMetaDoc.Create(const AParent: TMetaClass);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaDoc.Create') else _udebug := nil;{$ENDIF}

  inherited;

  FPosted := False;
  FDocType := TMetaDocTypeNone;
  FNumber := '';
  FNotes := '';
  FReason := '';
  FPersonID := -1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TMetaDoc.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaDoc.Free') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TMetaDoc.LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;
  var
    name, data: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWaybillPos.loadXMLNode') else _udebug := nil;{$ENDIF}

  Result := True;
  Ferror := 0;

  try // finally
    name := AnsiLowerCase(Node.NodeName);
    data := trim(Node.Text);

    if name = 'number' then begin
      FNumber := data;
      Exit;
    end
    else if name = 'notes' then begin
      FNotes := data;
      Exit;
    end
    else if name = 'reason' then begin
      FReason := data;
      Exit;
    end
    else if name = 'posted' then begin
      FPosted := StrToBool(data);
      Exit;
    end
    else if name = 'personid' then begin
      try
        FPersonId := StrToInt(data);

      except
        Ferror := ap_err_XML_badData;
        Result := False;
      end;

      Exit;
    end
    else if name = 'doctype' then begin
      try
        FDocType := TMetaDocType(StrToInt(data));

      except
        Ferror := ap_err_XML_badData;
      end;

      Exit;
    end;

    Result := inherited loadXMLNode(topNode, Node); // maybe some base-class stuff

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('MetaDoc', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.

