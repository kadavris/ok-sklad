inherited frmRemainsAtWH: TfrmRemainsAtWH
  Left = 395
  Top = 216
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmRemainsAtWH'
  ClientHeight = 447
  ClientWidth = 505
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 505
    Height = 365
    object bvlMain: TssBevel
      Left = 5
      Top = 2
      Width = 493
      Height = 344
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object grdWHouse: TssDBGrid
      Left = 8
      Top = 8
      Width = 481
      Height = 329
      Hint = #1042#1089#1077#1075#1086
      DrawDragFrame = False
      Bands = <
        item
          Caption = #1052#1072#1090#1077#1088#1080#1072#1083
        end>
      DefaultLayout = False
      HeaderPanelRowCount = 1
      KeyField = 'WID'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alCustom
      BorderStyle = bsNone
      ParentShowHint = False
      PopupMenu = pmMain
      ShowHint = True
      TabOrder = 0
      OnDblClick = grdWHouseDblClick
      OnKeyDown = grdWHouseKeyDown
      DataSource = srcWHouse
      Filter.Criteria = {00000000}
      FixedBandLineColor = clBtnFace
      GroupPanelColor = clBtnFace
      LookAndFeel = lfUltraFlat
      OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
      OptionsCustomize = [edgoBandSizing, edgoColumnSizing]
      OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
      OnCustomDrawCell = grdWHouseCustomDrawCell
      object colWID: TdxDBGridColumn
        Visible = False
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'WID'
      end
      object colWName: TdxDBGridColumn
        Tag = 1
        Alignment = taLeftJustify
        Caption = #1057#1082#1083#1072#1076
        HeaderAlignment = taCenter
        Sorted = csUp
        TabStop = False
        Width = 240
        BandIndex = 0
        RowIndex = 0
        FieldName = 'NAME'
        SummaryFooterType = cstCount
      end
      object colWRemain: TdxDBGridColumn
        Tag = 1
        Alignment = taRightJustify
        Caption = #1042#1089#1077#1075#1086
        HeaderAlignment = taCenter
        Width = 57
        BandIndex = 0
        RowIndex = 0
        FieldName = 'REMAIN'
        OnGetText = colWRemainGetText
        SummaryFooterType = cstSum
      end
      object colWFree: TdxDBGridColumn
        Alignment = taRightJustify
        Caption = #1057#1074#1086#1073#1086#1076#1085#1086
        HeaderAlignment = taCenter
        Width = 53
        BandIndex = 0
        RowIndex = 0
        FieldName = 'REMAIN'
        OnGetText = colWFreeGetText
        SummaryFooterType = cstSum
      end
      object colWReserved: TdxDBGridColumn
        Alignment = taRightJustify
        Caption = #1056#1077#1079#1077#1088#1074
        HeaderAlignment = taCenter
        Width = 48
        BandIndex = 0
        RowIndex = 0
        FieldName = 'reserved'
        OnGetText = colWReservedGetText
        SummaryFooterType = cstSum
      end
    end
    object panEmpty: TPanel
      Left = 8
      Top = 8
      Width = 481
      Height = 329
      Align = alCustom
      BevelOuter = bvNone
      Caption = #1058#1086#1074#1072#1088' '#1085#1072' '#1089#1082#1083#1072#1076#1072#1093' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090'!'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 505
    inherited panTitleButtons: TssPanel
      Left = 447
    end
  end
  inherited panButtons: TPanel
    Top = 412
    Width = 505
    inherited btnOK: TxButton
      Left = 295
      Top = 7
    end
    inherited btnCancel: TxButton
      Left = 400
      Top = 7
    end
    inherited btnApply: TxButton
      Left = 46
      Top = 7
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 505
    inherited btnLock: TssSpeedButton
      Left = 415
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 443
      Width = 22
    end
    inherited btnHelp: TssSpeedButton
      Left = 470
    end
    object btnMove: TssSpeedButton
      Left = 5
      Top = 1
      Width = 22
      Height = 22
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = 'aShowTurnIn'
      GroupIndex = 0
      ImageIndex = 61
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnMoveClick
    end
  end
  inherited ilTitleBar: TImageList
    Left = 68
    Top = 140
  end
  inherited FormStorage: TssFormStorage
    Left = 12
    Top = 140
  end
  inherited ActionList: TActionList
    Top = 140
    inherited aApply: TAction
      Enabled = False
    end
    object aSelectWH: TAction
      Caption = 'aSelectWH'
      OnExecute = aSelectWHExecute
    end
  end
  object cdsWHouse: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'matid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'kaid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ondate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wh'
        ParamType = ptUnknown
      end>
    ProviderName = 'pWMat_WHouseListNew'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsWHouseBeforeOpen
    OnCalcFields = cdsWHouseCalcFields
    Macros = <>
    Left = 52
    Top = 268
    object cdsWHouseREMAIN: TFloatField
      FieldName = 'REMAIN'
    end
    object cdsWHouseRSV: TFloatField
      FieldName = 'RSV'
    end
    object cdsWHouseWID: TIntegerField
      FieldName = 'WID'
      Required = True
    end
    object cdsWHouseNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 64
    end
    object cdsWHousereserved: TFloatField
      FieldKind = fkCalculated
      FieldName = 'reserved'
      Calculated = True
    end
  end
  object srcWHouse: TDataSource
    DataSet = cdsWHouse
    Left = 84
    Top = 268
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
    Left = 116
    Top = 268
  end
  object pmMain: TTBPopupMenu
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 60
    Top = 204
    object TBItem19: TTBItem
      Action = aSelectWH
    end
  end
end
