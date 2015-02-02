inherited frmRepPersons: TfrmRepPersons
  Left = 409
  Top = 247
  Caption = 'frmRepPersons'
  ClientHeight = 619
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Height = 537
    object lPersons: TLabel [0]
      Left = 20
      Top = 110
      Width = 63
      Height = 16
      Caption = #1057#1083#1091#1078#1072#1097#1080#1081
    end
    object btnPersons: TssSpeedButton [1]
      Left = 486
      Top = 103
      Width = 26
      Height = 26
      Action = aPersonsRef
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 18
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    inherited panNotes: TPanel
      Left = 1231
      Top = 270
      Visible = False
    end
    inherited dbgRef: TdxDBTreeList
      Left = 1477
    end
    inherited prdMain: TokPeriod
      Top = 41
    end
    object lcbPersons: TssDBLookupCombo
      Left = 137
      Top = 103
      Width = 347
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsEditFixedList
      Style.StyleController = dmData.scMain
      TabOrder = 3
      EmptyValue = 0
      KeyField = 'kaid'
      ListField = 'Name'
      ListSource = srcPersons
    end
    object gbDocs: TssGroupBox
      Left = 20
      Top = 262
      Width = 493
      Height = 182
      Alignment = alTopLeft
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1044#1086#1082#1091#1084#1077#1085#1090#1099' '
      TabOrder = 5
      TabStop = False
      Edges = [beLeft, beRight, beTop, beBottom]
      object chbWBIn: TssCheckBox
        Left = 15
        Top = 30
        Width = 227
        Height = 24
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
        State = cbsChecked
        TabOrder = 0
        ImeName = 'Russian'
      end
      object chbWBOut: TssCheckBox
        Left = 15
        Top = 59
        Width = 232
        Height = 24
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
        State = cbsChecked
        TabOrder = 1
        ImeName = 'Russian'
      end
      object chbAccOut: TssCheckBox
        Left = 15
        Top = 89
        Width = 237
        Height = 24
        Enabled = False
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1057#1095#1077#1090#1072
        TabOrder = 2
        ImeName = 'Russian'
      end
      object chbRetOut: TssCheckBox
        Left = 15
        Top = 118
        Width = 237
        Height = 24
        Enabled = False
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1042#1086#1079#1074#1088#1072#1090#1099' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072#1084
        TabOrder = 3
        ImeName = 'Russian'
      end
      object chbRetIn: TssCheckBox
        Left = 15
        Top = 148
        Width = 242
        Height = 24
        Enabled = False
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1042#1086#1079#1074#1088#1072#1090#1099' '#1086#1090' '#1082#1083#1080#1077#1085#1090#1086#1074
        TabOrder = 4
        ImeName = 'Russian'
      end
      object chbWBMove: TssCheckBox
        Left = 266
        Top = 30
        Width = 208
        Height = 24
        Enabled = False
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
        TabOrder = 5
        ImeName = 'Russian'
      end
      object chbWBRest: TssCheckBox
        Left = 266
        Top = 59
        Width = 208
        Height = 24
        Enabled = False
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1040#1082#1090#1099' '#1074#1074#1086#1076#1072' '#1086#1089#1090#1072#1090#1082#1086#1074
        TabOrder = 6
        ImeName = 'Russian'
      end
      object chbWriteOff: TssCheckBox
        Left = 266
        Top = 89
        Width = 208
        Height = 24
        Enabled = False
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1040#1082#1090#1099' '#1089#1087#1080#1089#1072#1085#1080#1103
        TabOrder = 7
        ImeName = 'Russian'
      end
      object chbInv: TssCheckBox
        Left = 266
        Top = 118
        Width = 208
        Height = 24
        Enabled = False
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1040#1082#1090#1099' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080
        TabOrder = 8
        ImeName = 'Russian'
      end
    end
    object chbPrintDocs: TssCheckBox
      Left = 15
      Top = 452
      Width = 498
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      State = cbsChecked
      TabOrder = 6
      ImeName = 'Russian'
    end
    object chbPrintPos: TssCheckBox
      Left = 15
      Top = 481
      Width = 498
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1087#1086#1079#1080#1094#1080#1080' '#1076#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1080#1079' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      State = cbsChecked
      TabOrder = 7
      ImeName = 'Russian'
    end
    object gbMatSvc: TssGroupBox
      Left = 20
      Top = 138
      Width = 493
      Height = 118
      Alignment = alTopLeft
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1074' '#1086#1090#1095#1105#1090#1077' '
      TabOrder = 4
      TabStop = False
      Edges = [beLeft, beRight, beTop, beBottom]
      object edMat: TokMatSearchEdit
        Left = 177
        Top = 46
        Width = 307
        Height = 30
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
        Enabled = False
        Images = dmData.Images18x18
        ImageIndexRef = 22
        ImageIndexFind = 18
        ImageIndexFindParams = 19
        LangManager = dmData.Lng
        RemoteServer = dmData.SConnection
        ShowHint = True
        ShowLng = False
        ShowButtons = sbtOnlyRef
        SearchNames.Strings = (
          'Name;name'
          'Model;artikul'
          'Barcode;barcode')
        SearchType = stBegin
        Skin = dmData.sknMain
        TabOrder = 2
        OnRefButtonClick = edMatRefButtonClick
        AllowZeroRest = True
        ScannerImageIndex = 50
        DesignSize = (
          307
          30)
      end
      object rbtMSAll: TcxRadioButton
        Left = 15
        Top = 25
        Width = 159
        Height = 21
        Caption = #1042#1089#1077' '#1090#1086#1074#1072#1088#1099' '#1080' '#1091#1089#1083#1091#1075#1080
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbtMSAllClick
      end
      object rbtMSMat: TcxRadioButton
        Left = 15
        Top = 52
        Width = 159
        Height = 21
        Caption = #1058#1086#1083#1100#1082#1086' '#1090#1086#1074#1072#1088':'
        TabOrder = 1
        OnClick = rbtMSAllClick
      end
      object rbtMSSvc: TcxRadioButton
        Left = 15
        Top = 80
        Width = 159
        Height = 21
        Caption = #1058#1086#1083#1100#1082#1086' '#1091#1089#1083#1091#1075#1091':'
        TabOrder = 3
        OnClick = rbtMSAllClick
      end
      object edSvc: TokSvcSearchEdit
        Left = 177
        Top = 75
        Width = 307
        Height = 31
        ButtonsLeftMargin = 3
        CapFind = 'Search'
        CapFindParams = 'Search options'
        CapRef = 'Services Directory'
        CapContextFind = 'Context search'
        CapFindBegin = 'From the beginning'
        CapFindConcurr = 'Full match'
        CapFindSubstr = 'Partial match'
        EditorOffset = 0
        DisabledImages = dmData.Images18x18dis
        Enabled = False
        Images = dmData.Images18x18
        ImageIndexRef = 38
        ImageIndexFind = 18
        ImageIndexFindParams = 19
        LangManager = dmData.Lng
        RemoteServer = dmData.SConnection
        ShowLng = False
        ShowButtons = sbtOnlyRef
        SearchNames.Strings = (
          'Name;name'
          'Model;artikul')
        SearchType = stBegin
        Skin = dmData.sknMain
        TabOrder = 4
        TabStop = True
        DesignSize = (
          307
          31)
      end
    end
  end
  inherited panButtons: TPanel
    Top = 584
    inherited btnOK: TxButton
      Left = 324
    end
    inherited btnCancel: TxButton
      Left = 428
    end
  end
  inherited panToolBar: TPanel
    inherited btnUseLogo: TssSpeedButton
      ImageIndex = 118
    end
    inherited btnUseDiagram: TssSpeedButton
      ImageIndex = 103
    end
  end
  inherited ilTitleBar: TImageList
    Left = 352
    Top = 60
  end
  inherited FormStorage: TssFormStorage
    Left = 116
    Top = 12
  end
  inherited ActionList: TActionList
    Left = 380
    Top = 60
    object aPersonsRef: TAction
      Caption = 'aPersonsRef'
      ImageIndex = 18
      ShortCut = 16429
      OnExecute = aPersonsRefExecute
    end
  end
  inherited frReport1: TfrReport
    ReportForm = {19000000}
  end
  inherited cdsMaster: TssMemoryData
    Left = 152
    Top = 11
  end
  inherited dsMaster: TDataSource
    Left = 86
    Top = 12
  end
  inherited frDBDSMaster: TfrDBDataSet
    Left = 181
    Top = 12
  end
  inherited cdsDetail: TssClientDataSet
    Left = 282
    Top = 294
  end
  inherited dsDetail: TDataSource
    Left = 312
    Top = 294
  end
  inherited frDBDSDetail: TfrDBDataSet
    Left = 342
    Top = 294
  end
  object srcPersons: TDataSource
    DataSet = cdsPersons
    Left = 269
    Top = 103
  end
  object cdsPersons: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 240
    Top = 103
  end
  object cdsWBIn: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'wtype'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fromdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'todate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'personid'
        ParamType = ptUnknown
      end>
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsWBInBeforeOpen
    Macros = <>
    Left = 128
    Top = 232
  end
  object srcWBIn: TDataSource
    DataSet = cdsWBIn
    OnDataChange = srcWBInDataChange
    Left = 132
    Top = 220
  end
  object fsrcWBIn: TfrDBDataSet
    DataSource = srcWBIn
    Left = 144
    Top = 288
  end
  object cdsWBInDet: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'wbillid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pRepPers_WBInDet'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsWBInDetBeforeOpen
    Macros = <>
    Left = 128
    Top = 272
  end
  object srcWBInDet: TDataSource
    DataSet = cdsWBInDet
    Left = 132
    Top = 268
  end
  object fsrcWBInDet: TfrDBDataSet
    DataSource = srcWBInDet
    Left = 136
    Top = 264
  end
  object cdsWBOut: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'wtype'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fromdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'todate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'personid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pRepPers_WBList'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsWBOutBeforeOpen
    Macros = <>
    Left = 172
    Top = 232
  end
  object srcWBOut: TDataSource
    DataSet = cdsWBOut
    OnDataChange = srcWBOutDataChange
    Left = 176
    Top = 292
  end
  object fsrcWBOut: TfrDBDataSet
    DataSource = srcWBOut
    Left = 196
    Top = 288
  end
  object cdsWBOutDet: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pRepPers_WBOutDet'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsWBOutDetBeforeOpen
    Macros = <>
    Left = 176
    Top = 272
  end
  object srcWBOutDet: TDataSource
    DataSet = cdsWBOutDet
    Left = 248
    Top = 236
  end
  object fsrcWBOutDet: TfrDBDataSet
    DataSource = srcWBOutDet
    Left = 276
    Top = 232
  end
end
