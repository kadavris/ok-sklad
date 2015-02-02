inherited frmEditEqType: TfrmEditEqType
  Left = 319
  Top = 266
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmEditEqType'
  ClientHeight = 156
  ClientWidth = 448
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 448
    Height = 74
    object lName: TLabel
      Left = 12
      Top = 14
      Width = 56
      Height = 16
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object edName: TcxTextEdit
      Left = 217
      Top = 11
      Width = 213
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.MaxLength = 64
      Style.StyleController = dmData.scMain
      TabOrder = 0
      ImeName = 'Russian'
    end
    object chbDefault: TcxCheckBox
      Left = 212
      Top = 42
      Width = 218
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = DataModified
      TabOrder = 1
      ImeName = 'Russian'
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 448
    TabOrder = 3
    inherited panTitleButtons: TssPanel
      Left = 390
    end
  end
  inherited panButtons: TPanel
    Top = 121
    Width = 448
    inherited btnOK: TxButton
      Left = 134
    end
    inherited btnApply: TxButton
      Left = 341
    end
  end
  inherited panToolBar: TPanel
    Width = 448
    TabOrder = 2
    inherited btnLock: TssSpeedButton
      Left = 387
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 414
    end
    inherited btnHelp: TssSpeedButton
      Left = 360
    end
  end
  inherited FormStorage: TssFormStorage
    Left = 16
    Top = 80
  end
  inherited ActionList: TActionList
    Left = 48
    Top = 80
  end
end
