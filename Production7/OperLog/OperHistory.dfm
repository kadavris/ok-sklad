inherited frmOperHistory: TfrmOperHistory
  Left = 258
  Top = 208
  Width = 763
  Height = 547
  Caption = 'frmOperHistory'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 755
    Height = 435
    object grdMain: TdxDBGrid
      Left = 5
      Top = 1
      Width = 749
      Height = 432
      DrawDragFrame = False
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'OPID'
      SummaryGroups = <>
      SummarySeparator = ', '
      TabOrder = 0
      DataSource = srcMain
      Filter.Criteria = {00000000}
      HideFocusRect = True
      HideSelectionColor = 10724259
      HighlightColor = clNavy
      LookAndFeel = lfUltraFlat
      MaxRowLineCount = 5
      OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
      Anchors = [akLeft, akTop, akRight, akBottom]
      object colID: TdxDBGridColumn
        Visible = False
        Width = 96
        BandIndex = 0
        RowIndex = 0
        FieldName = 'OPID'
      end
      object colDocType: TdxDBGridImageColumn
        Alignment = taLeftJustify
        Caption = '*'
        MinWidth = 16
        Sizing = False
        Width = 25
        BandIndex = 0
        RowIndex = 0
        FieldName = 'OPCODE'
        Images = dmData.Images14x14
        ImageIndexes.Strings = (
          '0'
          '1'
          '2')
        Values.Strings = (
          'U'
          'I'
          'D')
      end
      object colOnDate: TdxDBGridColumn
        Alignment = taCenter
        Caption = #1044#1072#1090#1072' '#1089#1086#1073#1099#1090#1080#1103
        HeaderAlignment = taCenter
        Sizing = False
        Sorted = csUp
        Width = 120
        BandIndex = 0
        RowIndex = 0
        FieldName = 'ondate_'
      end
      object colUser: TdxDBGridColumn
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        HeaderAlignment = taCenter
        Sizing = False
        Width = 100
        BandIndex = 0
        RowIndex = 0
        FieldName = 'USERNAME'
        OnGetText = colUserGetText
      end
      object colBefore: TdxDBGridMemoColumn
        Alignment = taLeftJustify
        Caption = #1044#1072#1085#1085#1099#1077' '#1076#1086' '#1089#1086#1073#1099#1090#1080#1103
        HeaderAlignment = taCenter
        Sizing = False
        Width = 280
        BandIndex = 0
        RowIndex = 0
        HeaderMaxLineCount = 1
        FieldName = 'before'
      end
      object colAfter: TdxDBGridMemoColumn
        Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086#1089#1083#1077' '#1089#1086#1073#1099#1090#1080#1103
        HeaderAlignment = taCenter
        Width = 185
        BandIndex = 0
        RowIndex = 0
        HeaderMaxLineCount = 1
        FieldName = 'after'
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 755
    inherited panTitleButtons: TssPanel
      Left = 697
      inherited btnTBMinimize: TssSpeedButton
        Height = 16
      end
      inherited btnTBMaximize: TssSpeedButton
        Height = 16
      end
      inherited btnTBClose: TssSpeedButton
        Height = 16
      end
    end
  end
  inherited panButtons: TPanel
    Top = 482
    Width = 755
    TabOrder = 3
    inherited btnOK: TxButton
      Left = 546
      Top = 9
    end
    inherited btnCancel: TxButton
      Left = 649
      Top = 9
    end
    inherited btnApply: TxButton
      Left = 305
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 755
    TabOrder = 1
    inherited btnLock: TssSpeedButton
      Left = 705
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 729
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    inherited btnHelp: TssSpeedButton
      Left = 681
      Width = 25
      Height = 25
      LeftMargin = 4
    end
  end
  inherited ilTitleBar: TImageList
    Left = 60
    Top = 220
  end
  inherited FormStorage: TssFormStorage
    Options = []
    Top = 220
  end
  inherited ActionList: TActionList
    Left = 88
    Top = 220
  end
  object cdsMain: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'tabid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    ProviderName = 'pOperLog_History'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsMainBeforeOpen
    AfterOpen = cdsMainAfterOpen
    OnCalcFields = cdsMainCalcFields
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end>
    Left = 248
    Top = 168
    object cdsMainOPID: TIntegerField
      FieldName = 'OPID'
    end
    object cdsMainOPCODE: TStringField
      FieldName = 'OPCODE'
      FixedChar = True
      Size = 1
    end
    object cdsMainUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 48
    end
    object cdsMainONDATE: TDateTimeField
      FieldName = 'ONDATE'
    end
    object cdsMainDATABEFORE: TStringField
      FieldName = 'DATABEFORE'
      Size = 255
    end
    object cdsMainDATAAFTER: TStringField
      FieldName = 'DATAAFTER'
      Size = 255
    end
    object cdsMainafter: TStringField
      FieldKind = fkCalculated
      FieldName = 'after'
      Size = 255
      Calculated = True
    end
    object cdsMainbefore: TStringField
      FieldKind = fkCalculated
      FieldName = 'before'
      Size = 255
      Calculated = True
    end
    object cdsMainondate_: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'ondate_'
    end
  end
  object srcMain: TDataSource
    DataSet = cdsMain
    Left = 220
    Top = 168
  end
  object cdsUsers: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSysUsers_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 280
    Top = 168
  end
end
