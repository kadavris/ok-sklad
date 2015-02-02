inherited frmEditCashOrder_RUS: TfrmEditCashOrder_RUS
  Left = 307
  Top = 164
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 's'
  ClientHeight = 784
  ClientWidth = 951
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object lCount: TLabel [0]
    Left = 684
    Top = 705
    Width = 147
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1101#1082#1079#1077#1084#1087#1083#1103#1088#1086#1074
  end
  object lEntMFO: TLabel [1]
    Left = 522
    Top = 202
    Width = 58
    Height = 16
    Caption = #1050#1086#1076' '#1073#1072#1085#1082#1091
    Color = clWhite
    ParentColor = False
  end
  inherited panTitleBar: TssGradientPanel
    Width = 951
    inherited panTitleButtons: TssPanel
      Left = 892
    end
  end
  object panButtons: TPanel [3]
    Left = 0
    Top = 754
    Width = 951
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 4
    DesignSize = (
      951
      30)
    object bvlFooterSep: TssBevel
      Left = 0
      Top = 0
      Width = 951
      Height = 16
      Align = alTop
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsTopLine
      Style = bsSingle
      UseGradient = False
    end
    object btnSave: TxButton
      Left = 743
      Top = 3
      Width = 98
      Height = 27
      Action = aSave
      Anchors = [akTop, akRight]
      ColorInner = clBtnShadow
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      TabOrder = 0
    end
    object btnCancel: TxButton
      Left = 846
      Top = 3
      Width = 99
      Height = 27
      Action = aCancel
      Anchors = [akBottom]
      ColorInner = clBtnShadow
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      TabOrder = 1
    end
    object xButton1: TxButton
      Left = 7
      Top = 3
      Width = 99
      Height = 27
      Action = aPreview
      ColorInner = clBtnShadow
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      TabOrder = 2
    end
    object btnDel: TxButton
      Left = 639
      Top = 3
      Width = 99
      Height = 27
      Action = aDel
      Anchors = [akTop, akRight]
      ColorInner = clBtnShadow
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      TabOrder = 3
    end
  end
  object edDocCount: TcxSpinEdit [4]
    Left = 862
    Top = 701
    Width = 65
    Height = 24
    Anchors = [akLeft, akBottom]
    ParentFont = False
    Properties.MaxValue = 10000000.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Properties.OnChange = edDocCountPropertiesChange
    Style.StyleController = dmData.scMain
    TabOrder = 3
    Value = 2
    ImeName = 'Russian'
    OnKeyPress = GoNext
  end
  object sbMain: TScrollBox [5]
    Left = 5
    Top = 32
    Width = 938
    Height = 659
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    TabOrder = 1
    object bvlFrame: TssBevel
      Left = 0
      Top = 0
      Width = 938
      Height = 659
      Align = alClient
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = True
    end
    object ssBevel32: TssBevel
      Left = 631
      Top = 25
      Width = 15
      Height = 616
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsLeftLine
      Style = bsRaised
      UseGradient = False
    end
    object ssBevel1: TssBevel
      Left = 646
      Top = 44
      Width = 256
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object Label1: TLabel
      Left = 729
      Top = 54
      Width = 74
      Height = 16
      Caption = #1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 714
      Top = 79
      Width = 104
      Height = 19
      Caption = #1050#1042#1048#1058#1040#1053#1062#1048#1071
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 650
      Top = 103
      Width = 207
      Height = 16
      Caption = #1082' '#1087#1088#1080#1093#1086#1076#1085#1086#1084#1091' '#1082#1072#1089#1089#1086#1074#1086#1084#1091' '#1086#1088#1076#1077#1088#1091' '#8470
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lNum: TLabel
      Left = 873
      Top = 103
      Width = 34
      Height = 16
      AutoSize = False
      Caption = '134'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 714
      Top = 123
      Width = 17
      Height = 16
      Caption = #1086#1090' '
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lOnDateStr: TLabel
      Left = 732
      Top = 123
      Width = 98
      Height = 16
      Caption = '1 '#1103#1085#1074#1072#1088#1103' 2004 '#1075'.'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label7: TLabel
      Left = 650
      Top = 167
      Width = 80
      Height = 16
      Caption = #1055#1088#1080#1085#1103#1090#1086' '#1086#1090':'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label8: TLabel
      Left = 650
      Top = 241
      Width = 76
      Height = 16
      Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077':'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label9: TLabel
      Left = 650
      Top = 310
      Width = 49
      Height = 16
      Caption = #1057#1091#1084#1084#1072':'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lSumStrShort: TLabel
      Left = 714
      Top = 309
      Width = 113
      Height = 19
      Caption = '90 '#1088#1091#1073'. 54 '#1082#1086#1087'.'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lNDSStrEx: TLabel
      Left = 650
      Top = 389
      Width = 104
      Height = 16
      Caption = #1042' '#1090#1086#1084' '#1095#1080#1089#1083#1077' '#1053#1044#1057':'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label12: TLabel
      Left = 650
      Top = 423
      Width = 38
      Height = 16
      Caption = #1044#1072#1090#1072':'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lOnDate: TLabel
      Left = 703
      Top = 423
      Width = 64
      Height = 16
      Caption = '01.01.2004'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label14: TLabel
      Left = 650
      Top = 468
      Width = 97
      Height = 16
      Caption = #1052'.'#1055'. ('#1096#1090#1072#1084#1087#1072')'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label15: TLabel
      Left = 650
      Top = 522
      Width = 58
      Height = 16
      Caption = #1043#1083#1072#1074#1085#1099#1081
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label16: TLabel
      Left = 650
      Top = 537
      Width = 69
      Height = 16
      Caption = #1073#1091#1093#1075#1072#1083#1090#1077#1088
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object ssBevel2: TssBevel
      Left = 725
      Top = 542
      Width = 177
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object Label17: TLabel
      Left = 735
      Top = 551
      Width = 150
      Height = 16
      Caption = #1087#1086#1076#1087'., '#1088#1072#1089#1096#1080#1092#1088'. '#1087#1086#1076#1087#1080#1089#1080
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label18: TLabel
      Left = 650
      Top = 601
      Width = 50
      Height = 16
      Caption = #1050#1072#1089#1089#1080#1088':'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object ssBevel3: TssBevel
      Left = 725
      Top = 606
      Width = 177
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object Label19: TLabel
      Left = 735
      Top = 615
      Width = 150
      Height = 16
      Caption = #1087#1086#1076#1087'., '#1088#1072#1089#1096#1080#1092#1088'. '#1087#1086#1076#1087#1080#1089#1080
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label20: TLabel
      Left = 506
      Top = 34
      Width = 100
      Height = 16
      Alignment = taRightJustify
      Caption = #1060#1086#1088#1084#1072' '#8470' '#1050#1054'-1'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label21: TLabel
      Left = 313
      Top = 49
      Width = 293
      Height = 16
      Alignment = taRightJustify
      Caption = #1059#1090#1074#1077#1088#1078#1076#1077#1085#1072' '#1055#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077#1084' '#1043#1086#1089#1082#1086#1084#1089#1090#1072#1090#1072
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label22: TLabel
      Left = 434
      Top = 64
      Width = 173
      Height = 16
      Alignment = taRightJustify
      Caption = #1056#1086#1089#1089#1080#1080' '#1086#1090' 18.08.98 '#1075'. '#8470'88'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object ssBevel4: TssBevel
      Left = 502
      Top = 98
      Width = 105
      Height = 26
      Alignments.Horz = taCenter
      Caption = #1050#1086#1076
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel5: TssBevel
      Left = 502
      Top = 123
      Width = 105
      Height = 26
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel6: TssBevel
      Left = 502
      Top = 148
      Width = 105
      Height = 26
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel7: TssBevel
      Left = 502
      Top = 172
      Width = 105
      Height = 26
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label24: TLabel
      Left = 401
      Top = 128
      Width = 93
      Height = 16
      Alignment = taRightJustify
      Caption = #1060#1086#1088#1084#1072' '#1087#1086' '#1054#1050#1059#1044
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label25: TLabel
      Left = 443
      Top = 153
      Width = 51
      Height = 16
      Alignment = taRightJustify
      Caption = #1087#1086' '#1054#1050#1055#1054
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ssBevel8: TssBevel
      Left = 20
      Top = 167
      Width = 405
      Height = 7
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object Label26: TLabel
      Left = 187
      Top = 172
      Width = 56
      Height = 11
      Caption = #1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ssBevel9: TssBevel
      Left = 20
      Top = 197
      Width = 405
      Height = 6
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object Label27: TLabel
      Left = 158
      Top = 202
      Width = 122
      Height = 11
      Caption = #1089#1090#1088#1091#1082#1090#1091#1088#1085#1086#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label28: TLabel
      Left = 59
      Top = 231
      Width = 270
      Height = 19
      Caption = #1055#1056#1048#1061#1054#1044#1053#1067#1049' '#1050#1040#1057#1057#1054#1042#1067#1049' '#1054#1056#1044#1045#1056
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object ssBevel10: TssBevel
      Left = 389
      Top = 222
      Width = 109
      Height = 20
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel11: TssBevel
      Left = 497
      Top = 222
      Width = 110
      Height = 20
      Caption = #1044#1072#1090#1072' '#1089#1086#1089#1090#1072#1074#1083#1077#1085#1080#1103
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel12: TssBevel
      Left = 389
      Top = 241
      Width = 109
      Height = 26
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel13: TssBevel
      Left = 497
      Top = 241
      Width = 110
      Height = 26
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel14: TssBevel
      Left = 537
      Top = 281
      Width = 70
      Height = 85
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel15: TssBevel
      Left = 463
      Top = 281
      Width = 75
      Height = 85
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label23: TLabel
      Left = 489
      Top = 300
      Width = 21
      Height = 14
      Caption = #1050#1086#1076
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label29: TLabel
      Left = 474
      Top = 315
      Width = 53
      Height = 14
      Caption = #1094#1077#1083#1077#1074#1086#1075#1086
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label30: TLabel
      Left = 470
      Top = 330
      Width = 66
      Height = 14
      Caption = #1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ssBevel16: TssBevel
      Left = 354
      Top = 281
      Width = 110
      Height = 85
      Alignments.Horz = taCenter
      Caption = #1057#1091#1084#1084#1072', '#1088#1091#1073'. '#1082#1086#1087'.'
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel17: TssBevel
      Left = 74
      Top = 281
      Width = 282
      Height = 21
      Caption = #1050#1088#1077#1076#1080#1090
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel18: TssBevel
      Left = 290
      Top = 300
      Width = 66
      Height = 66
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Small Fonts'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label31: TLabel
      Left = 311
      Top = 305
      Width = 21
      Height = 14
      Caption = #1050#1086#1076
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label32: TLabel
      Left = 299
      Top = 319
      Width = 50
      Height = 14
      Caption = #1072#1085#1072#1083#1080#1090#1080'-'
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label33: TLabel
      Left = 300
      Top = 332
      Width = 45
      Height = 14
      Caption = #1095#1077#1089#1082#1086#1075#1086
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label34: TLabel
      Left = 309
      Top = 345
      Width = 32
      Height = 14
      Caption = #1091#1095#1105#1090#1072
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ssBevel19: TssBevel
      Left = 202
      Top = 300
      Width = 90
      Height = 66
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label35: TLabel
      Left = 208
      Top = 310
      Width = 80
      Height = 14
      Caption = #1050#1086#1088#1088#1077#1089#1087#1086#1085#1076#1080'-'
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label36: TLabel
      Left = 212
      Top = 325
      Width = 79
      Height = 14
      Caption = #1088#1091#1102#1097#1080#1081' '#1089#1095#1105#1090','
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label37: TLabel
      Left = 226
      Top = 340
      Width = 45
      Height = 14
      Caption = #1089#1091#1073#1089#1095#1105#1090
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ssBevel20: TssBevel
      Left = 113
      Top = 300
      Width = 90
      Height = 66
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label38: TLabel
      Left = 121
      Top = 310
      Width = 79
      Height = 14
      Caption = #1050#1086#1076' '#1089#1090#1088#1091#1082#1090#1091#1088'-'
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label39: TLabel
      Left = 122
      Top = 325
      Width = 73
      Height = 14
      Caption = #1085#1086#1075#1086' '#1087#1086#1076#1088#1072#1079'-'
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label40: TLabel
      Left = 137
      Top = 340
      Width = 49
      Height = 14
      Caption = #1076#1077#1083#1077#1085#1080#1103
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ssBevel21: TssBevel
      Left = 74
      Top = 300
      Width = 40
      Height = 66
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel22: TssBevel
      Left = 20
      Top = 281
      Width = 55
      Height = 85
      Alignments.Horz = taCenter
      Caption = #1044#1077#1073#1077#1090
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel23: TssBevel
      Left = 20
      Top = 364
      Width = 55
      Height = 26
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel24: TssBevel
      Left = 74
      Top = 364
      Width = 40
      Height = 26
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel25: TssBevel
      Left = 113
      Top = 364
      Width = 90
      Height = 26
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel26: TssBevel
      Left = 202
      Top = 364
      Width = 90
      Height = 26
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel27: TssBevel
      Left = 290
      Top = 364
      Width = 66
      Height = 26
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object lSum: TssBevel
      Left = 354
      Top = 364
      Width = 110
      Height = 26
      Caption = '90.54'
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel29: TssBevel
      Left = 463
      Top = 364
      Width = 75
      Height = 26
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel30: TssBevel
      Left = 537
      Top = 364
      Width = 70
      Height = 26
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label41: TLabel
      Left = 20
      Top = 404
      Width = 80
      Height = 16
      Caption = #1055#1088#1080#1085#1103#1090#1086' '#1086#1090':'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object ssBevel31: TssBevel
      Left = 108
      Top = 418
      Width = 499
      Height = 12
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsTopLine
      Style = bsSingle
      UseGradient = False
    end
    object lKAgent: TLabel
      Left = 118
      Top = 399
      Width = 124
      Height = 16
      Caption = #1054#1054#1054' "'#1056#1086#1075#1072' '#1080' '#1082#1086#1087#1099#1090#1072'"'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label43: TLabel
      Left = 20
      Top = 428
      Width = 76
      Height = 16
      Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077':'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object ssBevel33: TssBevel
      Left = 108
      Top = 443
      Width = 499
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsTopLine
      Style = bsSingle
      UseGradient = False
    end
    object Label44: TLabel
      Left = 20
      Top = 468
      Width = 49
      Height = 16
      Caption = #1057#1091#1084#1084#1072':'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lSumStr: TLabel
      Left = 108
      Top = 468
      Width = 137
      Height = 16
      Caption = #1044#1077#1074#1103#1085#1086#1089#1090#1086' '#1088#1091#1073'. 00 '#1082#1086#1087'.'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lNDSStr: TLabel
      Left = 20
      Top = 497
      Width = 104
      Height = 16
      Caption = #1042' '#1090#1086#1084' '#1095#1080#1089#1083#1077' '#1053#1044#1057':'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label47: TLabel
      Left = 20
      Top = 527
      Width = 86
      Height = 16
      Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1077
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label48: TLabel
      Left = 20
      Top = 561
      Width = 131
      Height = 16
      Caption = #1043#1083#1072#1074#1085#1099#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label49: TLabel
      Left = 213
      Top = 576
      Width = 48
      Height = 16
      Caption = #1087#1086#1076#1087#1080#1089#1100
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ssBevel34: TssBevel
      Left = 164
      Top = 566
      Width = 157
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object Label50: TLabel
      Left = 20
      Top = 610
      Width = 108
      Height = 16
      Caption = #1055#1086#1083#1091#1095#1080#1083' '#1082#1072#1089#1089#1080#1088
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object ssBevel35: TssBevel
      Left = 370
      Top = 566
      Width = 212
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object Label51: TLabel
      Left = 410
      Top = 576
      Width = 133
      Height = 16
      Caption = #1088#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072' '#1087#1086#1076#1087#1080#1089#1080
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ssBevel36: TssBevel
      Left = 164
      Top = 615
      Width = 157
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object Label52: TLabel
      Left = 213
      Top = 625
      Width = 48
      Height = 16
      Caption = #1087#1086#1076#1087#1080#1089#1100
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ssBevel37: TssBevel
      Left = 370
      Top = 615
      Width = 212
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object Label53: TLabel
      Left = 410
      Top = 625
      Width = 133
      Height = 16
      Caption = #1088#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072' '#1087#1086#1076#1087#1080#1089#1080
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lEnt: TLabel
      Left = 25
      Top = 153
      Width = 400
      Height = 16
      AutoSize = False
      Caption = #1053#1072#1096#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object lNDS: TLabel
      Left = 143
      Top = 497
      Width = 4
      Height = 16
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lNDSEx: TLabel
      Left = 773
      Top = 389
      Width = 4
      Height = 16
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lEntEx: TLabel
      Left = 650
      Top = 34
      Width = 247
      Height = 16
      AutoSize = False
      Caption = #1053#1072#1096#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lReason: TLabel
      Left = 118
      Top = 423
      Width = 489
      Height = 16
      AutoSize = False
      Caption = #1054#1054#1054' "'#1056#1086#1075#1072' '#1080' '#1082#1086#1087#1099#1090#1072'"'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object memKAgent: TMemo
      Left = 650
      Top = 192
      Width = 252
      Height = 46
      TabStop = False
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Russian'
      Lines.Strings = (
        #1054#1054#1054' "'#1056#1086#1075#1072' '#1080' '#1082#1086#1087#1099#1090#1072'"')
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object edOKUD: TcxTextEdit
      Left = 503
      Top = 123
      Width = 103
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.MaxLength = 10
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 0
      Text = '0310001'
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edDebet: TcxTextEdit
      Left = 21
      Top = 364
      Width = 53
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.MaxLength = 10
      Properties.OnChange = edNumPropertiesChange
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 3
      Text = '50'
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edCorrAcc: TcxTextEdit
      Left = 203
      Top = 364
      Width = 87
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.MaxLength = 10
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 4
      Text = '62'
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edNum: TcxTextEdit
      Left = 390
      Top = 241
      Width = 107
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.MaxLength = 10
      Properties.OnChange = edNumPropertiesChange
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 1
      Text = '134'
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edOnDate: TcxDateEdit
      Left = 497
      Top = 241
      Width = 109
      Height = 24
      ImeName = 'Russian'
      Properties.Alignment.Horz = taCenter
      Properties.OnChange = edOnDatePropertiesChange
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.ButtonStyle = btsSimple
      TabOrder = 2
      OnKeyPress = GoNext
      EditValue = '01.01.2004'
    end
    object memTotalStr: TMemo
      Left = 652
      Top = 335
      Width = 250
      Height = 45
      TabStop = False
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Russian'
      Lines.Strings = (
        #1054#1054#1054' "'#1056#1086#1075#1072' '#1080' '#1082#1086#1087#1099#1090#1072'"')
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object memReasonEx: TMemo
      Left = 650
      Top = 266
      Width = 252
      Height = 40
      TabStop = False
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Russian'
      Lines.Strings = (
        #1054#1054#1054' "'#1056#1086#1075#1072' '#1080' '#1082#1086#1087#1099#1090#1072'"')
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
  end
  object chbDefault: TcxCheckBox [6]
    Left = 15
    Top = 702
    Width = 237
    Height = 24
    Anchors = [akLeft, akBottom]
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.OnEditValueChanged = edNumPropertiesChange
    Properties.Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    Style.StyleController = dmData.scMain
    TabOrder = 2
    ImeName = 'Russian'
    OnKeyPress = GoNext
  end
  inherited ilTitleBar: TImageList
    Left = 92
    Top = 80
  end
  object ActionList: TActionList
    Images = dmData.Images
    OnUpdate = ActionListUpdate
    Left = 120
    Top = 80
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      OnExecute = aCancelExecute
    end
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnExecute = aSaveExecute
    end
    object aPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      OnExecute = aPreviewExecute
    end
    object aDel: TAction
      Caption = 'aDel'
      OnExecute = aDelExecute
    end
  end
  object frDoc: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnBeginBand = frDocBeginBand
    OnGetValue = frDocGetValue
    Left = 152
    Top = 80
    ReportForm = {19000000}
  end
end
