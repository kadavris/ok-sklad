unit okDateUtils;

interface

uses SysUtils, xLngManager;

function okDateToStr(ALng: TxLngManager; ADate: TDateTime): string;

//=============================================================================
implementation

uses
  xLngDefs;

function okDateToStr(ALng: TxLngManager; ADate: TDateTime): string;
  const months: array[1..12] of String = ( 'JanR', 'FebR', 'MarR', 'AprR', 'MayR', 'JunR', 'JulR', 'AugR', 'SepR', 'OctR', 'NovR', 'DecR' );
  var
    d, m, y: word;
    strM: string;
begin
  if ALng = nil then Exit;

  DecodeDate(ADate, y, m, d);

  // NOTE: this func used in printed reports, so we checking our own langID instead of system locale
  if LangID = lidENG // no year word in english
    then Result :=  IntToStr(d) + ' ' + AnsiLowerCase(months[m]) + ' ' + IntToStr(y)
  else if CountryRules.CID = cidUS // U.S. - month first
    then Result :=  AnsiLowerCase(months[m]) + ' ' + IntToStr(d) + ' ' + IntToStr(y)
  else Result := IntToStr(d) + ' ' + AnsiLowerCase(months[m]) + ' ' + IntToStr(y){ + ' ' + ALng.GetRS('Period', 'YearR') + '.'};
end;

end.
