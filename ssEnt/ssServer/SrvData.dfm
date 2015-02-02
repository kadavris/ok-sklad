object okSrv: TokSrv
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 878
  Top = 216
  Height = 173
  Width = 374
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 40
    Top = 24
  end
end
