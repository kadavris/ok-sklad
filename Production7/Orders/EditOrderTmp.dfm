inherited frmEditOrderTmp: TfrmEditOrderTmp
  Left = 539
  Top = 282
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmEditOrderTmp'
  ClientHeight = 518
  ClientWidth = 576
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 576
    Height = 437
    object bvlMain: TssBevel
      Left = 5
      Top = 4
      Width = 564
      Height = 414
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
      Top = 91
      Width = 563
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
      Top = 111
      Width = 73
      Height = 16
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
      Transparent = True
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object stMeasureName: TssBevel
      Left = 252
      Top = 107
      Width = 51
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
    object lNotes: TLabel
      Left = 16
      Top = 145
      Width = 72
      Height = 16
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnHide: TssSpeedButton
      Left = 251
      Top = 191
      Width = 307
      Height = 28
      Action = aHide
      Alignment = taCenter
      AllwaysShowFrame = True
      ButtonType = ssbtChecked
      Checked = False
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1090#1077#1082#1091#1097#1080#1077' '#1079#1072#1082#1072#1079#1099' '#1087#1086' '#1090#1086#1074#1072#1088#1091' (F2)'
      GroupIndex = 0
      ImageIndex = -1
      LeftMargin = 3
      Offset = 0
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsCaptionOnly
    end
    object edMat: TokMatSearchEdit
      Left = 16
      Top = 17
      Width = 542
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
      TabOrder = 0
      OnChange = edMatChange
      OnRefButtonClick = edMatRefButtonClick
      AllowZeroRest = True
      LoadNDS = True
      LoadTaxes = True
      ScannerImageIndex = 50
      DesignSize = (
        542
        31)
    end
    object lcbWH: TokWHouseSearchEdit
      Left = 16
      Top = 48
      Width = 485
      Height = 31
      ButtonsLeftMargin = 3
      CapRef = 'Warehouses Directory'
      EditorOffset = 71
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
      TabOrder = 1
      OnChange = lcbWHChange
      OnKeyDown = GoNextKeyDown
      ViewMode = vmList
      DesignSize = (
        485
        31)
    end
    object edAmount: TssCalcEdit
      Left = 128
      Top = 106
      Width = 123
      Height = 24
      EditValue = 0.000000000000000000
      ImeName = 'Russian'
      ParentFont = False
      Properties.OnChange = edAmountPropertiesChange
      Style.StyleController = dmData.scMain
      TabOrder = 2
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
      CalcColor = clBtnFace
      DecimalPlaces = 4
    end
    object edNotes: TcxMemo
      Left = 128
      Top = 139
      Width = 431
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      ImeName = 'Russian'
      ParentFont = False
      Properties.MaxLength = 255
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      TabOrder = 4
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
    object grdOrdered: TssDBGrid
      Left = 14
      Top = 229
      Width = 544
      Height = 178
      Hint = 'ORDERED'
      TabStop = False
      DrawDragFrame = False
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'posid'
      SummaryGroups = <>
      SummarySeparator = ', '
      ParentShowHint = False
      PopupMenu = pmMain
      ShowHint = True
      TabOrder = 3
      OnDblClick = grdOrderedDblClick
      DataSource = srcOrdered
      Filter.Criteria = {00000000}
      LookAndFeel = lfUltraFlat
      OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
      OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
      OnCustomDrawCell = grdOrderedCustomDrawCell
      Anchors = [akLeft, akTop, akRight]
      LangManager = dmData.Lng
      object colTmpImg: TdxDBGridImageColumn
        Alignment = taLeftJustify
        MinWidth = 16
        Sizing = False
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
          '203')
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
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          '16')
      end
      object colDocNum: TdxDBGridColumn
        Width = 61
        BandIndex = 0
        RowIndex = 0
        FieldName = 'DOCNUM'
        OnGetText = colDocNumGetText
      end
      object colKAName: TdxDBGridColumn
        HeaderAlignment = taCenter
        Width = 145
        BandIndex = 0
        RowIndex = 0
        FieldName = 'kaname'
      end
      object colTmpAmount: TdxDBGridColumn
        Tag = 1
        Alignment = taRightJustify
        HeaderAlignment = taCenter
        Width = 66
        BandIndex = 0
        RowIndex = 0
        FieldName = 'ORDERED'
        OnGetText = colTmpAmountGetText
      end
      object colRsv: TdxDBGridColumn
        Caption = #1056#1077#1079#1077#1088#1074
        HeaderAlignment = taCenter
        Width = 63
        BandIndex = 0
        RowIndex = 0
        FieldName = 'RSV'
        OnGetText = colRsvGetText
      end
      object colToDate: TdxDBGridColumn
        Alignment = taCenter
        Caption = #1054#1078#1080#1076#1072#1077#1090#1089#1103
        HeaderAlignment = taCenter
        Width = 80
        BandIndex = 0
        RowIndex = 0
        FieldName = 'TODATE'
      end
      object colTmpNotes: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        Width = 97
        BandIndex = 0
        RowIndex = 0
      end
      object colTmpPosID: TdxDBGridColumn
        Visible = False
        Width = 30
        BandIndex = 0
        RowIndex = 0
        FieldName = 'posid'
      end
      object colWBillID: TdxDBGridColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'WBILLID'
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 576
    object lTitle: TLabel [0]
      Left = 5
      Top = 5
      Width = 25
      Height = 16
      Caption = 'Test'
      Transparent = True
      OnMouseDown = panTitleBarMouseDown
    end
    object lMatEx: TLabel [1]
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
      Left = 517
      Width = 57
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
    Top = 484
    Width = 576
    Height = 34
    inherited btnOK: TxButton
      Left = 261
      Top = 7
    end
    inherited btnCancel: TxButton
      Left = 366
      Top = 7
      Width = 97
    end
    inherited btnApply: TxButton
      Left = 470
      Top = 7
      Width = 99
    end
  end
  inherited panToolBar: TPanel
    Width = 576
    inherited btnLock: TssSpeedButton
      Left = 485
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 513
    end
    inherited btnHelp: TssSpeedButton
      Left = 540
    end
    object btnInfo: TssSpeedButton
      Left = 5
      Top = 1
      Action = aInfo
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      DisabledImages = dmData.Images
      DisabledImageIndex = 204
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
    Left = 68
    Top = 204
  end
  inherited FormStorage: TssFormStorage
    StoredProps.Strings = (
      'aHide.Checked'
      'btnHide.Checked')
    Left = 36
    Top = 264
  end
  inherited ActionList: TActionList
    Images = dmData.Images
    Top = 204
    object aHide: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1090#1077#1082#1091#1097#1080#1077' '#1079#1072#1082#1072#1079#1099' '#1087#1086' '#1090#1086#1074#1072#1088#1091
      ShortCut = 113
      OnExecute = aHideExecute
    end
    object aInfo: TAction
      Caption = 'aInfo'
      ImageIndex = 117
      OnExecute = aInfoExecute
    end
  end
  object srcOrdered: TDataSource
    DataSet = cdsOrdered
    Left = 284
    Top = 273
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
    Left = 312
    Top = 273
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
    Left = 234
    Top = 277
    object TBItem4: TTBItem
      Action = aInfo
    end
  end
end
