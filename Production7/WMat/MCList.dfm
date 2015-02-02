inherited frmMCList: TfrmMCList
  Left = 400
  Top = 226
  VertScrollBar.Range = 0
  ActiveControl = edMat
  BorderStyle = bsDialog
  Caption = 'frmMCList'
  ClientHeight = 466
  ClientWidth = 762
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 762
    Height = 384
    BevelInner = bvLowered
    BevelOuter = bvRaised
    DesignSize = (
      762
      384)
    object panFilter: TPanel
      Left = 5
      Top = 5
      Width = 748
      Height = 36
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object edMat: TokMatSearchEdit
        Left = 12
        Top = 2
        Width = 600
        Height = 31
        ButtonsLeftMargin = 3
        CapFind = 'Search'
        CapFindParams = 'Search options'
        CapRef = 'Products Directory'
        CapContextFind = 'Context search'
        CapFindBegin = 'From the beginning'
        CapFindConcurr = 'Full match'
        CapFindSubstr = 'Partial match'
        EditorOffset = 100
        DisabledImages = dmData.Images18x18dis
        Images = dmData.Images18x18
        ImageIndexRef = 22
        ImageIndexFind = 18
        ImageIndexFindParams = 19
        LangManager = dmData.Lng
        RemoteServer = dmData.SConnection
        ShowHint = True
        SearchNames.Strings = (
          'Name;name'
          'Model;artikul'
          'Barcode;barcode')
        SearchType = stBegin
        TabOrder = 0
        OnChange = edMatChange
        OnRefButtonClick = edMatRefButtonClick
        AllowZeroRest = True
        ScannerImageIndex = 50
        DesignSize = (
          600
          31)
      end
    end
    object grdMain: TdxDBGrid
      Left = 8
      Top = 40
      Width = 745
      Height = 326
      DrawDragFrame = False
      Bands = <
        item
          Caption = #1052#1072#1090#1077#1088#1080#1072#1083
        end
        item
          Caption = #1054#1089#1090#1072#1090#1082#1080
          Sizing = False
        end>
      DefaultLayout = False
      HeaderPanelRowCount = 1
      KeyField = 'id'
      SummaryGroups = <>
      SummarySeparator = ', '
      PopupMenu = pmDet
      TabOrder = 1
      OnDblClick = grdMainDblClick
      OnKeyDown = grdMainKeyDown
      DataSource = srcMC
      Filter.Criteria = {00000000}
      FixedBandLineColor = clBtnFace
      GroupPanelColor = clBtnFace
      LookAndFeel = lfUltraFlat
      OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
      OptionsCustomize = [edgoBandSizing, edgoColumnMoving, edgoColumnSizing]
      OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
      OnCustomDrawCell = grdMainCustomDrawCell
      Anchors = [akLeft, akTop, akRight, akBottom]
      object colNo: TdxDBGridColumn
        Alignment = taCenter
        Sizing = False
        Width = 25
        BandIndex = 0
        RowIndex = 0
        OnGetText = colNoGetText
      end
      object colName: TdxDBGridColumn
        Tag = 1
        Alignment = taLeftJustify
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        HeaderAlignment = taCenter
        Sorted = csUp
        TabStop = False
        Width = 209
        BandIndex = 0
        RowIndex = 0
        FieldName = 'NAME'
        OnGetText = colNameGetText
      end
      object colMeasure: TdxDBGridColumn
        Alignment = taCenter
        HeaderAlignment = taCenter
        BandIndex = 0
        RowIndex = 0
        FieldName = 'msrname'
      end
      object colID: TdxDBGridColumn
        Visible = False
        Width = 58
        BandIndex = 0
        RowIndex = 0
        FieldName = 'ID'
      end
      object colArtikul: TdxDBGridColumn
        Tag = 1
        Alignment = taLeftJustify
        Caption = #1040#1088#1090#1080#1082#1091#1083
        HeaderAlignment = taCenter
        Sizing = False
        Visible = False
        Width = 120
        BandIndex = 0
        RowIndex = 0
        FieldName = 'ARTIKUL'
        OnGetText = colNameGetText
      end
      object colRemain: TdxDBGridColumn
        Tag = 1
        Caption = #1042#1089#1077#1075#1086
        HeaderAlignment = taCenter
        Sizing = False
        Width = 70
        BandIndex = 1
        RowIndex = 0
        FieldName = 'remain'
      end
      object colFree: TdxDBGridColumn
        Tag = 1
        Alignment = taRightJustify
        Caption = #1057#1074#1086#1073#1086#1076#1085#1086
        HeaderAlignment = taCenter
        Sizing = False
        Width = 70
        BandIndex = 1
        RowIndex = 0
        OnGetText = colFreeGetText
      end
      object colReserved: TdxDBGridColumn
        Tag = 1
        Caption = #1056#1077#1079#1077#1088#1074
        HeaderAlignment = taCenter
        Sizing = False
        Width = 65
        BandIndex = 1
        RowIndex = 0
        OnCustomDrawCell = colReservedCustomDrawCell
        FieldName = 'reserved'
      end
      object colPrice: TdxDBGridColumn
        Caption = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1074#1093#1086#1076#1085#1072#1103' '#1094#1077#1085#1072
        HeaderAlignment = taCenter
        Width = 158
        BandIndex = 0
        RowIndex = 0
        FieldName = 'price'
        OnGetText = colPriceGetText
      end
      object colShortName: TdxDBGridColumn
        Visible = False
        Width = 45
        BandIndex = 0
        RowIndex = 0
        FieldName = 'shortname'
      end
    end
    object panEmpty: TPanel
      Left = 16
      Top = 92
      Width = 729
      Height = 172
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      Caption = #1044#1072#1085#1085#1099#1081' '#1090#1086#1074#1072#1088' '#1085#1077' '#1080#1084#1077#1077#1090' '#1072#1085#1072#1083#1086#1075#1086#1074
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 762
    inherited panTitleButtons: TssPanel
      Left = 704
    end
  end
  inherited panButtons: TPanel
    Top = 431
    Width = 762
    inherited btnOK: TxButton
      Left = 554
    end
    inherited btnCancel: TxButton
      Left = 657
    end
    inherited btnApply: TxButton
      Left = 47
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 762
    inherited btnLock: TssSpeedButton
      Left = 710
      Top = 1
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 734
      Top = 1
    end
    inherited btnHelp: TssSpeedButton
      Left = 686
      Top = 1
    end
    object btnMatRsv: TssSpeedButton
      Left = 68
      Top = 2
      Width = 22
      Height = 22
      Action = aMatRsv
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 100
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnMatMove: TssSpeedButton
      Left = 39
      Top = 2
      Width = 22
      Height = 22
      Action = aMatMove
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 61
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnMatInfo: TssSpeedButton
      Left = 11
      Top = 2
      Width = 22
      Height = 22
      Action = aMatInfo
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 99
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
  end
  inherited ilTitleBar: TImageList
    Left = 16
    Top = 136
  end
  inherited FormStorage: TssFormStorage
    Left = 72
    Top = 136
  end
  inherited ActionList: TActionList
    Images = dmData.Images
    Left = 44
    Top = 136
    inherited aApply: TAction
      Enabled = False
    end
    object aMatInfo: TAction
      Caption = 'aMatInfo'
      ImageIndex = 99
      ShortCut = 16457
      OnExecute = aMatInfoExecute
    end
    object aMatMove: TAction
      Caption = 'aMatMove'
      ImageIndex = 61
      ShortCut = 16461
      OnExecute = aMatMoveExecute
    end
    object aMatRsv: TAction
      Caption = 'aMatRsv'
      ImageIndex = 100
      ShortCut = 16466
      OnExecute = aMatRsvExecute
    end
  end
  object pmDet: TTBPopupMenu
    Images = dmData.Images
    Left = 312
    Top = 212
    object TBItem8: TTBItem
      Action = aMatInfo
      Images = dmData.Images
    end
    object TBItem9: TTBItem
      Action = aMatMove
    end
    object TBItem10: TTBItem
      Action = aMatRsv
    end
  end
  object srcMC: TDataSource
    DataSet = cdsMC
    Left = 156
    Top = 140
  end
  object cdsMC: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'matid'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'ondate'
        ParamType = ptUnknown
        Value = '1.1.2000'
      end>
    ProviderName = 'pWMat_GetMC'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsMCBeforeOpen
    OnCalcFields = cdsMCCalcFields
    Macros = <
      item
        DataType = ftString
        Name = 'sql'
        ParamType = ptUnknown
      end>
    Left = 128
    Top = 140
    object cdsMCID: TIntegerField
      FieldName = 'ID'
    end
    object cdsMCNAME: TStringField
      FieldName = 'NAME'
      Size = 128
    end
    object cdsMCARTIKUL: TStringField
      FieldName = 'ARTIKUL'
      Size = 128
    end
    object cdsMCMSRNAME: TStringField
      FieldName = 'MSRNAME'
      Size = 10
    end
    object cdsMCREMAIN: TFloatField
      FieldName = 'REMAIN'
    end
    object cdsMCRSV: TFloatField
      FieldName = 'RSV'
    end
    object cdsMCPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object cdsMCSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 10
    end
    object cdsMCCURRID: TIntegerField
      FieldName = 'CURRID'
    end
    object cdsMCONVALUE: TFloatField
      FieldName = 'ONVALUE'
    end
    object cdsMCCURRDATE: TDateTimeField
      FieldName = 'CURRDATE'
    end
    object cdsMCreserved: TFloatField
      FieldKind = fkCalculated
      FieldName = 'reserved'
      Calculated = True
    end
  end
  object cdsRsv_Temp: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'ondate'
        ParamType = ptInput
      end>
    ProviderName = 'pSysRsv_List'
    RemoteServer = dmData.SConnection
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'remain'
        ParamType = ptUnknown
      end>
    Left = 128
    Top = 168
  end
end
