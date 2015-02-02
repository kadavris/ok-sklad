inherited frmEditCashDesk: TfrmEditCashDesk
  Left = 314
  Top = 183
  VertScrollBar.Range = 0
  ActiveControl = edName
  BorderStyle = bsDialog
  Caption = 'frmEditCashDesk'
  ClientHeight = 179
  ClientWidth = 562
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 562
    Height = 97
    object bvlMain: TssBevel
      Left = 0
      Top = 0
      Width = 562
      Height = 97
      Align = alClient
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object lName: TLabel
      Left = 22
      Top = 15
      Width = 86
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object bvlSep: TssBevel
      Left = 6
      Top = 43
      Width = 548
      Height = 1
      Anchors = [akLeft, akTop, akRight]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnHighlight
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsTopLine
      Style = bsRaised
      UseGradient = False
    end
    object edName: TcxTextEdit
      Left = 158
      Top = 10
      Width = 393
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.MaxLength = 64
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      TabOrder = 0
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
    object chbDefault: TcxCheckBox
      Left = 16
      Top = 53
      Width = 523
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      TabOrder = 1
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 562
    inherited panTitleButtons: TssPanel
      Left = 504
    end
  end
  inherited panButtons: TPanel
    Top = 144
    Width = 562
    TabOrder = 3
    inherited btnOK: TxButton
      Left = 247
      Top = 7
    end
    inherited btnCancel: TxButton
      Left = 352
      Top = 7
    end
    inherited btnApply: TxButton
      Left = 457
      Top = 7
    end
  end
  inherited panToolBar: TPanel
    Width = 562
    TabOrder = 1
    inherited btnLock: TssSpeedButton
      Left = 474
      Width = 22
      Height = 22
      LeftMargin = 2
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 501
      Width = 22
      Height = 22
      LeftMargin = 2
    end
    inherited btnHelp: TssSpeedButton
      Left = 527
      Width = 22
      Height = 22
      LeftMargin = 2
    end
  end
  inherited ilTitleBar: TImageList
    Left = 236
    Top = 88
  end
  inherited FormStorage: TssFormStorage
    Left = 180
    Top = 88
  end
  inherited ActionList: TActionList
    Left = 208
    Top = 88
  end
end
