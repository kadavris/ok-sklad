unit xWebBrowser;

interface

uses
  SysUtils, Classes, Controls, OleCtrls, SHDocVw, ActiveX, OleServer;

type
  TxWebBrowser = class(TWebBrowser)
  private
    FInvokeList: TStringList;

  protected
    procedure InvokeEvent(DispID: TDispID; var Params: TDispParams); override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property InvokeList: TStringList read FInvokeList;

  end;

implementation

{ TxWebBrowser }

constructor TxWebBrowser.Create(AOwner: TComponent);
begin
  inherited;

  FInvokeList := TStringList.Create;

end;

destructor TxWebBrowser.Destroy;
begin
  FInvokeList.Destroy;

  inherited;
end;

procedure TxWebBrowser.InvokeEvent(DispID: TDispID; var Params: TDispParams);
  var
    S: string;
begin
  S := IntToStr(DispID) + '  ';
  case DispID of
   102: S := S + 'OnStatusTextChange';
   108: S := S + 'OnProgressChange';
   105: S := S + 'OnCommandStateChange';
   106: S := S + 'OnDownloadBegin';
   104: S := S + 'OnDownloadComplete';
   113: S := S + 'OnTitleChange';
   112: S := S + 'OnPropertyChange';
   250: S := S + 'OnBeforeNavigate2';
   251: S := S + 'OnNewWindow2';
   252: S := S + 'OnNavigateComplete2';
   259: S := S + 'OnDocumentComplete';
   253: S := S + 'OnQuit';
   254: S := S + 'OnVisible';
   255: S := S + 'OnToolBar';
   256: S := S + 'OnMenuBar';
   257: S := S + 'OnStatusBar';
   258: S := S + 'OnFullScreen';
   260: S := S + 'OnTheaterMode';
   else S := S + '???';
  end;

  FInvokeList.Add(S);
  inherited;

end;

end.
