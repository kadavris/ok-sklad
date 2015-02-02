inherited frmRep3: TfrmRep3
  Caption = 'frmRep3'
  ClientHeight = 634
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Height = 552
    inherited panNotes: TPanel
      Top = 282
      Height = 98
      inherited lTextNotes: TLabel
        Height = 98
      end
    end
    inherited dbgRef: TdxDBTreeList
      Top = 354
      Height = 140
    end
    object edKA: TokKASearchEdit
      Left = 20
      Top = 107
      Width = 498
      Height = 31
      ButtonsLeftMargin = 4
      CapFind = 'Search'
      CapFindParams = 'Search options'
      CapRef = 'Business Partners Directory'
      CapContextFind = 'Context search'
      CapFindBegin = 'From the beginning'
      CapFindConcurr = 'Full match'
      CapFindSubstr = 'Partial match'
      EditorOffset = 95
      DisabledImages = dmData.Images18x18dis
      Images = dmData.Images18x18
      ImageIndexRef = 28
      ImageIndexFind = 18
      ImageIndexFindParams = 19
      LangManager = dmData.Lng
      RemoteServer = dmData.SConnection
      ShowLng = False
      SearchNames.Strings = (
        'Short name;name')
      SearchType = stBegin
      Skin = dmData.sknMain
      TabOrder = 3
      OnRefButtonClick = edKARefButtonClick
      SearchMode = smAll
      DesignSize = (
        498
        31)
    end
    object chbWithProfit: TcxCheckBox
      Left = 132
      Top = 246
      Width = 363
      Height = 24
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 'GrpBy'
      State = cbsChecked
      Style.StyleController = dmData.scMain
      TabOrder = 5
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
    end
    object gbFiltType: TssGroupBox
      Left = 137
      Top = 137
      Width = 382
      Height = 107
      Alignment = alTopLeft
      TabOrder = 4
      Edges = [beLeft, beRight, beTop, beBottom]
      object cxRadioButton1: TcxRadioButton
        Left = 10
        Top = 22
        Width = 139
        Height = 21
        Action = aByMat
        TabOrder = 0
      end
      object cxRadioButton2: TcxRadioButton
        Left = 10
        Top = 49
        Width = 139
        Height = 21
        Action = aBySvc
        TabOrder = 2
      end
      object cxRadioButton3: TcxRadioButton
        Left = 10
        Top = 76
        Width = 139
        Height = 21
        Action = aByAll
        TabOrder = 4
        TabStop = True
      end
      object edMat: TokMatSearchEdit
        Left = 85
        Top = 16
        Width = 293
        Height = 31
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
        Images = dmData.Images18x18
        ImageIndexRef = 22
        ImageIndexFind = 18
        ImageIndexFindParams = 19
        LangManager = dmData.Lng
        RemoteServer = dmData.SConnection
        ShowHint = True
        ShowLng = False
        SearchNames.Strings = (
          'Name;name'
          'Model;artikul'
          'Barcode;barcode')
        SearchType = stBegin
        Skin = dmData.sknMain
        TabOrder = 1
        OnRefButtonClick = edMatRefButtonClick
        AllowZeroRest = True
        ScannerImageIndex = 50
        DesignSize = (
          293
          31)
      end
      object edSvc: TokSvcSearchEdit
        Left = 85
        Top = 46
        Width = 293
        Height = 30
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
        Images = dmData.Images18x18
        ImageIndexRef = 38
        ImageIndexFind = 18
        ImageIndexFindParams = 19
        LangManager = dmData.Lng
        RemoteServer = dmData.SConnection
        ShowLng = False
        SearchNames.Strings = (
          'Name;name'
          'Model;artikul')
        SearchType = stBegin
        Skin = dmData.sknMain
        TabOrder = 3
        OnRefButtonClick = edSvcRefButtonClick
        DesignSize = (
          293
          30)
      end
    end
  end
  inherited panButtons: TPanel
    Top = 599
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
    Left = 44
  end
  inherited ActionList: TActionList
    Left = 72
    inherited aCurAction: TAction
      OnExecute = aCurActionExecute
    end
    object aByMat: TAction
      Category = 'Filt'
      AutoCheck = True
      Caption = 'aByMat'
      GroupIndex = 1
      OnExecute = aByMatExecute
    end
    object aBySvc: TAction
      Category = 'Filt'
      AutoCheck = True
      Caption = 'aBySvc'
      GroupIndex = 1
      OnExecute = aBySvcExecute
    end
    object aByAll: TAction
      Category = 'Filt'
      AutoCheck = True
      Caption = 'aByAll'
      Checked = True
      GroupIndex = 1
      OnExecute = aByAllExecute
    end
  end
  inherited frReport1: TfrReport
    ReportForm = {19000000}
  end
  inherited cdsMaster: TssMemoryData
    Left = 37
    Top = 166
  end
  inherited dsMaster: TDataSource
    OnDataChange = dsMasterDataChange
    Left = 66
    Top = 167
  end
  inherited frDBDSMaster: TfrDBDataSet
    Left = 96
    Top = 167
  end
  inherited cdsDetail: TssClientDataSet
    Left = 203
    Top = 214
  end
  inherited dsDetail: TDataSource
    Left = 321
    Top = 222
  end
  inherited frDBDSDetail: TfrDBDataSet
    Left = 351
    Top = 222
  end
  inherited cdsSubDetail: TssClientDataSet
    Left = 153
    Top = 251
  end
  inherited dsSubDetail: TDataSource
    Left = 183
    Top = 251
  end
  inherited frDBDSSubDetail: TfrDBDataSet
    Left = 214
    Top = 251
  end
end
