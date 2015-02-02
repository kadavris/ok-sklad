inherited frmRepMoney: TfrmRepMoney
  Left = 493
  Top = 299
  Caption = 'frmRepMoney'
  ClientHeight = 410
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Height = 328
    inherited panNotes: TPanel
      Left = 1231
      Top = 274
      Visible = False
    end
    inherited dbgRef: TdxDBTreeList
      Left = 1231
    end
    object gbDocs: TssGroupBox
      Left = 20
      Top = 123
      Width = 493
      Height = 134
      Alignment = alTopLeft
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1044#1086#1082#1091#1084#1077#1085#1090#1099' '
      TabOrder = 4
      Edges = [beLeft, beRight, beTop, beBottom]
      object chbPDIn: TssCheckBox
        Left = 15
        Top = 30
        Width = 227
        Height = 24
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1042#1093#1086#1076#1103#1097#1080#1077' '#1087#1083#1072#1090#1077#1078#1080
        State = cbsChecked
        TabOrder = 0
        ImeName = 'Russian'
      end
      object chbPDOut: TssCheckBox
        Left = 15
        Top = 59
        Width = 232
        Height = 24
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1077' '#1087#1083#1072#1090#1077#1078#1080
        State = cbsChecked
        TabOrder = 1
        ImeName = 'Russian'
      end
      object chbPDCharge: TssCheckBox
        Left = 15
        Top = 89
        Width = 237
        Height = 24
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1088#1072#1089#1093#1086#1076#1099
        State = cbsChecked
        TabOrder = 2
        ImeName = 'Russian'
      end
    end
    object chbPrintBallance: TssCheckBox
      Left = 15
      Top = 271
      Width = 498
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1086#1089#1090#1072#1090#1086#1082' '#1087#1086' '#1085#1072#1083#1080#1095#1085#1099#1084' '#1080' '#1073#1077#1079#1085#1072#1083#1080#1095#1085#1099#1084' '#1089#1088#1077#1076#1089#1090#1074#1072#1084
      State = cbsChecked
      TabOrder = 3
      ImeName = 'Russian'
    end
  end
  inherited panButtons: TPanel
    Top = 375
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
    Left = 64
  end
  inherited FormStorage: TssFormStorage
    Left = 32
    Top = 68
  end
  inherited ActionList: TActionList
    Left = 96
  end
  inherited frReport1: TfrReport
    ReportForm = {19000000}
  end
  inherited cdsMaster: TssMemoryData
    Left = 104
    Top = 107
  end
  inherited dsMaster: TDataSource
    Left = 134
    Top = 108
  end
  inherited frDBDSMaster: TfrDBDataSet
    Left = 165
    Top = 108
  end
  object cdsPDIn: TssClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <
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
        Name = 'doctype'
        ParamType = ptUnknown
      end>
    ProviderName = 'pRepMoney_PD'
    RemoteServer = dmData.SConnection
    StoreDefs = True
    BeforeOpen = cdsPDInBeforeOpen
    Macros = <>
    Left = 212
    Top = 163
  end
  object fsrcPDIn: TfrDBDataSet
    DataSet = cdsPDIn
    Left = 217
    Top = 167
  end
  object cdsPDOut: TssClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <
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
        Name = 'doctype'
        ParamType = ptUnknown
      end>
    ProviderName = 'pRepMoney_PD'
    RemoteServer = dmData.SConnection
    StoreDefs = True
    BeforeOpen = cdsPDOutBeforeOpen
    Macros = <>
    Left = 272
    Top = 163
  end
  object fsrcPDOut: TfrDBDataSet
    DataSet = cdsPDOut
    Left = 277
    Top = 167
  end
  object cdsPDCharge: TssClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <
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
        Name = 'doctype'
        ParamType = ptUnknown
      end>
    ProviderName = 'pRepMoney_PDCharge'
    RemoteServer = dmData.SConnection
    StoreDefs = True
    BeforeOpen = cdsPDChargeBeforeOpen
    Macros = <>
    Left = 316
    Top = 163
  end
  object fsrcPDCharge: TfrDBDataSet
    DataSet = cdsPDCharge
    Left = 321
    Top = 167
  end
  object cdsBalCash: TssClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'ondate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ptypeid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pRepMoney_Ballance'
    RemoteServer = dmData.SConnection
    StoreDefs = True
    BeforeOpen = cdsBalCashBeforeOpen
    Macros = <>
    Left = 212
    Top = 199
  end
  object fsrcBalCash: TfrDBDataSet
    DataSet = cdsBalCash
    Left = 217
    Top = 203
  end
  object cdsBalCashless: TssClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'ondate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ptypeid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pRepMoney_Ballance'
    RemoteServer = dmData.SConnection
    StoreDefs = True
    BeforeOpen = cdsBalCashlessBeforeOpen
    Macros = <>
    Left = 272
    Top = 199
  end
  object fsrcCashless: TfrDBDataSet
    DataSet = cdsBalCashless
    Left = 277
    Top = 203
  end
end
