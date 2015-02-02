inherited frmBundling: TfrmBundling
  Left = 478
  Top = 246
  Width = 860
  Height = 525
  Caption = 'frmBundling'
  Constraints.MinHeight = 380
  Constraints.MinWidth = 850
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 852
    Height = 413
    object gbHeader: TssGroupBox
      Left = 0
      Top = 0
      Width = 852
      Height = 124
      Align = alTop
      Alignment = alTopLeft
      Caption = 'gbHeader'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = False
      Edges = [beLeft, beRight, beTop, beBottom]
      HideCaption = True
      HotTrack = False
      DesignSize = (
        852
        124)
      object lOndate: TLabel
        Left = 9
        Top = 34
        Width = 34
        Height = 16
        Caption = #1044#1072#1090#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object btnSetTime: TssSpeedButton
        Left = 324
        Top = 32
        Width = 22
        Height = 22
        Alignment = taLeftJustify
        AllwaysShowFrame = False
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
        OnClick = btnSetTimeClick
      end
      object lMiddlePerson: TLabel
        Left = 9
        Top = 92
        Width = 70
        Height = 16
        Caption = 'lRespPerson'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object btnMiddlePerson: TssSpeedButton
        Left = 324
        Top = 91
        Width = 22
        Height = 22
        Alignment = taCenter
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        GroupIndex = 0
        ImageIndex = 32
        Images = dmData.Images18x18
        LeftMargin = 1
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object lNum: TLabel
        Left = 9
        Top = 64
        Width = 29
        Height = 16
        Caption = 'lNum'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lReason: TLabel
        Left = 372
        Top = 65
        Width = 69
        Height = 16
        Alignment = taRightJustify
        Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lNotes: TLabel
        Left = 404
        Top = 95
        Width = 37
        Height = 16
        Alignment = taRightJustify
        Caption = 'Notes:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edDate: TcxDateEdit
        Left = 52
        Top = 31
        Width = 101
        Height = 24
        ImeName = 'Russian'
        ParentFont = False
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.StyleController = dmData.scMain
        TabOrder = 2
        OnKeyDown = GoNextKeyDown
        EditValue = 0d
      end
      object edTime: TcxTimeEdit
        Left = 233
        Top = 31
        Width = 88
        Height = 24
        EditValue = 0.000000000000000000
        ParentFont = False
        Style.StyleController = dmData.scMain
        TabOrder = 3
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
      end
      object chbPosting: TcxCheckBox
        Left = 4
        Top = 4
        Width = 145
        Height = 26
        AutoSize = False
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = 'chbPosting'
        State = cbsChecked
        Style.StyleController = dmData.scMain
        TabOrder = 0
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
      end
      object edNum: TcxTextEdit
        Left = 100
        Top = 60
        Width = 221
        Height = 26
        AutoSize = False
        ParentFont = False
        Properties.MaxLength = 15
        Style.StyleController = dmData.scMain
        TabOrder = 1
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
      end
      object edReason: TcxTextEdit
        Left = 446
        Top = 60
        Width = 405
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Properties.MaxLength = 128
        Style.StyleController = dmData.scMain
        TabOrder = 4
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
      end
      object lcbRespPerson: TssDBLookupCombo
        Left = 100
        Top = 90
        Width = 221
        Height = 24
        ImeName = 'Russian'
        ParentFont = False
        Properties.DropDownListStyle = lsEditFixedList
        Style.StyleController = dmData.scMain
        TabOrder = 5
        OnKeyDown = GoNextKeyDown
        EmptyValue = 0
        KeyField = 'kaid'
        ListField = 'Name'
      end
      object lcbWHouse: TokWHouseSearchEdit
        Left = 368
        Top = 20
        Width = 241
        Height = 29
        ButtonsLeftMargin = 4
        CapRef = 'Warehouses Directory'
        EditorOffset = 63
        Images = dmData.Images
        ImageIndexRef = 50
        LangManager = dmData.Lng
        RemoteServer = dmData.SConnection
        ShowLng = False
        ShowButtons = sbtOnlyRef
        SearchNames.Strings = (
          'Warehouse:;name')
        SearchType = stBegin
        StyleController = dmData.scMain
        TabOrder = 6
        OnChange = lcbWHouseChange
        OnKeyDown = GoNextKeyDown
        ViewMode = vmList
        DesignSize = (
          241
          29)
      end
      object edNotes: TcxTextEdit
        Left = 446
        Top = 90
        Width = 405
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Properties.MaxLength = 128
        Style.StyleController = dmData.scMain
        TabOrder = 7
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
      end
    end
    object gbPos: TssGroupBox
      Left = 0
      Top = 124
      Width = 852
      Height = 289
      Align = alClient
      Alignment = alTopLeft
      Caption = 'gbPos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = False
      Edges = [beLeft, beRight, beTop, beBottom]
      HideCaption = True
      HotTrack = False
      DesignSize = (
        852
        289)
      object btnNew: TssSpeedButton
        Left = 12
        Top = 5
        Width = 127
        Height = 31
        Alignment = taLeftJustify
        AllwaysShowFrame = True
        ButtonType = ssbtStandard
        Checked = False
        Caption = 'Add'
        DisabledImages = dmData.Images
        DroppedDown = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        GroupIndex = 0
        ImageIndex = 124
        Images = dmData.Images
        LeftMargin = 8
        ParentFont = False
        ParentShowHint = False
        PopupMenu = pmAdd
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsCaptionGlyph
      end
      object btnDel: TssSpeedButton
        Left = 334
        Top = 5
        Width = 118
        Height = 31
        Action = aDel
        Alignment = taLeftJustify
        AllwaysShowFrame = True
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        GroupIndex = 0
        ImageIndex = 5
        Images = dmData.Images
        LeftMargin = 8
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsCaptionGlyph
      end
      object btnSearch: TssSpeedButton
        Left = 1
        Top = 7
        Height = 24
        Alignment = taLeftJustify
        AllwaysShowFrame = True
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        Enabled = False
        GroupIndex = 0
        ImageIndex = 172
        Images = dmData.Images
        LeftMargin = 4
        Style = ssbsFlat
        ViewStyle = ssvsGlyphOnly
      end
      object btnShowWMat: TssSpeedButton
        Left = 138
        Top = 5
        Width = 173
        Height = 31
        Action = aAddProd
        Alignment = taLeftJustify
        AllwaysShowFrame = True
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        GroupIndex = 0
        ImageIndex = 14
        Images = dmData.Images
        LeftMargin = 8
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsCaptionGlyph
      end
      object chbAssignSerial: TcxCheckBox
        Left = 478
        Top = 7
        Width = 345
        Height = 24
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = 'Assign 1st item'#39's serial to the whole bundle'
        State = cbsChecked
        TabOrder = 0
        ImeName = 'Russian'
      end
      object edSearch: TcxTextEdit
        Left = 819
        Top = 6
        Width = 32
        Height = 24
        Anchors = [akTop, akRight]
        Enabled = False
        TabOrder = 1
        ImeName = 'Russian'
      end
      object grdDet: TssDBGrid
        Left = 2
        Top = -55
        Width = 848
        Height = 342
        Hint = 'Bundle'
        DrawDragFrame = False
        Bands = <
          item
            Alignment = taLeftJustify
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'posid'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alBottom
        TabOrder = 2
        OnKeyPress = grdDetKeyPress
        DataSource = srcDet
        Filter.Criteria = {00000000}
        Anchors = [akLeft, akTop, akRight, akBottom]
        object colDetID: TdxDBGridColumn
          Visible = False
          Width = 35
          BandIndex = 0
          RowIndex = 0
          FieldName = 'id'
        end
        object colDetPOSID: TdxDBGridColumn
          Visible = False
          Width = 81
          BandIndex = 0
          RowIndex = 0
          FieldName = 'posid'
        end
        object colDetPID: TdxDBGridColumn
          Visible = False
          Width = 52
          BandIndex = 0
          RowIndex = 0
          FieldName = 'pid'
        end
        object colDetType: TdxDBGridColumn
          Visible = False
          Width = 68
          BandIndex = 0
          RowIndex = 0
          FieldName = 'type'
        end
        object colDetBName: TdxDBGridColumn
          Caption = 'Bundle'
          ReadOnly = True
          Width = 144
          BandIndex = 0
          RowIndex = 0
          FieldName = 'bname'
        end
        object colDetIName: TdxDBGridColumn
          Caption = 'Item'
          ReadOnly = True
          Width = 145
          BandIndex = 0
          RowIndex = 0
          FieldName = 'iname'
        end
        object colDetModel: TdxDBGridColumn
          ReadOnly = True
          Visible = False
          Width = 87
          BandIndex = 0
          RowIndex = 0
          FieldName = 'model'
        end
        object colDetQuantity: TdxDBGridCalcColumn
          Width = 51
          BandIndex = 0
          RowIndex = 0
          OnChange = colDetQuantityChange
          OnValidate = colDetQuantityValidate
          FieldName = 'quantity'
          OnGetText = colDetQuantityGetText
        end
        object colDetMsrName: TdxDBGridColumn
          ReadOnly = True
          Width = 55
          BandIndex = 0
          RowIndex = 0
          FieldName = 'msrname'
        end
        object colDetBySN: TdxDBGridCheckColumn
          MinWidth = 20
          ReadOnly = True
          Width = 38
          BandIndex = 0
          RowIndex = 0
          FieldName = 'bysn'
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object colDetSerial: TdxDBGridColumn
          ReadOnly = True
          Width = 126
          BandIndex = 0
          RowIndex = 0
          FieldName = 'serial'
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 852
    inherited panTitleButtons: TssPanel
      Left = 794
    end
  end
  inherited panButtons: TPanel
    Top = 460
    Width = 852
    inherited btnOK: TxButton
      Left = 546
    end
    inherited btnCancel: TxButton
      Left = 651
    end
    inherited btnApply: TxButton
      Left = 753
    end
  end
  inherited panToolBar: TPanel
    Width = 852
    inherited btnLock: TssSpeedButton
      Left = 809
      Top = 2
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 829
      Top = 2
    end
    inherited btnHelp: TssSpeedButton
      Left = 789
      Top = 2
    end
    object btnPrint: TssSpeedButton
      Left = 12
      Top = 1
      Width = 22
      Height = 22
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
    Left = 48
    Top = 4
  end
  inherited FormStorage: TssFormStorage
    Left = 140
    Top = 4
  end
  inherited ActionList: TActionList
    Left = 88
    Top = 4
    object aAddBundleWFill: TAction
      Category = 'Bundles'
      Caption = 'aAddBundleWFill'
      ImageIndex = 133
    end
    object aAddBundle: TAction
      Category = 'Bundles'
      Caption = 'aAddBundle'
      ImageIndex = 124
      OnExecute = aAddBundleExecute
    end
    object aAddProd: TAction
      Category = 'Bundles'
      Caption = 'aAddProd'
      ImageIndex = 14
      OnExecute = aAddProdExecute
    end
    object aDel: TAction
      Category = 'Bundles'
      Caption = 'aDel'
      ImageIndex = 5
    end
  end
  object pmAdd: TPopupMenu
    Images = dmData.Images
    Left = 12
    Top = 207
    object mnuAddBundleWAFill: TMenuItem
      Action = aAddBundleWFill
    end
    object mnuAddBundle: TMenuItem
      Action = aAddBundle
    end
  end
  object srcDet: TssDataSource
    DataSet = mdDet
    ChangeDelay = 100
    Left = 32
    Top = 267
  end
  object mdDet: TssMemoryData
    FieldDefs = <>
    Left = 32
    Top = 323
  end
end
