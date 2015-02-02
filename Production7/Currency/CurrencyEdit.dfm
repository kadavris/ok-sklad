inherited frmCurrencyEdit: TfrmCurrencyEdit
  Left = 291
  Top = 187
  HelpContext = 1
  VertScrollBar.Range = 0
  ActiveControl = edName
  BorderStyle = bsDialog
  Caption = 'frmCurrencyEdit'
  ClientHeight = 413
  ClientWidth = 562
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 562
    Height = 331
    TabOrder = 1
  end
  inherited panTitleBar: TssGradientPanel
    Width = 562
    inherited panTitleButtons: TssPanel
      Left = 504
    end
  end
  inherited panButtons: TPanel
    Top = 378
    Width = 562
    TabOrder = 4
    DesignSize = (
      562
      35)
    inherited btnOK: TxButton
      Left = 251
      Top = 6
    end
    inherited btnCancel: TxButton
      Left = 354
      Top = 6
    end
    inherited btnApply: TxButton
      Left = 458
      Top = 6
    end
  end
  object Panel2: TPanel [3]
    Left = 4
    Top = 55
    Width = 555
    Height = 322
    Anchors = [akLeft, akTop, akBottom]
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      555
      322)
    object gbMainInfo: TssGroupBox
      Left = 0
      Top = 0
      Width = 555
      Height = 228
      Align = alTop
      Alignment = alTopLeft
      Caption = ' '#1054#1089#1085#1086#1074#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '
      TabOrder = 0
      TabStop = False
      Edges = [beLeft, beRight, beTop, beBottom]
      HotTrack = False
      DesignSize = (
        555
        228)
      object bvlSep: TssBevel
        Left = 2
        Top = 178
        Width = 552
        Height = 2
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
      object lBase: TssLabel
        Left = 364
        Top = 117
        Width = 24
        Height = 16
        Caption = 'UAH'
        DisabledDraw = ddStandard
        DisabledColor = clBlack
      end
      object lOneCurr: TssLabel
        Left = 172
        Top = 117
        Width = 51
        Height = 16
        Caption = '1 ___ ='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        DisabledDraw = ddStandard
        DisabledColor = clBlack
      end
      object lOneBase: TssLabel
        Left = 172
        Top = 145
        Width = 54
        Height = 16
        Caption = '1 UAH ='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        DisabledDraw = ddStandard
        DisabledColor = clBlack
      end
      object lCurr: TssLabel
        Left = 364
        Top = 146
        Width = 21
        Height = 16
        Caption = '___'
        DisabledDraw = ddStandard
        DisabledColor = clBlack
      end
      object lRate: TssLabel
        Left = 18
        Top = 118
        Width = 84
        Height = 16
        Caption = 'Exchange Rate'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lOnDate: TssLabel
        Left = 18
        Top = 90
        Width = 29
        Height = 16
        Caption = #1044#1072#1090#1072
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lName: TssLabel
        Left = 20
        Top = 34
        Width = 86
        Height = 16
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lShortName: TssLabel
        Left = 20
        Top = 62
        Width = 121
        Height = 16
        Caption = #1057#1086#1082#1088'. '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object edName: TcxTextEdit
        Left = 169
        Top = 27
        Width = 371
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        BeepOnEnter = False
        ParentFont = False
        Properties.MaxLength = 24
        Properties.OnChange = edNamePropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 0
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edShortName: TcxTextEdit
        Left = 169
        Top = 55
        Width = 371
        Height = 24
        BeepOnEnter = False
        ParentFont = False
        Properties.MaxLength = 3
        Properties.OnChange = edShortNamePropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 1
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edOnDate: TcxDateEdit
        Left = 169
        Top = 84
        Width = 115
        Height = 24
        BeepOnEnter = False
        ImeName = 'Russian'
        ParentFont = False
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnChange = edOnDatePropertiesChange
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.StyleController = dmData.scMain
        TabOrder = 2
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edRate: TssCalcEdit
        Left = 241
        Top = 112
        Width = 115
        Height = 24
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = edRatePropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 3
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
        CalcColor = clBtnFace
        DecimalPlaces = 8
      end
      object chbDefault: TcxCheckBox
        Left = 11
        Top = 190
        Width = 537
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = DataModified
        Properties.Caption = #1041#1072#1079#1086#1074#1072#1103' '#1074#1072#1083#1102#1090#1072' ('#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102')'
        Style.BorderColor = clBtnShadow
        Style.BorderStyle = ebsSingle
        Style.HotTrack = False
        TabOrder = 5
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edRateEx: TssCalcEdit
        Left = 241
        Top = 140
        Width = 115
        Height = 24
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = edRateExPropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 4
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
        CalcColor = clBtnFace
        DecimalPlaces = 8
      end
    end
    object gbRep: TssGroupBox
      Left = 0
      Top = 227
      Width = 554
      Height = 91
      Alignment = alTopLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' '#1055#1077#1095#1072#1090#1100' '#1074' '#1086#1090#1095#1105#1090#1072#1093' '
      TabOrder = 1
      TabStop = False
      Edges = [beLeft, beRight, beTop, beBottom]
      HotTrack = False
      object lRepShortName: TssLabel
        Left = 20
        Top = 30
        Width = 86
        Height = 16
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lRepFracName: TssLabel
        Left = 20
        Top = 59
        Width = 86
        Height = 16
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object edRepShortName: TcxTextEdit
        Left = 169
        Top = 25
        Width = 118
        Height = 24
        BeepOnEnter = False
        ParentFont = False
        Properties.MaxLength = 10
        Properties.OnChange = edShortNamePropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 0
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edRepFracName: TcxTextEdit
        Left = 169
        Top = 54
        Width = 118
        Height = 24
        BeepOnEnter = False
        ParentFont = False
        Properties.MaxLength = 10
        Properties.OnChange = edShortNamePropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 1
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
    end
  end
  inherited panToolBar: TPanel
    Width = 562
    inherited btnLock: TssSpeedButton
      Left = 475
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 502
    end
    inherited btnHelp: TssSpeedButton
      Left = 529
    end
  end
  inherited ilTitleBar: TImageList
    Left = 412
    Top = 156
  end
  inherited FormStorage: TssFormStorage
    Left = 448
    Top = 156
  end
  inherited ActionList: TActionList
    Left = 476
    Top = 156
  end
end
