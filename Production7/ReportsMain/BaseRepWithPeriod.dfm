inherited frmBaseRepWithPeriod: TfrmBaseRepWithPeriod
  Left = 488
  Top = 243
  Caption = 'frmBaseRepWithPeriod'
  ClientHeight = 522
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Height = 440
    inherited panNotes: TPanel
      Top = 175
      TabOrder = 1
    end
    inherited dbgRef: TdxDBTreeList
      Top = 324
      TabOrder = 2
    end
    object prdMain: TokPeriod
      Left = 20
      Top = 15
      Width = 386
      Height = 61
      CapType = 'Period:'
      CapMonth = 'Month:'
      CapYear = 'Year:'
      CapQuarter = 'Quarter:'
      CapFrom = 'Starting from:'
      CapTo = 'to:'
      CapSelPeriod = 'Select Period'
      EditorsOffset = 95
      TabOrder = 0
      TabStop = True
      LangManager = dmData.Lng
      DesignSize = (
        386
        61)
    end
  end
  inherited panButtons: TPanel
    Top = 487
  end
  inherited panToolBar: TPanel
    inherited btnLock: TssSpeedButton
      Left = 444
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 471
    end
    inherited btnHelp: TssSpeedButton
      Left = 498
    end
    inherited btnUseLogo: TssSpeedButton
      Top = 0
    end
    inherited btnUseDiagram: TssSpeedButton
      Top = 0
    end
  end
  inherited frReport1: TfrReport
    ReportForm = {19000000}
  end
end
