inherited frmEditKAPersons: TfrmEditKAPersons
  Left = 400
  Top = 295
  VertScrollBar.Range = 0
  ActiveControl = edFIO
  BorderStyle = bsDialog
  Caption = 'frmEditKAPersons'
  ClientHeight = 363
  ClientWidth = 562
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panTitleBar: TssGradientPanel
    Width = 562
    TabOrder = 2
    inherited panTitleButtons: TssPanel
      Left = 503
    end
  end
  inherited panButtons: TPanel
    Top = 322
    Width = 562
    Height = 41
    inherited btnOK: TxButton
      Left = 249
      Top = 7
    end
    inherited btnCancel: TxButton
      Left = 353
      Top = 7
    end
    inherited btnApply: TxButton
      Left = 458
      Top = 7
    end
  end
  object panMain: TPanel [2]
    Left = 0
    Top = 21
    Width = 562
    Height = 301
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      562
      301)
    object bvlMain: TssBevel
      Left = 6
      Top = 31
      Width = 552
      Height = 267
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      UseGradient = False
    end
    object ssBevel4: TssBevel
      Left = 6
      Top = 74
      Width = 550
      Height = 1
      Anchors = [akLeft, akTop, akRight]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnHighlight
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsTopLine
      UseGradient = False
    end
    object lKAName: TLabel
      Left = 52
      Top = 44
      Width = 138
      Height = 16
      Caption = #1054#1054#1054' "'#1056#1086#1075#1072' '#1080' '#1082#1086#1087#1099#1090#1072'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object imgKAgent: TImage
      Left = 22
      Top = 43
      Width = 20
      Height = 20
      Transparent = True
    end
    object lFIO: TLabel
      Left = 21
      Top = 95
      Width = 23
      Height = 16
      Caption = #1048#1084#1103
    end
    object lJob: TLabel
      Left = 21
      Top = 124
      Width = 66
      Height = 16
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
    end
    object lPhone: TLabel
      Left = 21
      Top = 154
      Width = 53
      Height = 16
      Caption = #1058#1077#1083#1077#1092#1086#1085
    end
    object lEmail: TLabel
      Left = 21
      Top = 183
      Width = 36
      Height = 16
      Caption = 'E-mail'
    end
    object lNotes: TLabel
      Left = 21
      Top = 213
      Width = 72
      Height = 16
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object btnEMail: TssSpeedButton
      Left = 516
      Top = 177
      Width = 26
      Height = 26
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      Caption = 'aShowTurnIn'
      GroupIndex = 0
      ImageIndex = 46
      Images = dmData.Images
      LeftMargin = 2
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnLock: TssSpeedButton
      Left = 501
      Top = 1
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
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
    object btnHelp: TssSpeedButton
      Left = 529
      Top = 1
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 10
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object edFIO: TcxTextEdit
      Left = 153
      Top = 89
      Width = 390
      Height = 24
      ParentFont = False
      Properties.MaxLength = 64
      Style.StyleController = dmData.scMain
      TabOrder = 0
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object cbJob: TcxComboBox
      Left = 153
      Top = 118
      Width = 390
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      TabOrder = 1
      OnKeyPress = GoNext
    end
    object edPhone: TcxTextEdit
      Left = 153
      Top = 148
      Width = 390
      Height = 24
      ParentFont = False
      Properties.MaxLength = 64
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      TabOrder = 2
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edEMail: TcxTextEdit
      Left = 153
      Top = 177
      Width = 363
      Height = 24
      ParentFont = False
      Properties.MaxLength = 64
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      TabOrder = 3
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object memNotes: TcxMemo
      Left = 153
      Top = 208
      Width = 390
      Height = 81
      ImeName = 'Russian'
      ParentFont = False
      Properties.MaxLength = 255
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      TabOrder = 4
    end
  end
  inherited ilTitleBar: TImageList
    Left = 364
    Top = 4
  end
  inherited ActionList: TActionList
    Left = 284
  end
  object FormStorage: TssFormStorage
    Active = False
    UseRegistry = True
    StoredValues = <>
    Left = 256
    Top = 36
  end
end
