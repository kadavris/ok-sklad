inherited frmDocsList: TfrmDocsList
  Left = 283
  Top = 200
  Width = 770
  Height = 421
  ActiveControl = dbgListDet
  Caption = 'frmDocsList'
  Constraints.MinHeight = 300
  Constraints.MinWidth = 770
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  object lAmount: TssLabel [0]
    Left = 442
    Top = -178
    Width = 82
    Height = 16
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    Caption = #1042#1089#1077#1075#1086' '#1090#1086#1074#1072#1088#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    DisabledDraw = ddUser
    DisabledColor = clBtnShadow
  end
  object txtAmount: TssBevel [1]
    Left = 543
    Top = -180
    Width = 130
    Height = 20
    Alignments.Horz = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = '999999,999 '#1096#1090'.'
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
  object lTotal: TssLabel [2]
    Left = 693
    Top = -178
    Width = 57
    Height = 16
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = #1085#1072' '#1089#1091#1084#1084#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    DisabledDraw = ddUser
    DisabledColor = clBtnShadow
  end
  object txtTotal: TssBevel [3]
    Left = 758
    Top = -180
    Width = 11
    Height = 20
    Alignments.Horz = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = '44444454,99 UAH'
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
  inherited panTitleBar: TssGradientPanel
    Width = 762
    inherited panTitleButtons: TssPanel
      Left = 703
    end
  end
  object panButtons: TPanel [5]
    Left = 0
    Top = 348
    Width = 762
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      762
      43)
    object btnOK: TxButton
      Left = 557
      Top = 10
      Width = 92
      Height = 27
      Action = aOK
      Anchors = [akRight, akBottom]
      ColorInner = clBtnShadow
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      TabOrder = 0
    end
    object btnCancel: TxButton
      Left = 654
      Top = 10
      Width = 99
      Height = 27
      Action = aCancel
      Anchors = [akRight, akBottom]
      ColorInner = clBtnShadow
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      OnKeyDown = GoNextKeyDown
      TabOrder = 1
    end
  end
  object PanTopBtn: TPanel [6]
    Left = 0
    Top = 21
    Width = 762
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      762
      28)
    object btnPrintAll: TssSpeedButton
      Left = 4
      Top = 1
      Width = 22
      Height = 22
      Action = aPrintAll
      Alignment = taCenter
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
    object btnPrintDoc: TssSpeedButton
      Left = 31
      Top = 1
      Width = 22
      Height = 22
      Action = aPrinDoc
      Alignment = taCenter
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 68
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnLock: TssSpeedButton
      Left = 712
      Top = 3
      Width = 22
      Height = 22
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 90
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnLockClick
    end
    object btnHelp: TssSpeedButton
      Left = 688
      Top = 3
      Width = 22
      Height = 22
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 10
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnHelpClick
    end
    object btnColExp: TssSpeedButton
      Left = 58
      Top = 1
      Width = 22
      Height = 22
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtChecked
      Checked = True
      GroupIndex = 0
      ImageIndex = 25
      Images = dmData.Images18x18
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnColExpClick
    end
    object btnErrMess: TssSpeedButton
      Left = 736
      Top = 3
      Width = 22
      Height = 22
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      DisabledImages = dmData.Images18x18dis
      GroupIndex = 0
      ImageIndex = 36
      Images = dmData.Images18x18
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnErrMessClick
    end
  end
  object dbgListDet: TdxDBTreeList [7]
    Left = 4
    Top = 49
    Width = 754
    Height = 304
    DrawDragFrame = False
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'docid'
    ParentField = 'pwbid'
    TabOrder = 3
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dlDocsList
    GridLineColor = clBtnFace
    Images = dmData.Images
    LookAndFeel = lfUltraFlat
    OptionsBehavior = [etoAutoDragDrop, etoAutoDragDropCopy, etoDragExpand, etoDragScroll, etoEnterShowEditor, etoImmediateEditor, etoTabThrough]
    OptionsCustomize = [etoColumnSizing]
    OptionsDB = [etoAutoCalcKeyValue, etoCancelOnExit, etoCanNavigation, etoCheckHasChildren, etoLoadAllRecords]
    OptionsView = [etoAutoWidth, etoBandHeaderWidth, etoRowSelect, etoUseBitmap, etoUseImageIndexForSelected]
    ShowGrid = True
    TreeLineColor = clGrayText
    OnGetImageIndex = dbgListDetGetImageIndex
    OnGetSelectedIndex = dbgListDetGetImageIndex
    object colName: TdxDBTreeListColumn
      Caption = 'Name'
      HeaderAlignment = taCenter
      MinWidth = 150
      Sizing = False
      Width = 410
      BandIndex = 0
      RowIndex = 0
      OnGetText = colNameGetText
    end
    object colWBILLID: TdxDBTreeListColumn
      HeaderAlignment = taCenter
      MinWidth = 52
      Sizing = False
      Visible = False
      Width = 52
      BandIndex = 0
      RowIndex = 0
      FieldName = 'docid'
      OnGetText = colWBILLIDGetText
    end
    object colAmount: TdxDBTreeListColumn
      HeaderAlignment = taCenter
      MinWidth = 80
      Sizing = False
      Width = 113
      BandIndex = 0
      RowIndex = 0
      FieldName = 'amount'
    end
    object colCheked: TdxDBTreeListImageColumn
      Alignment = taLeftJustify
      HeaderAlignment = taCenter
      MinWidth = 30
      Sizing = False
      Width = 34
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
        '116')
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
        '0')
    end
    object colWType: TdxDBTreeListColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'WTYPE'
    end
    object colNum: TdxDBTreeListColumn
      Alignment = taRightJustify
      HeaderAlignment = taCenter
      Sizing = False
      Width = 71
      BandIndex = 0
      RowIndex = 0
      FieldName = 'num'
    end
    object colONDATE: TdxDBTreeListColumn
      Alignment = taCenter
      HeaderAlignment = taCenter
      Sizing = False
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ONDATE'
    end
    object colPosNum: TdxDBTreeListColumn
      Visible = False
      Width = 58
      BandIndex = 0
      RowIndex = 0
      FieldName = 'posnum'
    end
    object colMatName: TdxDBTreeListColumn
      Visible = False
      Width = 44
      BandIndex = 0
      RowIndex = 0
      FieldName = 'name'
    end
  end
  object panFooter: TPanel [8]
    Left = 4
    Top = 405
    Width = 765
    Height = 36
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 4
    DesignSize = (
      765
      36)
    object ssBevel3: TssBevel
      Left = 0
      Top = 0
      Width = 765
      Height = 36
      Align = alClient
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
    object lDocCount: TssLabel
      Left = 389
      Top = 9
      Width = 109
      Height = 16
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = #1042#1089#1077#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074':'
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object txtDocCount: TssBevel
      Left = 514
      Top = 7
      Width = 144
      Height = 20
      Alignments.Horz = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = '999999,999 '#1096#1090'.'
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
    object lPosCount: TssLabel
      Left = 675
      Top = 9
      Width = 89
      Height = 16
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = #1042#1089#1077#1075#1086' '#1087#1086#1079#1080#1094#1080#1081':'
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object txtPosCount: TssBevel
      Left = -2
      Top = 7
      Width = 144
      Height = 20
      Alignments.Horz = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = '44444454,99 UAH'
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
  end
  inherited ilTitleBar: TImageList
    Left = 264
    Top = 105
  end
  object ActionList: TActionList
    Images = dmData.Images
    OnUpdate = ActionListUpdate
    Left = 169
    Top = 105
    object aApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      Visible = False
      OnExecute = aApplyExecute
    end
    object aOK: TAction
      Caption = 'OK'
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aPrinDoc: TAction
      Caption = 'aPrinDoc'
      ImageIndex = 68
      OnExecute = aPrinDocExecute
    end
    object aPrintAll: TAction
      Caption = 'aPrintAll'
      ImageIndex = 9
      OnExecute = aPrintAllExecute
    end
  end
  object mdDocsList: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 200
    Top = 105
  end
  object dlDocsList: TDataSource
    DataSet = mdDocsList
    Left = 233
    Top = 105
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 122
    Top = 154
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = mdReport
    Left = 154
    Top = 154
  end
  object mdReport: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 186
    Top = 155
  end
  object dsReport: TDataSource
    DataSet = mdReport
    OnDataChange = dsReportDataChange
    Left = 219
    Top = 155
  end
  object mdRepDet: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 254
    Top = 155
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = mdRepDet
    Left = 254
    Top = 183
  end
end
