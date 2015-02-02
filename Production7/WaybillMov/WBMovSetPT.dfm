inherited frmWBMovSetPT: TfrmWBMovSetPT
  Left = 428
  Top = 216
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmWBMovSetPT'
  ClientHeight = 154
  ClientWidth = 554
  Position = poScreenCenter
  OnKeyPress = GoNext
  PixelsPerInch = 96
  TextHeight = 16
  object panMain: TPanel [0]
    Left = 0
    Top = 21
    Width = 554
    Height = 103
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      554
      103)
    object btnLock: TssSpeedButton
      Left = 464
      Top = 1
      Width = 22
      Height = 22
      Action = aLock
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 90
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnHelp: TssSpeedButton
      Left = 521
      Top = 1
      Width = 22
      Height = 22
      Action = aHelp
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 10
      Images = dmData.Images
      LeftMargin = 3
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnSendErrMessage: TssSpeedButton
      Left = 492
      Top = 1
      Width = 22
      Height = 22
      Action = aSendErrMessage
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 129
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object bvlBox: TssBevel
      Left = 5
      Top = 33
      Width = 543
      Height = 60
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Margins.Left = 0
      Margins.Right = 0
      ParentShowHint = False
      ShowHint = False
      Style = bsSingle
      UseGradient = False
    end
    object lPriceType: TssBevel
      Left = 33
      Top = 49
      Width = 141
      Height = 35
      Caption = #1050#1072' '#1094#1077
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnFace
      ColorOuter = clBtnFace
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdVertical
      HotTrack = False
      ImageIndex = 0
      UseGradient = True
    end
    object btnAddPT: TssSpeedButton
      Left = 495
      Top = 53
      Width = 22
      Height = 22
      Action = aAddPT
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 82
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object lcbPriceTypes: TssDBLookupCombo
      Left = 177
      Top = 54
      Width = 315
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsEditFixedList
      Style.StyleController = dmData.scMain
      TabOrder = 0
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
      EmptyValue = 0
      KeyField = 'ptypeid'
      ListField = 'name'
      ListSource = dsPriceTypes
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 554
    TabOrder = 2
    inherited panTitleButtons: TssPanel
      Left = 495
    end
  end
  inherited panButtons: TPanel
    Top = 124
    Width = 554
    DesignSize = (
      554
      30)
    inherited btnOK: TxButton
      Left = 345
    end
    inherited btnCancel: TxButton
      Left = 449
    end
    inherited btnApply: TxButton
      Left = 1
      Visible = False
    end
  end
  object FormStorage: TssFormStorage [4]
    Active = False
    UseRegistry = True
    StoredValues = <>
    Left = 187
    Top = 15
  end
  inherited ActionList: TActionList
    Images = dmData.Images
    inherited aCancel: TAction
      ShortCut = 27
    end
    object aLock: TAction
      Caption = 'aLock'
      ImageIndex = 90
      OnExecute = aLockExecute
    end
    object aHelp: TAction
      Caption = 'aHelp'
      ImageIndex = 10
      ShortCut = 112
      OnExecute = aHelpExecute
    end
    object aSendErrMessage: TAction
      Caption = 'aSendErrMessage'
      ImageIndex = 129
      OnExecute = aSendErrMessageExecute
    end
    object aAddPT: TAction
      Caption = 'a'
      ImageIndex = 82
      OnExecute = aAddPTExecute
    end
  end
  object cdsPriceTypes: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'matid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pPriceTypes_MatList'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 91
    Top = 24
  end
  object dsPriceTypes: TDataSource
    DataSet = cdsPriceTypes
    Left = 120
    Top = 24
  end
end
