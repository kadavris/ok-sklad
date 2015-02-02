program xNumInWords_test;

uses xNumInWords_ENG, Sysutils;

{const
  langID = 3;
  RepLangID = langID;
}

var
  num: int64;
  s: string;

begin
//	write('langID: '); readln(LangID);

	while true do begin
		readln(s);
		if s = EmptyStr then Exit;
        try
          writeln(numInWords_ENG(strToint(s)));
        except
          writeln('!err');
        end;
	end;
end.
