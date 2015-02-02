inherited frmKAOutParty: TfrmKAOutParty
  Left = 436
  Top = 238
  Width = 786
  Height = 438
  Caption = 'frmKAOutParty'
  Constraints.MinHeight = 200
  Constraints.MinWidth = 700
  OnCloseQuery = FormCloseQuery
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 778
    Height = 326
    DesignSize = (
      778
      326)
    object ssBevel4: TssBevel
      Left = 0
      Top = 0
      Width = 778
      Height = 38
      Align = alTop
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = True
      ImageIndex = 0
      UseGradient = False
    end
    object lFromDate: TLabel
      Left = 52
      Top = 12
      Width = 8
      Height = 16
      Alignment = taRightJustify
      Caption = #1057
    end
    object lToDate: TLabel
      Left = 223
      Top = 11
      Width = 15
      Height = 16
      Alignment = taRightJustify
      Caption = #1055#1086
    end
    object lMaterial: TLabel
      Left = 476
      Top = 11
      Width = 36
      Height = 16
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1058#1086#1074#1072#1088
    end
    object btnMat: TssSpeedButton
      Left = 1
      Top = 6
      Height = 26
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 22
      Images = dmData.Images18x18
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnMatClick
    end
    object edFromDate: TcxDateEdit
      Left = 66
      Top = 6
      Width = 99
      Height = 24
      BeepOnEnter = False
      ImeName = 'Russian'
      ParentFont = False
      Properties.ReadOnly = False
      Properties.OnChange = edFromDatePropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.StyleController = dmData.scMain
      TabOrder = 0
      OnKeyPress = GoNext
    end
    object edToDate: TcxDateEdit
      Left = 239
      Top = 6
      Width = 98
      Height = 24
      BeepOnEnter = False
      ImeName = 'Russian'
      ParentFont = False
      Properties.ReadOnly = False
      Properties.OnChange = edFromDatePropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.StyleController = dmData.scMain
      TabOrder = 1
      OnKeyPress = GoNext
    end
    object lcbMaterial: TssDBLookupCombo
      Left = 519
      Top = 6
      Width = 250
      Height = 24
      Anchors = [akTop, akRight]
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.OnChange = lcbMaterialPropertiesChange
      Properties.OnEditValueChanged = lcbMaterialPropertiesEditValueChanged
      Properties.OnInitPopup = lcbMaterialPropertiesInitPopup
      Style.StyleController = dmData.scMain
      TabOrder = 2
      OnKeyPress = GoNext
      EmptyValue = 0
      KeyField = 'matid'
      ListField = 'name'
      ListSource = dsMaterial
    end
    object panGrid: TPanel
      Left = 0
      Top = 38
      Width = 778
      Height = 288
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      object grdMain: TssDBGrid
        Left = 2
        Top = 2
        Width = 774
        Height = 284
        DrawDragFrame = False
        Bands = <
          item
            Caption = #1058#1086#1074#1072#1088
          end
          item
            Caption = #1056#1072#1089#1093#1086#1076#1085#1072#1103' '#1087#1072#1088#1090#1080#1103
          end
          item
            Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
            Visible = False
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'sourceid'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        PopupMenu = pmMain
        ShowHint = True
        TabOrder = 0
        OnDblClick = grdMainDblClick
        OnKeyDown = grdMainKeyDown
        OnMouseMove = grdMainMouseMove
        BandFont.Charset = DEFAULT_CHARSET
        BandFont.Color = clWindowText
        BandFont.Height = -13
        BandFont.Name = 'Tahoma'
        BandFont.Style = []
        DataSource = dsPartys
        Filter.Criteria = {00000000}
        FixedBandLineColor = clBtnFace
        GroupPanelColor = clBtnFace
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -13
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        LookAndFeel = lfUltraFlat
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterThrough, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
        OptionsCustomize = [edgoBandSizing, edgoColumnSizing]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        PreviewFont.Charset = DEFAULT_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -16
        PreviewFont.Name = 'Tahoma'
        PreviewFont.Style = [fsBold]
        ShowBands = True
        OnColumnSorting = grdMainColumnSorting
        LangManager = dmData.Lng
        OnGetOptionsTitle = grdMainGetOptionsTitle
        object colDocImgOut: TdxDBGridImageColumn
          Alignment = taLeftJustify
          HeaderAlignment = taCenter
          MinWidth = 16
          Width = 23
          BandIndex = 1
          RowIndex = 0
          FieldName = 'wtypeout'
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
            '158')
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
            '2'
            ''
            ''
            ''
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
            '5')
        end
        object colDocNumOut: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Width = 76
          BandIndex = 1
          RowIndex = 0
          FieldName = 'docnumout'
        end
        object colOutDate: TdxDBGridColumn
          HeaderAlignment = taCenter
          Width = 58
          BandIndex = 1
          RowIndex = 0
          FieldName = 'ondateout'
        end
        object colMatImg: TdxDBGridImageColumn
          Alignment = taLeftJustify
          HeaderAlignment = taCenter
          MinWidth = 16
          Width = 38
          BandIndex = 0
          RowIndex = 0
          FieldName = 'matimg'
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
            '158')
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
            '1')
        end
        object colMatName: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Sorted = csDown
          Width = 286
          BandIndex = 0
          RowIndex = 0
          FieldName = 'matname'
        end
        object colAmount: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Width = 76
          BandIndex = 1
          RowIndex = 0
          FieldName = 'amount'
        end
        object colmsrname: TdxDBGridColumn
          Tag = 1
          Alignment = taCenter
          HeaderAlignment = taCenter
          Width = 37
          BandIndex = 0
          RowIndex = 0
          FieldName = 'msrname'
        end
        object colDocImgIn: TdxDBGridImageColumn
          Alignment = taLeftJustify
          HeaderAlignment = taCenter
          MinWidth = 16
          Width = 24
          BandIndex = 2
          RowIndex = 0
          FieldName = 'wtypein'
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
            '158')
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
            '2'
            ''
            ''
            ''
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
            ''
            ''
            ''
            ''
            ''
            ''
            '5')
        end
        object colDocNumIn: TdxDBGridColumn
          HeaderAlignment = taCenter
          Width = 80
          BandIndex = 2
          RowIndex = 0
          FieldName = 'docnumin'
        end
        object colInDate: TdxDBGridColumn
          HeaderAlignment = taCenter
          Width = 110
          BandIndex = 2
          RowIndex = 0
          FieldName = 'ondatein'
        end
        object colPriceOut: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Width = 81
          BandIndex = 1
          RowIndex = 0
          FieldName = 'priceout'
        end
        object colCurrName: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Width = 39
          BandIndex = 1
          RowIndex = 0
          FieldName = 'currnameout'
        end
        object colSN: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 96
          BandIndex = 0
          RowIndex = 0
          FieldName = 'sn'
        end
        object colPosID: TdxDBGridColumn
          Visible = False
          Width = 72
          BandIndex = 0
          RowIndex = 0
          FieldName = 'posid'
        end
        object colSourceID: TdxDBGridColumn
          Visible = False
          Width = 72
          BandIndex = 0
          RowIndex = 0
          FieldName = 'sourceid'
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 778
    inherited panTitleButtons: TssPanel
      Left = 720
      inherited btnTBMinimize: TssSpeedButton
        Height = 16
      end
      inherited btnTBMaximize: TssSpeedButton
        Height = 16
      end
      inherited btnTBClose: TssSpeedButton
        Height = 16
      end
    end
  end
  inherited panButtons: TPanel
    Top = 373
    Width = 778
    inherited btnOK: TxButton
      Left = 567
      Top = 6
    end
    inherited btnCancel: TxButton
      Left = 672
      Top = 6
    end
    inherited btnApply: TxButton
      Left = 1
      Top = 9
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 778
    inherited btnLock: TssSpeedButton
      Left = 753
      Width = 22
      Height = 22
      LeftMargin = 2
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 729
      Width = 22
      Height = 22
      LeftMargin = 2
    end
    inherited btnHelp: TssSpeedButton
      Left = 705
      Width = 22
      Height = 22
      LeftMargin = 2
    end
    object btnPrintDoc: TssSpeedButton
      Left = 4
      Top = 1
      Width = 22
      Height = 22
      Hint = #1044#1086#1082#1091#1084#1077#1085#1090
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090
      GroupIndex = 0
      ImageIndex = 68
      Images = dmData.Images
      LeftMargin = 3
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnPrintDocClick
    end
  end
  inherited ilTitleBar: TImageList
    Left = 120
    Top = 156
  end
  inherited ActionList: TActionList
    Left = 172
    Top = 156
    object aPrintDoc: TAction [5]
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090
      ShortCut = 16464
      OnExecute = aPrintDocExecute
    end
    object aSetGridOptions: TAction
      Caption = 'aSetGridOptions'
      OnExecute = aSetGridOptionsExecute
    end
  end
  object dsPartys: TDataSource
    DataSet = mdPartys
    Left = 133
    Top = 259
  end
  object fdsView: TfrDBDataSet
    DataSource = dsPartys
    Left = 83
    Top = 209
  end
  object pmMain: TTBPopupMenu
    Images = dmData.Images
    Left = 272
    Top = 157
    object TBItem1: TTBItem
      Action = aPrintDoc
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem2: TTBItem
      Action = aSetGridOptions
    end
  end
  object mdPartys: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 133
    Top = 209
    object mdPartysmatimg: TIntegerField
      FieldName = 'matimg'
    end
    object mdPartysmatid: TIntegerField
      FieldName = 'matid'
    end
    object mdPartysmatname: TStringField
      FieldName = 'matname'
      Size = 128
    end
    object mdPartysamount: TFloatField
      FieldName = 'amount'
    end
    object mdPartysmsrname: TStringField
      FieldName = 'msrname'
      Size = 6
    end
    object mdPartyswidout: TIntegerField
      FieldName = 'widout'
    end
    object mdPartyswhnameout: TStringField
      FieldName = 'whnameout'
      Size = 64
    end
    object mdPartysdocnumout: TStringField
      FieldName = 'docnumout'
    end
    object mdPartysondateout: TDateTimeField
      FieldName = 'ondateout'
    end
    object mdPartyspriceout: TFloatField
      FieldName = 'priceout'
    end
    object mdPartyscurrid: TIntegerField
      FieldName = 'currid'
    end
    object mdPartyscurrnameout: TStringField
      FieldName = 'currnameout'
      Size = 3
    end
    object mdPartysrateout: TFloatField
      FieldName = 'rateout'
    end
    object mdPartysndsout: TFloatField
      FieldName = 'ndsout'
    end
    object mdPartysdiscountout: TFloatField
      FieldName = 'discountout'
    end
    object mdPartyssourceid: TIntegerField
      FieldName = 'sourceid'
    end
    object mdPartysposid: TIntegerField
      FieldName = 'posid'
    end
    object mdPartysdocnumin: TStringField
      FieldName = 'docnumin'
    end
    object mdPartysondatein: TDateTimeField
      FieldName = 'ondatein'
    end
    object mdPartyspricein: TFloatField
      FieldName = 'pricein'
    end
    object mdPartyscurridin: TIntegerField
      FieldName = 'curridin'
    end
    object mdPartyscurnamein: TStringField
      FieldName = 'curnamein'
      Size = 3
    end
    object mdPartysratein: TFloatField
      FieldName = 'ratein'
    end
    object mdPartysndsin: TFloatField
      FieldName = 'ndsin'
    end
    object mdPartyswtypeout: TIntegerField
      FieldName = 'wtypeout'
    end
    object mdPartyswtypein: TIntegerField
      FieldName = 'wtypein'
    end
    object mdPartyswbidout: TIntegerField
      FieldName = 'wbidout'
    end
    object mdPartyswbidin: TIntegerField
      FieldName = 'wbidin'
    end
    object mdPartyssn: TStringField
      FieldName = 'sn'
      Size = 64
    end
  end
  object cdsMaterial: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pRetMatList_Filtr'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 472
    Top = 320
  end
  object dsMaterial: TDataSource
    DataSet = cdsMaterial
    Left = 528
    Top = 320
  end
end
