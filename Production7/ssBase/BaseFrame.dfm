object ssBaseFrame: TssBaseFrame
  Left = 0
  Top = 0
  Width = 435
  Height = 266
  Align = alClient
  TabOrder = 0
  OnResize = FrameResize
  object ActionList: TActionList
    Left = 56
    Top = 24
    object aArchive: TAction
      Category = 'All'
      Caption = 'aArchive'
      OnExecute = aArchiveExecute
    end
    object aColParams: TAction
      Category = 'All'
      Caption = 'aColParams'
      OnExecute = aColParamsExecute
    end
    object aCheck: TAction
      Category = 'All'
      Caption = 'aCheck'
      Enabled = False
      ImageIndex = 59
      ShortCut = 113
      OnExecute = aCheckExecute
    end
    object aCopy: TAction
      Category = 'All'
      Caption = 'aCopy'
      OnExecute = aCopyExecute
    end
    object aCut: TAction
      Category = 'All'
      Caption = #1042#1099#1088#1077#1079#1072#1090#1100
      ImageIndex = 109
      ShortCut = 16472
      OnExecute = aCutExecute
    end
    object aDel: TAction
      Category = 'All'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      ShortCut = 16430
      OnExecute = aDelExecute
    end
    object aDrillDown: TAction
      Category = 'All'
      Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1087#1086#1076#1095#1080#1085#1105#1085#1085#1099#1093' '#1075#1088#1091#1087#1087
      Enabled = False
      ImageIndex = 60
      OnExecute = aDrillDownExecute
    end
    object aDynamic: TAction
      Category = 'All'
      Caption = #1044#1080#1085#1072#1084#1080#1082#1072
      Enabled = False
      ImageIndex = 20
      OnExecute = aDynamicExecute
    end
    object aExcel: TAction
      Category = 'All'
      Caption = 'aExcel'
      ImageIndex = 54
      OnExecute = aExcelExecute
    end
    object aFind: TAction
      Category = 'All'
      Caption = 'aFind'
      ImageIndex = 52
      OnExecute = aFindExecute
    end
    object aNew: TAction
      Category = 'All'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 3
      ShortCut = 45
      OnExecute = aNewExecute
    end
    object aPaste: TAction
      Category = 'All'
      Caption = 'aPaste'
      ImageIndex = 110
      ShortCut = 16470
      OnExecute = aPasteExecute
    end
    object aPatternInsert: TAction
      Category = 'All'
      Caption = 'aPatternInsert'
      ImageIndex = 87
      ShortCut = 16429
      OnExecute = aPatternInsertExecute
    end
    object aPrint: TAction
      Category = 'All'
      Caption = 'aPrint'
      ImageIndex = 9
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aProperties: TAction
      Tag = 1
      Category = 'All'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ImageIndex = 4
      ShortCut = 16397
      OnExecute = aPropertiesExecute
    end
    object aRefresh: TAction
      Category = 'All'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 6
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aSelectAll: TAction
      Category = 'All'
      Caption = 'aSelectAll'
      ShortCut = 16449
      OnExecute = aSelectAllExecute
    end
    object aShowArchived: TAction
      Category = 'All'
      AutoCheck = True
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1072#1088#1093#1080#1074#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      OnExecute = aShowArchivedExecute
    end
    object aShowFilter: TAction
      Category = 'All'
      Caption = 'aShowFilter'
      OnExecute = aShowFilterExecute
    end
  end
  object pmMain: TTBPopupMenu
    Left = 28
    Top = 24
    object TBItem1: TTBItem
      Action = aNew
    end
    object TBItem2: TTBItem
      Action = aDel
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem4: TTBItem
      Action = aRefresh
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem3: TTBItem
      Action = aProperties
    end
  end
end
