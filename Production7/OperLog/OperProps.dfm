inherited frmOperProps: TfrmOperProps
  Left = 376
  Top = 298
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmOperProps'
  ClientHeight = 415
  ClientWidth = 567
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 567
    Height = 333
    DesignSize = (
      567
      333)
    object bvlMain: TssBevel
      Left = 5
      Top = 1
      Width = 555
      Height = 313
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = True
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object lUser: TLabel
      Left = 22
      Top = 20
      Width = 88
      Height = 16
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
    end
    object txtUser: TssBevel
      Left = 128
      Top = 18
      Width = 146
      Height = 25
      Alignments.Horz = taCenter
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      UseGradient = True
    end
    object lOperDate: TLabel
      Left = 22
      Top = 44
      Width = 87
      Height = 16
      Caption = #1044#1072#1090#1072' '#1089#1086#1073#1099#1090#1080#1103':'
    end
    object txtOnDate: TssBevel
      Left = 128
      Top = 43
      Width = 146
      Height = 25
      Alignments.Horz = taCenter
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      UseGradient = True
    end
    object lFunction: TLabel
      Left = 22
      Top = 84
      Width = 46
      Height = 16
      Caption = #1056#1072#1079#1076#1077#1083':'
    end
    object txtFunction: TssBevel
      Left = 128
      Top = 82
      Width = 417
      Height = 25
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      UseGradient = True
    end
    object lOperTime: TLabel
      Left = 295
      Top = 44
      Width = 94
      Height = 16
      Alignment = taRightJustify
      Caption = #1042#1088#1077#1084#1103' '#1089#1086#1073#1099#1090#1080#1103':'
    end
    object txtOnTime: TssBevel
      Left = 399
      Top = 43
      Width = 146
      Height = 25
      Alignments.Horz = taCenter
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      UseGradient = True
    end
    object lOperType: TLabel
      Left = 22
      Top = 108
      Width = 80
      Height = 16
      Caption = #1058#1080#1087' '#1089#1086#1073#1099#1090#1080#1103':'
    end
    object txtOpCode: TssBevel
      Left = 128
      Top = 107
      Width = 146
      Height = 25
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      UseGradient = True
    end
    object lDataBefore: TLabel
      Left = 22
      Top = 148
      Width = 102
      Height = 40
      AutoSize = False
      Caption = #1044#1072#1085#1085#1099#1077' '#1076#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1103':'
      WordWrap = True
    end
    object lDataAfter: TLabel
      Left = 22
      Top = 226
      Width = 102
      Height = 41
      AutoSize = False
      Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086#1089#1083#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1103':'
      WordWrap = True
    end
    object bvlDataAfter: TssBevel
      Left = 128
      Top = 222
      Width = 417
      Height = 68
      Alignments.Horz = taRightJustify
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      UseGradient = True
    end
    object ssBevel1: TssBevel
      Left = 128
      Top = 146
      Width = 417
      Height = 67
      Alignments.Horz = taRightJustify
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      UseGradient = True
    end
    object imgOpCode: TImage
      Left = 281
      Top = 110
      Width = 19
      Height = 19
      Transparent = True
    end
    object txtDataBefore: TRichEdit
      Left = 132
      Top = 151
      Width = 411
      Height = 56
      BevelEdges = []
      BorderStyle = bsNone
      ImeName = 'Russian'
      ReadOnly = True
      TabOrder = 0
    end
    object txtDataAfter: TRichEdit
      Left = 132
      Top = 228
      Width = 411
      Height = 55
      BevelEdges = []
      BorderStyle = bsNone
      ImeName = 'Russian'
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 567
    TabOrder = 3
    inherited panTitleButtons: TssPanel
      Left = 509
    end
  end
  inherited panButtons: TPanel
    Top = 380
    Width = 567
    inherited btnOK: TxButton
      Left = 462
      Top = 4
    end
    inherited btnCancel: TxButton
      Left = 27
      Top = 4
      Visible = False
    end
    inherited btnApply: TxButton
      Left = 137
      Top = 4
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 567
    TabOrder = 2
    inherited btnLock: TssSpeedButton
      Left = 475
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 503
    end
    inherited btnHelp: TssSpeedButton
      Left = 532
    end
    object btnPrint: TssSpeedButton
      Left = 5
      Top = 1
      Action = aPrint
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 36
      Images = dmData.Images18x18
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnDocHistory: TssSpeedButton
      Left = 33
      Top = 1
      Action = aDocHistory
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 117
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
  end
  inherited ilTitleBar: TImageList
    Left = 292
    Top = 280
  end
  inherited FormStorage: TssFormStorage
    Left = 236
    Top = 280
  end
  inherited ActionList: TActionList
    Left = 264
    Top = 280
    object aPrint: TAction [5]
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aDocHistory: TAction [6]
      Caption = 'aDocHistory'
      ImageIndex = 117
      ShortCut = 16457
      OnExecute = aDocHistoryExecute
    end
  end
  object cdsUsers: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSysUsers_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 112
    Top = 172
  end
end
