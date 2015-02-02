unit ssGraphUtil;

interface

uses Types, Graphics;

type
   TGradientDirection=(gdHorizontal, gdVertical);
   TTriVertex = packed record
      x    : Longint;
      y    : Longint;
      Red  : SmallInt;
      Green: SmallInt;
      Blue : SmallInt;
      Alpha: SmallInt;
   end;

function PointInRect(APoint: TPoint; ARect: TRect): Boolean;
function DrawGradient(Canvas: TCanvas; Rect: TRect; Color1, Color2: TColor; Direction: TGradientDirection): boolean;

implementation

uses Windows;

var
   GradProc: function (DC: HDC; var p2: TTriVertex; p3: ULONG; p4: Pointer; p5, p6: ULONG): BOOL; stdcall;
   Img32DLLHandle: Integer;

function PointInRect(APoint: TPoint; ARect: TRect): Boolean;
begin
  Result := (APoint.X > ARect.Left) and (APoint.X < ARect.Right) and
            (APoint.Y > ARect.Top) and (APoint.Y < ARect.Bottom);
end;

function DrawGradient(Canvas: TCanvas; Rect: TRect; Color1, Color2: TColor; Direction: TGradientDirection): boolean;
   function InitTriVertex(XPos: Integer; YPos: Integer; Color: TColor): TTriVertex;
   begin
      Result.x:=XPos;
      Result.y:=YPos;
      Result.Alpha:=2;
      Result.Red:=(GetRValue(ColorToRGB(Color)) shl 8);
      Result.Green:=(GetGValue(ColorToRGB(Color)) shl 8);
      Result.Blue:=(GetBValue(ColorToRGB(Color)) shl 8);
   end;
var
   GRect : TGradientRect;
   Vertex: array[0..2] of TTriVertex;
begin
   Result:=False;
   if not Assigned(GradProc) then Exit;
   GRect.UpperLeft:=0;
   GRect.LowerRight:=1;
   Vertex[0]:=InitTriVertex(Rect.Left,Rect.Top,Color1);
   Vertex[1]:=InitTriVertex(Rect.Right,Rect.Bottom,Color2);
   case Direction of
      gdHorizontal: GradProc(Canvas.Handle, Vertex[0], 2, @GRect, 1, GRADIENT_FILL_RECT_H);
      gdVertical: GradProc(Canvas.Handle, Vertex[0], 2, @GRect, 1, GRADIENT_FILL_RECT_V);
   end;
   Result:=True;
end;


initialization
   Img32DLLHandle:=0;
   Img32DLLHandle:=LoadLibrary('MSIMG32.DLL');
   if Img32DLLHandle<>0
    then GradProc:=GetProcAddress(Img32DLLHandle,'GradientFill');

finalization
   if Img32DLLHandle<>0 then FreeLibrary(Img32DLLHandle);

end.
