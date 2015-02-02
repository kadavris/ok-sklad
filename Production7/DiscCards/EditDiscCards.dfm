inherited frmEditDiscCards: TfrmEditDiscCards
  Left = 480
  Top = 286
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmEditDiscCards'
  ClientHeight = 509
  ClientWidth = 608
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 608
    Height = 427
    object bvlMain: TssBevel
      Left = 5
      Top = 0
      Width = 596
      Height = 423
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
    object bvlSep: TssBevel
      Left = 6
      Top = 167
      Width = 593
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnHighlight
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsTopLine
      Style = bsRaised
      UseGradient = False
    end
    object lDiscType: TLabel
      Left = 17
      Top = 207
      Width = 65
      Height = 16
      Caption = #1058#1080#1087' '#1089#1082#1080#1076#1082#1080
    end
    object lAccum: TLabel
      Left = 17
      Top = 241
      Width = 152
      Height = 62
      AutoSize = False
      Caption = #1054#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1089#1082#1080#1076#1086#1082':'
      Visible = False
      WordWrap = True
    end
    object btnNew: TssSpeedButton
      Left = 174
      Top = 236
      Width = 112
      Height = 31
      Action = aAdd
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      DisabledImages = dmData.Images18x18dis
      GroupIndex = 0
      ImageIndex = 0
      Images = dmData.Images18x18
      LeftMargin = 8
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsCaptionGlyph
    end
    object btnProps: TssSpeedButton
      Left = 284
      Top = 236
      Width = 136
      Height = 31
      Action = aEdit
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      DisabledImages = dmData.Images18x18dis
      DisabledImageIndex = 1
      GroupIndex = 0
      ImageIndex = 1
      Images = dmData.Images18x18
      LeftMargin = 8
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsCaptionGlyph
    end
    object btnDel: TssSpeedButton
      Left = 418
      Top = 236
      Width = 119
      Height = 31
      Action = aDel
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      DisabledImages = dmData.Images18x18dis
      DisabledImageIndex = 2
      GroupIndex = 0
      ImageIndex = 2
      Images = dmData.Images18x18
      LeftMargin = 8
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsCaptionGlyph
    end
    object lLimit: TLabel
      Left = 17
      Top = 176
      Width = 86
      Height = 16
      Caption = #1057#1088#1086#1082' '#1076#1077#1081#1089#1090#1074#1080#1103
    end
    object lPercent: TLabel
      Left = 464
      Top = 209
      Width = 12
      Height = 16
      Caption = '%'
    end
    object cbDiscType: TcxComboBox
      Left = 172
      Top = 204
      Width = 169
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.OnEditValueChanged = cbDiscTypePropertiesEditValueChanged
      Style.StyleController = dmData.scMain
      TabOrder = 3
      OnKeyPress = GoNext
    end
    object edOnValue: TssCalcEdit
      Left = 345
      Top = 204
      Width = 115
      Height = 24
      EditValue = 0.000000000000000000
      ImeName = 'Russian'
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.UseLeftAlignmentOnEditing = False
      Style.StyleController = dmData.scMain
      TabOrder = 5
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
      CalcColor = clBtnFace
      DecimalPlaces = 8
    end
    object grdAccum: TssDBGrid
      Left = 174
      Top = 271
      Width = 414
      Height = 144
      Hint = #1055#1088#1086#1094#1077#1085#1090' '#1089#1082#1080#1076#1082#1080
      DrawDragFrame = False
      Bands = <
        item
        end>
      DefaultLayout = False
      HeaderPanelRowCount = 1
      KeyField = 'id'
      SummaryGroups = <>
      SummarySeparator = ', '
      DragMode = dmAutomatic
      ParentShowHint = False
      PopupMenu = pmMain
      ShowHint = True
      TabOrder = 4
      Visible = False
      OnKeyDown = grdAccumKeyDown
      BandColor = 12500670
      DataSource = srcAccum
      Filter.Criteria = {00000000}
      HideFocusRect = True
      HideSelectionColor = clInactiveBorder
      HideSelectionTextColor = clBlack
      LookAndFeel = lfUltraFlat
      MaxRowLineCount = 1
      OptionsBehavior = [edgoAutoSort, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToRegistry, edgoTabs, edgoVertThrough]
      OptionsCustomize = [edgoBandMoving]
      OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoLoadAllRecords, edgoUseLocate]
      OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoHideFocusRect, edgoShowButtonAlways, edgoUseBitmap]
      ShowRowFooter = True
      OnColumnSorting = grdAccumColumnSorting
      OnCustomDrawCell = grdAccumCustomDrawCell
      Anchors = [akLeft, akTop, akRight]
      LangManager = dmData.Lng
      object colRecNo: TdxDBGridColumn
        Alignment = taCenter
        Caption = #8470
        DisableEditor = True
        HeaderAlignment = taCenter
        MaxLength = 30
        MinWidth = 30
        Sizing = False
        Width = 30
        BandIndex = 0
        RowIndex = 0
        OnGetText = colRecNoGetText
      end
      object colTreshold: TdxDBGridColumn
        Alignment = taRightJustify
        Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1088#1086#1075#1072
        HeaderAlignment = taCenter
        Sorted = csUp
        Width = 99
        BandIndex = 0
        RowIndex = 0
        OnValidate = colTresholdValidate
        FieldName = 'treshold'
      end
      object colOnValue: TdxDBGridColumn
        Alignment = taRightJustify
        Caption = #1055#1088#1086#1094#1077#1085#1090' '#1089#1082#1080#1076#1082#1080
        HeaderAlignment = taCenter
        Width = 100
        BandIndex = 0
        RowIndex = 0
        OnValidate = colTresholdValidate
        FieldName = 'onvalue'
      end
    end
    object pcMain: TcxPageControl
      Left = 6
      Top = 6
      Width = 593
      Height = 160
      ActivePage = tsCard
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      object tsCard: TcxTabSheet
        Caption = 'tsCard'
        ImageIndex = 0
        TabVisible = False
        OnShow = tsCardShow
        DesignSize = (
          593
          160)
        object lNum: TLabel
          Left = 12
          Top = 11
          Width = 76
          Height = 16
          Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1099
        end
        object lParent: TLabel
          Left = 12
          Top = 73
          Width = 114
          Height = 16
          Caption = #1054#1090#1085#1086#1089#1080#1090#1089#1103' '#1082' '#1075#1088#1091#1087#1087#1077
        end
        object btnGrp: TssSpeedButton
          Left = 556
          Top = 66
          Action = aDCG
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          Anchors = [akTop, akRight]
          ButtonType = ssbtStandard
          Checked = False
          DisabledImages = dmData.Images18x18dis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          GroupIndex = 0
          ImageIndex = 23
          Images = dmData.Images18x18
          LeftMargin = 3
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object lTotalPos: TssLabel
          Left = 173
          Top = 133
          Width = 52
          Height = 16
          Alignment = taRightJustify
          Anchors = [akLeft, akBottom]
          Caption = #1055#1086#1082#1091#1087#1086#1082':'
          DisabledDraw = ddUser
          DisabledColor = clBtnShadow
        end
        object txtTotalPos: TssBevel
          Left = 241
          Top = 130
          Width = 110
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
          Left = 376
          Top = 132
          Width = 58
          Height = 16
          Alignment = taRightJustify
          Anchors = [akLeft, akBottom]
          Caption = #1053#1072' '#1089#1091#1084#1084#1091':'
          DisabledDraw = ddUser
          DisabledColor = clBtnShadow
        end
        object txtTotalSumm: TssBevel
          Left = 443
          Top = 130
          Width = 145
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
        object lStat: TLabel
          Left = 12
          Top = 133
          Width = 71
          Height = 16
          Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072':'
        end
        object lStartSaldo: TssLabel
          Left = 14
          Top = 103
          Width = 116
          Height = 16
          Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1073#1072#1083#1072#1085#1089':'
          DisabledDraw = ddUser
          DisabledColor = clBtnShadow
        end
        object txtCurr: TssBevel
          Left = 288
          Top = 100
          Width = 43
          Height = 23
          Alignments.Horz = taCenter
          Caption = 'UAH'
          Color = clBtnFace
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
          ParentColor = False
          UseGradient = True
        end
        object edNum: TcxTextEdit
          Left = 167
          Top = 6
          Width = 203
          Height = 24
          ParentFont = False
          Properties.MaxLength = 64
          Properties.OnChange = DataModified
          Style.StyleController = dmData.scMain
          TabOrder = 0
          ImeName = 'Russian'
          OnKeyDown = GoNextKeyDown
          OnKeyPress = GoNext
        end
        object edKAgent: TokKASearchEdit
          Left = 12
          Top = 31
          Width = 565
          Height = 34
          Anchors = [akLeft, akTop, akRight]
          ButtonsLeftMargin = 3
          CapFind = 'Search'
          CapFindParams = 'Search options'
          CapRef = 'Business Partners Directory'
          CapContextFind = 'Context search'
          CapFindBegin = 'From the beginning'
          CapFindConcurr = 'Full match'
          CapFindSubstr = 'Partial match'
          EditorOffset = 155
          DisabledImages = dmData.Images18x18dis
          Images = dmData.Images18x18
          ImageIndexRef = 28
          ImageIndexFind = 18
          ImageIndexFindParams = 19
          LangManager = dmData.Lng
          RemoteServer = dmData.SConnection
          ShowLng = False
          ShowButtons = sbtOnlyRef
          SearchNames.Strings = (
            'Short name;name')
          SearchType = stBegin
          Skin = dmData.sknMain
          StyleController = dmData.scMain
          TabOrder = 1
          OnChange = DataModified
          LoadContracts = True
          SearchMode = smAll
          DesignSize = (
            565
            34)
        end
        object lcbParent: TssPopupTreeEdit
          Left = 167
          Top = 68
          Width = 388
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.PopupAutoSize = False
          Properties.PopupSizeable = False
          Properties.PopupWidth = 386
          Properties.ReadOnly = False
          Properties.OnEditValueChanged = lcbParentPropertiesEditValueChanged
          Style.StyleController = dmData.scMain
          TabOrder = 2
          ImeName = 'Russian'
          OnKeyPress = GoNext
          OnGetNodeImageIndex = lcbGrpParentGetNodeImageIndex
          AllowEmpty = False
          ListSource = srcParent
          KeyField = 'grpid'
          ParentField = 'pid'
          DisplayField = 'name'
          ShowExpandedTree = False
          Images = dmData.Images
        end
        object edStartSaldo: TssCalcEdit
          Left = 167
          Top = 98
          Width = 120
          Height = 24
          EditValue = 0.000000000000000000
          ImeName = 'Russian'
          ParentFont = False
          Properties.Precision = 15
          Properties.OnChange = DataModified
          Style.StyleController = dmData.scMain
          Style.ButtonStyle = btsSimple
          TabOrder = 3
          OnKeyDown = GoNextKeyDown
          OnKeyPress = GoNext
          CalcColor = clBtnFace
          DecimalPlaces = 2
        end
      end
      object tsGroup: TcxTabSheet
        Caption = 'tsGroup'
        ImageIndex = 0
        TabVisible = False
        OnShow = tsGroupShow
        DesignSize = (
          593
          160)
        object lName: TLabel
          Left = 12
          Top = 20
          Width = 106
          Height = 16
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099':'
        end
        object lPrefix: TssLabel
          Left = 31
          Top = 132
          Width = 56
          Height = 16
          Caption = #1055#1088#1077#1092#1080#1082#1089':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          DisabledDraw = ddUser
          DisabledColor = clBtnShadow
        end
        object lCurrNum: TssLabel
          Left = 240
          Top = 132
          Width = 97
          Height = 16
          Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          DisabledDraw = ddUser
          DisabledColor = clBtnShadow
        end
        object lSuffix: TssLabel
          Left = 450
          Top = 132
          Width = 58
          Height = 16
          Caption = #1057#1091#1092#1092#1080#1082#1089':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          DisabledDraw = ddUser
          DisabledColor = clBtnShadow
        end
        object edName: TcxTextEdit
          Left = 167
          Top = 15
          Width = 416
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.MaxLength = 64
          Properties.OnChange = DataModified
          Style.StyleController = dmData.scMain
          TabOrder = 0
          ImeName = 'Russian'
          OnKeyDown = GoNextKeyDown
          OnKeyPress = GoNext
        end
        object rbtNoParent: TcxRadioButton
          Left = 10
          Top = 71
          Width = 301
          Height = 21
          Caption = #1053#1077' '#1087#1086#1076#1095#1080#1085#1077#1085#1072' '#1085#1080' '#1086#1076#1085#1086#1081' '#1080#1079' '#1075#1088#1091#1087#1087
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = rbtParentClick
          OnKeyDown = GoNextKeyDown
          OnKeyPress = GoNext
        end
        object lcbGrpParent: TssPopupTreeEdit
          Left = 167
          Top = 46
          Width = 416
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Properties.PopupAutoSize = False
          Properties.PopupSizeable = False
          Properties.PopupWidth = 414
          Properties.ReadOnly = False
          Style.StyleController = dmData.scMain
          TabOrder = 2
          ImeName = 'Russian'
          OnKeyPress = GoNext
          OnGetNodeImageIndex = lcbGrpParentGetNodeImageIndex
          AllowEmpty = False
          ListSource = srcParent
          KeyField = 'grpid'
          ParentField = 'pid'
          DisplayField = 'name'
          ShowExpandedTree = False
          Images = dmData.Images
        end
        object rbtParent: TcxRadioButton
          Left = 10
          Top = 49
          Width = 149
          Height = 21
          Caption = #1055#1086#1076#1095#1080#1085#1077#1085#1072' '#1075#1088#1091#1087#1087#1077':'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TabStop = True
          OnClick = rbtParentClick
          OnKeyDown = GoNextKeyDown
          OnKeyPress = GoNext
        end
        object chbAutoNum: TcxCheckBox
          Left = 6
          Top = 98
          Width = 576
          Height = 26
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = DataModified
          Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103' '#1076#1083#1103' '#1082#1072#1088#1090', '#1074#1093#1086#1076#1103#1097#1080#1093' '#1074' '#1101#1090#1091' '#1075#1088#1091#1087#1087#1091
          State = cbsChecked
          Style.StyleController = dmData.scMain
          TabOrder = 4
          ImeName = 'Russian'
          OnClick = chbAutoNumClick
          OnKeyDown = GoNextKeyDown
          OnKeyPress = GoNext
        end
        object edPrefix: TcxTextEdit
          Left = 166
          Top = 126
          Width = 65
          Height = 25
          ParentFont = False
          Properties.OnChange = DataModified
          Style.StyleController = dmData.scMain
          TabOrder = 5
          ImeName = 'Russian'
          OnKeyDown = GoNextKeyDown
          OnKeyPress = GoNext
        end
        object edCurrNum: TcxSpinEdit
          Left = 347
          Top = 126
          Width = 87
          Height = 25
          ParentFont = False
          Properties.MaxValue = 1000000000000.000000000000000000
          Properties.OnChange = DataModified
          Style.StyleController = dmData.scMain
          TabOrder = 6
          ImeName = 'Russian'
          OnKeyDown = GoNextKeyDown
          OnKeyPress = GoNext
        end
        object edSuffix: TcxTextEdit
          Left = 518
          Top = 126
          Width = 65
          Height = 25
          ParentFont = False
          Properties.OnChange = DataModified
          Style.StyleController = dmData.scMain
          TabOrder = 7
          ImeName = 'Russian'
          OnKeyDown = GoNextKeyDown
          OnKeyPress = GoNext
        end
      end
    end
    object cbLimit: TcxComboBox
      Left = 172
      Top = 176
      Width = 169
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.OnEditValueChanged = cbLimitPropertiesEditValueChanged
      Style.StyleController = dmData.scMain
      TabOrder = 1
      OnKeyPress = GoNext
    end
    object edExpireDate: TcxDateEdit
      Left = 345
      Top = 176
      Width = 115
      Height = 24
      BeepOnEnter = False
      ImeName = 'Russian'
      ParentFont = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.StyleController = dmData.scMain
      TabOrder = 2
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 608
    inherited panTitleButtons: TssPanel
      Left = 550
    end
  end
  inherited panButtons: TPanel
    Top = 474
    Width = 608
    inherited btnOK: TxButton
      Left = 293
      Top = 7
    end
    inherited btnCancel: TxButton
      Left = 398
      Top = 7
    end
    inherited btnApply: TxButton
      Left = 502
      Top = 7
    end
  end
  inherited panToolBar: TPanel
    Width = 608
    inherited btnLock: TssSpeedButton
      Left = 519
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 546
    end
    inherited btnHelp: TssSpeedButton
      Left = 572
      ImageIndex = 7
      Images = dmData.Images18x18
    end
    object btnDCInfo: TssSpeedButton
      Left = 5
      Top = 1
      Action = aDCInfo
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 187
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
    Top = 290
  end
  inherited FormStorage: TssFormStorage
    Left = 12
    Top = 288
  end
  inherited ActionList: TActionList
    Images = dmData.Images18x18
    Left = 12
    Top = 322
    inherited aHelp: TAction
      ImageIndex = 7
    end
    object aAdd: TAction
      Caption = 'aAdd'
      ImageIndex = 0
      ShortCut = 45
      Visible = False
      OnExecute = aAddExecute
    end
    object aDel: TAction
      Caption = 'aDel'
      ImageIndex = 2
      ShortCut = 16430
      Visible = False
      OnExecute = aDelExecute
    end
    object aEdit: TAction
      Caption = 'aEdit'
      ImageIndex = 1
      ShortCut = 16397
      Visible = False
      OnExecute = aEditExecute
    end
    object aDCInfo: TAction
      Caption = 'aDCInfo'
      ImageIndex = 187
      OnExecute = aDCInfoExecute
    end
    object aDCG: TAction
      Caption = 'aDCG'
      ImageIndex = 23
      OnExecute = aDCGExecute
    end
  end
  object mdAccum: TssMemoryData
    BeforePost = mdAccumBeforePost
    FieldDefs = <>
    OnCalcFields = mdAccumCalcFields
    Left = 408
    Top = 203
    object mdAccumtreshold: TFloatField
      FieldName = 'treshold'
    end
    object mdAccumonvalue: TFloatField
      FieldName = 'onvalue'
    end
    object mdAccumid: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'id'
      Calculated = True
    end
  end
  object srcAccum: TDataSource
    DataSet = mdAccum
    Left = 436
    Top = 201
  end
  object pmMain: TTBPopupMenu
    Images = dmData.Images18x18
    Skin = dmData.sknMain
    Left = 404
    Top = 228
    object TBItem2: TTBItem
      Action = aAdd
    end
    object TBItem1: TTBItem
      Action = aDel
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem3: TTBItem
      Action = aEdit
    end
  end
  object srcParent: TDataSource
    DataSet = cdsParent
    Left = 312
    Top = 392
  end
  object cdsParent: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pDCG_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 340
    Top = 392
  end
end
