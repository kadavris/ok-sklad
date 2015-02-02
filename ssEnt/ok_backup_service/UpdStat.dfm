object svcUpdateStat: TsvcUpdateStat
  OldCreateOrder = False
  OnCreate = ServiceCreate
  DisplayName = 'OK Update Statistics Service'
  OnContinue = ServiceContinue
  OnPause = ServicePause
  OnShutdown = ServiceShutdown
  OnStart = ServiceStart
  OnStop = ServiceStop
  Left = 355
  Top = 106
  Height = 150
  Width = 215
  object SConn: TssSocketConnection
    ServerGUID = '{D1BE25BD-C0E1-44F4-A8BC-13090C33D877}'
    ServerName = 'okServer.okSrv'
    Host = 'localhost'
    DBID = 0
    DBConnected = False
    DBConnectAtOnce = False
    Left = 24
    Top = 64
  end
  object tmrMain: TTimer
    Interval = 60000
    OnTimer = tmrMainTimer
    Left = 24
    Top = 12
  end
  object Log: TxLog
    Left = 80
    Top = 12
  end
  object qMain: TxQueue
    OnAction = qMainAction
    Left = 128
    Top = 12
  end
  object cdsDB: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSysDB_List'
    RemoteServer = SConn
    Macros = <>
    Left = 80
    Top = 64
  end
end
