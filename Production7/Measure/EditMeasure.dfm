inherited frmEditMeasure: TfrmEditMeasure
  Left = 233
  Top = 170
  VertScrollBar.Range = 0
  ActiveControl = edName
  BorderStyle = bsDialog
  Caption = 'frmEditMeasure'
  ClientHeight = 240
  ClientWidth = 562
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 562
    Height = 158
    object bvlMain: TssBevel
      Left = 5
      Top = 4
      Width = 551
      Height = 154
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
    object lShortName: TLabel
      Left = 22
      Top = 55
      Width = 170
      Height = 16
      Caption = #1057#1086#1082#1088#1072#1097#1105#1085#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object bvlSep: TssBevel
      Left = 6
      Top = 126
      Width = 549
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
    object lCode: TLabel
      Left = 27
      Top = 91
      Width = 21
      Height = 16
      Alignment = taRightJustify
      Caption = #1050#1086#1076
    end
    object edShortName: TcxTextEdit
      Left = 236
      Top = 52
      Width = 307
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.MaxLength = 6
      Properties.OnChange = DataModified
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.StyleController = dmData.scMain
      TabOrder = 1
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
    object edName: TcxTextEdit
      Left = 143
      Top = 18
      Width = 400
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.MaxLength = 64
      Properties.OnChange = edNamePropertiesChange
      Style.StyleController = dmData.scMain
      TabOrder = 0
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
    object chbDefault: TcxCheckBox
      Left = 15
      Top = 129
      Width = 527
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Properties.DisplayUnchecked = 'False'
      Properties.OnEditValueChanged = DataModified
      TabOrder = 3
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
    object edCode: TcxTextEdit
      Left = 143
      Top = 87
      Width = 134
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.MaxLength = 14
      Properties.OnChange = DataModified
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.StyleController = dmData.scMain
      TabOrder = 2
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
    Top = 205
    Width = 562
    inherited btnOK: TxButton
      Left = 249
      Top = 9
      OnKeyDown = GoNextKeyDown
    end
    inherited btnCancel: TxButton
      Left = 353
      Top = 9
    end
    inherited btnApply: TxButton
      Left = 458
      Top = 9
      OnKeyDown = GoNextKeyDown
    end
  end
  inherited panToolBar: TPanel
    Width = 562
    inherited btnLock: TssSpeedButton
      Left = 471
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 500
    end
    inherited btnHelp: TssSpeedButton
      Left = 528
    end
  end
  inherited ilTitleBar: TImageList
    Left = 208
    Top = 8
  end
  inherited FormStorage: TssFormStorage
    Left = 152
    Top = 8
  end
  inherited ActionList: TActionList
    Left = 180
    Top = 8
  end
end
