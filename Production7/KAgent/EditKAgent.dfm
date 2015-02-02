inherited frmEditKAgent: TfrmEditKAgent
  Left = 371
  Top = 226
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmEditKAgent'
  ClientHeight = 585
  ClientWidth = 821
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 821
    Height = 503
    TabOrder = 2
  end
  inherited panTitleBar: TssGradientPanel
    Width = 821
    TabOrder = 0
    inherited panTitleButtons: TssPanel
      Left = 763
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 55
    Width = 821
    Height = 523
    Anchors = [akLeft, akTop, akBottom]
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      821
      523)
    object ssBevel1: TssBevel
      Left = 5
      Top = 5
      Width = 262
      Height = 486
      Anchors = [akLeft, akTop, akBottom]
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
    object pcEditKAgent: TcxPageControl
      Left = 273
      Top = -2
      Width = 543
      Height = 493
      ActivePage = PageMain
      Anchors = [akLeft, akTop, akRight, akBottom]
      HideTabs = True
      Images = dmData.Images
      Style = 3
      TabOrder = 1
      object PageMain: TcxTabSheet
        Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
        ImageIndex = 24
        DesignSize = (
          543
          493)
        object gbMainInfo: TssGroupBox
          Left = 0
          Top = 0
          Width = 543
          Height = 354
          Alignment = alTopLeft
          Anchors = [akLeft, akTop, akBottom]
          Caption = ' '#1054#1089#1085#1086#1074#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '
          TabOrder = 0
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            543
            354)
          object lKType: TLabel
            Left = 18
            Top = 33
            Width = 98
            Height = 16
            Caption = #1058#1080#1087' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
          end
          object lINN: TssLabel
            Left = 18
            Top = 325
            Width = 23
            Height = 16
            Caption = 'lINN'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lCertNum: TssLabel
            Left = 186
            Top = 272
            Width = 53
            Height = 16
            Caption = 'lCertNum'
            Color = clBtnFace
            ParentColor = False
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lKAKind: TLabel
            Left = 18
            Top = 63
            Width = 85
            Height = 16
            Caption = #1050#1077#1084' '#1103#1074#1083#1103#1077#1090#1089#1103':'
          end
          object cbKType: TcxComboBox
            Left = 158
            Top = 28
            Width = 222
            Height = 24
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = cbKTypePropertiesChange
            Properties.OnEditValueChanged = cbKTypePropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnKeyPress = GoNext
          end
          object chbNDSPayer: TcxCheckBox
            Left = 14
            Top = 268
            Width = 164
            Height = 24
            ParentFont = False
            Properties.Alignment = taRightJustify
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1053#1044#1057
            State = cbsChecked
            Style.StyleController = dmData.scMain
            TabOrder = 3
            ImeName = 'Russian'
            OnClick = chbNDSPayerClick
            OnKeyPress = GoNext
          end
          object edINN: TcxTextEdit
            Left = 156
            Top = 319
            Width = 223
            Height = 24
            Properties.MaxLength = 20
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 4
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edCertNum: TcxTextEdit
            Left = 308
            Top = 267
            Width = 222
            Height = 24
            Properties.MaxLength = 15
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 5
            ImeName = 'Russian'
            OnKeyDown = edCertNumKeyDown
            OnKeyPress = GoNext
            OnKeyUp = edCertNumKeyUp
          end
          object pcName: TPageControl
            Left = 15
            Top = 81
            Width = 519
            Height = 186
            ActivePage = tsEnt
            Anchors = [akLeft, akTop, akRight]
            Style = tsButtons
            TabOrder = 2
            OnChange = edNamePropertiesChange
            object tsPerson: TTabSheet
              Caption = 'tsPerson'
              TabVisible = False
              DesignSize = (
                511
                176)
              object lFIO: TLabel
                Left = -1
                Top = 5
                Width = 27
                Height = 16
                Caption = #1060#1048#1054
              end
              object lBirthDate: TLabel
                Left = -1
                Top = 34
                Width = 92
                Height = 16
                Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
              end
              object lJob: TLabel
                Left = -1
                Top = 65
                Width = 71
                Height = 16
                Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
              end
              object lUser: TLabel
                Left = -1
                Top = 148
                Width = 88
                Height = 16
                Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
              end
              object btnAddUser: TssSpeedButton
                Left = 478
                Top = 142
                Alignment = taLeftJustify
                AllwaysShowFrame = False
                ButtonType = ssbtStandard
                Checked = False
                Caption = 'aNew'
                DisabledImages = dmData.Images18x18dis
                DisabledImageIndex = 0
                GroupIndex = 0
                ImageIndex = 0
                Images = dmData.Images18x18
                LeftMargin = 4
                Style = ssbsFlat
                ViewStyle = ssvsGlyphOnly
                OnClick = btnAddUserClick
              end
              object edFIO: TcxTextEdit
                Left = 121
                Top = 0
                Width = 389
                Height = 24
                Anchors = [akLeft, akTop, akRight]
                Properties.MaxLength = 64
                Properties.OnChange = edNamePropertiesChange
                Style.StyleController = dmData.scMain
                TabOrder = 0
                ImeName = 'Russian'
                OnKeyDown = edFIOKeyDown
                OnKeyPress = GoNext
              end
              object edBirthDate: TcxDateEdit
                Left = 121
                Top = 30
                Width = 114
                Height = 24
                ImeName = 'Russian'
                Properties.InputKind = ikMask
                Style.StyleController = dmData.scMain
                TabOrder = 1
                OnKeyDown = GoNextKeyDown
                OnKeyPress = GoNext
              end
              object cbJob: TcxComboBox
                Left = 271
                Top = 110
                Width = 239
                Height = 24
                ImeName = 'Russian'
                Properties.OnChange = DataModified
                Style.StyleController = dmData.scMain
                TabOrder = 5
                OnKeyPress = GoNext
              end
              object rbtDirector: TcxRadioButton
                Left = 121
                Top = 64
                Width = 190
                Height = 21
                Caption = #1044#1080#1088#1077#1082#1090#1086#1088
                TabOrder = 2
                OnClick = rbtBuhClick
                OnKeyDown = GoNextKeyDown
                OnKeyPress = GoNext
              end
              object rbtBuh: TcxRadioButton
                Left = 121
                Top = 89
                Width = 190
                Height = 21
                Caption = #1043#1083#1072#1074#1085#1099#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088
                TabOrder = 3
                OnClick = rbtBuhClick
                OnKeyDown = GoNextKeyDown
                OnKeyPress = GoNext
              end
              object rbtOther: TcxRadioButton
                Left = 121
                Top = 113
                Width = 151
                Height = 21
                Caption = #1044#1088#1091#1075#1072#1103
                Checked = True
                TabOrder = 4
                TabStop = True
                OnClick = rbtBuhClick
                OnKeyDown = GoNextKeyDown
                OnKeyPress = GoNext
              end
              object lcbUser: TssDBLookupCombo
                Left = 121
                Top = 143
                Width = 353
                Height = 24
                Anchors = [akLeft, akTop, akRight]
                ImeName = 'Russian'
                Properties.DropDownListStyle = lsEditFixedList
                Style.StyleController = dmData.scMain
                TabOrder = 6
                OnKeyPress = GoNext
                EmptyValue = -1
                KeyField = 'userid'
                ListField = 'FName'
                ListSource = srcUsers
              end
            end
            object tsEnt: TTabSheet
              Caption = #39
              ImageIndex = 1
              TabVisible = False
              DesignSize = (
                511
                176)
              object lName: TLabel
                Left = 1
                Top = 5
                Width = 91
                Height = 16
                Caption = #1057#1086#1082#1088'. '#1085#1072#1079#1074#1072#1085#1080#1077
              end
              object sbAddToFull: TssSpeedButton
                Left = 485
                Top = 1
                Alignment = taLeftJustify
                AllwaysShowFrame = False
                Anchors = [akTop, akRight]
                ButtonType = ssbtStandard
                Checked = False
                GroupIndex = 0
                ImageIndex = 71
                Images = dmData.Images
                LeftMargin = 4
                Style = ssbsUser
                ViewStyle = ssvsGlyphOnly
                OnClick = sbAddToFullClick
              end
              object lFullName: TLabel
                Left = 1
                Top = 30
                Width = 102
                Height = 16
                Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
              end
              object lOKPO: TLabel
                Left = 1
                Top = 119
                Width = 33
                Height = 16
                Caption = #1054#1050#1055#1054
              end
              object lKPP: TLabel
                Left = 1
                Top = 148
                Width = 23
                Height = 16
                Caption = #1050#1055#1055
              end
              object edName: TcxTextEdit
                Left = 138
                Top = 0
                Width = 347
                Height = 24
                Anchors = [akLeft, akTop, akRight]
                Properties.MaxLength = 64
                Properties.OnChange = edNamePropertiesChange
                Style.StyleController = dmData.scMain
                TabOrder = 0
                ImeName = 'Russian'
                OnKeyDown = edFIOKeyDown
                OnKeyPress = GoNext
              end
              object edFullName: TcxMemo
                Left = 138
                Top = 30
                Width = 373
                Height = 60
                Anchors = [akLeft, akTop, akRight]
                ImeName = 'Russian'
                Properties.MaxLength = 255
                Properties.OnChange = DataModified
                Style.StyleController = dmData.scMain
                TabOrder = 1
                OnKeyDown = GoNextKeyDown
                OnKeyPress = GoNext
              end
              object edOKPO: TcxTextEdit
                Left = 139
                Top = 112
                Width = 223
                Height = 24
                Properties.MaxLength = 14
                Properties.OnChange = edOKPOPropertiesChange
                Style.StyleController = dmData.scMain
                TabOrder = 2
                ImeName = 'Russian'
                OnKeyDown = GoNextKeyDown
                OnKeyPress = GoNext
              end
              object edKPP: TcxTextEdit
                Left = 139
                Top = 142
                Width = 223
                Height = 24
                Properties.MaxLength = 32
                Properties.OnChange = DataModified
                Style.StyleController = dmData.scMain
                TabOrder = 3
                ImeName = 'Russian'
                OnKeyDown = GoNextKeyDown
                OnKeyPress = GoNext
              end
            end
          end
          object cbKAKind: TcxComboBox
            Left = 158
            Top = 58
            Width = 222
            Height = 24
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = cbKAKindPropertiesChange
            Properties.OnEditValueChanged = cbKAKindPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 1
            OnKeyPress = cbKAKindKeyPress
          end
        end
        object gbStartSaldo: TssGroupBox
          Left = 0
          Top = 370
          Width = 543
          Height = 123
          Align = alBottom
          Alignment = alTopLeft
          Caption = ' '#1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1073#1072#1083#1072#1085#1089' '#1089' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1084' '
          TabOrder = 1
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            543
            123)
          object lStartSaldo: TssLabel
            Left = 18
            Top = 33
            Width = 37
            Height = 16
            Caption = #1057#1091#1084#1084#1072
            Enabled = False
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lStartSaldoDate: TssLabel
            Left = 396
            Top = 33
            Width = 29
            Height = 16
            Alignment = taRightJustify
            Caption = #1044#1072#1090#1072
            Enabled = False
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object stStartSaldoCurr: TssBevel
            Left = 316
            Top = 28
            Width = 43
            Height = 24
            Alignments.Horz = taCenter
            Caption = 'UAH'
            ColorGrBegin = clWindow
            ColorGrEnd = clWindow
            ColorInner = clBtnShadow
            ColorOuter = clBtnShadow
            Edges = [beLeft, beRight, beTop, beBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            GradientDirection = gdVertical
            HotTrack = False
            ImageIndex = 0
            UseGradient = True
          end
          object edStartSaldo: TssCalcEdit
            Left = 140
            Top = 28
            Width = 171
            Height = 24
            EditValue = 0.000000000000000000
            Enabled = False
            ImeName = 'Russian'
            Properties.Precision = 15
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            Style.ButtonStyle = btsSimple
            TabOrder = 1
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object rbtSSCredit: TcxRadioButton
            Left = 140
            Top = 85
            Width = 139
            Height = 21
            Caption = #1053#1072#1084' '#1076#1086#1083#1078#1085#1099
            Checked = True
            Enabled = False
            TabOrder = 4
            TabStop = True
            OnClick = DataModified
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object rbtSSDebt: TcxRadioButton
            Left = 140
            Top = 63
            Width = 139
            Height = 21
            Caption = #1052#1099' '#1076#1086#1083#1078#1085#1099
            Enabled = False
            TabOrder = 3
            OnClick = DataModified
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edStartSaldoDate: TcxDateEdit
            Left = 436
            Top = 28
            Width = 94
            Height = 24
            Enabled = False
            ImeName = 'Russian'
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EditValue = 0d
          end
          object chbStartSaldo: TcxCheckBox
            Left = 9
            Top = -2
            Width = 293
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.Alignment = taLeftJustify
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1073#1072#1083#1072#1085#1089' '#1089' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1084
            Style.StyleController = dmData.scMain
            TabOrder = 0
            ImeName = 'Russian'
            OnClick = chbStartSaldoClick
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
        end
      end
      object PageContact: TcxTabSheet
        Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
        ImageIndex = 3
        DesignSize = (
          543
          493)
        object gbAddr: TssGroupBox
          Left = 0
          Top = 0
          Width = 543
          Height = 171
          Align = alTop
          Alignment = alTopLeft
          Caption = ' '#1070#1088#1080#1076#1080#1095#1077#1089#1082#1080#1081' '#1072#1076#1088#1077#1089' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LookAndFeel.Kind = lfUltraFlat
          ParentFont = False
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            543
            171)
          object lCountry: TLabel
            Left = 18
            Top = 28
            Width = 42
            Height = 16
            Caption = #1057#1090#1088#1072#1085#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lDistrict: TLabel
            Left = 279
            Top = 28
            Width = 49
            Height = 16
            Caption = #1054#1073#1083#1072#1089#1090#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object LCity: TLabel
            Left = 18
            Top = 57
            Width = 35
            Height = 16
            Caption = #1043#1086#1088#1086#1076
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lAddress: TLabel
            Left = 18
            Top = 86
            Width = 101
            Height = 16
            Caption = #1055#1086#1095#1090#1086#1074#1099#1081' '#1072#1076#1088#1077#1089':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lIndex: TLabel
            Left = 18
            Top = 138
            Width = 41
            Height = 16
            Caption = #1048#1085#1076#1077#1082#1089
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnCopyAddr: TssSpeedButton
            Left = 502
            Top = 133
            Height = 26
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 71
            Images = dmData.Images
            LeftMargin = 2
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnCopyAddrClick
          end
          object edCountry: TcxTextEdit
            Left = 128
            Top = 23
            Width = 144
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 32
            Style.StyleController = dmData.scMain
            TabOrder = 0
            ImeName = 'Russian'
            OnKeyDown = edCountryKeyDown
            OnKeyPress = GoNext
          end
          object edDistrict: TcxTextEdit
            Left = 345
            Top = 23
            Width = 183
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 32
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 1
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edCity: TcxTextEdit
            Left = 128
            Top = 53
            Width = 400
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 32
            Style.StyleController = dmData.scMain
            TabOrder = 2
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edAddress: TcxMemo
            Left = 128
            Top = 82
            Width = 400
            Height = 47
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.MaxLength = 255
            Style.StyleController = dmData.scMain
            TabOrder = 3
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edIndex: TcxTextEdit
            Left = 128
            Top = 133
            Width = 144
            Height = 26
            ParentFont = False
            Properties.MaxLength = 128
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 4
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
        end
        object gbContact: TssGroupBox
          Left = 0
          Top = 365
          Width = 543
          Height = 128
          Align = alBottom
          Alignment = alTopLeft
          Caption = 'gbContact'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            543
            128)
          object lPhone: TLabel
            Left = 18
            Top = 34
            Width = 53
            Height = 16
            Caption = #1058#1077#1083#1077#1092#1086#1085
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lFax: TLabel
            Left = 294
            Top = 34
            Width = 29
            Height = 16
            Caption = #1060#1072#1082#1089
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lEmail: TLabel
            Left = 18
            Top = 65
            Width = 36
            Height = 16
            Caption = 'E-mail'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lWWW: TLabel
            Left = 18
            Top = 94
            Width = 45
            Height = 16
            Caption = 'Internet'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnEMail: TssSpeedButton
            Left = 500
            Top = 58
            Width = 28
            Height = 28
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            Caption = 'aShowTurnIn'
            GroupIndex = 0
            ImageIndex = 46
            Images = dmData.Images
            LeftMargin = 3
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnEMailClick
          end
          object btnWWW: TssSpeedButton
            Left = 500
            Top = 87
            Width = 28
            Height = 29
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            Caption = 'aShowTurnIn'
            GroupIndex = 0
            ImageIndex = 45
            Images = dmData.Images
            LeftMargin = 3
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnWWWClick
          end
          object edPhone: TcxTextEdit
            Left = 128
            Top = 30
            Width = 159
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 64
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 0
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edFax: TcxTextEdit
            Left = 340
            Top = 30
            Width = 158
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 32
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 1
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edEmail: TcxTextEdit
            Left = 128
            Top = 59
            Width = 370
            Height = 26
            ParentFont = False
            Properties.MaxLength = 32
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 2
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edWWW: TcxTextEdit
            Left = 128
            Top = 89
            Width = 370
            Height = 25
            ParentFont = False
            Properties.MaxLength = 32
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 3
            ImeName = 'Russian'
            OnKeyDown = edCertNumKeyDown
            OnKeyPress = GoNext
          end
        end
        object gbFactAddr: TssGroupBox
          Left = 0
          Top = 176
          Width = 543
          Height = 171
          Alignment = alTopLeft
          Anchors = [akLeft, akTop, akRight]
          Caption = ' '#1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081' '#1072#1076#1088#1077#1089' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          LookAndFeel.Kind = lfUltraFlat
          ParentFont = False
          TabOrder = 1
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            543
            171)
          object lFCountry: TLabel
            Left = 18
            Top = 28
            Width = 42
            Height = 16
            Caption = #1057#1090#1088#1072#1085#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lFDistrict: TLabel
            Left = 279
            Top = 28
            Width = 49
            Height = 16
            Caption = #1054#1073#1083#1072#1089#1090#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lFCity: TLabel
            Left = 18
            Top = 57
            Width = 35
            Height = 16
            Caption = #1043#1086#1088#1086#1076
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lFAddr: TLabel
            Left = 18
            Top = 86
            Width = 101
            Height = 16
            Caption = #1055#1086#1095#1090#1086#1074#1099#1081' '#1072#1076#1088#1077#1089':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lFIndex: TLabel
            Left = 18
            Top = 138
            Width = 41
            Height = 16
            Caption = #1048#1085#1076#1077#1082#1089
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edFCountry: TcxTextEdit
            Left = 128
            Top = 23
            Width = 144
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 32
            Style.StyleController = dmData.scMain
            TabOrder = 0
            ImeName = 'Russian'
            OnKeyDown = edCountryKeyDown
            OnKeyPress = GoNext
          end
          object edFDistrict: TcxTextEdit
            Left = 345
            Top = 23
            Width = 183
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 32
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 1
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edFCity: TcxTextEdit
            Left = 128
            Top = 53
            Width = 400
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 32
            Style.StyleController = dmData.scMain
            TabOrder = 2
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edFAddr: TcxMemo
            Left = 128
            Top = 82
            Width = 400
            Height = 47
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.MaxLength = 255
            Style.StyleController = dmData.scMain
            TabOrder = 3
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edFIndex: TcxTextEdit
            Left = 128
            Top = 133
            Width = 144
            Height = 26
            ParentFont = False
            Properties.MaxLength = 128
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 4
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
        end
      end
      object PageAccounts: TcxTabSheet
        Caption = #1057#1095#1077#1090#1072
        ImageIndex = 26
        object gbAccounts: TssGroupBox
          Left = 0
          Top = 0
          Width = 543
          Height = 494
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbAccounts'
          TabOrder = 0
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            543
            493)
          object panAccButtons: TPanel
            Left = 10
            Top = 28
            Width = 522
            Height = 32
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            object btnAccDel: TssSpeedButton
              Left = 228
              Top = 0
              Width = 113
              Height = 31
              Action = aDelAccount
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              GroupIndex = 0
              ImageIndex = 2
              Images = dmData.Images18x18
              LeftMargin = 3
              ParentFont = False
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnAccProps: TssSpeedButton
              Left = 116
              Top = 0
              Width = 113
              Height = 31
              Action = aPropAccount
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              GroupIndex = 0
              ImageIndex = 1
              Images = dmData.Images18x18
              LeftMargin = 3
              ParentFont = False
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnAccNew: TssSpeedButton
              Left = 0
              Top = 0
              Width = 117
              Height = 31
              Action = aNewAccount
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              GroupIndex = 0
              ImageIndex = 0
              Images = dmData.Images18x18
              LeftMargin = 3
              ParentFont = False
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
          end
          object grdAccounts: TdxDBGrid
            Left = 10
            Top = 64
            Width = 522
            Height = 410
            DrawDragFrame = False
            Bands = <
              item
              end>
            DefaultLayout = True
            HeaderPanelRowCount = 1
            KeyField = 'accid'
            SummaryGroups = <>
            SummarySeparator = ', '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            PopupMenu = pmAccounts
            TabOrder = 1
            OnDblClick = grdAccountsDblClick
            OnKeyDown = grdAccountsKeyDown
            BandFont.Charset = DEFAULT_CHARSET
            BandFont.Color = clWindowText
            BandFont.Height = -11
            BandFont.Name = 'Tahoma'
            BandFont.Style = []
            DataSource = dsAccount
            Filter.Criteria = {00000000}
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            LookAndFeel = lfUltraFlat
            OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnSizing]
            OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
            PreviewFont.Charset = DEFAULT_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -11
            PreviewFont.Name = 'Tahoma'
            PreviewFont.Style = []
            Anchors = [akLeft, akTop, akRight, akBottom]
            object colAccType: TdxDBGridColumn
              Alignment = taLeftJustify
              HeaderAlignment = taCenter
              Width = 153
              BandIndex = 0
              RowIndex = 0
              FieldName = 'TypeName'
            end
            object colAccNum: TdxDBGridColumn
              HeaderAlignment = taCenter
              Sorted = csUp
              Width = 117
              BandIndex = 0
              RowIndex = 0
              FieldName = 'AccNum'
            end
            object colAccMFO: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 81
              BandIndex = 0
              RowIndex = 0
              FieldName = 'MFO'
            end
          end
        end
      end
      object PagePersons: TcxTabSheet
        ImageIndex = 25
        object gbPersons: TssGroupBox
          Left = 0
          Top = 0
          Width = 543
          Height = 494
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbPersons'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            543
            493)
          object panPersonButtons: TPanel
            Left = 2
            Top = 18
            Width = 539
            Height = 44
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            object btnDelPerson: TssSpeedButton
              Left = 238
              Top = 10
              Width = 113
              Height = 31
              Action = aDelPerson
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              GroupIndex = 0
              ImageIndex = 2
              Images = dmData.Images18x18
              LeftMargin = 3
              ParentFont = False
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnPropsPerson: TssSpeedButton
              Left = 124
              Top = 10
              Width = 114
              Height = 31
              Action = aPropsPerson
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              GroupIndex = 0
              ImageIndex = 1
              Images = dmData.Images18x18
              LeftMargin = 3
              ParentFont = False
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnAddPerson: TssSpeedButton
              Left = 7
              Top = 10
              Width = 117
              Height = 31
              Action = aNewPerson
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              GroupIndex = 0
              ImageIndex = 0
              Images = dmData.Images18x18
              LeftMargin = 3
              ParentFont = False
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
          end
          object grdPersons: TdxDBGrid
            Left = 10
            Top = 64
            Width = 523
            Height = 410
            DrawDragFrame = False
            Bands = <
              item
              end>
            DefaultLayout = True
            HeaderPanelRowCount = 1
            KeyField = 'personid'
            SummaryGroups = <>
            SummarySeparator = ', '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnDblClick = grdPersonsDblClick
            OnKeyDown = grdPersonsKeyDown
            BandFont.Charset = DEFAULT_CHARSET
            BandFont.Color = clBlack
            BandFont.Height = -11
            BandFont.Name = 'Tahoma'
            BandFont.Style = [fsBold]
            DataSource = dsKontakt
            Filter.Criteria = {00000000}
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            LookAndFeel = lfUltraFlat
            OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnSizing]
            OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
            PreviewFont.Charset = DEFAULT_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -11
            PreviewFont.Name = 'Tahoma'
            PreviewFont.Style = [fsBold]
            Anchors = [akLeft, akTop, akRight, akBottom]
            object colName: TdxDBGridColumn
              Alignment = taLeftJustify
              HeaderAlignment = taCenter
              Width = 232
              BandIndex = 0
              RowIndex = 0
              FieldName = 'name'
            end
            object colPost: TdxDBGridColumn
              HeaderAlignment = taCenter
              Sorted = csUp
              Width = 119
              BandIndex = 0
              RowIndex = 0
              FieldName = 'post'
              OnGetText = colPostGetText
            end
            object colJobType: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'jobtype'
            end
          end
        end
      end
      object PageNotes: TcxTabSheet
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1103
        ImageIndex = 4
        object gbNotes: TssGroupBox
          Left = 0
          Top = 0
          Width = 543
          Height = 494
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbNotes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            543
            493)
          object edNotes: TcxMemo
            Left = 9
            Top = 27
            Width = 524
            Height = 447
            Anchors = [akLeft, akTop, akRight, akBottom]
            ImeName = 'Russian'
            ParentFont = False
            Properties.MaxLength = 255
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnKeyDown = edNotesKeyDown
            OnKeyPress = GoNext
          end
        end
      end
      object PageEditPerson: TcxTabSheet
        Caption = 'PageEditPerson'
        ImageIndex = 25
        object gbPersonEdit: TssGroupBox
          Left = 0
          Top = 0
          Width = 543
          Height = 494
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbPersonEdit'
          TabOrder = 0
          Edges = [beLeft, beRight, beTop, beBottom]
          OnMouseEnter = gbPersonEditMouseEnter
          OnMouseLeave = gbPersonEditMouseLeave
          DesignSize = (
            543
            493)
          object lPersonFIO: TLabel
            Left = 18
            Top = 91
            Width = 23
            Height = 16
            Caption = #1048#1084#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lPersonPost: TLabel
            Left = 18
            Top = 118
            Width = 66
            Height = 16
            Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lPersonPhone: TLabel
            Left = 18
            Top = 201
            Width = 53
            Height = 16
            Caption = #1058#1077#1083#1077#1092#1086#1085
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lPersonEmail: TLabel
            Left = 18
            Top = 228
            Width = 36
            Height = 16
            Caption = 'E-mail'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lNotes: TLabel
            Left = 18
            Top = 251
            Width = 72
            Height = 16
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnEMainPerson: TssSpeedButton
            Left = 498
            Top = 223
            Width = 29
            Height = 28
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            Caption = 'aShowTurnIn'
            GroupIndex = 0
            ImageIndex = 46
            Images = dmData.Images
            LeftMargin = 3
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnEMainPersonClick
          end
          object Panel3: TPanel
            Left = 2
            Top = 18
            Width = 539
            Height = 50
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            DesignSize = (
              539
              50)
            object ssSpeedButton4: TssSpeedButton
              Left = 235
              Top = 10
              Width = 113
              Height = 31
              Action = aDelPerson
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              GroupIndex = 0
              ImageIndex = 2
              Images = dmData.Images18x18
              LeftMargin = 3
              ParentFont = False
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object ssSpeedButton5: TssSpeedButton
              Left = 123
              Top = 10
              Width = 113
              Height = 31
              Action = aPropsPerson
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              GroupIndex = 0
              ImageIndex = 1
              Images = dmData.Images18x18
              LeftMargin = 3
              ParentFont = False
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object ssSpeedButton6: TssSpeedButton
              Left = 7
              Top = 10
              Width = 117
              Height = 31
              Action = aNewPerson
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              GroupIndex = 0
              ImageIndex = 0
              Images = dmData.Images18x18
              LeftMargin = 3
              ParentFont = False
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object bvlPersonSep: TssBevel
              Left = 0
              Top = 49
              Width = 539
              Height = 1
              Align = alBottom
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
            object btnPersonLevelUp: TssSpeedButton
              Left = 496
              Top = 12
              Width = 28
              Height = 29
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              Anchors = [akTop, akRight]
              ButtonType = ssbtStandard
              Checked = False
              Caption = 'aShowTurnIn'
              GroupIndex = 0
              ImageIndex = 21
              Images = dmData.Images
              LeftMargin = 3
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsGlyphOnly
              OnClick = btnDiscLevelUpClick
            end
          end
          object edNamePerson: TcxDBTextEdit
            Left = 130
            Top = 85
            Width = 398
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataField = 'name'
            DataBinding.DataSource = dsKontakt
            ImeName = 'Russian'
            ParentFont = False
            Properties.MaxLength = 128
            Properties.OnChange = edNamePersonPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 1
            OnKeyDown = edNotesKeyDown
            OnKeyPress = GoNext
          end
          object cbPost: TcxDBComboBox
            Left = 286
            Top = 166
            Width = 242
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataField = 'post'
            DataBinding.DataSource = dsKontakt
            ImeName = 'Russian'
            ParentFont = False
            Properties.OnChange = cbPostPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnKeyPress = GoNext
          end
          object edPhonePerson: TcxDBTextEdit
            Left = 130
            Top = 196
            Width = 398
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataField = 'phone'
            DataBinding.DataSource = dsKontakt
            ImeName = 'Russian'
            ParentFont = False
            Properties.MaxLength = 128
            Properties.OnChange = cbPostPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 3
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edEmailPerson: TcxDBTextEdit
            Left = 130
            Top = 224
            Width = 368
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataField = 'email'
            DataBinding.DataSource = dsKontakt
            ImeName = 'Russian'
            ParentFont = False
            Properties.MaxLength = 128
            Properties.OnChange = cbPostPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 4
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object memNotes: TcxDBMemo
            Left = 130
            Top = 252
            Width = 398
            Height = 148
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataField = 'notes'
            DataBinding.DataSource = dsKontakt
            ImeName = 'Russian'
            ParentFont = False
            Properties.MaxLength = 255
            Style.StyleController = dmData.scMain
            TabOrder = 5
            OnKeyDown = edCertNumKeyDown
            OnKeyPress = GoNext
          end
          object rbtPDir: TcxRadioButton
            Left = 130
            Top = 118
            Width = 191
            Height = 21
            Caption = #1044#1080#1088#1077#1082#1090#1086#1088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            OnClick = rbtPDirClick
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object rbtPBuh: TcxRadioButton
            Left = 130
            Top = 143
            Width = 191
            Height = 21
            Caption = #1043#1083#1072#1074#1085#1099#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnClick = rbtPDirClick
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object rbtPOther: TcxRadioButton
            Left = 130
            Top = 167
            Width = 152
            Height = 21
            Caption = #1044#1088#1091#1075#1072#1103
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            TabStop = True
            OnClick = rbtPDirClick
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
        end
      end
      object PageEditAccount: TcxTabSheet
        Caption = 'PageEditAccount'
        ImageIndex = 6
        object gbAccountEdit: TssGroupBox
          Left = 0
          Top = 0
          Width = 543
          Height = 493
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbAccountEdit'
          TabOrder = 0
          Edges = [beLeft, beRight, beTop, beBottom]
          OnMouseEnter = gbAccountEditMouseEnter
          OnMouseLeave = gbAccountEditMouseLeave
          DesignSize = (
            543
            493)
          object lAccount: TLabel
            Left = 14
            Top = 91
            Width = 74
            Height = 16
            Caption = #1053#1086#1084#1077#1088' '#1089#1095#1105#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lType: TLabel
            Left = 14
            Top = 117
            Width = 22
            Height = 16
            Caption = #1058#1080#1087
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnAccountRef: TssSpeedButton
            Left = 321
            Top = 110
            Action = aBankRef
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 24
            Images = dmData.Images
            LeftMargin = 4
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnAccountRefMouseDown
            OnMouseUp = btnAccountRefMouseUp
          end
          object lBank: TLabel
            Left = 14
            Top = 144
            Width = 29
            Height = 16
            Caption = #1052#1060#1054
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnBankRef: TssSpeedButton
            Left = 321
            Top = 138
            Action = aBankRef
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 24
            Images = dmData.Images
            LeftMargin = 4
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnAccountRefMouseDown
            OnMouseUp = btnAccountRefMouseUp
          end
          object lBankName: TLabel
            Left = 14
            Top = 169
            Width = 28
            Height = 16
            Caption = #1041#1072#1085#1082
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object txtBankName: TssBevel
            Left = 114
            Top = 167
            Width = 414
            Height = 25
            Anchors = [akLeft, akTop, akRight]
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
            Style = bsSingle
            UseGradient = True
            WordBreak = False
          end
          object lAccOrderNum: TLabel
            Left = 161
            Top = 203
            Width = 210
            Height = 16
            Caption = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081' '#1085#1086#1084#1077#1088' '#1074' '#1089#1087#1080#1089#1082#1077' '#1089#1095#1077#1090#1086#1074
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Panel1: TPanel
            Left = 2
            Top = 18
            Width = 539
            Height = 49
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            DesignSize = (
              539
              49)
            object ssSpeedButton1: TssSpeedButton
              Left = 235
              Top = 10
              Width = 113
              Height = 31
              Action = aDelAccount
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 2
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object ssSpeedButton2: TssSpeedButton
              Left = 123
              Top = 10
              Width = 113
              Height = 31
              Action = aPropAccount
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 1
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object ssSpeedButton3: TssSpeedButton
              Left = 7
              Top = 10
              Width = 117
              Height = 31
              Action = aNewAccount
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 0
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object bvlAccountSep: TssBevel
              Left = 0
              Top = 48
              Width = 539
              Height = 1
              Align = alBottom
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
            object btnAccLevelUp: TssSpeedButton
              Left = 496
              Top = 12
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              Anchors = [akTop, akRight]
              ButtonType = ssbtStandard
              Checked = False
              Caption = 'aShowTurnIn'
              GroupIndex = 0
              ImageIndex = 21
              Images = dmData.Images
              LeftMargin = 4
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsGlyphOnly
              OnClick = btnDiscLevelUpClick
            end
          end
          object edAccount: TcxDBTextEdit
            Left = 113
            Top = 85
            Width = 416
            Height = 24
            DataBinding.DataField = 'accnum'
            DataBinding.DataSource = dsAccount
            ImeName = 'Russian'
            ParentFont = False
            Properties.MaxLength = 128
            Properties.OnChange = edAccountPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 1
            OnKeyDown = edNotesKeyDown
            OnKeyPress = GoNext
          end
          object lcbAccountType: TcxDBLookupComboBox
            Left = 113
            Top = 112
            Width = 208
            Height = 24
            DataBinding.DataField = 'TypeID'
            DataBinding.DataSource = dsAccount
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'TYPEID'
            Properties.ListColumns = <
              item
                FieldName = 'NAME'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsAccountType
            Properties.OnChange = lcbAccountTypePropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnEnter = lcbAccountTypeEnter
            OnExit = lcbBankExit
            OnKeyPress = GoNext
          end
          object lcbBank: TcxDBLookupComboBox
            Left = 113
            Top = 139
            Width = 208
            Height = 24
            DataBinding.DataField = 'BankID'
            DataBinding.DataSource = dsAccount
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'BANKID'
            Properties.ListColumns = <
              item
                MinWidth = 60
                FieldName = 'MFO'
              end
              item
                FieldName = 'NAME'
              end>
            Properties.ListOptions.GridLines = glVertical
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsBanks
            Properties.OnChange = lcbBankPropertiesChange
            Properties.OnEditValueChanged = lcbBankPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 3
            OnEnter = lcbBankEnter
            OnExit = lcbBankExit
            OnKeyPress = GoNext
          end
          object edOrderNum: TcxDBTextEdit
            Left = 113
            Top = 197
            Width = 31
            Height = 24
            DataBinding.DataField = 'def'
            DataBinding.DataSource = dsAccount
            ImeName = 'Russian'
            Properties.MaxLength = 2
            TabOrder = 4
          end
        end
      end
      object tsDoc: TcxTabSheet
        Caption = 'tsDoc'
        ImageIndex = 7
        object gbDoc: TssGroupBox
          Left = 0
          Top = 0
          Width = 543
          Height = 493
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbDoc'
          TabOrder = 0
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            543
            493)
          object lDocName: TLabel
            Left = 18
            Top = 41
            Width = 121
            Height = 16
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lDocSeries: TLabel
            Left = 18
            Top = 69
            Width = 36
            Height = 16
            Caption = #1057#1077#1088#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lDocNum: TLabel
            Left = 18
            Top = 97
            Width = 37
            Height = 16
            Caption = #1053#1086#1084#1077#1088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lDocWhoProduce: TLabel
            Left = 18
            Top = 146
            Width = 63
            Height = 16
            Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lDocDate: TLabel
            Left = 18
            Top = 254
            Width = 77
            Height = 16
            Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object cbDocName: TcxComboBox
            Left = 172
            Top = 36
            Width = 356
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnKeyPress = GoNext
          end
          object edDocSeries: TcxTextEdit
            Left = 172
            Top = 64
            Width = 106
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 10
            Style.StyleController = dmData.scMain
            TabOrder = 1
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edDocNum: TcxTextEdit
            Left = 172
            Top = 92
            Width = 106
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 24
            Style.StyleController = dmData.scMain
            TabOrder = 2
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object memDocWhoProduce: TcxMemo
            Left = 172
            Top = 143
            Width = 356
            Height = 103
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.MaxLength = 255
            Style.StyleController = dmData.scMain
            TabOrder = 3
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edDocDate: TcxDateEdit
            Left = 172
            Top = 250
            Width = 99
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.InputKind = ikMask
            Style.StyleController = dmData.scMain
            TabOrder = 4
            OnKeyPress = GoNext
          end
        end
      end
      object tsDiscounts: TcxTabSheet
        Caption = 'tsDiscounts'
        ImageIndex = 8
        TabVisible = False
        object gbDiscounts: TssGroupBox
          Left = 0
          Top = 0
          Width = 543
          Height = 493
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbDiscounts'
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            543
            493)
          object lDiscAllPercent: TssLabel
            Left = 331
            Top = 39
            Width = 12
            Height = 16
            Alignment = taRightJustify
            Caption = '%'
            Enabled = False
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object panDiscFooter: TPanel
            Left = 2
            Top = 455
            Width = 539
            Height = 36
            Align = alBottom
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 6
            object btnFind: TssSpeedButton
              Left = 501
              Top = 1
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              Enabled = False
              GroupIndex = 0
              ImageIndex = 18
              Images = dmData.Images18x18
              LeftMargin = 4
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsGlyphOnly
            end
            object txtLang: TssBevel
              Left = 277
              Top = 5
              Width = 27
              Height = 23
              Caption = 'EN'
              ColorGrBegin = clBtnFace
              ColorGrEnd = clBtnFace
              ColorInner = clBtnFace
              ColorOuter = clBtnFace
              Edges = [beLeft, beRight, beTop, beBottom]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              GradientDirection = gdHorizontal
              HotTrack = False
              ImageIndex = 0
              Margins.Left = 1
              UseGradient = False
            end
            object lFindBy: TssLabel
              Left = 31
              Top = 7
              Width = 40
              Height = 16
              Alignment = taRightJustify
              Caption = 'lFindBy'
              Enabled = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object edFind: TcxTextEdit
              Left = 305
              Top = 2
              Width = 196
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.OnChange = edFindPropertiesChange
              Style.BorderColor = clBtnShadow
              Style.BorderStyle = ebsSingle
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.HotTrack = False
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnKeyPress = edFindKeyPress
            end
            object cbFindField: TcxComboBox
              Left = 79
              Top = 2
              Width = 183
              Height = 24
              Enabled = False
              ImeName = 'Russian'
              Properties.DropDownListStyle = lsFixedList
              Style.BorderColor = clBtnShadow
              Style.BorderStyle = ebsSingle
              Style.HotTrack = False
              Style.ButtonStyle = btsSimple
              TabOrder = 0
            end
          end
          object grdDisc: TdxDBGrid
            Left = 10
            Top = 139
            Width = 522
            Height = 313
            DrawDragFrame = False
            Bands = <
              item
              end>
            DefaultLayout = True
            HeaderPanelRowCount = 1
            KeyField = 'id'
            SummaryGroups = <>
            SummarySeparator = ', '
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            PopupMenu = pmDisc
            TabOrder = 5
            OnDblClick = grdDiscDblClick
            OnKeyDown = grdDiscKeyDown
            BandFont.Charset = DEFAULT_CHARSET
            BandFont.Color = clBlack
            BandFont.Height = -11
            BandFont.Name = 'Tahoma'
            BandFont.Style = [fsBold]
            DataSource = srcDisc
            Filter.Criteria = {00000000}
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            LookAndFeel = lfUltraFlat
            OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnSizing]
            OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
            PreviewFont.Charset = DEFAULT_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -11
            PreviewFont.Name = 'Tahoma'
            PreviewFont.Style = [fsBold]
            OnCustomDrawCell = grdDiscCustomDrawCell
            OnCustomDrawColumnHeader = grdDiscCustomDrawColumnHeader
            Anchors = [akLeft, akTop, akRight, akBottom]
            object colDiscType: TdxDBGridImageColumn
              Alignment = taCenter
              MinWidth = 16
              Sizing = False
              Sorted = csDown
              Width = 25
              BandIndex = 0
              RowIndex = 0
              FieldName = 'mtype'
              OnGetText = colDiscTypeGetText
              Images = dmData.Images
              ImageIndexes.Strings = (
                '0'
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                '10'
                '11'
                '12'
                '13'
                '14'
                '15'
                '16'
                '17'
                '18'
                '19'
                '20'
                '21'
                '22'
                '23'
                '24'
                '25'
                '26'
                '27'
                '28'
                '29'
                '30'
                '31'
                '32'
                '33'
                '34'
                '35'
                '36'
                '37'
                '38'
                '39'
                '40'
                '41'
                '42'
                '43'
                '44'
                '45'
                '46'
                '47'
                '48'
                '49'
                '50'
                '51'
                '52'
                '53'
                '54'
                '55'
                '56'
                '57'
                '58'
                '59'
                '60'
                '61'
                '62'
                '63'
                '64'
                '65'
                '66'
                '67'
                '68'
                '69'
                '70'
                '71'
                '72'
                '73'
                '74'
                '75'
                '76'
                '77'
                '78'
                '79'
                '80'
                '81'
                '82'
                '83'
                '84'
                '85'
                '86'
                '87'
                '88'
                '89'
                '90'
                '91'
                '92'
                '93'
                '94')
              Values.Strings = (
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                '0'
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                '1'
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                '3'
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                ''
                '2')
            end
            object colDiscName: TdxDBGridColumn
              Alignment = taLeftJustify
              Caption = #1058#1086#1074#1072#1088'/'#1043#1088#1091#1087#1087#1072' '#1090#1086#1074#1072#1088#1086#1074
              HeaderAlignment = taCenter
              Width = 325
              BandIndex = 0
              RowIndex = 0
              FieldName = 'name'
            end
            object colDiscOnValue: TdxDBGridColumn
              Alignment = taLeftJustify
              Caption = #1057#1082#1080#1076#1082#1072', %'
              HeaderAlignment = taCenter
              Width = 76
              BandIndex = 0
              RowIndex = 0
              FieldName = 'onvalue'
              OnGetText = colDiscOnValueGetText
            end
            object colDiscID: TdxDBGridColumn
              Visible = False
              Width = 69
              BandIndex = 0
              RowIndex = 0
              FieldName = 'id'
            end
            object colArtikul: TdxDBGridColumn
              Visible = False
              Width = 416
              BandIndex = 0
              RowIndex = 0
              FieldName = 'artikul'
            end
          end
          object panDiscButtons: TPanel
            Left = 10
            Top = 97
            Width = 522
            Height = 42
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 4
            DesignSize = (
              522
              42)
            object btnDiscDel: TssSpeedButton
              Left = 235
              Top = 6
              Width = 113
              Height = 31
              Action = aDiscDel
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 2
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnDiscProps: TssSpeedButton
              Left = 122
              Top = 6
              Width = 113
              Height = 31
              Action = aDiscProps
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 1
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnDiscAdd: TssSpeedButton
              Left = 5
              Top = 6
              Width = 117
              Height = 31
              Action = aDiscAdd
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 0
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object ssBevel5: TssBevel
              Left = 0
              Top = 0
              Width = 522
              Height = 1
              Align = alTop
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
            object ssBevel6: TssBevel
              Left = 0
              Top = 1
              Width = 1
              Height = 49
              ColorGrBegin = clBtnFace
              ColorGrEnd = clBtnFace
              ColorInner = clBtnShadow
              ColorOuter = clBtnHighlight
              Edges = [beLeft, beRight, beTop, beBottom]
              GradientDirection = gdHorizontal
              HotTrack = False
              ImageIndex = 0
              Shape = bsLeftLine
              UseGradient = False
            end
            object ssBevel7: TssBevel
              Left = 521
              Top = 0
              Width = 1
              Height = 42
              Anchors = [akTop, akRight]
              ColorGrBegin = clBtnFace
              ColorGrEnd = clBtnFace
              ColorInner = clBtnShadow
              ColorOuter = clBtnHighlight
              Edges = [beLeft, beRight, beTop, beBottom]
              GradientDirection = gdHorizontal
              HotTrack = False
              ImageIndex = 0
              Shape = bsLeftLine
              UseGradient = False
            end
          end
          object chbDiscAll: TcxCheckBox
            Left = 30
            Top = 32
            Width = 188
            Height = 26
            AutoSize = False
            Enabled = False
            ParentFont = False
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1053#1072' '#1074#1089#1077' '#1090#1086#1074#1072#1088#1099
            Style.StyleController = dmData.scMain
            TabOrder = 1
            ImeName = 'Russian'
            OnClick = chbDiscAllClick
            OnKeyPress = GoNext
          end
          object edDiscAll: TssCalcEdit
            Left = 220
            Top = 33
            Width = 111
            Height = 24
            EditValue = 0.000000000000000000
            Enabled = False
            ImeName = 'Russian'
            ParentFont = False
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object chbUseDiscount: TcxCheckBox
            Left = 7
            Top = -1
            Width = 496
            Height = 26
            AutoSize = False
            ParentFont = False
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1089#1082#1080#1076#1082#1080' '#1085#1072' '#1075#1088#1091#1087#1087#1099' '#1090#1086#1074#1072#1088#1086#1074' ('#1091#1089#1083#1091#1075')/'#1090#1086#1074#1072#1088#1099' ('#1091#1089#1083#1091#1075#1080')'
            Style.StyleController = dmData.scMain
            TabOrder = 0
            ImeName = 'Russian'
            OnClick = chbUseDiscountClick
            OnKeyPress = GoNext
          end
          object chbDiscCustom: TcxCheckBox
            Left = 30
            Top = 59
            Width = 365
            Height = 26
            AutoSize = False
            Enabled = False
            ParentFont = False
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1080#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1077' '#1089#1082#1080#1076#1082#1080':'
            Style.StyleController = dmData.scMain
            TabOrder = 3
            ImeName = 'Russian'
            OnClick = chbDiscCustomClick
            OnKeyPress = GoNext
          end
        end
      end
      object tsDiscount: TcxTabSheet
        Caption = 'tsDiscount'
        ImageIndex = 8
        object gbDiscount: TssGroupBox
          Left = 0
          Top = 0
          Width = 543
          Height = 493
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbDiscount'
          TabOrder = 0
          Edges = [beLeft, beRight, beTop, beBottom]
          OnMouseEnter = gbDiscountMouseEnter
          OnMouseLeave = gbDiscountMouseLeave
          object lMatDisc: TssLabel
            Left = 18
            Top = 151
            Width = 41
            Height = 16
            Caption = #1057#1082#1080#1076#1082#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lMatDiscPercent: TssLabel
            Left = 264
            Top = 151
            Width = 12
            Height = 16
            Alignment = taRightJustify
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lMat: TssLabel
            Left = 18
            Top = 123
            Width = 100
            Height = 16
            Caption = #1058#1086#1074#1072#1088#1085#1072#1103' '#1075#1088#1091#1087#1087#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lMatType: TssLabel
            Left = 18
            Top = 92
            Width = 59
            Height = 16
            Caption = #1057#1082#1080#1076#1082#1072' '#1085#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object btnMatRef: TssSpeedButton
            Left = 497
            Top = 122
            Width = 22
            Height = 22
            Action = aMatRef
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 14
            Images = dmData.Images18x18
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object panDiscBar: TPanel
            Left = 2
            Top = 18
            Width = 539
            Height = 48
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            DesignSize = (
              539
              48)
            object btnDelDisc: TssSpeedButton
              Left = 235
              Top = 10
              Width = 113
              Height = 31
              Action = aDiscDel
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              GroupIndex = 0
              ImageIndex = 2
              Images = dmData.Images18x18
              LeftMargin = 3
              ParentFont = False
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnPropsDisc: TssSpeedButton
              Left = 123
              Top = 10
              Width = 113
              Height = 31
              Action = aDiscProps
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              GroupIndex = 0
              ImageIndex = 1
              Images = dmData.Images18x18
              LeftMargin = 3
              ParentFont = False
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnNewDisc: TssSpeedButton
              Left = 7
              Top = 10
              Width = 117
              Height = 31
              Action = aDiscAdd
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              GroupIndex = 0
              ImageIndex = 0
              Images = dmData.Images18x18
              LeftMargin = 3
              ParentFont = False
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object bvlDiscSep: TssBevel
              Left = 0
              Top = 47
              Width = 539
              Height = 1
              Align = alBottom
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
            object btnDiscLevelUp: TssSpeedButton
              Left = 496
              Top = 12
              Width = 22
              Height = 22
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              Anchors = [akTop, akRight]
              ButtonType = ssbtStandard
              Checked = False
              Caption = 'aShowTurnIn'
              GroupIndex = 0
              ImageIndex = 21
              Images = dmData.Images
              LeftMargin = 3
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsGlyphOnly
              OnClick = btnDiscLevelUpClick
            end
          end
          object cbType: TcxComboBox
            Left = 143
            Top = 90
            Width = 147
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnEditValueChanged = cbTypePropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 1
            OnKeyDown = cbTypeKeyDown
            OnKeyPress = GoNext
          end
          object edMatDiscPercent: TssCalcEdit
            Left = 143
            Top = 146
            Width = 111
            Height = 24
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            ParentFont = False
            Properties.OnChange = edMatDiscPercentPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 3
            OnKeyDown = edMatDiscPercentKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object edMat: TcxTextEdit
            Left = 143
            Top = 118
            Width = 353
            Height = 24
            BeepOnEnter = False
            ParentFont = False
            Properties.ReadOnly = True
            Style.StyleController = dmData.scMain
            TabOrder = 2
            ImeName = 'Russian'
            OnKeyPress = GoNext
          end
        end
      end
      object tsAddInfo: TcxTabSheet
        Caption = 'tsAddInfo'
        ImageIndex = 9
        object gbAddInfo: TssGroupBox
          Left = 0
          Top = 0
          Width = 543
          Height = 493
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbDiscount'
          TabOrder = 0
          Edges = [beLeft, beRight, beTop, beBottom]
          OnMouseEnter = gbDiscountMouseEnter
          OnMouseLeave = gbDiscountMouseLeave
          object lPriceType: TLabel
            Left = 14
            Top = 39
            Width = 114
            Height = 16
            Caption = #1062#1077#1085#1086#1074#1072#1103' '#1082#1072#1090#1077#1075#1086#1088#1080#1103
          end
          object lcbPriceType: TssDBLookupCombo
            Left = 167
            Top = 33
            Width = 218
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Style.StyleController = dmData.scMain
            Style.ButtonStyle = btsSimple
            TabOrder = 0
            OnKeyDown = GoNextKeyDown
            EmptyValue = 0
            KeyField = 'ptypeid'
            ListField = 'name'
            ListSource = srcPriceTypes
          end
          object panAutoNum: TPanel
            Left = 2
            Top = 74
            Width = 538
            Height = 336
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 1
            object lWBOutPrefix: TssLabel
              Left = 38
              Top = 33
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lWBOutCurrNum: TssLabel
              Left = 176
              Top = 33
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lWBOutSuffix: TssLabel
              Left = 378
              Top = 33
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lAOPrefix: TssLabel
              Left = 38
              Top = 92
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lAOCurrNum: TssLabel
              Left = 176
              Top = 92
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lAOSuffix: TssLabel
              Left = 378
              Top = 92
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lInvPrefix: TssLabel
              Left = 38
              Top = 150
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lInvCurrNum: TssLabel
              Left = 176
              Top = 150
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lInvSuffix: TssLabel
              Left = 378
              Top = 150
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lOrdPrefix: TssLabel
              Left = 38
              Top = 210
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lOrdCurrNum: TssLabel
              Left = 176
              Top = 210
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lOrdSuffix: TssLabel
              Left = 378
              Top = 210
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object chbWBOutAutoNum: TcxCheckBox
              Left = 9
              Top = 0
              Width = 528
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103' '#1076#1083#1103' '#1088#1072#1089#1093#1086#1076#1085#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
              Style.StyleController = dmData.scMain
              TabOrder = 0
              ImeName = 'Russian'
              OnClick = chbWBOutAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBOutPrefix: TcxTextEdit
              Left = 102
              Top = 27
              Width = 65
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBOutCurrNum: TcxSpinEdit
              Left = 283
              Top = 27
              Width = 81
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBOutSuffix: TcxTextEdit
              Left = 447
              Top = 27
              Width = 65
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbAOAutoNum: TcxCheckBox
              Left = 9
              Top = 59
              Width = 528
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103' '#1076#1083#1103' '#1089#1095#1077#1090#1086#1074
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnClick = chbAOAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edAOPrefix: TcxTextEdit
              Left = 102
              Top = 86
              Width = 65
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 5
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edAOCurrNum: TcxSpinEdit
              Left = 283
              Top = 86
              Width = 81
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 6
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edAOSuffix: TcxTextEdit
              Left = 447
              Top = 86
              Width = 65
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 7
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbInvAutoNum: TcxCheckBox
              Left = 9
              Top = 117
              Width = 528
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103' '#1076#1083#1103' '#1089#1095#1077#1090#1086#1074'-'#1092#1072#1082#1090#1091#1088
              Style.StyleController = dmData.scMain
              TabOrder = 8
              ImeName = 'Russian'
              OnClick = chbInvAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edInvPrefix: TcxTextEdit
              Left = 102
              Top = 144
              Width = 65
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 9
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edInvCurrNum: TcxSpinEdit
              Left = 283
              Top = 144
              Width = 81
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 10
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edInvSuffix: TcxTextEdit
              Left = 447
              Top = 144
              Width = 65
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 11
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbOrdAutoNum: TcxCheckBox
              Left = 9
              Top = 177
              Width = 528
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103' '#1076#1083#1103' '#1079#1072#1082#1072#1079#1086#1074' '#1086#1090' '#1082#1083#1080#1077#1085#1090#1086#1074
              Style.StyleController = dmData.scMain
              TabOrder = 12
              ImeName = 'Russian'
              OnClick = chbOrdAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edOrdPrefix: TcxTextEdit
              Left = 102
              Top = 204
              Width = 65
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 13
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edOrdCurrNum: TcxSpinEdit
              Left = 283
              Top = 204
              Width = 81
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 14
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edOrdSuffix: TcxTextEdit
              Left = 447
              Top = 204
              Width = 65
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 15
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
          end
        end
      end
    end
    object tvMain: TcxTreeList
      Left = 6
      Top = 6
      Width = 260
      Height = 484
      BorderStyle = cxcbsNone
      Anchors = [akLeft, akTop, akBottom]
      Bands = <
        item
          Caption.Text = 'Band1'
        end>
      BufferedPaint = False
      Images = dmData.Images
      LookAndFeel.Kind = lfStandard
      OptionsBehavior.CellHints = True
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsView.ScrollBars = ssVertical
      OptionsView.ColumnAutoWidth = True
      OptionsView.Headers = False
      PopupMenu = pmTree
      TabOrder = 0
      OnCustomDrawCell = tvMainCustomDrawCell
      OnMouseUp = tvMainMouseUp
      OnSelectionChanged = tvMainSelectionChanged
      object cxTreeListColumn1: TcxTreeListColumn
        DataBinding.ValueType = 'String'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 260
      end
    end
  end
  inherited panButtons: TPanel
    Top = 550
    Width = 821
    TabOrder = 4
    inherited btnOK: TxButton
      Left = 510
      Top = 4
    end
    inherited btnCancel: TxButton
      Left = 613
      Top = 4
    end
    inherited btnApply: TxButton
      Left = 716
      Top = 4
    end
  end
  inherited panToolBar: TPanel
    Width = 821
    inherited btnLock: TssSpeedButton
      Left = 732
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 759
    end
    inherited btnHelp: TssSpeedButton
      Left = 786
    end
    object btnBallance: TssSpeedButton
      Left = 5
      Top = 1
      Width = 22
      Height = 22
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 116
      Images = dmData.Images
      LeftMargin = 3
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnBallanceClick
    end
  end
  inherited ilTitleBar: TImageList
    Left = 20
    Top = 100
  end
  inherited FormStorage: TssFormStorage
    Left = 56
    Top = 72
  end
  inherited ActionList: TActionList
    Left = 128
    Top = 208
    object aNew: TAction [5]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 3
      ShortCut = 45
      OnExecute = aNewExecute
    end
    object aDel: TAction [6]
      Tag = 1
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      ShortCut = 16397
      OnExecute = aDelExecute
    end
    object aBankRef: TAction [7]
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1073#1072#1085#1082#1086#1074
      HelpType = htContext
      ImageIndex = 24
      ShortCut = 16429
      OnExecute = aBankRefExecute
    end
    object aMatRef: TAction [8]
      Caption = 'aMatRef'
      ImageIndex = 14
      OnExecute = aMatRefExecute
    end
  end
  object mdKontakt: TssMemoryData
    AfterDelete = mdKontaktAfterDelete
    AfterPost = mdKontaktAfterPost
    FieldDefs = <>
    Left = 36
    Top = 120
    object mdKontaktpersonid: TIntegerField
      FieldName = 'personid'
    end
    object mdKontaktkaid: TIntegerField
      FieldName = 'kaid'
    end
    object mdKontaktname: TStringField
      FieldName = 'name'
      Size = 128
    end
    object mdKontaktpost: TStringField
      FieldName = 'post'
      Size = 128
    end
    object mdKontaktphone: TStringField
      FieldName = 'phone'
      Size = 64
    end
    object mdKontaktemail: TStringField
      FieldName = 'email'
      Size = 64
    end
    object mdKontaktnotes: TStringField
      FieldName = 'notes'
      Size = 255
    end
    object mdKontaktfnode: TIntegerField
      FieldName = 'fnode'
    end
    object mdKontaktjobtype: TIntegerField
      FieldName = 'jobtype'
    end
  end
  object dsKontakt: TDataSource
    DataSet = mdKontakt
    OnDataChange = dsKontaktDataChange
    Left = 68
    Top = 120
  end
  object mdAccount: TssMemoryData
    AfterDelete = mdAccountAfterDelete
    AfterPost = mdAccountAfterPost
    FieldDefs = <>
    OnFilterRecord = mdAccountFilterRecord
    Left = 47
    Top = 228
    object mdAccountaccid: TIntegerField
      FieldName = 'accid'
    end
    object mdAccountaccnum: TStringField
      FieldName = 'accnum'
      Size = 64
    end
    object mdAccountkaid: TIntegerField
      FieldName = 'kaid'
    end
    object mdAccounttypeid: TIntegerField
      FieldName = 'typeid'
    end
    object mdAccountbankid: TIntegerField
      FieldName = 'bankid'
    end
    object mdAccountmfo: TStringField
      FieldKind = fkLookup
      FieldName = 'mfo'
      LookupDataSet = cdsBanks
      LookupKeyFields = 'BANKID'
      LookupResultField = 'MFO'
      KeyFields = 'bankid'
      Size = 15
      Lookup = True
    end
    object mdAccountbankname2: TStringField
      FieldKind = fkLookup
      FieldName = 'bankname'
      LookupDataSet = cdsBanks
      LookupKeyFields = 'BANKID'
      LookupResultField = 'NAME'
      KeyFields = 'bankid'
      Size = 64
      Lookup = True
    end
    object mdAccounttypename: TStringField
      FieldKind = fkLookup
      FieldName = 'typename'
      LookupDataSet = cdsAccountType
      LookupKeyFields = 'typeid'
      LookupResultField = 'NAME'
      KeyFields = 'typeid'
      Size = 48
      Lookup = True
    end
    object mdAccountfnode: TIntegerField
      FieldName = 'fnode'
    end
    object mdAccountdeleted: TIntegerField
      FieldName = 'deleted'
    end
    object mdAccountDef: TIntegerField
      FieldName = 'def'
    end
  end
  object dsAccount: TDataSource
    DataSet = mdAccount
    Left = 75
    Top = 228
  end
  object ActionListPerson: TActionList
    Images = dmData.Images18x18
    OnUpdate = ActionListPersonUpdate
    Left = 126
    Top = 244
    object aNewPerson: TAction
      Category = 'Action'
      Caption = 'aNew'
      Enabled = False
      ImageIndex = 0
      ShortCut = 45
      OnExecute = aPropsPersonExecute
    end
    object aPropsPerson: TAction
      Tag = 1
      Category = 'Action'
      Caption = 'aProps'
      Enabled = False
      ImageIndex = 1
      ShortCut = 16397
      OnExecute = aPropsPersonExecute
    end
    object aDelPerson: TAction
      Category = 'Action'
      Caption = 'aDel'
      Enabled = False
      ImageIndex = 2
      ShortCut = 16430
      OnExecute = aDelPersonExecute
    end
    object aRefreshPerson: TAction
      Category = 'Action'
      Caption = 'aRefresh'
      Enabled = False
      ImageIndex = 3
      ShortCut = 116
    end
    object aDiscAdd: TAction
      Category = 'Disc'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Enabled = False
      ImageIndex = 0
      ShortCut = 45
      OnExecute = aDiscAddExecute
    end
    object aDiscProps: TAction
      Tag = 1
      Category = 'Disc'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      Enabled = False
      ImageIndex = 1
      ShortCut = 16397
      OnExecute = aDiscAddExecute
    end
    object aDiscDel: TAction
      Category = 'Disc'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      ImageIndex = 2
      ShortCut = 16430
      OnExecute = aDiscDelExecute
    end
  end
  object ActionListAccount: TActionList
    Images = dmData.Images18x18
    OnUpdate = ActionListAccountUpdate
    Left = 126
    Top = 276
    object aNewAccount: TAction
      Category = 'Action'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Enabled = False
      ImageIndex = 0
      ShortCut = 45
      OnExecute = aNewAccountExecute
    end
    object aPropAccount: TAction
      Tag = 1
      Category = 'Action'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      Enabled = False
      ImageIndex = 1
      ShortCut = 16397
      OnExecute = aNewAccountExecute
    end
    object aDelAccount: TAction
      Category = 'Action'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      ImageIndex = 2
      ShortCut = 46
      OnExecute = aDelAccountExecute
    end
    object aRefreshAccount: TAction
      Category = 'Action'
      Caption = 'aRefresh'
      Enabled = False
      ImageIndex = 3
      ShortCut = 116
    end
  end
  object mdTypeRel: TssMemoryData
    AfterDelete = mdKontaktAfterDelete
    AfterPost = mdKontaktAfterPost
    FieldDefs = <>
    Left = 108
    Top = 120
  end
  object dsTypeRel: TDataSource
    DataSet = mdTypeRel
    Left = 140
    Top = 120
  end
  object cdsBanks: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pBanks_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 48
    Top = 196
  end
  object dsBanks: TDataSource
    DataSet = cdsBanks
    Left = 76
    Top = 196
  end
  object cdsAccountType: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pAccountType_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 47
    Top = 264
  end
  object dsAccountType: TDataSource
    DataSet = cdsAccountType
    Left = 75
    Top = 264
  end
  object mdDisc: TssMemoryData
    FieldDefs = <>
    Left = 44
    Top = 373
    object mdDiscid: TIntegerField
      FieldName = 'id'
    end
    object mdDiscname: TStringField
      FieldName = 'name'
      Size = 64
    end
    object mdDiscmtype: TIntegerField
      FieldName = 'mtype'
    end
    object mdDisconvalue: TFloatField
      FieldName = 'onvalue'
    end
    object mdDiscfnode: TIntegerField
      FieldName = 'fnode'
    end
    object mdDiscartikul: TStringField
      FieldName = 'artikul'
      Size = 64
    end
  end
  object srcDisc: TDataSource
    DataSet = mdDisc
    OnDataChange = srcDiscDataChange
    Left = 72
    Top = 373
  end
  object pmDisc: TTBPopupMenu
    Images = dmData.Images18x18
    Left = 140
    Top = 376
    object mnuDiscAdd: TTBItem
      Action = aDiscAdd
      Images = dmData.Images18x18
    end
    object TBItem2: TTBItem
      Action = aDiscDel
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem3: TTBItem
      Action = aDiscProps
    end
  end
  object pmAccounts: TTBPopupMenu
    Images = dmData.Images18x18
    Left = 168
    Top = 376
    object TBItem1: TTBItem
      Action = aNewAccount
      Images = dmData.Images18x18
    end
    object TBItem4: TTBItem
      Action = aDelAccount
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem5: TTBItem
      Action = aPropAccount
    end
  end
  object pmTree: TTBPopupMenu
    Images = dmData.Images18x18
    Left = 128
    Top = 172
    object TBItem6: TTBItem
      Action = aNew
      ImageIndex = 0
      Images = dmData.Images18x18
    end
    object TBItem7: TTBItem
      Action = aDel
      ImageIndex = 2
    end
  end
  object cdsPriceTypes: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pPriceTypes_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 536
    Top = 66
  end
  object srcPriceTypes: TDataSource
    DataSet = cdsPriceTypes
    Left = 565
    Top = 66
  end
  object cdsUsers: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pUsers_List'
    RemoteServer = dmData.SConnection
    OnCalcFields = cdsUsersCalcFields
    Macros = <>
    Left = 540
    Top = 232
    object cdsUsersUSERID: TIntegerField
      FieldName = 'USERID'
      Required = True
    end
    object cdsUsersNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 24
    end
    object cdsUsersPASS: TStringField
      FieldName = 'PASS'
      Required = True
      Size = 24
    end
    object cdsUsersFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 128
    end
    object cdsUsersSYSNAME: TStringField
      FieldName = 'SYSNAME'
      Required = True
      Size = 31
    end
    object cdsUsersfname: TStringField
      FieldKind = fkCalculated
      FieldName = 'fname'
      Size = 128
      Calculated = True
    end
  end
  object srcUsers: TDataSource
    DataSet = cdsUsers
    Left = 568
    Top = 232
  end
end
