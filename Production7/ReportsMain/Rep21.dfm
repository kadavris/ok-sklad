inherited frmRep21: TfrmRep21
  Left = 500
  Top = 238
  Caption = 'frmRep21'
  ClientHeight = 583
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Height = 501
    object lInter: TLabel [0]
      Left = 20
      Top = 118
      Width = 30
      Height = 16
      Caption = 'lInter'
    end
    inherited panNotes: TPanel
      Top = 150
    end
    inherited dbgRef: TdxDBTreeList
      Top = 261
      Height = 178
    end
    inherited prdMain: TokPeriod
      PeriodType = ptMonth
      PeriodTypes = [ptMonth, ptQuarter, ptYear]
      OnChange = prdMainChange
    end
    object cbInter: TcxComboBox
      Left = 137
      Top = 112
      Width = 149
      Height = 24
      ImeName = 'Russian'
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 3
    end
  end
  inherited panButtons: TPanel
    Top = 548
  end
  inherited panToolBar: TPanel
    inherited btnLock: TssSpeedButton
      Left = 443
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 470
    end
    inherited btnHelp: TssSpeedButton
      Left = 497
    end
    inherited btnUseLogo: TssSpeedButton
      ImageIndex = 118
    end
    inherited btnUseDiagram: TssSpeedButton
      ImageIndex = 103
    end
  end
  inherited ilTitleBar: TImageList
    Left = 340
    Top = 60
  end
  inherited FormStorage: TssFormStorage
    Left = 156
    Top = 164
  end
  inherited ActionList: TActionList
    Left = 368
    Top = 60
  end
  inherited frReport1: TfrReport
    Left = 304
    Top = 120
    ReportForm = {19000000}
  end
  inherited frCheckBoxObject1: TfrCheckBoxObject
    Left = 336
    Top = 120
  end
  inherited frChartObject1: TfrChartObject
    Left = 368
    Top = 120
  end
  inherited frDBDSMaster: TfrDBDataSet
    DataSource = dsRep
    Left = 264
  end
  object mdRep: TssMemoryData
    FieldDefs = <
      item
        Name = 'fromDate'
        DataType = ftDateTime
      end
      item
        Name = 'toDate'
        DataType = ftDateTime
      end
      item
        Name = 'Iname'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'MatSummIn'
        DataType = ftFloat
      end
      item
        Name = 'MatSummOut'
        DataType = ftFloat
      end
      item
        Name = 'MatPrib'
        DataType = ftFloat
      end
      item
        Name = 'SvcSumm'
        DataType = ftFloat
      end
      item
        Name = 'PayOut'
        DataType = ftFloat
      end
      item
        Name = 'FinRes'
        DataType = ftFloat
      end>
    OnCalcFields = mdRepCalcFields
    Left = 200
    Top = 157
    object mdRepfromDate: TDateTimeField
      FieldName = 'fromDate'
    end
    object mdReptoDate: TDateTimeField
      FieldName = 'toDate'
    end
    object mdRepIname: TStringField
      FieldName = 'Iname'
      Size = 64
    end
    object mdRepMatSummIn: TFloatField
      FieldName = 'MatSummIn'
    end
    object mdRepMatSummOut: TFloatField
      FieldName = 'MatSummOut'
    end
    object mdRepMatPrib: TFloatField
      FieldName = 'MatPrib'
    end
    object mdRepSvcSumm: TFloatField
      FieldName = 'SvcSumm'
    end
    object mdRepPayOut: TFloatField
      FieldName = 'PayOut'
    end
    object mdRepFinRes: TFloatField
      FieldKind = fkCalculated
      FieldName = 'FinRes'
      Calculated = True
    end
    object mdRepMatSummWriteOff: TCurrencyField
      FieldName = 'MatSummWriteOff'
    end
    object mdRepMatSummRetIn: TCurrencyField
      FieldName = 'MatSummRetIn'
    end
    object mdRepMatRetNDS: TCurrencyField
      FieldName = 'MatRetNDS'
    end
  end
  object dsRep: TDataSource
    DataSet = mdRep
    Left = 232
    Top = 157
  end
end
