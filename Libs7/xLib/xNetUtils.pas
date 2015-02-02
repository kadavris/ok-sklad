unit xNetUtils;

interface

uses Windows, Classes;

function GetNetHosts: TStringList;

//========================================================================
implementation

uses Types;

//========================================================================
procedure GetNetworkLevel(APnr: PNetResource; AList: TStringList);
  type
      TnrBuff = array[0..255] of TNetResource;
      PnrBuff = ^TnrBuff;
  var
     dwRes: dword;
     ltnr: TNetResource;
     hEnum, lpcCount: THandle;
     nrBuff: PnrBuff;
     buffSize: Cardinal;
     i: integer;
begin
  dwRes := WNetOpenEnum(RESOURCE_GLOBALNET, RESOURCETYPE_ANY, RESOURCEUSAGE_CONTAINER, APnr, hEnum);

  if dwRes <> NO_ERROR then begin
    Exit;
  end;

  New(nrBuff);

  lpcCount := 1;
  buffSize := SizeOf(TNetResource) * 255;

  while (WNetEnumResource(hEnum, lpcCount, nrBuff, buffSize) <> ERROR_NO_MORE_ITEMS) do begin
    for i := 0 to lpcCount - 1 do begin
      Move(nrBuff^[i], ltnr, SizeOf(ltnr));

      case ltnr.dwDisplayType of
        RESOURCEDISPLAYTYPE_NETWORK, RESOURCEDISPLAYTYPE_DOMAIN:
          begin
            GetNetworkLevel(@ltnr, AList);
          end;

        RESOURCEDISPLAYTYPE_SERVER:
          begin
            AList.Add(ltnr.lpRemoteName);
          end;
      end;
    end;
  end;

  Dispose(nrBuff);
  WNetCloseEnum(hEnum);
end;

//========================================================================
function GetNetHosts: TStringList;
begin
  Result:=TStringList.Create;
  GetNetworkLevel(nil, Result);
end;

end.
