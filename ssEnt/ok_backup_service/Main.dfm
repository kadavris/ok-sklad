object svcBackup: TsvcBackup
  OldCreateOrder = False
  OnCreate = ServiceCreate
  DisplayName = 'OK Backup Service'
  OnContinue = ServiceContinue
  OnPause = ServicePause
  OnShutdown = ServiceShutdown
  OnStart = ServiceStart
  OnStop = ServiceStop
  Left = 355
  Top = 103
  Height = 180
  Width = 227
  object tmrMain: TTimer
    Interval = 60000
    OnTimer = tmrMainTimer
    Left = 32
    Top = 20
  end
  object SConn: TssSocketConnection
    ServerGUID = '{D1BE25BD-C0E1-44F4-A8BC-13090C33D877}'
    ServerName = 'okServer.okSrv'
    Host = 'localhost'
    DBID = 0
    DBConnected = False
    DBConnectAtOnce = False
    Left = 32
    Top = 76
  end
  object cdsDB: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSysDB_List'
    RemoteServer = SConn
    Macros = <>
    Left = 88
    Top = 76
  end
  object Log: TxLog
    Left = 88
    Top = 20
  end
  object qMain: TxQueue
    OnAction = qMainAction
    Left = 136
    Top = 20
  end
end
