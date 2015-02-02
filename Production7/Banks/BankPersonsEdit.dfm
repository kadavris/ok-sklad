inherited frmBankPersonsEdit: TfrmBankPersonsEdit
  Left = 391
  Top = 247
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmBankPersonsEdit'
  ClientHeight = 343
  ClientWidth = 485
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panTitleBar: TssGradientPanel
    Width = 485
    TabOrder = 2
    inherited panTitleButtons: TssPanel
      Left = 426
    end
  end
  inherited panButtons: TPanel
    Top = 313
    Width = 485
    inherited btnOK: TxButton
      Left = 169
    end
    inherited btnCancel: TxButton
      Left = 273
    end
    inherited btnApply: TxButton
      Left = 378
    end
  end
  object panMain: TPanel [2]
    Left = 0
    Top = 21
    Width = 485
    Height = 292
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      485
      292)
    object ssBevel2: TssBevel
      Left = 5
      Top = 10
      Width = 474
      Height = 264
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clGray
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object lName: TLabel
      Left = 132
      Top = 36
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = #1060#1048#1054
    end
    object lJob: TLabel
      Left = 92
      Top = 65
      Width = 66
      Height = 16
      Alignment = taRightJustify
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
    end
    object lPhone: TLabel
      Left = 103
      Top = 119
      Width = 53
      Height = 16
      Alignment = taRightJustify
      Caption = #1058#1077#1083#1077#1092#1086#1085
    end
    object lEMail: TLabel
      Left = 121
      Top = 149
      Width = 35
      Height = 16
      Alignment = taRightJustify
      Caption = 'E-Mail'
    end
    object lNotes: TLabel
      Left = 87
      Top = 198
      Width = 72
      Height = 16
      Alignment = taRightJustify
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object edName: TcxTextEdit
      Left = 167
      Top = 30
      Width = 292
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.MaxLength = 128
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      TabOrder = 0
      ImeName = 'Russian'
    end
    object edJob: TcxTextEdit
      Left = 167
      Top = 59
      Width = 292
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.MaxLength = 128
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      TabOrder = 1
      ImeName = 'Russian'
    end
    object edPhone: TcxTextEdit
      Left = 167
      Top = 113
      Width = 199
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.MaxLength = 64
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      TabOrder = 2
      ImeName = 'Russian'
    end
    object edEMail: TcxTextEdit
      Left = 167
      Top = 143
      Width = 199
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.MaxLength = 64
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      TabOrder = 3
      ImeName = 'Russian'
    end
    object memNotes: TcxMemo
      Left = 167
      Top = 192
      Width = 292
      Height = 65
      Anchors = [akLeft, akTop, akRight, akBottom]
      ImeName = 'Russian'
      ParentFont = False
      Properties.MaxLength = 255
      Style.StyleController = dmData.scMain
      TabOrder = 4
    end
  end
  inherited ilTitleBar: TImageList
    Left = 24
    Top = 52
  end
  inherited ActionList: TActionList
    Left = 52
    Top = 172
  end
  object FormStorage: TssFormStorage
    Active = False
    UseRegistry = True
    StoredValues = <>
    Left = 12
    Top = 196
  end
end
