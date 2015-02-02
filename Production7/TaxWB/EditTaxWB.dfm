inherited frmEditTaxWB: TfrmEditTaxWB
  Left = 410
  Top = 239
  Width = 825
  Height = 582
  Caption = 'frmEditTaxWB'
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 817
    Height = 470
    TabOrder = 3
    DesignSize = (
      817
      470)
    object panData: TPanel
      Left = 0
      Top = -1
      Width = 816
      Height = 582
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object PanPos: TPanel
        Left = 0
        Top = 251
        Width = 816
        Height = 331
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PanPos'
        ParentBackground = False
        TabOrder = 1
        DesignSize = (
          816
          331)
        object gbPos: TssGroupBox
          Left = 4
          Top = -1
          Width = 810
          Height = 218
          Alignment = alTopLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = ' '#1055#1086#1079#1080#1094#1080#1080' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          HideCaption = True
          HotTrack = False
          DesignSize = (
            810
            218)
          object lTotal: TLabel
            Left = 331
            Top = 194
            Width = 80
            Height = 16
            Anchors = [akRight, akBottom]
            Caption = #1048#1090#1086#1075#1086' '#1074' UAH'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lTotNDSOut: TLabel
            Left = 445
            Top = 194
            Width = 49
            Height = 16
            Anchors = [akRight, akBottom]
            Caption = #1073#1077#1079' '#1053#1044#1057
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lSummDefNoNDS: TssBevel
            Left = 508
            Top = 190
            Width = 118
            Height = 20
            Alignments.Horz = taRightJustify
            Anchors = [akRight, akBottom]
            Caption = '830000,76 '
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
            GradientDirection = gdVertical
            HotTrack = False
            ImageIndex = 0
            ParentShowHint = False
            ShowHint = True
            UseGradient = True
          end
          object lTotNDS: TLabel
            Left = 638
            Top = 194
            Width = 25
            Height = 16
            Anchors = [akRight, akBottom]
            Caption = #1053#1044#1057
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lSummDefNDS: TssBevel
            Left = 683
            Top = 190
            Width = 119
            Height = 20
            Alignments.Horz = taRightJustify
            Anchors = [akRight, akBottom]
            Caption = '830000,76 '
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
            GradientDirection = gdVertical
            HotTrack = False
            ImageIndex = 0
            ParentShowHint = False
            ShowHint = True
            UseGradient = True
          end
          object lTot: TLabel
            Left = 13
            Top = 194
            Width = 39
            Height = 16
            Anchors = [akRight, akBottom]
            Caption = ' '#1089' '#1053#1044#1057
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lSummDef: TssBevel
            Left = 61
            Top = 190
            Width = 118
            Height = 20
            Alignments.Horz = taRightJustify
            Anchors = [akRight, akBottom]
            Caption = '830000,76 '
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
            GradientDirection = gdVertical
            HotTrack = False
            ImageIndex = 0
            ParentShowHint = False
            ShowHint = True
            UseGradient = True
          end
          object panPosBar: TPanel
            Left = 1
            Top = 6
            Width = 808
            Height = 35
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 0
            DesignSize = (
              808
              35)
            object btnAdd: TssSpeedButton
              Left = 6
              Top = 0
              Width = 117
              Height = 31
              Action = aCIns
              Alignment = taLeftJustify
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
              LeftMargin = 8
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnProps: TssSpeedButton
              Left = 122
              Top = 0
              Width = 118
              Height = 31
              Action = aCUpd
              Alignment = taLeftJustify
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
              LeftMargin = 8
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnDel: TssSpeedButton
              Left = 239
              Top = 0
              Width = 118
              Height = 31
              Action = aCDel
              Alignment = taLeftJustify
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
              LeftMargin = 8
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnFind: TssSpeedButton
              Left = 753
              Top = 6
              Width = 22
              Height = 22
              Action = aFind
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              Anchors = [akTop, akRight]
              ButtonType = ssbtStandard
              Checked = False
              GroupIndex = 0
              ImageIndex = 18
              Images = dmData.Images18x18
              LeftMargin = 3
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsGlyphOnly
            end
            object btnFindParams: TssSpeedButton
              Left = 777
              Top = 6
              Width = 22
              Height = 22
              Action = aFindParams
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              Anchors = [akTop, akRight]
              ButtonType = ssbtStandard
              Checked = False
              GroupIndex = 0
              ImageIndex = 19
              Images = dmData.Images18x18
              LeftMargin = 3
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsGlyphOnly
            end
            object txtLang: TssBevel
              Left = 730
              Top = 6
              Width = 27
              Height = 22
              Anchors = [akTop, akRight]
              Caption = 'RU'
              ColorGrBegin = clBtnFace
              ColorGrEnd = clBtnFace
              ColorInner = clBtnFace
              ColorOuter = clBtnFace
              Edges = [beLeft, beRight, beTop, beBottom]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              GradientDirection = gdHorizontal
              HotTrack = False
              ImageIndex = 0
              Margins.Left = 1
              UseGradient = False
            end
            object edFind: TcxTextEdit
              Left = 607
              Top = 4
              Width = 121
              Height = 24
              Anchors = [akTop, akRight]
              ParentFont = False
              Properties.OnChange = edFindPropertiesChange
              Style.BorderColor = clBtnShadow
              Style.BorderStyle = ebsSingle
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.HotTrack = False
              TabOrder = 0
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
          end
          object dbgWaybillDet: TdxDBGrid
            Left = 7
            Top = 42
            Width = 794
            Height = 141
            DrawDragFrame = False
            Bands = <
              item
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            KeyField = 'twbdetid'
            SummaryGroups = <>
            SummarySeparator = ', '
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            PopupMenu = pmMain
            TabOrder = 1
            OnDblClick = dbgWaybillDetDblClick
            OnKeyDown = GoNextKeyDown
            OnKeyPress = dbgWaybillDetKeyPress
            BandFont.Charset = DEFAULT_CHARSET
            BandFont.Color = clBlack
            BandFont.Height = -11
            BandFont.Name = 'Tahoma'
            BandFont.Style = [fsBold]
            DataSource = dsDet
            Filter.Criteria = {00000000}
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HideFocusRect = True
            HideSelectionColor = clInactiveBorder
            HideSelectionTextColor = clBlack
            LookAndFeel = lfUltraFlat
            MaxRowLineCount = 1
            OptionsBehavior = [edgoDragScroll, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
            OptionsCustomize = [edgoBandMoving, edgoBandSizing]
            OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseLocate]
            OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
            PreviewFont.Charset = DEFAULT_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -11
            PreviewFont.Name = 'Tahoma'
            PreviewFont.Style = [fsBold]
            ShowRowFooter = True
            OnCustomDrawCell = dbgWaybillDetCustomDrawCell
            Anchors = [akLeft, akTop, akRight, akBottom]
            object colRecNo: TdxDBGridColumn
              Alignment = taCenter
              Caption = #8470
              HeaderAlignment = taCenter
              MaxLength = 30
              MinWidth = 30
              Sizing = False
              Width = 35
              BandIndex = 0
              RowIndex = 0
              OnGetText = colRecNoGetText
            end
            object colOnDate: TdxDBGridDateColumn
              Caption = #1044#1072#1090#1072' '#1086#1090#1075#1088#1091#1079#1082#1080
              Width = 60
              BandIndex = 0
              RowIndex = 0
              FieldName = 'ondate'
            end
            object colMatName: TdxDBGridColumn
              HeaderAlignment = taCenter
              MaxLength = 200
              Sizing = False
              Width = 200
              BandIndex = 0
              RowIndex = 0
              FieldName = 'MATNAME'
              SummaryType = cstSum
              SummaryField = 'amount'
              SummaryFormat = '0.00'
            end
            object colMeasureName: TdxDBGridColumn
              Alignment = taCenter
              HeaderAlignment = taCenter
              MaxLength = 40
              MinWidth = 40
              Sizing = False
              Width = 40
              BandIndex = 0
              RowIndex = 0
              FieldName = 'MSRNAME'
            end
            object colAmount: TdxDBGridColumn
              Alignment = taRightJustify
              HeaderAlignment = taCenter
              MaxLength = 91
              MinWidth = 60
              Sizing = False
              Width = 60
              BandIndex = 0
              RowIndex = 0
              FieldName = 'amount'
            end
            object colPriceWONDS: TdxDBGridColumn
              Alignment = taRightJustify
              Caption = #1062#1077#1085#1072
              HeaderAlignment = taCenter
              Width = 70
              BandIndex = 0
              RowIndex = 0
              OnGetText = colPriceWONDSGetText
            end
            object colPriceNDS: TdxDBGridColumn
              Alignment = taRightJustify
              Caption = #1053#1044#1057
              HeaderAlignment = taCenter
              Width = 70
              BandIndex = 0
              RowIndex = 0
              OnGetText = colPriceNDSGetText
            end
            object colPrice: TdxDBGridColumn
              Alignment = taRightJustify
              Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
              HeaderAlignment = taCenter
              MaxLength = 120
              Sizing = False
              Width = 70
              BandIndex = 0
              RowIndex = 0
              FieldName = 'price'
              OnGetText = colPriceGetText
            end
            object colSummCurr: TdxDBGridColumn
              Alignment = taRightJustify
              Caption = #1057#1091#1084#1084#1072
              HeaderAlignment = taCenter
              MaxLength = 120
              Sizing = False
              Width = 70
              BandIndex = 0
              RowIndex = 0
              OnGetText = colSummCurrGetText
              SummaryType = cstSum
              SummaryField = 'SummCurr'
              SummaryFormat = '0.00'
            end
            object colID: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'twbdetid'
            end
            object colMatID: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'matid'
            end
          end
        end
      end
      object panHeader: TPanel
        Left = 0
        Top = 0
        Width = 816
        Height = 251
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          816
          251)
        object gbHeader: TssGroupBox
          Left = 4
          Top = 2
          Width = 541
          Height = 249
          Alignment = alTopLeft
          Anchors = [akLeft, akTop, akRight]
          Caption = ' '#1054#1089#1085#1086#1074#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          HideCaption = True
          HotTrack = False
          DesignSize = (
            541
            249)
          object lNum: TLabel
            Left = 9
            Top = 36
            Width = 37
            Height = 16
            Caption = #1053#1086#1084#1077#1088
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object lOndate: TLabel
            Left = 225
            Top = 36
            Width = 29
            Height = 16
            Anchors = [akTop, akRight]
            Caption = #1044#1072#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnSetTime: TssSpeedButton
            Left = 506
            Top = 32
            Width = 22
            Height = 22
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
          object lKAPhone: TLabel
            Left = 9
            Top = 187
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
          object lKACertNum: TssBevel
            Left = 270
            Top = 218
            Width = 106
            Height = 20
            Alignments.Horz = taRightJustify
            Anchors = [akTop, akRight]
            Caption = #1053#1086#1084#1077#1088' '#1089#1074#1080#1076'-'#1074#1072
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clBtnFace
            ColorOuter = clBtnFace
            Edges = [beLeft, beRight, beTop, beBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            GradientDirection = gdVertical
            HotTrack = False
            ImageIndex = 0
            Margins.Left = 0
            UseGradient = True
            WordBreak = False
          end
          object lKAAdress: TLabel
            Left = 9
            Top = 142
            Width = 35
            Height = 16
            Caption = #1040#1076#1088#1077#1089
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lKAFullName: TLabel
            Left = 9
            Top = 95
            Width = 66
            Height = 40
            AutoSize = False
            Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object lKAINN: TLabel
            Left = 9
            Top = 218
            Width = 35
            Height = 16
            Caption = #1040#1076#1088#1077#1089
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object chbPosting: TcxCheckBox
            Left = 2
            Top = 2
            Width = 164
            Height = 26
            AutoSize = False
            ParentFont = False
            Properties.Alignment = taLeftJustify
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = chbPostingPropertiesChange
            Properties.Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
            State = cbsChecked
            Style.StyleController = dmData.scMain
            TabOrder = 0
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edNum1: TcxTextEdit
            Left = 89
            Top = 31
            Width = 129
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.MaxLength = 15
            Properties.OnChange = edNum1PropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 2
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = edNum1KeyPress
          end
          object edDate: TcxDateEdit
            Left = 264
            Top = 31
            Width = 122
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.StyleController = dmData.scMain
            TabOrder = 3
            OnKeyDown = GoNextKeyDown
            OnKeyPress = edDateKeyPress
            EditValue = 0d
          end
          object edTime: TcxTimeEdit
            Left = 404
            Top = 31
            Width = 100
            Height = 24
            Anchors = [akTop, akRight]
            EditValue = 0.000000000000000000
            ParentFont = False
            Style.StyleController = dmData.scMain
            TabOrder = 4
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edKAFullName: TcxMemo
            Left = 89
            Top = 90
            Width = 444
            Height = 42
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.MaxLength = 255
            Properties.ReadOnly = True
            Style.StyleController = dmData.scMain
            TabOrder = 6
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edKAAdress: TcxMemo
            Left = 89
            Top = 135
            Width = 444
            Height = 45
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.MaxLength = 255
            Properties.ReadOnly = True
            Style.StyleController = dmData.scMain
            TabOrder = 7
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edKAPhone: TcxTextEdit
            Left = 89
            Top = 183
            Width = 444
            Height = 24
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 64
            Properties.ReadOnly = True
            Style.StyleController = dmData.scMain
            TabOrder = 8
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edKAINN: TcxTextEdit
            Left = 89
            Top = 213
            Width = 175
            Height = 24
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 32
            Properties.ReadOnly = True
            Style.StyleController = dmData.scMain
            TabOrder = 9
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edKACertNum: TcxTextEdit
            Left = 380
            Top = 213
            Width = 153
            Height = 24
            TabStop = False
            Anchors = [akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 32
            Properties.ReadOnly = True
            Style.StyleController = dmData.scMain
            TabOrder = 10
            ImeName = 'Russian'
            OnKeyPress = GoNext
          end
          object chbCheckNDS: TcxCheckBox
            Left = 229
            Top = 4
            Width = 173
            Height = 27
            AutoSize = False
            ParentFont = False
            Properties.Alignment = taLeftJustify
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1062#1077#1085#1099' '#1074#1082#1083#1102#1095#1072#1102#1090' '#1053#1044#1057
            State = cbsChecked
            Style.StyleController = dmData.scMain
            TabOrder = 1
            ImeName = 'Russian'
            OnClick = chbCheckNDSClick
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edKAgent: TokKASearchEdit
            Left = 9
            Top = 58
            Width = 523
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            ButtonsLeftMargin = 3
            CapFind = 'Search'
            CapFindParams = 'Search options'
            CapRef = 'Business Partners Directory'
            CapContextFind = 'Context search'
            CapFindBegin = 'From the beginning'
            CapFindConcurr = 'Full match'
            CapFindSubstr = 'Partial match'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            DisabledImages = dmData.Images18x18dis
            Images = dmData.Images18x18
            ImageIndexRef = 28
            ImageIndexFind = 18
            ImageIndexFindParams = 19
            LangManager = dmData.Lng
            RemoteServer = dmData.SConnection
            SearchNames.Strings = (
              'Short name;name')
            SearchType = stBegin
            TabOrder = 5
            OnChange = edKAgentChange
            LoadContracts = True
            SearchMode = smAll
            DesignSize = (
              523
              31)
          end
        end
        object gbAddInfo: TssGroupBox
          Left = 544
          Top = 2
          Width = 270
          Height = 249
          Alignment = alTopLeft
          Anchors = [akTop, akRight]
          Caption = ' '#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          HideCaption = True
          HotTrack = False
          DesignSize = (
            270
            249)
          object lCondition: TssBevel
            Left = 8
            Top = 2
            Width = 241
            Height = 18
            Caption = #1059#1089#1083#1086#1074#1080#1077' '#1087#1088#1086#1076#1072#1078#1080
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clBtnFace
            ColorOuter = clBtnFace
            Edges = [beLeft, beRight, beTop, beBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            GradientDirection = gdVertical
            HotTrack = False
            ImageIndex = 0
            Margins.Left = 0
            UseGradient = True
          end
          object lPayForm: TssLabel
            Left = 9
            Top = 74
            Width = 90
            Height = 16
            Caption = #1060#1086#1088#1084#1072' '#1088#1072#1089#1095#1105#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lAddCharges: TssBevel
            Left = 9
            Top = 97
            Width = 256
            Height = 15
            Alignments.Vert = vaTop
            Caption = #1058#1086#1074#1072#1088#1085#1086'-'#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1099#1077' '#1088#1072#1089#1093#1086#1076#1099' c '#1053#1044#1057
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clBtnFace
            ColorOuter = clBtnFace
            Edges = [beLeft, beRight, beTop, beBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            GradientDirection = gdVertical
            HotTrack = False
            ImageIndex = 0
            Margins.Left = 0
            UseGradient = True
          end
          object stCurrShortName: TssBevel
            Left = 226
            Top = 164
            Width = 42
            Height = 23
            Alignments.Horz = taCenter
            Caption = 'UAH'
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
            Visible = False
          end
          object lPersonname: TLabel
            Left = 9
            Top = 217
            Width = 55
            Height = 16
            Caption = #1057#1086#1089#1090#1072#1074#1080#1083
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnPersonName: TssSpeedButton
            Left = 245
            Top = 215
            Width = 22
            Height = 22
            Action = aPersons
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 32
            Images = dmData.Images18x18
            LeftMargin = 2
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object cbPayForm: TcxComboBox
            Left = 120
            Top = 69
            Width = 145
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownAutoWidth = False
            Properties.Items.Strings = (
              'fgfgfd'
              'dfgdfg')
            Properties.MaxLength = 64
            Style.StyleController = dmData.scMain
            TabOrder = 1
            Text = 'cbPayForm'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edAddCharges: TssCalcEdit
            Left = 8
            Top = 115
            Width = 257
            Height = 24
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            ParentFont = False
            Properties.OnChange = edAddChargesPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object rbtDiscountAdd: TcxRadioButton
            Left = 4
            Top = 150
            Width = 85
            Height = 21
            Caption = #1053#1072#1094#1077#1085#1082#1072' (%)'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            TabStop = True
            OnClick = rbtDiscountAddClick
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            LookAndFeel.Kind = lfUltraFlat
          end
          object edDiscountAdd: TssCalcEdit
            Left = 97
            Top = 146
            Width = 129
            Height = 24
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            ParentFont = False
            Properties.OnChange = edDiscountAddPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 4
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object rbtDiscountDec: TcxRadioButton
            Left = 4
            Top = 178
            Width = 85
            Height = 21
            Caption = #1057#1082#1080#1076#1082#1072' (%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnClick = rbtDiscountDecClick
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            LookAndFeel.Kind = lfUltraFlat
          end
          object edDiscountDec: TssCalcEdit
            Left = 97
            Top = 176
            Width = 129
            Height = 24
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            ParentFont = False
            Properties.OnChange = edDiscountDecPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 6
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object lcbPersonName: TssDBLookupCombo
            Left = 89
            Top = 213
            Width = 152
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = lcbPersonNamePropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 7
            OnExit = lcbPersonNameExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = lcbPersonNameKeyPress
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = srcPersonName
          end
          object edCondition: TcxMemo
            Left = 8
            Top = 22
            Width = 261
            Height = 44
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.MaxLength = 255
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 817
    TabOrder = 0
    inherited panTitleButtons: TssPanel
      Left = 759
    end
  end
  inherited panButtons: TPanel
    Top = 517
    Width = 817
    TabOrder = 2
    inherited btnOK: TxButton
      Left = 510
      OnKeyDown = GoNextKeyDown
    end
    inherited btnCancel: TxButton
      Left = 613
    end
    inherited btnApply: TxButton
      Left = 717
      OnKeyDown = GoNextKeyDown
    end
  end
  inherited panToolBar: TPanel
    Width = 817
    TabOrder = 1
    inherited btnLock: TssSpeedButton
      Left = 789
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 765
    end
    inherited btnHelp: TssSpeedButton
      Left = 741
    end
    object btnMatInfo: TssSpeedButton
      Left = 58
      Top = 1
      Width = 22
      Height = 22
      Action = aMatInfo
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 99
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnBallance: TssSpeedButton
      Left = 31
      Top = 1
      Width = 22
      Height = 22
      Action = aBalance
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 116
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnPrint: TssSpeedButton
      Left = 4
      Top = 1
      Width = 22
      Height = 22
      Action = aPrint
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 9
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
  end
  inherited ilTitleBar: TImageList
    Left = 152
    Top = 292
  end
  inherited FormStorage: TssFormStorage
    Left = 48
    Top = 295
  end
  inherited ActionList: TActionList
    Images = dmData.Images18x18
    Left = 48
    Top = 323
    object aCIns: TAction
      Category = 'det'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      ShortCut = 45
      OnExecute = aCInsExecute
    end
    object aCUpd: TAction
      Tag = 1
      Category = 'det'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ImageIndex = 1
      ShortCut = 16397
      OnExecute = aCUpdExecute
    end
    object aCDel: TAction
      Category = 'det'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 2
      ShortCut = 16430
      OnExecute = aCDelExecute
    end
    object aAddKA: TAction
      Category = 'addon'
      ImageIndex = 28
      OnExecute = aAddKAExecute
    end
    object aShowRealPrice: TAction
      Category = 'det'
      Caption = 'aShowRealPrice'
      OnExecute = aShowRealPriceExecute
    end
    object aPersons: TAction
      Category = 'addon'
      Caption = 'aPersons'
      ImageIndex = 32
      OnExecute = aPersonsExecute
    end
    object aSelectAll: TAction
      Category = 'det'
      Caption = 'aSelectAll'
      ShortCut = 16449
      OnExecute = aSelectAllExecute
    end
    object aFind: TAction
      Category = 'Find'
      Caption = 'aFind'
      ImageIndex = 18
      ShortCut = 8205
      OnExecute = aFindExecute
    end
    object aFindParams: TAction
      Category = 'Find'
      Caption = 'aFindParams'
      ImageIndex = 19
      OnExecute = aFindParamsExecute
    end
    object aFindBegin: TAction
      Category = 'Find'
      Caption = 'aFindBegin'
      Checked = True
      GroupIndex = 4
      OnExecute = aFindBeginExecute
    end
    object aFindSubstr: TAction
      Category = 'Find'
      Caption = 'aFindSubstr'
      GroupIndex = 4
      OnExecute = aFindBeginExecute
    end
    object aFindConcurr: TAction
      Category = 'Find'
      Caption = 'aFindConcurr'
      GroupIndex = 4
      OnExecute = aFindBeginExecute
    end
    object aContextFind: TAction
      Category = 'Find'
      Caption = 'aContextFind'
      Checked = True
      OnExecute = aContextFindExecute
    end
  end
  object mdDet: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    AfterPost = mdDetAfterPost
    Left = 296
    Top = 309
  end
  object dsDet: TDataSource
    DataSet = mdDet
    OnDataChange = dsDetDataChange
    Left = 325
    Top = 309
  end
  object cdsPersonName: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 222
    Top = 364
  end
  object srcPersonName: TDataSource
    DataSet = cdsPersonName
    Left = 250
    Top = 364
  end
  object pmMain: TTBPopupMenu
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 240
    Top = 309
    object TBItem1: TTBItem
      Action = aCIns
      Images = dmData.Images18x18
    end
    object TBItem2: TTBItem
      Action = aCDel
      Images = dmData.Images18x18
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem3: TTBItem
      Action = aSelectAll
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem5: TTBItem
      Action = aShowRealPrice
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem4: TTBItem
      Action = aCUpd
      Images = dmData.Images18x18
    end
  end
  object pmFind: TTBPopupMenu
    Skin = dmData.sknMain
    Left = 624
    Top = 316
    object mnuPosName: TTBItem
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      Checked = True
      GroupIndex = 11
      OnClick = mnuPosNameClick
    end
    object mnuPosArtikul: TTBItem
      Tag = 1
      Caption = #1040#1088#1090#1080#1082#1091#1083
      GroupIndex = 11
      OnClick = mnuPosNameClick
    end
    object TBSeparatorItem5: TTBSeparatorItem
    end
    object TBItem10: TTBItem
      Action = aFindBegin
      GroupIndex = 4
    end
    object TBItem11: TTBItem
      Action = aFindSubstr
      GroupIndex = 4
    end
    object TBItem12: TTBItem
      Action = aFindConcurr
      GroupIndex = 4
    end
    object TBSeparatorItem6: TTBSeparatorItem
    end
    object TBItem13: TTBItem
      Action = aContextFind
    end
  end
  object cdsFind: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSQL'
    RemoteServer = dmData.SConnection
    Macros = <
      item
        DataType = ftString
        Name = 'sql'
        ParamType = ptUnknown
      end>
    Left = 506
    Top = 346
  end
  object ActionList1: TActionList
    Images = dmData.Images
    Left = 420
    Top = 309
    object aPrint: TAction
      Caption = 'aPrint'
      ImageIndex = 9
      OnExecute = aPrintExecute
    end
    object aBalance: TAction
      Caption = 'aBalance'
      ImageIndex = 116
      OnExecute = aBalanceExecute
    end
    object aMatInfo: TAction
      Caption = 'aMatInfo'
      ImageIndex = 99
      OnExecute = aMatInfoExecute
    end
  end
  object mdReport: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 278
    Top = 392
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = mdReport
    Left = 250
    Top = 392
  end
  object frDoc: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frDocGetValue
    Left = 222
    Top = 392
    ReportForm = {19000000}
  end
end
