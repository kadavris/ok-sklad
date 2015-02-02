inherited frmEditWBRest: TfrmEditWBRest
  Left = 375
  Top = 266
  Width = 854
  Height = 559
  Caption = 'frmEditWBRest'
  Constraints.MinWidth = 780
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnConstrainedResize = FormConstrainedResize
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 846
    Height = 436
    TabOrder = 1
    inherited panData: TPanel
      Width = 846
      Height = 436
      inherited panPos: TPanel
        Top = 120
        Width = 846
        Height = 316
        inherited gbPos: TssGroupBox
          Left = 0
          Width = 846
          Height = 316
          Align = alClient
          Edges = [beLeft, beRight, beBottom]
          HideCaption = True
          HotTrack = False
          inherited lTotalCurr: TLabel
            Left = 19
            Top = 292
          end
          inherited lSummCurr: TssBevel
            Left = 97
            Top = 292
            Width = 120
          end
          inherited lTotal: TLabel
            Left = 222
            Top = 292
            Anchors = [akLeft, akBottom]
          end
          inherited lTotNDSOut: TLabel
            Left = 478
            Top = 292
            Alignment = taRightJustify
            Anchors = [akLeft, akBottom]
          end
          inherited lSummDefNoNDS: TssBevel
            Left = 539
            Top = 292
            Width = 120
            Anchors = [akLeft, akBottom]
          end
          inherited lTotNDS: TLabel
            Left = 686
            Top = 292
            Alignment = taRightJustify
            Anchors = [akLeft, akBottom]
          end
          inherited lSummDefNDS: TssBevel
            Left = 721
            Top = 292
            Width = 114
            Anchors = [akLeft, akBottom]
          end
          inherited lTot: TLabel
            Left = 304
            Top = 292
            Alignment = taRightJustify
            Anchors = [akLeft, akBottom]
          end
          inherited lSummDef: TssBevel
            Left = 350
            Top = 292
            Width = 121
            Anchors = [akLeft, akBottom]
          end
          inherited dbgWaybillDet: TssDBGrid
            Left = 9
            Top = 47
            Width = 826
            Height = 240
            Font.Height = -13
            PopupMenu = pmMain
            OnDblClick = dbgWaybillDetDblClick
            OnKeyPress = dbgWaybillDetKeyPress
            Filter.Criteria = {00000000}
            HeaderFont.Height = -13
            PreviewFont.Height = -13
            OnGetOptionsTitle = dbgWaybillDetGetOptionsTitle
            inherited colPosType: TdxDBGridImageColumn
              Visible = False
            end
            inherited colStatus: TdxDBGridImageColumn
              Visible = False
            end
            inherited colPosId: TdxDBGridColumn
              Width = 65
            end
            inherited colArtikul: TdxDBGridColumn
              Width = 103
            end
            inherited colBarCode: TdxDBGridColumn
              Width = 104
            end
            inherited colNorm: TdxDBGridColumn
              Tag = 0
              Width = 61
            end
            inherited colWHouseName: TdxDBGridColumn
              Width = 105
            end
            inherited colPrice: TdxDBGridColumn
              FieldName = 'pricewithnds'
            end
            inherited colPriceWONDS: TdxDBGridColumn
              Width = 81
              FieldName = 'pricewonds'
            end
            inherited colPriceInCurr: TdxDBGridColumn
              Width = 65
            end
            inherited colNDSRate: TdxDBGridColumn
              Width = 61
            end
            inherited colNDS: TdxDBGridColumn
              Width = 72
              FieldName = 'sumnds'
            end
            inherited colSummWONDS: TdxDBGridColumn
              Width = 81
              FieldName = 'sumwonds'
            end
            inherited colSummDef: TdxDBGridColumn
              FieldName = 'sumwithnds'
            end
            inherited colSummCurr: TdxDBGridColumn
              Width = 116
              FieldName = 'sumcurr'
            end
            inherited colMatId: TdxDBGridColumn
              Width = 65
            end
            inherited colWId: TdxDBGridColumn
              Width = 65
            end
            inherited colPType: TdxDBGridColumn
              Width = 65
            end
            inherited colOnValue: TdxDBGridColumn
              Width = 65
            end
            inherited colDiscount: TdxDBGridColumn
              Tag = 0
              Width = 65
            end
            inherited colSerial: TdxDBGridColumn
              Width = 103
            end
            inherited colProducer: TdxDBGridColumn
              Width = 103
            end
            inherited colGTD: TdxDBGridColumn
              Width = 103
            end
            inherited colCertNum: TdxDBGridColumn
              Width = 103
            end
            inherited colCertDate: TdxDBGridColumn
              Width = 81
            end
            inherited colNotes: TdxDBGridColumn
              Width = 104
            end
            inherited colCardNum: TdxDBGridColumn
              Width = 73
            end
            inherited colCardHolder: TdxDBGridColumn
              Width = 104
            end
          end
          object panPosBar: TPanel
            Left = 2
            Top = 9
            Width = 843
            Height = 32
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 1
            DesignSize = (
              843
              32)
            object btnProps: TssSpeedButton
              Left = 132
              Top = 0
              Width = 118
              Height = 31
              Action = aCUpd
              Alignment = taLeftJustify
              AllwaysShowFrame = True
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 4
              Images = dmData.Images18x18
              LeftMargin = 8
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnDel: TssSpeedButton
              Left = 249
              Top = 0
              Width = 118
              Height = 31
              Action = aCDel
              Alignment = taLeftJustify
              AllwaysShowFrame = True
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 5
              Images = dmData.Images18x18
              LeftMargin = 8
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnAdd: TssSpeedButton
              Left = 6
              Top = 0
              Width = 127
              Height = 31
              Action = aCIns
              Alignment = taLeftJustify
              AllwaysShowFrame = True
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              DroppedDown = True
              GroupIndex = 0
              ImageIndex = 3
              Images = dmData.Images18x18
              LeftMargin = 8
              ParentShowHint = False
              PopupMenu = pmMatSvc
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object edFind: TokGridSearchEdit
              Left = 586
              Top = 0
              Width = 248
              Height = 31
              Anchors = [akTop, akRight]
              ButtonsLeftMargin = 3
              CapFind = 'Search'
              CapFindParams = 'Search options'
              CapContextFind = 'Context search'
              CapFindBegin = 'From the beginning'
              CapFindConcurr = 'Full match'
              CapFindSubstr = 'Partial match'
              EditorOffset = 0
              DisabledImages = dmData.Images18x18dis
              Images = dmData.Images18x18
              ImageIndexFind = 18
              ImageIndexFindParams = 19
              LangManager = dmData.Lng
              ShowCaptions = False
              ShowButtons = sbtNoRef
              SearchNames.Strings = (
                'Name;matname'
                'Model;artikul')
              SearchType = stBegin
              Skin = dmData.sknMain
              StyleController = dmData.scMain
              TabOrder = 0
              Grid = dbgWaybillDet
              DesignSize = (
                248
                31)
            end
          end
        end
      end
      inherited panHeader: TPanel
        Width = 846
        Height = 120
        inherited gbHeader: TssGroupBox
          Left = 0
          Top = 0
          Width = 846
          Height = 120
          Align = alClient
          inherited lRate: TLabel
            Left = 161
            Top = 98
            Visible = True
          end
          inherited lCurr: TLabel
            Top = 98
            Visible = True
          end
          inherited lOndate: TLabel
            Left = 485
            Top = 9
            Anchors = [akTop, akRight]
          end
          inherited btnSetTime: TssSpeedButton
            Left = 728
            Top = 7
          end
          object lNum: TLabel [4]
            Left = 9
            Top = 36
            Width = 37
            Height = 16
            Caption = #1053#1086#1084#1077#1088
            Color = clBtnFace
            ParentColor = False
          end
          object lPersonname: TLabel [5]
            Left = 444
            Top = 68
            Width = 55
            Height = 16
            Anchors = [akTop, akRight]
            Caption = #1054#1090#1074'-'#1085#1099#1081':'
          end
          object btnPersonName: TssSpeedButton [6]
            Left = 819
            Top = 64
            Width = 22
            Height = 22
            Action = aPersonsRef
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 67
            Images = dmData.Images
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnPersonNameMouseDown
          end
          object lReason: TLabel [7]
            Left = 444
            Top = 39
            Width = 64
            Height = 16
            Anchors = [akTop, akRight]
            Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
          end
          object lNotes: TLabel [8]
            Left = 444
            Top = 94
            Width = 77
            Height = 16
            Anchors = [akTop, akRight]
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
          end
          inherited edRate: TssCalcEdit
            Left = 200
            Top = 93
            TabOrder = 5
            Visible = True
          end
          inherited cbCurr: TssDBLookupCombo
            Left = 90
            Top = 93
            Width = 63
            TabOrder = 4
            Visible = True
          end
          inherited edDate: TcxDateEdit
            Left = 529
            Top = 6
            Anchors = [akTop, akRight]
          end
          inherited edTime: TcxTimeEdit
            Left = 642
            Top = 6
            Width = 86
            Anchors = [akTop, akRight]
          end
          object chbPosting: TcxCheckBox
            Left = 12
            Top = 6
            Width = 163
            Height = 24
            Properties.Alignment = taLeftJustify
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = chbPostingPropertiesChange
            Properties.Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
            State = cbsChecked
            Style.StyleController = dmData.scMain
            TabOrder = 0
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edNum1: TcxTextEdit
            Left = 90
            Top = 31
            Width = 284
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Properties.MaxLength = 15
            Properties.OnChange = edNum1PropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 1
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object lcbWH: TokWHouseSearchEdit
            Left = 10
            Top = 60
            Width = 429
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            ButtonsLeftMargin = 4
            CapRef = 'Warehouses Directory'
            Images = dmData.Images
            ImageIndexRef = 50
            LangManager = dmData.Lng
            RemoteServer = dmData.SConnection
            ShowLng = False
            ShowButtons = sbtOnlyRef
            SearchNames.Strings = (
              'Warehouse:;name')
            SearchType = stBegin
            Skin = dmData.sknMain
            StyleController = dmData.scMain
            TabOrder = 6
            OnChange = lcbWHChange
            OnKeyDown = GoNextKeyDown
            ViewMode = vmList
            DesignSize = (
              429
              31)
          end
          object lcbPersonName: TssDBLookupCombo
            Left = 529
            Top = 63
            Width = 289
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = DataModified
            Properties.OnEditValueChanged = lcbPersonNamePropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 7
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = srcPersonName
          end
          object edReason: TcxTextEdit
            Left = 528
            Top = 34
            Width = 315
            Height = 24
            Anchors = [akTop, akRight]
            Properties.MaxLength = 128
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 8
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edNotes: TcxTextEdit
            Left = 528
            Top = 89
            Width = 315
            Height = 24
            Anchors = [akTop, akRight]
            Properties.MaxLength = 255
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 9
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 846
    TabOrder = 3
    inherited panTitleButtons: TssPanel
      Left = 785
    end
  end
  inherited panButtons: TPanel
    Top = 487
    Width = 846
    Height = 42
    TabOrder = 2
    inherited btnOK: TxButton
      Left = 634
      Top = 9
      OnKeyDown = GoNextKeyDown
    end
    inherited btnCancel: TxButton
      Left = 737
      Top = 9
    end
    inherited btnApply: TxButton
      Left = 75
      Top = 9
      OnKeyDown = GoNextKeyDown
    end
  end
  inherited panToolBar: TPanel
    Width = 846
    TabOrder = 0
    inherited btnLock: TssSpeedButton
      Left = 799
      Width = 22
      Height = 22
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 823
      Width = 22
      Height = 22
    end
    inherited btnHelp: TssSpeedButton
      Left = 775
      Width = 22
      Height = 22
    end
    inherited btnBallance: TssSpeedButton
      Left = 84
      Width = 22
      Height = 22
      Visible = False
    end
    inherited btnPrint: TssSpeedButton
      Left = 0
      Width = 22
      Height = 22
    end
    inherited btnMatInfo: TssSpeedButton
      Left = 21
      Width = 22
      Height = 22
    end
    inherited btnSvcInfo: TssSpeedButton
      Left = 42
      Width = 22
      Height = 22
    end
    inherited btnFinance: TssSpeedButton
      Left = 63
      Width = 22
      Height = 22
    end
  end
  inherited ilTitleBar: TImageList
    Left = 184
    Top = 324
  end
  inherited FormStorage: TssFormStorage
    Options = []
    Left = 48
    Top = 295
  end
  inherited ActionList: TActionList
    Top = 323
    object aCIns: TAction [5]
      Category = 'det'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 3
      ShortCut = 45
      OnExecute = aCInsExecute
    end
    object aCUpd: TAction [6]
      Tag = 1
      Category = 'det'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ImageIndex = 4
      ShortCut = 16397
      OnExecute = aCUpdExecute
    end
    object aCDel: TAction [7]
      Category = 'det'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      ShortCut = 16430
      OnExecute = aCDelExecute
    end
    object aSetTime: TAction [8]
      Category = 'addon'
      ImageIndex = 95
    end
    object aSetKurs: TAction [10]
      Category = 'addon'
    end
    object aSelectAll: TAction [11]
      Caption = 'aSelectAll'
      ShortCut = 16449
      OnExecute = aSelectAllExecute
    end
    object aPersonsRef: TAction
      Caption = 'aPersonsRef'
      ImageIndex = 67
      ShortCut = 16429
      OnExecute = aPersonsRefExecute
    end
    object aColParams: TAction
      Caption = 'aColParams'
      OnExecute = aColParamsExecute
    end
    object aAddMat: TAction
      Caption = 'aAddMat'
      ImageIndex = 14
      OnExecute = aAddMatExecute
    end
    object aAddMatList: TAction
      Caption = 'aAddMatList'
      ImageIndex = 184
      OnExecute = aAddMatListExecute
    end
    object aFindActivate: TAction
      Caption = 'aFindActivate'
      ShortCut = 16454
      OnExecute = aFindActivateExecute
    end
  end
  inherited srcCashDesks: TDataSource
    Left = 408
    Top = 160
  end
  inherited cdsCashDesks: TssClientDataSet
    Left = 436
    Top = 160
  end
  inherited srcEntAcc: TDataSource
    Left = 480
    Top = 160
  end
  inherited cdsEntAcc: TssClientDataSet
    Left = 508
    Top = 160
  end
  object pmMain: TTBPopupMenu
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 236
    Top = 252
    object mnuAdd: TTBSubmenuItem
      object TBItem18: TTBItem
        Action = aAddMat
      end
      object TBItem17: TTBItem
        Action = aAddMatList
      end
    end
    object TBItem1: TTBItem
      Action = aCIns
      Images = dmData.Images
      Visible = False
    end
    object TBItem2: TTBItem
      Action = aCDel
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem9: TTBItem
      Action = aSelectAll
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBItem14: TTBItem
      Action = aMatInfo
    end
    object TBItem5: TTBItem
      Action = aShowRealPrice
    end
    object TBItem15: TTBItem
      Action = aColParams
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem4: TTBItem
      Action = aCUpd
    end
  end
  object cdsFind: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSQL'
    RemoteServer = dmData.SConnection
    Macros = <
      item
        DataType = ftString
        Name = 'sql'
        ParamType = ptUnknown
      end>
    Left = 190
    Top = 214
  end
  object frDoc: TfrReport
    Dataset = fsrcDoc
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frDocGetValue
    Left = 296
    Top = 338
    ReportForm = {19000000}
  end
  object fsrcDoc: TfrDBDataSet
    DataSet = mdReport
    Left = 325
    Top = 338
  end
  object mdReport: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 266
    Top = 338
  end
  object srcPersonName: TDataSource
    DataSet = cdsPersonName
    Left = 497
    Top = 256
  end
  object cdsPersonName: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 420
    Top = 256
  end
  object pmMatSvc: TTBPopupMenu
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 104
    Top = 299
    object TBItem19: TTBItem
      Action = aAddMat
    end
    object TBItem16: TTBItem
      Action = aAddMatList
    end
  end
end
