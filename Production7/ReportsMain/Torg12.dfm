inherited frmTorg12: TfrmTorg12
  Left = 301
  Top = 185
  Width = 968
  Height = 669
  Caption = #1058#1054#1056#1043'-12'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 500
  OldCreateOrder = True
  Position = poScreenCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 16
  object lCount: TLabel [0]
    Left = 681
    Top = 564
    Width = 147
    Height = 16
    Anchors = [akRight, akBottom]
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1101#1082#1079#1077#1084#1087#1083#1103#1088#1086#1074
    Visible = False
  end
  object lEntMFO: TLabel [1]
    Left = 866
    Top = 44
    Width = 63
    Height = 14
    Caption = #1050#1086#1076' '#1073#1072#1085#1082#1091
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  inherited panTitleBar: TssGradientPanel
    Width = 960
    Anchors = [akLeft, akTop]
    inherited panTitleButtons: TssPanel
      Left = 901
      Anchors = [akLeft, akTop]
    end
  end
  object panButtons: TPanel [3]
    Left = 0
    Top = 596
    Width = 960
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    DesignSize = (
      960
      43)
    object bvlFooterSep: TssBevel
      Left = 0
      Top = 0
      Width = 960
      Height = 11
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
      Left = 753
      Top = 11
      Width = 98
      Height = 27
      Action = aSave
      Anchors = [akTop, akRight, akBottom]
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
      Left = 856
      Top = 11
      Width = 99
      Height = 27
      Action = aCancel
      Anchors = [akTop, akRight, akBottom]
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
  end
  object edDocCount: TcxSpinEdit [4]
    Left = 859
    Top = 560
    Width = 65
    Height = 24
    Anchors = [akRight, akBottom]
    ParentFont = False
    Properties.MaxValue = 10000000.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Properties.OnChange = edDocCountPropertiesChange
    Style.StyleController = dmData.scMain
    TabOrder = 2
    Value = 2
    Visible = False
    ImeName = 'Russian'
    OnKeyPress = GoNext
  end
  object chbDefault: TcxCheckBox [5]
    Left = 15
    Top = 561
    Width = 237
    Height = 24
    Anchors = [akLeft, akBottom]
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    TabOrder = 1
    ImeName = 'Russian'
    OnKeyPress = GoNext
  end
  object panMain: TPanel [6]
    Left = 6
    Top = 33
    Width = 951
    Height = 518
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    object ssBevel38: TssBevel
      Left = 0
      Top = 0
      Width = 951
      Height = 1
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
    object ssBevel39: TssBevel
      Left = 0
      Top = 517
      Width = 951
      Height = 1
      Align = alBottom
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
    object ssBevel28: TssBevel
      Left = 0
      Top = 1
      Width = 1
      Height = 516
      Align = alLeft
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsLeftLine
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel40: TssBevel
      Left = 950
      Top = 1
      Width = 1
      Height = 516
      Align = alRight
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsLeftLine
      Style = bsSingle
      UseGradient = False
    end
    object sbMain: TScrollBox
      Left = 1
      Top = 1
      Width = 949
      Height = 516
      Align = alClient
      BorderStyle = bsNone
      Color = clWindow
      ParentColor = False
      TabOrder = 0
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 931
        Height = 324
        Align = alTop
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 0
        object ssBevel1: TssBevel
          Left = 114
          Top = 92
          Width = 493
          Height = 15
          Alignments.Horz = taCenter
          Caption = #1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103', '#1072#1076#1088#1077#1089', '#1090#1077#1083#1077#1092#1086#1085', '#1092#1072#1082#1089', '#1073#1072#1085#1082#1086#1074#1089#1082#1080#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beTop]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Shape = bsTopLine
          Style = bsSingle
          UseGradient = False
        end
        object Label20: TLabel
          Left = 626
          Top = 2
          Width = 161
          Height = 11
          Alignment = taRightJustify
          Caption = #1059#1085#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1092#1086#1088#1084#1072' '#8470' '#1058#1054#1056#1043'-12'
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label21: TLabel
          Left = 493
          Top = 17
          Width = 294
          Height = 11
          Alignment = taRightJustify
          Caption = #1059#1090#1074#1077#1088#1078#1076#1077#1085#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077#1084' '#1043#1086#1089#1082#1086#1084#1089#1090#1072#1090#1072' '#1056#1086#1089#1089#1080#1080' '#1086#1090' 25.12.98 '#8470' 132'
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object ssBevel4: TssBevel
          Left = 709
          Top = 34
          Width = 79
          Height = 21
          Alignments.Horz = taCenter
          Caption = #1050#1086#1076#1099
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel5: TssBevel
          Left = 709
          Top = 54
          Width = 79
          Height = 21
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object Label24: TLabel
          Left = 636
          Top = 59
          Width = 70
          Height = 11
          Alignment = taRightJustify
          Caption = #1060#1086#1088#1084#1072' '#1087#1086' '#1054#1050#1059#1044
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label25: TLabel
          Left = 664
          Top = 79
          Width = 40
          Height = 11
          Alignment = taRightJustify
          Caption = #1087#1086' '#1054#1050#1055#1054
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label1: TLabel
          Left = 7
          Top = 80
          Width = 80
          Height = 11
          Caption = #1043#1088#1091#1079#1086#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object txtShipEntOKPO: TssBevel
          Left = 709
          Top = 74
          Width = 79
          Height = 21
          Alignments.Horz = taCenter
          Caption = '34859573'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object Label2: TLabel
          Left = 36
          Top = 102
          Width = 124
          Height = 11
          Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1085#1086#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object ssBevel2: TssBevel
          Left = 709
          Top = 94
          Width = 79
          Height = 20
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel3: TssBevel
          Left = 709
          Top = 113
          Width = 79
          Height = 21
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object Label4: TLabel
          Left = 582
          Top = 118
          Width = 122
          Height = 11
          Alignment = taRightJustify
          Caption = #1042#1080#1076' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080' '#1087#1086' '#1054#1050#1044#1055
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label5: TLabel
          Left = 664
          Top = 146
          Width = 40
          Height = 11
          Alignment = taRightJustify
          Caption = #1087#1086' '#1054#1050#1055#1054
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object ssBevel7: TssBevel
          Left = 709
          Top = 133
          Width = 79
          Height = 31
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object txtShipEnt: TssBevel
          Left = 108
          Top = 42
          Width = 503
          Height = 49
          Alignments.Vert = vaBottom
          Caption = 
            #1047#1040#1054' "'#1042#1048#1050#1058#1040#1053'", 142432 '#1052#1086#1089#1082#1086#1074#1089#1082#1072#1103' '#1086#1073#1083'. '#1075'. '#1063#1077#1088#1085#1086#1075#1086#1083#1086#1074#1082#1072' '#1048#1085#1089#1090#1080#1090#1091#1090#1089#1082#1080 +
            #1081' '#1087#1088'. '#1076'.8, '#1090#1077#1083'.: (095) 785-7020, '#1056'/'#1089' 407 028 100 402 801 13 075 ' +
            #1074' '#1053#1086#1075#1080#1085#1089#1082#1086#1084' '#1054#1057#1041' '#8470'2557 '#1057#1073#1077#1088#1073#1072#1085#1082' '#1056#1086#1089#1089#1080#1080' '#1075'. '#1052#1086#1089#1082#1074#1072', '#1082'/'#1089' 30101810900' +
            '000000603, '#1041#1048#1050' 044 525 225'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = []
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
          OnClick = txtShipEntClick
          OnMouseEnter = txtShipMouseEnter
          OnMouseLeave = txtShipMouseLeave
        end
        object Label6: TLabel
          Left = 31
          Top = 150
          Width = 75
          Height = 11
          Alignment = taRightJustify
          Caption = #1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
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
          Left = 114
          Top = 162
          Width = 493
          Height = 5
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beTop]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Shape = bsTopLine
          Style = bsSingle
          UseGradient = False
        end
        object Label7: TLabel
          Left = 43
          Top = 181
          Width = 51
          Height = 11
          Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object txtEnt: TssBevel
          Left = 108
          Top = 160
          Width = 503
          Height = 32
          Alignments.Vert = vaBottom
          Caption = 
            #1047#1040#1054' "'#1042#1048#1050#1058#1040#1053'", 142432 '#1052#1086#1089#1082#1086#1074#1089#1082#1072#1103' '#1086#1073#1083'. '#1075'. '#1063#1077#1088#1085#1086#1075#1086#1083#1086#1074#1082#1072' '#1048#1085#1089#1090#1080#1090#1091#1090#1089#1082#1080 +
            #1081' '#1087#1088'. '#1076'.8, '#1090#1077#1083'.: (095) 785-7020, '#1056'/'#1089' 407 028 100 402 801 13 075 ' +
            #1074' '#1053#1086#1075#1080#1085#1089#1082#1086#1084' '#1054#1057#1041' '#8470'2557 '#1057#1073#1077#1088#1073#1072#1085#1082' '#1056#1086#1089#1089#1080#1080' '#1075'. '#1052#1086#1089#1082#1074#1072', '#1082'/'#1089' 301018 1090' +
            '0000000603, '#1041#1048#1050' 044 525 225'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = []
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel41: TssBevel
          Left = 114
          Top = 193
          Width = 493
          Height = 5
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beTop]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Shape = bsTopLine
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel42: TssBevel
          Left = 192
          Top = 114
          Width = 415
          Height = 5
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beTop]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Shape = bsTopLine
          Style = bsSingle
          UseGradient = False
        end
        object txtEntOKPOx: TssBevel
          Left = 709
          Top = 162
          Width = 79
          Height = 31
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object Label8: TLabel
          Left = 664
          Top = 176
          Width = 40
          Height = 11
          Alignment = taRightJustify
          Caption = #1087#1086' '#1054#1050#1055#1054
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label9: TLabel
          Left = 51
          Top = 213
          Width = 55
          Height = 11
          Alignment = taRightJustify
          Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object ssBevel45: TssBevel
          Left = 114
          Top = 225
          Width = 493
          Height = 5
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beTop]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Shape = bsTopLine
          Style = bsSingle
          UseGradient = False
        end
        object Label10: TLabel
          Left = 664
          Top = 206
          Width = 40
          Height = 11
          Alignment = taRightJustify
          Caption = #1087#1086' '#1054#1050#1055#1054
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object ssBevel46: TssBevel
          Left = 709
          Top = 192
          Width = 79
          Height = 31
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object Label11: TLabel
          Left = 43
          Top = 231
          Width = 63
          Height = 14
          Alignment = taRightJustify
          Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object txtReason: TssBevel
          Left = 108
          Top = 225
          Width = 503
          Height = 17
          Alignments.Vert = vaBottom
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = []
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel47: TssBevel
          Left = 114
          Top = 244
          Width = 493
          Height = 13
          Alignments.Horz = taCenter
          Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' ('#1076#1086#1075#1086#1074#1086#1088', '#1082#1086#1085#1090#1088#1072#1082#1090', '#1079#1072#1082#1072#1079'-'#1085#1072#1088#1103#1076')'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beTop]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Shape = bsTopLine
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel48: TssBevel
          Left = 709
          Top = 222
          Width = 79
          Height = 20
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object Label13: TLabel
          Left = 677
          Top = 224
          Width = 27
          Height = 11
          Alignment = taRightJustify
          Caption = #1085#1086#1084#1077#1088
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label14: TLabel
          Left = 684
          Top = 244
          Width = 20
          Height = 11
          Alignment = taRightJustify
          Caption = #1076#1072#1090#1072
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object ssBevel49: TssBevel
          Left = 709
          Top = 241
          Width = 79
          Height = 21
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object Label15: TLabel
          Left = 677
          Top = 263
          Width = 27
          Height = 11
          Alignment = taRightJustify
          Caption = #1085#1086#1084#1077#1088
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object ssBevel50: TssBevel
          Left = 709
          Top = 261
          Width = 79
          Height = 21
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel51: TssBevel
          Left = 709
          Top = 281
          Width = 79
          Height = 21
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object Label16: TLabel
          Left = 684
          Top = 283
          Width = 20
          Height = 11
          Alignment = taRightJustify
          Caption = #1076#1072#1090#1072
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object ssBevel52: TssBevel
          Left = 709
          Top = 300
          Width = 79
          Height = 21
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object Label17: TLabel
          Left = 642
          Top = 305
          Width = 62
          Height = 11
          Alignment = taRightJustify
          Caption = #1042#1080#1076' '#1086#1087#1077#1088#1072#1094#1080#1080
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object ssBevel53: TssBevel
          Left = 708
          Top = 54
          Width = 1
          Height = 267
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel54: TssBevel
          Left = 788
          Top = 54
          Width = 1
          Height = 267
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel55: TssBevel
          Left = 708
          Top = 321
          Width = 81
          Height = 1
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Serif'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel59: TssBevel
          Left = 639
          Top = 261
          Width = 70
          Height = 21
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel60: TssBevel
          Left = 639
          Top = 281
          Width = 70
          Height = 21
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel61: TssBevel
          Left = 639
          Top = 241
          Width = 70
          Height = 21
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel62: TssBevel
          Left = 639
          Top = 222
          Width = 70
          Height = 20
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object Label18: TLabel
          Left = 525
          Top = 265
          Width = 109
          Height = 11
          Alignment = taRightJustify
          Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object txtEntOKPO: TssBevel
          Left = 709
          Top = 172
          Width = 79
          Height = 21
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = []
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object txtShipKAOKPO: TssBevel
          Left = 709
          Top = 143
          Width = 79
          Height = 21
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = []
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object txtKAOKPO: TssBevel
          Left = 709
          Top = 202
          Width = 79
          Height = 21
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = []
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object txtShipEx: TxLabelEx
          Left = 114
          Top = 133
          Width = 503
          Height = 29
          Captions.Strings = (
            
              #1047#1040#1054' "'#1042#1048#1050#1058#1040#1053'", 142432 '#1052#1086#1089#1082#1086#1074#1089#1082#1072#1103' '#1086#1073#1083'. '#1075'. '#1063#1077#1088#1085#1086#1075#1086#1083#1086#1074#1082#1072' '#1048#1085#1089#1090#1080#1090#1091#1090#1089#1082#1080 +
              #1081' '#1087#1088'. '#1076'.8, '#1090#1077#1083'.: (095) 785-7020, '
            
              #1056'/'#1089' 407 028 100 402 801 13 075 '#1074' '#1053#1086#1075#1080#1085#1089#1082#1086#1084' '#1054#1057#1041' '#8470'2557 '#1057#1073#1077#1088#1073#1072#1085#1082' '#1056#1086 +
              #1089#1089#1080#1080' '#1075'. '#1052#1086#1089#1082#1074#1072', '#1082'/'#1089' 301018 10900000000603, '#1041#1048#1050' 044 525 225')
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ShowHint = True
          OnItemClick = txtShipExItemClick
        end
        object txtKAEx: TxLabelEx
          Left = 114
          Top = 196
          Width = 503
          Height = 29
          Captions.Strings = (
            
              #1047#1040#1054' "'#1042#1048#1050#1058#1040#1053'", 142432 '#1052#1086#1089#1082#1086#1074#1089#1082#1072#1103' '#1086#1073#1083'. '#1075'. '#1063#1077#1088#1085#1086#1075#1086#1083#1086#1074#1082#1072' '#1048#1085#1089#1090#1080#1090#1091#1090#1089#1082#1080 +
              #1081' '#1087#1088'. '#1076'.8, '#1090#1077#1083'.: (095) 785-7020, '
            
              #1056'/'#1089' 407 028 100 402 801 13 075 '#1074' '#1053#1086#1075#1080#1085#1089#1082#1086#1084' '#1054#1057#1041' '#8470'2557 '#1057#1073#1077#1088#1073#1072#1085#1082' '#1056#1086 +
              #1089#1089#1080#1080' '#1075'. '#1052#1086#1089#1082#1074#1072', '#1082'/'#1089' 301018 10900000000603, '#1041#1048#1050' 044 525 225')
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ShowHint = True
          OnItemClick = txtKAExItemClick
        end
        object edOKUD: TcxTextEdit
          Left = 708
          Top = 53
          Width = 81
          Height = 24
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.MaxLength = 10
          Properties.OnChange = DataModified
          Style.BorderColor = clGray
          Style.BorderStyle = ebsNone
          Style.Color = clBtnFace
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          TabOrder = 0
          Text = '0330212'
          ImeName = 'Russian'
          OnKeyPress = GoNext
        end
        object edOKDP: TcxTextEdit
          Left = 708
          Top = 112
          Width = 81
          Height = 24
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.MaxLength = 10
          Properties.OnChange = DataModified
          Style.BorderColor = clGray
          Style.BorderStyle = ebsNone
          Style.Color = clBtnFace
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          TabOrder = 1
          ImeName = 'Russian'
          OnKeyPress = GoNext
        end
        object Panel2: TPanel
          Left = 73
          Top = 262
          Width = 477
          Height = 51
          BevelOuter = bvNone
          Color = clWindow
          ParentBackground = False
          TabOrder = 2
          object Label28: TLabel
            Left = 17
            Top = 23
            Width = 144
            Height = 16
            Caption = #1058#1054#1042#1040#1056#1053#1040#1071' '#1053#1040#1050#1051#1040#1044#1053#1040#1071
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object ssBevel10: TssBevel
            Left = 249
            Top = 0
            Width = 110
            Height = 20
            Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beLeft, beRight, beTop, beBottom]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel11: TssBevel
            Left = 358
            Top = 0
            Width = 113
            Height = 20
            Alignments.Horz = taCenter
            Caption = #1044#1072#1090#1072' '#1089#1086#1089#1090#1072#1074#1083#1077#1085#1080#1103
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beLeft, beRight, beTop, beBottom]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel12: TssBevel
            Left = 250
            Top = 20
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
            Left = 357
            Top = 20
            Width = 113
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
          object ssBevel56: TssBevel
            Left = 250
            Top = 46
            Width = 220
            Height = 1
            Alignments.Horz = taCenter
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beBottom]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Serif'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel57: TssBevel
            Left = 470
            Top = 20
            Width = 1
            Height = 27
            Alignments.Horz = taCenter
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beLeft]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Serif'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel58: TssBevel
            Left = 249
            Top = 18
            Width = 1
            Height = 29
            Alignments.Horz = taCenter
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beLeft]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Serif'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object edNum: TcxTextEdit
            Left = 250
            Top = 20
            Width = 108
            Height = 24
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.MaxLength = 10
            Properties.OnChange = DataModified
            Style.BorderColor = clGray
            Style.BorderStyle = ebsNone
            Style.Color = clBtnFace
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            TabOrder = 0
            Text = '134'
            ImeName = 'Russian'
            OnKeyPress = GoNext
          end
          object edDocDate: TcxDateEdit
            Left = 359
            Top = 20
            Width = 111
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.OnChange = edOnDatePropertiesChange
            Style.BorderColor = clGray
            Style.BorderStyle = ebsNone
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.ButtonStyle = btsSimple
            TabOrder = 1
            OnKeyPress = GoNext
            EditValue = '01.01.2004'
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 324
        Width = 931
        Height = 179
        Align = alTop
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 1
        object ssBevel16: TssBevel
          Left = 404
          Top = 5
          Width = 46
          Height = 70
          Alignments.Horz = taCenter
          Caption = #1042#1080#1076' '#1091#1087#1072'- '#1082#1086#1074#1082#1080
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel17: TssBevel
          Left = 38
          Top = 5
          Width = 269
          Height = 39
          Alignments.Horz = taCenter
          Caption = #1058#1086#1074#1072#1088
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel20: TssBevel
          Left = 38
          Top = 43
          Width = 230
          Height = 32
          Alignments.Horz = taCenter
          Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077', '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072', '#1089#1086#1088#1090', '#1072#1088#1090#1080#1082#1091#1083' '#1090#1086#1074#1072#1088#1072
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel22: TssBevel
          Left = 10
          Top = 5
          Width = 29
          Height = 70
          Alignments.Horz = taCenter
          Caption = #8470' '#1087'/'#1087
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel24: TssBevel
          Left = 266
          Top = 43
          Width = 41
          Height = 32
          Alignments.Horz = taCenter
          Caption = #1082#1086#1076
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel25: TssBevel
          Left = 306
          Top = 5
          Width = 100
          Height = 39
          Alignments.Horz = taCenter
          Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel33: TssBevel
          Left = 315
          Top = 150
          Width = 372
          Height = 11
          Alignments.Horz = taCenter
          Alignments.Vert = vaTop
          Caption = #1087#1088#1086#1087#1080#1089#1100#1102
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beTop]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Shape = bsTopLine
          Style = bsSingle
          UseGradient = False
        end
        object lNDS: TLabel
          Left = 143
          Top = 135
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
          Top = 59
          Width = 2
          Height = 11
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object ssBevel14: TssBevel
          Left = 306
          Top = 43
          Width = 50
          Height = 32
          Alignments.Horz = taCenter
          Caption = #1085#1072#1080#1084#1077'- '#1085#1086#1074#1072#1085#1080#1077
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel15: TssBevel
          Left = 355
          Top = 43
          Width = 51
          Height = 32
          Alignments.Horz = taCenter
          Caption = #1082#1086#1076' '#1087#1086' '#1054#1050#1045#1048
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel19: TssBevel
          Left = 449
          Top = 5
          Width = 94
          Height = 39
          Alignments.Horz = taCenter
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel21: TssBevel
          Left = 449
          Top = 43
          Width = 55
          Height = 32
          Alignments.Horz = taCenter
          Caption = #1074' '#1086#1076#1085#1086#1084' '#1084#1077#1089#1090#1077
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel23: TssBevel
          Left = 503
          Top = 43
          Width = 40
          Height = 32
          Alignments.Horz = taCenter
          Caption = #1084#1077#1089#1090', '#1096#1090#1091#1082
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel18: TssBevel
          Left = 542
          Top = 5
          Width = 46
          Height = 70
          Alignments.Horz = taCenter
          Caption = #1052#1072#1089#1089#1072' '#1073#1088#1091#1090#1090#1086
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel26: TssBevel
          Left = 586
          Top = 5
          Width = 56
          Height = 70
          Alignments.Horz = taCenter
          Caption = #1050#1086#1083#1080'- '#1095#1077#1089#1090#1074#1086' ('#1084#1072#1089#1089#1072' '#1085#1077#1090#1090#1086')'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel27: TssBevel
          Left = 641
          Top = 5
          Width = 55
          Height = 70
          Alignments.Horz = taCenter
          Caption = #1062#1077#1085#1072', '#1088#1091#1073'. '#1082#1086#1087'.'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel29: TssBevel
          Left = 695
          Top = 5
          Width = 70
          Height = 70
          Alignments.Horz = taCenter
          Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1091#1095#1105#1090#1072' '#1053#1044#1057', '#1088#1091#1073'. '#1082#1086#1087'.'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel30: TssBevel
          Left = 764
          Top = 5
          Width = 99
          Height = 39
          Alignments.Horz = taCenter
          Caption = #1053#1044#1057
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel63: TssBevel
          Left = 862
          Top = 5
          Width = 81
          Height = 70
          Alignments.Horz = taCenter
          Caption = #1057#1091#1084#1084#1072' '#1089' '#1091#1095#1105#1090#1086#1084' '#1053#1044#1057', '#1088#1091#1073'. '#1082#1086#1087'.'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel64: TssBevel
          Left = 764
          Top = 43
          Width = 45
          Height = 32
          Alignments.Horz = taCenter
          Caption = #1089#1090#1072#1074#1082#1072', %'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel65: TssBevel
          Left = 808
          Top = 43
          Width = 55
          Height = 32
          Alignments.Horz = taCenter
          Caption = #1089#1091#1084#1084#1072', '#1088#1091#1073'. '#1082#1086#1087'.'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel66: TssBevel
          Left = 10
          Top = 74
          Width = 29
          Height = 18
          Alignments.Horz = taCenter
          Caption = '1'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel67: TssBevel
          Left = 38
          Top = 74
          Width = 230
          Height = 18
          Alignments.Horz = taCenter
          Caption = '2'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel68: TssBevel
          Left = 266
          Top = 74
          Width = 41
          Height = 18
          Alignments.Horz = taCenter
          Caption = '3'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel69: TssBevel
          Left = 306
          Top = 74
          Width = 50
          Height = 18
          Alignments.Horz = taCenter
          Caption = '4'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel70: TssBevel
          Left = 355
          Top = 74
          Width = 51
          Height = 18
          Alignments.Horz = taCenter
          Caption = '5'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel71: TssBevel
          Left = 404
          Top = 74
          Width = 46
          Height = 18
          Alignments.Horz = taCenter
          Caption = '6'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel72: TssBevel
          Left = 449
          Top = 74
          Width = 55
          Height = 18
          Alignments.Horz = taCenter
          Caption = '7'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel73: TssBevel
          Left = 503
          Top = 74
          Width = 40
          Height = 18
          Alignments.Horz = taCenter
          Caption = '8'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel74: TssBevel
          Left = 542
          Top = 74
          Width = 46
          Height = 18
          Alignments.Horz = taCenter
          Caption = '9'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel75: TssBevel
          Left = 586
          Top = 74
          Width = 56
          Height = 18
          Alignments.Horz = taCenter
          Caption = '10'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel76: TssBevel
          Left = 641
          Top = 74
          Width = 55
          Height = 18
          Alignments.Horz = taCenter
          Caption = '11'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel77: TssBevel
          Left = 695
          Top = 74
          Width = 70
          Height = 18
          Alignments.Horz = taCenter
          Caption = '12'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel78: TssBevel
          Left = 764
          Top = 74
          Width = 45
          Height = 18
          Alignments.Horz = taCenter
          Caption = '13'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel79: TssBevel
          Left = 808
          Top = 74
          Width = 55
          Height = 18
          Alignments.Horz = taCenter
          Caption = '14'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel80: TssBevel
          Left = 862
          Top = 74
          Width = 81
          Height = 18
          Alignments.Horz = taCenter
          Caption = '15'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel81: TssBevel
          Left = 10
          Top = 91
          Width = 933
          Height = 19
          Alignments.Horz = taCenter
          Caption = '('#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103')'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = [fsBold]
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object Label19: TLabel
          Left = 410
          Top = 112
          Width = 89
          Height = 11
          Alignment = taRightJustify
          Caption = #1042#1089#1077#1075#1086' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object ssBevel82: TssBevel
          Left = 504
          Top = 108
          Width = 39
          Height = 19
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel83: TssBevel
          Left = 542
          Top = 108
          Width = 46
          Height = 19
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel84: TssBevel
          Left = 586
          Top = 108
          Width = 56
          Height = 19
          Alignments.Horz = taCenter
          Caption = '-'
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel85: TssBevel
          Left = 641
          Top = 108
          Width = 55
          Height = 19
          Alignments.Horz = taCenter
          Caption = #1061
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel86: TssBevel
          Left = 695
          Top = 108
          Width = 70
          Height = 19
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel87: TssBevel
          Left = 764
          Top = 108
          Width = 45
          Height = 19
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel88: TssBevel
          Left = 808
          Top = 108
          Width = 55
          Height = 19
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel89: TssBevel
          Left = 862
          Top = 108
          Width = 81
          Height = 19
          Alignments.Horz = taCenter
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object Label22: TLabel
          Left = 84
          Top = 139
          Width = 185
          Height = 11
          Caption = #1058#1086#1074#1072#1088#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103' '#1080#1084#1077#1077#1090' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1077' '#1085#1072
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label23: TLabel
          Left = 710
          Top = 137
          Width = 28
          Height = 11
          Caption = #1083#1080#1089#1090#1072#1093
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label26: TLabel
          Left = 84
          Top = 159
          Width = 51
          Height = 11
          Caption = #1080' '#1089#1086#1076#1077#1088#1078#1080#1090
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label27: TLabel
          Left = 710
          Top = 159
          Width = 130
          Height = 11
          Caption = #1087#1086#1088#1103#1076#1082#1086#1074#1099#1093' '#1085#1086#1084#1077#1088#1086#1074' '#1079#1072#1087#1080#1089#1077#1081
          Color = clWindow
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object ssBevel31: TssBevel
          Left = 192
          Top = 169
          Width = 513
          Height = 13
          Alignments.Horz = taCenter
          Alignments.Vert = vaTop
          Caption = #1087#1088#1086#1087#1080#1089#1100#1102
          ColorGrBegin = clWhite
          ColorGrEnd = clWhite
          ColorInner = clBlack
          ColorOuter = clBlack
          Edges = [beTop]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = []
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Shape = bsTopLine
          Style = bsSingle
          UseGradient = False
        end
        object edAppx: TcxTextEdit
          Left = 313
          Top = 129
          Width = 377
          Height = 22
          Properties.Alignment.Horz = taCenter
          Properties.MaxLength = 10
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = DataModified
          Style.BorderColor = clGray
          Style.BorderStyle = ebsNone
          Style.Color = clBtnFace
          Style.HotTrack = False
          TabOrder = 0
          ImeName = 'Russian'
          OnKeyPress = GoNext
        end
        object edAppxCalc: TssCalcEdit
          Left = 685
          Top = 128
          Width = 23
          Height = 24
          TabStop = False
          EditValue = 0.000000000000000000
          ImeName = 'Russian'
          ParentFont = False
          Properties.OnChange = edAppxCalcPropertiesChange
          Style.BorderStyle = ebsNone
          Style.HotTrack = False
          Style.StyleController = dmData.scMain
          TabOrder = 1
          CalcColor = clBtnFace
          DecimalPlaces = 2
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 503
        Width = 931
        Height = 240
        Align = alTop
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 2
        object panLeft: TPanel
          Left = 0
          Top = 0
          Width = 511
          Height = 240
          Align = alClient
          BevelOuter = bvNone
          Color = clWindow
          ParentBackground = False
          TabOrder = 0
          object Label29: TLabel
            Left = 394
            Top = 10
            Width = 86
            Height = 11
            Caption = #1052#1072#1089#1089#1072' '#1075#1088#1091#1079#1072' ('#1085#1077#1090#1090#1086')'
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label30: TLabel
            Left = 394
            Top = 32
            Width = 90
            Height = 11
            Caption = #1052#1072#1089#1089#1072' '#1075#1088#1091#1079#1072' ('#1073#1088#1091#1090#1090#1086')'
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label31: TLabel
            Left = 84
            Top = 32
            Width = 49
            Height = 11
            Caption = #1042#1089#1077#1075#1086' '#1084#1077#1089#1090
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object ssBevel96: TssBevel
            Left = 150
            Top = 46
            Width = 224
            Height = 12
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1087#1088#1086#1087#1080#1089#1100#1102
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsTopLine
            Style = bsSingle
            UseGradient = False
          end
          object Label32: TLabel
            Left = 7
            Top = 63
            Width = 198
            Height = 11
            Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1077' ('#1087#1072#1089#1087#1086#1088#1090#1072', '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1099' '#1080' '#1090'.'#1087'.) '#1085#1072
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object ssBevel34: TssBevel
            Left = 261
            Top = 76
            Width = 113
            Height = 13
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1087#1088#1086#1087#1080#1089#1100#1102
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsTopLine
            Style = bsSingle
            UseGradient = False
          end
          object lSumStr: TLabel
            Left = 150
            Top = 91
            Width = 384
            Height = 12
            AutoSize = False
            Caption = #1044#1074#1072' '#1084#1080#1083#1083#1080#1086#1085#1072' '#1087#1103#1090#1100#1076#1077#1089#1103#1090' '#1086#1076#1085#1072' '#1090#1099#1089#1103#1095#1072' '#1089#1077#1084#1076#1077#1089#1103#1090' '#1076#1074#1072' '#1088#1091#1073#1083#1103' 00 '#1082#1086#1087#1077#1077#1082
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label33: TLabel
            Left = 394
            Top = 63
            Width = 28
            Height = 11
            Caption = #1083#1080#1089#1090#1072#1093
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label34: TLabel
            Left = 7
            Top = 92
            Width = 112
            Height = 11
            Caption = #1042#1089#1077#1075#1086' '#1086#1090#1087#1091#1097#1077#1085#1086' '#1085#1072' '#1089#1091#1084#1084#1091
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object ssBevel36: TssBevel
            Left = 150
            Top = 105
            Width = 391
            Height = 12
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1087#1088#1086#1087#1080#1089#1100#1102
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsTopLine
            Style = bsSingle
            UseGradient = False
          end
          object Label35: TLabel
            Left = 7
            Top = 121
            Width = 100
            Height = 11
            Caption = #1054#1090#1087#1091#1089#1082' '#1075#1088#1091#1079#1072' '#1088#1072#1079#1088#1077#1096#1080#1083
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object ssBevel37: TssBevel
            Left = 256
            Top = 134
            Width = 107
            Height = 12
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1087#1086#1076#1087#1080#1089#1100
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsTopLine
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel97: TssBevel
            Left = 366
            Top = 134
            Width = 175
            Height = 12
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1088#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072' '#1087#1086#1076#1087#1080#1089#1080
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsTopLine
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel98: TssBevel
            Left = 256
            Top = 193
            Width = 107
            Height = 13
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1087#1086#1076#1087#1080#1089#1100
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsTopLine
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel99: TssBevel
            Left = 366
            Top = 193
            Width = 175
            Height = 13
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1088#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072' '#1087#1086#1076#1087#1080#1089#1080
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsTopLine
            Style = bsSingle
            UseGradient = False
          end
          object Label37: TLabel
            Left = 7
            Top = 180
            Width = 98
            Height = 11
            Caption = #1054#1090#1087#1091#1089#1082' '#1075#1088#1091#1079#1072' '#1087#1088#1086#1080#1079#1074#1105#1083
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object ssBevel100: TssBevel
            Left = 256
            Top = 164
            Width = 107
            Height = 12
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1087#1086#1076#1087#1080#1089#1100
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsTopLine
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel101: TssBevel
            Left = 366
            Top = 164
            Width = 175
            Height = 12
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1088#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072' '#1087#1086#1076#1087#1080#1089#1080
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsTopLine
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel102: TssBevel
            Left = 150
            Top = 134
            Width = 105
            Height = 12
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1076#1086#1083#1078#1085#1086#1089#1090#1100
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel104: TssBevel
            Left = 150
            Top = 193
            Width = 105
            Height = 13
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1076#1086#1083#1078#1085#1086#1089#1090#1100
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object Label39: TLabel
            Left = 89
            Top = 213
            Width = 20
            Height = 11
            Caption = #1052'.'#1055'.'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentFont = False
          end
          object lD1: TLabel
            Left = 148
            Top = 215
            Width = 39
            Height = 11
            Caption = '20    '#1075#1086#1076#1072
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label3: TLabel
            Left = 7
            Top = 151
            Width = 125
            Height = 11
            Caption = #1043#1083#1072#1074#1085#1099#1081' ('#1089#1090#1072#1088#1096#1080#1081') '#1073#1091#1093#1075#1072#1083#1090#1077#1088
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object lDirector: TLabel
            Left = 149
            Top = 119
            Width = 105
            Height = 14
            Alignment = taCenter
            AutoSize = False
            Caption = #1044#1080#1088#1077#1082#1090#1086#1088
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object lShipper: TLabel
            Left = 149
            Top = 178
            Width = 105
            Height = 14
            Alignment = taCenter
            AutoSize = False
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object txtDir: TssBevel
            Left = 367
            Top = 114
            Width = 164
            Height = 21
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = []
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
            WordBreak = False
          end
          object txtBuh: TssBevel
            Left = 368
            Top = 144
            Width = 164
            Height = 21
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = []
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
            WordBreak = False
          end
          object edPlaceCount: TcxTextEdit
            Left = 148
            Top = 25
            Width = 228
            Height = 24
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.MaxLength = 10
            Properties.UseLeftAlignmentOnEditing = False
            Style.BorderColor = clGray
            Style.BorderStyle = ebsNone
            Style.Color = clBtnFace
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            TabOrder = 0
            ImeName = 'Russian'
            OnKeyPress = GoNext
          end
          object edAppx2: TcxTextEdit
            Left = 258
            Top = 55
            Width = 118
            Height = 24
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.MaxLength = 10
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = DataModified
            Style.BorderColor = clGray
            Style.BorderStyle = ebsNone
            Style.Color = clBtnFace
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            TabOrder = 1
            ImeName = 'Russian'
            OnKeyPress = GoNext
          end
          object lcbShipper: TssDBLookupCombo
            Left = 363
            Top = 172
            Width = 172
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = DataModified
            Properties.OnEditValueChanged = lcbShipperPropertiesEditValueChanged
            Style.BorderStyle = ebsNone
            Style.Color = clBtnFace
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            TabOrder = 2
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'name'
            ListSource = srcPersons
          end
          object edPlaceCountCalc: TssCalcEdit
            Left = 371
            Top = 23
            Width = 23
            Height = 24
            TabStop = False
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            ParentFont = False
            Properties.OnChange = edPlaceCountCalcPropertiesChange
            Style.BorderStyle = ebsNone
            Style.HotTrack = False
            Style.StyleController = dmData.scMain
            TabOrder = 3
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object edAppx2Calc: TssCalcEdit
            Left = 371
            Top = 54
            Width = 23
            Height = 24
            TabStop = False
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            ParentFont = False
            Properties.OnChange = edAppx2CalcPropertiesChange
            Style.BorderStyle = ebsNone
            Style.HotTrack = False
            Style.StyleController = dmData.scMain
            TabOrder = 4
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
        end
        object panRight: TPanel
          Left = 511
          Top = 0
          Width = 420
          Height = 240
          Align = alRight
          BevelOuter = bvNone
          Color = clWindow
          ParentBackground = False
          TabOrder = 1
          object ssBevel90: TssBevel
            Left = 12
            Top = 23
            Width = 299
            Height = 4
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsTopLine
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel94: TssBevel
            Left = 12
            Top = 46
            Width = 299
            Height = 12
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1087#1088#1086#1087#1080#1089#1100#1102
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsTopLine
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel35: TssBevel
            Left = 12
            Top = 59
            Width = 4
            Height = 174
            Alignments.Horz = taCenter
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beLeft]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Serif'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object Label42: TLabel
            Left = 25
            Top = 89
            Width = 90
            Height = 11
            Caption = #1055#1086' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080'  '#8470
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object txtAttNum: TssBevel
            Left = 138
            Top = 84
            Width = 95
            Height = 19
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsBottomLine
            Style = bsSingle
            UseGradient = False
          end
          object Label43: TLabel
            Left = 241
            Top = 89
            Width = 10
            Height = 11
            Caption = #1086#1090
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object txtAttDate: TLabel
            Left = 261
            Top = 89
            Width = 2
            Height = 12
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label46: TLabel
            Left = 25
            Top = 113
            Width = 45
            Height = 11
            Caption = #1074#1099#1076#1072#1085#1085#1086#1081' '
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object ssBevel107: TssBevel
            Left = 84
            Top = 131
            Width = 321
            Height = 13
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1082#1077#1084', '#1082#1086#1084#1091' ('#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103', '#1084#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099', '#1076#1086#1083#1078#1085#1086#1089#1090#1100', '#1092#1072#1084#1080#1083#1080#1103', '#1080'.'#1086'.)'
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsTopLine
            Style = bsSingle
            UseGradient = False
          end
          object Label47: TLabel
            Left = 25
            Top = 151
            Width = 52
            Height = 11
            Caption = #1043#1088#1091#1079' '#1087#1088#1080#1085#1103#1083
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object ssBevel108: TssBevel
            Left = 117
            Top = 164
            Width = 65
            Height = 12
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1076#1086#1083#1078#1085#1086#1089#1090#1100
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel109: TssBevel
            Left = 186
            Top = 164
            Width = 87
            Height = 12
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1087#1086#1076#1087#1080#1089#1100
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsTopLine
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel110: TssBevel
            Left = 278
            Top = 164
            Width = 127
            Height = 12
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1088#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072' '#1087#1086#1076#1087#1080#1089#1080
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsTopLine
            Style = bsSingle
            UseGradient = False
          end
          object Label48: TLabel
            Left = 25
            Top = 181
            Width = 73
            Height = 22
            Caption = #1043#1088#1091#1079' '#1087#1086#1083#1091#1095#1080#1083' '#1075#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            WordWrap = True
          end
          object ssBevel111: TssBevel
            Left = 117
            Top = 193
            Width = 65
            Height = 13
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1076#1086#1083#1078#1085#1086#1089#1090#1100
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel112: TssBevel
            Left = 186
            Top = 193
            Width = 87
            Height = 13
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1087#1086#1076#1087#1080#1089#1100
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsTopLine
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel113: TssBevel
            Left = 278
            Top = 193
            Width = 127
            Height = 13
            Alignments.Horz = taCenter
            Alignments.Vert = vaTop
            Caption = #1088#1072#1089#1096#1080#1092#1088#1086#1074#1082#1072' '#1087#1086#1076#1087#1080#1089#1080
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beTop]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsTopLine
            Style = bsSingle
            UseGradient = False
          end
          object Label49: TLabel
            Left = 103
            Top = 214
            Width = 20
            Height = 11
            Caption = #1052'.'#1055'.'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentFont = False
          end
          object lD2: TLabel
            Left = 153
            Top = 217
            Width = 39
            Height = 11
            Caption = '20    '#1075#1086#1076#1072
            Color = clWindow
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Small Fonts'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object ssBevel115: TssBevel
            Left = 822
            Top = 4
            Width = 79
            Height = 21
            Alignments.Horz = taCenter
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beLeft, beRight, beTop, beBottom]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Serif'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel116: TssBevel
            Left = 331
            Top = 1
            Width = 79
            Height = 24
            Alignments.Horz = taCenter
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beLeft, beRight, beTop, beBottom]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Serif'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel117: TssBevel
            Left = 330
            Top = 0
            Width = 81
            Height = 25
            Alignments.Horz = taCenter
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beLeft, beRight, beTop, beBottom]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Serif'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel118: TssBevel
            Left = 331
            Top = 23
            Width = 79
            Height = 24
            Alignments.Horz = taCenter
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beLeft, beRight, beTop, beBottom]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Serif'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel119: TssBevel
            Left = 330
            Top = 23
            Width = 81
            Height = 23
            Alignments.Horz = taCenter
            ColorGrBegin = clWhite
            ColorGrEnd = clWhite
            ColorInner = clBlack
            ColorOuter = clBlack
            Edges = [beLeft, beRight, beTop, beBottom]
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Serif'
            Font.Style = []
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object edNetto: TcxTextEdit
            Left = 10
            Top = 2
            Width = 304
            Height = 24
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.MaxLength = 10
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = DataModified
            Style.BorderColor = clGray
            Style.BorderStyle = ebsNone
            Style.Color = clBtnFace
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            TabOrder = 0
            ImeName = 'Russian'
            OnKeyPress = GoNext
          end
          object edBrutto: TcxTextEdit
            Left = 10
            Top = 25
            Width = 304
            Height = 24
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.MaxLength = 10
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = DataModified
            Style.BorderColor = clGray
            Style.BorderStyle = ebsNone
            Style.Color = clBtnFace
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            TabOrder = 1
            ImeName = 'Russian'
            OnKeyPress = GoNext
          end
          object edAtt: TcxTextEdit
            Left = 81
            Top = 105
            Width = 326
            Height = 24
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.MaxLength = 10
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = DataModified
            Style.BorderColor = clGray
            Style.BorderStyle = ebsNone
            Style.Color = clBtnFace
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            TabOrder = 2
            ImeName = 'Russian'
            OnKeyPress = GoNext
          end
          object edNettoCalc: TssCalcEdit
            Left = 309
            Top = 1
            Width = 23
            Height = 24
            TabStop = False
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            ParentFont = False
            Properties.ImmediatePost = True
            Properties.OnChange = edNettoCalcPropertiesChange
            Style.BorderStyle = ebsNone
            Style.HotTrack = False
            Style.StyleController = dmData.scMain
            TabOrder = 3
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object edBruttoCalc: TssCalcEdit
            Left = 309
            Top = 23
            Width = 23
            Height = 24
            TabStop = False
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            ParentFont = False
            Properties.OnChange = edBruttoCalcPropertiesChange
            Style.BorderStyle = ebsNone
            Style.HotTrack = False
            Style.StyleController = dmData.scMain
            TabOrder = 4
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
        end
      end
    end
  end
  inherited ilTitleBar: TImageList
    Left = 528
    Top = 876
  end
  object ActionList: TActionList
    Images = dmData.Images
    OnUpdate = ActionListUpdate
    Left = 308
    Top = 887
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
    Left = 500
    Top = 876
    ReportForm = {19000000}
  end
  object FormStorage: TssFormStorage
    Active = False
    UseRegistry = True
    StoredValues = <>
    Left = 384
    Top = 887
  end
  object fsrcMaster: TfrDBDataSet
    DataSet = mdReport
    Left = 464
    Top = 876
  end
  object mdReport: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 356
    Top = 887
  end
  object srcPersons: TDataSource
    DataSet = cdsPersons
    Left = 264
    Top = 887
  end
  object cdsPersons: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsPersonsAfterOpen
    Macros = <>
    Left = 236
    Top = 887
  end
  object kaShip: TokKAgent
    RemoteServer = dmData.SConnection
    OnChange = kaShipChange
    LoadContracts = False
    OnAccountChange = kaShipAccountChange
    OnAddrChange = kaShipAddrChange
    Left = 118
    Top = 883
  end
  object kaKA: TokKAgent
    RemoteServer = dmData.SConnection
    OnChange = kaKAChange
    LoadContracts = False
    OnAccountChange = kaKAAccountChange
    OnAddrChange = kaKAAddrChange
    Left = 150
    Top = 883
  end
  object kaEnt: TokKAgent
    RemoteServer = dmData.SConnection
    OnChange = kaShipChange
    LoadContracts = False
    OnAccountChange = kaShipAccountChange
    OnAddrChange = kaShipAddrChange
    Left = 182
    Top = 883
  end
end
