unit MetaImage;

interface

uses
  Jpeg, DB, DBClient, MetaClass;

type
  TMetaImageType = (mitNone, mitJpeg);

  TMetaImage = class(TMetaClass)
  private
    FType: TMetaImageType;
    FImage: TJPEGImage;
    FOwnerType, FOwnerID: Integer;
    FuserData: Integer; // userdata field from blobs

  public
    constructor Create; overload;
    constructor Create(const AOwnerType, AOwnerID: Integer; ds: TClientDataSet = nil); overload;
    destructor Free;

    function getEmptyState: Boolean;

    procedure Clear;
    function Load(const AOwnerType, AOwnerID: Integer; ds: TClientDataSet = nil): boolean;
    function Save: boolean;
    function ExportXML: String;

    property imageType: TMetaImageType read FType;
    property OwnerType: Integer read FOwnerType;
    property OwnerID: Integer read FOwnerID;
    property isEmpty: Boolean read getEmptyState;
    property userData: Integer read FuserData write fUserData;
  end;

implementation

uses
  Classes, prFun, synacode, SysUtils;
  
//============================================================================================
constructor TMetaImage.Create;
begin
  inherited Create(nil);
  Clear;
end;

//============================================================================================
constructor TMetaImage.Create(const AOwnerType, AOwnerID: Integer; ds: TClientDataSet = nil);
begin
  inherited Create(nil);
  Load(AOwnerType, AOwnerID, ds);
end;

//============================================================================================
destructor TMetaImage.Free;
begin
  FImage.Free;

  inherited;
end;

//============================================================================================
procedure TMetaImage.Clear;
begin
  inherited;

  FImage.Free;
  FImage := TJpegImage.Create;
  FType := mitJpeg;
  FOwnerType := -1;
  FOwnerID := -1;
end;

//============================================================================================
function TMetaImage.Load(const AOwnerType, AOwnerID: Integer; ds: TClientDataSet = nil): Boolean;
  var
    BlobStream: TStream;
    myDS: Boolean;
begin
  Result := True;

  myDS := (ds = nil);
  if myDS then ds := newDataSet;

  Clear;
  with ds do try
    if not Active then begin
      ProviderName := 'Blobs_Get';
      FetchParams;
      Params.ParamByName('ownerid').AsInteger := AOwnerID;
      Params.ParamByName('ownertype').AsInteger := AOwnerType;
      Open;
    end;

    if not eof then begin
      BlobStream := CreateBlobStream(FieldByName('data'), bmRead);
      FImage.LoadFromStream(BlobStream);
      BlobStream.Free;
      FID := FieldByName('id').asInteger;
      FuserData := FieldByName('userData').asInteger;
      Next;
    end;
  except
    Clear;
    Result := False;
  end; // with ds try

  if myDS then ds.Free;
end;

//============================================================================================
function TMetaImage.Save: Boolean;
begin
  Result := False;
end;

//============================================================================================
function TMetaImage.getEmptyState: Boolean;
begin
  Result := FImage.Empty;
end;

//============================================================================================
function TMetaImage.ExportXML: String;
  var
    s: TStringStream;
begin
  if FType = mitNone then begin
    Result := ''; Exit;
  end;

  Result := '<Image>'#10#13'<Id>' + IntTostr(FID) + '</Id>'#13#10'<Type>';

  s := TStringStream.Create('');

  case FType of
    mitJpeg:
      begin
        Result := Result + 'JPEG';
        FImage.SaveToStream(S);
      end;
  end;

  Result := Result + '</Type>'#13#10'<Data>' + EncodeBase64(s.DataString) + '</Data>'#13#10'</Image>'#13#10;

  s.Free;
end;

end.

