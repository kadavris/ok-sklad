inherited frmSerials: TfrmSerials
  Left = 650
  Top = 283
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmSerials'
  ClientHeight = 484
  ClientWidth = 766
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 766
    Height = 402
    object lblLimit: TLabel
      Left = 6
      Top = 362
      Width = 44
      Height = 16
      Caption = 'lblLimit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgSN: TssDBGrid
      Left = 5
      Top = 2
      Width = 756
      Height = 354
      Hint = 'SN'
      DrawDragFrame = False
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'Num'
      SummaryGroups = <>
      SummarySeparator = ', '
      TabOrder = 0
      OnKeyDown = dbgSNKeyDown
      DataSource = dsSN
      Filter.Criteria = {00000000}
      LookAndFeel = lfUltraFlat
      OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabs, edgoVertThrough]
      OptionsCustomize = []
      OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
      OnEdited = dbgSNEdited
      LangManager = dmData.Lng
      object colNum: TdxDBGridMaskColumn
        Caption = #8470
        DisableDragging = True
        DisableEditor = True
        HeaderAlignment = taCenter
        Sizing = False
        Sorted = csUp
        Width = 40
        BandIndex = 0
        RowIndex = 0
        FieldName = 'Num'
      end
      object colSN: TdxDBGridMaskColumn
        DisableDragging = True
        HeaderAlignment = taCenter
        BandIndex = 0
        RowIndex = 0
        FieldName = 'SN'
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 766
    inherited panTitleButtons: TssPanel
      Left = 708
    end
  end
  inherited panButtons: TPanel
    Top = 449
    Width = 766
    TabOrder = 3
    inherited btnOK: TxButton
      Left = 453
    end
    inherited btnCancel: TxButton
      Left = 558
    end
    inherited btnApply: TxButton
      Left = 662
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 766
    TabOrder = 1
    inherited btnLock: TssSpeedButton
      Left = 676
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 704
    end
    inherited btnHelp: TssSpeedButton
      Left = 732
    end
  end
  inherited ilTitleBar: TImageList
    Left = 68
    Top = 84
  end
  inherited ActionList: TActionList
    Left = 96
    Top = 84
    inherited aApply: TAction
      Enabled = False
    end
  end
  object mdSN: TssMemoryData
    FieldDefs = <>
    Left = 120
    Top = 29
    object mdSNNum: TIntegerField
      FieldName = 'Num'
    end
    object mdSNSN: TStringField
      FieldName = 'SN'
      Size = 64
    end
  end
  object dsSN: TDataSource
    DataSet = mdSN
    Left = 148
    Top = 29
  end
end
