inherited frmSetWMat: TfrmSetWMat
  Left = 600
  Top = 259
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmSetWMat'
  ClientHeight = 484
  ClientWidth = 766
  KeyPreview = False
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 766
    Height = 402
    object dbgWHouse: TdxDBGrid
      Left = 5
      Top = 6
      Width = 756
      Height = 387
      DrawDragFrame = False
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'wid'
      SummaryGroups = <>
      SummarySeparator = ', '
      PopupMenu = pmGrid
      TabOrder = 0
      OnKeyDown = dbgWHouseKeyDown
      OnMouseDown = dbgWHouseMouseDown
      DataSource = dsWHouse
      Filter.Criteria = {00000000}
      LookAndFeel = lfUltraFlat
      OptionsBehavior = [edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
      OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnSizing]
      OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
      OnCustomDrawCell = dbgWHouseCustomDrawCell
      Anchors = [akLeft, akTop, akBottom]
      object colVsb: TdxDBGridCheckColumn
        HeaderAlignment = taCenter
        Sizing = False
        Width = 20
        BandIndex = 0
        RowIndex = 0
        FieldName = 'def'
        ValueChecked = '1'
        ValueGrayed = '-1'
        ValueUnchecked = '0'
      end
      object colName: TdxDBGridColumn
        HeaderAlignment = taCenter
        Width = 200
        BandIndex = 0
        RowIndex = 0
        FieldName = 'name'
      end
      object colDel: TdxDBGridColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'deleted'
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 766
    TabOrder = 3
    inherited panTitleButtons: TssPanel
      Left = 708
    end
  end
  inherited panButtons: TPanel
    Top = 449
    Width = 766
    inherited btnOK: TxButton
      Left = 556
    end
    inherited btnCancel: TxButton
      Left = 661
    end
    inherited btnApply: TxButton
      Left = 1
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 766
    TabOrder = 2
    inherited btnLock: TssSpeedButton
      Left = 712
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 736
    end
    inherited btnHelp: TssSpeedButton
      Left = 688
    end
    object lMatGroup: TLabel
      Left = 188
      Top = 5
      Width = 105
      Height = 16
      Caption = #1058#1086#1074#1072#1088#1085#1072#1103' '#1075#1088#1091#1087#1087#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnAddMG: TssSpeedButton
      Left = 553
      Top = 4
      Width = 22
      Height = 22
      Alignment = taCenter
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 48
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnAddMGClick
    end
    object btnDrillDown: TssSpeedButton
      Left = 581
      Top = 4
      Width = 22
      Height = 22
      Alignment = taCenter
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtChecked
      Checked = True
      DisabledImages = dmData.Images18x18dis
      GroupIndex = 0
      ImageIndex = 25
      Images = dmData.Images18x18
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object edMatGroup: TssPopupTreeEdit
      Tag = 10
      Left = 305
      Top = 2
      Width = 246
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.PopupAutoSize = False
      Properties.PopupSizeable = False
      Properties.PopupWidth = 244
      Properties.ReadOnly = False
      Style.StyleController = dmData.scMain
      TabOrder = 0
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
      OnGetNodeImageIndex = edMatGroupGetNodeImageIndex
      ListSource = dsMatGroup
      KeyField = 'grpid'
      ParentField = 'pid'
      DisplayField = 'name'
      ShowExpandedTree = False
      Images = dmData.Images
    end
    object chbColAmount: TcxCheckBox
      Left = 15
      Top = -2
      Width = 174
      Height = 28
      AutoSize = False
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1062#1077#1085#1099' '#1074#1082#1083#1102#1095#1072#1102#1090' '#1053#1044#1057
      State = cbsChecked
      Style.StyleController = dmData.scMain
      TabOrder = 1
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
    end
  end
  inherited ilTitleBar: TImageList
    Left = 124
    Top = 108
  end
  inherited ActionList: TActionList
    Left = 160
    Top = 108
    object aSelAll: TAction
      Caption = 'aSelAll'
      ShortCut = 16449
      OnExecute = aSelAllExecute
    end
  end
  object mdWHouse: TssMemoryData
    FieldDefs = <>
    Left = 250
    Top = 152
  end
  object dsWHouse: TDataSource
    DataSet = mdWHouse
    Left = 282
    Top = 152
  end
  object pmGrid: TTBPopupMenu
    Skin = dmData.sknMain
    Left = 132
    Top = 196
    object TBItem1: TTBItem
      Action = aSelAll
    end
  end
  object cdsMatGroup: TssClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'GRPID'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'PID'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 64
      end
      item
        Name = 'DELETED'
        Attributes = [faReadonly]
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'pMatGroup_List'
    RemoteServer = dmData.SConnection
    StoreDefs = True
    Macros = <>
    Left = 379
    Top = 96
  end
  object dsMatGroup: TDataSource
    DataSet = cdsMatGroup
    Left = 451
    Top = 96
  end
end
