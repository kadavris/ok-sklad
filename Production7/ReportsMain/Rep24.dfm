inherited frmRep24: TfrmRep24
  ActiveControl = cbDocType
  Caption = 'frmRep24'
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    object lType: TLabel [0]
      Left = 20
      Top = 36
      Width = 22
      Height = 16
      Caption = #1058#1080#1087
    end
    object lStatus: TLabel [1]
      Left = 20
      Top = 101
      Width = 39
      Height = 16
      Caption = 'lStatus'
    end
    inherited panNotes: TPanel
      Top = 180
    end
    inherited dbgRef: TdxDBTreeList
      Top = 241
      Height = 99
    end
    object edContr: TokContractSearchEdit
      Left = 20
      Top = 60
      Width = 365
      Height = 31
      ButtonsLeftMargin = 2
      CapRef = 'Contract Register'
      EditorOffset = 95
      DisabledImages = dmData.Images18x18dis
      Images = dmData.Images18x18
      ImageIndexRef = 46
      LangManager = dmData.Lng
      RemoteServer = dmData.SConnection
      ShowLng = False
      ShowButtons = sbtOnlyRef
      SearchNames.Strings = (
        'Contract;num')
      SearchType = stBegin
      Skin = dmData.sknMain
      TabOrder = 2
      ContractType = ctIn
      DesignSize = (
        365
        31)
    end
    object cbDocType: TcxImageComboBox
      Left = 137
      Top = 28
      Width = 219
      Height = 24
      Anchors = [akTop, akRight]
      EditValue = 8
      ImeName = 'Russian'
      ParentFont = False
      Properties.Images = dmData.Images
      Properties.Items = <
        item
          Description = #1082#1091#1087#1083#1080
          ImageIndex = 130
          Value = 8
        end
        item
          Description = #1087#1088#1086#1076#1072#1078#1080
          ImageIndex = 131
          Value = -8
        end>
      Properties.OnChange = cbDocTypePropertiesChange
      Style.StyleController = dmData.scMain
      TabOrder = 4
    end
    object cbChecked: TcxImageComboBox
      Left = 137
      Top = 97
      Width = 219
      Height = 24
      EditValue = 0
      ImeName = 'Russian'
      ParentFont = False
      Properties.DefaultDescription = #1074#1089#1077
      Properties.Images = dmData.Images
      Properties.Items = <
        item
          Description = #1074#1089#1077
          ImageIndex = 42
          Value = 0
        end
        item
          Description = #1087#1088#1086#1074#1077#1076#1105#1085#1085#1099#1077
          ImageIndex = 31
          Value = 1
        end
        item
          Description = #1085#1077#1087#1088#1086#1074#1077#1076#1077#1085#1085#1099#1077
          ImageIndex = 32
          Value = 2
        end>
      Style.StyleController = dmData.scMain
      TabOrder = 3
    end
  end
  inherited ilTitleBar: TImageList
    Top = 33
  end
  inherited ActionList: TActionList
    Top = 33
  end
  inherited frReport1: TfrReport
    Top = 29
    ReportForm = {19000000}
  end
  inherited frCheckBoxObject1: TfrCheckBoxObject
    Top = 29
  end
  inherited frChartObject1: TfrChartObject
    Top = 29
  end
end
