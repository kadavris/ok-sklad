inherited BaseDlg: TBaseDlg
  Left = 614
  Top = 406
  Width = 415
  Height = 220
  Caption = 'BaseDlg'
  PixelsPerInch = 96
  TextHeight = 16
  object panMain: TPanel [0]
    Left = 0
    Top = 47
    Width = 399
    Height = 100
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 0
  end
  inherited panTitleBar: TssGradientPanel
    Width = 399
    Font.Charset = RUSSIAN_CHARSET
    ParentFont = False
    TabOrder = 2
    inherited panTitleButtons: TssPanel
      Left = 341
      Width = 56
      inherited btnTBMinimize: TssSpeedButton
        Left = 2
        Top = 1
      end
      inherited btnTBMaximize: TssSpeedButton
        Top = 1
      end
      inherited btnTBClose: TssSpeedButton
        Top = 1
      end
    end
  end
  inherited panButtons: TPanel
    Top = 147
    Width = 399
    Height = 35
    ParentColor = True
    DesignSize = (
      399
      35)
    inherited btnOK: TxButton
      Left = 95
      Top = 5
    end
    inherited btnCancel: TxButton
      Left = 201
      Top = 5
    end
    inherited btnApply: TxButton
      Left = 304
      Top = 5
      Width = 98
    end
  end
  object panToolBar: TPanel [3]
    Left = 0
    Top = 21
    Width = 399
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 3
    DesignSize = (
      399
      26)
    object btnLock: TssSpeedButton
      Left = 358
      Top = 0
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
    object btnSendErrMessage: TssSpeedButton
      Left = 382
      Top = 0
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
    object btnHelp: TssSpeedButton
      Left = 334
      Top = 0
      Action = aHelp
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 10
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
  end
  object FormStorage: TssFormStorage [5]
    Active = False
    UseRegistry = True
    StoredValues = <>
    Left = 28
    Top = 116
  end
  inherited ActionList: TActionList
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
  end
end
