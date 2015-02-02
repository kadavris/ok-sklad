object frmProps: TfrmProps
  Left = 522
  Top = 284
  BorderStyle = bsDialog
  Caption = ' ssServer Properties'
  ClientHeight = 367
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbDC: TGroupBox
    Left = 0
    Top = 112
    Width = 377
    Height = 117
    Caption = ' Checking for Dead Connections Options '
    TabOrder = 0
    object lMin: TLabel
      Left = 305
      Top = 40
      Width = 36
      Height = 13
      Caption = 'minutes'
    end
    object lTimeout: TLabel
      Left = 28
      Top = 68
      Width = 205
      Height = 41
      AutoSize = False
      Caption = 'Dead Connection Timeout'
      WordWrap = True
    end
    object lMinTimeout: TLabel
      Left = 305
      Top = 72
      Width = 36
      Height = 13
      Caption = 'minutes'
    end
    object rbtNoCheck: TRadioButton
      Left = 12
      Top = 20
      Width = 325
      Height = 17
      Caption = 'Don'#39't Check for Dead Connections'
      TabOrder = 0
      OnClick = rbtNoCheckClick
    end
    object rbtCheck: TRadioButton
      Left = 12
      Top = 40
      Width = 189
      Height = 17
      Caption = 'Check for Dead Connections every'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rbtNoCheckClick
    end
    object edClientsCheckInterval: TEdit
      Left = 244
      Top = 37
      Width = 57
      Height = 21
      TabOrder = 2
      OnKeyPress = edClientsCheckIntervalKeyPress
    end
    object edTimeout: TEdit
      Left = 244
      Top = 68
      Width = 57
      Height = 21
      TabOrder = 3
      OnKeyPress = edClientsCheckIntervalKeyPress
    end
  end
  object gbCommon: TGroupBox
    Left = 0
    Top = 4
    Width = 377
    Height = 109
    Caption = ' '#1054#1073#1097#1080#1077' '
    TabOrder = 1
    object lMaxLogSize: TLabel
      Left = 13
      Top = 24
      Width = 178
      Height = 13
      Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1081' '#1088#1072#1079#1084#1077#1088' '#1083#1086#1075'-'#1092#1072#1081#1083#1072':'
    end
    object lLanguage: TLabel
      Left = 14
      Top = 79
      Width = 50
      Height = 13
      Caption = 'lLanguage'
    end
    object lLogBackupQuantity: TLabel
      Left = 13
      Top = 51
      Width = 194
      Height = 13
      Caption = 'How musch Backup copies of log to sore'
    end
    object chbProvExecLogging: TCheckBox
      Left = 1000
      Top = 28
      Width = 77
      Height = 17
      Caption = 'logging provider execution'
      Enabled = False
      TabOrder = 0
      Visible = False
    end
    object edMaxLogSize: TEdit
      Left = 244
      Top = 20
      Width = 57
      Height = 21
      TabOrder = 1
      OnKeyPress = edClientsCheckIntervalKeyPress
    end
    object cbMaxLogSize: TComboBox
      Left = 306
      Top = 20
      Width = 53
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
    end
    object cbLanguage: TComboBox
      Left = 244
      Top = 76
      Width = 115
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = 'cbLanguage'
      OnChange = cbLanguageChange
    end
    object edLogBackupQuantity: TMaskEdit
      Left = 244
      Top = 48
      Width = 57
      Height = 21
      EditMask = '99;0; '
      MaxLength = 2
      TabOrder = 4
    end
  end
  object gbDebug: TGroupBox
    Left = 0
    Top = 268
    Width = 377
    Height = 57
    Caption = ' Debug '
    TabOrder = 2
    object lDebugLevel: TLabel
      Left = 16
      Top = 24
      Width = 169
      Height = 13
      AutoSize = False
      Caption = 'lDebugLevel'
    end
    object cbDebugLevel: TComboBox
      Left = 184
      Top = 21
      Width = 177
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = '0 - None'
      OnChange = cbDebugLevelChange
      Items.Strings = (
        '0 - None'
        '1'
        '2'
        '3 - the Truth is beyond this point'
        '4'
        '5 - Medium'
        '6'
        '7'
        '8'
        '9'
        '10 - Extreme'
        'Insane')
    end
  end
  object btnRepairSS: TButton
    Left = 8
    Top = 236
    Width = 361
    Height = 25
    Caption = 'Fix Socket Server autorun state'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnRepairSSClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 332
    Width = 378
    Height = 35
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 4
    DesignSize = (
      378
      35)
    object btnOk: TButton
      Left = 148
      Top = 6
      Width = 85
      Height = 25
      Anchors = [akBottom]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
end
