inherited frmRep17: TfrmRep17
  Caption = 'frmRep17'
  ClientHeight = 540
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Height = 458
    inherited panNotes: TPanel
      Top = 122
    end
    inherited dbgRef: TdxDBTreeList
      Top = 226
      Height = 167
      inherited colMsrName: TdxDBTreeListColumn
        Visible = False
      end
      inherited colSummdef: TdxDBTreeListColumn
        Visible = False
      end
      inherited colNDSIn: TdxDBTreeListColumn
        Visible = False
      end
      inherited colSummIn: TdxDBTreeListColumn
        Visible = False
      end
      inherited colNdsOut: TdxDBTreeListColumn
        Visible = False
      end
      inherited colNdsDif: TdxDBTreeListColumn
        Visible = False
      end
      inherited colPribNDS: TdxDBTreeListColumn
        Visible = False
      end
      inherited colPrib: TdxDBTreeListColumn
        Visible = False
      end
      inherited colKoefNDS: TdxDBTreeListColumn
        Visible = False
      end
      inherited colKoef: TdxDBTreeListColumn
        Visible = False
      end
      inherited colRsv: TdxDBTreeListColumn
        Visible = False
      end
    end
  end
  inherited panButtons: TPanel
    Top = 505
  end
  inherited panToolBar: TPanel
    inherited btnUseLogo: TssSpeedButton
      ImageIndex = 118
    end
    inherited btnUseDiagram: TssSpeedButton
      ImageIndex = 103
    end
  end
  inherited frReport1: TfrReport
    ReportForm = {19000000}
  end
  inherited dsMaster: TDataSource
    Top = 155
  end
  inherited frDBDSMaster: TfrDBDataSet
    Top = 155
  end
  object ActionList1: TActionList
    Left = 196
    Top = 85
  end
  object cdsMaster2: TssClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KAID'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'KANAME'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 64
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'wtype'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftDateTime
        Name = 'fromdate'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDateTime
        Name = 'todate'
        ParamType = ptInput
        Value = 365244d
      end>
    RemoteServer = dmData.SConnection
    StoreDefs = True
    Macros = <>
    Left = 170
    Top = 188
  end
  object dsMaster2: TDataSource
    DataSet = cdsMaster2
    Left = 200
    Top = 188
  end
  object frDBDSMaster2: TfrDBDataSet
    DataSource = dsMaster2
    Left = 230
    Top = 188
  end
  object cdsWriteOff: TssClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KAID'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'KANAME'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 64
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'wtype'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftDateTime
        Name = 'fromdate'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDateTime
        Name = 'todate'
        ParamType = ptInput
        Value = 365244d
      end>
    ProviderName = 'pRep17_WriteOff'
    RemoteServer = dmData.SConnection
    StoreDefs = True
    Macros = <>
    Left = 166
    Top = 260
  end
  object srcWriteOff: TDataSource
    DataSet = cdsWriteOff
    Left = 196
    Top = 260
  end
  object fsrcWriteOff: TfrDBDataSet
    DataSource = srcWriteOff
    Left = 226
    Top = 260
  end
  object cdsRetIn: TssClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KAID'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'KANAME'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 64
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'wtype'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftDateTime
        Name = 'fromdate'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDateTime
        Name = 'todate'
        ParamType = ptInput
        Value = 365244d
      end>
    ProviderName = 'pRep17_RetIn'
    RemoteServer = dmData.SConnection
    StoreDefs = True
    Macros = <>
    Left = 166
    Top = 228
  end
  object srcRetIn: TDataSource
    DataSet = cdsRetIn
    Left = 196
    Top = 228
  end
  object fsrcRetIn: TfrDBDataSet
    DataSource = srcRetIn
    Left = 226
    Top = 228
  end
end
