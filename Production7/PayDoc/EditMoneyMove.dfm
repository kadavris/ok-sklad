inherited frmEditMoneyMove: TfrmEditMoneyMove
  Left = 390
  Top = 225
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmEditMoneyMove'
  ClientHeight = 538
  ClientWidth = 639
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 639
    Height = 455
    DesignSize = (
      639
      455)
    object ssBevel1: TssBevel
      Left = 6
      Top = 267
      Width = 627
      Height = 1
      Anchors = [akLeft, akTop, akRight]
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
    object panMainInfo: TPanel
      Tag = 1
      Left = 0
      Top = 0
      Width = 639
      Height = 101
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        639
        101)
      object bvlMainInfo: TssBevel
        Left = 2
        Top = 1
        Width = 633
        Height = 100
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
      object lDocNum: TLabel
        Left = 11
        Top = 39
        Width = 37
        Height = 16
        Caption = #1053#1086#1084#1077#1088
      end
      object lOnDate: TLabel
        Left = 297
        Top = 39
        Width = 29
        Height = 16
        Caption = #1044#1072#1090#1072
      end
      object btnSetTime: TssSpeedButton
        Left = 601
        Top = 33
        Width = 20
        Height = 20
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        ImageIndex = 95
        Images = dmData.Images
        LeftMargin = 2
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnClick = btnSetTimeClick
      end
      object lType: TssLabel
        Left = 11
        Top = 70
        Width = 87
        Height = 16
        Caption = #1058#1080#1087' '#1086#1087#1077#1088#1072#1094#1080#1080':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object imgType: TImage
        Left = 604
        Top = 66
        Width = 20
        Height = 20
        Transparent = True
      end
      object chbChecked: TcxCheckBox
        Left = 6
        Top = 9
        Width = 163
        Height = 24
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
        State = cbsChecked
        Style.StyleController = dmData.scMain
        TabOrder = 0
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edDocNum: TcxTextEdit
        Left = 105
        Top = 34
        Width = 163
        Height = 24
        BeepOnEnter = False
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 20
        Style.StyleController = dmData.scMain
        TabOrder = 1
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edOnDate: TcxDateEdit
        Left = 338
        Top = 34
        Width = 141
        Height = 24
        BeepOnEnter = False
        ImeName = 'Russian'
        ParentFont = False
        Properties.DateOnError = deNull
        Properties.InputKind = ikMask
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnChange = edOnDatePropertiesChange
        Properties.OnEditValueChanged = edOnDatePropertiesEditValueChanged
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.StyleController = dmData.scMain
        TabOrder = 2
        OnExit = edOnDateExit
        OnKeyDown = GoNextKeyDown
        OnKeyPress = edOnDateKeyPress
      end
      object edTime: TcxTimeEdit
        Left = 487
        Top = 34
        Width = 112
        Height = 24
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.OnChange = DataModified
        Style.StyleController = dmData.scMain
        TabOrder = 3
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object cbType: TcxComboBox
        Left = 105
        Top = 64
        Width = 494
        Height = 24
        ImeName = 'Russian'
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = cbTypePropertiesChange
        Properties.OnEditValueChanged = cbTypePropertiesEditValueChanged
        Style.StyleController = dmData.scMain
        TabOrder = 4
        OnKeyPress = GoNext
      end
    end
    object panNotes: TPanel
      Left = 0
      Top = 234
      Width = 639
      Height = 221
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        639
        221)
      object bvlNotes: TssBevel
        Left = 2
        Top = -1
        Width = 633
        Height = 205
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clBtnFace
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        ParentColor = False
        UseGradient = False
      end
      object lReason: TLabel
        Left = 27
        Top = 46
        Width = 64
        Height = 16
        Alignment = taRightJustify
        Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
      end
      object lNotes: TLabel
        Left = 20
        Top = 74
        Width = 72
        Height = 16
        Alignment = taRightJustify
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      end
      object lPersonname: TLabel
        Left = 33
        Top = 12
        Width = 59
        Height = 16
        Alignment = taRightJustify
        Caption = #1054#1090#1087#1091#1089#1090#1080#1083':'
      end
      object edReason: TcxTextEdit
        Left = 105
        Top = 41
        Width = 523
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        BeepOnEnter = False
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 255
        Style.StyleController = dmData.scMain
        TabOrder = 0
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object memNotes: TMemo
        Left = 106
        Top = 74
        Width = 520
        Height = 120
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ImeName = 'Russian'
        MaxLength = 255
        ParentFont = False
        TabOrder = 1
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object lcbPersonName: TssDBLookupCombo
        Left = 105
        Top = 7
        Width = 521
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ImeName = 'Russian'
        ParentFont = False
        Properties.DropDownListStyle = lsEditFixedList
        Style.StyleController = dmData.scMain
        TabOrder = 2
        EmptyValue = 0
        KeyField = 'kaid'
        ListField = 'Name'
        ListSource = srcPayMPersons
      end
    end
    object panKA: TPanel
      Tag = 1
      Left = 0
      Top = 101
      Width = 639
      Height = 133
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        639
        133)
      object bvlKA: TssBevel
        Left = 2
        Top = -1
        Width = 633
        Height = 134
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
      object pcMain: TssPageControl
        Left = 4
        Top = 0
        Width = 630
        Height = 132
        ActivePage = tsMove
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        TabStop = False
        object tsMove: TcxTabSheet
          Caption = 'tsMove'
          ImageIndex = 0
          TabVisible = False
          DesignSize = (
            630
            132)
          object lFrom: TssLabel
            Left = 7
            Top = 14
            Width = 46
            Height = 16
            Caption = #1054#1090#1082#1091#1076#1072':'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lSaldoFrom: TLabel
            Left = 7
            Top = 102
            Width = 52
            Height = 16
            Caption = #1054#1089#1090#1072#1090#1086#1082':'
          end
          object txtSaldoFrom: TssBevel
            Left = 102
            Top = 98
            Width = 190
            Height = 24
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
            Font.Style = [fsBold]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = True
          end
          object lTo: TssLabel
            Left = 340
            Top = 12
            Width = 32
            Height = 16
            Caption = #1050#1091#1076#1072':'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lSaldoTo: TLabel
            Left = 338
            Top = 102
            Width = 52
            Height = 16
            Caption = #1054#1089#1090#1072#1090#1086#1082':'
          end
          object txtSaldoTo: TssBevel
            Left = 433
            Top = 98
            Width = 190
            Height = 24
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
            Font.Style = [fsBold]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = True
          end
          object btnFinFrom: TssSpeedButton
            Left = 265
            Top = 7
            Width = 20
            Height = 20
            Action = aFinance
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 165
            Images = dmData.Images
            LeftMargin = 3
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnFinFromMouseDown
            OnMouseUp = btnFinFromMouseUp
          end
          object btnFinTo: TssSpeedButton
            Left = 596
            Top = 10
            Width = 20
            Height = 20
            Action = aFinance
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 165
            Images = dmData.Images
            LeftMargin = 3
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnFinToMouseDown
            OnMouseUp = btnFinFromMouseDown
          end
          object lSummFrom: TLabel
            Left = 7
            Top = 73
            Width = 53
            Height = 16
            Caption = #1057#1087#1080#1089#1072#1090#1100':'
          end
          object lSummTo: TLabel
            Left = 338
            Top = 73
            Width = 66
            Height = 16
            Caption = #1047#1072#1095#1080#1089#1083#1080#1090#1100':'
          end
          object Image2: TImage
            Left = 306
            Top = 33
            Width = 24
            Height = 70
            Picture.Data = {
              07544269746D6170760C0000424D760C00000000000036000000280000001200
              0000380000000100180000000000400C0000C40E0000C40E0000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00630000
              6300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF006300006300FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF0063000063007BA563FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0063000063007BA563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00630000
              63007BA563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00630052EF7B189421189421
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF00630052EF7B189421189421FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF00630052EF7B1894211894217BA563FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00630052
              EF7B1894211894217BA563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00630052EF7B189421189421
              7BA563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007300006B00
              006B00006B000063000063000063005AF78452EF7B52EF7B1894217B9C52FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007300006B00006B00006B000063
              000063000063005AF78452EF7B52EF7B1894217B9C52FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000007300006B00006B00006B000063000063000063005A
              F78452EF7B52EF7B1894217B9C52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000007300006B00006B00006B000063000063000063005AF78452EF7B52EF7B
              1894217B9C527B9C52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007300006B00
              006B00006B000063000063000063005AF78452EF7B52EF7B1894217B9C527B9C
              52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007B005AF78C5AF78C5AF78C5AF7
              8C5AF78C5AF78C5AF78429C63929C63952EF84189C29189C29FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000007B005AF78C5AF78C5AF78C5AF78C5AF78C5AF78C5A
              F78429C63929C63952EF84189C29189C297B9C52FFFFFFFFFFFFFFFFFFFFFFFF
              0000007B005AF78C5AF78C5AF78C5AF78C5AF78C5AF78C5AF78429C63929C639
              52EF84189C29189C297B9C52FFFFFFFFFFFFFFFFFFFFFFFF0000007B005AF78C
              5AF78C5AF78C5AF78C5AF78C5AF78C5AF78429C63929C63952EF84189C29189C
              297B9C52FFFFFFFFFFFFFFFFFFFFFFFF0000007B005AF78C5AF78C5AF78C5AF7
              8C5AF78C5AF78C5AF78429C63929C63952EF84189C29189C297B9C52FFFFFFFF
              FFFFFFFFFFFFFFFF0000008C0063FF9463FF9439D65A39D65239D65231CE5231
              CE4A29C64229C64231CE4A5AEF845AEF84189C297BA55AFFFFFFFFFFFFFFFFFF
              0000008C0063FF9463FF9439D65A39D65239D65231CE5231CE4A29C64229C642
              31CE4A5AEF845AEF84189C297BA55AFFFFFFFFFFFFFFFFFF0000008C0063FF94
              63FF9439D65A39D65239D65231CE5231CE4A29C64229C64231CE4A5AEF845AEF
              84189C297BA55AFFFFFFFFFFFFFFFFFF0000008C0063FF9463FF9439D65A39D6
              5239D65231CE5231CE4A29C64229C64231CE4A5AEF845AEF84189C297BA55A7B
              A55AFFFFFFFFFFFF0000008C0063FF9463FF9439D65A39D65239D65231CE5231
              CE4A29C64229C64231CE4A5AEF845AEF84189C297BA55A7BA55AFFFFFFFFFFFF
              000000940063FF9463FF944AE7734AE7734AE77342DE6B42DE6339D65A39D65A
              39D65A39D65A39D65A18942984AD6384AD63FFFFFFFFFFFF000000940063FF94
              63FF944AE7734AE7734AE77342DE6B42DE6339D65A39D65A39D65A39D65A39D6
              5A18942984AD6384AD63FFFFFFFFFFFF000000940063FF9463FF944AE7734AE7
              734AE77342DE6B42DE6339D65A39D65A39D65A39D65A39D65A18942984AD6384
              AD63FFFFFFFFFFFF000000940063FF9463FF944AE7734AE7734AE77342DE6B42
              DE6339D65A39D65A39D65A39D65A39D65A18942984AD6384AD63FFFFFFFFFFFF
              000000940063FF9463FF944AE7734AE7734AE77342DE6B42DE6339D65A39D65A
              39D65A39D65A39D65A18942984AD63FFFFFFFFFFFFFFFFFF000000940063FF94
              63FF944AE7734AE7734AE77342DE6B42DE6339D65A39D65A39D65A39D65A39D6
              5A18942984AD63FFFFFFFFFFFFFFFFFF000000940063FF9463FF944AE7734AE7
              734AE77342DE6B42DE6339D65A39D65A39D65A39D65A39D65A18942984AD63FF
              FFFFFFFFFFFFFFFF0000009C0063FF9C63FF9C63FF945AF78C5AF78C5AF78452
              EF8452EF7B52EF7B4AE773108C18108C1884AD63FFFFFFFFFFFFFFFFFFFFFFFF
              0000009C0063FF9C63FF9C63FF945AF78C5AF78C5AF78452EF8452EF7B52EF7B
              4AE773108C18108C1884AD63FFFFFFFFFFFFFFFFFFFFFFFF0000009C0063FF9C
              63FF9C63FF945AF78C5AF78C5AF78452EF8452EF7B52EF7B4AE773108C18108C
              1884AD63FFFFFFFFFFFFFFFFFFFFFFFF0000009C0063FF9C63FF9C63FF945AF7
              8C5AF78C5AF78452EF8452EF7B52EF7B4AE773108C18108C1884AD63FFFFFFFF
              FFFFFFFFFFFFFFFF0000009C0063FF9C63FF9C63FF945AF78C5AF78C5AF78452
              EF8452EF7B52EF7B4AE773108C18108C18FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000009C0063FF9C63FF9C63FF945AF78C5AF78C5AF78452EF8452EF7B52EF7B
              4AE773108C18108C18FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000009C00009C00
              009C00009C0000940000940000940063FF9C63F79463F794109C2184B56384B5
              63FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000009C00009C00009C00009C000094
              0000940000940063FF9C63F79463F794109C2184B563FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000009C00009C00009C00009C0000940000940000940063
              FF9C63F79463F794109C2184B563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000009C00009C00009C00009C0000940000940000940063FF9C63F79463F794
              109C2184B563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000009C00009C00
              009C00009C0000940000940000940063FF9C63F79463F794109C21FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF009C0063FF9418AD2118AD217BBD63FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009C0063
              FF9418AD2118AD217BBD63FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009C0063FF9418AD2118AD21
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF009C0063FF9418AD2118AD21FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF009C0063FF9418AD2118AD21FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009C0000
              9C007BB542FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009C00009C007BB542FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF009C00009C007BB542FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF009C00009C007BB542FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009C0000
              9C00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000}
            Stretch = True
            Transparent = True
          end
          object cbFrom: TcxComboBox
            Left = 101
            Top = 9
            Width = 162
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = cbFromPropertiesChange
            Properties.OnEditValueChanged = cbFromPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnEnter = cbFromEnter
            OnExit = cbFromExit
            OnKeyPress = GoNext
          end
          object nbFrom: TNotebook
            Left = 2
            Top = 38
            Width = 295
            Height = 26
            PageIndex = 1
            TabOrder = 1
            object TPage
              Left = 0
              Top = 0
              Caption = 'Default'
              object btnCashDesks: TssSpeedButton
                Left = 1
                Top = 0
                Width = 26
                Height = 26
                Alignment = taLeftJustify
                AllwaysShowFrame = False
                ButtonType = ssbtStandard
                Checked = False
                Caption = 'aPayMPersons'
                GroupIndex = 0
                ImageIndex = -1
                Images = dmData.Images
                LeftMargin = 2
                ParentShowHint = False
                ShowHint = True
                Style = ssbsUser
                ViewStyle = ssvsGlyphOnly
              end
              object lCashDesk: TssLabel
                Left = 5
                Top = 5
                Width = 38
                Height = 16
                Caption = #1050#1072#1089#1089#1072':'
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lcbCashDesks: TssDBLookupCombo
                Left = 98
                Top = 0
                Width = 192
                Height = 26
                ImeName = 'Russian'
                Properties.DropDownListStyle = lsFixedList
                Properties.OnEditValueChanged = lcbCashDesksPropertiesEditValueChanged
                Style.StyleController = dmData.scMain
                TabOrder = 0
                OnKeyPress = GoNext
                EmptyValue = 0
                KeyField = 'cashid'
                ListField = 'name'
                ListSource = srcCashDesks
              end
            end
            object TPage
              Left = 0
              Top = 0
              Caption = 'Cashless'
              object lAccount: TssLabel
                Left = 5
                Top = 5
                Width = 23
                Height = 16
                Caption = #1056'/'#1089':'
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lcbAccount: TssDBLookupCombo
                Left = 98
                Top = 0
                Width = 192
                Height = 24
                ImeName = 'Russian'
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.OnEditValueChanged = lcbAccountPropertiesEditValueChanged
                Style.StyleController = dmData.scMain
                TabOrder = 0
                OnKeyPress = GoNext
                EmptyValue = 0
                KeyField = 'accid'
                ListField = 'fullname'
                ListSource = srcEntAcc
              end
            end
          end
          object cbTo: TcxComboBox
            Left = 432
            Top = 9
            Width = 162
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = cbToPropertiesChange
            Properties.OnEditValueChanged = cbToPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnEnter = cbFromEnter
            OnExit = cbFromExit
            OnKeyPress = GoNext
          end
          object nbTo: TNotebook
            Left = 334
            Top = 38
            Width = 294
            Height = 26
            TabOrder = 3
            object TPage
              Left = 0
              Top = 0
              Caption = 'Default'
              object ssSpeedButton1: TssSpeedButton
                Left = 265
                Top = 0
                Alignment = taLeftJustify
                AllwaysShowFrame = False
                ButtonType = ssbtStandard
                Checked = False
                Caption = 'aPayMPersons'
                GroupIndex = 0
                ImageIndex = 65
                Images = dmData.Images
                LeftMargin = 4
                ParentShowHint = False
                ShowHint = True
                Style = ssbsUser
                ViewStyle = ssvsGlyphOnly
              end
              object lCashDeskTo: TssLabel
                Left = 6
                Top = 5
                Width = 38
                Height = 16
                Caption = #1050#1072#1089#1089#1072':'
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lcbCashDeskTo: TssDBLookupCombo
                Left = 98
                Top = 0
                Width = 159
                Height = 24
                ImeName = 'Russian'
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.OnEditValueChanged = lcbCashDeskToPropertiesEditValueChanged
                Style.StyleController = dmData.scMain
                TabOrder = 0
                OnKeyPress = GoNext
                EmptyValue = 0
                KeyField = 'cashid'
                ListField = 'name'
                ListSource = srcCashDesks
              end
            end
            object TPage
              Left = 0
              Top = 0
              Caption = 'Cashless'
              object lAccountTo: TssLabel
                Left = 5
                Top = 5
                Width = 23
                Height = 16
                Caption = #1056'/'#1089':'
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lcbAccountTo: TssDBLookupCombo
                Left = 98
                Top = 0
                Width = 192
                Height = 26
                ImeName = 'Russian'
                Properties.DropDownListStyle = lsFixedList
                Properties.OnEditValueChanged = lcbAccountToPropertiesEditValueChanged
                TabOrder = 0
                OnKeyPress = GoNext
                EmptyValue = 0
                KeyField = 'accid'
                ListField = 'fullname'
                ListSource = srcEntAcc
              end
            end
          end
          object edTotalFrom: TssCalcEdit
            Left = 101
            Top = 68
            Width = 129
            Height = 24
            Anchors = [akTop, akRight]
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.ImmediatePost = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = edTotalFromPropertiesChange
            Properties.OnEditValueChanged = edTotalPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 4
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object lcbCurrency: TssDBLookupCombo
            Left = 231
            Top = 68
            Width = 62
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnEditValueChanged = lcbCurrencyPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 5
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'currid'
            ListField = 'shortname'
            ListSource = srcCurrency
          end
          object lcbCurrTo: TssDBLookupCombo
            Left = 562
            Top = 68
            Width = 62
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnEditValueChanged = lcbToCurrPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 7
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'currid'
            ListField = 'shortname'
            ListSource = srcCurrency
          end
          object edTotalTo: TssCalcEdit
            Left = 432
            Top = 68
            Width = 129
            Height = 24
            Anchors = [akTop, akRight]
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.ImmediatePost = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = edTotalToPropertiesChange
            Properties.OnEditValueChanged = edTotalPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 6
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
        end
        object tsConvert: TcxTabSheet
          Caption = 'tsConvert'
          ImageIndex = 0
          TabVisible = False
          DesignSize = (
            630
            132)
          object lCvFrom: TssLabel
            Left = 7
            Top = 14
            Width = 46
            Height = 16
            Caption = #1054#1090#1082#1091#1076#1072':'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object btnCvFinFrom: TssSpeedButton
            Left = 241
            Top = 7
            Width = 27
            Height = 27
            Action = aFinance
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 165
            Images = dmData.Images
            LeftMargin = 3
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnCvFinFromMouseDown
            OnMouseUp = btnCashDesksMouseUp
          end
          object lCvFromSumm: TLabel
            Left = 7
            Top = 73
            Width = 53
            Height = 16
            Caption = #1057#1087#1080#1089#1072#1090#1100':'
          end
          object lCvSaldoFrom: TLabel
            Left = 7
            Top = 102
            Width = 52
            Height = 16
            Caption = #1054#1089#1090#1072#1090#1086#1082':'
          end
          object txtCvSaldoFrom: TssBevel
            Left = 102
            Top = 98
            Width = 190
            Height = 24
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
            Font.Style = [fsBold]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = True
          end
          object lCvFromCurr: TLabel
            Left = 7
            Top = 43
            Width = 69
            Height = 16
            Caption = #1048#1079' '#1074#1072#1083#1102#1090#1099':'
          end
          object btnCvFromRate: TssSpeedButton
            Left = 208
            Top = 41
            Width = 84
            Height = 22
            Alignment = taCenter
            AllwaysShowFrame = True
            ButtonType = ssbtStandard
            Checked = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            GroupIndex = 0
            ImageIndex = 0
            LeftMargin = 4
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsCaptionOnly
            OnClick = btnCvFromRateClick
          end
          object lCvFromRate: TLabel
            Left = 169
            Top = 43
            Width = 31
            Height = 16
            Caption = #1050#1091#1088#1089':'
          end
          object txtCvFromCurr: TssBevel
            Left = 242
            Top = 69
            Width = 50
            Height = 23
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
            GradientDirection = gdVertical
            HotTrack = False
            ImageIndex = 0
            UseGradient = True
          end
          object lCvToCurr: TLabel
            Left = 338
            Top = 43
            Width = 69
            Height = 16
            Caption = #1048#1079' '#1074#1072#1083#1102#1090#1099':'
          end
          object lCvToRate: TLabel
            Left = 500
            Top = 43
            Width = 31
            Height = 16
            Caption = #1050#1091#1088#1089':'
          end
          object btnCvToRate: TssSpeedButton
            Left = 539
            Top = 41
            Width = 84
            Height = 22
            Hint = '???????? ????'
            Alignment = taCenter
            AllwaysShowFrame = True
            ButtonType = ssbtStandard
            Checked = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            GroupIndex = 0
            ImageIndex = 0
            LeftMargin = 4
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsCaptionOnly
            OnClick = btnCvFromRateClick
          end
          object lCvToSumm: TLabel
            Left = 338
            Top = 73
            Width = 53
            Height = 16
            Caption = #1057#1087#1080#1089#1072#1090#1100':'
          end
          object txtCvToCurr: TssBevel
            Left = 574
            Top = 69
            Width = 49
            Height = 23
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
            GradientDirection = gdVertical
            HotTrack = False
            ImageIndex = 0
            UseGradient = True
          end
          object lCvSaldoTo: TLabel
            Left = 338
            Top = 102
            Width = 52
            Height = 16
            Caption = #1054#1089#1090#1072#1090#1086#1082':'
          end
          object txtCvSaldoTo: TssBevel
            Left = 433
            Top = 98
            Width = 190
            Height = 24
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
            Font.Style = [fsBold]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = True
          end
          object Image1: TImage
            Left = 306
            Top = 48
            Width = 24
            Height = 70
            Picture.Data = {
              07544269746D6170760C0000424D760C00000000000036000000280000001200
              0000380000000100180000000000400C0000C40E0000C40E0000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00630000
              6300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF006300006300FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF0063000063007BA563FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0063000063007BA563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00630000
              63007BA563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00630052EF7B189421189421
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF00630052EF7B189421189421FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF00630052EF7B1894211894217BA563FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00630052
              EF7B1894211894217BA563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00630052EF7B189421189421
              7BA563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007300006B00
              006B00006B000063000063000063005AF78452EF7B52EF7B1894217B9C52FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007300006B00006B00006B000063
              000063000063005AF78452EF7B52EF7B1894217B9C52FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000007300006B00006B00006B000063000063000063005A
              F78452EF7B52EF7B1894217B9C52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000007300006B00006B00006B000063000063000063005AF78452EF7B52EF7B
              1894217B9C527B9C52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007300006B00
              006B00006B000063000063000063005AF78452EF7B52EF7B1894217B9C527B9C
              52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007B005AF78C5AF78C5AF78C5AF7
              8C5AF78C5AF78C5AF78429C63929C63952EF84189C29189C29FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000007B005AF78C5AF78C5AF78C5AF78C5AF78C5AF78C5A
              F78429C63929C63952EF84189C29189C297B9C52FFFFFFFFFFFFFFFFFFFFFFFF
              0000007B005AF78C5AF78C5AF78C5AF78C5AF78C5AF78C5AF78429C63929C639
              52EF84189C29189C297B9C52FFFFFFFFFFFFFFFFFFFFFFFF0000007B005AF78C
              5AF78C5AF78C5AF78C5AF78C5AF78C5AF78429C63929C63952EF84189C29189C
              297B9C52FFFFFFFFFFFFFFFFFFFFFFFF0000007B005AF78C5AF78C5AF78C5AF7
              8C5AF78C5AF78C5AF78429C63929C63952EF84189C29189C297B9C52FFFFFFFF
              FFFFFFFFFFFFFFFF0000008C0063FF9463FF9439D65A39D65239D65231CE5231
              CE4A29C64229C64231CE4A5AEF845AEF84189C297BA55AFFFFFFFFFFFFFFFFFF
              0000008C0063FF9463FF9439D65A39D65239D65231CE5231CE4A29C64229C642
              31CE4A5AEF845AEF84189C297BA55AFFFFFFFFFFFFFFFFFF0000008C0063FF94
              63FF9439D65A39D65239D65231CE5231CE4A29C64229C64231CE4A5AEF845AEF
              84189C297BA55AFFFFFFFFFFFFFFFFFF0000008C0063FF9463FF9439D65A39D6
              5239D65231CE5231CE4A29C64229C64231CE4A5AEF845AEF84189C297BA55A7B
              A55AFFFFFFFFFFFF0000008C0063FF9463FF9439D65A39D65239D65231CE5231
              CE4A29C64229C64231CE4A5AEF845AEF84189C297BA55A7BA55AFFFFFFFFFFFF
              000000940063FF9463FF944AE7734AE7734AE77342DE6B42DE6339D65A39D65A
              39D65A39D65A39D65A18942984AD6384AD63FFFFFFFFFFFF000000940063FF94
              63FF944AE7734AE7734AE77342DE6B42DE6339D65A39D65A39D65A39D65A39D6
              5A18942984AD6384AD63FFFFFFFFFFFF000000940063FF9463FF944AE7734AE7
              734AE77342DE6B42DE6339D65A39D65A39D65A39D65A39D65A18942984AD6384
              AD63FFFFFFFFFFFF000000940063FF9463FF944AE7734AE7734AE77342DE6B42
              DE6339D65A39D65A39D65A39D65A39D65A18942984AD6384AD63FFFFFFFFFFFF
              000000940063FF9463FF944AE7734AE7734AE77342DE6B42DE6339D65A39D65A
              39D65A39D65A39D65A18942984AD63FFFFFFFFFFFFFFFFFF000000940063FF94
              63FF944AE7734AE7734AE77342DE6B42DE6339D65A39D65A39D65A39D65A39D6
              5A18942984AD63FFFFFFFFFFFFFFFFFF000000940063FF9463FF944AE7734AE7
              734AE77342DE6B42DE6339D65A39D65A39D65A39D65A39D65A18942984AD63FF
              FFFFFFFFFFFFFFFF0000009C0063FF9C63FF9C63FF945AF78C5AF78C5AF78452
              EF8452EF7B52EF7B4AE773108C18108C1884AD63FFFFFFFFFFFFFFFFFFFFFFFF
              0000009C0063FF9C63FF9C63FF945AF78C5AF78C5AF78452EF8452EF7B52EF7B
              4AE773108C18108C1884AD63FFFFFFFFFFFFFFFFFFFFFFFF0000009C0063FF9C
              63FF9C63FF945AF78C5AF78C5AF78452EF8452EF7B52EF7B4AE773108C18108C
              1884AD63FFFFFFFFFFFFFFFFFFFFFFFF0000009C0063FF9C63FF9C63FF945AF7
              8C5AF78C5AF78452EF8452EF7B52EF7B4AE773108C18108C1884AD63FFFFFFFF
              FFFFFFFFFFFFFFFF0000009C0063FF9C63FF9C63FF945AF78C5AF78C5AF78452
              EF8452EF7B52EF7B4AE773108C18108C18FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000009C0063FF9C63FF9C63FF945AF78C5AF78C5AF78452EF8452EF7B52EF7B
              4AE773108C18108C18FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000009C00009C00
              009C00009C0000940000940000940063FF9C63F79463F794109C2184B56384B5
              63FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000009C00009C00009C00009C000094
              0000940000940063FF9C63F79463F794109C2184B563FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000009C00009C00009C00009C0000940000940000940063
              FF9C63F79463F794109C2184B563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000009C00009C00009C00009C0000940000940000940063FF9C63F79463F794
              109C2184B563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000009C00009C00
              009C00009C0000940000940000940063FF9C63F79463F794109C21FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF009C0063FF9418AD2118AD217BBD63FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009C0063
              FF9418AD2118AD217BBD63FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009C0063FF9418AD2118AD21
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF009C0063FF9418AD2118AD21FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF009C0063FF9418AD2118AD21FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009C0000
              9C007BB542FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009C00009C007BB542FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF009C00009C007BB542FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF009C00009C007BB542FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009C0000
              9C00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000}
            Stretch = True
            Transparent = True
          end
          object cbCvFrom: TcxComboBox
            Left = 101
            Top = 9
            Width = 139
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = cbCvFromPropertiesChange
            Properties.OnEditValueChanged = cbCvFromPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnEnter = cbFromEnter
            OnExit = cbFromExit
            OnKeyPress = GoNext
          end
          object nbCvFrom: TNotebook
            Left = 288
            Top = 9
            Width = 338
            Height = 25
            TabOrder = 1
            object TPage
              Left = 0
              Top = 0
              Caption = 'Default'
              object ssSpeedButton4: TssSpeedButton
                Left = 313
                Top = 0
                Width = 26
                Height = 26
                Alignment = taLeftJustify
                AllwaysShowFrame = False
                ButtonType = ssbtStandard
                Checked = False
                Caption = 'aPayMPersons'
                GroupIndex = 0
                ImageIndex = -1
                Images = dmData.Images
                LeftMargin = 2
                ParentShowHint = False
                ShowHint = True
                Style = ssbsUser
                ViewStyle = ssvsGlyphOnly
              end
              object lCvFromCashDesk: TssLabel
                Left = 2
                Top = 5
                Width = 38
                Height = 16
                Caption = #1050#1072#1089#1089#1072':'
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lcbCvFromCashDesk: TssDBLookupCombo
                Left = 48
                Top = 0
                Width = 265
                Height = 24
                ImeName = 'Russian'
                Properties.DropDownListStyle = lsFixedList
                Properties.OnEditValueChanged = lcbCvFromCashDeskPropertiesEditValueChanged
                Style.StyleController = dmData.scMain
                TabOrder = 0
                OnKeyPress = GoNext
                EmptyValue = 0
                KeyField = 'cashid'
                ListField = 'name'
                ListSource = srcCashDesks
              end
            end
            object TPage
              Left = 0
              Top = 0
              Caption = 'Cashless'
              object lCvFromAcc: TssLabel
                Left = 2
                Top = 5
                Width = 23
                Height = 16
                Caption = #1056'/'#1089':'
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lcbCvFromAcc: TssDBLookupCombo
                Left = 48
                Top = 0
                Width = 288
                Height = 26
                ImeName = 'Russian'
                Properties.DropDownListStyle = lsFixedList
                Properties.OnEditValueChanged = lcbCvFromAccPropertiesEditValueChanged
                Style.StyleController = dmData.scMain
                TabOrder = 0
                OnKeyPress = GoNext
                EmptyValue = 0
                KeyField = 'accid'
                ListField = 'fullname'
                ListSource = srcEntAcc
              end
            end
          end
          object edCvFromTotal: TssCalcEdit
            Left = 101
            Top = 68
            Width = 139
            Height = 24
            Anchors = [akTop, akRight]
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            Properties.Alignment.Horz = taRightJustify
            Properties.ImmediatePost = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = edCvFromTotalPropertiesChange
            Properties.OnEditValueChanged = edTotalPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 3
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object lcbCvFromCurr: TssDBLookupCombo
            Left = 101
            Top = 38
            Width = 61
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsFixedList
            Properties.OnEditValueChanged = lcbCvFromCurrPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'currid'
            ListField = 'shortname'
            ListSource = srcCurrency
          end
          object lcbCvToCurr: TssDBLookupCombo
            Left = 432
            Top = 38
            Width = 62
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsFixedList
            Properties.OnEditValueChanged = lcbCvToCurrPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 4
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'currid'
            ListField = 'shortname'
            ListSource = srcCurrency
          end
          object edCvToTotal: TssCalcEdit
            Left = 432
            Top = 68
            Width = 139
            Height = 24
            Anchors = [akTop, akRight]
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            Properties.Alignment.Horz = taRightJustify
            Properties.ImmediatePost = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = edCvToTotalPropertiesChange
            Properties.OnEditValueChanged = edTotalPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 5
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
        end
        object tsCashAndCharge: TcxTabSheet
          Caption = 'tsCashAndCharge'
          ImageIndex = 0
          TabVisible = False
          DesignSize = (
            630
            132)
          object lCCFromAcc: TssLabel
            Left = 7
            Top = 14
            Width = 23
            Height = 16
            Caption = #1056'/'#1089':'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lCCFromSumm: TLabel
            Left = 7
            Top = 43
            Width = 53
            Height = 16
            Caption = #1057#1087#1080#1089#1072#1090#1100':'
          end
          object lCCFromSaldo: TLabel
            Left = 7
            Top = 73
            Width = 52
            Height = 16
            Caption = #1054#1089#1090#1072#1090#1086#1082':'
          end
          object txtCCFromSaldo: TssBevel
            Left = 102
            Top = 69
            Width = 190
            Height = 23
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
            Font.Style = [fsBold]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = True
          end
          object Image3: TImage
            Left = 306
            Top = 16
            Width = 24
            Height = 70
            Picture.Data = {
              07544269746D6170760C0000424D760C00000000000036000000280000001200
              0000380000000100180000000000400C0000C40E0000C40E0000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00630000
              6300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF006300006300FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF0063000063007BA563FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF0063000063007BA563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00630000
              63007BA563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00630052EF7B189421189421
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF00630052EF7B189421189421FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF00630052EF7B1894211894217BA563FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00630052
              EF7B1894211894217BA563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00630052EF7B189421189421
              7BA563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007300006B00
              006B00006B000063000063000063005AF78452EF7B52EF7B1894217B9C52FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007300006B00006B00006B000063
              000063000063005AF78452EF7B52EF7B1894217B9C52FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000007300006B00006B00006B000063000063000063005A
              F78452EF7B52EF7B1894217B9C52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000007300006B00006B00006B000063000063000063005AF78452EF7B52EF7B
              1894217B9C527B9C52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007300006B00
              006B00006B000063000063000063005AF78452EF7B52EF7B1894217B9C527B9C
              52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007B005AF78C5AF78C5AF78C5AF7
              8C5AF78C5AF78C5AF78429C63929C63952EF84189C29189C29FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000007B005AF78C5AF78C5AF78C5AF78C5AF78C5AF78C5A
              F78429C63929C63952EF84189C29189C297B9C52FFFFFFFFFFFFFFFFFFFFFFFF
              0000007B005AF78C5AF78C5AF78C5AF78C5AF78C5AF78C5AF78429C63929C639
              52EF84189C29189C297B9C52FFFFFFFFFFFFFFFFFFFFFFFF0000007B005AF78C
              5AF78C5AF78C5AF78C5AF78C5AF78C5AF78429C63929C63952EF84189C29189C
              297B9C52FFFFFFFFFFFFFFFFFFFFFFFF0000007B005AF78C5AF78C5AF78C5AF7
              8C5AF78C5AF78C5AF78429C63929C63952EF84189C29189C297B9C52FFFFFFFF
              FFFFFFFFFFFFFFFF0000008C0063FF9463FF9439D65A39D65239D65231CE5231
              CE4A29C64229C64231CE4A5AEF845AEF84189C297BA55AFFFFFFFFFFFFFFFFFF
              0000008C0063FF9463FF9439D65A39D65239D65231CE5231CE4A29C64229C642
              31CE4A5AEF845AEF84189C297BA55AFFFFFFFFFFFFFFFFFF0000008C0063FF94
              63FF9439D65A39D65239D65231CE5231CE4A29C64229C64231CE4A5AEF845AEF
              84189C297BA55AFFFFFFFFFFFFFFFFFF0000008C0063FF9463FF9439D65A39D6
              5239D65231CE5231CE4A29C64229C64231CE4A5AEF845AEF84189C297BA55A7B
              A55AFFFFFFFFFFFF0000008C0063FF9463FF9439D65A39D65239D65231CE5231
              CE4A29C64229C64231CE4A5AEF845AEF84189C297BA55A7BA55AFFFFFFFFFFFF
              000000940063FF9463FF944AE7734AE7734AE77342DE6B42DE6339D65A39D65A
              39D65A39D65A39D65A18942984AD6384AD63FFFFFFFFFFFF000000940063FF94
              63FF944AE7734AE7734AE77342DE6B42DE6339D65A39D65A39D65A39D65A39D6
              5A18942984AD6384AD63FFFFFFFFFFFF000000940063FF9463FF944AE7734AE7
              734AE77342DE6B42DE6339D65A39D65A39D65A39D65A39D65A18942984AD6384
              AD63FFFFFFFFFFFF000000940063FF9463FF944AE7734AE7734AE77342DE6B42
              DE6339D65A39D65A39D65A39D65A39D65A18942984AD6384AD63FFFFFFFFFFFF
              000000940063FF9463FF944AE7734AE7734AE77342DE6B42DE6339D65A39D65A
              39D65A39D65A39D65A18942984AD63FFFFFFFFFFFFFFFFFF000000940063FF94
              63FF944AE7734AE7734AE77342DE6B42DE6339D65A39D65A39D65A39D65A39D6
              5A18942984AD63FFFFFFFFFFFFFFFFFF000000940063FF9463FF944AE7734AE7
              734AE77342DE6B42DE6339D65A39D65A39D65A39D65A39D65A18942984AD63FF
              FFFFFFFFFFFFFFFF0000009C0063FF9C63FF9C63FF945AF78C5AF78C5AF78452
              EF8452EF7B52EF7B4AE773108C18108C1884AD63FFFFFFFFFFFFFFFFFFFFFFFF
              0000009C0063FF9C63FF9C63FF945AF78C5AF78C5AF78452EF8452EF7B52EF7B
              4AE773108C18108C1884AD63FFFFFFFFFFFFFFFFFFFFFFFF0000009C0063FF9C
              63FF9C63FF945AF78C5AF78C5AF78452EF8452EF7B52EF7B4AE773108C18108C
              1884AD63FFFFFFFFFFFFFFFFFFFFFFFF0000009C0063FF9C63FF9C63FF945AF7
              8C5AF78C5AF78452EF8452EF7B52EF7B4AE773108C18108C1884AD63FFFFFFFF
              FFFFFFFFFFFFFFFF0000009C0063FF9C63FF9C63FF945AF78C5AF78C5AF78452
              EF8452EF7B52EF7B4AE773108C18108C18FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000009C0063FF9C63FF9C63FF945AF78C5AF78C5AF78452EF8452EF7B52EF7B
              4AE773108C18108C18FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000009C00009C00
              009C00009C0000940000940000940063FF9C63F79463F794109C2184B56384B5
              63FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000009C00009C00009C00009C000094
              0000940000940063FF9C63F79463F794109C2184B563FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000009C00009C00009C00009C0000940000940000940063
              FF9C63F79463F794109C2184B563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000009C00009C00009C00009C0000940000940000940063FF9C63F79463F794
              109C2184B563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000009C00009C00
              009C00009C0000940000940000940063FF9C63F79463F794109C21FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF009C0063FF9418AD2118AD217BBD63FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009C0063
              FF9418AD2118AD217BBD63FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009C0063FF9418AD2118AD21
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF009C0063FF9418AD2118AD21FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF009C0063FF9418AD2118AD21FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009C0000
              9C007BB542FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009C00009C007BB542FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF009C00009C007BB542FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF009C00009C007BB542FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009C0000
              9C00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              0000}
            Stretch = True
            Transparent = True
          end
          object lCCToCash: TssLabel
            Left = 340
            Top = 14
            Width = 38
            Height = 16
            Caption = #1050#1072#1089#1089#1072':'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lCCToSumm: TLabel
            Left = 338
            Top = 43
            Width = 66
            Height = 16
            Caption = #1047#1072#1095#1080#1089#1083#1080#1090#1100':'
          end
          object lCCToSaldo: TLabel
            Left = 338
            Top = 73
            Width = 52
            Height = 16
            Caption = #1054#1089#1090#1072#1090#1086#1082':'
          end
          object txtCCToSaldo: TssBevel
            Left = 433
            Top = 69
            Width = 190
            Height = 23
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
            Font.Style = [fsBold]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = True
          end
          object lCCPercent: TLabel
            Left = 7
            Top = 102
            Width = 53
            Height = 16
            Caption = #1057#1087#1080#1089#1072#1090#1100':'
          end
          object lCCPercentEx: TssLabel
            Left = 161
            Top = 102
            Width = 12
            Height = 16
            Caption = '%'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lCCCharge: TssLabel
            Left = 199
            Top = 102
            Width = 124
            Height = 16
            Caption = #1053#1072' '#1089#1090#1072#1090#1100#1102' '#1088#1072#1089#1093#1086#1076#1086#1074':'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object btnChargeType: TssSpeedButton
            Left = 597
            Top = 97
            Width = 20
            Height = 20
            Action = aFinance
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 165
            Images = dmData.Images
            LeftMargin = 2
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnChargeTypeMouseDown
            OnMouseUp = btnChargeTypeMouseUp
          end
          object lcbCCFromAcc: TssDBLookupCombo
            Left = 101
            Top = 9
            Width = 192
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnEditValueChanged = lcbAccountPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'accid'
            ListField = 'fullname'
            ListSource = srcEntAcc
          end
          object edCCFromSumm: TssCalcEdit
            Left = 101
            Top = 38
            Width = 129
            Height = 24
            Anchors = [akTop, akRight]
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.ImmediatePost = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = edCCFromSummPropertiesChange
            Properties.OnEditValueChanged = edTotalPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 1
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object lcbCCFromCurr: TssDBLookupCombo
            Left = 231
            Top = 38
            Width = 62
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnEditValueChanged = lcbCurrencyPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'currid'
            ListField = 'shortname'
            ListSource = srcCurrency
          end
          object lcbCCToCashDesk: TssDBLookupCombo
            Left = 432
            Top = 9
            Width = 192
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnEditValueChanged = lcbCashDeskToPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 3
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'cashid'
            ListField = 'name'
            ListSource = srcCashDesks
          end
          object edCCToSumm: TssCalcEdit
            Left = 432
            Top = 38
            Width = 129
            Height = 24
            Anchors = [akTop, akRight]
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.ImmediatePost = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = edCCToSummPropertiesChange
            Properties.OnEditValueChanged = edTotalPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 4
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object lcbCCToCurr: TssDBLookupCombo
            Left = 562
            Top = 38
            Width = 62
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnEditValueChanged = lcbToCurrPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 5
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'currid'
            ListField = 'shortname'
            ListSource = srcCurrency
          end
          object edCCPercent: TssCalcEdit
            Left = 101
            Top = 97
            Width = 58
            Height = 24
            Anchors = [akTop, akRight]
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.ImmediatePost = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = edCCFromSummPropertiesChange
            Properties.OnEditValueChanged = edTotalPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 6
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object lcbCCCharge: TssDBLookupCombo
            Left = 364
            Top = 97
            Width = 232
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = lcbCCChargePropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 7
            OnEnter = cbFromEnter
            OnExit = cbFromExit
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'ctypeid'
            ListField = 'name'
            ListSource = srcChargeType
          end
        end
        object tsAdjust: TcxTabSheet
          Caption = 'tsAdjust'
          ImageIndex = 0
          TabVisible = False
          DesignSize = (
            630
            132)
          object lAdFrom: TssLabel
            Left = 7
            Top = 14
            Width = 46
            Height = 16
            Caption = #1054#1090#1082#1091#1076#1072':'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object btnAdFrom: TssSpeedButton
            Left = 265
            Top = 7
            Width = 27
            Height = 27
            Action = aFinance
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 165
            Images = dmData.Images
            LeftMargin = 3
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnAdFromMouseDown
            OnMouseUp = btnFinFromMouseUp
          end
          object lAdSaldoTo: TLabel
            Left = 329
            Top = 102
            Width = 90
            Height = 16
            Caption = #1054#1089#1090#1072#1090#1086#1082' '#1087#1086#1089#1083#1077':'
          end
          object txtAdSaldoTo: TssBevel
            Left = 433
            Top = 98
            Width = 190
            Height = 24
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
            Font.Style = [fsBold]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = True
          end
          object txtAdSaldoFrom: TssBevel
            Left = 102
            Top = 98
            Width = 190
            Height = 24
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
            Font.Style = [fsBold]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = True
          end
          object lAdSaldoFrom: TLabel
            Left = 7
            Top = 102
            Width = 70
            Height = 16
            Caption = #1054#1089#1090#1072#1090#1086#1082' '#1076#1086':'
          end
          object lAdType: TssLabel
            Left = 334
            Top = 15
            Width = 87
            Height = 16
            Caption = #1058#1080#1087' '#1086#1087#1077#1088#1072#1094#1080#1080':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lAdTotal: TLabel
            Left = 334
            Top = 44
            Width = 42
            Height = 16
            Caption = #1057#1091#1084#1084#1072':'
          end
          object cbAdFrom: TcxComboBox
            Left = 101
            Top = 9
            Width = 162
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnEditValueChanged = cbAdFromPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnEnter = cbFromEnter
            OnExit = cbFromExit
            OnKeyPress = GoNext
          end
          object nbAdFrom: TNotebook
            Left = 2
            Top = 38
            Width = 327
            Height = 26
            TabOrder = 1
            object TPage
              Left = 0
              Top = 0
              Caption = 'Default'
              object ssSpeedButton3: TssSpeedButton
                Left = 297
                Top = 3
                Width = 20
                Height = 20
                Alignment = taLeftJustify
                AllwaysShowFrame = False
                ButtonType = ssbtStandard
                Checked = False
                Caption = 'aPayMPersons'
                GroupIndex = 0
                ImageIndex = -1
                Images = dmData.Images
                LeftMargin = 2
                ParentShowHint = False
                ShowHint = True
                Style = ssbsUser
                ViewStyle = ssvsGlyphOnly
              end
              object lAdCash: TssLabel
                Left = 5
                Top = 5
                Width = 38
                Height = 16
                Caption = #1050#1072#1089#1089#1072':'
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lcbAdCash: TssDBLookupCombo
                Left = 98
                Top = 0
                Width = 192
                Height = 24
                ImeName = 'Russian'
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.OnEditValueChanged = lcbAdAccPropertiesEditValueChanged
                Style.StyleController = dmData.scMain
                TabOrder = 0
                EmptyValue = 0
                KeyField = 'cashid'
                ListField = 'name'
                ListSource = srcCashDesks
              end
            end
            object TPage
              Left = 0
              Top = 0
              Caption = 'Cashless'
              object lAdAcc: TssLabel
                Left = 5
                Top = 5
                Width = 23
                Height = 16
                Caption = #1056'/'#1089':'
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lcbAdAcc: TssDBLookupCombo
                Left = 98
                Top = 0
                Width = 192
                Height = 26
                ImeName = 'Russian'
                Properties.DropDownListStyle = lsFixedList
                Properties.OnEditValueChanged = lcbAdAccPropertiesEditValueChanged
                Style.StyleController = dmData.scMain
                TabOrder = 0
                EmptyValue = 0
                KeyField = 'accid'
                ListField = 'fullname'
                ListSource = srcEntAcc
              end
            end
          end
          object edAdTotal: TssCalcEdit
            Left = 432
            Top = 39
            Width = 129
            Height = 24
            Anchors = [akTop, akRight]
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.ImmediatePost = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = edAddTotalPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 3
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object lcbAdCurr: TssDBLookupCombo
            Left = 562
            Top = 39
            Width = 62
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnEditValueChanged = lcbAdCurrPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 4
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'currid'
            ListField = 'shortname'
            ListSource = srcCurrency
          end
          object cbAdType: TcxComboBox
            Left = 432
            Top = 9
            Width = 192
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnEditValueChanged = cbAddTypePropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnKeyPress = GoNext
          end
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 639
    inherited panTitleButtons: TssPanel
      Left = 581
      inherited btnTBMinimize: TssSpeedButton
        Height = 14
      end
      inherited btnTBMaximize: TssSpeedButton
        Height = 14
      end
      inherited btnTBClose: TssSpeedButton
        Height = 14
      end
    end
  end
  inherited panButtons: TPanel
    Top = 502
    Width = 639
    Height = 36
    inherited btnOK: TxButton
      Left = 330
      Top = 2
    end
    inherited btnCancel: TxButton
      Left = 433
      Top = 2
      Width = 97
    end
    inherited btnApply: TxButton
      Left = 537
      Top = 2
    end
  end
  inherited panToolBar: TPanel
    Width = 639
    inherited btnLock: TssSpeedButton
      Left = 586
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 610
    end
    inherited btnHelp: TssSpeedButton
      Left = 563
    end
    object btnBallance: TssSpeedButton
      Left = 50
      Top = 1
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 116
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      Visible = False
    end
    object btnSetPanels: TssSpeedButton
      Left = 73
      Top = 1
      Action = aSetPanels
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 40
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnPrint: TssSpeedButton
      Left = 2
      Top = 1
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 9
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnFinance: TssSpeedButton
      Left = 26
      Top = 1
      Action = aFinance
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 165
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnMouseDown = btnFinanceMouseDown
      OnMouseUp = btnFinanceMouseUp
    end
  end
  inherited ilTitleBar: TImageList
    Left = 316
    Top = 24
  end
  inherited FormStorage: TssFormStorage
    StoredProps.Strings = (
      'panNotes.Visible')
    Left = 288
    Top = 24
  end
  inherited ActionList: TActionList
    Images = dmData.Images18x18
    Left = 260
    Top = 24
    object aSetPanels: TAction
      Caption = 'aSetPanels'
      ImageIndex = 40
      Visible = False
      OnExecute = aSetPanelsExecute
    end
    object aWBDocs: TAction
      Caption = 'aWBDocs'
      ImageIndex = 41
    end
    object aFinance: TAction
      Caption = 'aFinance'
      ImageIndex = 165
      ShortCut = 16429
      OnExecute = aFinanceExecute
    end
  end
  object cdsCurrency: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDateTime
        Name = 'ondate'
        ParamType = ptInput
      end>
    ProviderName = 'pCurrency_ListEx'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsCurrencyBeforeOpen
    AfterOpen = cdsCurrencyAfterOpen
    Macros = <>
    Left = 60
    Top = 412
  end
  object srcCurrency: TDataSource
    DataSet = cdsCurrency
    Left = 32
    Top = 412
  end
  object cdsPayType: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_PayType_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 236
    Top = 12
  end
  object srcPayType: TDataSource
    DataSet = cdsPayType
    Left = 208
    Top = 12
  end
  object srcChargeType: TDataSource
    DataSet = cdsChargeType
    Left = 208
    Top = 276
  end
  object cdsChargeType: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pChargeType_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 236
    Top = 276
  end
  object cdsCashDesks: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pCashDesks_List'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsCashDesksAfterOpen
    Macros = <>
    Left = 380
    Top = 20
  end
  object srcCashDesks: TDataSource
    DataSet = cdsCashDesks
    Left = 348
    Top = 20
  end
  object cdsEntAcc: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_EntAccounts_List'
    RemoteServer = dmData.SConnection
    OnCalcFields = cdsEntAccCalcFields
    Macros = <>
    Left = 168
    Top = 65528
    object cdsEntAccACCID: TIntegerField
      FieldName = 'ACCID'
      Required = True
    end
    object cdsEntAccBANKID: TIntegerField
      FieldName = 'BANKID'
      Required = True
    end
    object cdsEntAccTYPEID: TIntegerField
      FieldName = 'TYPEID'
      Required = True
    end
    object cdsEntAccMFO: TStringField
      FieldName = 'MFO'
      Required = True
      Size = 10
    end
    object cdsEntAccNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 128
    end
    object cdsEntAccTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Required = True
      Size = 64
    end
    object cdsEntAccfullname: TStringField
      FieldKind = fkCalculated
      FieldName = 'fullname'
      Size = 255
      Calculated = True
    end
    object cdsEntAccACCNUM: TStringField
      FieldName = 'ACCNUM'
      Required = True
      Size = 64
    end
  end
  object srcEntAcc: TDataSource
    DataSet = cdsEntAcc
    Left = 140
    Top = 65528
  end
  object cdsPayMPersons: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 416
    Top = 312
  end
  object srcPayMPersons: TDataSource
    DataSet = cdsPayMPersons
    Left = 444
    Top = 312
  end
end
