inherited frmEditCashOrder_UKR: TfrmEditCashOrder_UKR
  Left = 26
  Top = 125
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 's'
  ClientHeight = 665
  ClientWidth = 928
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object lCount: TLabel [0]
    Left = 665
    Top = 591
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
    Width = 928
    inherited panTitleButtons: TssPanel
      Left = 869
    end
  end
  object panButtons: TPanel [3]
    Left = 0
    Top = 622
    Width = 928
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 4
    DesignSize = (
      928
      43)
    object bvlFooterSep: TssBevel
      Left = 0
      Top = 0
      Width = 928
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
      Left = 720
      Top = 11
      Width = 98
      Height = 27
      Action = aSave
      Anchors = [akTop, akRight]
      ColorInner = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      ParentFont = False
      TabOrder = 1
    end
    object btnCancel: TxButton
      Left = 823
      Top = 11
      Width = 99
      Height = 27
      Action = aCancel
      Anchors = [akBottom]
      ColorInner = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      ParentFont = False
      TabOrder = 2
    end
    object btnPreview: TxButton
      Left = 7
      Top = 11
      Width = 99
      Height = 27
      Action = aPreview
      ColorInner = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      ParentFont = False
      TabOrder = 0
    end
    object btnDel: TxButton
      Left = 617
      Top = 11
      Width = 98
      Height = 27
      Action = aDel
      Anchors = [akTop, akRight]
      ColorInner = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      ParentFont = False
      TabOrder = 3
    end
  end
  object edDocCount: TcxSpinEdit [4]
    Left = 842
    Top = 586
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
    Width = 921
    Height = 545
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    TabOrder = 1
    object bvlFrame: TssBevel
      Left = 0
      Top = 0
      Width = 921
      Height = 545
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
      Top = 5
      Width = 15
      Height = 525
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
      Top = 22
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
      Left = 694
      Top = 32
      Width = 152
      Height = 16
      Caption = #1087#1110#1076#1087#1088#1080#1108#1084#1089#1090#1074#1086', '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1103
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
      Top = 64
      Width = 99
      Height = 19
      Caption = #1050#1042#1048#1058#1040#1053#1062#1030#1071
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
      Left = 714
      Top = 89
      Width = 97
      Height = 16
      Caption = #1076#1086' '#1087#1088#1080#1073#1091#1090#1082#1086#1074#1086#1075#1086
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
      Left = 807
      Top = 108
      Width = 95
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
      Left = 679
      Top = 108
      Width = 117
      Height = 16
      Caption = #1082#1072#1089#1086#1074#1086#1075#1086' '#1086#1088#1076#1077#1088#1072' '#8470
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
      Top = 133
      Width = 77
      Height = 16
      Caption = #1055#1088#1080#1081#1085#1103#1090#1086' '#1074#1110#1076
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label8: TLabel
      Left = 650
      Top = 202
      Width = 51
      Height = 16
      Caption = #1055#1110#1076#1089#1090#1072#1074#1072
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
      Left = 650
      Top = 389
      Width = 247
      Height = 16
      Alignment = taCenter
      AutoSize = False
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
    object Label15: TLabel
      Left = 650
      Top = 430
      Width = 168
      Height = 16
      Caption = #1043#1086#1083'.('#1089#1090#1072#1088#1096#1080#1081') '#1073#1091#1093#1075#1072#1083#1090#1077#1088
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
      Left = 651
      Top = 464
      Width = 251
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
    object Label18: TLabel
      Left = 650
      Top = 479
      Width = 45
      Height = 16
      Caption = #1050#1072#1089#1089#1080#1088
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
      Left = 651
      Top = 508
      Width = 251
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
    object Label20: TLabel
      Left = 506
      Top = 12
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
    object Label28: TLabel
      Left = 123
      Top = 74
      Width = 298
      Height = 19
      Caption = #1055#1056#1048#1041#1059#1058#1050#1054#1042#1048#1049' '#1050#1040#1057#1054#1042#1048#1049' '#1054#1056#1044#1045#1056' '#8470
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label41: TLabel
      Left = 20
      Top = 281
      Width = 77
      Height = 16
      Caption = #1055#1088#1080#1081#1085#1103#1090#1086' '#1074#1110#1076
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ssBevel31: TssBevel
      Left = 113
      Top = 295
      Width = 502
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
    object lKAgent: TLabel
      Left = 133
      Top = 276
      Width = 138
      Height = 16
      Caption = #1054#1054#1054' "'#1056#1086#1075#1072' '#1080' '#1082#1086#1087#1099#1090#1072'"'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label43: TLabel
      Left = 20
      Top = 315
      Width = 51
      Height = 16
      Caption = #1055#1110#1076#1089#1090#1072#1074#1072
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ssBevel33: TssBevel
      Left = 84
      Top = 330
      Width = 531
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
      Left = 276
      Top = 380
      Width = 87
      Height = 16
      Caption = #1089#1091#1084#1072' '#1087#1088#1086#1087#1080#1089#1086#1084
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lSumStr: TLabel
      Left = 20
      Top = 359
      Width = 156
      Height = 16
      Caption = #1044#1077#1074#1103#1085#1086#1089#1090#1086' '#1088#1091#1073'. 00 '#1082#1086#1087'.'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label47: TLabel
      Left = 20
      Top = 418
      Width = 49
      Height = 16
      Caption = #1044#1086#1076#1072#1090#1086#1082
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label48: TLabel
      Left = 84
      Top = 473
      Width = 206
      Height = 16
      Caption = #1043#1086#1083#1086#1074#1085#1080#1081' ('#1089#1090#1072#1088#1096#1080#1081') '#1073#1091#1093#1075#1072#1083#1090#1077#1088
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label50: TLabel
      Left = 84
      Top = 502
      Width = 105
      Height = 16
      Caption = #1054#1076#1077#1088#1078#1072#1074' '#1082#1072#1089#1080#1088
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lEntEx: TLabel
      Left = 650
      Top = 12
      Width = 247
      Height = 16
      AutoSize = False
      Caption = #1053#1072#1096#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object ssBevel28: TssBevel
      Left = 21
      Top = 22
      Width = 330
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
    object lEnt: TLabel
      Left = 25
      Top = 12
      Width = 321
      Height = 16
      AutoSize = False
      Caption = #1053#1072#1096#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 89
      Top = 32
      Width = 152
      Height = 16
      Caption = #1087#1110#1076#1087#1088#1080#1108#1084#1089#1090#1074#1086', '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1103
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
      Left = 103
      Top = 310
      Width = 484
      Height = 16
      AutoSize = False
      Caption = #1054#1054#1054' "'#1056#1086#1075#1072' '#1080' '#1082#1086#1087#1099#1090#1072'"'
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
      Left = 138
      Top = 108
      Width = 193
      Height = 59
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beRight, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsFrame
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel10: TssBevel
      Left = 140
      Top = 111
      Width = 95
      Height = 26
      Caption = #1063#1080#1089#1083#1086
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beRight, beBottom]
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
    object ssBevel5: TssBevel
      Left = 235
      Top = 111
      Width = 94
      Height = 26
      Caption = #1052#1110#1089#1103#1094#1100
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beBottom]
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
    object ssBevel12: TssBevel
      Left = 234
      Top = 135
      Width = 1
      Height = 30
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
      Shape = bsLeftLine
      Style = bsSingle
      UseGradient = False
    end
    object lYear: TLabel
      Left = 345
      Top = 143
      Width = 48
      Height = 16
      Caption = '2003 '#1088'.'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object ssBevel6: TssBevel
      Left = 20
      Top = 177
      Width = 597
      Height = 85
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beRight, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsFrame
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel21: TssBevel
      Left = 22
      Top = 180
      Width = 63
      Height = 40
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beRight, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label35: TLabel
      Left = 90
      Top = 182
      Width = 99
      Height = 16
      Caption = #1050#1086#1088#1077#1089#1087#1086#1085#1076#1091#1102#1095#1080#1081
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 105
      Top = 198
      Width = 65
      Height = 16
      Caption = #1089#1091#1073#1088#1072#1093#1091#1085#1086#1082
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ssBevel27: TssBevel
      Left = 84
      Top = 219
      Width = 119
      Height = 42
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
    object ssBevel7: TssBevel
      Left = 202
      Top = 180
      Width = 139
      Height = 40
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beBottom]
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
    object Label10: TLabel
      Left = 210
      Top = 182
      Width = 117
      Height = 16
      Caption = #1064#1080#1092#1088' '#1072#1085#1072#1083#1110#1090#1080#1095#1085#1086#1075#1086
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label11: TLabel
      Left = 247
      Top = 198
      Width = 36
      Height = 16
      Caption = #1086#1073#1083#1110#1082#1091
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lSum: TssBevel
      Left = 340
      Top = 219
      Width = 149
      Height = 42
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
      Font.Style = [fsBold]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label13: TLabel
      Left = 395
      Top = 192
      Width = 29
      Height = 16
      Caption = #1057#1091#1084#1072
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ssBevel8: TssBevel
      Left = 487
      Top = 180
      Width = 128
      Height = 40
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beBottom]
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
    object Label21: TLabel
      Left = 506
      Top = 182
      Width = 90
      Height = 16
      Caption = #1064#1080#1092#1088' '#1094#1110#1083#1077#1074#1086#1075#1086
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label22: TLabel
      Left = 511
      Top = 198
      Width = 76
      Height = 16
      Caption = #1087#1088#1080#1079#1085#1072#1095#1077#1085#1085#1103
      Color = clWindow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ssBevel9: TssBevel
      Left = 20
      Top = 379
      Width = 597
      Height = 6
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
    object ssBevel11: TssBevel
      Left = 84
      Top = 433
      Width = 531
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
    object ssBevel14: TssBevel
      Left = 310
      Top = 487
      Width = 307
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
    object ssBevel15: TssBevel
      Left = 198
      Top = 517
      Width = 419
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
    object Label9: TLabel
      Left = 719
      Top = 356
      Width = 87
      Height = 16
      Caption = #1089#1091#1084#1072' '#1087#1088#1086#1087#1080#1089#1086#1084
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ssBevel13: TssBevel
      Left = 651
      Top = 351
      Width = 251
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
    object memKAgent: TMemo
      Left = 650
      Top = 153
      Width = 252
      Height = 40
      TabStop = False
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImeName = 'Russian'
      Lines.Strings = (
        #1054#1054#1054' "'#1056#1086#1075#1072' '#1080' '#1082#1086#1087#1099#1090#1072'"')
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edCorrAcc: TcxTextEdit
      Left = 90
      Top = 226
      Width = 108
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.MaxLength = 10
      Style.BorderColor = clGray
      Style.BorderStyle = ebsSingle
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 3
      Text = '301.1'
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edNum: TcxTextEdit
      Left = 457
      Top = 70
      Width = 115
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaxLength = 10
      Properties.OnChange = edNumPropertiesChange
      Style.BorderColor = clGray
      Style.BorderStyle = ebsSingle
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 0
      Text = '134'
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object memTotalStr: TMemo
      Left = 652
      Top = 295
      Width = 250
      Height = 56
      TabStop = False
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImeName = 'Russian'
      Lines.Strings = (
        #1054#1054#1054' "'#1056#1086#1075#1072' '#1080' '#1082#1086#1087#1099#1090#1072'"')
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object memReasonEx: TMemo
      Left = 650
      Top = 222
      Width = 252
      Height = 40
      TabStop = False
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImeName = 'Russian'
      Lines.Strings = (
        #1054#1054#1054' "'#1056#1086#1075#1072' '#1080' '#1082#1086#1087#1099#1090#1072'"')
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object edDay: TcxSpinEdit
      Left = 142
      Top = 138
      Width = 91
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.MaxValue = 31.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Properties.SpinButtons.Position = sbpHorzLeftRight
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnChange = edDayPropertiesChange
      Style.Color = clBtnFace
      Style.StyleController = dmData.scMain
      TabOrder = 1
      Value = 1
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edMonth: TcxSpinEdit
      Left = 236
      Top = 138
      Width = 91
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.MaxValue = 12.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Properties.SpinButtons.Position = sbpHorzLeftRight
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnChange = edMonthPropertiesChange
      Style.Color = clBtnFace
      Style.StyleController = dmData.scMain
      TabOrder = 2
      Value = 1
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
  end
  object chbDefault: TcxCheckBox [6]
    Left = 10
    Top = 585
    Width = 237
    Height = 24
    Anchors = [akLeft, akBottom]
    Properties.DisplayUnchecked = 'False'
    Properties.OnEditValueChanged = edNumPropertiesChange
    Properties.Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    TabOrder = 2
    ImeName = 'Russian'
    OnKeyPress = GoNext
  end
  inherited ilTitleBar: TImageList
    Left = 272
    Top = 584
  end
  object ActionList: TActionList
    Images = dmData.Images
    OnUpdate = ActionListUpdate
    Left = 300
    Top = 472
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
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = aDelExecute
    end
  end
  object frDoc: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnBeginBand = frDocBeginBand
    OnGetValue = frDocGetValue
    Left = 224
    Top = 472
    ReportForm = {19000000}
  end
end
