inherited frmEditWHouse: TfrmEditWHouse
  Left = 281
  Top = 99
  VertScrollBar.Range = 0
  ActiveControl = edName
  BorderStyle = bsDialog
  Caption = 'frmEditWHouse'
  ClientHeight = 278
  ClientWidth = 562
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 562
    Height = 193
    object ssBevel2: TssBevel
      Left = 6
      Top = 2
      Width = 548
      Height = 178
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
      Left = 18
      Top = 18
      Width = 86
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object lAdr: TLabel
      Left = 18
      Top = 43
      Width = 86
      Height = 32
      Caption = #1052#1077#1089#1090#1086' '#1088#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1103
      WordWrap = True
    end
    object lNotes: TLabel
      Left = 18
      Top = 89
      Width = 72
      Height = 16
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object bvlSep: TssBevel
      Left = 6
      Top = 130
      Width = 547
      Height = 2
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
      Left = 133
      Top = 14
      Width = 409
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Properties.MaxLength = 64
      Properties.OnChange = edNamePropertiesChange
      Style.StyleController = dmData.scMain
      TabOrder = 0
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
    object edAdr: TcxMemo
      Left = 133
      Top = 42
      Width = 409
      Height = 39
      Anchors = [akLeft, akTop, akRight]
      ImeName = 'Russian'
      Properties.MaxLength = 255
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      TabOrder = 1
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
    object edNotes: TcxMemo
      Left = 133
      Top = 84
      Width = 409
      Height = 39
      Anchors = [akLeft, akTop, akRight]
      ImeName = 'Russian'
      Properties.MaxLength = 255
      Style.StyleController = dmData.scMain
      TabOrder = 2
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
    object chbDefault: TcxCheckBox
      Left = 14
      Top = 139
      Width = 529
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = DataModified
      Properties.Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1089#1082#1083#1072#1076' ('#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102')'
      TabOrder = 3
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
    Top = 240
    Width = 562
    Height = 38
    inherited btnOK: TxButton
      Left = 249
    end
    inherited btnCancel: TxButton
      Left = 352
    end
    inherited btnApply: TxButton
      Left = 455
    end
  end
  inherited panToolBar: TPanel
    Width = 562
    inherited btnLock: TssSpeedButton
      Left = 469
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 497
    end
    inherited btnHelp: TssSpeedButton
      Left = 526
    end
  end
  inherited ilTitleBar: TImageList
    Left = 68
    Top = 188
  end
  inherited FormStorage: TssFormStorage
    Left = 8
    Top = 188
  end
  inherited ActionList: TActionList
    Left = 36
    Top = 188
  end
end
