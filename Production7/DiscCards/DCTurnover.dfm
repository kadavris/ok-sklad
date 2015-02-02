inherited frmDCTurnover: TfrmDCTurnover
  Left = 230
  Top = 202
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmDCTurnover'
  ClientHeight = 665
  ClientWidth = 932
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 932
    Height = 583
    BevelInner = bvSpace
    BevelOuter = bvLowered
    DesignSize = (
      932
      583)
    object ssBevel3: TssBevel
      Left = 4
      Top = 512
      Width = 923
      Height = 36
      Anchors = [akLeft, akBottom]
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
    object ssBevel4: TssBevel
      Left = 4
      Top = 2
      Width = 923
      Height = 39
      Anchors = [akLeft, akTop, akRight]
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
    object lFromDate: TLabel
      Left = 12
      Top = 11
      Width = 8
      Height = 16
      Alignment = taRightJustify
      Caption = #1057
    end
    object lToDate: TLabel
      Left = 199
      Top = 11
      Width = 15
      Height = 16
      Alignment = taRightJustify
      Caption = #1055#1086
    end
    object txtTotalSumm: TssBevel
      Left = 734
      Top = 549
      Width = 184
      Height = 22
      Alignments.Horz = taRightJustify
      Anchors = [akLeft, akBottom]
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
      WordBreak = False
    end
    object lTotalSumm: TssLabel
      Left = 672
      Top = 554
      Width = 57
      Height = 16
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = #1085#1072' '#1089#1091#1084#1084#1091':'
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object lTotalPos: TssLabel
      Left = 426
      Top = 554
      Width = 87
      Height = 16
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = #1042#1089#1077#1075#1086' '#1087#1086#1082#1091#1087#1086#1082':'
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object txtTotalPos: TssBevel
      Left = 517
      Top = 549
      Width = 139
      Height = 22
      Alignments.Horz = taRightJustify
      Anchors = [akLeft, akBottom]
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
      WordBreak = False
    end
    object edFromDate: TcxDateEdit
      Left = 57
      Top = 7
      Width = 98
      Height = 24
      BeepOnEnter = False
      ImeName = 'Russian'
      ParentFont = False
      Properties.ReadOnly = False
      Properties.OnChange = edFromDatePropertiesChange
      Properties.OnEditValueChanged = edFromDatePropertiesEditValueChanged
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.StyleController = dmData.scMain
      TabOrder = 0
      OnKeyPress = edFromDateKeyPress
    end
    object edToDate: TcxDateEdit
      Left = 239
      Top = 7
      Width = 98
      Height = 24
      BeepOnEnter = False
      ImeName = 'Russian'
      ParentFont = False
      Properties.ReadOnly = False
      Properties.OnChange = edFromDatePropertiesChange
      Properties.OnEditValueChanged = edFromDatePropertiesEditValueChanged
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.StyleController = dmData.scMain
      TabOrder = 1
      OnKeyPress = edFromDateKeyPress
    end
    object tlMain: TssDBTreeList
      Left = 6
      Top = 48
      Width = 921
      Height = 457
      Hint = #1057#1091#1084#1084#1072
      DrawDragFrame = False
      Bands = <
        item
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        end
        item
          Caption = #1058#1086#1074#1072#1088
        end>
      DefaultLayout = False
      HeaderPanelRowCount = 1
      KeyField = 'posid'
      ParentField = 'pid'
      ParentShowHint = False
      PopupMenu = pmMain
      ShowHint = True
      TabOrder = 2
      Anchors = [akLeft, akTop, akRight, akBottom]
      OnDblClick = tlMainDblClick
      DataSource = srcView
      GridLineColor = clBtnFace
      LookAndFeel = lfUltraFlat
      OptionsBehavior = [etoAutoDragDrop, etoAutoDragDropCopy, etoAutoSort, etoDragExpand, etoEnterShowEditor, etoImmediateEditor, etoTabThrough]
      OptionsView = [etoBandHeaderWidth, etoHideFocusRect, etoRowSelect, etoUseBitmap, etoUseImageIndexForSelected]
      ShowBands = True
      ShowGrid = True
      TreeLineColor = clBtnFace
      OnCustomDrawCell = tlMainCustomDrawCell
      object colPosID: TdxDBTreeListColumn
        HeaderAlignment = taCenter
        Visible = False
        Width = 88
        BandIndex = 0
        RowIndex = 0
        FieldName = 'posid'
      end
      object colDocType: TdxDBTreeListImageColumn
        Alignment = taLeftJustify
        HeaderAlignment = taCenter
        MinWidth = 16
        Sizing = False
        Width = 50
        BandIndex = 0
        RowIndex = 0
        FieldName = 'wtype'
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
          '187')
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
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          '6')
      end
      object colNum: TdxDBTreeListColumn
        Tag = 1
        Caption = #1053#1086#1084#1077#1088
        HeaderAlignment = taCenter
        Width = 76
        BandIndex = 0
        RowIndex = 0
        FieldName = 'num'
      end
      object colOnDate: TdxDBTreeListColumn
        Tag = 1
        Alignment = taCenter
        Caption = #1044#1072#1090#1072
        HeaderAlignment = taCenter
        Width = 113
        BandIndex = 0
        RowIndex = 0
        FieldName = 'ondate'
      end
      object colKAName: TdxDBTreeListColumn
        Tag = 1
        Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
        HeaderAlignment = taCenter
        Visible = False
        Width = 157
        BandIndex = 0
        RowIndex = 0
        FieldName = 'kaname'
      end
      object colMatName: TdxDBTreeListColumn
        Tag = 1
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        HeaderAlignment = taCenter
        Width = 145
        BandIndex = 1
        RowIndex = 0
        FieldName = 'matname'
      end
      object colArtikul: TdxDBTreeListColumn
        Tag = 1
        Caption = #1040#1088#1090#1080#1082#1091#1083
        HeaderAlignment = taCenter
        Visible = False
        Width = 141
        BandIndex = 1
        RowIndex = 0
        FieldName = 'artikul'
      end
      object colBarCode: TdxDBTreeListColumn
        Tag = 1
        Caption = #1064#1090#1088#1080#1093'-'#1082#1086#1076
        HeaderAlignment = taCenter
        Visible = False
        Width = 72
        BandIndex = 0
        RowIndex = 0
        FieldName = 'barcode'
      end
      object colAmount: TdxDBTreeListColumn
        Tag = 1
        Alignment = taRightJustify
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        HeaderAlignment = taCenter
        Width = 70
        BandIndex = 1
        RowIndex = 0
        FieldName = 'amount'
      end
      object colMsr: TdxDBTreeListColumn
        Tag = 1
        Alignment = taCenter
        Caption = #1045#1076'. '#1080#1079#1084'.'
        HeaderAlignment = taCenter
        Width = 42
        BandIndex = 1
        RowIndex = 0
        FieldName = 'msrname'
      end
      object colPrice: TdxDBTreeListColumn
        Tag = 1
        Alignment = taRightJustify
        Caption = #1062#1077#1085#1072' '#1074' '#1091#1095'. '#1074#1072#1083#1102#1090#1077
        HeaderAlignment = taCenter
        Width = 67
        BandIndex = 1
        RowIndex = 0
        FieldName = 'price'
        OnGetText = colPriceGetText
      end
      object colCurr: TdxDBTreeListColumn
        Caption = #1042#1072#1083#1102#1090#1072
        HeaderAlignment = taCenter
        Width = 50
        BandIndex = 1
        RowIndex = 0
        FieldName = 'shortname'
      end
      object colOnValue: TdxDBTreeListColumn
        Tag = 1
        Caption = #1050#1091#1088#1089
        HeaderAlignment = taCenter
        Visible = False
        Width = 47
        BandIndex = 1
        RowIndex = 0
        FieldName = 'onvalue'
      end
      object colNPrice: TdxDBTreeListColumn
        Tag = 1
        Alignment = taRightJustify
        Caption = #1062#1077#1085#1072', RUR'
        HeaderAlignment = taCenter
        Visible = False
        Width = 67
        BandIndex = 1
        RowIndex = 0
        OnGetText = colNPriceGetText
      end
      object colDiscount: TdxDBTreeListColumn
        Tag = 1
        Alignment = taRightJustify
        HeaderAlignment = taCenter
        Width = 62
        BandIndex = 1
        RowIndex = 0
        FieldName = 'discount'
        OnGetText = colDiscountGetText
      end
      object colTotal: TdxDBTreeListColumn
        Tag = 1
        Alignment = taRightJustify
        Caption = #1057#1091#1084#1084#1072
        HeaderAlignment = taCenter
        Width = 70
        BandIndex = 1
        RowIndex = 0
        OnCustomDrawCell = colTotalCustomDrawCell
        FieldName = 'total'
        OnGetText = colTotalGetText
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 932
    TabOrder = 3
    inherited panTitleButtons: TssPanel
      Left = 874
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
    Top = 630
    Width = 932
    inherited btnOK: TxButton
      Left = 725
      Top = 6
      Anchors = [akTop]
    end
    inherited btnCancel: TxButton
      Left = 828
      Top = 6
    end
    inherited btnApply: TxButton
      Left = 308
      Top = 6
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 932
    TabOrder = 2
    inherited btnLock: TssSpeedButton
      Left = 842
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 870
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    inherited btnHelp: TssSpeedButton
      Left = 898
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    object btnPrintDoc: TssSpeedButton
      Left = 32
      Top = 1
      Hint = #1044#1086#1082#1091#1084#1077#1085#1090
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090
      GroupIndex = 0
      ImageIndex = 68
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnPrintDocClick
    end
    object btnPrint: TssSpeedButton
      Left = 4
      Top = 1
      Action = aPrintMain
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
    Left = 120
    Top = 155
  end
  inherited FormStorage: TssFormStorage
    Top = 115
  end
  inherited ActionList: TActionList
    Left = 148
    Top = 155
    object aPrint: TAction [5]
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
      ImageIndex = 9
      OnExecute = aPrintExecute
    end
    object aPrintMain: TAction [6]
      Caption = #1054#1090#1095#1105#1090' '#1086' '#1076#1074#1080#1078#1077#1085#1080#1080' '#1090#1086#1074#1072#1088#1072
      Hint = #1054#1090#1095#1105#1090' '#1086' '#1076#1074#1080#1078#1077#1085#1080#1080' '#1090#1086#1074#1072#1088#1072
      ImageIndex = 9
      OnExecute = aPrintMainExecute
    end
    object aPrintDoc: TAction [7]
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090
      OnExecute = aPrintDocExecute
    end
  end
  object cdsView: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'cardid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fromdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'todate'
        ParamType = ptUnknown
      end>
    ProviderName = 'pDC_Turnover'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsViewBeforeOpen
    AfterOpen = cdsViewAfterOpen
    Macros = <>
    Left = 44
    Top = 155
  end
  object srcView: TDataSource
    DataSet = cdsView
    Left = 72
    Top = 155
  end
  object pmMain: TTBPopupMenu
    Images = dmData.Images
    Left = 232
    Top = 156
    object TBItem2: TTBItem
      Action = aPrintMain
      Images = dmData.Images
    end
    object TBItem1: TTBItem
      Action = aPrintDoc
      ImageIndex = 9
      Images = dmData.Images
    end
  end
end
