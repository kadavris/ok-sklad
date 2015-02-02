program ReportEd;

uses
  SysUtils,
  Dialogs,
  FR_Class, FR_Desgn,
  FR_View, FR_Rich, FR_ChBox, FR_Cross, FR_RRect, FR_BarC, FR_Shape, FR_Chart;

var
   frDoc: TfrReport;
   frRichObject1: TfrRichObject;
   frChartObject1: TfrChartObject;
   frShapeObject1: TfrShapeObject;
   frBarCodeObject1: TfrBarCodeObject;
   frRoundRectObject1: TfrRoundRectObject;
   frCrossObject1: TfrCrossObject;
   frCheckBoxObject1: TfrCheckBoxObject;

begin
  frRichObject1 := TfrRichObject.Create(nil);
  frChartObject1 := TfrChartObject.Create(nil);
  frShapeObject1 := TfrShapeObject.Create(nil);
  frBarCodeObject1 := TfrBarCodeObject.Create(nil);
  frRoundRectObject1 := TfrRoundRectObject.Create(nil);
  frCrossObject1 := TfrCrossObject.Create(nil);
  frCheckBoxObject1 := TfrCheckBoxObject.Create(nil);

  frDoc := TfrReport.Create(nil);
  try
    if ParamCount = 0 then begin
      with TOpenDialog.Create(nil) do
      try
        Filter := 'Report forms (*.frf)|*.frf';
        DefaultExt := 'frf';
        if Execute then begin
          frDoc.LoadFromFile(FileName);
          frDoc.DesignReport;
        end;
      finally
        Free;
      end;
    end
    else begin // with cmd line params
      try
       if ParamCount = 1
         then frDoc.LoadFromFile(ParamStr(1))
         else frDoc.LoadFromFile(ParamStr(2));
      except
       Writeln('Ошибка при открытии файла!');
       Exit;
      end;

      if ParamCount = 1 then begin
       frDoc.DesignReport;
       Exit;
      end;

      if LowerCase(ParamStr(1)) = '-d' then begin
       frDoc.DesignReport;
      end else
      if LowerCase(ParamStr(1)) = '-v' then begin
       frDoc.ShowReport;
      end;
    end;
  finally
   frDoc.Free;
  end;
end.
