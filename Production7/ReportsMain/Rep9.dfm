inherited frmRep9: TfrmRep9
  Caption = 'frmRep9'
  ClientHeight = 606
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Height = 524
    object lWhouse: TLabel [0]
      Left = 20
      Top = 116
      Width = 21
      Height = 16
      Caption = #1057#1082#1083
    end
    object sbAddWHouse: TssSpeedButton [1]
      Left = 492
      Top = 108
      Width = 29
      Height = 29
      Alignment = taCenter
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      Caption = 'aAddWHouse'
      DisabledImages = dmData.Images18x18dis
      GroupIndex = 0
      ImageIndex = 26
      Images = dmData.Images18x18
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = sbAddWHouseClick
    end
    inherited panNotes: TPanel
      Top = 252
    end
    inherited dbgRef: TdxDBTreeList
      Height = 215
    end
    object gbFiltType: TssGroupBox
      Left = 137
      Top = 137
      Width = 385
      Height = 101
      Alignment = alTopLeft
      TabOrder = 4
      Edges = [beLeft, beRight, beTop, beBottom]
      DesignSize = (
        385
        101)
      object btnAddMG: TssSpeedButton
        Left = 293
        Top = 58
        Width = 28
        Height = 28
        Alignment = taCenter
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        DisabledImageIndex = 23
        GroupIndex = 0
        ImageIndex = 48
        Images = dmData.Images
        LeftMargin = 4
        Offset = 0
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnClick = btnAddMGClick
      end
      object btnDrillDown: TssSpeedButton
        Left = 321
        Top = 58
        Width = 29
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
      object cxRadioButton1: TcxRadioButton
        Left = 10
        Top = 22
        Width = 139
        Height = 21
        Action = aByMat
        TabOrder = 0
        TabStop = True
      end
      object cxRadioButton2: TcxRadioButton
        Left = 10
        Top = 52
        Width = 139
        Height = 40
        Action = aByGrp
        TabOrder = 2
      end
      object edMat: TokMatSearchEdit
        Left = 85
        Top = 16
        Width = 293
        Height = 31
        ButtonsLeftMargin = 3
        CapFind = 'Search'
        CapFindParams = 'Search options'
        CapRef = 'Products Directory'
        CapContextFind = 'Context search'
        CapFindBegin = 'From the beginning'
        CapFindConcurr = 'Full match'
        CapFindSubstr = 'Partial match'
        EditorOffset = 0
        DisabledImages = dmData.Images18x18dis
        Images = dmData.Images18x18
        ImageIndexRef = 22
        ImageIndexFind = 18
        ImageIndexFindParams = 19
        LangManager = dmData.Lng
        RemoteServer = dmData.SConnection
        ShowHint = True
        ShowLng = False
        SearchNames.Strings = (
          'Name;name'
          'Model;artikul'
          'Barcode;barcode')
        SearchType = stBegin
        Skin = dmData.sknMain
        TabOrder = 1
        OnRefButtonClick = edMatRefButtonClick
        AllowZeroRest = True
        ScannerImageIndex = 50
        DesignSize = (
          293
          31)
      end
      object edMatGroup: TssPopupTreeEdit
        Tag = 10
        Left = 85
        Top = 59
        Width = 207
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Properties.PopupAutoSize = False
        Properties.PopupSizeable = False
        Properties.PopupWidth = 205
        Properties.ReadOnly = False
        Style.StyleController = dmData.scMain
        TabOrder = 3
        ImeName = 'Russian'
        OnEnter = CtrlEnter
        OnExit = CtrlExit
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
        OnGetNodeImageIndex = edMatGroupGetNodeImageIndex
        ListSource = dsMatGroup
        KeyField = 'grpid'
        ParentField = 'pid'
        DisplayField = 'name'
        ShowExpandedTree = False
        Images = dmData.Images
      end
    end
    object lcbWHouse: TssDBLookupCombo
      Left = 137
      Top = 110
      Width = 354
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsEditFixedList
      Style.StyleController = dmData.scMain
      TabOrder = 3
      OnEnter = CtrlEnter
      OnExit = CtrlExit
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
      EmptyValue = 0
      KeyField = 'wid'
      ListField = 'name'
      ListSource = dsWhouse
    end
  end
  inherited panButtons: TPanel
    Top = 571
  end
  inherited panToolBar: TPanel
    inherited btnUseLogo: TssSpeedButton
      ImageIndex = 118
    end
    inherited btnUseDiagram: TssSpeedButton
      ImageIndex = 103
    end
  end
  inherited FormStorage: TssFormStorage
    StoredProps.Strings = (
      'aByGrp.Checked'
      'aByMat.Checked')
    Top = 68
  end
  inherited ActionList: TActionList
    inherited aCurAction: TAction
      OnExecute = aCurActionExecute
    end
    object aByMat: TAction
      AutoCheck = True
      Caption = 'aByMat'
      Checked = True
      GroupIndex = 3
      OnExecute = aByMatExecute
    end
    object aByGrp: TAction
      AutoCheck = True
      Caption = 'aByGrp'
      GroupIndex = 3
      OnExecute = aByGrpExecute
    end
  end
  inherited frReport1: TfrReport
    ReportForm = {19000000}
  end
  inherited cdsMaster: TssMemoryData
    Left = 280
    Top = 243
  end
  inherited dsMaster: TDataSource
    Left = 310
    Top = 244
  end
  inherited frDBDSMaster: TfrDBDataSet
    Left = 341
    Top = 244
  end
  inherited cdsDetail: TssClientDataSet
    Left = 310
    Top = 274
  end
  inherited dsDetail: TDataSource
    Left = 340
    Top = 274
  end
  inherited frDBDSDetail: TfrDBDataSet
    Left = 370
    Top = 274
  end
  inherited cdsSubDetail: TssClientDataSet
    Left = 340
    Top = 305
  end
  inherited dsSubDetail: TDataSource
    Left = 370
    Top = 305
  end
  inherited frDBDSSubDetail: TfrDBDataSet
    Left = 401
    Top = 305
  end
  object dsWhouse: TDataSource
    DataSet = cdsWhouse
    Left = 358
    Top = 113
  end
  object cdsWhouse: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pWHouse_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsWhouseBeforeOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptInput
      end>
    Left = 340
    Top = 114
    object cdsWhouseWID: TIntegerField
      FieldName = 'WID'
      ReadOnly = True
    end
    object cdsWhouseNAME: TStringField
      FieldName = 'NAME'
      ReadOnly = True
      Size = 64
    end
    object cdsWhouseADDR: TStringField
      FieldName = 'ADDR'
      ReadOnly = True
      Size = 255
    end
    object cdsWhouseNOTES: TStringField
      FieldName = 'NOTES'
      ReadOnly = True
      Size = 255
    end
    object cdsWhouseDELETED: TIntegerField
      FieldName = 'DELETED'
      ReadOnly = True
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
    Left = 55
    Top = 128
  end
  object dsMatGroup: TDataSource
    DataSet = cdsMatGroup
    Left = 71
    Top = 128
  end
end
