unit ssXLSExport;

interface

uses
  dxTL6, dxDBGrid6, dxDBCtrl6,
  SysUtils, Classes, XLSExportComp, XLSFile, XLSWorkbook, XLSFormat, Variants;

type

  TCellExportEvent = procedure (ANode: TdxTreeListNode; AIndex: Integer; XLSCell: TCell) of object;
  TssProgressEvent = procedure (AIndex: Integer; const AText: string) of object;

  TssXLSExport = class(TXLSExportCustomComponent)
    private
      FOnSaveTitle: TColumnTitleExportEvent;
      FOnSaveField: TCellExportEvent;
      FOnProgress: TssProgressEvent;
      FOnStartExport: TNotifyEvent;
      FOnFinishExport: TNotifyEvent;

    public
      procedure ExportGrid(ASheetIndex, ARow, AColumn: Integer; AGrid: TdxDBGrid; AFieldList: TStringList; const AFileName: string);
      procedure ExportPL(ASheetIndex, ARow, AColumn: Integer; AGrid: TdxDBGrid; AFieldList: TStringList; const AFileName, AHeader1, AHeader2, AHeader3, AHeader4, AFooter, AImgFName: string; GrpColor:integer);


    published
      property OnSaveTitle: TColumnTitleExportEvent read FOnSaveTitle write FOnSaveTitle;
      property OnSaveField: TCellExportEvent read FOnSaveField write FOnSaveField;
      property OnProgress: TssProgressEvent read FOnProgress write FOnProgress;
      property OnStartExport: TNotifyEvent read FOnStartExport write FOnStartExport;
      property OnFinishExport: TNotifyEvent read FOnFinishExport write FOnFinishExport;
  end;

//==================================================================================
implementation

uses 
  Graphics;

//==================================================================================
procedure TssXLSExport.ExportGrid(ASheetIndex, ARow, AColumn: Integer; AGrid: TdxDBGrid; AFieldList: TStringList; const AFileName: string);
  var
    S: TSheet;
    R, C, I, J: integer;
    CalcType: TTotalCalcType;
    CalcRange: string;
    ACol: TdxDBTreeListColumn;
    W: Integer;
begin
  if not Assigned(FXLSExportFile) then Exit;

  S := FXLSExportFile.Workbook.Sheets[ASheetIndex];

  if Assigned(FOnStartExport) then FOnStartExport(Self);

  with S do begin
    {save title}
    C := AColumn;
    R := ARow;
    for I := 0 to AFieldList.Count - 1 do begin
      if Integer(AFieldList.Objects[I]) = 1 then begin
        ACol := AGrid.ColumnByName(AFieldList[I]);
        Cells[R, C].Value := ACol.Caption;
        W := Length(ACol.Caption) + 4;
        if W > Columns[C].Width then Columns[C].Width := W;
        Cells[R, C].HAlign := TextAlignmentToXLSCellHAlignment(ACol.HeaderAlignment);
        Cells[R, C].FontBold := True;

        if Assigned(FOnSaveTitle) then FOnSaveTitle(I, Cells[R, C]);
        Inc(C);
      end;
    end;

    {save data}
    R := ARow + 1;
    for J := 0 to AGrid.Count - 1 do begin
      C := AColumn;
      for I := 0 to AFieldList.Count - 1 do begin
        if Integer(AFieldList.Objects[I]) = 1 then begin
          ACol := AGrid.ColumnByName(AFieldList[I]);
          Cells[R, C].Value := Trim(VarToStr(AGrid.Items[J].Values[ACol.Index]));
          Cells[R, C].HAlign := TextAlignmentToXLSCellHAlignment(ACol.Alignment);
          W := Length(VarToStr(Cells[R, C].Value)) + 2;
          if W > Columns[C].Width then Columns[C].Width := W;

          if Assigned(FOnSaveField) then
            FOnSaveField(AGrid.Items[J], ACol.Index, Cells[R, C]);
          Inc(C);
        end;
      end;
      if Assigned(FOnProgress) then FOnProgress(J, VarToStr(Cells[R, C].Value));
      Inc(R);
    end;

    {save totals}
    {if Assigned(FOnSaveFooter) then begin
      C:= AColumn;
      for I:= 0 to FDataSource.DataSet.FieldCount-1 do
      begin
        if ((not (eoptVisibleOnly in FOptions))
         or ((eoptVisibleOnly in FOptions) and FDataSource.DataSet.Fields[I].Visible)) then
        begin
          CalcRange:= ColIndexToColName(C) + IntToStr(ARow + 2) + ':' +
            ColIndexToColName(C) +  IntToStr(R);
          CalcType:= tcNone;
          Cells[R, C].HAlign:= TextAlignmentToXLSCellHAlignment(
            FDataSource.DataSet.Fields[I].Alignment);

          FOnSaveFooter(C, Cells[R, C], CalcType, CalcRange);

          case CalcType of
            tcNone:
              begin
                Cells[R, C].Clear;
              end;
            tcUserDef: ;
            else
              if CalcRange <> '' then
                Cells[R, C].Formula:= xlTotalCalcFunctions[CalcType] +
                  '(' + CalcRange + ')';
          end;

          Inc(C);
        end;
      end;
    end;}
  end;

  Self.FXLSExportFile.SaveToFile(AFileName);
  if Assigned(FOnFinishExport) then FOnFinishExport(Self);
end;

//==================================================================================
procedure TssXLSExport.ExportPL(ASheetIndex, ARow, AColumn: Integer; AGrid: TdxDBGrid;
    AFieldList: TStringList; const AFileName, AHeader1, AHeader2, AHeader3, AHeader4, AFooter, AImgFName: string; GrpColor:integer);
  var
    S: TSheet;
    R, C, I, J: integer;
    CalcType: TTotalCalcType;
    CalcRange: string;
    ACol: TdxDBTreeListColumn;
    W: Integer;
begin
  if not Assigned(FXLSExportFile) then Exit;

  S:= FXLSExportFile.Workbook.Sheets[ASheetIndex];

  if Assigned(FOnStartExport) then FOnStartExport(Self);

  with S do begin
    {save Headers}
    Cells[0, 2].Value :=AHeader1;
    Cells[0, 2].FontBold:=true;
    Cells[0, 2].FontHeight:=15;
    Cells[1, 2].Value :=AHeader2;
    Cells[2, 2].Value :=AHeader3;

    Cells[4, 2].Value :=AHeader4;
    Cells[4, 2].FontBold:=true;
    Cells[4, 2].FontHeight:=12;
    {save Image}
    if AImgFName<>EmptyStr then begin
      Images.Add(AImgFName,0,0);
    end;


    {save title}
    C := AColumn;
    R := ARow;
    for I := 0 to AFieldList.Count - 1 do begin
      if Integer(AFieldList.Objects[I]) = 1 then begin
        ACol := AGrid.ColumnByName(AFieldList[I]);
        Cells[R, C].Value := ACol.Caption;
        W := Length(ACol.Caption) + 4;
        if W > Columns[C].Width then Columns[C].Width := W;
        Cells[R, C].HAlign := TextAlignmentToXLSCellHAlignment(ACol.HeaderAlignment);
        Cells[R, C].FontBold := True;
        Cells[R, C].FontColorRGB:=clWhite;
        Cells[R, C].FillPattern:=xlPatternSolid;
        Cells[R, C].FillPatternBGColorRGB:=clGray;
        Cells[R, C].BorderColorRGB[xlBorderAll]:=clBlack;
        Cells[R, C].BorderStyle[xlBorderAll]:=bsThin;

        if Assigned(FOnSaveTitle) then FOnSaveTitle(I, Cells[R, C]);
        Inc(C);
      end;
    end;

    {save data}
    R := ARow + 1;
    for J := 0 to AGrid.Count - 1 do begin
      C := AColumn;
      for I := 0 to AFieldList.Count - 1 do begin
        if Integer(AFieldList.Objects[I]) = 1 then begin
          ACol := AGrid.ColumnByName(AFieldList[I]);
          Cells[R, C].Value := Trim(VarToStr(AGrid.Items[J].Values[ACol.Index]));
          Cells[R, C].HAlign := TextAlignmentToXLSCellHAlignment(ACol.Alignment);
          if AGrid.Items[j].Values[AGrid.FindColumnByFieldName('isgroup').Index]=1 then begin
            Cells[R, C].FillPattern:=xlPatternSolid;
            Cells[R, C].FillPatternBGColorRGB:=GrpColor;
          end;
          Cells[R, C].BorderColorRGB[xlBorderAll]:=clBlack;
          Cells[R, C].BorderStyle[xlBorderAll]:=bsThin;


          W := Length(VarToStr(Cells[R, C].Value)) + 2;
          if W > Columns[C].Width then Columns[C].Width := W;

          if Assigned(FOnSaveField) then
            FOnSaveField(AGrid.Items[J], ACol.Index, Cells[R, C]);
          Inc(C);
        end;
      end;
      if Assigned(FOnProgress) then FOnProgress(J, VarToStr(Cells[R, C].Value));
      Inc(R);
    end;//for
    {save footer}
    Cells[R, 1].Value :=AFooter;
    Cells[R, 1].FontBold:=true;
    Cells[R, 0].FontItalic:=true;

    {save totals}
    {if Assigned(FOnSaveFooter) then
    begin
      C:= AColumn;
      for I:= 0 to FDataSource.DataSet.FieldCount-1 do
      begin
        if ((not (eoptVisibleOnly in FOptions))
         or ((eoptVisibleOnly in FOptions) and FDataSource.DataSet.Fields[I].Visible)) then
        begin
          CalcRange:= ColIndexToColName(C) + IntToStr(ARow + 2) + ':' +
            ColIndexToColName(C) +  IntToStr(R);
          CalcType:= tcNone;
          Cells[R, C].HAlign:= TextAlignmentToXLSCellHAlignment(
            FDataSource.DataSet.Fields[I].Alignment);

          FOnSaveFooter(C, Cells[R, C], CalcType, CalcRange);

          case CalcType of
            tcNone:
              begin
                Cells[R, C].Clear;
              end;
            tcUserDef: ;
            else
              if CalcRange <> '' then
                Cells[R, C].Formula:= xlTotalCalcFunctions[CalcType] +
                  '(' + CalcRange + ')';
          end;

          Inc(C);
        end;
      end;
    end;
    }
  end;

  Self.FXLSExportFile.SaveToFile(AFileName);
  if Assigned(FOnFinishExport) then FOnFinishExport(Self);
end;

end.
