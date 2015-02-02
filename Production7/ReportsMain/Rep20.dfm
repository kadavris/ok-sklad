inherited frmRep20: TfrmRep20
  Caption = 'frmRep20'
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    object lSGroup: TLabel [0]
      Left = 20
      Top = 119
      Width = 72
      Height = 16
      Caption = #1059#1089#1083'. '#1075#1088#1091#1087#1087#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnAddMG: TssSpeedButton [1]
      Left = 460
      Top = 112
      Width = 29
      Height = 28
      Action = aAddSG
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
    end
    object btnDrillDown: TssSpeedButton [2]
      Left = 489
      Top = 112
      Width = 28
      Height = 28
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
    inherited panNotes: TPanel
      Width = 492
      Height = 114
      TabOrder = 3
      inherited Image3: TImage
        Left = 10
        Top = -15
        Width = 54
        Height = 74
      end
      inherited lTextNotes: TLabel
        Left = 74
        Width = 418
        Height = 114
      end
    end
    inherited dbgRef: TdxDBTreeList
      KeyField = 'svcid'
      ParentField = 'pid'
      TabOrder = 4
      DataSource = dsMaster
      inherited colMatId: TdxDBTreeListColumn
        FieldName = 'svcid'
      end
      inherited colGrpId: TdxDBTreeListColumn
        FieldName = 'pid'
      end
      inherited colMatName: TdxDBTreeListColumn
        FieldName = 'svcname'
      end
      inherited colAmount: TdxDBTreeListColumn
        FieldName = 'amountout'
      end
      inherited colSummdef: TdxDBTreeListColumn
        FieldName = 'summout'
      end
      inherited colSummIn: TdxDBTreeListColumn
        FieldName = ''
      end
      inherited colNdsOut: TdxDBTreeListColumn
        FieldName = ''
      end
      inherited colNdsDif: TdxDBTreeListColumn
        FieldName = ''
      end
      inherited colPribNDS: TdxDBTreeListColumn
        FieldName = ''
      end
      inherited colPrib: TdxDBTreeListColumn
        FieldName = ''
      end
      inherited colKoefNDS: TdxDBTreeListColumn
        FieldName = ''
      end
      inherited colKoef: TdxDBTreeListColumn
        FieldName = ''
      end
    end
    object edSGroup: TssPopupTreeEdit
      Tag = 10
      Left = 137
      Top = 114
      Width = 321
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.PopupAutoSize = False
      Properties.PopupSizeable = False
      Properties.PopupWidth = 319
      Properties.ReadOnly = False
      Properties.OnChange = edSGroupPropertiesChange
      Style.StyleController = dmData.scMain
      TabOrder = 1
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
      OnGetNodeImageIndex = edSGroupGetNodeImageIndex
      ListSource = dsSvcGroup
      KeyField = 'svcid'
      ParentField = 'pid'
      DisplayField = 'name'
      ShowExpandedTree = False
      Images = dmData.Images
    end
    object chbGrpByS: TcxCheckBox
      Left = 133
      Top = 148
      Width = 375
      Height = 24
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 'GrpBy'
      State = cbsChecked
      Style.StyleController = dmData.scMain
      TabOrder = 2
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
    end
  end
  inherited panButtons: TPanel
    inherited btnApply: TxButton
      Left = 146
    end
  end
  inherited ilTitleBar: TImageList
    Left = 340
    Top = 156
  end
  inherited ActionList: TActionList
    Left = 368
    Top = 156
    object aAddSG: TAction
      Caption = 'aAddSG'
      ImageIndex = 48
      OnExecute = aAddSGExecute
    end
  end
  inherited frReport1: TfrReport
    Left = 20
    Top = 140
    ReportForm = {19000000}
  end
  inherited frCheckBoxObject1: TfrCheckBoxObject
    Left = 52
    Top = 140
  end
  inherited frChartObject1: TfrChartObject
    Left = 84
    Top = 140
  end
  inherited cdsMaster: TssMemoryData
    Left = 24
    Top = 283
  end
  inherited dsMaster: TDataSource
    Left = 54
    Top = 284
  end
  inherited frDBDSMaster: TfrDBDataSet
    Left = 85
    Top = 284
  end
  object cdsSvcGroup: TssClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'pSvcGroup_List'
    RemoteServer = dmData.SConnection
    StoreDefs = True
    Macros = <>
    Left = 185
    Top = 109
  end
  object dsSvcGroup: TDataSource
    DataSet = cdsSvcGroup
    Left = 201
    Top = 109
  end
end
