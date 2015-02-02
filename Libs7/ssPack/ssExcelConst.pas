unit ssExcelConst;

interface

uses SysUtils, Graphics;

const
 OleClassName = 'Excel.Application';

 //UnderLine Styles for Font property
 xlUnderlineStyleDouble = $FFFFEFE9;
 xlUnderlineStyleDoubleAccounting = $00000005;
 xlUnderlineStyleNone = $FFFFEFD2;
 xlUnderlineStyleSingle = $00000002;
 xlUnderlineStyleSingleAccounting = $00000004;

// XlVAlign constants
const
  xlVAlignBottom = $FFFFEFF5;
  xlVAlignCenter = $FFFFEFF4;
  xlVAlignDistributed = $FFFFEFEB;
  xlVAlignJustify = $FFFFEFDE;
  xlVAlignTop = $FFFFEFC0;

 //������������
 xlCenter = -4108;
 xlRight  = -4152;
 xlLeft   = -4131;

 //������� �����
 xlMedium = -4138;
 xlThin   = 2;

 //����� �����
 xlContinuous = 1;

var
 ExcelVersion : integer = 8; //����� ������ �� ���������

{ ���������� ��������� ����������� � �������� Excel ��� ������������� �������, ��������
  ����������� Left, Top, Right, Bottom.}
{ example: ExcelRectToStr(1,1,5,2) = 'A1:E2' }
function ExcelRectToStr(Left, Top, Right, Bottom : LongInt) : string;

{ ������ ��������� �������������� ������ � ������� Rect }
procedure SetCellsFont(Sheet : Variant; const Rect, FontName : string; FontSize : integer;
                       FontColor : TColor; FontStyle : TFontStyles);

{ ������ ���� ������� }
procedure SetCellsBackground(Sheet : Variant; const Rect : string; Color : TColor);

{ ������ ����� ������ ������� � �������� ������ � �������� }
procedure SetCellsBorder(Sheet : Variant; const Rect : string;
                         LineStyle, LineWeight : integer);

{ �������� ���������� �������� }
function GetRange(Sheet : Variant; const Rect : string) : Variant;

{ ���������� ������ }
procedure MergeCells(Sheet : Variant; const Rect : string);
{ ����������� ������ }
procedure UnMergeCells(Sheet : Variant; const Rect : string);

implementation

function ExcelVersionIs70 : boolean;
begin
 Result:=(ExcelVersion=7);
end;

function ExcelRectToStr(Left, Top, Right, Bottom : LongInt) : string;
begin
   if Top=0 then
     Result := chr(Left+ord('@'))+':'+chr(Right+ord('@'))
   else
     if Left = 0 then
        Result := IntToStr(Top)+':'+IntToStr(Bottom)
     else
        Result := chr(Left+ord('@'))+IntToStr(Top)+':'+
                 chr(Right+ord('@'))+IntToStr(Bottom);
end;

procedure SetCellsFont(Sheet : Variant; const Rect, FontName : string; FontSize : integer;
                       FontColor : TColor; FontStyle : TFontStyles);
begin
   if ExcelVersionIs70 then begin
     Sheet.Range(Rect).Font.Name:=FontName;
     Sheet.Range(Rect).Font.Size:=FontSize;
     Sheet.Range(Rect).Font.Italic:=fsItalic in FontStyle;
     Sheet.Range(Rect).Font.Bold:=fsBold in FontStyle;
     Sheet.Range(Rect).Font.Strikethrough:=fsStrikeOut in FontStyle;
     Sheet.Range(Rect).Font.Color:=ColorToRGB(FontColor);
   end
   else begin
     Sheet.Range[Rect].Font.Name:=FontName;
     Sheet.Range[Rect].Font.Size:=FontSize;
     Sheet.Range[Rect].Font.Italic:=fsItalic in FontStyle;
     Sheet.Range[Rect].Font.Bold:=fsBold in FontStyle;
     Sheet.Range[Rect].Font.Strikethrough:=fsStrikeOut in FontStyle;
     if fsUnderLine in FontStyle then
      Sheet.Range[Rect].Font.Underline:=xlUnderlineStyleSingleAccounting;
     Sheet.Range[Rect].Font.Color:=ColorToRGB(FontColor);
   end;
end;

procedure SetCellsBackground(Sheet : Variant; const Rect : string; Color : TColor);
begin
   if ExcelVersionIs70 then
     Sheet.Range(Rect).Interior.Color:=ColorToRGB(Color)
   else
     Sheet.Range[Rect].Interior.Color:=ColorToRGB(Color)
end;

procedure SetCellsBorder(Sheet : Variant; const Rect : string;
                         LineStyle, LineWeight : integer);
begin
   if ExcelVersionIs70 then begin
     Sheet.Range(Rect).Borders.LineStyle:=LineStyle;
     Sheet.Range(Rect).Borders.Weight:=LineWeight;
    end
   else begin
     Sheet.Range[Rect].Borders.LineStyle:=LineStyle;
     Sheet.Range[Rect].Borders.Weight:=LineWeight;
    end;
end;

function GetRange(Sheet : Variant; const Rect : string) : Variant;
begin
 if ExcelVersionIs70
  then Result:=Sheet.Range(Rect)
  else Result:=Sheet.Range[Rect]
end;

procedure MergeCells(Sheet : Variant; const Rect : string);
var
 Range : Variant;
begin
 Range:=GetRange(Sheet, Rect);
 Range.Merge;
end;

procedure UnMergeCells(Sheet : Variant; const Rect : string);
var
 Range : Variant;
begin
 Range:=GetRange(Sheet, Rect);
 Range.MergeCells:=False;
end;



end.
