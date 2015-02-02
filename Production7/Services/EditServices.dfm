inherited frmEditServices: TfrmEditServices
  Left = 541
  Top = 239
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmEditServices'
  ClientHeight = 593
  ClientWidth = 822
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 822
    Height = 511
    object pcMain: TcxPageControl
      Left = 260
      Top = -2
      Width = 556
      Height = 496
      ActivePage = tsNotes
      Anchors = [akLeft, akTop, akRight, akBottom]
      Images = dmData.Images
      LookAndFeel.Kind = lfUltraFlat
      TabOrder = 0
      object tsMain: TcxTabSheet
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
        ImageIndex = 24
        TabVisible = False
        object panMainInfo: TPanel
          Left = 0
          Top = 0
          Width = 556
          Height = 496
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 556
            Height = 496
            Align = alClient
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            object Panel2: TPanel
              Left = 0
              Top = 0
              Width = 556
              Height = 496
              Align = alClient
              BevelOuter = bvNone
              ParentBackground = False
              TabOrder = 0
              object gbMainInfo: TssGroupBox
                Left = 0
                Top = 0
                Width = 556
                Height = 496
                Align = alClient
                Alignment = alTopLeft
                Caption = ' '#1054#1089#1085#1086#1074#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '
                TabOrder = 0
                TabStop = False
                Edges = [beLeft, beRight, beTop, beBottom]
                DesignSize = (
                  556
                  496)
                object lType: TLabel
                  Left = 14
                  Top = 32
                  Width = 22
                  Height = 16
                  Caption = #1058#1080#1087
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lName: TLabel
                  Left = 14
                  Top = 59
                  Width = 56
                  Height = 16
                  Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lArtikul: TssLabel
                  Left = 14
                  Top = 86
                  Width = 47
                  Height = 16
                  Caption = #1040#1088#1090#1080#1082#1091#1083
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  DisabledDraw = ddUser
                  DisabledColor = clBtnShadow
                end
                object btnCopyName: TssSpeedButton
                  Left = 518
                  Top = 52
                  Alignment = taLeftJustify
                  AllwaysShowFrame = False
                  Anchors = [akTop, akRight]
                  ButtonType = ssbtStandard
                  Checked = False
                  DisabledImages = dmData.Images18x18dis
                  GroupIndex = 0
                  ImageIndex = 35
                  Images = dmData.Images18x18
                  LeftMargin = 4
                  ParentShowHint = False
                  ShowHint = True
                  Style = ssbsUser
                  ViewStyle = ssvsGlyphOnly
                  OnClick = btnCopyNameClick
                end
                object cbType: TcxComboBox
                  Left = 148
                  Top = 26
                  Width = 147
                  Height = 24
                  ImeName = 'Russian'
                  Properties.DropDownListStyle = lsFixedList
                  Properties.OnChange = cbTypePropertiesChange
                  Style.StyleController = dmData.scMain
                  TabOrder = 0
                  OnKeyPress = GoNext
                end
                object edName: TcxTextEdit
                  Left = 148
                  Top = 53
                  Width = 369
                  Height = 24
                  Anchors = [akLeft, akTop, akRight]
                  Properties.MaxLength = 128
                  Properties.OnChange = edNamePropertiesChange
                  Style.StyleController = dmData.scMain
                  TabOrder = 1
                  ImeName = 'Russian'
                  OnKeyDown = GoNextKeyDown
                  OnKeyPress = GoNext
                end
                object edArtikul: TcxTextEdit
                  Left = 148
                  Top = 80
                  Width = 369
                  Height = 24
                  Anchors = [akLeft, akTop, akRight]
                  Properties.HideSelection = False
                  Properties.MaxLength = 128
                  Properties.OnChange = edArtikulPropertiesChange
                  Style.StyleController = dmData.scMain
                  TabOrder = 2
                  ImeName = 'Russian'
                  OnKeyDown = GoNextKeyDown
                  OnKeyPress = GoNext
                end
                object pcParent: TPageControl
                  Left = 9
                  Top = 105
                  Width = 542
                  Height = 261
                  ActivePage = tsMat
                  Anchors = [akLeft, akTop, akRight]
                  Style = tsFlatButtons
                  TabOrder = 3
                  TabStop = False
                  object tsMat: TTabSheet
                    Caption = 'tsMat'
                    TabVisible = False
                    DesignSize = (
                      534
                      251)
                    object lParent: TLabel
                      Left = -1
                      Top = 12
                      Width = 114
                      Height = 16
                      Caption = #1054#1090#1085#1086#1089#1080#1090#1089#1103' '#1082' '#1075#1088#1091#1087#1087#1077
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object btnGrp: TssSpeedButton
                      Left = 505
                      Top = 5
                      Action = aMIns
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
                      ImageIndex = 24
                      Images = dmData.Images18x18
                      LeftMargin = 4
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      Style = ssbsUser
                      ViewStyle = ssvsGlyphOnly
                      OnMouseDown = btnGrpMouseDown
                      OnMouseUp = btnGrpMouseUp
                    end
                    object lPrice: TssLabel
                      Left = 0
                      Top = 132
                      Width = 85
                      Height = 16
                      Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1085'/'#1095
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      DisabledDraw = ddUser
                      DisabledColor = clBtnShadow
                    end
                    object lKurs: TLabel
                      Left = 2
                      Top = 160
                      Width = 26
                      Height = 16
                      Caption = #1050#1091#1088#1089
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object sbKurs: TssSpeedButton
                      Left = 135
                      Top = 158
                      Width = 127
                      Height = 20
                      Alignment = taCenter
                      AllwaysShowFrame = True
                      ButtonType = ssbtStandard
                      Checked = False
                      GroupIndex = 0
                      ImageIndex = -1
                      Images = dmData.Images
                      LeftMargin = 4
                      ParentShowHint = False
                      ShowHint = True
                      Style = ssbsUser
                      ViewStyle = ssvsCaptionOnly
                      OnClick = sbKursClick
                    end
                    object lNorm: TssLabel
                      Left = 0
                      Top = 190
                      Width = 37
                      Height = 16
                      Caption = #1053#1086#1088#1084#1072
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      Visible = False
                      DisabledDraw = ddUser
                      DisabledColor = clBtnShadow
                    end
                    object lMeasure: TLabel
                      Left = -1
                      Top = 44
                      Width = 85
                      Height = 16
                      Caption = #1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object btnMeasures: TssSpeedButton
                      Left = 229
                      Top = 38
                      Action = aMIns
                      Alignment = taLeftJustify
                      AllwaysShowFrame = False
                      ButtonType = ssbtStandard
                      Checked = False
                      DisabledImages = dmData.Images18x18dis
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      GroupIndex = 0
                      ImageIndex = 24
                      Images = dmData.Images18x18
                      LeftMargin = 4
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      Style = ssbsUser
                      ViewStyle = ssvsGlyphOnly
                      OnMouseDown = btnMeasuresMouseDown
                      OnMouseUp = btnGrpMouseUp
                    end
                    object lcbParent: TssPopupTreeEdit
                      Left = 134
                      Top = 6
                      Width = 369
                      Height = 24
                      Anchors = [akLeft, akTop, akRight]
                      Properties.PopupAutoSize = False
                      Properties.PopupSizeable = False
                      Properties.PopupWidth = 367
                      Properties.ReadOnly = False
                      Properties.OnChange = lcbParentPropertiesEditValueChanged
                      Properties.OnEditValueChanged = lcbParentPropertiesEditValueChanged
                      Style.StyleController = dmData.scMain
                      TabOrder = 0
                      ImeName = 'Russian'
                      OnEnter = lcbParentEnter
                      OnExit = lcbParentExit
                      OnKeyPress = GoNext
                      OnGetNodeImageIndex = lcbParentGetNodeImageIndex
                      ListSource = srcParent
                      KeyField = 'svcid'
                      ParentField = 'pid'
                      DisplayField = 'name'
                      ShowExpandedTree = False
                      Images = dmData.Images
                    end
                    object edPrice: TssCalcEdit
                      Left = 134
                      Top = 127
                      Width = 128
                      Height = 24
                      EditValue = 0.000000000000000000
                      ImeName = 'Russian'
                      Properties.OnChange = DataModified
                      Style.StyleController = dmData.scMain
                      TabOrder = 4
                      OnKeyDown = GoNextKeyDown
                      OnKeyPress = GoNext
                      CalcColor = clBtnFace
                      DecimalPlaces = 6
                    end
                    object lcbCurrency: TssDBLookupCombo
                      Left = 266
                      Top = 127
                      Width = 81
                      Height = 24
                      ImeName = 'Russian'
                      Properties.DropDownListStyle = lsFixedList
                      Properties.OnChange = DataModified
                      Properties.OnEditValueChanged = lcbCurrencyPropertiesEditValueChanged
                      Style.StyleController = dmData.scMain
                      TabOrder = 5
                      OnKeyDown = GoNextKeyDown
                      OnKeyPress = GoNext
                      EmptyValue = 0
                      KeyField = 'currid'
                      ListField = 'shortname'
                      ListSource = srcCurrency
                    end
                    object chbIsTrans: TcxCheckBox
                      Left = 287
                      Top = 41
                      Width = 216
                      Height = 24
                      ParentFont = False
                      Properties.DisplayUnchecked = 'False'
                      Properties.Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090#1085#1072#1103
                      Style.StyleController = dmData.scMain
                      TabOrder = 2
                      ImeName = 'Russian'
                      OnKeyDown = GoNextKeyDown
                      OnKeyPress = GoNext
                    end
                    object chbIsNormed: TcxCheckBox
                      Left = 129
                      Top = 94
                      Width = 315
                      Height = 24
                      ParentFont = False
                      Properties.DisplayUnchecked = 'False'
                      Properties.Caption = #1053#1086#1088#1084#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1091#1089#1083#1091#1075#1072
                      Style.StyleController = dmData.scMain
                      TabOrder = 3
                      ImeName = 'Russian'
                      OnClick = chbIsNormedClick
                      OnKeyDown = GoNextKeyDown
                      OnKeyPress = GoNext
                    end
                    object edNorm: TssCalcEdit
                      Left = 134
                      Top = 185
                      Width = 128
                      Height = 24
                      EditValue = 0.000000000000000000
                      ImeName = 'Russian'
                      ParentFont = False
                      Properties.OnChange = DataModified
                      Style.StyleController = dmData.scMain
                      TabOrder = 6
                      Visible = False
                      OnKeyDown = GoNextKeyDown
                      OnKeyPress = GoNext
                      CalcColor = clBtnFace
                      DecimalPlaces = 6
                    end
                    object lcbMeasure: TssDBLookupCombo
                      Left = 134
                      Top = 39
                      Width = 94
                      Height = 24
                      ImeName = 'Russian'
                      ParentFont = False
                      Properties.DropDownListStyle = lsFixedList
                      Style.StyleController = dmData.scMain
                      TabOrder = 1
                      OnEnter = lcbMeasureEnter
                      OnExit = lcbParentExit
                      OnKeyPress = GoNext
                      EmptyValue = 0
                      KeyField = 'mid'
                      ListField = 'shortname'
                      ListSource = srcMeasures
                    end
                  end
                  object tsGrp: TTabSheet
                    Caption = 'tsGrp'
                    ImageIndex = 1
                    TabVisible = False
                    DesignSize = (
                      534
                      251)
                    object btnGrpParent: TssSpeedButton
                      Left = 505
                      Top = 18
                      Width = 28
                      Height = 29
                      Action = aMIns
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
                      ImageIndex = 24
                      Images = dmData.Images18x18
                      LeftMargin = 2
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      Style = ssbsUser
                      ViewStyle = ssvsGlyphOnly
                      OnMouseDown = btnGrpMouseDown
                      OnMouseUp = btnGrpMouseUp
                    end
                    object lGrpParent: TssLabel
                      Left = 21
                      Top = 26
                      Width = 41
                      Height = 16
                      Caption = #1043#1088#1091#1087#1087#1072
                      DisabledDraw = ddUser
                      DisabledColor = clBtnShadow
                    end
                    object lcbGrpParent: TssPopupTreeEdit
                      Left = 134
                      Top = 21
                      Width = 369
                      Height = 24
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Properties.PopupAutoSize = False
                      Properties.PopupSizeable = False
                      Properties.PopupWidth = 367
                      Properties.ReadOnly = False
                      Properties.OnChange = lcbParentPropertiesEditValueChanged
                      Properties.OnEditValueChanged = lcbGrpParentPropertiesEditValueChanged
                      Style.StyleController = dmData.scMain
                      TabOrder = 1
                      ImeName = 'Russian'
                      OnEnter = lcbParentEnter
                      OnExit = lcbParentExit
                      OnKeyPress = GoNext
                      OnGetNodeImageIndex = lcbParentGetNodeImageIndex
                      ListSource = srcParent
                      KeyField = 'svcid'
                      ParentField = 'pid'
                      DisplayField = 'name'
                      ShowExpandedTree = False
                      Images = dmData.Images
                    end
                    object rbtParent: TcxRadioButton
                      Left = -1
                      Top = 0
                      Width = 470
                      Height = 21
                      Caption = #1055#1086#1076#1095#1080#1085#1077#1085#1072' '#1075#1088#1091#1087#1087#1077' '#1091#1089#1083#1091#1075
                      Checked = True
                      TabOrder = 0
                      TabStop = True
                      OnClick = rbtParentClick
                    end
                    object rbtNoParent: TcxRadioButton
                      Left = -1
                      Top = 52
                      Width = 490
                      Height = 21
                      Caption = #1053#1077' '#1087#1086#1076#1095#1080#1085#1077#1085#1072' '#1085#1080' '#1086#1076#1085#1086#1081' '#1080#1079' '#1075#1088#1091#1087#1087
                      TabOrder = 2
                      OnClick = rbtParentClick
                    end
                  end
                end
              end
            end
          end
        end
      end
      object tsNotes: TcxTabSheet
        Caption = 'tsNotes'
        ImageIndex = 0
        TabVisible = False
        object gbNotes: TssGroupBox
          Left = 0
          Top = 0
          Width = 556
          Height = 496
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbNotes'
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            556
            496)
          object edNotes: TcxMemo
            Left = 10
            Top = 30
            Width = 536
            Height = 456
            Anchors = [akLeft, akTop, akRight, akBottom]
            ImeName = 'Russian'
            ParentFont = False
            Properties.MaxLength = 255
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnKeyDown = edNotesKeyDown
            OnKeyPress = GoNext
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 5
      Width = 252
      Height = 489
      BevelInner = bvLowered
      Caption = 'Panel3'
      ParentBackground = False
      TabOrder = 1
      object tvMain: TcxTreeList
        Left = 2
        Top = 2
        Width = 248
        Height = 485
        BorderStyle = cxcbsNone
        Align = alClient
        Bands = <
          item
            Caption.Text = 'Band1'
          end>
        BufferedPaint = False
        Color = clBtnFace
        Images = dmData.Images
        LookAndFeel.Kind = lfStandard
        OptionsBehavior.CellHints = True
        OptionsData.Deleting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Headers = False
        ParentColor = False
        TabOrder = 0
        OnSelectionChanged = tvMainSelectionChanged
        object colNAme: TcxTreeListColumn
          DataBinding.ValueType = 'String'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          Width = 248
        end
        object colID: TcxTreeListColumn
          DataBinding.ValueType = 'String'
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
        end
        object colDeff: TcxTreeListColumn
          DataBinding.ValueType = 'String'
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 822
    TabOrder = 3
    inherited panTitleButtons: TssPanel
      Left = 764
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
    Top = 558
    Width = 822
    inherited btnOK: TxButton
      Left = 510
      Top = 9
    end
    inherited btnCancel: TxButton
      Left = 613
      Top = 9
      Width = 97
    end
    inherited btnApply: TxButton
      Left = 716
      Top = 9
    end
  end
  inherited panToolBar: TPanel
    Width = 822
    TabOrder = 2
    inherited btnLock: TssSpeedButton
      Left = 730
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 758
      Width = 21
    end
    inherited btnHelp: TssSpeedButton
      Left = 786
    end
  end
  inherited FormStorage: TssFormStorage
    Left = 40
    Top = 108
  end
  inherited ActionList: TActionList
    Left = 68
    Top = 108
    object aMIns: TAction [5]
      Category = 'Measure'
      ImageIndex = 24
      ShortCut = 16429
      OnExecute = aMInsExecute
    end
    object aPricesAdd: TAction [6]
      Category = 'Prices'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      ShortCut = 45
    end
    object aPricesProps: TAction [7]
      Tag = 1
      Category = 'Prices'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ImageIndex = 1
      ShortCut = 16397
    end
    object aPricesDel: TAction [8]
      Category = 'Prices'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 2
      ShortCut = 16430
    end
    object aMCNew: TAction
      Category = 'MC'
      Caption = 'aMCNew'
      ImageIndex = 0
      ShortCut = 45
    end
    object aMCProps: TAction
      Tag = 1
      Category = 'MC'
      Caption = 'aMCProps'
      ImageIndex = 1
      ShortCut = 16397
    end
    object aMCDel: TAction
      Category = 'MC'
      Caption = 'aMCDel'
      ImageIndex = 2
      ShortCut = 16430
    end
  end
  object srcCurrency: TDataSource
    DataSet = cdsCurrency
    Left = 66
    Top = 152
  end
  object cdsCurrency: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'ondate'
        ParamType = ptUnknown
      end>
    ProviderName = 'pCurrency_ListEx'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsCurrencyBeforeOpen
    AfterOpen = cdsCurrencyAfterOpen
    Macros = <>
    Left = 38
    Top = 152
  end
  object cdsMatGroup: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pMatGroup_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 38
    Top = 224
  end
  object cdsParent: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSvcGroup_List'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsParentAfterOpen
    Macros = <>
    Left = 140
    Top = 108
  end
  object srcParent: TDataSource
    DataSet = cdsParent
    Left = 112
    Top = 108
  end
  object pmMC: TTBPopupMenu
    Images = dmData.Images18x18
    Left = 280
    Top = 96
    object mnuDiscAdd: TTBItem
      Action = aMCNew
      Images = dmData.Images18x18
    end
    object TBItem2: TTBItem
      Action = aMCDel
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem3: TTBItem
      Action = aMCProps
    end
  end
  object srcMatGroup: TDataSource
    DataSet = cdsMatGroup
    Left = 66
    Top = 224
  end
  object pmMatGroup: TPopupMenu
    Images = dmData.Images
    Left = 140
    Top = 136
    object aGrpIns1: TMenuItem
      Caption = 'aGrpIns'
      ImageIndex = 0
      ShortCut = 45
    end
    object aGrpDel1: TMenuItem
      Caption = 'aGrpDel'
      ImageIndex = 2
      ShortCut = 16430
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object aGrpRefresh1: TMenuItem
      Caption = 'aGrpRefresh'
      ImageIndex = 3
      ShortCut = 116
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object aGrpProp1: TMenuItem
      Caption = 'aGrpProp'
      ImageIndex = 1
      ShortCut = 16397
    end
  end
  object cdsMeasures: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pMeasures_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 38
    Top = 188
  end
  object srcMeasures: TDataSource
    DataSet = cdsMeasures
    Left = 66
    Top = 188
  end
end
