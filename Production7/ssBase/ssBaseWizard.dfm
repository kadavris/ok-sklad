inherited frmBaseWizard: TfrmBaseWizard
  Left = 213
  Top = 130
  Width = 484
  Height = 340
  Caption = 'frmBaseWizard'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited panTitleBar: TssGradientPanel
    Width = 468
    inherited panTitleButtons: TssPanel
      Left = 409
    end
  end
  object panButtons: TPanel [1]
    Left = 0
    Top = 261
    Width = 468
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      468
      41)
    object ssBevel1: TssBevel
      Left = 0
      Top = 0
      Width = 468
      Height = 13
      Align = alTop
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clWhite
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsTopLine
      UseGradient = False
    end
    object btnPrior: TxButton
      Left = 198
      Top = 11
      Width = 80
      Height = 22
      Action = aPrior
      Anchors = [akRight, akBottom]
      ColorInner = clBtnShadow
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      TabOrder = 0
    end
    object btnCancel: TxButton
      Left = 388
      Top = 11
      Width = 80
      Height = 22
      Action = aCancel
      Anchors = [akRight, akBottom]
      ColorInner = clBtnShadow
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      TabOrder = 2
    end
    object btnNext: TxButton
      Left = 280
      Top = 11
      Width = 80
      Height = 22
      Action = aNext
      Anchors = [akRight, akBottom]
      ColorInner = clBtnShadow
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      TabOrder = 1
    end
  end
  object pcMain: TcxPageControl [2]
    Left = 0
    Top = 81
    Width = 468
    Height = 180
    ActivePage = tsMain
    Align = alClient
    TabOrder = 2
    OnChange = pcMainChange
    object tsMain: TcxTabSheet
      Caption = 'tsMain'
      ImageIndex = 0
      TabVisible = False
    end
  end
  object panHeader: TPanel [3]
    Left = 0
    Top = 21
    Width = 468
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 3
    Visible = False
    DesignSize = (
      468
      60)
    object ssBevel9: TssBevel
      Left = 0
      Top = 55
      Width = 468
      Height = 5
      Align = alBottom
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnHighlight
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      UseGradient = False
    end
    object btnLock: TssSpeedButton
      Left = 402
      Top = 2
      Width = 23
      Height = 23
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      Color = clWindow
      GroupIndex = 0
      ImageIndex = 90
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnLockClick
    end
    object btnSendErrMessage: TssSpeedButton
      Left = 425
      Top = 2
      Width = 23
      Height = 23
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      Color = clWindow
      GroupIndex = 0
      ImageIndex = 129
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnSendErrMessageClick
    end
    object btnHelp: TssSpeedButton
      Left = 448
      Top = 2
      Width = 23
      Height = 23
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      Color = clWindow
      GroupIndex = 0
      ImageIndex = 10
      Images = dmData.Images
      LeftMargin = 3
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnHelpClick
    end
  end
  object ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 40
    Top = 36
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      OnExecute = aCancelExecute
    end
    object aNext: TAction
      Caption = #1042#1087#1077#1088#1105#1076' >'
      OnExecute = aNextExecute
    end
    object aPrior: TAction
      Caption = '< '#1053#1072#1079#1072#1076
      OnExecute = aPriorExecute
    end
  end
end
