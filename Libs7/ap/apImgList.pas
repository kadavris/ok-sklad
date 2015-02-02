{
apImgList: Simple image lister and selector
Copyright by Andrej Pakhutin
}
unit apImgList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtDlgs, ExtCtrls, StdCtrls, ActnList, ComCtrls, Menus, xLngManager,
  {$IFDEF USEDB}
  DB, DBTables, 
  {$ENDIF}
  jpeg;

type
  {TapimgListDBProps = class
  protected
    FdataSource: TDataSource;
    FprovLoad, FprovSave: string;
    FblobFieldName: String;
    FdefaultFieldName: String;
    FpostToWebFieldName: String;

    FonBeforeDBUpdate: TNotifyEvent;
    FonDBError: TNotifyEvent;
  published
    property DBdataSource: TDataSource read FdataSource write FdataSource;
    property imageFieldName: String read FblobFieldName write FblobFieldName;
    property defaultFieldName: String read FbdefaultFieldName write FdefaultFieldName;
    property postToWebFieldName: String read FpostToWebFieldName write FpostToWebFieldName;

  end;
  }

  //-----------------------------------------------------------------------
  TapImgList = class(TPanel)
    pmImages: TPopupMenu;
    miImgAdd: TMenuItem;
    miImgDefault: TMenuItem;
    miImgDel: TMenuItem;
    aImgAdd: TAction;
    aImgDel: TAction;
    aImgDefault: TAction;
    OpenPictureDialog1: TOpenPictureDialog;
    TrackBarW, TrackBarH: TTrackBar;
    sbImages: TScrollBox;
    DefaultMark: TImage;

    procedure aImgAddExecute(Sender: TObject);
    procedure aImgDefaultExecute(Sender: TObject);
    procedure aImgDelExecute(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pmImagesPopup(Sender: TObject);
    procedure sbImagesMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure switchDel(Sender: TObject);

  private
    imgListOrig: array of TMemoryStream; // originals
    imgList: array of TImage; // what is displayed
    imgListDeletedImages: array of TImage; // "delete" buttons
    imgListSel: array of TImage; // selection overlays
    imgListWebImages: array of TImage; // buttons: "post to web"

    imgListID: array of Integer;
    imgListWebState: array of Boolean; // "post to web" state
    imgListDeleted: array of Boolean; // "is deleted" state
    imgListNew: array of Boolean;     // "is new" state
    imgListModified: array of Boolean; // "is modified" state

    imgListLastClicked: Integer;
    imgListDefault: Integer;

    Fcount: Integer;
    FlangMan: TxLngManager;
    FiconHeight, FiconWidth: Integer;

    FLeft, FTop, FWidth, FHeight: Integer;

    FshowPostToWeb: Boolean;
    FshowDelete: Boolean;
    FallowEditing: Boolean;

    FJPEGsOnly: Boolean;

    // evants
    FonChange: TNotifyEvent;
    FonDefaultSet: TNotifyEvent;
    FonSelect: TNotifyEvent;
    FonImageFileLoaded: TNotifyEvent;
    FonImageFileDeleted: TNotifyEvent;

    {$IFDEF USEDB}
    //DB: TapImgListDBProps;
    FdataSet: TDataSet;
    FprovLoad, FprovSave: string;
    FblobFieldName: String;
    FdefaultFieldName: String;
    FpostToWebFieldName: String;

    FonBeforeDBAppend: TNotifyEvent;
    FonBeforeDBPost: TNotifyEvent;
    FonDBError: TNotifyEvent;
    {$ENDIF}

    procedure SetCaptions;
    procedure deselectImages;
    procedure selectImage(const idx: Integer; sel: Boolean);
    // add another image of product to the viewer. returns image index
    function AddImage(var img: Timage; APostToWeb: Boolean; var Astream: TMemoryStream; const AID: Integer = -1): Integer;
    procedure DelImage(idx: Integer; Value: Boolean);
    procedure SetDefaultImage(const idx: Integer); // add default mark on the image of product @ the viewer
    procedure tbChanged(Sender: TObject);
    procedure sbImagesResize(Sender: TObject);
    procedure panelConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
    procedure switchPostToweb(Sender: TObject);
    procedure setImagePosition(const idx: Integer);
    procedure repositionImages;
    procedure repositionImageButtons(const i: Integer);
    procedure repaintImage(const idx: Integer);

    procedure SetCount(const newc: Integer);
    procedure SetLangMan(const nlm: TxLngManager);

    procedure SetIconHeight(const h: Integer);
    procedure SetIconWidth(const w: Integer);

    function GetNew(idx: Integer): Boolean;
    function GetModified(idx: Integer): Boolean;

    function GetPostToWeb(idx: Integer): Boolean;
    procedure SetPostToWeb(idx: Integer; Value: Boolean);

    function GetSelected(const idx: Integer): Boolean;
    procedure SetSelected(const idx: Integer; const Value: Boolean);

    function Getdeleted(idx: Integer): Boolean;

    function GetBitmap(idx: Integer): TBitmap;
    procedure SetBitmap(idx: Integer; Value: TBitmap);

    function GetStream(idx: Integer): TStream;
    procedure SetStream(idx: Integer; Value: TStream);

    function GetID(idx: Integer): Integer;
    procedure SetID(idx: Integer; Value: Integer);

    {$IFDEF USEDB}
    procedure newImage;
    procedure SetDataSet(Value: TDataSet);
    {$ENDIF}

    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;

  protected

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ClearAll;

    {$IFDEF USEDB}
    procedure loadDBImages;
    procedure saveDBImages;
    {$ENDIF}

    // returns the index of added image
    function AddFromStream(const stream: TStream; const AID: Integer = -1): Integer;

    property DefaultIndex: Integer read imgListDefault write SetDefaultImage;
    property Count: Integer read FCount;// write SetCount;
    property PostToWeb[idx: Integer]: Boolean read GetPostToWeb write SetPostToWeb;
    property isNew[idx: Integer]: Boolean read GetNew;
    property isDeleted[idx: Integer]: Boolean read GetDeleted write DelImage;
    property isModified[idx: Integer]: Boolean read GetModified;
    property Bitmaps[idx: Integer]: TBitmap read GetBitmap write SetBitmap; default;
    property Stream[idx: Integer]: TStream read GetStream write SetStream;
    property Selected[const idx: Integer]: Boolean read GetSelected write SetSelected;
    property ID[idx: Integer]: Integer read GetID write SetID;

    property DockManager; // from tpanel

  published

    property langMan: TxLngManager read FlangMan write SetLangMan;
    property iconWidth: Integer read FiconWidth write setIconWidth;
    property iconHeight: Integer read FiconHeight write setIconHeight;

    property showPostToWeb: Boolean read FshowPostToWeb write FshowPostToWeb;
    property showDelete: Boolean read FshowDelete write FshowDelete;
    property allowEditing: Boolean read FallowEditing write FallowEditing;
    property JPEGsOnly: Boolean read FJPEGsOnly write FJPEGsOnly;

    property onChange: TNotifyEvent read FonChange write FonChange;
    property onDefaultSet: TNotifyEvent read FonDefaultSet write FonDefaultSet;
    property onSelect: TNotifyEvent read FonSelect write FonSelect;
    property onImageFileLoaded: TNotifyEvent read FonImageFileLoaded write FonImageFileLoaded;
    property onImageFileDeleted: TNotifyEvent read FonImageFileDeleted write FonImageFileDeleted;

    {$IFDEF USEDB}
    //property DB: TapimgListDBProps read DB write DB;

    property DBdataSet: TDataSet read FdataSet write setDataSet;
    property DBimageFieldName: String read FblobFieldName write FblobFieldName;
    property DBdefaultFieldName: String read FdefaultFieldName write FdefaultFieldName;
    property DBpostToWebFieldName: String read FpostToWebFieldName write FpostToWebFieldName;

    property onBeforeDBAppend: TNotifyEvent read FonBeforeDBAppend write FonBeforeDBAppend;
    property onBeforeDBPost: TNotifyEvent read FonBeforeDBPost write FonBeforeDBPost;
    {$ENDIF}

    // from TPanel:
    property Left;
    property Top;
    property Width;
    property Height;

    property Align;
    property Alignment;
    property Anchors;
    property AutoSize;
    property BevelInner;
    property BevelOuter;
    property BevelWidth;
    property BiDiMode;
    property BorderWidth;
    property BorderStyle;
    property Caption;
    property Color;
    property Constraints;
    property Ctl3D;
    property UseDockManager default True;
    property DockSite;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FullRepaint;
    property Font;
    property Locked;
    property ParentBiDiMode;
    property ParentBackground;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    //property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDockDrop;
    property OnDockOver;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetSiteInfo;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
  end;

procedure Register;

implementation

{$R *.res}

//==============================================================================================
procedure Register;
begin
  RegisterComponents('AP', [TapImgList]);
end;

//==============================================================================================
constructor TapImgList.Create(AOwner: TComponent);
begin

  inherited;
  FiconHeight := 100;
  FiconWidth := 100;

  {
  Panel := TPanel.Create(Owner);
  with Panel do begin
    Width := 200; Height := 200;
    Parent := pointer(AOwner);
    OnConstrainedResize := panelConstrainedResize;
    OnResize := sbImagesResize;
  end;
  }

  TrackBarW := TTrackBar.Create(Self);
  with TrackBarW do begin
    Parent := Self;
    Height := 20;
    Frequency := 10;
    Linesize := 10;
    Pagesize := 50;
    Orientation := trHorizontal;
    Max := 300;
    Min := 100;
    Position := FiconWidth;
    ThumbLength := 15;
    OnChange := tbChanged;
  end;

  TrackBarH := TTrackBar.Create(Self);
  with TrackBarH do begin
    Parent := Self;
    Top := 0;
    Height := 20;
    Frequency := 10;
    Linesize := 10;
    Pagesize := 50;
    Orientation := trVertical;
    Max := 300;
    Min := 100;
    Position := FiconHeight;
    ThumbLength := 15;
    OnChange := tbChanged;
  end;

  sbImages := TScrollBox.Create(Self);
  with sbImages do begin
    Parent := Self;
    OnMouseDown := sbImagesMouseDown;
  end;

  aImgAdd := TAction.Create(Self);
  aImgAdd.OnExecute := aImgAddExecute;
  aImgAdd.Caption := 'Add';
  aImgDel := TAction.Create(Self);
  aImgDel.OnExecute := aImgDelExecute;
  aImgDel.Caption := 'Del';
  aImgDefault := TAction.Create(Self);
  aImgDefault.OnExecute := aImgDefaultExecute;
  aImgDefault.Caption := 'Default';

  miImgAdd := TMenuItem.Create(pmImages);
  miImgAdd.Action := aImgAdd;
  miImgDefault := TMenuItem.Create(pmImages);
  miImgDefault.Action := aImgdefault;
  miImgDel := TMenuItem.Create(pmImages);
  miImgDel.Action := aImgDel;

  pmImages := TPopupMenu.Create(sbImages);
  pmImages.OnPopup := pmImagesPopup;
  pmImages.Items.Add(miImgAdd);
  pmImages.Items.Add(miImgDefault);
  pmImages.Items.Add(miImgDel);

  OpenPictureDialog1 := TOpenPictureDialog.Create(sbImages);

  DefaultMark := TImage.Create(sbImages);
  with DefaultMark do begin
    Parent := sbImages;
    Picture.Bitmap := TBitmap.Create;
    Picture.Bitmap.LoadFromResourceName(Hinstance, 'CHECK');
    Width := Picture.Bitmap.Width;
    Height := Picture.Bitmap.Height;
    Transparent := True;
    Visible := False;
  end;

  imgListLastClicked := -1;
  imgListDefault := -1;
  Fcount := 0;
  FlangMan := nil;

  {$IFDEF USEDB}
  FdataSet := nil;
  FprovLoad := ''; FprovSave := '';
  FblobFieldName := '';
  FdefaultFieldName := '';
  FpostToWebFieldName := '';

  FonBeforeDBAppend := nil;
  FonBeforeDBPost := nil;
  FonDBError := nil;
  {$ENDIF}

  FJPEGsOnly := False;
  FshowPostToWeb := True;
  FshowDelete := True;
  FallowEditing := True;

  sbImagesResize(nil); // set controls in places

end;


//==============================================================================================
destructor TapImgList.Destroy;
  var
    i: integer;
begin
  {DefaultMark.Free;
  for i := 0 to Fcount - 1 do begin
    imgList[i].Free;
    imgListWebImages[i].Free;
  end;
  sbImages.Free;
  }
  inherited;
end;

//==============================================================================================
function BoolToInt(v: Boolean): Integer;
begin
  if V then Result := 1 else Result := 0;
end;

//==============================================================================================
procedure TapImgList.WMSize(var Message: TWMSize);
begin
  inherited;
  sbImagesResize(nil);
end;

//==============================================================================================
procedure TapImgList.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
  inherited;
  sbImagesResize(nil);
end;

//==============================================================================================
procedure TapImgList.sbImagesResize(Sender: TObject);
  var
    BevelPixels: Integer;
begin
  inherited;

  BevelPixels := BorderWidth;
  if BevelInner <> bvNone then Inc(BevelPixels, BevelWidth);
  if BevelOuter <> bvNone then Inc(BevelPixels, BevelWidth);

  // setting main buttons

  // setting trackbars
  with TrackBarW do begin // horizontal, width setting. at the bottom of panel
    Left := BevelPixels;
    Width := Self.Width - 2 * BevelPixels - TrackBarH.Width;
    Top := Self.Height - Height - BevelPixels;
  end;

  with TrackBarH do begin // vertical, height setting. rightmost on the panel
    Top := BevelPixels;
    Left := Self.Width - Width - BevelPixels;
    Height := Self.Height - 2 * BevelPixels - TrackBarW.Height;
  end;

  with sbImages do begin
    Top := BevelPixels;
    Left := BevelPixels;
    Width := TrackBarH.Left - 1;
    Height := TrackBarW.Top - 1;
  end;

  {$IFNDEF PKG}
  repositionImages;
  {$ENDIF}
end;

//==============================================================================================
procedure TapImgList.panelConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
begin
  MinWidth := 120; MinHeight := 120;
end;

//==============================================================================================
procedure TapImgList.ClearAll;
  var
    i: Integer;
begin
  for i := 0 to Fcount - 1 do begin
    imgList[i].Picture.Bitmap.Free;
    imgList[i].Free;

    imgListDeletedImages[i].Picture.Bitmap.Free;
    imgListDeletedImages[i].Free;

    imgListWebImages[i].Picture.Bitmap.Free;
    imgListWebImages[i].Free;

    imgListSel[i].Picture.Bitmap.Free;
    imgListSel[i].Free;
  end;
  SetLength(imgListDeleted, 0);
  SetLength(imgListWebState, 0);
  SetLength(imgList, 0);
  SetLength(imgListDeletedImages, 0);
  SetLength(imgListSel, 0);
  SetLength(imgListWebImages, 0);

  imgListLastClicked := -1;
  imgListDefault := -1;
  Fcount := 0;
end;

//==============================================================================================
{$IFDEF USEDB}
procedure TapImgList.loadDBImages;
  var
    Stream: TStream;
begin
  if (FdataSet = nil){ or (FprovLoad = '')} then Exit;
  ClearAll;
  try
    with FdataSet do begin
      Open;
      First;
      while not Eof do begin
        newImage;
        Stream := CreateBlobStream(FieldByName(FblobFieldName) as TBlobField, bmRead);
        imgList[Fcount - 1].Picture.Bitmap.LoadFromStream(Stream);
        this is incorrect !
        imgListOrig[Fcount - 1] := Stream;
        inc(Fcount);

        if FieldByName(FdefaultFieldName).AsInteger <> 0
          then SetDefaultImage(Fcount - 1);
        SetPostToWeb(Fcount - 1, (0 <> FieldByName(FpostToWebFieldName).AsInteger));

        Next;
      end;
      Close;
    end;
  except
    if assigned(FonDBError)
      then FonDBError(Self)
      else raise;
  end;
  SetCaptions;
end;

//==============================================================================================
procedure TapImgList.saveDBImages;
  var
    Stream: TStream;
    i: integer;
begin
  if (Fcount <= 0) or (FdataSet = nil){ or (FprovSave = '')} then Exit;

  if assigned(FonBeforeDBAppend) then FonBeforeDBAppend(Self);

  try
    with FdataSet do begin
      Open;
      for i := 0 to Fcount - 1 do begin
        Append;
        Stream := CreateBlobStream(FieldByName(FblobFieldName) as TBlobField, bmWrite);
        imgList[i].Picture.Bitmap.SaveToStream(Stream);

        FieldByName(FdefaultFieldName).AsInteger := BoolToInt(i = imgListDefault);
        FieldByName(FpostToWebFieldName).AsInteger := BoolToInt(imgListWebState[i]);

        if assigned(FonBeforeDBPost) then FonBeforeDBPost(Self);

        Post;
        Stream.Free;
      end;
      Close;
    end;
  except
    if assigned(FonDBError)
      then FonDBError(Self)
      else raise;
  end;
end;

//==============================================================================================
procedure TapImgList.SetDataSet(Value: TDataSet);
begin
  ClearAll;
  FdataSet := Value;
end;

{//==============================================================================================
procedure TapImgList.SetblobFieldName(Value: String);
begin
  //ClearAll;
  FblobFieldName := Value;
end;
}
{$ENDIF}

//==============================================================================================
function TapImgList.GetNew(idx: Integer): Boolean;
begin
  Result := imgListNew[idx];
end;

//==============================================================================================
function TapImgList.GetModified(idx: Integer): Boolean;
begin
  Result := imgListModified[idx];
end;

//==============================================================================================
function TapImgList.GetSelected(const idx: Integer): Boolean;
begin
  Result := imgListSel[idx].Visible;
end;

//==============================================================================================
procedure TapImgList.SetSelected(const idx: Integer; const Value: Boolean);
begin
  SelectImage(idx, Value);
end;

//==============================================================================================
function TapImgList.GetPostToWeb(idx: Integer): Boolean;
begin
  Result := imgListWebState[idx];
end;

//==============================================================================================
procedure TapImgList.SetPostToWeb(idx: Integer; Value: Boolean);
begin
  imgListWebState[idx] := Value;
  if Value
    then imgListWebImages[idx].Picture.Bitmap.LoadFromResourceName(Hinstance, 'IE')
    else imgListWebImages[idx].Picture.Bitmap.LoadFromResourceName(Hinstance, 'IEBW');
end;

//==============================================================================================
procedure TapImgList.switchPostToweb(Sender: TObject);
  var
    idx: Integer;
begin
  if not FallowEditing then Exit;
  idx := (Sender as TImage).Tag;
  SetPostToWeb(idx, not imgListWebState[idx]);
  if Assigned(FonChange) then FonChange(Self);
end;

//==============================================================================================
function TapImgList.GetStream(idx: Integer): TStream;
begin
  if (idx < 0) or (idx >= Fcount) then begin
    Result := nil;
    Exit;
  end;

  imgListOrig[idx].Position := 0;
  Result := imgListOrig[idx];
end;

//==============================================================================================
procedure TapImgList.SetStream(idx: Integer; Value: TStream);
begin
  if (idx < 0) or (idx >= Fcount) then Exit;

  imgListOrig[idx].Position := 0;
  imgListOrig[idx].Size := 0;
  imgListOrig[idx].CopyFrom(Value, Value.Size);

  if imgList[idx].Picture.Bitmap <> nil then imgList[idx].Picture.Bitmap.Free;
  Value.Position := 0;
  imgList[idx].Picture.Bitmap.LoadFromStream(Value);
  if Assigned(FonChange) then FonChange(Self);
end;

//==============================================================================================
function TapImgList.GetID(idx: Integer): Integer;
begin
  if (idx < 0) or (idx >= Fcount)
    then Result := -1
    else Result := imgListID[idx];
end;

//==============================================================================================
procedure TapImgList.SetID(idx: Integer; Value: Integer);
begin
  if (idx < 0) or (idx >= Fcount) then Exit;
  imgListID[idx] := Value;
  imgListNew[idx] := (Value = -1); // maybe that's wrong, but addImage does the same...
end;

//==============================================================================================
function TapImgList.GetBitmap(idx: Integer): TBitmap;
begin
  if (idx < 0) or (idx >= Fcount)
    then Result := nil
    else Result := imgList[idx].Picture.Bitmap;
end;

//==============================================================================================
procedure TapImgList.SetBitmap(idx: Integer; Value: TBitmap);
begin
  if (idx < 0) or (idx >= Fcount) then Exit;
  if imgList[idx].Picture.Bitmap <> nil then imgList[idx].Picture.Bitmap.Free;
  imgList[idx].Picture.Bitmap := Value;
end;

//==============================================================================================
procedure TapImgList.SetCount(const newc: Integer);
  var
    i: integer;
begin
  {
  if (newc < 0) or (Fcount = newc) then Exit;
  if Fcount < newc then begin // removing
    for i := Fcount - 1 downto newc do begin
      imgList[i].Picture.Bitmap.Free;
      imgList[i].Free;
      imgListDeletedImages[i].Picture.Bitmap.Free;
      imgListDeletedImages[i].Free;
      imgListSel[i].Picture.Bitmap.Free;
      imgListSel[i].Free;
      imgListWebImages[i].Picture.Bitmap.Free;
      imgListWebImages[i].Free;
    end;
    SetLength(imgListDeleted, newc);
    SetLength(imgListNew, newc);
    SetLength(imgListWebState, newc);

    imgListLastClicked := -1;
    if imgListDefault >= newc then begin
      imgListDefault := -1;
      DefaultMark.Visible := False;
    end;
  end
  else begin // adding blank
  end;
  Fcount := newc;
  SetCaptions;
  if Assigned(FonChange) then FonChange;
  }
end;

//==============================================================================================
procedure TapImgList.SetLangMan(const nlm: TxLngManager);
begin
  if FlangMan = nlm then Exit;

  FlangMan := nlm;
  SetCaptions;
end;

//==============================================================================================
procedure TapImgList.SetCaptions;
  var
    i: Integer;
begin
  {$IFNDEF PKG}
  if FlangMan = nil then Exit;

  with FLangMan do begin
    aImgAdd.Caption := getRS('apImgList', 'Add');
    aImgDel.Caption := getRS('apImgList', 'Del');
    aImgDefault.Caption := getRS('apImgList', 'Default');
    DefaultMark.Hint := getRS('apImgList', 'DefaultHint');
    Self.Caption := getRS('apImgList', 'NoImages');

    for i := 0 to Fcount - 1 do begin
      imgListWebImages[i].Hint := getRS('apImgList', 'PostToWebHint');
      imgListDeletedImages[i].Hint := getRS('apImgList', 'DeleteHint');
    end;
  end;
  {$ENDIF}
end;

//==============================================================================================
procedure TapImgList.repaintImage(const idx: Integer);
begin
  imgList[idx].Repaint;

  imgListWebImages[idx].Repaint;

  if idx = imgListDefault then DefaultMark.Repaint;
end;

//==============================================================================================
procedure TapImgList.setImagePosition(const idx: Integer);
  var
    size,wc: Integer;
begin
  if FiconHeight > FiconWidth
    then size := FiconWidth
    else size := FiconHeight;

  wc := (sbImages.Width - 5) div (FiconWidth + 10);
  if wc = 0 then wc := 1;

  imgList[idx].Left := (FiconWidth - size) div 2 + (idx mod wc) * (FiconWidth + 10) + 5;
  imgList[idx].Top  := (FiconHeight - size) div 2 + (idx div wc) * (FiconHeight + 10) + 5;

  with imgListSel[idx] do begin
    Left := (idx mod wc) * (FiconWidth + 10) + 5;
    Top := (idx div wc) * (FiconHeight + 10) + 5;
    Width := FiconWidth;
    Height := FiconHeight;
    Picture.Bitmap.Width := FiconWidth;
    Picture.Bitmap.Height := FiconHeight;
    Picture.Bitmap.Canvas.FillRect(Rect(0, 0, FiconWidth, FiconHeight));
  end;

  repositionImageButtons(idx);
end;

//==============================================================================================
procedure TapImgList.repositionImages;
  var
    i: Integer;
begin
  for i := 0 to Fcount - 1 do begin
    setImagePosition(i);
  end;
end;

//==============================================================================================
procedure TapImgList.repositionImageButtons(const i: Integer);
begin
  with imgListWebImages[i] do begin
    Top := imgList[i].Top + imgList[i].Height - Height;
    Left := imgList[i].Left;
  end;

  with imgListDeletedImages[i] do begin
    Top := imgList[i].Top + imgList[i].Height - Height;
    Left := imgListWebImages[i].Left + imgListWebImages[i].Width + 1;
  end;

  if i = imgListDefault then begin
    DefaultMark.Left := imgList[i].Left;
    DefaultMark.Top := imgList[i].Top;
    DefaultMark.Visible := True;
  end;
end;

//==============================================================================================
procedure TapImgList.SetIconHeight(const h: Integer);
  var
    i: Integer;
begin
  FiconHeight := h;
  for i := 0 to Fcount - 1 do begin
    imgList[i].Height := h;
  end;
end;

//==============================================================================================
procedure TapImgList.SetIconWidth(const w: Integer);
  var
    i: Integer;
begin
  FiconWidth := w;
  for i := 0 to Fcount - 1 do begin
    imgList[i].Width := w;
  end;
end;

//==============================================================================================
procedure TapImgList.tbChanged(Sender: TObject);
begin
  if Sender = TrackBarH
    then SetIconHeight(TrackBarH.Position)
    else SetIconWidth(TrackBarW.Position);
  repositionImages;
end;

//==============================================================================================
{$IFDEF USEDB}
procedure TapImgList.newImage;
  var
    img: Timage;
begin
  img := TImage.Create(sbImages);
  img.Parent := sbImages;
  img.Picture.Bitmap := TBitmap.Create;
  AddImage(img, False, nil);
end;
{$ENDIF}

//==============================================================================================
function TapImgList.AddFromStream(const stream: TStream; const AID: Integer = -1): Integer;
  var
    img: TImage;
    jpeg: TJpegImage;
    myStream: TMemoryStream;
begin
  Result := -1;
  if (stream = nil) or (stream.Size = 0) then Exit;

  Stream.Position := 0;
  myStream := TMemoryStream.Create;
  myStream.CopyFrom(stream, stream.size);

  img := nil; jpeg := nil;
  try
    img := TImage.Create(sbImages);
    img.Parent := sbImages;

    jpeg := TJpegImage.create;
    Stream.Position := 0;
    jpeg.LoadFromStream(Stream);
    Img.Picture.Assign(jpeg);
    jpeg.Free;

  except
    if jpeg <> nil then jpeg.Free;
    if img <> nil then img.Free;
    myStream.Free;
    Exit;
  end;

  Result := AddImage(img, False, myStream, AID);

  sbImages.Repaint;
end;

//==============================================================================================
function TapImgList.AddImage(var img: Timage; APostToWeb: Boolean; var AStream: TMemoryStream; const AID: Integer = -1): Integer;
  var
    btn: Timage;
begin
  Result := -1;
  DefaultMark.BringToFront;
  deselectImages;

  inc(Fcount);

  img.Width := FiconWidth;
  img.Height := FiconHeight;
  img.Proportional := True;
  img.Stretch := True;
  img.Tag := Fcount - 1;

  img.OnMouseDown := Image1MouseDown;

  // selection overlays
  SetLength(imgListSel, Fcount);
  btn := TImage.Create(sbImages);
  with btn do begin
    Parent := sbImages;
    Visible := False;
    Tag := Fcount - 1;
    btn.OnMouseDown := Image1MouseDown;
    Picture.Bitmap := TBitmap.Create;
    //Picture.Bitmap.LoadFromResourceName(Hinstance, 'SEL');
    Picture.Bitmap.Transparent := True;
    Transparent := True;
    //Picture.Bitmap.TransparentColor := clWhite;
    Picture.Bitmap.Canvas.Brush.Bitmap := TBitmap.Create;
    Picture.Bitmap.Canvas.Brush.Bitmap.LoadFromResourceName(Hinstance, 'SEL');
  end;
  imgListSel[Fcount - 1] := btn;

  // making "delete" button
  SetLength(imgListDeleted, Fcount);
  imgListDeleted[Fcount - 1] := False;
  btn := TImage.Create(sbImages);
  with btn do begin
    Parent := sbImages;
    Picture.Bitmap := TBitmap.Create;
    Picture.Bitmap.LoadFromResourceName(Hinstance, 'DELBW');
    Width := Picture.Width; Height := Picture.Height;
    OnClick := switchDel;
    Tag := Fcount - 1;
    Transparent := True;
    Visible := (FshowDelete and FallowEditing);
  end;
  SetLength(imgListDeletedImages, Fcount);
  imgListDeletedImages[Fcount - 1] := btn;

  // making "post to web" button
  SetLength(imgListWebImages, Fcount);
  SetLength(imgListWebState, Fcount);
  imgListWebState[Fcount - 1] := APostToWeb;
  btn := TImage.Create(sbImages);
  with btn do begin
    Parent := sbImages;
    Picture.Bitmap := TBitmap.Create;
    Picture.Bitmap.LoadFromResourceName(Hinstance, 'IEBW');
    Width := Picture.Width; Height := Picture.Height;
    OnClick := switchPostToWeb;
    Tag := Fcount - 1;
    Transparent := True;
    Visible := FshowPostToWeb;
  end;
  imgListWebImages[Fcount - 1] := btn;

  SetLength(imgListNew, Fcount);
  imgListNew[Fcount - 1] := (AID = -1);
  SetLength(imgListModified, Fcount);
  imgListModified[Fcount - 1] := False;

  SetLength(imgList, Fcount);
  imgList[Fcount - 1] := img;
  setImagePosition(Fcount - 1);
  repaintImage(Fcount - 1);

  SetLength(imgListID, Fcount);
  imgListID[Fcount - 1] := AID;

  setLength(imgListOrig, Fcount);
  imgListOrig[Fcount - 1] := AStream;


  setCaptions; // to load hints, etc...

  Result := Fcount - 1;
end;

//==============================================================================================
procedure TapImgList.aImgAddExecute(Sender: TObject);
  var
    img: TImage;
    fStream: TFileStream;
    oStream: TMemoryStream;
    jpeg: TJPEGImage;
begin
  if FJPEGsOnly then OpenPictureDialog1.Filter := 'JPEG (*.jpg)|*.jpg;*.jpeg';

  if not OpenPictureDialog1.Execute then exit;

  img := nil; jpeg := nil; fStream := nil;
  try
    fStream := TFileStream.Create(OpenPictureDialog1.FileName, fmOpenRead);

    img := TImage.Create(sbImages);
    img.Parent := sbImages;
    img.Picture.Bitmap := TBitmap.create;
    jpeg := TJPEGImage.Create;
    fStream.Position := 0;
    jpeg.LoadFromStream(fStream);
    Img.Picture.Assign(jpeg);
    jpeg.Free;

  except
    if img <> nil then img.Free;
    if nil <> jpeg then jpeg.Free;
    if nil <> fStream then fStream.Free;
    Exit;
  end;

  oStream := TMemoryStream.Create;
  fStream.Position := 0;
  oStream.CopyFrom(fStream, fStream.Size);
  fStream.Free;

  AddImage(img, False, oStream);

  sbImages.Repaint;
  if Assigned(FonImageFileLoaded) then FonImageFileLoaded(Self);
  if Assigned(FonChange) then FonChange(Self);
end;

//==============================================================================================
function TapImgList.GetDeleted(idx: Integer): Boolean;
begin
  Result := imgListDeleted[idx];
end;

//==============================================================================================
procedure TapImgList.DelImage(idx: Integer; Value: boolean);
begin
  imgListDeleted[idx] := Value;

  if idx = imgListDefault then begin
    with DefaultMark do begin
      Visible := False;
    end;
    imgListDefault := -1;
  end;

  with imgListDeletedImages[idx] do begin
    if imgListDeleted[idx]
      then Picture.Bitmap.LoadFromResourceName(Hinstance, 'DEL')
      else Picture.Bitmap.LoadFromResourceName(Hinstance, 'DELBW');
    Width := Picture.Width;
    Height := Picture.Height;
  end;

  if Assigned(FonImageFileDeleted) then FonImageFileDeleted(Self);
  if Assigned(FonChange) then FonChange(Self);
end;

//==============================================================================================
procedure TapImgList.switchDel(Sender: TObject);
begin
  if not FallowEditing then Exit;
  DelImage((Sender as TImage).Tag, not imgListDeleted[(Sender as TImage).Tag]);
end;

//==============================================================================================
procedure TapImgList.aImgDelExecute(Sender: TObject);
  var
    i: Integer;
begin
  for i := 0 to Fcount - 1 do
    if imgListSel[i].Visible then delImage(i, True);
end;

//==============================================================================================
procedure TapImgList.SetDefaultImage(const idx: Integer);
begin
  if not FallowEditing then Exit;

  if (idx < 0) or (idx >= Fcount) then begin
    DefaultMark.Visible := False;
    imgListDefault := -1;
    Exit;
  end;

  if imgListDeleted[idx] then Exit;
  imgListDefault := idx;
  DefaultMark.Visible := True;
  repositionImageButtons(idx);

  if Assigned(FonChange) then FonChange(Self);
  if Assigned(FonDefaultSet) then FonDefaultSet(Self);
end;

//==============================================================================================
procedure TapImgList.aImgDefaultExecute(Sender: TObject);
begin
  SetDefaultImage(imgListLastClicked);
end;

//==============================================================================================
procedure TapImgList.deselectImages;
  var
    i: integer;
begin
  for i := 0 to Fcount - 1 do if imgListSel[i].Visible then selectImage(i, False);
end;

//==============================================================================================
procedure TapImgList.selectImage(const idx: Integer; sel: Boolean);
begin
  if (idx < 0) or (idx >= Fcount) then Exit;

  if imgListSel[idx].Visible = sel then Exit; // same state

  imgListSel[idx].Visible := sel;

  repaintImage(idx);
  if assigned(FonSelect) then FonSelect(Self);
end;

//==============================================================================================
procedure TapImgList.Image1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
    i,f,t: integer;
begin
  case Button of
    mbLeft: // perform select/unselect
      begin
        if ssShift in Shift then begin
          i := imgListLastClicked;
          if i = -1 then i := 0;
          if i <= (Sender as TImage).Tag
            then begin
              f := i; t := (Sender as TImage).Tag;
            end
            else begin
              f := (Sender as TImage).Tag; t := i;
            end;
          for i := f to t do selectImage(i, True);
        end
        else if ssCtrl in Shift then begin
          i := (Sender as TImage).Tag;
          selectImage(i, not imgListSel[i].Visible);
        end
        else begin// just a click - single image select
          deselectImages;
          selectImage((Sender as TImage).Tag, True);
        end; // shift
        imgListLastClicked := (Sender as TImage).Tag; // to make shift-click work
      end;

    mbRight: // menu popup
      begin
        i := (Sender as TImage).Tag;
        if not imgListSel[i].Visible then begin
          deselectImages;
          selectImage(i, True);
        end;
        pmImages.Tag := i;
        pmImages.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
        imgListLastClicked := (Sender as TImage).Tag; // to make menu work
      end;
  end;
end;

//==============================================================================================
procedure TapImgList.pmImagesPopup(Sender: TObject);
begin
  inherited;
  miImgDefault.Enabled := pmImages.Tag <> -1;
  miImgDel.Enabled := pmImages.Tag <> -1;
end;

//==============================================================================================
procedure TapImgList.sbImagesMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft then begin
    deselectImages;
    Exit;
  end
  else if Button = mbRight then begin
    pmImages.Tag := -1;
    pmImages.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  end;
end;

//==============================================================================================
initialization

//==============================================================================================
finalization

end.

