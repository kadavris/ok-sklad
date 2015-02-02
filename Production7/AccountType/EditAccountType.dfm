inherited frmEditAccountType: TfrmEditAccountType
  Left = 359
  Top = 172
  VertScrollBar.Range = 0
  ActiveControl = edName
  BorderStyle = bsDialog
  Caption = 'frmEditAccountType'
  ClientHeight = 184
  ClientWidth = 562
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Top = 45
    Width = 562
    Height = 104
    object bvlMain: TssBevel
      Left = 5
      Top = 5
      Width = 550
      Height = 97
      Anchors = [akLeft, akTop, akRight, akBottom]
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
      Top = 23
      Width = 86
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object bvlSep: TssBevel
      Left = 6
      Top = 58
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
      Left = 162
      Top = 18
      Width = 380
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
      Top = 68
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
    TabOrder = 3
    inherited panTitleButtons: TssPanel
      Left = 504
    end
  end
  inherited panButtons: TPanel
    Top = 149
    Width = 562
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
    Height = 24
    TabOrder = 2
    inherited btnLock: TssSpeedButton
      Left = 511
      Width = 22
      Height = 22
      LeftMargin = 2
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 532
      Width = 22
      Height = 22
      LeftMargin = 2
    end
    inherited btnHelp: TssSpeedButton
      Left = 487
      Width = 22
      Height = 22
      LeftMargin = 2
    end
  end
  inherited ilTitleBar: TImageList
    Left = 288
    Top = 52
  end
  inherited FormStorage: TssFormStorage
    Left = 232
    Top = 52
  end
  inherited ActionList: TActionList
    Left = 260
    Top = 52
  end
end
