inherited frmSelectNewMat: TfrmSelectNewMat
  Left = 754
  Top = 289
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmSelectNewMat'
  ClientHeight = 265
  ClientWidth = 348
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 348
    Height = 177
    BevelInner = bvRaised
    BevelOuter = bvLowered
    object lvMain: TListView
      Left = 2
      Top = 2
      Width = 344
      Height = 173
      Align = alClient
      BorderStyle = bsNone
      Columns = <>
      Items.Data = {
        40000000020000000E00000028000000FFFFFFFF000000000000000008CCE0F2
        E5F0E8E0EB3000000030000000FFFFFFFF000000000000000006C3F0F3EFEFE0}
      LargeImages = dmData.LargeImages
      TabOrder = 0
      OnDblClick = lvMainDblClick
      OnKeyPress = lvMainKeyPress
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 348
    inherited panTitleButtons: TssPanel
      Left = 290
    end
  end
  inherited panButtons: TPanel
    Top = 224
    Width = 348
    Height = 41
    TabOrder = 3
    inherited btnOK: TxButton
      Left = 138
      Top = 7
    end
    inherited btnCancel: TxButton
      Left = 242
      Top = 7
    end
    inherited btnApply: TxButton
      Left = 20
      Top = 7
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 348
    TabOrder = 1
  end
  inherited ilTitleBar: TImageList
    Left = 88
    Top = 128
  end
  inherited ActionList: TActionList
    Left = 116
    Top = 128
  end
end
