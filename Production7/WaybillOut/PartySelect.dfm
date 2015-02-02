inherited frmPartySelect: TfrmPartySelect
  Left = 508
  Top = 184
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmPartySelect'
  ClientHeight = 542
  ClientWidth = 848
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Top = 22
    Width = 848
    Height = 485
    object dbgSN: TssDBTreeList
      Left = 0
      Top = 30
      Width = 848
      Height = 455
      Hint = 'price'
      DrawDragFrame = False
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'posid'
      ParentField = 'pid'
      Align = alClient
      ParentShowHint = False
      PopupMenu = pmGrd
      ShowHint = True
      TabOrder = 0
      OnDblClick = dbgSNDblClick
      OnKeyDown = dbgSNKeyDown
      OnKeyPress = GoNext
      CustomizingRowCount = 6
      DataSource = dsSN
      DblClkExpanding = False
      GridLineColor = clBtnFace
      HideFocusRect = True
      LookAndFeel = lfUltraFlat
      OptionsView = [etoBandHeaderWidth, etoHideFocusRect, etoUseBitmap, etoUseImageIndexForSelected]
      ShowGrid = True
      ShowLines = False
      ShowRoot = False
      TreeLineColor = clGrayText
      OnChangeNode = dbgSNChangeNode
      OnColumnSorting = dbgSNColumnSorting
      OnCustomDrawCell = dbgSNCustomDrawCell
      OnEdited = dbgSNEdited
      OnEditing = dbgSNEditing
      LangManager = dmData.Lng
      OnNeedAdjust = dbgSNNeedAdjust
      OnGetOptionsTitle = dbgSNGetOptionsTitle
      object colChk: TdxDBGridCheckColumn
        Caption = '*'
        HeaderAlignment = taCenter
        MinWidth = 50
        Sizing = False
        Sorted = csUp
        Width = 50
        BandIndex = 0
        RowIndex = 0
        OnCustomDrawCell = colChkCustomDrawCell
        FieldName = 'checked'
        OnGetText = colChkGetText
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnToggleClick = colChkToggleClick
      end
      object colNum: TdxDBGridMaskColumn
        Caption = #8470
        DisableDragging = True
        DisableEditor = True
        HeaderAlignment = taCenter
        Sizing = False
        Visible = False
        Width = 40
        BandIndex = 0
        RowIndex = 0
        FieldName = 'Num'
      end
      object colImg: TdxDBGridImageColumn
        Alignment = taLeftJustify
        DisableEditor = True
        MinWidth = 16
        Width = 31
        BandIndex = 0
        RowIndex = 0
        FieldName = 'wtype'
        OnGetText = colImgGetText
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
          '16')
      end
      object colDocNum: TdxDBGridColumn
        Tag = 1
        DisableEditor = True
        HeaderAlignment = taCenter
        MaxLength = 150
        MinWidth = 150
        ReadOnly = True
        Width = 160
        BandIndex = 0
        RowIndex = 0
        FieldName = 'docnumtxt'
        OnGetText = colDocNumGetText
      end
      object colPosID: TdxDBGridColumn
        DisableEditor = True
        HeaderAlignment = taCenter
        Sizing = False
        Visible = False
        Width = 55
        BandIndex = 0
        RowIndex = 0
        FieldName = 'posid'
      end
      object colondate: TdxDBGridColumn
        Alignment = taCenter
        DisableEditor = True
        HeaderAlignment = taCenter
        ReadOnly = True
        Sizing = False
        Visible = False
        Width = 60
        BandIndex = 0
        RowIndex = 0
        FieldName = 'ondate'
      end
      object colAmount: TdxDBGridColumn
        Tag = 1
        DisableEditor = True
        HeaderAlignment = taCenter
        Width = 50
        BandIndex = 0
        RowIndex = 0
        FieldName = 'amount'
        OnGetText = colAmountGetText
      end
      object colAsel: TdxDBGridCalcColumn
        Tag = 1
        HeaderAlignment = taCenter
        Width = 65
        BandIndex = 0
        RowIndex = 0
        FieldName = 'asel'
        OnGetText = colAselGetText
        ButtonStyle = bsFlat
        Precision = 15
      end
      object colPrice: TdxDBGridColumn
        Tag = 1
        DisableEditor = True
        HeaderAlignment = taCenter
        Width = 100
        BandIndex = 0
        RowIndex = 0
        FieldName = 'price'
        OnGetText = colPriceGetText
      end
      object colSN: TdxDBGridMaskColumn
        Tag = 1
        Alignment = taRightJustify
        DisableDragging = True
        DisableEditor = True
        HeaderAlignment = taCenter
        Width = 223
        BandIndex = 0
        RowIndex = 0
        FieldName = 'SN'
      end
      object colCurrName: TdxDBGridColumn
        Visible = False
        Width = 62
        BandIndex = 0
        RowIndex = 0
        FieldName = 'currname'
      end
      object colGTD: TdxDBGridColumn
        Tag = 1
        DisableEditor = True
        HeaderAlignment = taCenter
        Visible = False
        Width = 96
        BandIndex = 0
        RowIndex = 0
        FieldName = 'gtd'
      end
      object colCertNum: TdxDBGridColumn
        Tag = 1
        DisableEditor = True
        HeaderAlignment = taCenter
        Visible = False
        Width = 96
        BandIndex = 0
        RowIndex = 0
        FieldName = 'certnum'
      end
      object colCertDate: TdxDBGridColumn
        Tag = 1
        Alignment = taCenter
        DisableEditor = True
        HeaderAlignment = taCenter
        Visible = False
        Width = 77
        BandIndex = 0
        RowIndex = 0
        FieldName = 'certdate'
      end
      object colProducer: TdxDBGridColumn
        Tag = 1
        DisableEditor = True
        HeaderAlignment = taCenter
        Visible = False
        Width = 96
        BandIndex = 0
        RowIndex = 0
        FieldName = 'producer'
      end
      object colWBillID: TdxDBTreeListColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'wbillid'
      end
    end
    object panBar: TPanel
      Left = 0
      Top = 0
      Width = 848
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        848
        30)
      object bvlBarTop: TssBevel
        Left = 0
        Top = 0
        Width = 848
        Height = 30
        Align = alTop
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = False
        Visible = False
      end
      object btnDirUp: TssSpeedButton
        Left = 299
        Top = 4
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        Enabled = False
        GroupIndex = 0
        ImageIndex = 10
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object btnView: TssSpeedButton
        Left = 329
        Top = 4
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        Enabled = False
        GroupIndex = 0
        ImageIndex = 11
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object btnFind: TssSpeedButton
        Left = 521
        Top = 4
        Action = aFind
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        GroupIndex = 0
        ImageIndex = 18
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object btnFindParams: TssSpeedButton
        Left = 550
        Top = 4
        Action = aFindProps
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        GroupIndex = 0
        ImageIndex = 19
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object btnHelp1: TssSpeedButton
        Left = 810
        Top = 4
        Action = aHelp
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        ImageIndex = 10
        Images = dmData.Images
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object btnNew: TssSpeedButton
        Left = 4
        Top = 4
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        Enabled = False
        GroupIndex = 0
        ImageIndex = 0
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object btnProps: TssSpeedButton
        Left = 63
        Top = 4
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        Enabled = False
        GroupIndex = 0
        ImageIndex = 1
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object btnRefresh: TssSpeedButton
        Left = 122
        Top = 4
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        Enabled = False
        GroupIndex = 0
        ImageIndex = 3
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object btnDel: TssSpeedButton
        Left = 92
        Top = 4
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        Enabled = False
        GroupIndex = 0
        ImageIndex = 2
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object btnCheck: TssSpeedButton
        Left = 151
        Top = 4
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        Enabled = False
        GroupIndex = 0
        ImageIndex = 21
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object sepDyn: TBevel
        Left = 186
        Top = 6
        Width = 1
        Height = 27
        Shape = bsLeftLine
      end
      object btnDyn: TssSpeedButton
        Left = 191
        Top = 4
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtChecked
        Checked = False
        DisabledImages = dmData.Images18x18dis
        Enabled = False
        GroupIndex = 0
        ImageIndex = 9
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object sepPrint: TBevel
        Left = 226
        Top = 6
        Width = 2
        Height = 27
        Shape = bsLeftLine
      end
      object btnPrint: TssSpeedButton
        Left = 231
        Top = 4
        Action = aPrint
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        GroupIndex = 0
        ImageIndex = 6
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object btnExcel: TssSpeedButton
        Left = 261
        Top = 4
        Action = aExcel
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        GroupIndex = 0
        ImageIndex = 20
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object btnPatternNew: TssSpeedButton
        Left = 33
        Top = 4
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        Enabled = False
        GroupIndex = 0
        ImageIndex = 27
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object btnReconnect: TssSpeedButton
        Left = 716
        Top = 4
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        ImageIndex = 30
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        Visible = False
      end
      object btnLock1: TssSpeedButton
        Left = 747
        Top = 4
        Action = aLock
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        GroupIndex = 0
        ImageIndex = 90
        Images = dmData.Images
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object txtLang2: TssLabel
        Left = 376
        Top = 12
        Width = 15
        Height = 16
        Alignment = taRightJustify
        Caption = 'EN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object btnErrMess: TssSpeedButton
        Left = 779
        Top = 4
        Action = aSendErrMessage
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        GroupIndex = 0
        ImageIndex = 129
        Images = dmData.Images
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object Bevel1: TBevel
        Left = 295
        Top = 6
        Width = 2
        Height = 27
        Shape = bsLeftLine
      end
      object Bevel2: TBevel
        Left = 363
        Top = 6
        Width = 1
        Height = 27
        Shape = bsLeftLine
      end
      object Bevel3: TBevel
        Left = 585
        Top = 6
        Width = 1
        Height = 27
        Shape = bsLeftLine
      end
      object edFind: TcxTextEdit
        Left = 393
        Top = 6
        Width = 125
        Height = 24
        ParentFont = False
        Properties.OnChange = edFindPropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 0
        ImeName = 'Russian'
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 848
    TabOrder = 3
    inherited panTitleButtons: TssPanel
      Left = 790
    end
  end
  inherited panButtons: TPanel
    Top = 507
    Width = 848
    inherited btnOK: TxButton
      Left = 639
    end
    inherited btnCancel: TxButton
      Left = 743
    end
    inherited btnApply: TxButton
      Left = 470
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 848
    Height = 1
    TabOrder = 2
    inherited btnLock: TssSpeedButton
      Left = 676
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 704
    end
    inherited btnHelp: TssSpeedButton
      Left = 732
    end
  end
  inherited ilTitleBar: TImageList
    Left = 168
    Top = 116
  end
  inherited FormStorage: TssFormStorage
    StoredProps.Strings = (
      'aFindBegin.Checked'
      'aFindByDoc.Checked'
      'aFindBySN.Checked'
      'aFindConcurr.Checked'
      'aFindSubstr.Checked'
      'aContextFind.Checked')
  end
  inherited ActionList: TActionList
    Images = dmData.Images18x18
    Left = 120
    Top = 116
    inherited aApply: TAction
      Enabled = False
    end
    object aSelAll: TAction
      Caption = 'aSelAll'
      ShortCut = 16449
      OnExecute = aSelAllExecute
    end
    object aFind: TAction
      Category = 'find'
      Caption = 'aFind'
      ImageIndex = 18
      ShortCut = 8205
      OnExecute = aFindExecute
    end
    object aFindProps: TAction
      Category = 'find'
      Caption = 'aFindProps'
      ImageIndex = 19
      OnExecute = aFindPropsExecute
    end
    object aFindBegin: TAction
      Category = 'find'
      AutoCheck = True
      Caption = 'aFindBegin'
      Checked = True
      GroupIndex = 2
      OnExecute = aFindBeginExecute
    end
    object aFindConcurr: TAction
      Category = 'find'
      AutoCheck = True
      Caption = 'aFindConcurr'
      GroupIndex = 2
      OnExecute = aFindConcurrExecute
    end
    object aFindSubstr: TAction
      Category = 'find'
      AutoCheck = True
      Caption = 'aFindSubstr'
      GroupIndex = 2
      OnExecute = aFindSubstrExecute
    end
    object aContextFind: TAction
      Category = 'find'
      AutoCheck = True
      Caption = 'aContextFind'
      Checked = True
      OnExecute = aContextFindExecute
    end
    object aFindByDoc: TAction
      Category = 'find'
      AutoCheck = True
      Caption = 'aFindByDoc'
      GroupIndex = 1
      OnExecute = aFindByDocExecute
    end
    object aFindBySN: TAction
      Category = 'find'
      AutoCheck = True
      Caption = 'aFindBySN'
      Checked = True
      GroupIndex = 1
      OnExecute = aFindBySNExecute
    end
    object aShowGrdOptions: TAction
      Category = 'find'
      Caption = 'aShowGrdOptions'
      OnExecute = aShowGrdOptionsExecute
    end
    object aExcel: TAction
      Caption = 'aExcel'
      ImageIndex = 20
      OnExecute = aExcelExecute
    end
    object aPrint: TAction
      Caption = 'aPrint'
      ImageIndex = 6
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
  end
  object mdSN: TssMemoryData
    AfterScroll = mdSNAfterScroll
    BeforeScroll = mdSNBeforeScroll
    FieldDefs = <>
    Left = 278
    Top = 96
    object mdSNposid: TIntegerField
      FieldName = 'posid'
    end
    object mdSNNum: TIntegerField
      FieldName = 'Num'
    end
    object mdSNwbillid: TIntegerField
      FieldName = 'wbillid'
    end
    object mdSNwtype: TIntegerField
      FieldName = 'wtype'
    end
    object mdSNSN: TStringField
      FieldName = 'SN'
      Size = 64
    end
    object mdSNchecked: TBooleanField
      FieldName = 'checked'
    end
    object mdSNondate: TDateField
      FieldName = 'ondate'
    end
    object mdSNamount: TFloatField
      FieldName = 'amount'
    end
    object mdSNasel: TFloatField
      FieldName = 'asel'
    end
    object mdSNdocnumtxt: TStringField
      FieldName = 'docnumtxt'
      Size = 64
    end
    object mdSNprice: TFloatField
      FieldName = 'price'
    end
    object mdSNcurrname: TStringField
      FieldName = 'currname'
      Size = 10
    end
    object mdSNproducer: TStringField
      FieldName = 'producer'
      Size = 255
    end
    object mdSNgtd: TStringField
      FieldName = 'gtd'
      Size = 64
    end
    object mdSNcertnum: TStringField
      FieldName = 'certnum'
      Size = 64
    end
    object mdSNcertdate: TDateTimeField
      FieldName = 'certdate'
    end
    object mdSNsourceid: TIntegerField
      FieldName = 'sourceid'
    end
    object mdSNpid: TIntegerField
      FieldName = 'pid'
    end
  end
  object dsSN: TDataSource
    DataSet = mdSN
    Left = 306
    Top = 96
  end
  object pmGrd: TTBPopupMenu
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 56
    Top = 116
    object TBItem1: TTBItem
      Action = aSelAll
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem5: TTBItem
      Action = aPrint
      Images = dmData.Images18x18
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem4: TTBItem
      Action = aShowGrdOptions
    end
  end
  object pmFind: TTBPopupMenu
    Left = 436
    Top = 103
    object TBItem3: TTBItem
      Action = aFindByDoc
    end
    object TBItem2: TTBItem
      Action = aFindBySN
    end
    object mnuFindParamsSep: TTBSeparatorItem
    end
    object mnuFindBegin: TTBItem
      Action = aFindBegin
      GroupIndex = 2
    end
    object mnuFindConcurr: TTBItem
      Action = aFindConcurr
      GroupIndex = 2
    end
    object mnuFindSubstr: TTBItem
      Action = aFindSubstr
      GroupIndex = 2
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem11: TTBItem
      Action = aContextFind
    end
  end
  object frDBDSMaster: TfrDBDataSet
    DataSource = dsSN
    Left = 306
    Top = 140
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    OnBeforePrint = frReport1BeforePrint
    Left = 278
    Top = 140
    ReportForm = {19000000}
  end
end
