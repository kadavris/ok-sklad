unit xNumInWords;

interface

uses
  xLngDefs;

//used for money-related purposes mainly
function NumInWords(number: Int64; gender: Tgender; padezh: Tpadezh = padezhIE): String;
function TimeInWords(Value: TDateTime; AFormat: String): String;

// mainly internal functions, but who knows
function weekDayName(ALangID, day: Integer; short: Boolean; padezh: Tpadezh = padezhIE): String;
function monthName(ALangID, month: Integer; short: Boolean; padezh: Tpadezh = padezhIE): String;

function yearInWords(ALangID, Value: Int64; padezh: Tpadezh = padezhIE): String;
function monthInWords(ALangID, Value: Int64; padezh: Tpadezh = padezhIE): String;
function dayInWords(ALangID, Value: Int64; padezh: Tpadezh = padezhIE): String;
function hourInWords(ALangID, Value: Int64; padezh: Tpadezh = padezhIE): String;
function minuteInWords(ALangID, Value: Int64; padezh: Tpadezh = padezhIE): String;
function secondInWords(ALangID, Value: Int64; padezh: Tpadezh = padezhIE): String;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  xNumInWords_RUS,
  xNumInWords_UKR,
  xNumInWords_ENG,
  xNumInWords_ESP,
  DateUtils, sysUtils, strUtils;

//==============================================================================================
function NumInWords(number: Int64; gender: TGender; padezh: Tpadezh = padezhIE): String;
begin
  case RepLangID of
    lidRUS: Result := numInWords_RUS(number, gender, padezh);
    lidUKR: Result := numInWords_UKR(number, gender, padezh);
    lidENG: Result := numInWords_ENG(number);
    lidESP: Result := numInWords_ESP(number) + ' ';
    else Result := 'no NumInWords for lang: ' + intToStr(langID);
  end;
end;

//==============================================================================================
function weekDayName(ALangID, day: Integer; short: Boolean; padezh: Tpadezh = padezhIE): String;
  const
    ruroots: array[1..7] of String = ('понедельник', 'вторник', 'сред', 'четверг', 'пятниц', 'суббот', 'воскресен');

    //1  Имен ед.ч, 2  Имен мн.ч, 3  Родит ед.ч, 4  Родит мн.ч, 5  Дат ед.ч,   6  Дат мн.ч,
    //7  Винит ед.ч, 8  Винит мн.ч, 9  Твор ед.ч, 10 Твор мн.ч, 11 Предл ед.ч, 12 Предл мн.ч,
    rusuff: array[1..7, TPadezh] of String = (
      //1    2     3     4     5     6      7     8     9      10      11    12
      ('',   'и',  '',   'и',  'у',  'ам',  '',   'и',  'ом',  'ами',  'е',  'ах'),  //понедельник
      ('',   'и',  '',   'и',  'у',  'ам',  '',   'и',  'ом',  'ами',  'е',  'ах'),  //вторник',
      ('а',  'ы',  'у',  'ы',  'е',  'ам',  'у',  'ы',  'ой',  'ами',  'е',  'ах'),  //сред',
      ('',   'и',  '',   'и',  'у',  'ам',  '',   'и',  'ом',  'ами',  'е',  'ах'),  //четверг',
      ('а',  'ы',  'у',  'ы',  'е',  'ам',  'у',  'ы',  'ей',  'ами',  'е',  'ах'),  //пятниц',
      ('а',  'ы',  'у',  'ы',  'е',  'ам',  'у',  'ы',  'ой',  'ами',  'е',  'ах'),  //суббот',
      ('ье', 'ья', 'ье', 'ья', 'ью', 'ьям', 'ье', 'ья', 'ьем', 'ьями', 'ье', 'ьях')  //воскресен'
    );

    rushort: array[1..7] of String = ('пн', 'вт', 'ср', 'чт', 'пт', 'сб', 'вс');
    en: array[1..7] of String = ('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday');
    enshort: array[1..7] of String = ('mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun');

begin
  case ALangID of
    lidUKR, // sorry ;)
    lidRUS:
      if short
        then Result := rushort[day]
        else Result := ruroots[day] + rusuff[day, padezh];

    lidENG:
      if short
        then Result := enshort[day]
        else Result := en[day];

    //lidESP:
  end; // case ALangID of
end;

//==============================================================================================
function monthName(ALangID, month: Integer; short: Boolean; padezh: Tpadezh = padezhIE): String;
  const
    ruroots: array[1..12] of String = ('январ', 'феврал', 'март', 'апрел', 'ма', 'июн', 'июл', 'август', 'сентябр', 'октябр', 'ноябр', 'декабр');

    //1  Имен ед.ч, 2  Имен мн.ч, 3  Родит ед.ч, 4  Родит мн.ч, 5  Дат ед.ч,   6  Дат мн.ч,
    //7  Винит ед.ч, 8  Винит мн.ч, 9  Твор ед.ч, 10 Твор мн.ч, 11 Предл ед.ч, 12 Предл мн.ч,
    rusuff: array[1..12, TPadezh] of String = (
      //1   2    3    4     5    6     7    8    9     10     11   12
      ('ь', 'и', 'ь', 'ей', 'ю', 'ям', 'ь', 'и', 'ём', 'ями', 'е', 'ях'), // январ
      ('ь', 'и', 'ь', 'ей', 'ю', 'ям', 'ь', 'и', 'ём', 'ями', 'е', 'ях'), // феврал
      ('ь', 'ы', '',  'ов', 'у', 'ам', '',  'ы', 'ом', 'ами', 'е', 'ах'), // март
      ('ь', 'и', 'ь', 'ей', 'ю', 'ям', 'ь', 'и', 'ем', 'ями', 'е', 'ях'), // апрел
      ('й', 'и', 'й', 'ев', 'ю', 'ям', 'й', 'и', 'ем', 'ями', 'е', 'ях'), // ма
      ('ь', 'и', 'ь', 'ей', 'ю', 'ям', 'ь', 'и', 'ем', 'ями', 'е', 'ях'), // июн
      ('ь', 'и', 'ь', 'ей', 'ю', 'ям', 'ь', 'и', 'ем', 'ями', 'е', 'ях'), // июл
      ('',  'ы', '',  'ов', 'у', 'ам', '',  'ы', 'ом', 'ами', 'е', 'ах'), // август
      ('ь', 'и', 'ь', 'ей', 'ю', 'ям', 'ь', 'и', 'ём', 'ями', 'е', 'ях'), // сентябр
      ('ь', 'и', 'ь', 'ей', 'ю', 'ям', 'ь', 'и', 'ём', 'ями', 'е', 'ях'), // октябр
      ('ь', 'и', 'ь', 'ей', 'ю', 'ям', 'ь', 'и', 'ём', 'ями', 'е', 'ях'), // ноябр
      ('ь', 'и', 'ь', 'ей', 'ю', 'ям', 'ь', 'и', 'ём', 'ями', 'е', 'ях')  // декабр
    );

    rushort: array[1..12] of String = ('янв', 'фев', 'мар', 'апр', 'май', 'июн', 'июл', 'авг', 'сен', 'окт', 'ноя', 'дек');
    en: array[1..12] of String = ('january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december');
    enshort: array[1..12] of String = ('jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec');

begin
  case ALangID of
    lidUKR, // sorry ;)
    lidRUS:
      if short
        then Result := rushort[month]
        else Result := ruroots[month] + rusuff[month, padezh];

    lidENG:
      if short
        then Result := enshort[month]
        else Result := en[month];

    //lidESP:
  end; // case ALangID of
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
const
  // for word forms tables lookup
  wantYear   = 1;
  wantMonth  = 2;
  wantDay    = 3;
  wantHour   = 4;
  wantMinute = 5;
  wantSecond = 6;
  want_Max   = 6; // max value

  enforms: array[1..want_Max] of String = ('year', 'month', 'day', 'hour', 'minute', 'second');

  //1  Имен ед.ч, 2  Имен мн.ч, 3  Родит ед.ч, 4  Родит мн.ч, 5  Дат ед.ч,   6  Дат мн.ч,
  //7  Винит ед.ч, 8  Винит мн.ч, 9  Твор ед.ч, 10 Твор мн.ч, 11 Предл ед.ч, 12 Предл мн.ч,
  // имен мн.ч. (2) содержит формы окончаний на 0,5..9,11..19, винит мн.ч. (8) содержит формы для окончаний на 2..4.
  ruforms: array[1..want_Max, TPadezh] of String = (
    //1         2          3          4         5          6           7          8          9           10           11         12
    ('год',     'лет',     'год',     'лет',    'году',    'годам',    'год',     'года',    'годом',    'годами',    'годе',    'годах'),
    ('месяц',   'месяцев', 'месяц',   'месяца', 'месяцу',  'месяцам',  'месяц',   'месяца',  'месяцом',  'месяцами',  'месяце',  'месяцах'),
    ('день',    'дней',    'день',    'дней',   'дню',     'дням',     'день',    'дня',     'днём',     'днями',     'дне',     'днях'),
    ('час',     'часов',   'час',     'часов',  'часу',    'часам',    'час',     'часа',    'часом',    'часами',    'часе',    'часах'),
    ('минута',  'минут',   'минуту',  'минут',  'минуте',  'минутам',  'минуту',  'минуты',  'минутой',  'минутами',  'минуте',  'минутах'),
    ('секунда', 'секунд',  'секунду', 'секунд', 'секунде', 'секундам', 'секунду', 'секунды', 'секундой', 'секундами', 'секунде', 'секундах')
  );

//==============================================================================================
// internal one.
function someInWords(ALangID: Integer; Value: Int64; wantWhat: Integer; padezh: Tpadezh): String;
  var
    n: Integer;
begin
  if ALangID = lidENG then begin
    Result := enforms[wantWhat] + ifThen(Value <> 1, 's', '');
    Exit;
  end; // EN

  Value := abs(Value);
  n := Value mod 100; // checking fo 11..19 first
  if (n < 11) or (n > 19) then n := Value mod 10; // getting just last digit

  if ALangID = lidRUS then begin
    if padezh = padezhVM then padezh := padezhIM; // винительный мн переходит в именительный мн

    // формы множ числа имеют нечётные индексы.
    if odd(integer(padezh)) and (n = 1) then dec(padezh); // при окончании на 1 множ число переходит в единств

    case padezh of
      padezhIM:
        if n in [2..4]
          then Result := ruforms[wantWhat, padezhVM] // объяснение вверху таблицы
          else Result := ruforms[wantWhat, padezhIM]

      else
        Result := ruforms[wantWhat, padezh]
    end; // case padezh
  end// RU

  // украинский пока лениво и непонятно, как делать. в сущности оно может и не отличаться от русского по словообразованию
  else if ALangID = lidUKR then begin
    if padezh = padezhVM then padezh := padezhIM; // винительный мн переходит в именительный мн

    // формы множ числа имеют нечётные индексы.
    if odd(integer(padezh)) and (n = 1) then dec(padezh); // при окончании на 1 множ число переходит в единств

    case padezh of
      padezhIM:
        if n in [2..4]
          then Result := ruforms[wantWhat, padezhVM] // объяснение вверху таблицы
          else Result := ruforms[wantWhat, padezhIM]

      else
        Result := ruforms[wantWhat, padezh]
    end; // case padezh
  end;// UKR
end;

//==============================================================================================
function yearInWords(ALangID, Value: Int64; padezh: Tpadezh = padezhIE): String;
begin
  Result := someInWords(ALangID, Value, wantYear, padezh);
end;

//==============================================================================================
function monthInWords(ALangID, Value: Int64; padezh: Tpadezh = padezhIE): String;
begin
  Result := someInWords(ALangID, Value, wantMonth, padezh);
end;

//==============================================================================================
function dayInWords(ALangID, Value: Int64; padezh: Tpadezh = padezhIE): String;
begin
  Result := someInWords(ALangID, Value, wantDay, padezh);
end;

//==============================================================================================
function hourInWords(ALangID, Value: Int64; padezh: Tpadezh = padezhIE): String;
begin
  Result := someInWords(ALangID, Value, wantHour, padezh);
end;

//==============================================================================================
function minuteInWords(ALangID, Value: Int64; padezh: Tpadezh = padezhIE): String;
begin
  Result := someInWords(ALangID, Value, wantMinute, padezh);
end;

//==============================================================================================
function secondInWords(ALangID, Value: Int64; padezh: Tpadezh = padezhIE): String;
begin
  Result := someInWords(ALangID, Value, wantSecond, padezh);
end;

//==============================================================================================
{
  format is equivalent of some of stftime() functions:

     %A    is replaced by national representation of the full weekday name.
     %a    is replaced by national representation of the abbreviated weekday name.
     %B    is replaced by national representation of the full month name.
     %b    is replaced by national representation of the abbreviated month name.
     %C    is replaced by (year / 100) as decimal number; single digits are preceded by a zero.

     %D    is equivalent to ``%m/%d/%y''.
     %d    is replaced by the day of the month as a decimal number (01-31).
     %e    is replaced by the day of month as a decimal number (1-31); single digits are preceded by a blank.
     %F    is equivalent to ``%Y-%m-%d''.

     %H    is replaced by the hour (24-hour clock) as a decimal number (00-23).
     %h    the same as %b.
     %I    is replaced by the hour (12-hour clock) as a decimal number (01-12).
     %j    is replaced by the day of the year as a decimal number (001-366).
     %k    is replaced by the hour (24-hour clock) as a decimal number (0-23); single digits are preceded by a blank.
     %l    is replaced by the hour (12-hour clock) as a decimal number (1-12); single digits are preceded by a blank.
     %M    is replaced by the minute as a decimal number (00-59).
     %m    is replaced by the month as a decimal number (01-12).
     %n    is replaced by a newline.
     %p    is replaced by national representation of either "ante meridiem" or "post meridiem" as appropriate.
     %R    is equivalent to ``%H:%M''.
     %r    is equivalent to ``%I:%M:%S %p''.
     %S    is replaced by the second as a decimal number (00-60).
     %s    is replaced by the number of seconds since the Epoch, UTC (see mktime(3)).
     %T    is equivalent to ``%H:%M:%S''.
     %t    is replaced by a tab.
     %U    is replaced by the week number of the year (00-53).
     %u    is replaced by the weekday as a decimal number (1-7).
     %v    is equivalent to ``%e-%b-%Y''.
     %W    = %U
     %w    = %u

     %Y    is replaced by the year with century as a decimal number.
     %y    is replaced by the year without century as a decimal number (00-99).
     %Z    is replaced by the time zone name.

     %%    is replaced by `%'.
}
function TimeInWords(Value: TDateTime; AFormat: String): String;
  var
    i, fmtlen: Integer;
    year,month,day,hour,minute,second,msec: Word;
    percent: Boolean;
    decl: Tpadezh;

  // for recursive uses
  function parse(code: char): String;
  begin
    case code of
      'A': begin //is replaced by national representation of the full weekday name.
        Result := weekDayName(ReplangID, DayOfTheWeek(Value), False);
      end;

      'a': begin //    is replaced by national representation of the abbreviated weekday name.
        Result := weekDayName(ReplangID, DayOfTheWeek(Value), true);
      end;

      'B': begin //    is replaced by national representation of the full month name.
        Result := monthName(ReplangID, month, False);
      end;

      'b','h': begin //    is replaced by national representation of the abbreviated month name.
        Result := monthName(ReplangID, month, True);
      end;

      'C': begin //    is replaced by (year / 100) as decimal number; single digits are preceded by a zero.
        Result := format('%02d', [year - 1900]);
      end;

      'D': begin //    is equivalent to ``%m/%d/%y''.
        Result := parse('m') + '/' + parse('d') + '/' + parse('y');
      end;

      'd': begin //    is replaced by the day of the month as a decimal number (01-31).
        Result := format('%02d', [day]);
      end;

      'e': begin //    is replaced by the day of month as a decimal number (1-31); single digits are preceded by a blank.
        Result := format('%2d', [day]);
      end;

      'F': begin //    is equivalent to ``%Y-%m-%d''.
        Result := parse('Y') + '-' + parse('m') + '-' + parse('d');
      end;

      'H': begin //    is replaced by the hour (24-hour clock) as a decimal number (00-23).
        Result := format('%02d', [hour]);
      end;

      'I': begin //    is replaced by the hour (12-hour clock) as a decimal number (01-12).
        Result := format('%02d', [hour mod 12]);
      end;

      'j': begin //    is replaced by the day of the year as a decimal number (001-366).
        Result := format('%03d', [dayOfTheYear(Value)]);
      end;

      'k': begin //    is replaced by the hour (24-hour clock) as a decimal number (0-23); single digits are preceded by a blank.
        Result := format('%2d', [hour]);
      end;

      'l': begin //    is replaced by the hour (12-hour clock) as a decimal number (1-12); single digits are preceded by a blank.
        Result := format('%2d', [hour mod 12]);
      end;

      'M': begin //    is replaced by the minute as a decimal number (00-59).
        Result := format('%02d', [minute]);
      end;

      'm': begin //    is replaced by the month as a decimal number (01-12).
        Result := format('%02d', [month]);
      end;

      'n': begin //    is replaced by a newline.
        Result := #13#10;
      end;

      'p': begin //    is replaced by national representation of either "ante meridiem" or "post meridiem" as appropriate.
        case RepLangID of
          //lidRUS: Result := ifThen(hour > 12, 'после', 'до') + ' полудня';
          //lidUKR: Result := ifThen(hour > 12, 'пiсля', 'до') + ' пiвдня';
          lidENG: Result := ifThen(hour > 12, 'post', 'ante') + ' meridiem';
          //lidESP: Result := ifThen(hour > 12, '', '') + '';
        end;
      end;

      'R': begin //    is equivalent to ``%H:%M''.
        Result := parse('H') + ':' + parse('M');
      end;

      'r': begin //    is equivalent to ``%I:%M:%S %p''.
        Result := parse('I') + ':' + parse('M') + ':' + parse('S') + ' ' + parse('p');
      end;

      'S': begin //    is replaced by the second as a decimal number (00-60).
        Result := format('%02d', [second]);
      end;

      {'s': begin //    is replaced by the number of seconds since the Epoch, UTC (see mktime(3)).
        Result := format('%d', []);
      end;
      }

      'T': begin //    is equivalent to ``%H:%M:%S''.
        Result := parse('H') + ':' + parse('M') + ':' + parse('S');
      end;

      't': begin //    is replaced by a tab.
        Result := #9;
      end;

      'U', 'W': begin //    is replaced by the week number of the year (00-53).
        Result := format('%02d', [WeekOfTheYear(Value)]);
      end;

      'u', 'w': begin //    is replaced by the weekday as a decimal number (1-7).
        Result := format('%d', [DayOfTheWeek(Value)]);
      end;

      'v': begin //    is equivalent to ``%e-%b-%Y''.
        Result := parse('e') + '-' + parse('b') + '-' + parse('Y');
      end;

      'Y': begin //    is replaced by the year with century as a decimal number.
        Result := format('%d', [year]);
      end;

      'y': begin //    is replaced by the year without century as a decimal number (00-99).
        Result := format('%02d', [year - 1900]);
      end;

      {'Z': begin //    is replaced by the time zone name.
        Result := format('%d', []);
      end;
      }

      '_': begin // less than N ...
        //if year > 0 then Result := IntToStr(year) + ' ' + yearInWords(
      end;
    end; // case code
  end;

begin
  Result := '';
  percent := False;
  i := 1;
  fmtlen := length(aformat);

  decodeDate(Value, year, month, day);
  decodeTime(Value, hour, minute, second, msec);

  while i <= fmtlen do begin
    if aformat[i] = '%' then begin
      if percent then begin
        Result := Result + '%';
        percent := False;
      end
      else percent := True;

      inc(i);
      Continue;
    end;

    if not percent then begin
      Result := Result + aformat[i];
      inc(i);
      Continue;
    end;

    Result := Result + parse(Aformat[i]);

    inc(i);
  end; //while i <= fmtlen do begin
end;
{
 unused items:
     %c    is replaced by national representation of time and date.

     %E* %O*
           POSIX locale extensions.  The sequences %Ec %EC %Ex %EX %Ey %EY %Od
           %Oe %OH %OI %Om %OM %OS %Ou %OU %OV %Ow %OW %Oy are supposed to
           provide alternate representations.

           Additionly %OB implemented to represent alternative months names
           (used standalone, without day mentioned).

     %O*   the same as %E*.

     %G    is replaced by a year as a decimal number with century.  This year
           is the one that contains the greater part of the week (Monday as
           the first day of the week).

     %g    is replaced by the same year as in ``%G'', but as a decimal number without century (00-99).
     %V    is replaced by the week number of the year (Monday as the first day
           of the week) as a decimal number (01-53).  If the week containing
           January 1 has four or more days in the new year, then it is week 1;
           otherwise it is the last week of the previous year, and the next
           week is week 1.

     %X    is replaced by national representation of the time.
     %x    is replaced by national representation of the date.
     %z    is replaced by the time zone offset from UTC; a leading plus sign
           stands for east of UTC, a minus sign for west of UTC, hours and
           minutes follow with two digits each and no delimiter between them
           (common form for RFC 822 date headers).

     %+    is replaced by national representation of the date and time (the
           format is similar to that produced by date(1)).

}

end.

