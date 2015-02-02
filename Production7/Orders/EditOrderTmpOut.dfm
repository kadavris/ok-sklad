inherited frmEditOrderTmpOut: TfrmEditOrderTmpOut
  Left = 256
  Top = 227
  VertScrollBar.Range = 0
  ActiveControl = edMat
  BorderStyle = bsDialog
  Caption = 'frmEditOrderTmpOut'
  ClientHeight = 608
  ClientWidth = 661
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 661
    Height = 526
    object bvlMain: TssBevel
      Left = 5
      Top = 2
      Width = 649
      Height = 505
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object bvlPriceInterval: TssBevel
      Left = 6
      Top = 110
      Width = 648
      Height = 7
      Anchors = [akLeft, akTop, akRight]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsTopLine
      Style = bsSingle
      UseGradient = False
    end
    object lAmount: TssLabel
      Left = 16
      Top = 214
      Width = 73
      Height = 16
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
      Transparent = True
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object stMeasureName: TssBevel
      Left = 282
      Top = 210
      Width = 50
      Height = 24
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
    object lType: TssLabel
      Left = 16
      Top = 16
      Width = 38
      Height = 16
      Caption = #1047#1072#1082#1072#1079':'
      Transparent = True
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object lDate: TssLabel
      Left = 308
      Top = 47
      Width = 34
      Height = 16
      Caption = #1044#1072#1090#1072':'
      Transparent = True
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object btnPartysSelect: TssSpeedButton
      Left = 252
      Top = 208
      Alignment = taCenter
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      DisabledImages = dmData.Images18x18dis
      GroupIndex = 0
      ImageIndex = 43
      Images = dmData.Images18x18
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnPartysSelectClick
    end
    object edMat: TokMatSearchEdit
      Left = 16
      Top = 145
      Width = 626
      Height = 31
      Hint = '55555'
      Anchors = [akLeft, akTop, akRight]
      ButtonsLeftMargin = 3
      Color = clBtnFace
      CapFind = 'Search'
      CapFindParams = 'Search options'
      CapRef = 'Products Directory'
      CapContextFind = 'Context search'
      CapFindBegin = 'From the beginning'
      CapFindConcurr = 'Full match'
      CapFindSubstr = 'Partial match'
      EditorOffset = 71
      DisabledImages = dmData.Images18x18dis
      Images = dmData.Images18x18
      ImageIndexRef = 22
      ImageIndexFind = 18
      ImageIndexFindParams = 19
      LangManager = dmData.Lng
      ParentColor = False
      RemoteServer = dmData.SConnection
      ShowHint = True
      SearchNames.Strings = (
        'Name;name'
        'Model;artikul'
        'Barcode;barcode')
      SearchType = stBegin
      TabOrder = 5
      OnChange = edMatChange
      OnRefButtonClick = edMatRefButtonClick
      AllowZeroRest = True
      LoadNDS = True
      LoadTaxes = True
      ScannerImageIndex = 50
      DesignSize = (
        626
        31)
    end
    object lcbWH: TokWHouseSearchEdit
      Left = 16
      Top = 176
      Width = 433
      Height = 31
      ButtonsLeftMargin = 3
      CapRef = 'Warehouses Directory'
      EditorOffset = 91
      DisabledImages = dmData.Images18x18dis
      Images = dmData.Images18x18
      ImageIndexRef = 26
      LangManager = dmData.Lng
      RemoteServer = dmData.SConnection
      ShowLng = False
      ShowButtons = sbtOnlyRef
      SearchNames.Strings = (
        'Warehouse:;name')
      SearchType = stBegin
      Skin = dmData.sknMain
      StyleController = dmData.scMain
      TabOrder = 6
      OnChange = lcbWHChange
      OnKeyDown = GoNextKeyDown
      ViewMode = vmList
      DesignSize = (
        433
        31)
    end
    object edAmount: TssCalcEdit
      Left = 128
      Top = 209
      Width = 123
      Height = 24
      EditValue = 0.000000000000000000
      ImeName = 'Russian'
      ParentFont = False
      Properties.OnChange = edAmountPropertiesChange
      Style.StyleController = dmData.scMain
      TabOrder = 8
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
      CalcColor = clBtnFace
      DecimalPlaces = 4
    end
    object edKAgent: TokKASearchEdit
      Left = 16
      Top = 70
      Width = 626
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
      EditorOffset = 91
      DisabledImages = dmData.Images18x18dis
      Images = dmData.Images18x18
      ImageIndexRef = 28
      ImageIndexFind = 18
      ImageIndexFindParams = 19
      LangManager = dmData.Lng
      RemoteServer = dmData.SConnection
      ShowLng = False
      SearchNames.Strings = (
        'Short name;name')
      SearchType = stBegin
      TabOrder = 3
      OnChange = edKAgentChange
      LoadContracts = True
      SearchMode = smAll
      DesignSize = (
        626
        31)
    end
    object edNum: TokOrderSearchEdit
      Left = 16
      Top = 39
      Width = 277
      Height = 31
      ButtonsLeftMargin = 4
      CapRef = 'Customer orders register'
      EditMode = True
      EditorOffset = 91
      Images = dmData.Images
      ImageIndexRef = 189
      LangManager = dmData.Lng
      RemoteServer = dmData.SConnection
      ShowLng = False
      ShowButtons = sbtHide
      SearchNames.Strings = (
        'Order No.;num')
      SearchType = stBegin
      Skin = dmData.sknMain
      StyleController = dmData.scMain
      TabOrder = 1
      OnChange = edNumChange
      OnEditorChange = edNumEditorChange
      DocType = otOut
      DesignSize = (
        277
        31)
    end
    object edDate: TcxDateEdit
      Left = 353
      Top = 42
      Width = 99
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.BorderColor = clRed
      Style.BorderStyle = ebsUltraFlat
      Style.StyleController = dmData.scMain
      Style.ButtonStyle = btsSimple
      TabOrder = 2
      OnKeyDown = GoNextKeyDown
      EditValue = 0d
    end
    object cbSelectType: TcxComboBox
      Left = 128
      Top = 11
      Width = 324
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.OnEditValueChanged = cbSelectTypePropertiesEditValueChanged
      Style.StyleController = dmData.scMain
      TabOrder = 0
      OnKeyPress = GoNext
    end
    object chbRsv: TcxCheckBox
      Left = 123
      Top = 118
      Width = 435
      Height = 27
      AutoSize = False
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1090#1100' '#1090#1086#1074#1072#1088
      State = cbsChecked
      Style.BorderColor = clBtnShadow
      Style.BorderStyle = ebsUltraFlat
      Style.Shadow = False
      Style.StyleController = dmData.scMain
      TabOrder = 4
      ImeName = 'Russian'
      OnClick = chbRsvClick
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
    object pcMain: TcxPageControl
      Left = 16
      Top = 272
      Width = 626
      Height = 223
      ActivePage = tsOrder
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 7
      OnChange = pcMainChange
      object tsOrder: TcxTabSheet
        Caption = 'tsOrder'
        ImageIndex = 0
        object grdDet: TssDBGrid
          Left = 0
          Top = 0
          Width = 626
          Height = 197
          Hint = 'MATNAME'
          DrawDragFrame = False
          Bands = <
            item
            end>
          DefaultLayout = False
          HeaderPanelRowCount = 1
          KeyField = 'posid'
          SummaryGroups = <>
          SummarySeparator = ', '
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          PopupMenu = pmMain
          ShowHint = True
          TabOrder = 0
          OnKeyDown = GoNextKeyDown
          BandFont.Charset = DEFAULT_CHARSET
          BandFont.Color = clBlack
          BandFont.Height = -11
          BandFont.Name = 'Tahoma'
          BandFont.Style = [fsBold]
          DataSource = srcDetail
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
          LangManager = dmData.Lng
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
          object colPosType: TdxDBGridImageColumn
            Alignment = taRightJustify
            DisableDragging = True
            MinWidth = 16
            Sizing = False
            Width = 25
            BandIndex = 0
            RowIndex = 0
            FieldName = 'postype'
            OnGetText = colPosTypeGetText
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
            FieldName = 'rsv'
            OnGetText = colStatusGetText
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
          object colMatName: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            MaxLength = 300
            MinWidth = 100
            Width = 293
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
            MinWidth = 80
            Visible = False
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'artikul'
          end
          object colBarCode: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            Visible = False
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'barcode'
          end
          object colAmount: TdxDBGridColumn
            Tag = 1
            Alignment = taRightJustify
            HeaderAlignment = taCenter
            MaxLength = 90
            MinWidth = 60
            Width = 91
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
            Sizing = False
            Width = 43
            BandIndex = 0
            RowIndex = 0
            FieldName = 'MSRNAME'
          end
          object colNDSRate: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            Visible = False
            Width = 73
            BandIndex = 0
            RowIndex = 0
            FieldName = 'nds'
          end
          object colOnValue: TdxDBGridColumn
            Tag = 1
            Alignment = taRightJustify
            HeaderAlignment = taCenter
            MinWidth = 50
            Visible = False
            Width = 119
            BandIndex = 0
            RowIndex = 0
            FieldName = 'onvalue'
          end
          object colWHouseName: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            MaxLength = 100
            MinWidth = 100
            Visible = False
            Width = 142
            BandIndex = 0
            RowIndex = 0
            FieldName = 'WHNAME'
          end
          object colSerial: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            MinWidth = 100
            Visible = False
            Width = 142
            BandIndex = 0
            RowIndex = 0
            FieldName = 'sn'
          end
          object colProducer: TdxDBGridColumn
            HeaderAlignment = taCenter
            Visible = False
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'producer'
          end
          object colPriceWONDS: TdxDBGridColumn
            Tag = 1
            Alignment = taRightJustify
            HeaderAlignment = taCenter
            MinWidth = 50
            Visible = False
            Width = 95
            BandIndex = 0
            RowIndex = 0
            FieldName = 'pricedefwonds'
          end
          object colPosId: TdxDBGridColumn
            Alignment = taCenter
            Visible = False
            Width = 37
            BandIndex = 0
            RowIndex = 0
            FieldName = 'posid'
          end
          object colMatId: TdxDBGridColumn
            Visible = False
            Width = 37
            BandIndex = 0
            RowIndex = 0
            FieldName = 'matid'
          end
          object colWId: TdxDBGridColumn
            Visible = False
            Width = 28
            BandIndex = 0
            RowIndex = 0
            FieldName = 'wid'
          end
          object colNDS: TdxDBGridColumn
            Tag = 1
            Alignment = taRightJustify
            HeaderAlignment = taCenter
            MinWidth = 50
            Visible = False
            Width = 84
            BandIndex = 0
            RowIndex = 0
            FieldName = 'summnds'
          end
        end
      end
      object tsOrdered: TcxTabSheet
        Caption = 'tsOrdered'
        ImageIndex = 1
        object grdOrdered: TssDBGrid
          Left = 0
          Top = 0
          Width = 454
          Height = 194
          Hint = #1044#1072#1090#1072
          DrawDragFrame = False
          Bands = <
            item
              Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            end>
          DefaultLayout = False
          HeaderPanelRowCount = 1
          KeyField = 'POSID'
          SummaryGroups = <>
          SummarySeparator = ', '
          Align = alClient
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          DataSource = srcView
          Filter.Criteria = {00000000}
          FixedBandLineColor = clBtnFace
          GridLineColor = 12174536
          GroupPanelColor = clBtnFace
          GroupNodeColor = 14804712
          HideFocusRect = True
          LookAndFeel = lfUltraFlat
          OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
          OptionsCustomize = [edgoBandSizing, edgoColumnMoving, edgoColumnSizing]
          OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
          LangManager = dmData.Lng
          object colID: TdxDBGridColumn
            Visible = False
            Width = 55
            BandIndex = 0
            RowIndex = 0
            FieldName = 'POSID'
          end
          object colDocType: TdxDBGridImageColumn
            Alignment = taCenter
            Caption = '*'
            HeaderAlignment = taCenter
            MinWidth = 16
            Sizing = False
            Visible = False
            Width = 25
            BandIndex = 0
            RowIndex = 0
            FieldName = 'WTYPE'
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
              '163'
              '164'
              '165'
              '166'
              '167'
              '168'
              '169'
              '170'
              '171'
              '172'
              '173'
              '174'
              '175'
              '176'
              '177'
              '178'
              '179'
              '180'
              '181'
              '182'
              '183'
              '184'
              '185'
              '186'
              '187'
              '188'
              '189'
              '190'
              '191'
              '192'
              '193'
              '194'
              '195'
              '196'
              '197'
              '198'
              '199'
              '200'
              '201'
              '202'
              '203'
              '204')
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
              '-1'
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              '4'
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              '-5'
              ''
              '6'
              '-6'
              ''
              ''
              ''
              ''
              '5'
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              '16'
              '-16'
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              '1016'
              '-1016')
          end
          object colType: TdxDBGridColumn
            Alignment = taCenter
            Sizing = False
            Visible = False
            Width = 30
            BandIndex = 0
            RowIndex = 0
          end
          object colChecked: TdxDBGridImageColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            MinWidth = 16
            Sizing = False
            Visible = False
            Width = 30
            BandIndex = 0
            RowIndex = 0
            FieldName = 'checked'
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
              '163'
              '164'
              '165'
              '166'
              '167'
              '168'
              '169'
              '170'
              '171'
              '172'
              '173'
              '174'
              '175'
              '176'
              '177'
              '178'
              '179'
              '180'
              '181'
              '182'
              '183'
              '184'
              '185'
              '186'
              '187'
              '188'
              '189'
              '190'
              '191'
              '192'
              '193'
              '194'
              '195'
              '196'
              '197'
              '198'
              '199'
              '200'
              '201'
              '202'
              '203'
              '204')
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
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
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
          object colNum: TdxDBGridColumn
            Tag = 1
            Alignment = taRightJustify
            Caption = #1053#1086#1084#1077#1088
            HeaderAlignment = taCenter
            TabStop = False
            Width = 81
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NUM'
          end
          object colOnDate: TdxDBGridColumn
            Tag = 1
            Alignment = taCenter
            Caption = #1044#1072#1090#1072
            HeaderAlignment = taCenter
            Width = 80
            BandIndex = 0
            RowIndex = 0
            FieldName = 'ONDATE'
          end
          object colKAgent: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            Visible = False
            Width = 196
            BandIndex = 0
            RowIndex = 0
            FieldName = 'kaname'
          end
          object colOMatName: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            Sorted = csUp
            Width = 209
            BandIndex = 0
            RowIndex = 0
            FieldName = 'matname'
          end
          object colOArtikul: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            Visible = False
            Width = 104
            BandIndex = 0
            RowIndex = 0
            FieldName = 'artikul'
          end
          object colOAmount: TdxDBGridColumn
            Tag = 1
            Caption = #1050#1086#1083'-'#1074#1086
            HeaderAlignment = taCenter
            Width = 86
            BandIndex = 0
            RowIndex = 0
            FieldName = 'AMOUNT'
          end
          object colMeasure: TdxDBGridColumn
            Tag = 1
            Alignment = taCenter
            HeaderAlignment = taCenter
            Width = 51
            BandIndex = 0
            RowIndex = 0
            FieldName = 'measure'
          end
          object colPrice: TdxDBGridColumn
            Tag = 1
            Alignment = taRightJustify
            Caption = #1042' '#1091#1095#1105#1090'. '#1074#1072#1083#1102#1090#1077
            HeaderAlignment = taCenter
            Visible = False
            Width = 78
            BandIndex = 0
            RowIndex = 0
            FieldName = 'PRICE'
          end
          object colCurrency: TdxDBGridColumn
            Tag = 1
            Caption = #1042#1072#1083#1102#1090#1072
            HeaderAlignment = taCenter
            Visible = False
            Width = 55
            BandIndex = 0
            RowIndex = 0
            FieldName = 'SHORTNAME'
          end
          object colRate: TdxDBGridColumn
            Tag = 1
            Caption = #1050#1091#1088#1089
            HeaderAlignment = taCenter
            Visible = False
            Width = 58
            BandIndex = 0
            RowIndex = 0
            FieldName = 'ONVALUE'
          end
          object colNPrice: TdxDBGridColumn
            Tag = 1
            Alignment = taRightJustify
            Caption = #1042' '#1085#1072#1094'. '#1074#1072#1083#1102#1090#1077
            Visible = False
            Width = 90
            BandIndex = 0
            RowIndex = 0
          end
          object colNCurrency: TdxDBGridColumn
            Tag = 1
            Caption = #1042#1072#1083#1102#1090#1072
            HeaderAlignment = taCenter
            Visible = False
            Width = 45
            BandIndex = 0
            RowIndex = 0
          end
          object colWHouse: TdxDBGridColumn
            Tag = 1
            Caption = #1057#1082#1083#1072#1076
            HeaderAlignment = taCenter
            Visible = False
            Width = 239
            BandIndex = 0
            RowIndex = 0
            FieldName = 'WHNAME'
          end
          object colOWID: TdxDBGridColumn
            Visible = False
            Width = 115
            BandIndex = 0
            RowIndex = 0
            FieldName = 'WID'
          end
        end
      end
    end
    object chbAddToTmpOrder: TcxCheckBox
      Left = 123
      Top = 239
      Width = 300
      Height = 27
      AutoSize = False
      Enabled = False
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102' '#1074' '#1079#1072#1103#1074#1082#1091' '#1085#1072' '#1087#1086#1089#1090#1072#1074#1082#1091
      Style.BorderColor = clBtnShadow
      Style.BorderStyle = ebsUltraFlat
      Style.Shadow = False
      Style.StyleController = dmData.scMain
      TabOrder = 9
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 661
    object lMatEx: TLabel [0]
      Left = 44
      Top = 5
      Width = 6
      Height = 16
      AutoSize = False
      Caption = ' '
      Transparent = True
      OnMouseDown = panTitleBarMouseDown
    end
    inherited panTitleButtons: TssPanel
      Left = 603
    end
  end
  inherited panButtons: TPanel
    Top = 573
    Width = 661
    inherited btnOK: TxButton
      Left = 346
      Top = 7
    end
    inherited btnCancel: TxButton
      Left = 450
      Top = 7
    end
    inherited btnApply: TxButton
      Left = 555
      Top = 7
    end
  end
  inherited panToolBar: TPanel
    Width = 661
    inherited btnLock: TssSpeedButton
      Left = 572
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 599
    end
    inherited btnHelp: TssSpeedButton
      Left = 625
    end
    object btnInfo: TssSpeedButton
      Left = 5
      Top = 1
      Action = aMatInfo
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 99
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnMove: TssSpeedButton
      Left = 32
      Top = 1
      Action = aMatMove
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 61
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnRsv: TssSpeedButton
      Left = 59
      Top = 1
      Action = aMatRsv
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 100
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
  end
  inherited ilTitleBar: TImageList
    Left = 76
    Top = 340
  end
  inherited FormStorage: TssFormStorage
    StoredProps.Strings = (
      'aHide.Checked'
      'chbRsv.Checked'
      'chbAddToTmpOrder.Checked')
    Left = 20
    Top = 340
  end
  inherited ActionList: TActionList
    Images = dmData.Images
    Left = 48
    Top = 340
    object aHide: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1090#1077#1082#1091#1097#1080#1077' '#1079#1072#1082#1072#1079#1099' '#1087#1086' '#1090#1086#1074#1072#1088#1091
      ShortCut = 113
    end
    object aMatRsv: TAction
      Caption = 'aMatRsv'
      ImageIndex = 100
      ShortCut = 16466
      OnExecute = aMatRsvExecute
    end
    object aMatMove: TAction
      Caption = 'aMatMove'
      ImageIndex = 61
      ShortCut = 16461
      OnExecute = aMatMoveExecute
    end
    object aMatInfo: TAction
      Caption = 'aMtInfo'
      ImageIndex = 99
      ShortCut = 16457
      OnExecute = aMatInfoExecute
    end
    object aDelPos: TAction
      Caption = 'aDelPos'
      ImageIndex = 5
      ShortCut = 16430
      OnExecute = aDelPosExecute
    end
    object aAddTmpOrder: TAction
      Caption = 'aAddTmpOrder'
      ImageIndex = 189
      OnExecute = aAddTmpOrderExecute
    end
  end
  object srcOrdered: TDataSource
    DataSet = cdsOrdered
    Left = 280
    Top = 309
  end
  object cdsOrdered: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'matid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'kaid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ondate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'getempty'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wh'
        ParamType = ptUnknown
      end>
    ProviderName = 'pWMat_Get_Ordered'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsOrderedBeforeOpen
    Macros = <>
    Left = 320
    Top = 309
    object cdsOrderedPOSID: TIntegerField
      FieldName = 'POSID'
    end
    object cdsOrderedREMAIN: TFloatField
      FieldName = 'REMAIN'
    end
    object cdsOrderedORDERED: TFloatField
      FieldName = 'ORDERED'
    end
    object cdsOrderedRSV: TFloatField
      FieldName = 'RSV'
    end
    object cdsOrderedWID: TIntegerField
      FieldName = 'WID'
    end
    object cdsOrderedNAME: TStringField
      FieldName = 'NAME'
      Size = 128
    end
    object cdsOrderedONDATE: TDateTimeField
      FieldName = 'ONDATE'
    end
    object cdsOrderedTODATE: TDateTimeField
      FieldName = 'TODATE'
    end
    object cdsOrderedPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object cdsOrderedCURRID: TIntegerField
      FieldName = 'CURRID'
    end
    object cdsOrderedSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 10
    end
    object cdsOrderedONVALUE: TFloatField
      FieldName = 'ONVALUE'
    end
    object cdsOrderedWTYPE: TIntegerField
      FieldName = 'WTYPE'
    end
    object cdsOrderedDOCNUM: TStringField
      FieldName = 'DOCNUM'
    end
    object cdsOrderedWBILLID: TIntegerField
      FieldName = 'WBILLID'
    end
    object cdsOrderedDOCID: TIntegerField
      FieldName = 'DOCID'
    end
    object cdsOrderedkaname: TStringField
      FieldName = 'kaname'
      Size = 255
    end
    object cdsOrderedreserved: TFloatField
      FieldKind = fkCalculated
      FieldName = 'reserved'
      Calculated = True
    end
    object cdsOrderednotes: TStringField
      FieldName = 'notes'
      Size = 255
    end
    object cdsOrderedcertnum: TStringField
      FieldName = 'certnum'
      Size = 64
    end
    object cdsOrderedposdate: TDateTimeField
      FieldName = 'posdate'
    end
  end
  object pmMain: TTBPopupMenu
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 226
    Top = 309
    object TBItem1: TTBItem
      Action = aDelPos
    end
  end
  object srcPosition: TDataSource
    DataSet = mdPosition
    Left = 152
    Top = 307
  end
  object mdPosition: TssMemoryData
    FieldDefs = <
      item
        Name = 'matid'
        DataType = ftInteger
      end
      item
        Name = 'wid'
        DataType = ftInteger
      end
      item
        Name = 'posid'
        DataType = ftInteger
      end
      item
        Name = 'amount'
        DataType = ftFloat
      end
      item
        Name = 'ondate'
        DataType = ftDateTime
      end
      item
        Name = 'price'
        DataType = ftCurrency
      end
      item
        Name = 'currid'
        DataType = ftInteger
      end
      item
        Name = 'onvalue'
        DataType = ftFloat
      end
      item
        Name = 'NDS'
        DataType = ftFloat
      end
      item
        Name = 'Discount'
        DataType = ftFloat
      end>
    OnCalcFields = mdPositionCalcFields
    Left = 180
    Top = 307
    object mdPositionmatid: TIntegerField
      FieldName = 'matid'
    end
    object mdPositionwid: TIntegerField
      FieldName = 'wid'
    end
    object mdPositionposid: TIntegerField
      FieldName = 'posid'
    end
    object mdPositionamount: TFloatField
      FieldName = 'amount'
    end
    object mdPositionondate: TDateTimeField
      FieldName = 'ondate'
    end
    object mdPositioncurrid: TIntegerField
      FieldName = 'currid'
    end
    object mdPositiononvalue: TFloatField
      FieldName = 'onvalue'
    end
    object mdPositionNDS: TFloatField
      FieldName = 'NDS'
    end
    object mdPositionDiscount: TFloatField
      FieldName = 'Discount'
    end
    object mdPositioncurrname: TStringField
      FieldName = 'currname'
    end
    object mdPositiondocnum: TStringField
      FieldName = 'docnum'
    end
    object mdPositiondocdate: TDateTimeField
      FieldName = 'docdate'
    end
    object mdPositiondocnumtxt: TStringField
      FieldKind = fkCalculated
      FieldName = 'docnumtxt'
      Size = 128
      Calculated = True
    end
    object mdPositionwhname: TStringField
      FieldName = 'whname'
      Size = 64
    end
    object mdPositionprice: TFloatField
      FieldName = 'price'
    end
    object mdPositionpricetxt: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'pricetxt'
      Calculated = True
    end
    object mdPositionSN: TStringField
      FieldName = 'SN'
      Size = 64
    end
    object mdPositionwtype: TIntegerField
      FieldName = 'wtype'
    end
    object mdPositionwbillid: TIntegerField
      FieldName = 'wbillid'
    end
    object mdPositiongtd: TStringField
      DisplayWidth = 64
      FieldName = 'gtd'
      Size = 64
    end
    object mdPositionproducer: TStringField
      FieldName = 'producer'
      Size = 255
    end
    object mdPositioncertnum: TStringField
      FieldName = 'certnum'
      Size = 64
    end
    object mdPositioncertdate: TDateTimeField
      FieldName = 'certdate'
    end
    object mdPositionpostype: TIntegerField
      FieldName = 'postype'
    end
  end
  object dsmdRsv: TDataSource
    DataSet = mdRsv
    Left = 476
    Top = 402
  end
  object mdRsv: TssMemoryData
    FieldDefs = <
      item
        Name = 'matid'
        DataType = ftInteger
      end
      item
        Name = 'wid'
        DataType = ftInteger
      end
      item
        Name = 'posid'
        DataType = ftInteger
      end
      item
        Name = 'amount'
        DataType = ftFloat
      end
      item
        Name = 'ondate'
        DataType = ftDateTime
      end
      item
        Name = 'price'
        DataType = ftCurrency
      end
      item
        Name = 'currid'
        DataType = ftInteger
      end
      item
        Name = 'onvalue'
        DataType = ftFloat
      end
      item
        Name = 'NDS'
        DataType = ftFloat
      end
      item
        Name = 'Discount'
        DataType = ftFloat
      end>
    Left = 448
    Top = 402
    object IntegerField3: TIntegerField
      FieldName = 'posid'
    end
    object FloatField1: TFloatField
      FieldName = 'amount'
    end
    object mdRsvpricein: TFloatField
      FieldName = 'pricein'
    end
    object mdRsvSN: TStringField
      FieldName = 'SN'
      Size = 64
    end
    object mdRsvpostype: TIntegerField
      FieldName = 'postype'
    end
  end
  object cdsDetail: TssClientDataSet
    Aggregates = <
      item
        Active = True
        Expression = 'min(msrname)'
        Visible = False
      end
      item
        Active = True
        Expression = 'max(msrname)'
        Visible = False
      end
      item
        Active = True
        Expression = 'sum(amount)'
        Visible = False
      end>
    AggregatesActive = True
    Params = <
      item
        DataType = ftUnknown
        Name = 'WBILLID'
        ParamType = ptInput
      end>
    ProviderName = 'pWaybillDet_GetOutEx'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsDetailBeforeOpen
    Macros = <>
    Left = 152
    Top = 350
    object cdsDetailPOSID: TIntegerField
      FieldName = 'POSID'
      ReadOnly = True
    end
    object cdsDetailWBILLID: TIntegerField
      FieldName = 'WBILLID'
      ReadOnly = True
    end
    object cdsDetailMATID: TIntegerField
      FieldName = 'MATID'
      ReadOnly = True
    end
    object cdsDetailMATNAME: TStringField
      FieldName = 'MATNAME'
      ReadOnly = True
      Size = 128
    end
    object cdsDetailMSRNAME: TStringField
      FieldName = 'MSRNAME'
      ReadOnly = True
      Size = 6
    end
    object cdsDetailWID: TIntegerField
      FieldName = 'WID'
      ReadOnly = True
    end
    object cdsDetailWHNAME: TStringField
      FieldName = 'WHNAME'
      ReadOnly = True
      Size = 64
    end
    object cdsDetailAMOUNT: TFloatField
      FieldName = 'AMOUNT'
      ReadOnly = True
    end
    object cdsDetailPRICE: TFloatField
      FieldName = 'PRICE'
      ReadOnly = True
    end
    object cdsDetailrecno: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'recno'
      Calculated = True
    end
    object cdsDetailsummdef2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'summdef2'
      Calculated = True
    end
    object cdsDetailpricedef: TFloatField
      FieldKind = fkCalculated
      FieldName = 'pricedef'
      Calculated = True
    end
    object cdsDetailARTIKUL: TStringField
      FieldName = 'ARTIKUL'
      Size = 80
    end
    object cdsDetailNDS: TFloatField
      FieldName = 'NDS'
    end
    object cdsDetailONVALUE: TFloatField
      FieldName = 'ONVALUE'
      Required = True
    end
    object cdsDetailBARCODE: TStringField
      DisplayWidth = 128
      FieldName = 'BARCODE'
      Size = 128
    end
    object cdsDetailrsv: TIntegerField
      FieldName = 'rsv'
    end
    object cdsDetailPOSTYPE: TIntegerField
      FieldName = 'POSTYPE'
    end
    object cdsDetailGRPID: TIntegerField
      FieldName = 'GRPID'
    end
  end
  object srcDetail: TDataSource
    DataSet = cdsDetail
    Left = 180
    Top = 350
  end
  object cdsView: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'fromdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'todate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'matid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'kaid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wtype'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'checked'
        ParamType = ptUnknown
      end>
    ProviderName = 'pOrders_GetInfo'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsViewBeforeOpen
    Macros = <>
    Left = 152
    Top = 378
  end
  object srcView: TDataSource
    DataSet = cdsView
    Left = 180
    Top = 378
  end
end
