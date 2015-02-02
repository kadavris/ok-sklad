inherited frmSelectHost: TfrmSelectHost
  Left = 267
  Top = 146
  Height = 267
  ActiveControl = lvMain
  Caption = 'frmSelectHost'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  inherited panButtons: TPanel
    Top = 207
    inherited btnOK: TxButton
      Left = 131
    end
    inherited btnCancel: TxButton
      Left = 236
    end
    inherited btnApply: TxButton
      Left = 2
      Visible = False
    end
  end
  object lvMain: TcxListView [2]
    Left = 1
    Top = 31
    Width = 336
    Height = 170
    Columns = <
      item
        AutoSize = True
      end>
    HideSelection = False
    IconOptions.AutoArrange = True
    ItemIndex = -1
    ReadOnly = True
    ShowColumnHeaders = False
    SmallImages = dmData.Images
    ViewStyle = vsReport
    ShowWorkAreas = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    ParentColor = False
    ParentFont = False
    Style.StyleController = dmData.scMain
    TabOrder = 2
    ImeName = 'Russian'
    OnDblClick = lvMainDblClick
  end
end
