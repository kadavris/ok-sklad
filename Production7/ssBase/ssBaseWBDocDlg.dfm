inherited frmBaseWBDocDlg: TfrmBaseWBDocDlg
  Left = 408
  Top = 207
  Width = 884
  Height = 571
  Caption = 'frmBaseWBDocDlg'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 700
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Top = 51
    Width = 868
    Height = 447
    object panData: TPanel
      Left = 0
      Top = 0
      Width = 868
      Height = 447
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      object panPos: TPanel
        Left = 0
        Top = 198
        Width = 868
        Height = 249
        Align = alClient
        BevelOuter = bvNone
        Caption = 'panPos'
        ParentBackground = False
        ParentColor = True
        TabOrder = 0
        DesignSize = (
          868
          249)
        object gbPos: TssGroupBox
          Left = 5
          Top = 0
          Width = 868
          Height = 246
          Alignment = alTopLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = ' '#1055#1086#1079#1080#1094#1080#1080' '
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            868
            246)
          object lTotalCurr: TLabel
            Left = 11
            Top = 219
            Width = 72
            Height = 16
            Anchors = [akLeft, akBottom]
            Caption = #1048#1090#1086#1075#1086' '#1074' USD'
          end
          object lSummCurr: TssBevel
            Left = 113
            Top = 218
            Width = 118
            Height = 18
            Alignments.Horz = taRightJustify
            Anchors = [akLeft, akBottom]
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
          object lTotal: TLabel
            Left = 242
            Top = 219
            Width = 72
            Height = 16
            Anchors = [akRight, akBottom]
            Caption = #1048#1090#1086#1075#1086' '#1074' UAH'
          end
          object lTotNDSOut: TLabel
            Left = 346
            Top = 219
            Width = 49
            Height = 16
            Anchors = [akRight, akBottom]
            Caption = #1073#1077#1079' '#1053#1044#1057
          end
          object lSummDefNoNDS: TssBevel
            Left = 409
            Top = 218
            Width = 118
            Height = 18
            Alignments.Horz = taRightJustify
            Anchors = [akRight, akBottom]
            Caption = '999830000,76'
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
            Left = 535
            Top = 219
            Width = 25
            Height = 16
            Anchors = [akRight, akBottom]
            Caption = #1053#1044#1057
          end
          object lSummDefNDS: TssBevel
            Left = 571
            Top = 218
            Width = 112
            Height = 18
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
            Left = 690
            Top = 219
            Width = 39
            Height = 16
            Anchors = [akRight, akBottom]
            Caption = ' '#1089' '#1053#1044#1057
          end
          object lSummDef: TssBevel
            Left = 738
            Top = 218
            Width = 119
            Height = 18
            Alignments.Horz = taRightJustify
            Anchors = [akRight, akBottom]
            Caption = '830000,76'
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
          object dbgWaybillDet: TssDBGrid
            Left = 10
            Top = 54
            Width = 847
            Height = 155
            Hint = 'postype'
            DrawDragFrame = False
            Bands = <
              item
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            KeyField = 'posid'
            SummaryGroups = <>
            SummarySeparator = ', '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnKeyDown = GoNextKeyDown
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
            OptionsBehavior = [edgoDragScroll, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
            OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseLocate]
            OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
            PreviewFont.Charset = DEFAULT_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -11
            PreviewFont.Name = 'Tahoma'
            PreviewFont.Style = [fsBold]
            ShowRowFooter = True
            Anchors = [akLeft, akTop, akRight, akBottom]
            LangManager = dmData.Lng
            OnNeedAdjust = dbgWaybillDetNeedAdjust
            object colPosType: TdxDBGridImageColumn
              Alignment = taRightJustify
              MinWidth = 16
              Sizing = False
              Width = 25
              BandIndex = 0
              RowIndex = 0
              FieldName = 'postype'
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
                '160')
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
            object colStatus: TdxDBGridImageColumn
              Alignment = taRightJustify
              MinWidth = 16
              Sizing = False
              Width = 20
              BandIndex = 0
              RowIndex = 0
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
                '112')
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
                '1')
            end
            object colPosId: TdxDBGridColumn
              Alignment = taCenter
              Visible = False
              Width = 63
              BandIndex = 0
              RowIndex = 0
              FieldName = 'posid'
            end
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
            object colMatName: TdxDBGridColumn
              Tag = 1
              HeaderAlignment = taCenter
              MaxLength = 300
              MinWidth = 60
              Width = 270
              BandIndex = 0
              RowIndex = 0
              FieldName = 'MATNAME'
              SummaryType = cstSum
              SummaryField = 'amount'
              SummaryFormat = '0.00'
            end
            object colArtikul: TdxDBGridColumn
              Tag = 1
              HeaderAlignment = taCenter
              MinWidth = 60
              Visible = False
              Width = 99
              BandIndex = 0
              RowIndex = 0
              FieldName = 'artikul'
            end
            object colBarCode: TdxDBGridColumn
              Tag = 1
              HeaderAlignment = taCenter
              Visible = False
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'barcode'
            end
            object colNorm: TdxDBGridColumn
              Tag = 1
              Caption = #1053#1086#1088#1084#1072', '#1095
              HeaderAlignment = taCenter
              Visible = False
              Width = 59
              BandIndex = 0
              RowIndex = 0
              FieldName = 'norm'
            end
            object colWHouseName: TdxDBGridColumn
              Tag = 1
              HeaderAlignment = taCenter
              MaxLength = 100
              MinWidth = 100
              Visible = False
              Width = 101
              BandIndex = 0
              RowIndex = 0
              FieldName = 'WHNAME'
            end
            object colAmount: TdxDBGridColumn
              Tag = 1
              Alignment = taRightJustify
              HeaderAlignment = taCenter
              MaxLength = 91
              Width = 80
              BandIndex = 0
              RowIndex = 0
              FieldName = 'amount'
            end
            object colMeasureName: TdxDBGridColumn
              Tag = 1
              Alignment = taCenter
              HeaderAlignment = taCenter
              MaxLength = 40
              MinWidth = 40
              Width = 41
              BandIndex = 0
              RowIndex = 0
              FieldName = 'MSRNAME'
            end
            object colPrice: TdxDBGridColumn
              Tag = 1
              Alignment = taRightJustify
              HeaderAlignment = taCenter
              MaxLength = 120
              Width = 66
              BandIndex = 0
              RowIndex = 0
              OnGetText = colPriceWONDSGetText
            end
            object colPriceWONDS: TdxDBGridColumn
              Tag = 1
              Alignment = taRightJustify
              Caption = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
              HeaderAlignment = taCenter
              Visible = False
              Width = 78
              BandIndex = 0
              RowIndex = 0
              OnGetText = colPriceWONDSGetText
            end
            object colPriceInCurr: TdxDBGridColumn
              Tag = 1
              Alignment = taRightJustify
              HeaderAlignment = taCenter
              Visible = False
              Width = 63
              BandIndex = 0
              RowIndex = 0
              FieldName = 'price'
              OnGetText = colPriceWONDSGetText
            end
            object colNDSRate: TdxDBGridColumn
              Tag = 1
              HeaderAlignment = taCenter
              Visible = False
              Width = 59
              BandIndex = 0
              RowIndex = 0
              FieldName = 'nds'
              OnGetText = colNDSRateGetText
            end
            object colNDS: TdxDBGridColumn
              Tag = 1
              Alignment = taRightJustify
              HeaderAlignment = taCenter
              Visible = False
              Width = 69
              BandIndex = 0
              RowIndex = 0
              OnGetText = colNDSGetText
            end
            object colSummWONDS: TdxDBGridColumn
              Tag = 1
              Alignment = taRightJustify
              HeaderAlignment = taCenter
              Visible = False
              Width = 78
              BandIndex = 0
              RowIndex = 0
              OnGetText = colNDSGetText
            end
            object colSummDef: TdxDBGridColumn
              Tag = 1
              Alignment = taRightJustify
              HeaderAlignment = taCenter
              MaxLength = 120
              Width = 97
              BandIndex = 0
              RowIndex = 0
              OnGetText = colNDSGetText
            end
            object colSummCurr: TdxDBGridColumn
              Tag = 1
              Alignment = taRightJustify
              HeaderAlignment = taCenter
              MaxLength = 120
              Width = 90
              BandIndex = 0
              RowIndex = 0
              OnGetText = colNDSGetText
              SummaryType = cstSum
              SummaryField = 'SummCurr'
              SummaryFormat = '0.00'
            end
            object colMatId: TdxDBGridColumn
              Visible = False
              Width = 63
              BandIndex = 0
              RowIndex = 0
              FieldName = 'matid'
            end
            object colWId: TdxDBGridColumn
              Visible = False
              Width = 63
              BandIndex = 0
              RowIndex = 0
              FieldName = 'wid'
            end
            object colPType: TdxDBGridColumn
              Visible = False
              Width = 63
              BandIndex = 0
              RowIndex = 0
              FieldName = 'postype'
            end
            object colOnValue: TdxDBGridColumn
              Tag = 1
              Alignment = taRightJustify
              HeaderAlignment = taCenter
              Visible = False
              Width = 63
              BandIndex = 0
              RowIndex = 0
              FieldName = 'onvalue'
            end
            object colDiscount: TdxDBGridColumn
              Tag = 1
              Alignment = taRightJustify
              HeaderAlignment = taCenter
              Visible = False
              Width = 63
              BandIndex = 0
              RowIndex = 0
              FieldName = 'discount'
              OnGetText = colNDSRateGetText
            end
            object colSerial: TdxDBGridColumn
              Tag = 1
              HeaderAlignment = taCenter
              Visible = False
              Width = 99
              BandIndex = 0
              RowIndex = 0
              FieldName = 'sn'
            end
            object colProducer: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              Width = 99
              BandIndex = 0
              RowIndex = 0
              FieldName = 'producer'
            end
            object colGTD: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              Width = 99
              BandIndex = 0
              RowIndex = 0
              FieldName = 'gtd'
            end
            object colCertNum: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              Width = 99
              BandIndex = 0
              RowIndex = 0
              FieldName = 'certnum'
            end
            object colCertDate: TdxDBGridColumn
              Alignment = taCenter
              HeaderAlignment = taCenter
              Visible = False
              Width = 78
              BandIndex = 0
              RowIndex = 0
              FieldName = 'certdate'
            end
            object colNotes: TdxDBGridColumn
              Tag = 1
              HeaderAlignment = taCenter
              Visible = False
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'notes'
            end
            object colCardNum: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              Width = 70
              BandIndex = 0
              RowIndex = 0
              FieldName = 'cardnum'
            end
            object colCardHolder: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'holder'
            end
          end
        end
      end
      object panHeader: TPanel
        Left = 0
        Top = 0
        Width = 868
        Height = 198
        Align = alTop
        BevelOuter = bvNone
        Caption = 'panHeader'
        ParentBackground = False
        ParentColor = True
        TabOrder = 1
        object gbHeader: TssGroupBox
          Left = 6
          Top = 1
          Width = 616
          Height = 193
          Alignment = alTopLeft
          Caption = ' '#1054#1089#1085#1086#1074#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          HideCaption = True
          HotTrack = False
          DesignSize = (
            616
            193)
          object lRate: TLabel
            Left = 177
            Top = 154
            Width = 26
            Height = 16
            Alignment = taRightJustify
            Caption = #1050#1091#1088#1089
            Visible = False
          end
          object lCurr: TLabel
            Left = 9
            Top = 154
            Width = 44
            Height = 16
            Caption = #1042#1072#1083#1102#1090#1072
            Visible = False
          end
          object lOndate: TLabel
            Left = 257
            Top = 36
            Width = 29
            Height = 16
            Caption = #1044#1072#1090#1072
          end
          object btnSetTime: TssSpeedButton
            Left = 559
            Top = 30
            Width = 22
            Height = 22
            Action = aSetCurrentDateTime
            Alignment = taLeftJustify
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
          object edRate: TssCalcEdit
            Left = 209
            Top = 149
            Width = 89
            Height = 24
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.ImmediatePost = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = edRatePropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 0
            Visible = False
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 8
          end
          object cbCurr: TssDBLookupCombo
            Left = 100
            Top = 149
            Width = 67
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = cbCurrPropertiesChange
            Properties.OnEditValueChanged = cbCurrPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 1
            Visible = False
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'CURRID'
            ListField = 'SHORTNAME'
            ListSource = dsCurr
          end
          object edDate: TcxDateEdit
            Left = 297
            Top = 31
            Width = 113
            Height = 24
            ImeName = 'Russian'
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnChange = edDatePropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnKeyDown = GoNextKeyDown
            OnKeyPress = edDateKeyPress
            EditValue = 0d
          end
          object edTime: TcxTimeEdit
            Left = 449
            Top = 31
            Width = 104
            Height = 24
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
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 868
    Height = 25
    inherited panTitleButtons: TssPanel
      Left = 807
      Width = 59
      Height = 21
      inherited btnTBMinimize: TssSpeedButton
        Left = 0
        Top = 0
      end
      inherited btnTBMaximize: TssSpeedButton
        Top = 0
      end
      inherited btnTBClose: TssSpeedButton
        Left = 39
        Top = 0
      end
    end
  end
  inherited panButtons: TPanel
    Top = 498
    Width = 868
    DesignSize = (
      868
      35)
    inherited btnOK: TxButton
      Left = 559
    end
    inherited btnCancel: TxButton
      Left = 665
    end
    inherited btnApply: TxButton
      Left = 772
      Enabled = False
    end
  end
  inherited panToolBar: TPanel
    Top = 25
    Width = 868
    DesignSize = (
      868
      26)
    inherited btnLock: TssSpeedButton
      Left = 812
      LeftMargin = 2
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 837
      LeftMargin = 2
    end
    inherited btnHelp: TssSpeedButton
      Left = 787
      LeftMargin = 2
    end
    object btnBallance: TssSpeedButton
      Left = 6
      Top = 1
      Action = aBallance
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
      Left = 27
      Top = 1
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
    object btnMatInfo: TssSpeedButton
      Left = 48
      Top = 1
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 99
      Images = dmData.Images
      LeftMargin = 2
      Style = ssbsFlat
      ViewStyle = ssvsGlyphOnly
      OnClick = aMatInfoExecute
    end
    object btnSvcInfo: TssSpeedButton
      Left = 69
      Top = 1
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 100
      Images = dmData.Images
      LeftMargin = 2
      Style = ssbsFlat
      ViewStyle = ssvsGlyphOnly
      OnClick = aSvcInfoExecute
    end
    object btnFinance: TssSpeedButton
      Left = 90
      Top = 1
      Width = 24
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 165
      Images = dmData.Images
      LeftMargin = 2
      Style = ssbsFlat
      ViewStyle = ssvsGlyphOnly
      OnClick = aFinanceExecute
    end
  end
  inherited ilTitleBar: TImageList
    Left = 20
    Top = 64
  end
  inherited ActionList: TActionList
    Left = 48
    Top = 64
    object aSvcInfo: TAction
      Caption = 'aSvcInfo'
      ImageIndex = 160
      Visible = False
      OnExecute = aSvcInfoExecute
    end
    object aMatInfo: TAction
      Caption = 'aMatInfo'
      ImageIndex = 99
      OnExecute = aMatInfoExecute
    end
    object aBallance: TAction
      Caption = 'aBallance'
      ImageIndex = 116
      OnExecute = aBallanceExecute
    end
    object aPrint: TAction
      Caption = 'aPrint'
      ImageIndex = 9
      OnExecute = aPrintExecute
    end
    object aShowGridOptions: TAction
      Caption = 'aShowGridOptions'
      OnExecute = aShowGridOptionsExecute
    end
    object aShowRealPrice: TAction
      Caption = 'aShowRealPrice'
      OnExecute = aShowRealPriceExecute
    end
    object aFinance: TAction
      Caption = 'aFinance'
      ImageIndex = 165
      Visible = False
      OnExecute = aFinanceExecute
    end
    object aSetRate: TAction
      Caption = 'aSetRate'
      OnExecute = aSetRateExecute
    end
    object aSetCurrentDateTime: TAction
      Caption = 'aSetCurrentDateTime'
      ImageIndex = 95
      OnExecute = aSetCurrentDateTimeExecute
    end
  end
  object dsDet: TDataSource
    DataSet = mdDet
    Left = 308
    Top = 315
  end
  object mdDet: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterPost = mdDetAfterPost
    AfterDelete = mdDetAfterDelete
    Left = 312
    Top = 267
    object mdDetposid: TIntegerField
      DefaultExpression = '0'
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
      DisplayWidth = 255
      FieldName = 'matname'
      Size = 255
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
    object mdDetpostype: TIntegerField
      FieldName = 'postype'
    end
    object mdDetpersonid: TIntegerField
      FieldName = 'personid'
    end
    object mdDetnorm: TFloatField
      FieldName = 'norm'
    end
    object mdDetsn: TStringField
      FieldName = 'sn'
      Size = 1024
    end
    object mdDetproducer: TStringField
      FieldName = 'producer'
      Size = 255
    end
    object mdDetgtd: TStringField
      FieldName = 'gtd'
      Size = 64
    end
    object mdDetcertnum: TStringField
      FieldName = 'certnum'
      Size = 64
    end
    object mdDetcertdate: TDateTimeField
      FieldName = 'certdate'
    end
    object mdDetnotes: TStringField
      FieldName = 'notes'
      Size = 255
    end
    object mdDetbarcode: TStringField
      DisplayWidth = 128
      FieldName = 'barcode'
      Size = 128
    end
    object mdDetfullprice: TFloatField
      FieldName = 'fullprice'
    end
    object mdDetcardid: TIntegerField
      FieldName = 'cardid'
    end
    object mdDetholder: TStringField
      FieldName = 'holder'
      Size = 64
    end
    object mdDetcardnum: TStringField
      FieldName = 'cardnum'
      Size = 24
    end
    object mdDettotal: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'total'
    end
    object mdDetsumwonds: TFloatField
      FieldName = 'sumwonds'
    end
    object mdDetsumnds: TFloatField
      FieldName = 'sumnds'
    end
    object mdDetsumwithnds: TFloatField
      FieldName = 'sumwithnds'
    end
    object mdDetsumcurr: TFloatField
      FieldName = 'sumcurr'
    end
    object mdDetpricewithnds: TFloatField
      FieldName = 'pricewithnds'
    end
    object mdDetpricewonds: TFloatField
      FieldName = 'pricewonds'
    end
  end
  object srcCashDesks: TDataSource
    DataSet = cdsCashDesks
    Left = 296
    Top = 120
  end
  object cdsCashDesks: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pCashDesks_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 292
    Top = 168
  end
  object srcEntAcc: TDataSource
    DataSet = cdsEntAcc
    Left = 392
    Top = 120
  end
  object cdsEntAcc: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_EntAccounts_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 396
    Top = 168
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
    object cdsEntAccDEF: TIntegerField
      FieldName = 'DEF'
    end
  end
  object cdsCurr: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pCurrency_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 416
    Top = 342
    object cdsCurrCURRID: TIntegerField
      FieldName = 'CURRID'
      ReadOnly = True
    end
    object cdsCurrNAME: TStringField
      FieldName = 'NAME'
      ReadOnly = True
      Size = 24
    end
    object cdsCurrSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      ReadOnly = True
      Size = 3
    end
    object cdsCurrDEF: TIntegerField
      FieldName = 'DEF'
      ReadOnly = True
    end
    object cdsCurrDELETED: TIntegerField
      FieldName = 'DELETED'
      ReadOnly = True
    end
    object cdsCurrREPSHORTNAME: TStringField
      FieldName = 'REPSHORTNAME'
      ReadOnly = True
      Size = 10
    end
    object cdsCurrREPFRACNAME: TStringField
      FieldName = 'REPFRACNAME'
      ReadOnly = True
      Size = 10
    end
    object cdsCurrCURTYPE: TIntegerField
      FieldName = 'CURTYPE'
      ReadOnly = True
    end
  end
  object dsCurr: TDataSource
    DataSet = cdsCurr
    Left = 413
    Top = 390
  end
end
