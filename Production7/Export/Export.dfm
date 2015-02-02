object frmExport: TfrmExport
  Left = 315
  Top = 108
  BorderStyle = bsDialog
  Caption = 'frmExport'
  ClientHeight = 424
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    408
    424)
  PixelsPerInch = 96
  TextHeight = 16
  object btnLock: TssSpeedButton
    Left = 334
    Top = 1
    Width = 23
    Height = 23
    Alignment = taLeftJustify
    AllwaysShowFrame = False
    Anchors = [akTop, akRight]
    ButtonType = ssbtStandard
    Checked = False
    GroupIndex = 0
    ImageIndex = 90
    Images = dmData.Images
    LeftMargin = 4
    ParentShowHint = False
    ShowHint = True
    Style = ssbsUser
    ViewStyle = ssvsGlyphOnly
    OnClick = btnLockClick
  end
  object btnHelp: TssSpeedButton
    Left = 380
    Top = 1
    Width = 23
    Height = 23
    Alignment = taLeftJustify
    AllwaysShowFrame = False
    Anchors = [akTop, akRight]
    ButtonType = ssbtStandard
    Checked = False
    GroupIndex = 0
    ImageIndex = 10
    Images = dmData.Images
    LeftMargin = 3
    ParentShowHint = False
    ShowHint = True
    Style = ssbsUser
    ViewStyle = ssvsGlyphOnly
    OnClick = btnHelpClick
  end
  object btnSendErrMessage: TssSpeedButton
    Left = 357
    Top = 1
    Width = 23
    Height = 23
    Alignment = taLeftJustify
    AllwaysShowFrame = False
    Anchors = [akTop, akRight]
    ButtonType = ssbtStandard
    Checked = False
    GroupIndex = 0
    ImageIndex = 129
    Images = dmData.Images
    LeftMargin = 4
    ParentShowHint = False
    ShowHint = True
    Style = ssbsUser
    ViewStyle = ssvsGlyphOnly
    OnClick = btnSendErrMessageClick
  end
  object panButtons: TPanel
    Left = 0
    Top = 389
    Width = 408
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      408
      35)
    object btnOK: TxButton
      Left = 239
      Top = 9
      Width = 80
      Height = 22
      Action = aOK
      Anchors = [akRight, akBottom]
      ColorInner = clBtnShadow
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      TabOrder = 0
    end
    object btnCancel: TxButton
      Left = 324
      Top = 9
      Width = 80
      Height = 22
      Action = aCancel
      Anchors = [akRight, akBottom]
      ColorInner = clBtnShadow
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      TabOrder = 1
    end
  end
  object panMain: TPanel
    Left = 4
    Top = 28
    Width = 400
    Height = 362
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      400
      362)
    object bvlMain: TssBevel
      Left = 0
      Top = 0
      Width = 400
      Height = 362
      Align = alClient
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
    object lName: TLabel
      Left = 32
      Top = 9
      Width = 35
      Height = 13
      Caption = 'lName'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnUp: TssSpeedButton
      Left = 372
      Top = 148
      Width = 23
      Height = 23
      Action = aUp
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 56
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnDown: TssSpeedButton
      Left = 372
      Top = 176
      Width = 23
      Height = 23
      Action = aDown
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 55
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object imgFun: TImage
      Left = 8
      Top = 7
      Width = 16
      Height = 16
      Transparent = True
    end
    object chbShowExcel: TcxCheckBox
      Left = 3
      Top = 335
      Width = 301
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1087#1086#1089#1083#1077' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1101#1082#1089#1087#1086#1088#1090#1072
      State = cbsChecked
      Style.StyleController = dmData.scMain
      TabOrder = 0
      ImeName = 'Russian'
    end
    object grdE: TssDBGrid
      Left = 8
      Top = 28
      Width = 360
      Height = 303
      Hint = #1053#1072#1079#1074#1072#1085#1080#1077
      DrawDragFrame = False
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'colname'
      SummaryGroups = <>
      SummarySeparator = ', '
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnMouseDown = grdEMouseDown
      DataSource = srcCols
      Filter.Criteria = {00000000}
      HideFocusRect = True
      LookAndFeel = lfUltraFlat
      OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
      OnColumnSorting = grdEColumnSorting
      Anchors = [akLeft, akTop, akRight, akBottom]
      LangManager = dmData.Lng
      object colIndex: TdxDBGridColumn
        Alignment = taCenter
        Width = 30
        BandIndex = 0
        RowIndex = 0
        OnGetText = colIndexGetText
      end
      object colName: TdxDBGridColumn
        Tag = 1
        Alignment = taLeftJustify
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        HeaderAlignment = taCenter
        Width = 250
        BandIndex = 0
        RowIndex = 0
        FieldName = 'NAME'
      end
      object colColName: TdxDBGridColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'colname'
      end
      object colVisible: TdxDBGridImageColumn
        Alignment = taRightJustify
        HeaderAlignment = taCenter
        MinWidth = 16
        Width = 80
        BandIndex = 0
        RowIndex = 0
        FieldName = 'vis'
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
          '204'
          '205'
          '206')
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
          '1')
      end
      object colColName2: TdxDBGridColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'colname2'
      end
    end
  end
  object ActionList: TActionList
    Images = dmData.Images
    OnUpdate = ActionListUpdate
    Left = 40
    Top = 136
    object aApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    end
    object aOK: TAction
      Caption = 'Export'
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      OnExecute = aCancelExecute
    end
    object aUp: TAction
      ImageIndex = 56
      OnExecute = aUpExecute
    end
    object aDown: TAction
      ImageIndex = 55
      OnExecute = aDownExecute
    end
  end
  object mdCols: TssMemoryData
    FieldDefs = <>
    Left = 232
    Top = 200
    object mdColsname: TStringField
      FieldName = 'name'
      Size = 48
    end
    object mdColscolname: TStringField
      FieldName = 'colname'
      Size = 48
    end
    object mdColsvis: TIntegerField
      FieldName = 'vis'
    end
    object mdColsen: TIntegerField
      FieldName = 'en'
    end
    object mdColscolindex: TIntegerField
      FieldName = 'colindex'
    end
    object mdColscolname2: TStringField
      FieldName = 'colname2'
    end
  end
  object srcCols: TDataSource
    DataSet = mdCols
    Left = 260
    Top = 200
  end
end
