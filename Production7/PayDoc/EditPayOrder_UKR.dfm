inherited frmEditPayOrder_UKR: TfrmEditPayOrder_UKR
  Left = 155
  Top = 193
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = #1055#1083#1072#1090#1105#1078#1085#1086#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1077
  ClientHeight = 667
  ClientWidth = 900
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object bvlFrame: TssBevel [0]
    Left = 5
    Top = 32
    Width = 890
    Height = 544
    Anchors = [akLeft, akTop, akRight]
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
  object lTitle: TLabel [1]
    Left = 113
    Top = 49
    Width = 178
    Height = 16
    Caption = #1055#1051#1040#1058#1030#1046#1053#1045' '#1044#1054#1056#1059#1063#1045#1053#1053#1071'  '#8470
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lFrom: TLabel [2]
    Left = 172
    Top = 84
    Width = 17
    Height = 16
    Caption = #1074#1110#1076
    Color = clWhite
    ParentColor = False
  end
  object lPayer: TLabel [3]
    Left = 39
    Top = 113
    Width = 48
    Height = 16
    Caption = #1055#1083#1072#1090#1085#1080#1082
    Color = clWhite
    ParentColor = False
  end
  object lEnt: TLabel [4]
    Left = 153
    Top = 113
    Width = 469
    Height = 36
    AutoSize = False
    Caption = '<Enterprise Name>'
    Color = clWhite
    ParentColor = False
    WordWrap = True
  end
  object lEntOKPO: TLabel [5]
    Left = 39
    Top = 153
    Width = 90
    Height = 16
    Caption = #1050#1086#1076' '#1079#1072' '#1028#1044#1056#1055#1054#1059
    Color = clWhite
    ParentColor = False
  end
  object bvlEntOKPO: TssBevel [6]
    Left = 153
    Top = 148
    Width = 89
    Height = 26
    ColorGrBegin = clWhite
    ColorGrEnd = clWhite
    ColorInner = clBlack
    ColorOuter = clBlack
    Edges = [beLeft, beRight, beTop, beBottom]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Shape = bsFrame
    UseGradient = False
  end
  object lEntOKPOv: TLabel [7]
    Left = 160
    Top = 153
    Width = 64
    Height = 16
    Caption = '30011430'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lEntBank: TLabel [8]
    Left = 39
    Top = 182
    Width = 86
    Height = 16
    Caption = #1041#1072#1085#1082' '#1087#1083#1072#1090#1085#1080#1082#1072
    Color = clWhite
    ParentColor = False
  end
  object lEntBankv: TLabel [9]
    Left = 39
    Top = 212
    Width = 258
    Height = 18
    Caption = #1040#1041' "'#1050#1088#1077#1076#1080#1090#1044#1085#1110#1087#1088#1086'" '#1084'. '#1044#1085#1110#1087#1088#1086'-'#1089#1100#1082
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object bvlEntBank: TssBevel [10]
    Left = 39
    Top = 231
    Width = 352
    Height = 11
    ColorGrBegin = clWhite
    ColorGrEnd = clWhite
    ColorInner = clBtnShadow
    ColorOuter = clBlack
    Edges = [beTop]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Style = bsSingle
    UseGradient = False
  end
  object bvlEntMFO: TssBevel [11]
    Left = 388
    Top = 202
    Width = 90
    Height = 31
    ColorGrBegin = clWhite
    ColorGrEnd = clWhite
    ColorInner = clBlack
    ColorOuter = clBlack
    Edges = [beLeft, beRight, beTop, beBottom]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Shape = bsFrame
    UseGradient = False
  end
  object lEntMFOv: TLabel [12]
    Left = 396
    Top = 212
    Width = 48
    Height = 16
    Caption = '305749'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lEntMFO: TLabel [13]
    Left = 389
    Top = 182
    Width = 58
    Height = 16
    Caption = #1050#1086#1076' '#1073#1072#1085#1082#1091
    Color = clWhite
    ParentColor = False
  end
  object lReceiver: TLabel [14]
    Left = 39
    Top = 261
    Width = 67
    Height = 16
    Caption = #1054#1076#1077#1088#1078#1091#1074#1072#1095
    Color = clWhite
    ParentColor = False
  end
  object lKAgent: TLabel [15]
    Left = 153
    Top = 261
    Width = 326
    Height = 36
    AutoSize = False
    Caption = '<KAgent Name>'
    Color = clWhite
    ParentColor = False
    WordWrap = True
  end
  object lKAgentOKPO: TLabel [16]
    Left = 39
    Top = 305
    Width = 90
    Height = 16
    Caption = #1050#1086#1076' '#1079#1072' '#1028#1044#1056#1055#1054#1059
    Color = clWhite
    ParentColor = False
  end
  object bvlKAgentOKPO: TssBevel [17]
    Left = 153
    Top = 300
    Width = 89
    Height = 26
    ColorGrBegin = clWhite
    ColorGrEnd = clWhite
    ColorInner = clBlack
    ColorOuter = clBlack
    Edges = [beLeft, beRight, beTop, beBottom]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Shape = bsFrame
    UseGradient = False
  end
  object lKAgentOKPOv: TLabel [18]
    Left = 160
    Top = 305
    Width = 64
    Height = 16
    Caption = '30011430'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lKAgentBank: TLabel [19]
    Left = 39
    Top = 335
    Width = 104
    Height = 16
    Caption = #1041#1072#1085#1082' '#1086#1076#1077#1088#1078#1091#1074#1072#1095#1072
    Color = clWhite
    ParentColor = False
  end
  object lKAgentBankv: TLabel [20]
    Left = 39
    Top = 364
    Width = 4
    Height = 18
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object bvlKAgentBank: TssBevel [21]
    Left = 39
    Top = 384
    Width = 352
    Height = 11
    ColorGrBegin = clWhite
    ColorGrEnd = clWhite
    ColorInner = clBtnShadow
    ColorOuter = clBlack
    Edges = [beTop]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Style = bsSingle
    UseGradient = False
  end
  object lKAgentMFO: TLabel [22]
    Left = 389
    Top = 335
    Width = 58
    Height = 16
    Caption = #1050#1086#1076' '#1073#1072#1085#1082#1091
    Color = clWhite
    ParentColor = False
  end
  object bvlKAgentMFO: TssBevel [23]
    Left = 388
    Top = 354
    Width = 90
    Height = 31
    ColorGrBegin = clWhite
    ColorGrEnd = clWhite
    ColorInner = clBlack
    ColorOuter = clBlack
    Edges = [beLeft, beRight, beTop, beBottom]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Shape = bsFrame
    UseGradient = False
  end
  object lKAgentMFOv: TLabel [24]
    Left = 396
    Top = 364
    Width = 4
    Height = 16
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object bvlEntAcc: TssBevel [25]
    Left = 501
    Top = 202
    Width = 199
    Height = 50
    ColorGrBegin = clWhite
    ColorGrEnd = clWhite
    ColorInner = clBlack
    ColorOuter = clBlack
    Edges = [beLeft, beRight, beTop, beBottom]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Shape = bsFrame
    UseGradient = False
  end
  object lEntAcc: TLabel [26]
    Left = 502
    Top = 182
    Width = 86
    Height = 16
    Caption = #1044#1045#1041#1045#1058' '#1088#1072#1093'. '#8470
    Color = clWhite
    ParentColor = False
  end
  object lSum: TLabel [27]
    Left = 704
    Top = 182
    Width = 33
    Height = 16
    Caption = #1057#1059#1052#1040
    Color = clWhite
    ParentColor = False
  end
  object bvlKAgentAcc: TssBevel [28]
    Left = 501
    Top = 287
    Width = 199
    Height = 50
    ColorGrBegin = clWhite
    ColorGrEnd = clWhite
    ColorInner = clBlack
    ColorOuter = clBlack
    Edges = [beLeft, beRight, beTop, beBottom]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Shape = bsFrame
    UseGradient = False
  end
  object bvlEmpty: TssBevel [29]
    Left = 501
    Top = 335
    Width = 199
    Height = 50
    ColorGrBegin = clWhite
    ColorGrEnd = clWhite
    ColorInner = clBlack
    ColorOuter = clBlack
    Edges = [beLeft, beRight, beTop, beBottom]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Shape = bsFrame
    UseGradient = False
  end
  object bvlSum: TssBevel [30]
    Left = 698
    Top = 202
    Width = 165
    Height = 183
    ColorGrBegin = clWhite
    ColorGrEnd = clWhite
    ColorInner = clBlack
    ColorOuter = clBlack
    Edges = [beLeft, beRight, beTop, beBottom]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Shape = bsFrame
    UseGradient = False
  end
  object lSumv: TLabel [31]
    Left = 706
    Top = 217
    Width = 75
    Height = 19
    Caption = '10000,00'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lKAgentAcc: TLabel [32]
    Left = 502
    Top = 266
    Width = 93
    Height = 16
    Caption = #1050#1056#1045#1044#1048#1058' '#1088#1072#1093'. '#8470
    Color = clWhite
    ParentColor = False
  end
  object lSumStr: TLabel [33]
    Left = 39
    Top = 399
    Width = 92
    Height = 16
    Caption = #1057#1091#1084#1072' ('#1089#1083#1086#1074#1072#1084#1080')'
    Color = clWhite
    ParentColor = False
  end
  object lSumStrv: TLabel [34]
    Left = 148
    Top = 399
    Width = 170
    Height = 16
    Caption = #1044#1077#1089#1103#1090#1100' '#1090#1080#1089#1103#1095' '#1075#1088#1085'. 00 '#1082#1086#1087'.'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object bvlSumStr: TssBevel [35]
    Left = 39
    Top = 423
    Width = 440
    Height = 11
    ColorGrBegin = clWhite
    ColorGrEnd = clWhite
    ColorInner = clBtnShadow
    ColorOuter = clBlack
    Edges = [beTop]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Style = bsSingle
    UseGradient = False
  end
  object lDest: TLabel [36]
    Left = 39
    Top = 433
    Width = 131
    Height = 16
    Caption = #1055#1088#1080#1079#1085#1072#1095#1077#1085#1085#1103' '#1087#1083#1072#1090#1077#1078#1091
    Color = clWhite
    ParentColor = False
  end
  object lMP: TLabel [37]
    Left = 39
    Top = 507
    Width = 26
    Height = 16
    Caption = #1052'.'#1055'.'
    Color = clWhite
    ParentColor = False
  end
  object lSubscr: TLabel [38]
    Left = 138
    Top = 507
    Width = 38
    Height = 16
    Caption = #1055#1110#1076#1087#1080#1089
    Color = clWhite
    ParentColor = False
  end
  object ssBevel1: TssBevel [39]
    Left = 217
    Top = 522
    Width = 168
    Height = 11
    ColorGrBegin = clWhite
    ColorGrEnd = clWhite
    ColorInner = clBtnShadow
    ColorOuter = clBlack
    Edges = [beTop]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Style = bsSingle
    UseGradient = False
  end
  object ssBevel2: TssBevel [40]
    Left = 217
    Top = 546
    Width = 168
    Height = 12
    ColorGrBegin = clWhite
    ColorGrEnd = clWhite
    ColorInner = clBtnShadow
    ColorOuter = clBlack
    Edges = [beTop]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Style = bsSingle
    UseGradient = False
  end
  object lBankDate: TLabel [41]
    Left = 660
    Top = 527
    Width = 186
    Height = 16
    Caption = '"__"________________ 200__'#1088'.'
    Color = clWhite
    ParentColor = False
  end
  object lBankSubscr: TLabel [42]
    Left = 714
    Top = 551
    Width = 75
    Height = 16
    Caption = #1055#1110#1076#1087#1080#1089' '#1073#1072#1085#1082#1091
    Color = clWhite
    ParentColor = False
  end
  object Label1: TLabel [43]
    Left = 714
    Top = 502
    Width = 110
    Height = 16
    Caption = #1055#1088#1086#1074#1077#1076#1077#1085#1086' '#1073#1072#1085#1082#1086#1084
    Color = clWhite
    ParentColor = False
  end
  object ssBevel3: TssBevel [44]
    Left = 714
    Top = 468
    Width = 90
    Height = 26
    ColorGrBegin = clWhite
    ColorGrEnd = clWhite
    ColorInner = clBlack
    ColorOuter = clBlack
    Edges = [beLeft, beRight, beTop, beBottom]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Shape = bsFrame
    UseGradient = False
  end
  object Label2: TLabel [45]
    Left = 714
    Top = 89
    Width = 107
    Height = 16
    Caption = #1054#1076#1077#1088#1078#1072#1085#1086' '#1073#1072#1085#1082#1086#1084
    Color = clWhite
    ParentColor = False
  end
  object Label3: TLabel [46]
    Left = 660
    Top = 113
    Width = 186
    Height = 16
    Caption = '"__"________________ 200__'#1088'.'
    Color = clWhite
    ParentColor = False
  end
  object lCount: TLabel [47]
    Left = 654
    Top = 591
    Width = 147
    Height = 16
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1101#1082#1079#1077#1084#1087#1083#1103#1088#1086#1074
  end
  object btnNewAcc: TssSpeedButton [48]
    Left = 667
    Top = 299
    Width = 26
    Height = 27
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
    OnMouseUp = btnNewAccMouseUp
  end
  object btnEntAccv: TssSpeedButton [49]
    Left = 667
    Top = 215
    Width = 26
    Height = 27
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
    OnMouseUp = btnNewAccMouseUp
  end
  inherited panTitleBar: TssGradientPanel
    Width = 900
    inherited panTitleButtons: TssPanel
      Left = 841
    end
  end
  object panButtons: TPanel [51]
    Left = 0
    Top = 623
    Width = 900
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 9
    DesignSize = (
      900
      44)
    object bvlFooterSep: TssBevel
      Left = 0
      Top = 0
      Width = 900
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
      Left = 692
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
      Left = 796
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
      TabOrder = 2
    end
    object btnDel: TxButton
      Left = 588
      Top = 11
      Width = 99
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
  object edNum: TcxTextEdit [52]
    Left = 330
    Top = 44
    Width = 90
    Height = 24
    ParentFont = False
    Properties.MaxLength = 15
    Properties.OnChange = edNumPropertiesChange
    Style.BorderColor = clGray
    Style.BorderStyle = ebsSingle
    Style.Color = clBtnFace
    TabOrder = 1
    ImeName = 'Russian'
    OnKeyPress = GoNext
  end
  object edOnDate: TcxDateEdit [53]
    Left = 197
    Top = 79
    Width = 109
    Height = 24
    ImeName = 'Russian'
    Properties.OnChange = edNumPropertiesChange
    Style.BorderColor = clGray
    Style.BorderStyle = ebsSingle
    Style.Color = clBtnFace
    Style.ButtonStyle = btsSimple
    TabOrder = 2
    OnKeyPress = GoNext
  end
  object lcbAcc: TssDBLookupCombo [54]
    Left = 511
    Top = 298
    Width = 155
    Height = 24
    ImeName = 'Russian'
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.OnEditValueChanged = lcbAccPropertiesEditValueChanged
    Style.BorderColor = clGray
    Style.BorderStyle = ebsSingle
    Style.Color = clBtnFace
    Style.HotTrack = True
    Style.ButtonStyle = btsSimple
    TabOrder = 4
    OnEnter = lcbAccEnter
    OnExit = lcbAccExit
    OnKeyPress = GoNext
    EmptyValue = 0
    KeyField = 'accid'
    ListField = 'accnum'
    ListSource = srcAcc
  end
  object memDest: TcxMemo [55]
    Left = 217
    Top = 433
    Width = 478
    Height = 61
    ImeName = 'Russian'
    Properties.MaxLength = 255
    Properties.OnChange = edNumPropertiesChange
    Style.BorderColor = clGray
    Style.BorderStyle = ebsSingle
    Style.Color = clBtnFace
    Style.HotTrack = True
    TabOrder = 6
  end
  object edAcc: TcxTextEdit [56]
    Left = 768
    Top = 44
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
    TabOrder = 3
    Text = '0410001'
    ImeName = 'Russian'
    OnKeyPress = GoNext
  end
  object edDocCount: TcxSpinEdit [57]
    Left = 831
    Top = 586
    Width = 65
    Height = 24
    ParentFont = False
    Properties.MaxValue = 10000000.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Properties.OnChange = edDocCountPropertiesChange
    Style.StyleController = dmData.scMain
    TabOrder = 8
    Value = 2
    ImeName = 'Russian'
    OnKeyPress = GoNext
  end
  object chbDefault: TcxCheckBox [58]
    Left = 10
    Top = 583
    Width = 237
    Height = 24
    Properties.DisplayUnchecked = 'False'
    Properties.OnEditValueChanged = edNumPropertiesChange
    Properties.Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    TabOrder = 7
    ImeName = 'Russian'
    OnKeyPress = GoNext
  end
  object lcbEntAccv: TssDBLookupCombo [59]
    Left = 511
    Top = 214
    Width = 155
    Height = 24
    ImeName = 'Russian'
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.OnEditValueChanged = lcbEntAccvPropertiesEditValueChanged
    Style.BorderColor = clGray
    Style.BorderStyle = ebsSingle
    Style.Color = clBtnFace
    Style.HotTrack = True
    Style.ButtonStyle = btsSimple
    TabOrder = 5
    OnEnter = lcbAccEnter
    OnExit = lcbAccExit
    OnKeyPress = GoNext
    EmptyValue = 0
    KeyField = 'accid'
    ListField = 'accnum'
    ListSource = srcEntAcc
  end
  inherited ilTitleBar: TImageList
    Left = 640
    Top = 293
  end
  object ActionList: TActionList
    Images = dmData.Images
    OnUpdate = ActionListUpdate
    Left = 668
    Top = 293
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
    Left = 640
    Top = 321
  end
  object srcAcc: TDataSource
    DataSet = cdsAcc
    Left = 668
    Top = 321
  end
  object frDoc: TfrReport
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnBeginBand = frDocBeginBand
    OnGetValue = frDocGetValue
    Left = 668
    Top = 349
    ReportForm = {19000000}
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
    Left = 476
    Top = 109
  end
  object srcEntAcc: TDataSource
    DataSet = cdsEntAcc
    Left = 504
    Top = 109
  end
end
