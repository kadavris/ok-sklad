inherited frmEditPayOrder_RUS: TfrmEditPayOrder_RUS
  Left = 152
  Top = 181
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 's'
  ClientHeight = 668
  ClientWidth = 895
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object lCount: TLabel [0]
    Left = 640
    Top = 592
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
  object ssBevel33: TssBevel [2]
    Left = 5
    Top = 580
    Width = 868
    Height = 6
    Anchors = [akLeft, akRight, akBottom]
    ColorGrBegin = clBtnFace
    ColorGrEnd = clBtnFace
    ColorInner = clBtnShadow
    ColorOuter = clBtnShadow
    Edges = [beTop]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Style = bsSingle
    UseGradient = False
  end
  object ssBevel34: TssBevel [3]
    Left = 5
    Top = 26
    Width = 868
    Height = 6
    Anchors = [akLeft, akTop, akRight]
    ColorGrBegin = clBtnFace
    ColorGrEnd = clBtnFace
    ColorInner = clBtnShadow
    ColorOuter = clBtnShadow
    Edges = [beBottom]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Style = bsSingle
    UseGradient = False
  end
  inherited panTitleBar: TssGradientPanel
    Width = 895
    inherited panTitleButtons: TssPanel
      Left = 836
    end
  end
  object panButtons: TPanel [5]
    Left = 0
    Top = 625
    Width = 895
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 4
    DesignSize = (
      895
      43)
    object bvlFooterSep: TssBevel
      Left = 0
      Top = 0
      Width = 895
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
      Left = 686
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
      TabOrder = 0
    end
    object btnCancel: TxButton
      Left = 790
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
      TabOrder = 1
    end
    object xButton1: TxButton
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
      TabOrder = 2
    end
    object btnDel: TxButton
      Left = 581
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
  object edDocCount: TcxSpinEdit [6]
    Left = 817
    Top = 588
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
  object sbMain: TScrollBox [7]
    Left = 5
    Top = 32
    Width = 887
    Height = 548
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    TabOrder = 1
    object bvlFrame: TssBevel
      Left = 0
      Top = 0
      Width = 869
      Height = 753
      Align = alClient
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = True
    end
    object lTitle: TLabel
      Left = 44
      Top = 84
      Width = 186
      Height = 16
      Caption = #1055#1051#1040#1058#1025#1046#1053#1054#1045' '#1055#1054#1056#1059#1063#1045#1053#1048#1045'  '#8470
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lFrom: TLabel
      Left = 532
      Top = 98
      Width = 29
      Height = 16
      Caption = #1044#1072#1090#1072
      Color = clWhite
      ParentColor = False
    end
    object bvlEntOKPO: TssBevel
      Left = 39
      Top = 123
      Width = 90
      Height = 51
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
    object lKAgentOKPO: TLabel
      Left = 54
      Top = 260
      Width = 73
      Height = 16
      Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      Color = clWhite
      ParentColor = False
    end
    object lSumv: TLabel
      Left = 593
      Top = 187
      Width = 60
      Height = 16
      Caption = '10000,00'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lSumStrv: TLabel
      Left = 148
      Top = 138
      Width = 172
      Height = 16
      Caption = #1044#1077#1089#1103#1090#1100' '#1090#1080#1089#1103#1095' '#1088#1091#1073'. 00 '#1082#1086#1087'.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 679
      Top = 98
      Width = 76
      Height = 16
      Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      Color = clWhite
      ParentColor = False
    end
    object btnNewAcc: TssSpeedButton
      Left = 806
      Top = 426
      Width = 26
      Height = 26
      Action = aAccNew
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Color = clWhite
      GroupIndex = 0
      ImageIndex = 26
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnMouseDown = btnNewAccMouseDown
      OnMouseUp = btnEntAccvMouseUp
    end
    object Label4: TLabel
      Left = 84
      Top = 39
      Width = 121
      Height = 16
      Caption = #1055#1086#1089#1090#1091#1087'. '#1074' '#1073#1072#1085#1082' '#1087#1083#1072#1090'.'
      Color = clWhite
      ParentColor = False
    end
    object ssBevel4: TssBevel
      Left = 54
      Top = 30
      Width = 184
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel5: TssBevel
      Left = 478
      Top = 89
      Width = 139
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel6: TssBevel
      Left = 650
      Top = 89
      Width = 139
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object lPayer: TLabel
      Left = 44
      Top = 129
      Width = 37
      Height = 16
      Caption = #1057#1091#1084#1084#1072
      Color = clWhite
      ParentColor = False
    end
    object Label3: TLabel
      Left = 44
      Top = 149
      Width = 58
      Height = 16
      Caption = #1087#1088#1086#1087#1080#1089#1100#1102
      Color = clWhite
      ParentColor = False
    end
    object ssBevel7: TssBevel
      Left = 129
      Top = 164
      Width = 704
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel8: TssBevel
      Left = 39
      Top = 174
      Width = 238
      Height = 24
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
    object lEntOKPO: TLabel
      Left = 54
      Top = 177
      Width = 24
      Height = 16
      Caption = #1048#1053#1053
      Color = clWhite
      ParentColor = False
    end
    object ssBevel9: TssBevel
      Left = 277
      Top = 188
      Width = 236
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object Label5: TLabel
      Left = 290
      Top = 177
      Width = 23
      Height = 16
      Caption = #1050#1055#1055
      Color = clWhite
      ParentColor = False
    end
    object ssBevel10: TssBevel
      Left = 512
      Top = 174
      Width = 70
      Height = 64
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label6: TLabel
      Left = 527
      Top = 187
      Width = 37
      Height = 16
      Caption = #1057#1091#1084#1084#1072
      Color = clWhite
      ParentColor = False
    end
    object ssBevel11: TssBevel
      Left = 512
      Top = 238
      Width = 70
      Height = 44
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel12: TssBevel
      Left = 582
      Top = 228
      Width = 251
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object Label7: TLabel
      Left = 527
      Top = 246
      Width = 38
      Height = 16
      Caption = #1057#1095'. '#8470
      Color = clWhite
      ParentColor = False
    end
    object ssBevel13: TssBevel
      Left = 41
      Top = 274
      Width = 471
      Height = 9
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel14: TssBevel
      Left = 512
      Top = 282
      Width = 70
      Height = 24
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label8: TLabel
      Left = 532
      Top = 286
      Width = 23
      Height = 16
      Caption = #1041#1048#1050
      Color = clWhite
      ParentColor = False
    end
    object ssBevel15: TssBevel
      Left = 512
      Top = 306
      Width = 70
      Height = 45
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label9: TLabel
      Left = 527
      Top = 315
      Width = 38
      Height = 16
      Caption = #1057#1095'. '#8470
      Color = clWhite
      ParentColor = False
    end
    object ssBevel16: TssBevel
      Left = 41
      Top = 343
      Width = 471
      Height = 9
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object Label10: TLabel
      Left = 54
      Top = 329
      Width = 111
      Height = 16
      Caption = #1041#1072#1085#1082' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
      Color = clWhite
      ParentColor = False
    end
    object ssBevel17: TssBevel
      Left = 582
      Top = 341
      Width = 251
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel3: TssBevel
      Left = 512
      Top = 420
      Width = 70
      Height = 44
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label1: TLabel
      Left = 527
      Top = 428
      Width = 38
      Height = 16
      Caption = #1057#1095'. '#8470
      Color = clWhite
      ParentColor = False
    end
    object ssBevel18: TssBevel
      Left = 512
      Top = 351
      Width = 70
      Height = 24
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel19: TssBevel
      Left = 512
      Top = 375
      Width = 70
      Height = 45
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label11: TLabel
      Left = 532
      Top = 354
      Width = 23
      Height = 16
      Caption = #1041#1048#1050
      Color = clWhite
      ParentColor = False
    end
    object Label12: TLabel
      Left = 527
      Top = 384
      Width = 38
      Height = 16
      Caption = #1057#1095'. '#8470
      Color = clWhite
      ParentColor = False
    end
    object ssBevel20: TssBevel
      Left = 39
      Top = 418
      Width = 238
      Height = 25
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
    object Label13: TLabel
      Left = 54
      Top = 423
      Width = 24
      Height = 16
      Caption = #1048#1053#1053
      Color = clWhite
      ParentColor = False
    end
    object ssBevel21: TssBevel
      Left = 277
      Top = 434
      Width = 235
      Height = 10
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object Label14: TLabel
      Left = 290
      Top = 423
      Width = 23
      Height = 16
      Caption = #1050#1055#1055
      Color = clWhite
      ParentColor = False
    end
    object ssBevel22: TssBevel
      Left = 41
      Top = 412
      Width = 471
      Height = 9
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object Label15: TLabel
      Left = 54
      Top = 398
      Width = 100
      Height = 16
      Caption = #1041#1072#1085#1082' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      Color = clWhite
      ParentColor = False
    end
    object ssBevel23: TssBevel
      Left = 512
      Top = 464
      Width = 70
      Height = 25
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label16: TLabel
      Left = 522
      Top = 468
      Width = 43
      Height = 16
      Caption = #1042#1080#1076' '#1086#1087'.'
      Color = clWhite
      ParentColor = False
    end
    object ssBevel24: TssBevel
      Left = 512
      Top = 489
      Width = 70
      Height = 24
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label17: TLabel
      Left = 522
      Top = 492
      Width = 47
      Height = 16
      Caption = #1053#1072#1079'. '#1087#1083'.'
      Color = clWhite
      ParentColor = False
    end
    object ssBevel25: TssBevel
      Left = 512
      Top = 513
      Width = 70
      Height = 25
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label18: TLabel
      Left = 522
      Top = 517
      Width = 21
      Height = 16
      Caption = #1050#1086#1076
      Color = clWhite
      ParentColor = False
    end
    object ssBevel1: TssBevel
      Left = 39
      Top = 529
      Width = 473
      Height = 10
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
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
      Left = 54
      Top = 516
      Width = 69
      Height = 16
      Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      Color = clWhite
      ParentColor = False
    end
    object ssBevel2: TssBevel
      Left = 582
      Top = 454
      Width = 251
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel26: TssBevel
      Left = 582
      Top = 528
      Width = 251
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel27: TssBevel
      Left = 39
      Top = 662
      Width = 794
      Height = 10
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
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
      Left = 54
      Top = 649
      Width = 125
      Height = 16
      Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
      Color = clWhite
      ParentColor = False
    end
    object Label21: TLabel
      Left = 414
      Top = 673
      Width = 49
      Height = 16
      Caption = #1055#1086#1076#1087#1080#1089#1080
      Color = clWhite
      ParentColor = False
    end
    object Label22: TLabel
      Left = 615
      Top = 673
      Width = 87
      Height = 16
      Caption = #1054#1090#1084#1077#1090#1082#1080' '#1073#1072#1085#1082#1072
      Color = clWhite
      ParentColor = False
    end
    object ssBevel28: TssBevel
      Left = 668
      Top = 464
      Width = 85
      Height = 25
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel29: TssBevel
      Left = 668
      Top = 489
      Width = 85
      Height = 24
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel30: TssBevel
      Left = 668
      Top = 513
      Width = 85
      Height = 25
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beLeft, beRight, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object Label23: TLabel
      Left = 678
      Top = 468
      Width = 63
      Height = 16
      Caption = #1057#1088#1086#1082' '#1087#1083#1072#1090'.'
      Color = clWhite
      ParentColor = False
    end
    object Label24: TLabel
      Left = 678
      Top = 492
      Width = 69
      Height = 16
      Caption = #1054#1095#1077#1088'. '#1087#1083#1072#1090'.'
      Color = clWhite
      ParentColor = False
    end
    object Label25: TLabel
      Left = 678
      Top = 517
      Width = 56
      Height = 16
      Caption = #1056#1077#1079'. '#1087#1086#1083#1077
      Color = clWhite
      ParentColor = False
    end
    object Label26: TLabel
      Left = 113
      Top = 720
      Width = 26
      Height = 16
      Caption = #1052'.'#1055'.'
      Color = clWhite
      ParentColor = False
    end
    object ssBevel31: TssBevel
      Left = 370
      Top = 713
      Width = 252
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
      ColorOuter = clBlack
      Edges = [beTop]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsBottomLine
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel32: TssBevel
      Left = 370
      Top = 742
      Width = 252
      Height = 11
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
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
      Left = 54
      Top = 212
      Width = 449
      Height = 40
      AutoSize = False
      Caption = #1054#1054#1054' "'#1056#1086#1075#1072' '#1080' '#1050#1086#1087#1099#1090#1072'"'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object lINN: TLabel
      Left = 98
      Top = 177
      Width = 26
      Height = 16
      Caption = #1048#1053#1053
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lKPP: TLabel
      Left = 335
      Top = 177
      Width = 28
      Height = 16
      Caption = #1050#1055#1055
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lEntMFOv: TLabel
      Left = 591
      Top = 286
      Width = 23
      Height = 16
      Caption = #1041#1048#1050
      Color = clWhite
      ParentColor = False
    end
    object lEntBankv: TLabel
      Left = 54
      Top = 290
      Width = 449
      Height = 39
      AutoSize = False
      Caption = #1041#1048#1050
      Color = clWhite
      ParentColor = False
      WordWrap = True
    end
    object lKAgentINN: TLabel
      Left = 98
      Top = 423
      Width = 26
      Height = 16
      Caption = #1048#1053#1053
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lKAgentKPP: TLabel
      Left = 335
      Top = 423
      Width = 26
      Height = 16
      Caption = #1048#1053#1053
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lKAgent: TLabel
      Left = 54
      Top = 457
      Width = 449
      Height = 49
      AutoSize = False
      Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      Color = clWhite
      ParentColor = False
      WordWrap = True
    end
    object lKAgentMFO: TLabel
      Left = 591
      Top = 354
      Width = 23
      Height = 16
      Caption = #1041#1048#1050
      Color = clWhite
      ParentColor = False
    end
    object lKAgentBank: TLabel
      Left = 54
      Top = 359
      Width = 449
      Height = 39
      AutoSize = False
      Caption = #1041#1048#1050
      Color = clWhite
      ParentColor = False
      WordWrap = True
    end
    object btnEntAccv: TssSpeedButton
      Left = 806
      Top = 244
      Width = 26
      Height = 26
      Action = aAccNew
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Color = clWhite
      GroupIndex = 0
      ImageIndex = 26
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnMouseDown = btnEntAccvMouseDown
      OnMouseUp = btnEntAccvMouseUp
    end
    object ssBevel35: TssBevel
      Left = 39
      Top = 538
      Width = 218
      Height = 24
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
    object ssBevel36: TssBevel
      Left = 256
      Top = 538
      Width = 134
      Height = 24
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
    object ssBevel37: TssBevel
      Left = 389
      Top = 538
      Width = 55
      Height = 24
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
    object ssBevel38: TssBevel
      Left = 443
      Top = 538
      Width = 115
      Height = 24
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
    object ssBevel39: TssBevel
      Left = 556
      Top = 538
      Width = 139
      Height = 24
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
    object ssBevel40: TssBevel
      Left = 694
      Top = 538
      Width = 100
      Height = 24
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
    object ssBevel41: TssBevel
      Left = 793
      Top = 538
      Width = 40
      Height = 24
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBlack
      ColorOuter = clBlack
      Edges = [beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel42: TssBevel
      Left = 359
      Top = 34
      Width = 184
      Height = 12
      ColorGrBegin = clWhite
      ColorGrEnd = clWhite
      ColorInner = clBtnShadow
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
      Left = 389
      Top = 44
      Width = 122
      Height = 16
      Caption = #1057#1087#1080#1089#1072#1085#1086' '#1089#1086' '#1089#1095'. '#1087#1083#1072#1090'.'
      Color = clWhite
      ParentColor = False
    end
    object ssBevel43: TssBevel
      Left = 802
      Top = 59
      Width = 36
      Height = 25
      Alignments.Horz = taCenter
      Caption = '01'
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
    object lEntCorAcc: TLabel
      Left = 591
      Top = 315
      Width = 23
      Height = 16
      Caption = #1041#1048#1050
      Color = clWhite
      ParentColor = False
    end
    object lKACorAcc: TLabel
      Left = 591
      Top = 384
      Width = 23
      Height = 16
      Caption = #1041#1048#1050
      Color = clWhite
      ParentColor = False
    end
    object edNum: TcxTextEdit
      Left = 276
      Top = 79
      Width = 90
      Height = 24
      ParentFont = False
      Properties.MaxLength = 15
      Properties.OnChange = edNumPropertiesChange
      Style.BorderColor = clBtnShadow
      Style.BorderStyle = ebsSingle
      Style.Color = clBtnFace
      TabOrder = 1
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edOnDate: TcxDateEdit
      Left = 500
      Top = 69
      Width = 99
      Height = 24
      ImeName = 'Russian'
      Properties.OnChange = edNumPropertiesChange
      Style.BorderColor = clBtnShadow
      Style.BorderStyle = ebsSingle
      Style.Color = clBtnFace
      Style.ButtonStyle = btsSimple
      TabOrder = 2
      OnKeyPress = GoNext
    end
    object lcbAcc: TssDBLookupCombo
      Left = 590
      Top = 426
      Width = 214
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.OnEditValueChanged = lcbAccPropertiesEditValueChanged
      Style.BorderColor = clBtnShadow
      Style.BorderStyle = ebsSingle
      Style.Color = clBtnFace
      Style.HotTrack = True
      Style.ButtonStyle = btsSimple
      TabOrder = 5
      OnEnter = lcbEntAccvEnter
      OnExit = lcbEntAccvExit
      OnKeyPress = GoNext
      EmptyValue = 0
      KeyField = 'accid'
      ListField = 'accnum'
      ListSource = srcAcc
    end
    object memDest: TcxMemo
      Left = 54
      Top = 571
      Width = 764
      Height = 69
      ImeName = 'Russian'
      Properties.MaxLength = 255
      Properties.OnChange = edNumPropertiesChange
      Style.BorderColor = clBtnShadow
      Style.BorderStyle = ebsSingle
      Style.Color = clBtnFace
      Style.HotTrack = True
      TabOrder = 19
    end
    object edAcc: TcxTextEdit
      Left = 743
      Top = 20
      Width = 95
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.MaxLength = 10
      Properties.OnChange = edNumPropertiesChange
      Style.BorderColor = clGray
      Style.BorderStyle = ebsSingle
      Style.Color = clBtnFace
      Style.HotTrack = True
      TabOrder = 0
      Text = '0401060'
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object lcbPayKind: TssDBLookupCombo
      Left = 654
      Top = 69
      Width = 130
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.OnEditValueChanged = lcbAccPropertiesEditValueChanged
      Style.BorderColor = clBtnShadow
      Style.BorderStyle = ebsSingle
      Style.Color = clBtnFace
      Style.HotTrack = True
      Style.ButtonStyle = btsSimple
      TabOrder = 3
      OnKeyPress = GoNext
      EmptyValue = 0
      KeyField = 'pkindid'
      ListField = 'name'
      ListSource = srcPayKind
    end
    object edPayType: TcxTextEdit
      Left = 583
      Top = 464
      Width = 84
      Height = 24
      ParentFont = False
      Properties.MaxLength = 10
      Properties.OnChange = edNumPropertiesChange
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 6
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edCode: TcxTextEdit
      Left = 583
      Top = 511
      Width = 84
      Height = 24
      ParentFont = False
      Properties.MaxLength = 10
      Properties.OnChange = edNumPropertiesChange
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 8
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edDest: TcxTextEdit
      Left = 583
      Top = 487
      Width = 84
      Height = 24
      ParentFont = False
      Properties.MaxLength = 10
      Properties.OnChange = edNumPropertiesChange
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 7
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edPayTime: TcxTextEdit
      Left = 754
      Top = 464
      Width = 83
      Height = 24
      ParentFont = False
      Properties.MaxLength = 10
      Properties.OnChange = edNumPropertiesChange
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 9
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edQ: TcxTextEdit
      Left = 754
      Top = 487
      Width = 83
      Height = 24
      ParentFont = False
      Properties.MaxLength = 10
      Properties.OnChange = edNumPropertiesChange
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 10
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edRes: TcxTextEdit
      Left = 754
      Top = 511
      Width = 83
      Height = 24
      ParentFont = False
      Properties.MaxLength = 10
      Properties.OnChange = edNumPropertiesChange
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 11
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object lcbEntAccv: TssDBLookupCombo
      Left = 590
      Top = 244
      Width = 214
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.OnEditValueChanged = lcbEntAccvPropertiesEditValueChanged
      Style.BorderColor = clBtnShadow
      Style.BorderStyle = ebsSingle
      Style.Color = clBtnFace
      Style.HotTrack = True
      Style.ButtonStyle = btsSimple
      TabOrder = 4
      OnEnter = lcbEntAccvEnter
      OnExit = lcbEntAccvExit
      OnKeyPress = GoNext
      EmptyValue = 0
      KeyField = 'accid'
      ListField = 'accnum'
      ListSource = srcEntAcc
    end
    object edAdd1: TcxTextEdit
      Left = 36
      Top = 537
      Width = 221
      Height = 24
      ParentFont = False
      Properties.MaxLength = 48
      Properties.OnChange = edNumPropertiesChange
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 12
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edAdd2: TcxTextEdit
      Left = 256
      Top = 537
      Width = 134
      Height = 24
      ParentFont = False
      Properties.MaxLength = 48
      Properties.OnChange = edNumPropertiesChange
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 13
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edAdd3: TcxTextEdit
      Left = 389
      Top = 537
      Width = 55
      Height = 24
      ParentFont = False
      Properties.MaxLength = 48
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 14
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edAdd4: TcxTextEdit
      Left = 443
      Top = 537
      Width = 115
      Height = 24
      ParentFont = False
      Properties.MaxLength = 48
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 15
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edAdd5: TcxTextEdit
      Left = 556
      Top = 537
      Width = 141
      Height = 24
      ParentFont = False
      Properties.MaxLength = 48
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 16
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edAdd7: TcxTextEdit
      Left = 793
      Top = 537
      Width = 44
      Height = 24
      ParentFont = False
      Properties.MaxLength = 48
      Style.BorderColor = clGray
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.HotTrack = False
      TabOrder = 18
      ImeName = 'Russian'
      OnKeyPress = GoNext
    end
    object edAdd6: TcxDateEdit
      Left = 694
      Top = 537
      Width = 100
      Height = 24
      ImeName = 'Russian'
      Properties.OnChange = edNumPropertiesChange
      Style.BorderColor = clBtnShadow
      Style.BorderStyle = ebsSingle
      Style.Color = clBtnFace
      Style.ButtonStyle = btsSimple
      TabOrder = 17
      OnKeyPress = GoNext
    end
  end
  object chbDefault: TcxCheckBox [8]
    Left = 10
    Top = 588
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
    Left = 572
    Top = 160
  end
  object ActionList: TActionList
    Images = dmData.Images
    OnUpdate = ActionListUpdate
    Left = 600
    Top = 160
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
    object aAccNew: TAction
      Category = 'Acc'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 26
      ShortCut = 45
      OnExecute = aAccNewExecute
    end
    object aAccProps: TAction
      Tag = 1
      Category = 'Acc'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ImageIndex = 4
      ShortCut = 16397
      OnExecute = aAccNewExecute
    end
    object aAccRefresh: TAction
      Category = 'Acc'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 6
      ShortCut = 116
      OnExecute = aAccRefreshExecute
    end
    object aDel: TAction
      Caption = 'aDel'
      OnExecute = aDelExecute
    end
  end
  object cdsAcc: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'kaid'
        ParamType = ptInput
        Value = 1
      end>
    ProviderName = 'p_AgentAccount_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsAccBeforeOpen
    Macros = <>
    Left = 572
    Top = 188
  end
  object srcAcc: TDataSource
    DataSet = cdsAcc
    Left = 600
    Top = 188
  end
  object frDoc: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnBeginBand = frDocBeginBand
    OnGetValue = frDocGetValue
    Left = 632
    Top = 188
    ReportForm = {19000000}
  end
  object cdsPayKind: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pPayKind_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsAccBeforeOpen
    Macros = <>
    Left = 556
    Top = 124
  end
  object srcPayKind: TDataSource
    DataSet = cdsPayKind
    Left = 584
    Top = 124
  end
  object srcEntAcc: TDataSource
    DataSet = cdsEntAcc
    Left = 536
    Top = 221
  end
  object cdsEntAcc: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'kaid'
        ParamType = ptUnknown
      end>
    ProviderName = 'p_AgentAccount_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsEntAccBeforeOpen
    Macros = <>
    Left = 508
    Top = 221
  end
end
