unit ssExcel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ssWaitForExcel{, VCLUtils};

type
 TOnProcessEvent = function(Sender: TObject;
                            ProcessID : integer;
                            FWait : TfrmWaitForExcel) : boolean of object;
  TVertAlignment = (vaTopJustify, vaCenter, vaBottomJustify);

type
  TssExcel = class(TComponent)
  private
    { Private declarations }
    FExcelApp,
    FWorkBook,
    FWorkSheet,
    FCells : Variant;
//    FCache : TDispInvokeCache;

    FOnProcess : TOnProcessEvent;

    FDefFont : TFont;
    FHorAlign : TAlignment;
    FVertAlign : TVertAlignment;

    FAlreadyOpened, //был открыт до нас?
    FAlreadyVisible,

    FBeforeFirstSave,
    FConnected,
    FShowProgress,
    FVisible : boolean;
    FFileName,
    FInternalVersion,
    FVersion : string;
    FRows: Variant;
    function GetWorkBook : Variant;
    function GetWorkSheet : Variant;

    procedure SetConnected(Value : boolean);
    procedure SetVisible(Value : boolean);
    procedure SetVersion(Value : string);

    procedure ClearOleObjects;
  protected
    { Protected declarations }
    function DoConnect : boolean; dynamic;
    function DoDisconnect : boolean; dynamic;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    property ExcelApp : Variant read FExcelApp write FExcelApp;
    property WorkBook : Variant read FWorkBook write FWorkBook;
    property WorkSheet : Variant read FWorkSheet write FWorkSheet;
    property Cells : Variant read FCells write FCells;
    property Rows : Variant read FRows write FRows;

    property InternalVersion : string read FInternalVersion;

    procedure OpenWorkBook(FileName : string);
    procedure CreateWorkBook;
    procedure SaveWorkBook; //сохран€ет под именем, указанным в FileName
    procedure SaveWorkBookAs(AFileName : string);
    procedure CloseWorkBook(WithSave : boolean);

    { Left €чейка в Top строке }

    { записывает Value в €чейку с координатами Left, Top
      с настройками по умолчанию }
    procedure Put(Left, Top : integer; Value : variant);
    procedure PutLeft(Left, Top : integer; Value : variant);
    procedure PutRight(Left, Top : integer; Value : variant);
    procedure PutCenter(Left, Top : integer; Value : variant);

    procedure PutW(Left, Top : integer; Value : variant);
    procedure PutLeftW(Left, Top : integer; Value : variant);
    procedure PutRightW(Left, Top : integer; Value : variant);
    procedure PutCenterW(Left, Top : integer; Value : variant);

    { аналогично Put, только с разворотом на 90 градусов }
    procedure Put90(Left, Top : integer; Value : variant);
    { записывает Value в €чейку с координатами Left, Top
      с указанными параметрами шрифта }
    procedure PutFont(Left, Top : integer; Value : variant;
                      FontName : string; FontSize : integer;
                      FontColor : TColor; FontStyle : TFontStyles);
    procedure PutFontLeft(Left, Top : integer; Value : variant;
                      FontName : string; FontSize : integer;
                      FontColor : TColor; FontStyle : TFontStyles);
    procedure PutFontRight(Left, Top : integer; Value : variant;
                      FontName : string; FontSize : integer;
                      FontColor : TColor; FontStyle : TFontStyles);
    procedure PutFontCenter(Left, Top : integer; Value : variant;
                      FontName : string; FontSize : integer;
                      FontColor : TColor; FontStyle : TFontStyles);

    procedure PutFontW(Left, Top: integer; Value : variant;
                      FontName : string; FontSize : integer;
                      FontColor : TColor; FontStyle : TFontStyles);
    procedure PutFontLeftW(Left, Top: integer; Value : variant;
                      FontName : string; FontSize : integer;
                      FontColor : TColor; FontStyle : TFontStyles);
    procedure PutFontRightW(Left, Top: integer; Value : variant;
                      FontName : string; FontSize : integer;
                      FontColor : TColor; FontStyle : TFontStyles);
    procedure PutFontCenterW(Left, Top: integer; Value : variant;
                      FontName : string; FontSize : integer;
                      FontColor : TColor; FontStyle : TFontStyles);

    { Put с установкой ширины }
    procedure PutWidth(Left, Top, Width : integer; Value : variant);
    { Put с установкой ширины и WordWrap }
    procedure PutWidthW(Left, Top, Width : integer; Value : variant);

    { сетка/рамка в указанном диапазоне}
    procedure Frame(Left, Top, Right, Bottom : integer);
    procedure FrameGrid(Left, Top, Right, Bottom : integer);
    {включение/выключение переноса слов дл€ указанной €чейки }
    procedure WordWrap(Left, Top : integer; Value : boolean);
    procedure RowHeight(Row : integer; Value : integer);
    procedure ColWidth(Left, Top : integer; Value : integer);

    //выравнивание в €чейке
    procedure CellHorAlign(Left, Top : integer; Align : TAlignment);
    procedure CellVertAlign(Left, Top : integer; Align : TVertAlignment);

    procedure Preview;

    function RunProcess(ProcessID : integer) : boolean;
  published
    { Published declarations }
    property Connected : boolean read FConnected write SetConnected;
    property Visible : boolean read FVisible write SetVisible;
    property ShowProgress : boolean read FShowProgress write FShowProgress;
    property Version : string read FVersion write SetVersion;

    property FileName : string read FFileName write FFileName;
    property Font : TFont read FDefFont write FDefFont;
    property HorAlign : TAlignment read FHorAlign write FHorAlign default taLeftJustify;
    property VertAlign : TVertAlignment read FVertAlign write FVertAlign default vaCenter;
    property OnProcess : TOnProcessEvent read FOnProcess write FOnProcess;
  end;

implementation

uses ComObj, ssExcelConst, Variants;

resourcestring
 rsUnableToStart = 'Unable to start Excel.';
 rsExcelNotStarted = 'Excel not started.';

 rsWaitForExportInfo = 'Export into Excel in progress...';
 rsUnknown = '<unknown>';

constructor TssExcel.Create(AOwner : TComponent);
begin
 inherited Create(AOwner);

 FExcelApp:=UnAssigned;
 FWorkBook:=UnAssigned;
 FWorkSheet:=UnAssigned;
 FVersion:=rsUnknown;

 FBeforeFirstSave:=true;

 FDefFont:=TFont.Create;

 FHorAlign:=taLeftJustify;
 FVertAlign:=vaCenter;
end;

destructor TssExcel.Destroy;
begin
 if not VarIsEmpty(ExcelApp) then
  try
   if not VarIsEmpty(WorkBook) then CloseWorkBook(false);
   if not FAlreadyOpened then ExcelApp.Quit;
  except
  end;

 FDefFont.Free;
  
 inherited Destroy;
end;

function TssExcel.GetWorkBook : Variant;
begin
 if VarIsEmpty(FWorkBook) then begin
   ExcelApp.WorkBooks.Add;
   FWorkBook:=ExcelApp.ActiveWorkBook;
   FBeforeFirstSave:=true;
   FileName:=WorkBook.Name;
  end;

 Result:=FWorkBook;
end;

procedure TssExcel.SetVersion(Value : string);
begin
end;

function TssExcel.GetWorkSheet : Variant;
begin
 if VarIsEmpty(FWorkSheet) then begin
   FWorkBook:=GetWorkBook;
   FWorkSheet:=WorkBook.ActiveSheet;
   FCells := FWorkSheet.Cells;
   FRows := FWorkSheet.Rows;
  end;
 Result:=FWorkSheet;
end;

function TssExcel.DoConnect : boolean;
begin
 ExcelApp:=Unassigned;
 Result:=false;

 FAlreadyOpened:=false;
 FAlreadyVisible:=false;

 try
  ExcelApp:=GetActiveOleObject(OleClassName);
  Result:=True;
  FAlreadyOpened:=true; //был открыт до нас?
  FAlreadyVisible:=ExcelApp.Visible;
 except
 end;

 if not Result then
  try
   ExcelApp:=CreateOLEObject(OleClassName);
   Result:=True;
  except
   MessageDlg(rsUnableToStart, mtError, [mbOK], 0);
   raise;
  end;

 if Result then begin
//   FCache:=TDispInvokeCache.Create;
//   FCache.Reset(ExcelApp);

   if not FAlreadyOpened then ExcelApp.Visible:=Visible;

   FVersion:=ExcelApp.Version;
   FInternalVersion:=copy(FVersion, 1, 1);

   ExcelVersion:=StrToIntDef(FInternalVersion, 8);
  end;
end;

function TssExcel.DoDisconnect : boolean;
begin
 try
//  FCache.Free;
  CloseWorkBook(false);

  if not FAlreadyOpened
   then ExcelApp.Quit
   else ExcelApp.Visible:=FAlreadyVisible;

  ExcelApp:=UnAssigned;

  Result:=true;
 except
  raise
 end;
end;

procedure TssExcel.SetConnected(Value : boolean);
begin
 if FConnected=Value then exit;

 if Value
  then FConnected:=DoConnect
  else FConnected:=not DoDisconnect;
end;

procedure TssExcel.SetVisible(Value : boolean);
begin
 if not VarIsEmpty(ExcelApp) then
  try
   ExcelApp.Visible:=Value;
  except
  end;

 FVisible:=Value;
end;

function TssExcel.RunProcess(ProcessID : integer) : boolean;
var
 FWait : TfrmWaitForExcel;
 DWPtr : pointer;
{ I1, I2 : string;}
begin
 FWait :=nil; DWPtr :=nil;
 if ShowProgress then
  FWait:=TfrmWaitForExcel.Create(Application);
 try
  if ShowProgress then begin
    FWait.Show;
    FWait.UpDate;
    DWPtr:=DisableTaskWindows(FWait.Handle);
    FWait.Info:=rsWaitForExportInfo;
    FWait.AddInfo:=EmptyStr;
   end;

  if Assigned(OnProcess) then
   if ShowProgress
    then Result:=OnProcess(Self, ProcessID, FWait)
    else Result:=OnProcess(Self, ProcessID, Nil)
  else
   Result:=false;
   
 finally
  if ShowProgress then begin
    EnableTaskWindows(DWPtr);

    FWait.Hide;
    FWait.Free;
   end;
 end;
end;

procedure TssExcel.CreateWorkBook;
begin
 if not Connected then Connected:=true;
 GetWorkSheet;
end;

procedure TssExcel.SaveWorkBookAs(AFileName : string);
begin
 try
  FileName:=AFileName;
  WorkBook.SaveAs(FileName);
  FBeforeFirstSave:=false;
 except
//  MessageDlg('Error saving 
 end;
end;

procedure TssExcel.SaveWorkBook;
begin
 try
  if FBeforeFirstSave
   then begin
     SaveWorkBookAs(FileName);
     FBeforeFirstSave:=false;
    end
   else WorkBook.Save;
 except
  raise
 end;
end;

procedure TssExcel.ClearOleObjects;
begin
 WorkSheet:=UnAssigned;
 WorkBook:=UnAssigned;
 Cells:=UnAssigned;
 Rows:=UnAssigned;
end;

procedure TssExcel.CloseWorkBook(WithSave : boolean);
begin
 if not Connected then exit;
 if VarIsEmpty(WorkBook) then exit;

 if WithSave then
  try
   WorkBook.Save(FileName);
  except
  end;

 try
   WorkBook.Close;
 except
 end;  

 ClearOleObjects;
end;

procedure TssExcel.OpenWorkBook(FileName : string);
begin
 if not Connected then Connected:=true;
 FWorkBook := ExcelApp.WorkBooks.Open(FileName, False);

// FWorkBook:=ExcelApp.ActiveWorkBook;

 FWorkSheet:=ExcelApp.ActiveSheet;
 FCells:=FWorkSheet.Cells;
 FRows:=FWorkSheet.Rows;
end;

procedure TssExcel.Put(Left, Top : integer; Value : variant);
begin
// FWorkSheet.Cells[Top, Left].NumberFormat:='General';
// FWorkSheet.Cells[Top, Left].NumberFormat:='@';

 FWorkSheet.Cells[Top, Left].Value:=Value;
 SetCellsFont(WorkSheet, ExcelRectToStr(Left, Top, Left, Top),
              Font.Name, Font.Size, Font.Color, Font.Style);

 CellHorAlign(Left, Top, HorAlign);
 CellVertAlign(Left, Top, VertAlign);
end;

procedure TssExcel.PutWidth(Left, Top, Width : integer; Value : variant);
begin
 Put(Left, Top, Value);
 ColWidth(Left, Top, Width);
end;

procedure TssExcel.PutWidthW(Left, Top, Width : integer; Value : variant);
begin
 Put(Left, Top, Value);
 ColWidth(Left, Top, Width);
 WordWrap(Left, Top, true);
end;

procedure TssExcel.Put90(Left, Top : integer; Value : variant);
begin
 Put(Left, Top, Value);
 WorkSheet.Cells[Top, Left].Orientation:=90;
end;

procedure TssExcel.WordWrap(Left, Top : integer; Value : boolean);
begin
 WorkSheet.Cells[Top, Left].WrapText:=Value;
end;

procedure TssExcel.PutFont(Left, Top : integer; Value : variant;
                      FontName : string; FontSize : integer;
                      FontColor : TColor; FontStyle : TFontStyles);
begin
// FWorkSheet.Cells[Top, Left].NumberFormat:='@';
 FWorkSheet.Cells[Top, Left].Value:=Value;

 SetCellsFont(WorkSheet, ExcelRectToStr(Left, Top, Left, Top),
              FontName, FontSize, FontColor, FontStyle);

 CellHorAlign(Left, Top, HorAlign);
 CellVertAlign(Left, Top, VertAlign);
end;

procedure TssExcel.RowHeight(Row : integer; Value : integer);
begin
 WorkSheet.Rows[Row].RowHeight:=Value;
end;

procedure TssExcel.ColWidth(Left, Top : integer; Value : integer);
begin
 WorkSheet.Cells[Top, Left].ColumnWidth:=Value;
end;

procedure TssExcel.Frame(Left, Top, Right, Bottom : integer);
var
 Rect : string;
begin
 Rect:=ExcelRectToStr(Left, Top, Right, Bottom);
 SetCellsBorder(WorkSheet, Rect, xlContinuous, xlThin);
end;

procedure TssExcel.FrameGrid(Left, Top, Right, Bottom : integer);
var
 Rect : string;
begin
 Rect:=ExcelRectToStr(Left, Top, Right, Bottom);
// SetSolidCellsBorder(WorkSheet, Rect, xlContinuous, xlThin);
end;

procedure TssExcel.Preview;
begin
 try
  if not Visible then ExcelApp.Visible:=true;
  WorkBook.PrintPreview;
 finally
  if not Visible then ExcelApp.Visible:=false;
 end;
end;

procedure TssExcel.CellHorAlign(Left, Top : integer; Align : TAlignment);
begin
 case Align of
    taLeftJustify : WorkSheet.Cells[Top, Left].HorizontalAlignment:=xlLeft;
   taRightJustify : WorkSheet.Cells[Top, Left].HorizontalAlignment:=xlRight;
         taCenter : WorkSheet.Cells[Top, Left].HorizontalAlignment:=xlCenter;
  end;
end;

procedure TssExcel.CellVertAlign(Left, Top : integer; Align : TVertAlignment);
begin
 case Align of
      vaTopJustify : WorkSheet.Cells[Top, Left].VerticalAlignment:=xlVAlignTop;
   vaBottomJustify : WorkSheet.Cells[Top, Left].VerticalAlignment:=xlVAlignBottom;
          vaCenter : WorkSheet.Cells[Top, Left].VerticalAlignment:=xlVAlignCenter;
  end;
end;

procedure TssExcel.PutLeft(Left, Top : integer; Value : variant);
begin
 Put(Left, Top, Value);
 CellHorAlign(Left, Top, taLeftJustify);
end;

procedure TssExcel.PutRight(Left, Top : integer; Value : variant);
begin
 Put(Left, Top, Value);
 CellHorAlign(Left, Top, taRightJustify);
end;

procedure TssExcel.PutCenter(Left, Top : integer; Value : variant);
begin
 Put(Left, Top, Value);
 CellHorAlign(Left, Top, taCenter);
end;

procedure TssExcel.PutLeftW(Left, Top : integer; Value : variant);
begin
 Put(Left, Top, Value);
 CellHorAlign(Left, Top, taLeftJustify);
 WordWrap(Left, Top, true);
end;

procedure TssExcel.PutRightW(Left, Top : integer; Value : variant);
begin
 Put(Left, Top, Value);
 CellHorAlign(Left, Top, taRightJustify);
 WordWrap(Left, Top, true);
end;

procedure TssExcel.PutCenterW(Left, Top : integer; Value : variant);
begin
 Put(Left, Top, Value);
 CellHorAlign(Left, Top, taCenter);
 WordWrap(Left, Top, true);
end;

procedure TssExcel.PutFontLeft(Left, Top : integer; Value : variant;
                      FontName : string; FontSize : integer;
                      FontColor : TColor; FontStyle : TFontStyles);
begin
 PutFont(Left, Top, Value, FontName, FontSize, FontColor, FontStyle);
 CellHorAlign(Left, Top, taLeftJustify);
end;

procedure TssExcel.PutFontRight(Left, Top : integer; Value : variant;
                      FontName : string; FontSize : integer;
                      FontColor : TColor; FontStyle : TFontStyles);
begin
 PutFont(Left, Top, Value, FontName, FontSize, FontColor, FontStyle);
 CellHorAlign(Left, Top, taRightJustify);
end;

procedure TssExcel.PutFontCenter(Left, Top : integer; Value : variant;
                      FontName : string; FontSize : integer;
                      FontColor : TColor; FontStyle : TFontStyles);
begin
 PutFont(Left, Top, Value, FontName, FontSize, FontColor, FontStyle);
 CellHorAlign(Left, Top, taCenter);
end;

procedure TssExcel.PutFontLeftW(Left, Top: integer; Value : variant;
                      FontName : string; FontSize : integer;
                      FontColor : TColor; FontStyle : TFontStyles);
begin
 PutFont(Left, Top, Value, FontName, FontSize, FontColor, FontStyle);
 CellHorAlign(Left, Top, taLeftJustify);
 WordWrap(Left, Top, true);
end;

procedure TssExcel.PutFontRightW(Left, Top: integer; Value : variant;
                      FontName : string; FontSize : integer;
                      FontColor : TColor; FontStyle : TFontStyles);
begin
 PutFontW(Left, Top, Value, FontName, FontSize, FontColor, FontStyle);
 CellHorAlign(Left, Top, taRightJustify);
 WordWrap(Left, Top, true);
end;

procedure TssExcel.PutFontCenterW(Left, Top: integer; Value : variant;
                      FontName : string; FontSize : integer;
                      FontColor : TColor; FontStyle : TFontStyles);
begin
 PutFontW(Left, Top, Value, FontName, FontSize, FontColor, FontStyle);
 CellHorAlign(Left, Top, taCenter);
 WordWrap(Left, Top, true);
end;

procedure TssExcel.PutW(Left, Top : integer; Value : variant);
begin
 Put(Left, Top, Value);
 WordWrap(Left, Top, true);
end;

procedure TssExcel.PutFontW(Left, Top: integer; Value : variant;
                      FontName : string; FontSize : integer;
                      FontColor : TColor; FontStyle : TFontStyles);
begin
 PutFont(Left, Top, Value, FontName, FontSize, FontColor, FontStyle);
 WordWrap(Left, Top, true);
end;

end.
