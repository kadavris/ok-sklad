inherited frmEditInventory: TfrmEditInventory
  Left = 493
  Top = 196
  Width = 866
  Height = 583
  ActiveControl = edNum1
  Caption = '0'
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 858
    Height = 466
    DesignSize = (
      858
      466)
    object panData: TPanel
      Left = 0
      Top = 2
      Width = 857
      Height = 589
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object PanPos: TPanel
        Left = 0
        Top = 132
        Width = 857
        Height = 457
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PanPos'
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          857
          457)
        object gbPos: TssGroupBox
          Left = 4
          Top = -1
          Width = 851
          Height = 330
          Alignment = alTopLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = ' '#1055#1086#1079#1080#1094#1080#1080' '
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          HideCaption = True
          HotTrack = False
          DesignSize = (
            851
            330)
          object lSum: TLabel
            Left = 118
            Top = 279
            Width = 134
            Height = 16
            Anchors = [akRight, akBottom]
            Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1091#1095#1105#1090#1091' (UAH):'
          end
          object txtSum: TssBevel
            Left = 296
            Top = 277
            Width = 190
            Height = 22
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
          object lRealSum: TLabel
            Left = 118
            Top = 304
            Width = 137
            Height = 16
            Anchors = [akRight, akBottom]
            Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1092#1072#1082#1090#1091' (UAH):'
          end
          object txtSumReal: TssBevel
            Left = 296
            Top = 302
            Width = 190
            Height = 22
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
          object txtDiffSum: TssBevel
            Left = 655
            Top = 277
            Width = 191
            Height = 22
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
          object lSummDiff: TLabel
            Left = 512
            Top = 279
            Width = 134
            Height = 41
            Anchors = [akRight, akBottom]
            AutoSize = False
            Caption = #1057#1091#1084#1084#1072' '#1080#1079#1073#1099#1090#1082#1072'/'#1085#1077#1076#1086#1080#1084#1082#1080':'
            WordWrap = True
          end
          object panPosBar: TPanel
            Left = 1
            Top = 4
            Width = 848
            Height = 33
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 0
            DesignSize = (
              848
              33)
            object btnNew: TssSpeedButton
              Left = 6
              Top = 2
              Width = 117
              Height = 31
              Action = aCIns
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 3
              Images = dmData.Images18x18
              LeftMargin = 8
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnProps: TssSpeedButton
              Left = 122
              Top = 2
              Width = 118
              Height = 31
              Action = aCUpd
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 4
              Images = dmData.Images18x18
              LeftMargin = 8
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnDel: TssSpeedButton
              Left = 239
              Top = 2
              Width = 118
              Height = 31
              Action = aCDel
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 5
              Images = dmData.Images18x18
              LeftMargin = 8
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnGetRestsFromWH: TssSpeedButton
              Left = 366
              Top = 2
              Width = 275
              Height = 31
              Action = aGetRestsFromWH
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 26
              Images = dmData.Images18x18
              LeftMargin = 8
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object sepDyn: TBevel
              Left = 361
              Top = 5
              Width = 1
              Height = 27
              Shape = bsLeftLine
            end
            object edFind: TokGridSearchEdit
              Left = 665
              Top = 2
              Width = 179
              Height = 31
              Anchors = [akLeft, akTop, akRight]
              ButtonsLeftMargin = 3
              CapFind = 'Search'
              CapFindParams = 'Search options'
              CapContextFind = 'Context search'
              CapFindBegin = 'From the beginning'
              CapFindConcurr = 'Full match'
              CapFindSubstr = 'Partial match'
              EditorOffset = 0
              DisabledImages = dmData.Images18x18dis
              Images = dmData.Images18x18
              ImageIndexFind = 18
              ImageIndexFindParams = 19
              LangManager = dmData.Lng
              ShowCaptions = False
              ShowButtons = sbtNoRef
              SearchNames.Strings = (
                'Name;matname'
                'Model;artikul')
              SearchType = stBegin
              Skin = dmData.sknMain
              StyleController = dmData.scMain
              TabOrder = 0
              Grid = dbgWaybillDet
              DesignSize = (
                179
                31)
            end
          end
          object dbgWaybillDet: TssDBGrid
            Left = 7
            Top = 42
            Width = 839
            Height = 228
            Hint = 'matname'
            DrawDragFrame = False
            Bands = <
              item
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            KeyField = 'matid'
            SummaryGroups = <>
            SummarySeparator = ', '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            PopupMenu = pmMain
            ShowHint = True
            TabOrder = 1
            OnDblClick = dbgWaybillDetDblClick
            OnKeyPress = dbgWaybillDetKeyPress
            BandColor = 12500670
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
            OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoExtMultiSelect, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabs]
            OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseLocate]
            OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoShowButtonAlways, edgoUseBitmap]
            PreviewFont.Charset = DEFAULT_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -11
            PreviewFont.Name = 'Tahoma'
            PreviewFont.Style = [fsBold]
            ShowRowFooter = True
            OnChangedColumnsWidth = dbgWaybillDetChangedColumnsWidth
            OnCustomDrawCell = dbgWaybillDetCustomDrawCell
            OnEdited = dbgWaybillDetEdited
            OnEditing = dbgWaybillDetEditing
            Anchors = [akLeft, akTop, akRight, akBottom]
            LangManager = dmData.Lng
            OnNeedAdjust = dbgWaybillDetNeedAdjust
            OnGetOptionsTitle = dbgWaybillDetGetOptionsTitle
            object colFlag: TdxDBGridImageColumn
              Alignment = taLeftJustify
              DisableEditor = True
              MinWidth = 16
              Sizing = False
              Width = 20
              BandIndex = 0
              RowIndex = 0
              FieldName = 'checked'
              OnGetText = colFlagGetText
              ShowButtonStyle = sbNone
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
                '94'
                '95'
                '96'
                '97'
                '98'
                '99'
                '100'
                '101'
                '102'
                '103'
                '104'
                '105'
                '106'
                '107'
                '108'
                '109'
                '110'
                '111'
                '112'
                '113'
                '114'
                '115'
                '116'
                '117'
                '118'
                '119'
                '120'
                '121'
                '122'
                '123'
                '124'
                '125'
                '126'
                '127'
                '128'
                '129'
                '130'
                '131'
                '132'
                '133'
                '134'
                '135'
                '136'
                '137'
                '138'
                '139'
                '140'
                '141'
                '142'
                '143'
                '144'
                '145'
                '146'
                '147'
                '148'
                '149'
                '150'
                '151'
                '152'
                '153'
                '154'
                '155'
                '156'
                '157'
                '158'
                '159'
                '160'
                '161'
                '162'
                '163')
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
                '1')
            end
            object colRecNo: TdxDBGridColumn
              Alignment = taCenter
              Caption = #8470
              DisableEditor = True
              HeaderAlignment = taCenter
              MaxLength = 30
              MinWidth = 30
              Sizing = False
              Width = 35
              BandIndex = 0
              RowIndex = 0
              OnGetText = colRecNoGetText
            end
            object colGrpName: TdxDBGridColumn
              Tag = 1
              DisableEditor = True
              HeaderAlignment = taCenter
              Visible = False
              Width = 70
              BandIndex = 0
              RowIndex = 0
              FieldName = 'grpname'
            end
            object colMatName: TdxDBGridColumn
              Tag = 1
              DisableEditor = True
              HeaderAlignment = taCenter
              MaxLength = 300
              Width = 200
              BandIndex = 0
              RowIndex = 0
              FieldName = 'MATNAME'
              SummaryType = cstSum
              SummaryField = 'amount'
              SummaryFormat = '0.00'
            end
            object colArtikul: TdxDBGridColumn
              Tag = 1
              DisableEditor = True
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'artikul'
            end
            object colBarCode: TdxDBGridColumn
              Tag = 1
              DisableEditor = True
              HeaderAlignment = taCenter
              Visible = False
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'barcode'
            end
            object colMeasureName: TdxDBGridColumn
              Tag = 1
              Alignment = taCenter
              DisableEditor = True
              HeaderAlignment = taCenter
              MaxLength = 40
              MinWidth = 40
              Width = 40
              BandIndex = 0
              RowIndex = 0
              FieldName = 'MSRNAME'
            end
            object colAmount: TdxDBGridColumn
              Tag = 1
              Alignment = taRightJustify
              DisableEditor = True
              HeaderAlignment = taCenter
              MaxLength = 91
              Sorted = csUp
              Width = 60
              BandIndex = 0
              RowIndex = 0
              FieldName = 'amount'
              OnGetText = colAmountGetText
            end
            object colPrice: TdxDBGridColumn
              Tag = 1
              Alignment = taRightJustify
              DisableEditor = True
              HeaderAlignment = taCenter
              MaxLength = 120
              Width = 70
              BandIndex = 0
              RowIndex = 0
              FieldName = 'price'
              OnGetText = colPriceGetText
            end
            object colRealAmount: TdxDBGridCalcColumn
              Caption = 'realamount'
              HeaderAlignment = taCenter
              Width = 60
              BandIndex = 0
              RowIndex = 0
              FieldName = 'discount'
              OnGetText = colRealAmountGetText
              ButtonStyle = bsFlat
            end
            object colRealPrice: TdxDBGridCalcColumn
              HeaderAlignment = taCenter
              Width = 70
              BandIndex = 0
              RowIndex = 0
              FieldName = 'nds'
              OnGetText = colPriceGetText
              ButtonStyle = bsFlat
            end
            object colDiff: TdxDBGridColumn
              Tag = 1
              Alignment = taRightJustify
              DisableEditor = True
              HeaderAlignment = taCenter
              Width = 70
              BandIndex = 0
              RowIndex = 0
              OnGetText = colDiffGetText
            end
            object colDiffSum: TdxDBGridColumn
              Tag = 1
              Alignment = taRightJustify
              DisableEditor = True
              HeaderAlignment = taCenter
              Width = 80
              BandIndex = 0
              RowIndex = 0
              OnGetText = colDiffSumGetText
            end
            object colPriceTXT: TdxDBGridColumn
              Alignment = taRightJustify
              DisableEditor = True
              HeaderAlignment = taCenter
              Visible = False
              Width = 80
              BandIndex = 0
              RowIndex = 0
              FieldName = 'price'
            end
            object colPosId: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'posid'
            end
            object colNDS: TdxDBGridColumn
              Caption = #1053#1044#1057'(%)'
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NDS'
            end
            object colWHouseName: TdxDBGridColumn
              HeaderAlignment = taCenter
              MaxLength = 100
              MinWidth = 100
              Visible = False
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'WHNAME'
            end
            object colCurrName: TdxDBGridColumn
              Alignment = taCenter
              Visible = False
              Width = 30
              BandIndex = 0
              RowIndex = 0
              FieldName = 'currname'
            end
            object colRate: TdxDBGridColumn
              Alignment = taRightJustify
              Caption = #1050#1091#1088#1089
              HeaderAlignment = taCenter
              Visible = False
              Width = 50
              BandIndex = 0
              RowIndex = 0
              FieldName = 'onvalue'
            end
            object colSummCurr: TdxDBGridColumn
              Alignment = taRightJustify
              Caption = #1057#1091#1084#1084#1072' '#1074' '#1074#1072#1083#1102#1090#1077
              HeaderAlignment = taCenter
              MaxLength = 120
              Sizing = False
              Visible = False
              Width = 90
              BandIndex = 0
              RowIndex = 0
              OnGetText = colSummCurrGetText
              SummaryType = cstSum
              SummaryField = 'SummCurr'
              SummaryFormat = '0.00'
            end
            object colSummDef: TdxDBGridColumn
              Alignment = taRightJustify
              Caption = #1057#1091#1084#1084#1072' '#1074' UAH'
              HeaderAlignment = taCenter
              MaxLength = 120
              Sizing = False
              Visible = False
              Width = 90
              BandIndex = 0
              RowIndex = 0
              OnGetText = colSummDefGetText
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
        Width = 857
        Height = 132
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        DesignSize = (
          857
          132)
        object gbHeader: TssGroupBox
          Left = 4
          Top = 1
          Width = 581
          Height = 131
          Alignment = alTopLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = ' '#1054#1089#1085#1086#1074#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          HideCaption = True
          HotTrack = False
          DesignSize = (
            581
            131)
          object lNum: TLabel
            Left = 9
            Top = 42
            Width = 37
            Height = 16
            Caption = #1053#1086#1084#1077#1088
            Color = clBtnFace
            ParentColor = False
          end
          object lOndate: TLabel
            Left = 288
            Top = 6
            Width = 34
            Height = 16
            Anchors = [akTop, akRight]
            Caption = #1044#1072#1090#1072':'
          end
          object lReason: TLabel
            Left = 9
            Top = 101
            Width = 64
            Height = 16
            Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
          end
          object lWhouseOut: TLabel
            Left = 9
            Top = 71
            Width = 35
            Height = 16
            Caption = #1057#1082#1083#1072#1076
          end
          object btnWHouseOut: TssSpeedButton
            Left = 548
            Top = 65
            Height = 27
            Action = aPersonsOut
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            DisabledImages = dmData.Images18x18dis
            GroupIndex = 0
            ImageIndex = 25
            Images = dmData.Images18x18
            LeftMargin = 2
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnWHouseOutMouseDown
            OnMouseUp = btnChairmanMouseUp
          end
          object btnSetTime: TssSpeedButton
            Left = 548
            Top = 5
            Action = aSetTime
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 95
            Images = dmData.Images
            LeftMargin = 3
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object edDate: TcxDateEdit
            Left = 332
            Top = 5
            Width = 105
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnChange = cxDateEdit1PropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnKeyDown = GoNextKeyDown
            OnKeyPress = edDateKeyPress
            EditValue = 0d
          end
          object edReason: TcxTextEdit
            Left = 94
            Top = 96
            Width = 482
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 128
            Properties.OnChange = edReasonPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 5
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edNum1: TcxTextEdit
            Left = 94
            Top = 37
            Width = 243
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.MaxLength = 15
            Properties.OnChange = edNum1PropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 1
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = edNum1KeyPress
          end
          object chbPosting: TcxCheckBox
            Left = 4
            Top = 5
            Width = 163
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
            OnKeyPress = GoNext
          end
          object lcbWHouseOut: TssDBLookupCombo
            Left = 94
            Top = 66
            Width = 452
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = lcbWHouseOutPropertiesChange
            Properties.OnEditValueChanged = lcbWHouseOutPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 4
            OnEnter = lcbChairmanEnter
            OnExit = lcbChairmanExit
            OnKeyPress = lcbWHouseOutKeyPress
            EmptyValue = 0
            KeyField = 'wid'
            ListField = 'Name'
            ListSource = dsWhouse
          end
          object edTime: TcxTimeEdit
            Left = 449
            Top = 5
            Width = 88
            Height = 24
            Anchors = [akTop, akRight]
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.OnChange = edTimePropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 3
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
        end
        object gbComm: TssGroupBox
          Left = 584
          Top = 1
          Width = 271
          Height = 131
          Alignment = alTopLeft
          Anchors = [akTop, akRight, akBottom]
          Caption = ' '#1057#1086#1089#1090#1072#1074' '#1082#1086#1084#1080#1089#1089#1080#1080' '
          TabOrder = 1
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          HideCaption = True
          HotTrack = False
          DesignSize = (
            271
            131)
          object btnPerson2: TssSpeedButton
            Left = 243
            Top = 66
            Action = aPersonsOut
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 25
            Images = dmData.Images
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnPerson2MouseDown
            OnMouseUp = btnChairmanMouseUp
          end
          object btnPerson1: TssSpeedButton
            Left = 243
            Top = 38
            Action = aPersonsOut
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 25
            Images = dmData.Images
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnPerson1MouseDown
            OnMouseUp = btnChairmanMouseUp
          end
          object btnChairman: TssSpeedButton
            Left = 243
            Top = 10
            Action = aPersonsOut
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 25
            Images = dmData.Images
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnChairmanMouseDown
            OnMouseUp = btnChairmanMouseUp
          end
          object lChairman: TLabel
            Left = 11
            Top = 14
            Width = 83
            Height = 16
            Caption = #1055#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1100
          end
          object lPerson1: TLabel
            Left = 11
            Top = 43
            Width = 19
            Height = 16
            Caption = '1-'#1081
          end
          object lPerson2: TLabel
            Left = 11
            Top = 73
            Width = 19
            Height = 16
            Caption = '2-'#1081
          end
          object lPerson3: TLabel
            Left = 11
            Top = 102
            Width = 19
            Height = 16
            Caption = '3-'#1081
          end
          object btnPerson3: TssSpeedButton
            Left = 243
            Top = 95
            Action = aPersonsOut
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 25
            Images = dmData.Images
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnPerson3MouseDown
            OnMouseUp = btnPerson3MouseUp
          end
          object lcbChairman: TssDBLookupCombo
            Left = 107
            Top = 11
            Width = 134
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = lcbPersonNameOutPropertiesChange
            Properties.OnEditValueChanged = lcbChairmanPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnEnter = lcbChairmanEnter
            OnExit = lcbChairmanExit
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = dsChairman
          end
          object lcbPerson1: TssDBLookupCombo
            Left = 107
            Top = 39
            Width = 134
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = lcbPersonNameOutPropertiesChange
            Properties.OnEditValueChanged = lcbChairmanPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 1
            OnEnter = lcbChairmanEnter
            OnExit = lcbChairmanExit
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = dsPerson1
          end
          object lcbPerson2: TssDBLookupCombo
            Left = 107
            Top = 68
            Width = 134
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.OnChange = lcbPersonNameInPropertiesChange
            Properties.OnEditValueChanged = lcbChairmanPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnEnter = lcbChairmanEnter
            OnExit = lcbChairmanExit
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = dsPerson2
          end
          object lcbPerson3: TssDBLookupCombo
            Left = 107
            Top = 96
            Width = 134
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            BeepOnEnter = False
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.OnChange = lcbPersonNameInPropertiesChange
            Properties.OnEditValueChanged = lcbChairmanPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 3
            OnEnter = lcbChairmanEnter
            OnExit = lcbChairmanExit
            OnKeyPress = lcbPerson3KeyPress
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = dsPerson3
          end
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 858
    inherited panTitleButtons: TssPanel
      Left = 800
    end
  end
  inherited panButtons: TPanel
    Top = 513
    Width = 858
    Height = 40
    TabOrder = 3
    inherited btnOK: TxButton
      Left = 554
    end
    inherited btnCancel: TxButton
      Left = 657
    end
    inherited btnApply: TxButton
      Left = 757
    end
  end
  inherited panToolBar: TPanel
    Width = 858
    TabOrder = 1
    inherited btnLock: TssSpeedButton
      Left = 806
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 830
    end
    inherited btnHelp: TssSpeedButton
      Left = 782
    end
    object btnMatInfo: TssSpeedButton
      Left = 31
      Top = 1
      Action = aMatInfo
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 99
      Images = dmData.Images
      LeftMargin = 3
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnPrint: TssSpeedButton
      Left = 4
      Top = 1
      Action = aPrint
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
  end
  inherited ilTitleBar: TImageList
    Left = 136
    Top = 274
  end
  inherited FormStorage: TssFormStorage
    Left = 75
    Top = 273
  end
  inherited ActionList: TActionList
    Left = 105
    Top = 274
    object aPersonsOut: TAction [1]
      Category = 'addon'
      Caption = 'aPersons'
      ImageIndex = 25
      ShortCut = 16429
      OnExecute = aPersonsOutExecute
    end
    object aCIns: TAction [6]
      Category = 'det'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 3
      ShortCut = 45
      OnExecute = aCInsExecute
    end
    object aCUpd: TAction [7]
      Tag = 1
      Category = 'det'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ImageIndex = 4
      ShortCut = 16397
      OnExecute = aCUpdExecute
    end
    object aCDel: TAction [8]
      Category = 'det'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      ShortCut = 16430
      OnExecute = aCDelExecute
    end
    object aSetTime: TAction [9]
      Category = 'addon'
      ImageIndex = 95
      OnExecute = aSetTimeExecute
    end
    object aShowRealPrice: TAction [10]
      Category = 'det'
      Caption = 'aShowRealPrice'
      OnExecute = aShowRealPriceExecute
    end
    object aAddWHouseOut: TAction [11]
      Category = 'addon'
      Caption = 'aAddWHouseOut'
      ImageIndex = 50
      ShortCut = 16429
    end
    object aSelectAll: TAction [12]
      Caption = 'aSelectAll'
      ShortCut = 16449
      OnExecute = aSelectAllExecute
    end
    object aMatInfo: TAction [13]
      Caption = 'aMatInfo'
      ImageIndex = 99
      ShortCut = 16457
      OnExecute = aMatInfoExecute
    end
    object aPrint: TAction [14]
      Caption = 'aPrint'
      ImageIndex = 9
      OnExecute = aPrintExecute
    end
    object aGetRestsFromWH: TAction
      Caption = 'aGetRestsFromWH'
      ImageIndex = 26
      OnExecute = aGetRestsFromWHExecute
    end
    object aMatMove: TAction
      Caption = 'aMatMove'
      ImageIndex = 61
      ShortCut = 16461
      OnExecute = aMatMoveExecute
    end
    object aMatRsv: TAction
      Caption = 'aMatRsv'
      ImageIndex = 100
      ShortCut = 16466
      OnExecute = aMatRsvExecute
    end
    object aMCList: TAction
      Caption = 'aMCList'
      ImageIndex = 153
      ShortCut = 16462
      OnExecute = aMCListExecute
    end
    object aColParams: TAction
      Caption = 'aColParams'
      OnExecute = aColParamsExecute
    end
    object aCheck: TAction
      Caption = 'aCheck'
      ImageIndex = 163
      ShortCut = 113
      OnExecute = aCheckExecute
    end
    object aActivateFind: TAction
      Caption = 'aActivateFind'
      ShortCut = 16454
      OnExecute = aActivateFindExecute
    end
  end
  object dsDet: TDataSource
    DataSet = mdDet
    OnDataChange = dsDetDataChange
    Left = 220
    Top = 260
  end
  object cdsPerson1: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 625
    Top = 309
  end
  object dsPerson1: TDataSource
    DataSet = cdsPerson1
    Left = 654
    Top = 309
  end
  object cdsWhouse: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pWHouse_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsWhouseBeforeOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptInput
      end>
    Left = 134
    Top = 98
    object cdsWhouseWID: TIntegerField
      FieldName = 'WID'
      ReadOnly = True
    end
    object cdsWhouseNAME: TStringField
      FieldName = 'NAME'
      ReadOnly = True
      Size = 64
    end
    object cdsWhouseADDR: TStringField
      FieldName = 'ADDR'
      ReadOnly = True
      Size = 255
    end
    object cdsWhouseNOTES: TStringField
      FieldName = 'NOTES'
      ReadOnly = True
      Size = 255
    end
    object cdsWhouseDELETED: TIntegerField
      FieldName = 'DELETED'
      ReadOnly = True
    end
    object cdsWhouseDEF: TIntegerField
      FieldName = 'DEF'
      ReadOnly = True
    end
  end
  object dsWhouse: TDataSource
    DataSet = cdsWhouse
    Left = 162
    Top = 98
  end
  object cdsChairman: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 556
    Top = 280
  end
  object dsChairman: TDataSource
    DataSet = cdsChairman
    Left = 585
    Top = 280
  end
  object cdsPerson2: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 557
    Top = 331
  end
  object dsPerson2: TDataSource
    DataSet = cdsPerson2
    Left = 586
    Top = 331
  end
  object pmMain: TTBPopupMenu
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 248
    Top = 260
    object TBItem1: TTBItem
      Action = aCIns
      Images = dmData.Images
    end
    object TBItem2: TTBItem
      Action = aCDel
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem9: TTBItem
      Action = aSelectAll
    end
    object TBItem15: TTBItem
      Action = aCheck
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBItem6: TTBItem
      Action = aMatMove
    end
    object TBItem7: TTBItem
      Action = aMatRsv
    end
    object TBItem3: TTBItem
      Action = aMatInfo
    end
    object TBItem8: TTBItem
      Action = aMCList
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem5: TTBItem
      Action = aShowRealPrice
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem14: TTBItem
      Action = aColParams
    end
    object TBItem4: TTBItem
      Action = aCUpd
    end
  end
  object mdReport: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 266
    Top = 338
  end
  object frDoc: TfrReport
    Dataset = fsrcDoc
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frDocGetValue
    Left = 294
    Top = 338
    ReportForm = {19000000}
  end
  object fsrcDoc: TfrDBDataSet
    DataSet = mdReport
    Left = 325
    Top = 338
  end
  object mdDet: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterPost = mdDetAfterDelete
    AfterDelete = mdDetAfterDelete
    Left = 279
    Top = 260
    object mdDetposid: TIntegerField
      FieldName = 'posid'
    end
    object mdDetwbillid: TIntegerField
      FieldName = 'wbillid'
    end
    object mdDetmatid: TIntegerField
      FieldName = 'matid'
    end
    object mdDetwid: TIntegerField
      FieldName = 'wid'
    end
    object mdDetamount: TFloatField
      FieldName = 'amount'
    end
    object mdDetprice: TFloatField
      FieldName = 'price'
    end
    object mdDetdiscount: TFloatField
      FieldName = 'discount'
    end
    object mdDetnds: TFloatField
      FieldName = 'nds'
    end
    object mdDetondate: TDateTimeField
      FieldName = 'ondate'
    end
    object mdDetcurrid: TIntegerField
      FieldName = 'currid'
    end
    object mdDetptypeid: TIntegerField
      FieldName = 'ptypeid'
    end
    object mdDetnum: TIntegerField
      FieldName = 'num'
    end
    object mdDetmatname: TStringField
      FieldName = 'matname'
      Size = 128
    end
    object mdDetmsrname: TStringField
      FieldName = 'msrname'
      Size = 10
    end
    object mdDetartikul: TStringField
      FieldName = 'artikul'
      Size = 128
    end
    object mdDetwhname: TStringField
      FieldName = 'whname'
      Size = 64
    end
    object mdDetcurrname: TStringField
      FieldName = 'currname'
      Size = 15
    end
    object mdDetonvalue: TFloatField
      FieldName = 'onvalue'
    end
    object mdDetgrpname: TStringField
      FieldName = 'grpname'
      Size = 64
    end
    object mdDetchecked: TIntegerField
      FieldName = 'checked'
    end
    object mdDetbarcode: TStringField
      FieldName = 'barcode'
      Size = 128
    end
  end
  object cdsPerson3: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 622
    Top = 360
  end
  object dsPerson3: TDataSource
    DataSet = cdsPerson3
    Left = 651
    Top = 360
  end
end
